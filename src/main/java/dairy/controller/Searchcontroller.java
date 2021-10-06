package dairy.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import dairy.model.Animal;
import dairy.repo.Animalrepo;

@Controller
@RequestMapping("/search")

public class Searchcontroller {
@Autowired
private Animalrepo anr;
	@PostMapping("/bytypeageupper")
public ResponseEntity<List<Animal>> bytypeageupper(@RequestBody Animal s){
		int ag = s.getAgey();
		if(s.getColor().contentEquals("")) {
			 if(s.getWu().contentEquals("year")) {
					List<Animal> lst =anr.findByTypeAndAgeyGreaterThan(s.getType(), ag);
				       return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);	 
			 }else{
				 List<Animal> lst =anr.findByTypeAndAgeyAndAgemGreaterThan(s.getType(),0, ag);
			       return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);	 
			 }
				
		}
		
		else {
			if(s.getWu().contentEquals("month")) {
				List<Animal> lst =anr.findByTypeAndAgeyAndAgemGreaterThanAndColor(s.getType(),0, ag,s.getColor());
			       return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);	
			}
			else {
				List<Animal> lst =anr.findByTypeAndAgeyGreaterThanAndColor(s.getType(), ag,s.getColor());
			       return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);	
			}
				
		}

}
	
	@PostMapping("/bytypeagelower")
public ResponseEntity<List<Animal>> bytypeagelower(@RequestBody Animal s){
		
		int ag = s.getAgey();
		List<Animal> lst = anr.findByTypeAndAgeyLessThan(s.getType(),ag);
		return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
}
	
	
	@PostMapping("/bytypecolorweightupper")
public ResponseEntity<List<Animal>> bytypecolorweightupper(@RequestBody Animal s){
		
		if(s.getColor().contentEquals("")) {
			List<Animal> lst = anr.findByTypeAndWeightGreaterThanAndWu(s.getType(),s.getWeight(),s.getWu());
			return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
				}
		else {
			List<Animal> lst = anr.findByTypeAndWeightGreaterThanAndWuAndColor(s.getType(),s.getWeight(),s.getWu(),s.getColor());
			return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
			}
	
		
}
	
	@PostMapping("/bytypecolorweightlower")
public ResponseEntity<List<Animal>> bytypecolorweightlower(@RequestBody Animal s){
		if(s.getColor().contentEquals("")) {
			List<Animal> lst = anr.findByTypeAndWeightLessThanAndWu(s.getType(),s.getWeight(),s.getWu());
			return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);	
		}
		else {
			List<Animal> lst = anr.findByTypeAndWeightLessThanAndWuAndColor(s.getType(),s.getWeight(),s.getWu(),s.getColor());
			return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);		
			
		}
		
}
	
	
	@PostMapping("/bytype")
public ResponseEntity<List<Animal>> bytype(@RequestBody Animal s){
		List<Animal> lst =anr.findByTypeOrderByCreatedDesc(s.getType());
	
		return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
}	
	
	
	
	@PostMapping("/bytypecolor")
public ResponseEntity<List<Animal>> bytypecolor(@RequestBody Animal s){
		List<Animal> lst =anr.findByTypeAndColorOrderByCreatedDesc(s.getType(),s.getColor());
	
		return new ResponseEntity<List<Animal>>(lst,HttpStatus.OK);
}	
	
	@PostMapping("/byid")
public ResponseEntity<Animal> byid(@RequestBody Animal s){
		Animal lst =anr.findById(s.getAnid()).get();
	
		return new ResponseEntity<Animal>(lst,HttpStatus.OK);
}	
		
	
	
}
