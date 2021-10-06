package dairy.repo;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import dairy.model.Animalpres;

public interface Animalpresrepo extends JpaRepository<Animalpres,Integer> {
	
public List<Animalpres> findByAnid(int anid);
	
}
