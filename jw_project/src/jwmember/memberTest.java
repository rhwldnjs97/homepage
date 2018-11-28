package jwmember;

public class memberTest {
	public static void main(String[] args) {
		memberDAO dao = new memberDAO();
		
		create(dao);
		update(dao);
		delete(dao);
		read(dao);
		list(dao);
	}

	private static void list(memberDAO dao) {
		
	}

	private static void read(memberDAO dao) {
		
	}

	private static void delete(memberDAO dao) {
		
	}

	private static void update(memberDAO dao) {
		
	}

	private static void create(memberDAO dao) {
		memberDTO dto = new memberDTO();
		
		dao.create(dto);
	}
	
}
