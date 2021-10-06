package dairy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dairy.model.Animal;
import dairy.model.Costprofithelper;
import dairy.model.Cprofit;
import dairy.model.Dailycost;
import dairy.model.Sellcow;
import dairy.model.Sellmilk;
import dairy.repo.Animalrepo;
import dairy.repo.Cowsellrepo;
import dairy.repo.Dailycostrepo;
import dairy.repo.Sellmilkrepo;

@Controller
@RequestMapping("/costprofit")
public class Costbenifit {
@Autowired
private Animalrepo arr;
@Autowired
private Cowsellrepo crr;
@Autowired
private Sellmilkrepo srr;
@Autowired
private Dailycostrepo drr;


@PostMapping("/thisab")
public ResponseEntity<Cprofit> thisab(@RequestBody Cprofit cps){
	System.out.println(cps.getTcost()+"okkkkkkkkkkkk");
	System.out.println(cps.getTcost()+"okkkkkkkkkkkk");
	System.out.println(cps.getTcost()+"okkkkkkkkkkkk");
	
List<Animal> lst = arr.findBySource("from market"); 
List<Dailycost> lst2 = drr.findAll();     
List<Sellmilk> lst3 = srr.findAll();  
List<Sellcow> lst4 = crr.findAll(); 

float soldmilk=0 , soldcow=0 , dailycost=0 , animalcost=0;
for(Animal a : lst) {
	animalcost=animalcost+a.getChest();
}
for(Dailycost dc : lst2) {
	dailycost=dailycost+dc.getCost();
}
for(Sellmilk sm : lst3) {
	soldmilk=soldmilk+sm.getTotalprice()-sm.getDue();
}

for(Sellcow dc : lst4) {
	soldcow=soldcow+dc.getSellprice()-dc.getDue();
}

float totalcost=animalcost+dailycost;
float totalsell=soldcow+soldmilk;
float totalprofit=totalsell-totalcost;

cps.setTcost(totalcost);
cps.setTcostanimal(animalcost);
cps.setTcostdaily(dailycost);
cps.setTsellcow(soldcow);
cps.setTsellmilk(soldmilk);
cps.setTsold(totalsell);
cps.setTprofit(totalprofit);

System.out.println("total cost  "+cps.getTcost()+"   cost animal  "+cps.getTcostanimal()+"   daily cost  "+cps.getTcostdaily());
System.out.println("total cost  "+cps.getTcost()+"   cost animal  "+cps.getTcostanimal()+"   daily cost  "+cps.getTcostdaily());
System.out.println("total cost  "+cps.getTcost()+"   cost animal  "+cps.getTcostanimal()+"   daily cost  "+cps.getTcostdaily());
System.out.println("total cost  "+cps.getTcost()+"   cost animal  "+cps.getTcostanimal()+"   daily cost  "+cps.getTcostdaily());
System.out.println("total cost  "+cps.getTcost()+"   cost animal  "+cps.getTcostanimal()+"   daily cost  "+cps.getTcostdaily());

return new ResponseEntity<Cprofit>(cps,HttpStatus.OK);

}	



	
	@PostMapping("/dailycost")
public String  photoid(@RequestBody Dailycost dc ){

		
		
return "upload";
	
}	
	
	
	
	@PostMapping("/inamonth")
	public ResponseEntity<Costprofithelper> inamonth(@RequestBody String[] ad) throws ParseException{
		String dt="1/"+ad[0]+"/"+ad[1];
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		  Date d1 = sdf.parse(dt); 
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(d1);
		  int maxdate=cal.getActualMaximum(Calendar.DATE);
		  String dt2= Integer.toString(maxdate)+"/"+ad[0]+"/"+ad[1];
		  Date d2 = sdf.parse(dt2);
		  
		  List<Dailycost> dc = drr.findByCostdateBetween(d1,d2);
		  List<Sellcow> sc=crr.findBySelldateBetween(d1,d2);
		  List<Sellmilk> sm=srr.findBySelldateBetween(d1,d2);
		  Costprofithelper cph = new Costprofithelper();
		  cph.setDc(dc);cph.setSc(sc);cph.setSm(sm);
		return new ResponseEntity<Costprofithelper>(cph,HttpStatus.OK);
		
	}
	
	
	
	@PostMapping("/inadate")
	public ResponseEntity<Costprofithelper> indate(@RequestBody String ad) throws ParseException{
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date d1 = sdf.parse(ad); 
    List<Dailycost> dc = drr.findByCostdate(d1);
    List<Sellcow> sc=crr.findBySelldate(d1);
    List<Sellmilk> sm=srr.findBySelldate(d1);
    Costprofithelper cph = new Costprofithelper();
	  cph.setDc(dc);cph.setSc(sc);cph.setSm(sm);
    return new ResponseEntity<Costprofithelper>(cph,HttpStatus.OK);
	
	
	}
	
	
	@PostMapping("/inbetween")
	public ResponseEntity<Costprofithelper> inbetween(@RequestBody String[] ad) throws ParseException{
	
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		  Date d1 = sdf.parse(ad[0]); 
		  Date d2 = sdf.parse(ad[1]);
		  
		  List<Dailycost> dc = drr.findByCostdateBetween(d1,d2);
		  List<Sellcow> sc=crr.findBySelldateBetween(d1,d2);
		  List<Sellmilk> sm=srr.findBySelldateBetween(d1,d2);
		  Costprofithelper cph = new Costprofithelper();
		  cph.setDc(dc);cph.setSc(sc);cph.setSm(sm);
	return new ResponseEntity<Costprofithelper>(cph,HttpStatus.OK);
	
	
	}	
		
	
	
}
