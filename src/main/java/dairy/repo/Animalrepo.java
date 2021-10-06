package dairy.repo;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dairy.model.Animal;

public interface Animalrepo extends JpaRepository<Animal,Integer>{

public List<Animal> findByFilename(String name);	
	public List<Animal> findByBdateBefore(Date d);
	public List<Animal> findAllByOrderByCreatedDesc();
	
	public List<Animal> findByTypeAndAgeyGreaterThan(String type, int agey);
	public List<Animal> findByTypeAndAgeyGreaterThanAndColor(String type, int agey,String color);
	public List<Animal> findByTypeAndAgeyAndAgemGreaterThan(String type, int agey,int agem);
	public List<Animal> findByTypeAndAgeyAndAgemGreaterThanAndColor(String type, int agey,int agem,String color);
	
	public List<Animal> findByTypeAndAgeyLessThan(String type, int agey);
	public List<Animal> findByTypeAndAgeyLessThanAndColor(String type, int agey,String color);
	public List<Animal> findByTypeAndAgeyAndAgemLessThan(String type, int agey,int agem);
	public List<Animal> findByTypeAndAgeyAndAgemLessThanAndColor(String type,int agey, int agem,String color);
	
	public List<Animal> findByTypeAndWeightLessThanAndWu(String type, float weight ,String wu);
	public List<Animal> findByTypeAndWeightLessThanAndWuAndColor(String type, float weight ,String wu,String color);
	
	public List<Animal> findByTypeAndWeightGreaterThanAndWu(String type, float weight ,String wu);
	public List<Animal> findByTypeAndWeightGreaterThanAndWuAndColor(String type, float weight ,String wu,String color);
	public List<Animal> findByTypeOrderByCreatedDesc(String type);
	public List<Animal> findByTypeAndColorOrderByCreatedDesc(String type,String color);
	public List<Animal> findBySource(String source);
	public boolean existsByAnidAndType(int i,String type);
	public boolean existsByAnid(int i);	
}
