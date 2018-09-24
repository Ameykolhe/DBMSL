package assignmentB7;

import java.io.IOException;

public class AssignmentB7 {

	public static void main(String[] args) {
		
		
		try {
		
			JsonDemo d = new JsonDemo();
			d.addObject(3144, "Amey", "Kolhe");
			d.Close();
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
