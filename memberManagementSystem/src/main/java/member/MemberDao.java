package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.BCrypt;
import util.DBManager;
import util.SHA256;

public class MemberDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public void insertMember(Member member){
		try{
			conn = DBManager.getConnection();
			/* sha파일의 오류로 암호화 되지않음 나중에 수정하기...
			String orgPasswd = member.getPasswd();
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			String bcPasswd = BCrypt.hashpw(shaPasswd, BCrypt.gensalt());
			*/
			pstmt = conn.prepareStatement("insert into member values(?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, member.getId());
			// 암호화 성공하면 사용하기
			//pstmt.setString(2, bcPasswd);
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.closeConnection(conn, pstmt);
		}//end try
	}//end insertMember(member member)
	
	public int userCheck(String id, String passwd){
		ResultSet resultSet = null;
		int x = -1;
		
		try{
			conn = DBManager.getConnection();
			/* 암호회 된 뒤에 하기
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			*/
			pstmt = conn.prepareStatement("select passwd from member where id=?");
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()){
				String dbPasswd = resultSet.getString("passwd");
				/*암호화 된 뒤에 하기
				if(BCrypt.checkpw(shaPasswd, dbPasswd))
					x = 1; //인증성공
				else
					x = 0; //비밀번호 틀림
				*/
				if(dbPasswd.equals(passwd))
					x = 1;
				else
					x = 0;
			}else //해당 아이디없으면 수행
				x = -1;// 아이디 없음
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.closeConnection(conn, pstmt);
		}//end try
		
		return x;
	}//end userCheck(String id, String passwd)
	
	public int confirmId(String id){
		ResultSet resultSet = null;
		int x = 1;
		
		try{
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select id from member where id=?");
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next())
				x = 1; //같은 아이디 있음
			else
				x = -1;//같은 아이디 없음
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.closeConnection(conn, pstmt);
		}//end try
		return x;
	}//end confirmId(String id)
	
	public Member getMember(String id, String passwd){
		ResultSet resultSet = null;
		Member member = null;
		
		//SHA256 sha = SHA256.getInsatnce();
		try {
			conn = DBManager.getConnection();
			/* 암호화 되면 하기
			String orgPasswd = passwd;
			String shaPasswd = sha.getSha256(orgPasswd.getBytes());
			*/
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();

			if (resultSet.next()) {
				String dbPasswd = resultSet.getString("passwd");
				/* 암화 되면 하기
				if(BCrypt.checkpw(shaPasswd, dbPasswd)){
					member = new member();
					member.setId(resultSet.getString("id"));
					member.setName(resultSet.getString("name"));
					member.setReg_date(resultSet.getTimestamp("reg_date"));
					member.setAddress(resultSet.getString("address"));
					member.setTel(resultSet.getString("Tel"));
				}//end if(BCrypt.checkpw(shaPasswd, dbPasswd))
				*/
				if (dbPasswd.equals(passwd)) {
					member = new Member();
					member.setId(resultSet.getString("id"));
					member.setName(resultSet.getString("name"));
					member.setReg_date(resultSet.getTimestamp("reg_date"));
					member.setAddress(resultSet.getString("address"));
					member.setTel(resultSet.getString("Tel"));
				}
			}//end if(resultSet.next())
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.getConnection();
		}//end try
		
		return member;
	}//end getMember(String id, String passwd)
	
	public int deleteMember(String id, String passwd){
		ResultSet resultSet = null;
		int x = -1;
		
		//SHA256 sha = SHA256.getInsatnce();
		try{
			conn = DBManager.getConnection();
			/*
			String orgPasswd = passwd;
			String shaPasswd = sha.getSHA256(orgPasswd.getBytes());
			*/
			pstmt = conn.prepareStatement("select passwd from member where id =?");
			pstmt.setString(1, id);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()){
				String dbPasswd = resultSet.getString("passwd");
				/*
				if(BCrypt.checkpw(shaPass, dbPasswd)){
					pstmt = conn.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					x = 1;
				}//end if(BCrypt.checkpw(shaPass, dbPasswd))
				*/
				if(dbPasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from member where id=?");
					pstmt.setString(1, id);
					x = 1; //탈퇴 성공
				} else{
					x = 0; //탈퇴 실패
				}//end if(dbPasswd.equals(passwd))
			}//end if(resultSet.next())
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBManager.closeConnection(conn, pstmt);
		}//end try
		
		return x;
	}//end deleteMember(String id, String passwd)
}