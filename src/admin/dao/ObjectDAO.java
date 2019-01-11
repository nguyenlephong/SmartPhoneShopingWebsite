package admin.dao;


public interface ObjectDAO {
	public boolean add(Object obj) throws Exception;
	public boolean edit(Object obj);
	public boolean delete(String id);
}
