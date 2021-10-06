package dairy.service;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dairy.model.Animal;
import dairy.repo.Animalrepo;

@Service
public class Updateage {

@Autowired
private Animalrepo anr;
	

public void ageupdater(Date d) throws ParseException {
	List<Animal> lst=anr.findAll();
	
for(Animal a : lst) {
a=getage(a.getBdate(),a);
anr.save(a);

}
	
}


public Animal getage(Date birthdate,Animal a) throws ParseException{
	  Calendar c = Calendar.getInstance();
	  c.setTime(birthdate);
	  System.out.println("previous age was year="+a.getAgey()+" month="+a.getAgem());
	  int year = c.get(Calendar.YEAR);
	  int month = c.get(Calendar.MONTH)+1;
	  int date = c.get(Calendar.DATE);
	  LocalDate l1 = LocalDate.of(year, month, date);
	  LocalDate now1 = LocalDate.now();
	  Period diff1 = Period.between(l1, now1);

	  a.setAgey(diff1.getYears());a.setAgem(diff1.getMonths());
	  System.out.println("after updating age is year="+a.getAgey()+" month="+a.getAgem());
      return a;
    
                             }




	
}
