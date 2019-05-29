package file;

import java.sql.*;
import java.io.*;

public class FilesDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public FilesDAO() {
		try {
		String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "root";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName, int bbsID) {
		String SQL = "INSERT INTO FILE VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate(); //정상적 => 1반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int insertFile(int fileNumber, String fileName, String filePath, int bbsID) {
		String SQL = "INSERT INTO files VALUES(?, ?, ?, ?)";
		
        try {
            //File imgfile = new File("d:\\images.jpg");
            //FileInputStream fin = new FileInputStream(imgfile);
	
            File imgfile = new File(filePath + "/" + fileName);
            FileInputStream fin = new FileInputStream(imgfile);
            
        	pstmt = conn.prepareStatement(SQL);
        	pstmt.setInt(1, fileNumber); //fileNumber
        	pstmt.setString(2, fileName);
        	pstmt.setBinaryStream(3, fin, (int)imgfile.length()); //Stream형의 파일 업로드
        	pstmt.setInt(4, bbsID);
        	
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
	}
	
	public int getFileID() {
		String SQL = "SELECT fileid FROM files ORDER BY fileid DESC";
		try {
			pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1;
			}
			else {
				return 1; // 첫 번째 파일인 경우.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; // 실패한 경우.
	}
	
	public InputStream getFile(int bbsID) {
		String SQL = "SELECT file FROM files WHERE bbsID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			//OutputStream output = response.getOutputStream();
			//InputStream input = null; 
			    
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBinaryStream("file"); //아마도 필드명?
				//input = rs.getBinaryStream("FILE");
			}
			        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null; // 오류 발생
	}
	
	public Files getFileName(int bbsID) {
		String SQL = "SELECT fileName FROM files WHERE bbsID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String fileName = rs.getString(1);
				Files files = new Files();
				files.setFileName(fileName);
				return files;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean isFile(int bbsID) {
		String SQL = "SELECT bbsID FROM file WHERE bbsID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean isFileSamebbsID(String file, int bbsID) {
		String SQL = "SELECT bbsID FROM file WHERE fileName = ? AND bbsID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, file);
			pstmt.setInt(2, bbsID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
