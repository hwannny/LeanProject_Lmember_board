package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// Model
public class LogonDBBean {
	public static LogonDBBean instance = new LogonDBBean();
	public static LogonDBBean getInstance() {			// Singleton Pattern
		return instance;
	}
	
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" );
		DataSource ds = (DataSource) envCtx.lookup( "jdbc/encore" );
		return ds.getConnection();
	}
	
	public int insertMember( LogonDataBean memberDto ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into member values( ?, ?, ?, ?, ?, ?, ?, ? )";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, memberDto.getId() );
			pstmt.setString( 2, memberDto.getPasswd() );
			pstmt.setString( 3, memberDto.getName() );
			pstmt.setString( 4, memberDto.getJumin1() );
			pstmt.setString( 5, memberDto.getJumin2() );
			pstmt.setString( 6, memberDto.getTel() );
			pstmt.setString( 7, memberDto.getEmail() );
			pstmt.setTimestamp( 8, memberDto.getReg_date() );
			
			result = pstmt.executeUpdate();
			
		} catch ( NamingException e ) {
			e.printStackTrace();
		} catch ( SQLException e ) {
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}		
		return result;
	}
	
	public int check( String id ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, id );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				// 아이디가 있다
				result = 1;
			} else {
				// 아이디가 없다
				result = 0;
			}			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}		
		return result;
	}
	
	public int check (String id, String passwd ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				//아이디가 있다
				if( passwd.equals(rs.getString("passwd"))) {
					//비밀번호가 같다
					result = 1;
				}else{
					//비밀번호가 다르다
					result = -1;
				}
			}else{
				//아이가 없다
				result = 0;
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}	
		
		return result;
	}//check(id,ps)
	
	public int deleteMember( String id ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from member where id=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}	
	
		return result;
	}//delete
	
	
	public LogonDataBean getMember( String id ) {
		LogonDataBean memberDto = null; //아직 new를 하지 않았다
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, id );
			rs = pstmt.executeQuery();
			rs.next();
			//if ( rs.next() ) {
				memberDto = new LogonDataBean();
				memberDto.setId( rs.getString( "id" ) );
				memberDto.setPasswd(  rs.getString( "passwd" ) );
				memberDto.setName( rs.getString( "name" ) );
				memberDto.setJumin1( rs.getString( "jumin1" ) );
				memberDto.setJumin2( rs.getString( "jumin2" ) );
				memberDto.setTel( rs.getString( "tel" ) );
				memberDto.setEmail( rs.getString( "email" ) );
				memberDto.setReg_date( rs.getTimestamp( "reg_date" ) );	
			//}	
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}			
		return memberDto;
	}
	
	
	public int updateMember (LogonDataBean memberDto ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update member set passwd=?, tel=?, email=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberDto.getPasswd());
			pstmt.setString(2, memberDto.getTel());
			pstmt.setString(3, memberDto.getEmail() );
			pstmt.setString(4, memberDto.getId() );
			
			result = pstmt.executeUpdate();
			

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}			
		}
		
		return result;
	}//update
	
	
} // class

















