package dairy.repo;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import dairy.model.Sellcow;

public interface Cowsellrepo extends JpaRepository<Sellcow,Integer>{

	public boolean existsByAnid(int anid);
	public List<Sellcow> findByAnidOrderBySelldateDesc(int anid);
	public List<Sellcow> findBySellpriceGreaterThanEqualOrderBySelldateDesc(int sellprice);
	public List<Sellcow> findBySellpriceLessThanEqualOrderBySelldateDesc(int sellprice);
	public List<Sellcow> findBySellpriceBetweenOrderBySelldateDesc(int price1,int price2);
	public List<Sellcow> findByStringselldateOrderBySelldateDesc(String selldate);
	public List<Sellcow> findBySelldateBetweenOrderBySelldateDesc(Date d1, Date d2);
	public List<Sellcow> findBySelldateAfterOrderBySelldateDesc(Date selldate);
	public List<Sellcow> findBySelldateBeforeOrderBySelldateDesc(Date selldate);
	public List<Sellcow> findByBuyernameContainingIgnoreCaseOrderBySelldateDesc(String buyer);
	public List<Sellcow> findByBuyercontactOrderBySelldateDesc(String contact);
	public List<Sellcow> findBySelldate(Date sd);
	public List<Sellcow> findBySelldateBetween(Date d1,Date d2);
	public List<Sellcow> findByDueGreaterThanOrderBySelldateDesc(float d);

}
