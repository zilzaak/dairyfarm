package dairy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dairy.model.Collectmilk;
import dairy.model.Sellmilk;
import dairy.repo.Animalrepo;
import dairy.repo.Collectmilkrepo;
import dairy.repo.Sellmilkrepo;

@Controller
@RequestMapping("/milk")
public class Milkcontrol {
@Autowired
private Collectmilkrepo crr;
@Autowired
private Sellmilkrepo srr;
@Autowired
private Animalrepo arr;	
	
@PostMapping("/collectbydate")
public ResponseEntity<List<Collectmilk>>  collectbydate(@RequestBody String cdate) throws ParseException{
	   SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
          Date d=sdf.parse(cdate);
         List<Collectmilk> lst = crr.findByCollectdate(d); 
         System.out.println("the date is as"+cdate);
         System.out.println("the date is as"+cdate);
         System.out.println("the date is as"+cdate);
         System.out.println("list size is as"+lst.size());
         return new ResponseEntity<List<Collectmilk>>(lst,HttpStatus.OK);   
	   }

@RequestMapping(value="/updatecollect" , method=RequestMethod.PUT)
public ResponseEntity<Collectmilk>  collectbydate(@RequestBody  Collectmilk cm){
float totalprice=cm.getAmount()*cm.getRate();
cm.setTotalprice(totalprice);
    	crr.save(cm);
     	return new ResponseEntity<Collectmilk>(cm,HttpStatus.OK);   
	   }


@PostMapping("/addmilk")
public ResponseEntity<List<Collectmilk>> addmilk(@RequestBody List<Collectmilk> milklist){
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	 String err=""; String exist="";
	 String wrongdate="";
	 
    for(Collectmilk cm : milklist){ 
	   if(!arr.existsByAnidAndType(cm.getAnid(), cm.getAnimaltype())) {
		   err=err+" id::"+cm.getAnid() +", type::"+cm.getAnimaltype()+"not found"+", ";
		   
	   }
	   
	   
	    if(crr.existsByAnidAndStringcollectdate(cm.getAnid(), cm.getStringcollectdate())) {
		   exist=exist+","+" id::"+cm.getAnid() +", type::"+cm.getAnimaltype()+"  amount::"+cm.getAmount()+
				   " added in::"+cm.getStringcollectdate()+"already added"+", ";
	            }
	    
	   if(err.contentEquals("") && exist.contentEquals("")){
		 try {
			cm.setCollectdate(sdf.parse(cm.getStringcollectdate()));
		} catch (ParseException e) {
			wrongdate="null date,select again";
			e.printStackTrace();
		                         }
	       
                                    }
                                 }
  
    
     if(err.contentEquals("") && wrongdate.contentEquals("") && exist.contentEquals("")) {
          for(Collectmilk cm : milklist){ 
    	    	crr.save(cm);
    	                            }
    	    milklist.get(0).setStringcollectdate("successfully added record");
            return new ResponseEntity<List<Collectmilk>>(milklist,HttpStatus.OK);
 
                 }
    else {
    	
    	    err=err+exist+wrongdate;
    		System.out.println("there exist invalid record which is not present to animal table");
    		milklist.get(0).setStringcollectdate(err);
            return new ResponseEntity<List<Collectmilk>>(milklist,HttpStatus.OK);
                           
        }
	
	
}

	


@PostMapping("/sellmilk")
public ResponseEntity<List<Sellmilk>> sellmilk(@RequestBody List<Sellmilk> milks) throws ParseException{
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
 for(Sellmilk sm : milks) {
	 sm.setSelldate(sdf.parse(sm.getStringselldate()));
	 srr.save(sm);
 }
 
 System.out.println("okkkkkkkkkkkkkkkkkkkkk");
 System.out.println("okkkkkkkkkkkkkkkkkkkkk");
 System.out.println("okkkkkkkkkkkkkkkkkkkkk");
 System.out.println("okkkkkkkkkkkkkkkkkkkkk");
	return new ResponseEntity<List<Sellmilk>>(milks,HttpStatus.OK) ;
}

@PostMapping("/inadate")
public ResponseEntity<List<Sellmilk>> inadate(@RequestBody String  ad) throws ParseException{
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
  Date d = sdf.parse(ad); 
  List<Sellmilk> lst = srr.findBySelldate(d);
	return new ResponseEntity<List<Sellmilk>>(lst,HttpStatus.OK) ;
}

@PostMapping("/inamonth")
public ResponseEntity<List<Sellmilk>> inamonth(@RequestBody String[]  ad) throws ParseException{
	String dt="1/"+ad[0]+"/"+ad[1];
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
  Date d1 = sdf.parse(dt); 
  Calendar cal = Calendar.getInstance();
  cal.setTime(d1);
  int maxdate=cal.getActualMaximum(Calendar.DATE);
  String dt2= Integer.toString(maxdate)+"/"+ad[0]+"/"+ad[1];
  Date d2 = sdf.parse(dt2);
  List<Sellmilk> lst = srr.findBySelldateBetween(d1,d2);
  
  System.out.println("the two date are ass"+dt+"    "+dt2);
  
 return new ResponseEntity<List<Sellmilk>>(lst,HttpStatus.OK) ;
}

@PostMapping("/buyername")
public ResponseEntity<List<Sellmilk>> buyername(@RequestBody String  ad) throws ParseException{

  List<Sellmilk> lst = srr.findByBuyernameContainingIgnoreCase(ad);
	return new ResponseEntity<List<Sellmilk>>(lst,HttpStatus.OK) ;
}



@GetMapping("/tmsell")
public ResponseEntity<List<Sellmilk>> tmsell(){
 List<Sellmilk> lst = srr.findAll();
 System.out.println("the size of list is as"+lst.size());
 System.out.println("the size of list is as"+lst.size());
 System.out.println("the size of list is as"+lst.size());
 System.out.println("the size of list is as"+lst.size());
 return new ResponseEntity<List<Sellmilk>> (lst,HttpStatus.OK) ;
 
}

	
}
