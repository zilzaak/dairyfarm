package dairy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import dairy.model.Animal;

import dairy.model.Firmadmin;

import dairy.repo.Adminrepo;
import dairy.repo.Animalpresrepo;
import dairy.repo.Presitemrepo;

@Controller
public class Homecontroller {
@Autowired
private Adminrepo arr;
@Autowired
private Presitemrepo pir;

@Autowired
private Animalpresrepo apr;
	@RequestMapping("/")
	public String admin() {
		
	return "register";
	
	}
	
	@PostMapping("/register")
	public ResponseEntity<Firmadmin> admnlogin(@RequestBody Firmadmin ad,HttpSession session){
		
if(arr.count()==0) {
	
	String codertu = getrandom();
	if(new Sendotp().sendotp(codertu, ad.getEmail(),"email verification code")) {
		session.setAttribute("codertu",codertu);
		ad.setCode("ok");
	}
	else {
		ad.setCode("invalid email address,add correct one");	
		
	}
		
	
}
else {
	
	ad.setCode("sorry, one admin already exist");
}

return new ResponseEntity<Firmadmin>(ad,HttpStatus.OK);
	
	}
	
	@PostMapping("/regfinal")
	public ResponseEntity<Firmadmin> finalreg(@RequestBody Firmadmin ad,HttpSession session){
		
String rancode = (String) session.getAttribute("codertu");
if(ad.getCode().contentEquals(rancode)) {
	arr.save(ad);
ad.setCode("ok");
}
else {
	ad.setCode("no");	
}
return new ResponseEntity<Firmadmin>(ad,HttpStatus.OK);
	
	}	
	
	


	
	@PostMapping("/adminlogin")
	public ModelAndView login(@RequestParam String email, @RequestParam String password ,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Firmadmin af = arr.findAll().get(0);
		System.out.println("comming from post method  email is "+email+"  password is  "+password);
		System.out.println("comming from post method  email is "+email+"  password is  "+password);
		System.out.println("the data form jpa are as follwo"+af.getEmail()+"     "+af.getPassword());
		System.out.println("the data from jpa are as follwo"+af.getEmail()+"     "+af.getPassword());
		
		if(email.contentEquals(af.getEmail()) && password.contentEquals(af.getPassword())) {
			mv.setViewName("index");
			List<Animal> alist=new ArrayList<Animal>();
			alist.add(new Animal());
			alist.add(new Animal());
			String p = new Gson().toJson(alist);
			session.setAttribute("listanimal", p);
		session.setAttribute("adminuser",af.getEmail());
		session.setAttribute("adminpass",af.getPassword());
		
		}
		else {
			mv.addObject("sms","email or password error");
			mv.setViewName("register");
		}
	
		
		return mv;
	}
	
	
	@PostMapping("/recover")
	public ResponseEntity<Firmadmin> recover(@RequestBody Firmadmin forgot,HttpSession session){
		
	Firmadmin fm = arr.findAll().get(0);	
	if(forgot.getEmail().contentEquals(fm.getEmail())) {
				String st = getrandom();
		session.setAttribute("rechujuw",st);
			if(new Sendotp().sendotp(st, forgot.getEmail(),"email verification code")) {
				forgot.setCode("ok");
			           }
			                   else {
				    forgot.setCode("sorry ,wrong email address");
			                         }
	
		
	}
	else {
		
		forgot.setCode("this is not admins email");
	}
		
	return new ResponseEntity<Firmadmin>(forgot,HttpStatus.OK);
	
	}	
	
	@PostMapping("/finalrec")
	public ResponseEntity<Firmadmin> finalrec(@RequestBody Firmadmin forgot,HttpSession session){
String rec = (String) session.getAttribute("rechujuw");
if(rec.contentEquals(forgot.getCode())) {
	Firmadmin fa = arr.findAll().get(0);
	fa.setPassword(forgot.getPassword());
	arr.save(fa);	
	forgot.setCode("successfull, login now");
}
else {
	forgot.setCode("sorry!!!, code not match,try again");
	
}

return new ResponseEntity<Firmadmin>(forgot,HttpStatus.OK);
	
	}		
	
	
	
	public  String getrandom() {
		String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijk"
          +"lmnopqrstuvwxyz@#$%&";
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(6);
		for (int i = 0; i < 6; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		return sb.toString();
	}
	

	
	@PostMapping("/logout")
	public String logoutadmin(HttpSession session) {
		
		session.removeAttribute("adminuser");
		session.removeAttribute("adminpass");
		session.invalidate();
		
		return "register";
		
	}
	
	
	@GetMapping("/addpres")
	public String logoutadn()  {
float x =  53.36f;
float y=  25.58f;
double g= x*y;

System.out.println("the multiple between x and y is"+g);
System.out.println("the multiple between x and y is"+g);
System.out.println("the multiple between x and y is"+g);
System.out.println("the multiple between x and y is"+g);

return "newtab";
		
	}	
	
	@RequestMapping("/costprofit")
	public String costprofit(){

		return "costprofit";
		
	}
	@RequestMapping("/sellcow")
	public String sellcow(){

		return "sellcow";
		
	}		
	@RequestMapping("/newborn")
	public String newborn(){

		return "newborn";
		
	}	
	
	@RequestMapping("/trydate")
	public String trydate(){
String today="12/07/2021";
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
try {
	Date d = sdf.parse(today);
Calendar cal = Calendar.getInstance();
cal.setTime(d);
int maxdate=cal.getActualMaximum(Calendar.DATE);

} catch (ParseException e) {
	

}

	
		return "register";
	}		
	
	
	
	
}
