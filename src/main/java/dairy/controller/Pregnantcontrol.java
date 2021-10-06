package dairy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import dairy.model.Animal;
import dairy.model.Pregnantreport;
import dairy.repo.Animalrepo;
import dairy.repo.Pregnantreportrepo;

@Controller
@RequestMapping("/pregnant")
public class Pregnantcontrol {
	@Autowired
	private Pregnantreportrepo prr;
		public final int din=280;
	@Autowired
	private Animalrepo arr;
		@PostMapping("/pregdate")
public ResponseEntity<Pregnantreport> getpossibledate(@RequestBody Pregnantreport pregnant) throws ParseException{
List<Pregnantreport> lst = prr.findByAnid(pregnant.getAnid());
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Date choosedcondate=sdf.parse(pregnant.getStringconcivedate());
Date lastconcived=null;

if(!lst.isEmpty()){
 lastconcived=lst.get(0).getConcivedate();	
   for(Pregnantreport pn : lst) {
	 if(pn.getConcivedate().after(lastconcived)) {
	lastconcived=pn.getConcivedate();
	                                 
	           }
	          }
   int del=datediffrent(lastconcived,choosedcondate);
   if(del>325){
	   int serialno=lst.size()+1;
	   pregnant.setConcivedate(choosedcondate);
	   pregnant=getupdated(pregnant);
	   pregnant.setPregnantno(serialno);
	   pregnant.setDateerr(""); 
         } 
   else{	
	   int delta=325-del;
        	Calendar ca = Calendar.getInstance();
			ca.setTime(choosedcondate);
			ca.add(Calendar.DATE, delta);
			Date dk = ca.getTime();
		  pregnant.setDateerr("error date,choose::"+sdf.format(dk));  
	   
       }
   
}

else {
	   pregnant.setConcivedate(choosedcondate);
	   pregnant=getupdated(pregnant);
	   pregnant.setPregnantno(1);
	   pregnant.setDateerr(""); 
	   
}

  return new ResponseEntity<Pregnantreport>(pregnant,HttpStatus.OK);
	
}
	

private int datediffrent(Date lastconcived , Date choosedcondate){
int day=0;
	 if(choosedcondate.before(lastconcived)) {
    	System.out.println("choosed date is before last concived date"+lastconcived);
    	System.out.println("choosed date is before last concived date"+lastconcived);
    }
    
    else {
    	System.out.println("choosed date is after last concived date"+lastconcived);
    	System.out.println("choosed date is after last concived date"+lastconcived);
    	long difference = choosedcondate.getTime()-lastconcived.getTime();
         day = (int) (difference / (1000*60*60*24));	
         day=day+45;
      

     	}
	 System.out.println("the del date is"+day);
	 System.out.println("the del date is"+day);
	 System.out.println("the del date is"+day);
	 System.out.println("the del date is"+day);
	return day; 
	
}
	 
	public Pregnantreport getupdated(Pregnantreport pregnant) {
			SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
			Date f=null;
			try {
				f = sdf.parse(pregnant.getStringconcivedate());
			} catch (ParseException e) {
			
				e.printStackTrace();
			}
			
				Calendar cal = Calendar.getInstance();
				cal.setTime(f);
				cal.add(Calendar.DATE, din);
				Date dm = cal.getTime();
				cal.add(Calendar.DATE, 45);
				Date d2=cal.getTime();
			
			pregnant.setNextconcive(d2);
			pregnant.setStringnextconcive(sdf.format(d2));
			pregnant.setPossibledate(dm);
			pregnant.setStringpossibledate(sdf.format(dm));   
			return pregnant;
		}
		
		
		
@PostMapping("/postpreg")
public ResponseEntity<List<Pregnantreport>> postpreg(@RequestBody List<Pregnantreport> pregnant){
          boolean x=true;	
	for(Pregnantreport pr : pregnant) {
		if(prr.existsByAnidAndStringconcivedate(pr.getAnid(), pr.getStringconcivedate())){
			x=false;
			pr.setDateerr("this record already exist in database");
		}		
		}
	if(x) {
		for(Pregnantreport pr : pregnant) {
	prr.save(pr);
			}
	}
	else {
		pregnant.get(0).setSms("ohh");
	}
	
	return new ResponseEntity<List<Pregnantreport>>(pregnant,HttpStatus.OK);
	
}		

@PostMapping("/preganimalid")
public ResponseEntity<Pregnantreport> CHECKPREGANIMALID(@RequestBody Pregnantreport pregnant){
	if(pregnant.getType().contentEquals("")) {
		
		if(arr.existsByAnid(pregnant.getAnid())) {
			pregnant.setSms("");
		}
		else {
			pregnant.setSms("id:-"+pregnant.getAnid()+" not exist in database");
		}	
	}
	
	else {
		if(arr.existsByAnidAndType(pregnant.getAnid(),pregnant.getType())) {
			pregnant.setSms("");
		}
		else {
			pregnant.setSms("id:-"+pregnant.getAnid()+" not a"+pregnant.getType());
		}
		
	}

	return new ResponseEntity<Pregnantreport>(pregnant,HttpStatus.OK);
	
}		
		

}
