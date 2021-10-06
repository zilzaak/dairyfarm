package dairy.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import dairy.model.Firmadmin;



public interface Adminrepo extends JpaRepository<Firmadmin,Integer> {

	
}
