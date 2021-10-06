package dairy.repo;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import dairy.model.Pregnantreport;

public interface Pregnantreportrepo extends JpaRepository<Pregnantreport,Integer> {

	public List<Pregnantreport> findByAnid(int anid);
	public boolean existsByAnidAndStringconcivedate(int anid,String condate);
	
  }
