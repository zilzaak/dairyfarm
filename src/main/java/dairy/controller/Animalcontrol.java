package dairy.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import dairy.model.Animal;
import dairy.model.Animalpres;
import dairy.model.Presitem;
import dairy.repo.Animalrepo;



@Controller
@RequestMapping("/animal")

public class Animalcontrol {
@Autowired
Animalrepo anr;
	
	@PostMapping("/add")
public ResponseEntity<List<Animal>> addanimal(@RequestBody List<Animal> animalform) throws ParseException{
	SimpleDateFormat format =new SimpleDateFormat("dd/MM/yyyy HH:mm");
	  Date ck= new Date();
      String s = format.format(ck);
     Date d =format.parse(s);
     
         for(Animal p:animalform) {
     p.setCreatedstring(s);
	p.setCreated(d);
	SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
       Date f2 = f.parse(p.getStringbdate());
       p.setBdate(f2);
	  p = getage(p.getStringbdate(),p);
	     p.setFilename("not");
   anr.save(p);
   
   		      }
     
return new ResponseEntity<List<Animal>>(animalform,HttpStatus.OK);
	
}
	
	

	
	@GetMapping("/photoid/{id}")
public String  photoid(@PathVariable int id ,HttpSession session){
session.setAttribute("id",id);
	
return "upload";
	
}		
		
	
	@RequestMapping("/photoid")
	public String prescr(@RequestParam int anid,HttpSession session){
	session.setAttribute("id",anid);
		
		return "upload";
	            
		          }
	
	
	
	@GetMapping("/unphoto")
public ResponseEntity<List<Animal>> unphoto() throws ParseException{

List<Animal> lst = anr.findAllByOrderByCreatedDesc();
return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
	
}	
	
	

	public Animal getage(String age,Animal a) throws ParseException{
		  
		  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		  Date d = sdf.parse(age);
		  Calendar c = Calendar.getInstance();
		  c.setTime(d);
		  int year = c.get(Calendar.YEAR);
		  int month = c.get(Calendar.MONTH) + 1;
		  int date = c.get(Calendar.DATE);
		  LocalDate l1 = LocalDate.of(year, month, date);
		  LocalDate now1 = LocalDate.now();
		  Period diff1 = Period.between(l1, now1);
	      a.setAgey(diff1.getYears());a.setAgem(diff1.getMonths());
          return a;
	                   	}
	
	
}
