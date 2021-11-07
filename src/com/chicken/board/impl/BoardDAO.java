package com.chicken.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.chicken.board.productDto;
import com.chicken.board.boardDto;
import com.chicken.board.eventDto;
import com.chicken.board.noticeDto;
import com.chicken.board.noticeTextVo;
import com.chicken.board.pageNumVo;
import com.chicken.common.ConnectUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDAO {

	private Connection con;
	private ArrayList<noticeTextVo> listOfNotice = new ArrayList<noticeTextVo>();
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	private static BoardDAO bDao;
	private PreparedStatement pstmt;

	public BoardDAO() {
	}

	public static synchronized BoardDAO getInstance() {
		if (bDao == null) {
			bDao = new BoardDAO();
		}
		return bDao;
	}

	// 게시판 받아오기
	public BoardDAO(int startNum1, int endNum1, String board) { // pageNum = 보여줄 페이지가 몇페이지인지
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + board + " where " + board + "_no BETWEEN ? AND ?;";

		int startNum = startNum1;
		int endNum = endNum1;

		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			if (board.equals("service"))
				while (rs.next()) {
					noticeTextVo nt = new noticeTextVo(rs.getInt(board + "_no"), rs.getString(board + "_title"),
							rs.getString(board + "_Writer"), rs.getString(board + "_date"),
							rs.getString(board + "_status"));
					listOfNotice.add(nt);
				}

			else
				while (rs.next()) {
					noticeTextVo nt = new noticeTextVo(rs.getInt(board + "_no"), rs.getString(board + "_title"),
							rs.getString(board + "_Writer"), rs.getString(board + "_date"));
					listOfNotice.add(nt);
				}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
	}

	// 내 문의 받아오기
	public BoardDAO(int startNum1, int endNum1, String board, String idKey) { // pageNum = 보여줄 페이지가 몇페이지인지
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pageNumVo Opnv = null;
		String sql = "select * from service where service_Writer = '" + idKey + "' order by service_no desc;";

		int startNum = startNum1;
		int endNum = endNum1;

		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				noticeTextVo nt = new noticeTextVo(rs.getInt(board + "_no"), rs.getString(board + "_title"),
						rs.getString(board + "_Writer"), rs.getString(board + "_date"),
						rs.getString(board + "_status"));
				listOfNotice.add(nt);
			}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
	}

	// 내 주문받아오기
	public BoardDAO(int startNum1, int endNum1, String board, String idKey, int i) { // pageNum = 보여줄 페이지가 몇페이지인지
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ordertbl where orderer = '" + idKey + "' order by ordertbl_no desc;";

		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				noticeTextVo nt = new noticeTextVo(rs.getInt(board + "_no"), rs.getString(board + "_products"),
						rs.getString(board + "_date"), rs.getString(board + "_status"), rs.getString(board + "_addr"),
						1);
				listOfNotice.add(nt);
			}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
	}

	public int NoticeCount(String board) { // 총 공지의 수를 리턴
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			con = ConnectUtil.getConnection();
			String sql = "SELECT * FROM " + board + ";";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				count++;
			}
		}

		catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return count;
	}

	public ArrayList<noticeTextVo> getAllNotice() {
		return listOfNotice;
	}

	// 게시글 추가
	public boolean addNotice(String title, String content) {
		PreparedStatement pstmt = null;
		String sql = "insert into notice(notice_title,notice_Writer,notice_date,notice_content) values('" + title
				+ "','관리자','" + date.format(today) + "','" + content + "')";

				String query1 = "ALTER TABLE notice AUTO_INCREMENT=1;";
				String query2 = "SET @COUNT = 0;";
				String query3 = "UPDATE notice SET notice_no = @COUNT:=@COUNT+1;";

		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query1);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query2);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query3);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;

	}

	public boolean addEvent(String title, String content) {
		PreparedStatement pstmt = null;
		String sql = "insert into event(event_title,event_Writer,event_date,event_content) values('" + title
				+ "','관리자','" + date.format(today) + "','" + content + "')";
		String query1 = "ALTER TABLE notice AUTO_INCREMENT=1;";
		String query2 = "SET @COUNT = 0;";
		String query3 = "UPDATE notice SET notice_no = @COUNT:=@COUNT+1;";

		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query1);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query2);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query3);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;

	}

	// 게시글 목록 받아오기
	public ArrayList<noticeDto> getNotices() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<noticeDto> a = new ArrayList<noticeDto>();

		String sql = "select * from notice";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				noticeDto n = new noticeDto();

				n.setNo(rs.getString("notice_no"));
				n.setTitle(rs.getString("notice_title"));
				n.setWriter(rs.getString("notice_Writer"));
				n.setDate(rs.getString("notice_date"));
				n.setContent(rs.getString("notice_content"));
				a.add(n);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}

	public ArrayList<eventDto> getEvents() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<eventDto> a = new ArrayList<eventDto>();

		String sql = "select * from event";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				eventDto n = new eventDto();

				n.setNo(rs.getString("event_no"));
				n.setTitle(rs.getString("event_title"));
				n.setWriter(rs.getString("event_Writer"));
				n.setDate(rs.getString("event_date"));
				n.setContent(rs.getString("event_content"));
				a.add(n);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}

	// 게시글 받아오기
	public String getNoticeInfo(String id, String act) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searching = act;
		String query, str, result;
		result = "null";
		query = "";
		str = "";

		switch (searching) {

		case "no":
			query = "select notice_no from notice where notice_no='" + id + "'";
			str = "notice_no";
			break;

		case "title":
			query = "select notice_title from notice where notice_no='" + id + "'";
			str = "notice_title";
			break;

		case "writer":
			query = "select notice_Writer from notice where notice_no='" + id + "'";
			str = "notice_Writer";
			break;

		case "date":
			query = "select notice_date from notice where notice_no='" + id + "'";
			str = "notice_date";
			break;

		case "content":
			query = "select notice_content from notice where notice_no='" + id + "'";
			str = "notice_content";

		}

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				result = rs.getString(str);

			}

		} catch (SQLException e) {

			System.out.println("Exception : " + e.getStackTrace());

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return result;

	}

	public String getEventInfo(String id, String act) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searching = act;
		String query, str, result;
		result = "null";
		query = "";
		str = "";

		switch (searching) {

		case "no":
			query = "select event_no from event where event_no='" + id + "'";
			str = "event_no";
			break;

		case "title":
			query = "select event_title from event where event_no='" + id + "'";
			str = "event_title";
			break;

		case "writer":
			query = "select event_Writer from event where evente_no='" + id + "'";
			str = "event_Writer";
			break;

		case "date":
			query = "select event_date from event where event_no='" + id + "'";
			str = "event_date";
			break;

		case "content":
			query = "select event_content from event where event_no='" + id + "'";
			str = "event_content";

		}

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				result = rs.getString(str);

			}

		} catch (SQLException e) {

			System.out.println("Exception : " + e.getStackTrace());

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return result;

	}

	// 게시글 지우기
	public boolean deleteBoard(String id, String type) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query2="";
		String query3="";
		String query4="";
		 if(type.equals("notice")) { 
		query2 = "ALTER TABLE notice AUTO_INCREMENT=1;";
		query3 = "SET @COUNT = 0;";
		query4 = "UPDATE notice SET notice_no = @COUNT:=@COUNT+1;";
		}
	
	  else if(type.equals("event")){ 
		query2 ="ALTER TABLE event AUTO_INCREMENT=1;"; 
		query3 = "SET @COUNT = 0;";
		query4 = "UPDATE event SET event_no = @COUNT:=@COUNT+1;";
	  }
	 
			
		
		String query = "delete from " + type + " where " + type + "_no ='" + id + "'";

		try {

			con = ConnectUtil.getConnection();
			
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query2);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query3);
			pstmt.executeUpdate();
			pstmt = con.prepareStatement(query4);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		}

		finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;
	}

	// 게시글 수정
	public boolean updateBoardInfo(String id, String type, String title, String writer, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update " + type + " set " + type + "_title = '" + title + "'," + type + "_Writer='" + writer
				+ "', " + type + "_date='" + date.format(today) + "', " + type + "_content='" + content + "' where "
				+ type + "_no = '" + id + "' ";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;

	}

	// 게시글 목록
	public ArrayList<productDto> getProducts() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<productDto> a = new ArrayList<productDto>();

		String sql = "select * from product";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				productDto n = new productDto();

				n.setId(rs.getString("p_id"));
				n.setName(rs.getString("p_name"));
				n.setPrice(rs.getInt("p_price"));
				n.setDesc(rs.getString("p_desc"));
				n.setCategory(rs.getString("p_category"));
				n.setStock(Integer.parseInt(rs.getString("p_stock")));
				n.setImgsrc(rs.getString("p_imgsrc"));
				n.setLike(rs.getInt("p_like"));
				n.setDislike(rs.getInt("p_dislike"));
				n.setView(rs.getInt("p_view"));

				a.add(n);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return a;
	}

	// 메뉴 관리
	public boolean addProduct(String id, String name, String price, String desc, String category, String stock,
			String imgsrc) {
		PreparedStatement pstmt = null;
		String sql = "insert into product(p_id,p_name,p_price,p_desc,p_category,p_stock,p_imgsrc,p_like,p_dislike,p_view) values('" + id + "','"
				+ name + "','" + price + "','" + desc + "','" + category + "','" + stock + "','" + imgsrc + "','0','0','0')";
		try {
			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;

	}

	public boolean deleteProduct(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from product where p_id ='" + id + "'";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		}

		finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;
	}

	public boolean updateProduct(String id, String name, String price, String desc, String category, String stock,
			String imgsrc,String like,String dislike,String view) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update product set p_id='" + id + "',p_name='" + name + "',p_price='" + price + "',p_desc='"
				+ desc + "',p_category='" + category + "',p_stock='" + Integer.parseInt(stock) + "',p_imgsrc='" + imgsrc
				+ "',p_like='"+like+"',p_dislike='"+dislike+"',p_view='"+view+"' where p_id = '" + id + "' ";

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return true;

	}

	public String getProductInfo(String id, String act) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searching = act;
		String query, str, result;
		result = "null";
		query = "";
		str = "";

		switch (searching) {

		case "id":
			query = "select p_id from product where p_id='" + id + "'";
			str = "p_id";
			break;

		case "name":
			query = "select p_name from product where p_id='" + id + "'";
			str = "p_name";
			break;

		case "price":
			query = "select p_price from product where p_id='" + id + "'";
			str = "p_price";
			break;

		case "desc":
			query = "select p_desc from product where p_id='" + id + "'";
			str = "p_desc";
			break;

		case "category":
			query = "select p_category from product where p_id='" + id + "'";
			str = "p_category";
			break;

		case "stock":
			query = "select p_stock from product where p_id='" + id + "'";
			str = "p_stock";
			break;

		case "imgsrc":
			query = "select p_imgsrc from product where p_id='" + id + "'";
			str = "p_imgsrc";
			break;
			
		case "like":
			query = "select p_like from product where p_id='" + id + "'";
			str = "p_like";
			break;
			
		case "dislike":
			query = "select p_dislike from product where p_id='" + id + "'";
			str = "p_dislike";
			break;
			
		case "view":
			query = "select p_view from product where p_id='" + id + "'";
			str = "p_view";
			break;
		}

		try {

			con = ConnectUtil.getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				result = rs.getString(str);

			}

		} catch (SQLException e) {

			System.out.println("Exception : " + e.getStackTrace());

		} finally {
			ConnectUtil.close(con, pstmt, null);

		}
		return result;

	}

	// 김태우 리뷰 게시판 글쓰기
	// 리뷰 글 쓰기
	public boolean review_write(HttpServletRequest request, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean ck = false;
		String fileName = null;
		try {
			// = = = = 파일 저장 = = = = //
			// 파일 경로 생성
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Chicken/WebContent/images_review";
			// 사이즈 제한 10M
			int sizeLimit = 1024 * 1024 * 10;

			// 멀티파트 객체 생성(파일 업로드)
			MultipartRequest multi = new MultipartRequest(request, uploadDir, sizeLimit, "utf-8",
					new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("write_image");
			if (fileName == null)
				fileName = "";

			// = = = = DB insert = = = = //
			con = ConnectUtil.getConnection();
			String sql = "insert into review (review_title, review_Writer, review_date, review_content, review_file, review_value) VALUES "
					+ "(?,?,NOW(),?,?,?);";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("write_title"));
			pstmt.setString(2, id);
			pstmt.setString(3, multi.getParameter("write_content"));
			pstmt.setString(4, fileName);
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("write_value")));
			int count = pstmt.executeUpdate();

			if (count == 1)
				ck = true;

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return ck;
	}

	// 문의사항 글 쓰기
	public boolean service_write(HttpServletRequest request, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean ck = false;
		String fileName = null;
		try {
			// = = = = 파일 저장 = = = = //
			// 파일 경로 생성
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Chicken/WebContent/images_service";
			// 사이즈 제한 10M
			int sizeLimit = 1024 * 1024 * 10;

			// 멀티파트 객체 생성(파일 업로드)
			MultipartRequest multi = new MultipartRequest(request, uploadDir, sizeLimit, "utf-8",
					new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("write_image");
			if (fileName == null)
				fileName = "";

			// = = = = DB insert = = = = //
			con = ConnectUtil.getConnection();
			String sql = "insert into service (service_title, service_Writer, service_date, service_content, service_file) VALUES "
					+ "(?,?,NOW(),?,?);";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("write_title"));
			pstmt.setString(2, id);
			pstmt.setString(3, multi.getParameter("write_content"));
			pstmt.setString(4, fileName);
			int count = pstmt.executeUpdate();

			if (count == 1)
				ck = true;

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return ck;
	}

	// 주문 게시글 읽어오기
	public boardDto read_order(String order_no) {
		Statement stmt = null;
		ResultSet rs = null;
		boardDto rDto = new boardDto();

		try {
			con = ConnectUtil.getConnection();

			stmt = con.createStatement();

			String sql = "select * from ordertbl where ordertbl_no = '" + order_no + "'";
			rs = stmt.executeQuery(sql);
			rs.next();

			rDto.setNo(rs.getString("ordertbl_no"));
			rDto.setProducts(rs.getString("ordertbl_products"));
			rDto.setName(rs.getString("orderer"));
			rDto.setStatus(rs.getString("ordertbl_status"));
			rDto.setDate(rs.getString("ordertbl_date"));
			rDto.setAddr(rs.getString("ordertbl_addr"));
		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}

		return rDto;
	}

	// 리뷰 게시글 읽어오기
	public boardDto read_review(String review_no) {
		Statement stmt = null;
		ResultSet rs = null;
		boardDto rDto = new boardDto();

		try {
			con = ConnectUtil.getConnection();

			stmt = con.createStatement();

			String sql = "select * from review where review_no = '" + review_no + "'";
			rs = stmt.executeQuery(sql);
			rs.next();

			rDto.setNo(rs.getString("review_no"));
			rDto.setTitle(rs.getString("review_title"));
			rDto.setWriter(rs.getString("review_writer"));
			rDto.setContent(rs.getString("review_content"));
			rDto.setValue(rs.getString("review_value"));
			rDto.setDate(rs.getString("review_date"));
			rDto.setFileurl(rs.getString("review_file"));

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}

		return rDto;
	}

	// 문의사항 게시글 받아오기
	public boardDto read_service(String service_no) {
		Statement stmt = null;
		ResultSet rs = null;
		boardDto sDto = new boardDto();

		try {
			con = ConnectUtil.getConnection();

			stmt = con.createStatement();

			String sql = "select * from service where service_no = '" + service_no + "'";
			rs = stmt.executeQuery(sql);
			rs.next();

			sDto.setNo(rs.getString("service_no"));
			sDto.setTitle(rs.getString("service_title"));
			sDto.setWriter(rs.getString("service_writer"));
			sDto.setContent(rs.getString("service_content"));
			sDto.setStatus(rs.getString("service_status"));
			sDto.setDate(rs.getString("service_date"));
			sDto.setFileurl(rs.getString("service_file"));

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}

		return sDto;
	}

	// 이벤트 게시글 받아오기
	public boardDto read_event(String event_no) {
		Statement stmt = null;
		ResultSet rs = null;
		boardDto Dto = new boardDto();

		try {
			con = ConnectUtil.getConnection();

			stmt = con.createStatement();

			String sql = "select * from event where event_no = '" + event_no + "'";
			rs = stmt.executeQuery(sql);
			rs.next();

			Dto.setNo(rs.getString("event_no"));
			Dto.setTitle(rs.getString("event_title"));
			Dto.setWriter(rs.getString("event_writer"));
			Dto.setContent(rs.getString("event_content"));
			Dto.setDate(rs.getString("event_date"));
			// Dto.setFileurl(rs.getString("event_file"));

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}

		return Dto;
	}

	// 공지사항 게시글 받아오기
	public boardDto read_notice(String notice_no) {
		Statement stmt = null;
		ResultSet rs = null;
		boardDto Dto = new boardDto();

		try {
			con = ConnectUtil.getConnection();

			stmt = con.createStatement();

			String sql = "select * from notice where notice_no = '" + notice_no + "'";
			rs = stmt.executeQuery(sql);
			rs.next();

			Dto.setNo(rs.getString("notice_no"));
			Dto.setTitle(rs.getString("notice_title"));
			Dto.setWriter(rs.getString("notice_writer"));
			Dto.setContent(rs.getString("notice_content"));
			Dto.setDate(rs.getString("notice_date"));
			// Dto.setFileurl(rs.getString("notice_file"));

		} catch (Exception e) {
			System.out.println("Exception " + e);
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}

		return Dto;
	}

	// 리뷰 수정
	public boolean review_update(HttpServletRequest request, String review_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		boolean ck = false;
		String fileName = null;
		try {
			// = = = = 파일 저장 = = = = //
			// 파일 경로 생성
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Chicken/WebContent/images_service";
			// 사이즈 제한 10M
			int sizeLimit = 1024 * 1024 * 10;

			// 멀티파트 객체 생성(파일 업로드)
			MultipartRequest multi = new MultipartRequest(request, uploadDir, sizeLimit, "utf-8",
					new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("write_image");
			if (fileName == null)
				fileName = "";

			// = = = DB = = =
			// 파일이 없을 경우 - 제목, 내용, 점수만 업데이트
			if (fileName == "") {
				con = ConnectUtil.getConnection();
				String strQuery = "update review set review_title=?, review_date=NOW(), review_content=?, review_value=? where review_no = "
						+ review_no + ";";

				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, multi.getParameter("write_title"));
				pstmt.setString(2, multi.getParameter("write_content"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("write_value")));

				pstmt.executeUpdate();
			} else { // 파일이 있을 경우
				con = ConnectUtil.getConnection();
				String strQuery = "update review set review_title=?, review_date=NOW(), review_content=?, review_value=? , review_file=? where review_no = "
						+ review_no + ";";

				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, multi.getParameter("write_title"));
				pstmt.setString(2, multi.getParameter("write_content"));
				pstmt.setInt(3, Integer.parseInt(multi.getParameter("write_value")));
				pstmt.setString(4, fileName);

				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return false;
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return true;
	}

	// 리뷰 수정
	public boolean service_update(HttpServletRequest request, String service_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		boolean ck = false;
		String fileName = null;
		try {
			// = = = = 파일 저장 = = = = //
			// 파일 경로 생성
			String uploadDir = this.getClass().getResource("").getPath();
			uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "Chicken/WebContent/images_service";
			// 사이즈 제한 10M
			int sizeLimit = 1024 * 1024 * 10;

			// 멀티파트 객체 생성(파일 업로드)
			MultipartRequest multi = new MultipartRequest(request, uploadDir, sizeLimit, "utf-8",
					new DefaultFileRenamePolicy());
			fileName = multi.getFilesystemName("write_image");
			if (fileName == null)
				fileName = "";

			// = = = DB = = =
			// 파일이 없을 경우 - 제목, 내용만 업데이트
			if (fileName == "") {
				con = ConnectUtil.getConnection();
				String strQuery = "update service set service_title=?, service_date=NOW(), service_content=? where service_no = "
						+ service_no + ";";

				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, multi.getParameter("write_title"));
				pstmt.setString(2, multi.getParameter("write_content"));

				pstmt.executeUpdate();
			} else { // 파일이 있을 경우
				con = ConnectUtil.getConnection();
				String strQuery = "update service set service_title=?, service_date=NOW(), service_content=? , service_file=? where service_no = "
						+ service_no + ";";

				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, multi.getParameter("write_title"));
				pstmt.setString(2, multi.getParameter("write_content"));
				pstmt.setString(3, fileName);

				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return false;
		} finally {
			ConnectUtil.close(con, pstmt, null);
		}
		return true;
	}

}
