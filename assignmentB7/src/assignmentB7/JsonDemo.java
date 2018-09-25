package assignmentB7;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class JsonDemo{
	
	
	static void decodeObjects() throws IOException, ParseException
	{
		BufferedReader br = new BufferedReader(new FileReader("jsonDemo.txt"));
		
		String str;
		JSONObject ob;
		int i = 1;
		while( ( str = br.readLine() ) != null)
		{
			
			System.out.println("Documnet NO :\t" + i + "\n");
			
			ob = (JSONObject)new  JSONParser().parse(str);
			
			Long rollNO = (Long)ob.get("RollNO");
			System.out.println("RollNO      :\t" + rollNO.toString());
			
			JSONObject name = (JSONObject) ob.get("Name");
			
			String FName = (String)name.get("FName");
			String LName = (String)name.get("LName");
			System.out.println("Name        :  \tFName : " + FName);
			System.out.println("\t\tLName : " + LName + "\n");
			
			JSONArray arr = (JSONArray) ob.get("Subject");
			
			String [] subjects = {"CN" , "DBMS" , "ISEE" , "SEPM" , "TOC"};
			
			System.out.println("Subject     :");
			
			for(int j = 0 ; j < arr.size() ; j++)
			{
				JSONObject subject = (JSONObject)arr.get(j);
				Long marks = (Long)subject.get(subjects[j]);
				
				System.out.println("\t\t" + subjects[j] + "\t: " + marks);
			}
			
			System.out.println("\n");
			i+=1;
		}
		
		br.close();
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	static void addObject(Integer rollNO , String FName , String LName ) throws IOException
	{
		
		BufferedWriter bw = new BufferedWriter(new FileWriter("jsonDemo.txt",true));
		
		JSONObject obj = new JSONObject();
		
		obj.put("RollNO", rollNO);
		
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
		
		System.out.println("\n" + obj.toJSONString());
		
		bw.write(obj.toJSONString());
		bw.newLine();
		System.out.println("Write Successful");
		
		bw.close();
		
	}
	
	public static void main(String[] args) throws IOException, ParseException {
		
		int choice;
		Scanner sc = new Scanner(System.in);
		
		String FName , LName;
		Integer rollNO;
		
		while(true)
		{
			System.out.print("\n\nEnter Choice :\n1: Encode Object\n2: Decode Objects\n3: Exit\n>");
			choice = sc.nextInt();
			
			if(choice == 1)
			{
				System.out.print("Enter RollNO      : ");
				rollNO = Integer.parseInt(sc.next());
				System.out.print("Enter First Name  : ");
				FName = sc.next();
				System.out.print("Enter Last Name   : ");
				LName = sc.next();
				JsonDemo.addObject(rollNO, FName, LName);
			}
			else if(choice == 2)
			{
				JsonDemo.decodeObjects();
			}
			else
			{
				sc.close();
				break;
			}
		}
	}
	
}