package dairy.repo;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dairy.model.Presitem;
public interface Presitemrepo extends JpaRepository<Presitem,Integer>{

	public List<Presitem> findByPrestypenumberGreaterThan(int ptn);
}
