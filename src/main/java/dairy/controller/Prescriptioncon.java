package dairy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import dairy.model.Animal;
import dairy.model.Animalpres;
import dairy.model.Presitem;
import dairy.repo.Animalpresrepo;
import dairy.repo.Animalrepo;
import dairy.repo.Presitemrepo;

@Controller
@RequestMapping("/prescribe")
public class Prescriptioncon {
@Autowired
private Animalrepo anr;
@Autowired
private Presitemrepo pir;	
@Autowired
private Animalpresrepo apr;

@RequestMapping("/pres")
public String prescribe(@RequestParam int anid,HttpSession session) throws ParseException {
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
      Date s = sdf.parse(sdf.format(new Date()));
	Animal anm = anr.findById(anid).get();
	Animalpres ap = new Animalpres();
	ap.setColor(anm.getColor());ap.setPresdate(s);ap.setType(anm.getType());
	ap.setAnid(anid);ap.setStringpresdate(sdf.format(new Date()));
	ap.setAge(anm.getAgey());ap.setHeight(anm.getHeight());ap.setWeight(anm.getWeight());
	ap.setChest(anm.getChest());
	ap.setFilename(anm.getFilename());ap.setGender(anm.getGender());
	session.setAttribute("animalpres",ap);
	session.setAttribute("animal",anm);
	Presitem pi = new Presitem();
	Presitem pi2 = new Presitem();
	List<Presitem> lst = new ArrayList<Presitem>();
	lst.add(pi);lst.add(pi2);
	String p = new Gson().toJson(lst);
	session.setAttribute("presitems",p);
	return "prescribe";
            
	          }


@RequestMapping(value="/updateanimal",method=RequestMethod.PUT)
public ResponseEntity<Animalpres> finalpres(@RequestBody Animalpres j) throws ParseException {
apr.save(j);
 return new ResponseEntity<Animalpres>(j,HttpStatus.OK) ;
	          }


	
	
	@PostMapping("/presfinal")
public ResponseEntity<List<Presitem>> finalpres(@RequestBody List<Presitem> pi,HttpSession session) throws ParseException {
		String err="no";
		String errmsg1=""; String errmsg2=""; 
		Animalpres ap = (Animalpres) session.getAttribute("animalpres");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date dnow = sdf.parse(sdf.format(new Date()));


for(Presitem p : pi) {
	if(p.getStringstartingdate()==null ||  p.getStringlastdate()==null) {
		errmsg1="null form of date ";
		err="ys";
	}
	
	else if(!dateparsecheck(p.getStringstartingdate()) ) {
		errmsg1="wrong of starting date ";
		err="ys";
	}
	else if(!dateparsecheck(p.getStringlastdate()) ) {
		errmsg1="wrong last date input";
		err="ys";
	}
	
else if(dnow.after(sdf.parse(p.getStringlastdate()))) {
		
		errmsg1="last date must be greater than present date,";
		err="ys";
	}
	

else if(sdf.parse(p.getStringlastdate()).before(sdf.parse(p.getStringstartingdate()))) {
		
		errmsg1="starting must be less or equal to last date,";
		err="ys";
	}
	
else if(p.getStringstartingdate().length()!=10 || p.getStringlastdate().length()!=10) {
	errmsg1="wrong date formation,";
	err="ys";
}
	

	
else if( p.getPrestype()==null || p.getDrugname()==null) {
	err="ys";
errmsg2="drugname or drugtype or date must not null";
}
else {
	Date d = sdf.parse(p.getStringlastdate());	
	Date d2=sdf.parse(p.getStringstartingdate());
	p.setStartingdate(d2);
	p.setLastdate(d);	
	if(p.getPrestype().contentEquals("daily")) {

	}
	else {
		p.setPrestypenumber(Integer.parseInt(p.getPrestype()));
		p.setDoctor(pi.get(0).getDoctor());
		
	}

	p.setAp(ap);
	
}

}


if(err.equals("ys")) {
String df=errmsg1+errmsg2;
	pi.get(0).setRules(df);	
}
if(err.equals("no")) {
	for(Presitem p : pi) {
		
pir.saveAndFlush(p);

		}	
pi.get(0).setRules("successfull");	
}


return new ResponseEntity<List<Presitem>>(pi,HttpStatus.OK);
            
	          }	
	
	
	@PostMapping("/presrecord")
	public ResponseEntity<List<Presitem>> presrecord(@RequestBody long anid,HttpSession session){
		Animalpres ap = new Animalpres();
		List<Presitem> lst = pir.findAll();
		List<Presitem> items = new ArrayList<Presitem>();
		for(Presitem pi : lst) {
		
			if(pi.getAp().getAnid()==anid) {
				items.add(pi);
				ap=pi.getAp();
			}
			
			
		}
		
		
		
		if(!items.isEmpty()) {
			
		session.setAttribute("animalpresrecord",ap);
		
				return new ResponseEntity<List<Presitem>>(items,HttpStatus.OK);
		                      }
				
            	else {
			 List<Presitem> pi=new ArrayList<Presitem>();
			 pi.add(new Presitem());pi.add(new Presitem());
			return new ResponseEntity<List<Presitem>>(pi,HttpStatus.OK);
	              	}
	   
	
	}
	
	
	@PostMapping("/updatepres")
	public ResponseEntity<Presitem> updatepres(@RequestBody Presitem pr){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
String msg="";
String err="no";
if(pr.getStringlastdate()==null || pr.getStringlastdate().length()!=10) {
	err="yes";msg="wrong last date,corrct it , ";
	pr.setConsult(msg);
    return new ResponseEntity<Presitem>(pr,HttpStatus.OK);
 }

if(pr.getStringstartingdate()==null || pr.getStringstartingdate().length()!=10) {
	err="yes";
	msg=msg+" wrong starting date,corrct it , ";
	pr.setConsult(msg);
    return new ResponseEntity<Presitem>(pr,HttpStatus.OK);
}



	      try {
			Date startdate = sdf.parse(pr.getStringstartingdate());
			pr.setStartingdate(startdate);
		} 
	      catch (ParseException e) {
	msg=msg+"wrong starting date input,";
	err="yes";
	 pr.setConsult(msg);
			e.printStackTrace();
		}
	      try {
			Date lastdate = sdf.parse(pr.getStringlastdate());
			pr.setLastdate(lastdate);
			
		} catch (ParseException e) {
		msg=msg+" wrongly formed lastdate,";
		err="yes";
		 pr.setConsult(msg);
			e.printStackTrace();
		}
	    
	      if(err.contentEquals("no")) {
pir.save(pr);
pr.setConsult("successfull");
	      }
	      else {
	    	 
		      System.out.println("ohhhhhhhhhhhhhhhhhhhhhhhhhhh soryyyyyyyyyyyyyyyyy");
	    	  
	      }

	      return new ResponseEntity<Presitem>(pr,HttpStatus.OK);
	            
		          }
	
	@PostMapping("/updateanimalpres")
	public ResponseEntity<Animalpres> updateanimalpres(@RequestBody Animalpres j){
apr.save(j);
	return new ResponseEntity<Animalpres>(j,HttpStatus.OK);
                      }


	public boolean dateparsecheck(String s) {
		boolean x=true;
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try {
			
			Date dp=sdf.parse(s);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			x=false;
			e.printStackTrace();
		}
		
		return x;
	}
	
	
}
