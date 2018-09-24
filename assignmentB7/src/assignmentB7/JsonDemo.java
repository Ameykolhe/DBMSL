package assignmentB7;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class JsonDemo{
	
	static BufferedReader br;
	static BufferedWriter bw;
	static {
		try {
			bw = new BufferedWriter(new FileWriter("jsonDemo.txt",true));
			br = new BufferedReader(new FileReader("jsonDemo.txt"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	void Close()
	{
		try {
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	void addObject(Integer rollNO , String FName , String LName ) throws IOException
	{
		JSONObject obj = new JSONObject();
		
		obj.put("RollNO", new Integer(3144));
		
		Map name = new HashMap<String , String>();
		name.put("FName", FName);
		name.put("LName", LName);
		
		obj.put("Name", name);
		
		Random rand = new Random();
		
		String [] subjects = {"CN" , "DBMS" , "ISEE" , "SEPM" , "TOC"};
		
		JSONArray ar = new JSONArray();
		
		for(int i=0 ; i < 5 ; i++)
		{
			HashMap m = new HashMap();
			m.put(subjects[i] , new Integer(rand.nextInt(26) + 75));
			ar.add(m);
		}
		
		obj.put("Subject", ar);
		
		System.out.println(obj.toJSONString());
		
		bw.write(obj.toJSONString());
		bw.newLine();
		System.out.println("Write Successful");
		
	}
	
	
}