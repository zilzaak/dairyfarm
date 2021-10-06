package dairy.controller;
import dairy.model.Agecal;
import dairy.model.Presitem;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.SchedulingException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import dairy.repo.Adminrepo;
import dairy.repo.Agecalrepo;
import dairy.repo.Animalrepo;
import dairy.repo.Presitemrepo;
import dairy.service.Updateage;

@Component
public class PrescriptionScheduler {
@Autowired
private Presitemrepo pir;
@Autowired
private Adminrepo arr;
@Autowired
private Agecalrepo agr;
@Autowired
private Updateage uag;
//@Scheduled(cron = "0 0/2 * * * *") //every 2 minite later
//@Scheduled(cron="0 0 1 * * *") // every day at 1 pm
@Scheduled(cron="0 0 10 * * *") //every day at 10 am
     public void dailttask() throws ParseException {
		try {
			Date d1= simpletypedate(new Date());				
			List<Presitem> pi = pir.findByPrestypenumberGreaterThan(1);		

for(Presitem p : pi) {
	
if(p.getLastdate().after(d1)  &&  p.getStartingdate().before(p.getLastdate())){
	
	if(msgbeforetwodateornot(p,d1)){
		System.out.println("the date is two date before of prescription last date  "+d1);
		System.out.println("the date is two date before of prescription last date  "+d1);
		Calendar cal = Calendar.getInstance();
		cal.setTime(d1);
		cal.add(Calendar.DATE, 2);
		Date dm = cal.getTime();
	String code="animal id: "+p.getAp().getAnid()+", type: "+p.getAp().getType()+", Color : "+p.getAp().getColor()+", age: "+p.getAp().getAge()+"\n"
		                               +" Drug time and rules : "+"\n"+
		            ", drug name : "+p.getDrugname()+", Type: "+p.getDrugtype()+", rules : "+p.getRules()+", advice : "+p.getConsult()+"\n"+
		                  "date to take drug : "+dm;	
				        String to = arr.findAll().get(0).getEmail();
	    //new Sendotp().sendotp(code, to,"drug reminder for animal id"+p.getAp().getAnid()+" and prescription id "+p.getAp().getPresid());	
                    
		
	}
 }
			                 	
} 
	
	agecalculate(d1);	
		
		}
		catch(SchedulingException e) {
			
		System.out.println(e);	
		}
	
		
	}
	
	
	public void agecalculate(Date d) throws ParseException {
		System.out.println("present date is "+d);
			if(!agr.findAll().isEmpty()){
			Agecal ak=agr.findAll().get(0);
			   long difference = d.getTime() - ak.getAgedate().getTime();
			    int day = (int) (difference / (1000*60*60*24));	
			if(day>30) {
			
				  ak.setAgedate(d);
				  agr.save(ak);
				uag.ageupdater(d);	
			               }
			       	     	}
		
		else {
			Agecal ak= new Agecal(d);
			agr.save(ak);
			
		}
		
		
	} 
	

public boolean msgbeforetwodateornot(Presitem p,Date d1) throws ParseException {
	boolean x = false;
	Date dplustwo=add2(d1,2);
	System.out.println("aftwer adding two days the day is now"+dplustwo);
	int del=datediffrent(p.getStartingdate(),dplustwo);
	int divisor=p.getPrestypenumber()+1;
				int rem=del%divisor;	
		System.out.println("the rem value after moduler division is "+divisor+"  is"+rem);		
	
				if(rem==0) {
					System.out.println("the modluer division result by "+divisor+" is"+rem);	
					x= true;
					}
				  return x;
                         }


int datediffrent(Date d1 , Date d2) throws ParseException {
Date presdate = simpletypedate(d1);
	   long difference = d2.getTime() - presdate.getTime();
    int day = (int) (difference / (1000*60*60*24));	
    System.out.println("present date plus two is"+d2+"  pres date is "+presdate);
    System.out.println("day diffrence between present date plus two and presdate is"+day);
	   return day;
          }  

public Date add2(Date f,int din) {
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(f);
	cal.add(Calendar.DATE, din);
	Date dm = cal.getTime();
	return dm;
              }


            public Date simpletypedate(Date d) throws ParseException {
	              SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	                        Date sd = sdf.parse(sdf.format(d));	
	                                 return sd;
                            }

	
}
