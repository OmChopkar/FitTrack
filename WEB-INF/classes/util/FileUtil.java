package util;
import java.io.*;
public class FileUtil 
{
    	private static final String BASE_PATH = "C:\\fitdata\\";
	private static final String USER_FILE = BASE_PATH + "users.txt";
    	private static final String DIET_FILE = BASE_PATH + "diet.txt";
    	private static final String PROGRESS_FILE = BASE_PATH + "progress.txt";
    
    	public static void ensureFiles() throws IOException 
	{
        	new File(BASE_PATH).mkdirs();
        	new File(USER_FILE).createNewFile();
        	new File(DIET_FILE).createNewFile();
        	new File(PROGRESS_FILE).createNewFile();
    	}
    
    	public static boolean userExists(String username) throws IOException 
	{
        	FileUtil.ensureFiles();
        	try(BufferedReader br = new BufferedReader(new FileReader(USER_FILE))) 
		{
            		String line; while((line=br.readLine())!=null) 
			{
                		String[] parts = line.split(",");
                		if(parts.length>=3 && parts[2].equalsIgnoreCase(username)) 
					return true;
            		}
        	}
        	return false;
	}
    
    	public static void saveUser(String data) throws IOException 
	{
        	FileUtil.ensureFiles();
        	try(BufferedWriter bw = new BufferedWriter(new FileWriter(USER_FILE, true))) 
		{
            		bw.write(data); bw.newLine();
        	}
    	}
    
    	public static boolean validateLogin(String username, String password) throws IOException 
	{
        	FileUtil.ensureFiles();
        	try(BufferedReader br = new BufferedReader(new FileReader(USER_FILE))) 
		{
            		String line; while((line=br.readLine())!=null) 
			{
                		String[] parts = line.split(",");
                		if(parts.length>=4 && parts[2].equalsIgnoreCase(username) && parts[3].equals(password))
                    			return true;
            		}
        	}
        	return false;
    	}
    
    	public static void appendDietProgress(String username, String data, String fileType) throws IOException 
	{
        	FileUtil.ensureFiles();
        	String file = "diet".equals(fileType) ? DIET_FILE : PROGRESS_FILE;
        	try(BufferedWriter bw = new BufferedWriter(new FileWriter(file, true))) 
		{
            		bw.write(username+","+data); bw.newLine();
        	}
    	}
    
    	public static String[] getUserEntries(String username, String fileType) throws IOException 
	{
        	FileUtil.ensureFiles();
        	String file = "diet".equals(fileType) ? DIET_FILE : PROGRESS_FILE;
        	java.util.List<String> list = new java.util.ArrayList<>();
        	try(BufferedReader br = new BufferedReader(new FileReader(file))) 
		{
            		String line; while((line=br.readLine())!=null) 
			{
                		if(line.startsWith(username+",")) list.add(line);
            		}
        	}
        	return list.toArray(new String[0]);
    	}

	public static void clearUserEntries(String username, String fileType) throws IOException 
	{
		ensureFiles();
		String file = "diet".equals(fileType) ? DIET_FILE : PROGRESS_FILE;
		File input = new File(file);
		File temp = new File(file + ".tmp");

		try (BufferedReader br = new BufferedReader(new FileReader(input));
     		BufferedWriter bw = new BufferedWriter(new FileWriter(temp))) 
		{
    			String line;
    			while ((line = br.readLine()) != null) 
			{
        			if (!line.startsWith(username + ",")) 
				{
            				bw.write(line);
            				bw.newLine();
        			}
    			}
		}
		if (!input.delete() || !temp.renameTo(input)) 
		{
    			throw new IOException("Could not clear entries for user " + username);
		}
	}
}




