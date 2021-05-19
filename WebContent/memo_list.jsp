<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MEMO</title>
    <!-- CSS LINK -->
    <link rel="stylesheet" type ="text/css" href="base.css">
    <!-- BOOTSTRAP LINK -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- GOOGLE FONT LINK -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
</head>
<%			
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "0000" ;
	String sql = "select * from oneline" ;
	PreparedStatement psmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	psmt = con.prepareStatement(sql);
	ResultSet rs =psmt.executeQuery();
%>
<body>
        <div id="header">
            <h1><strong>메모장 웹 애플리케이션</strong></h1>
        </div>
        
        <div id="git_link">
            <a href="https://github.com/izvern/oneline" target="_blank">깃허브 가기 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
              </svg></a>
        </div>
        <hr>
        <div style="text-align: center; margin-top:1.5rem; font-family: 'Poor Story', cursive;">
            <h1>메모 작성하기</h1>
        </div>
        <form method="get" action="memo_write.jsp">
            <div class="form-group" style="margin: 0rem 25rem 1rem 25rem;">
                <label for="memo_text">메모 : </label>
                <input type="text" class="form-control" name="memo_text" placeholder="메세지를 입력하세요.">
            </div>
            <div style="text-align: center; margin-top: 0rem;">
                <input type="submit" class="btn btn-info" value="입력">
            </div>
		</form>
        <div style="margin-left:25rem; margin-right:25rem; margin-top:2rem; font-family: 'Poor Story', cursive;">
            <h3>메모내역</h3>
        </div>
        <div id="memoed_list">
        <ul>
        <%  
        while(rs.next()) {
    		int no = rs.getInt(1);
    		String memo = rs.getString("memo");
    		String wdate = rs.getString(3);
    		
    		out.print(no + ":" + memo +":(" + wdate +"<input type=\"button\" value=\"X\"></input>"+"<br>");
    	}
        %>
        </ul>

		<%
		rs.close();
		psmt.close();
		con.close();
		%>
            <ul>
                <li><strong>[10:30] </strong>이서현 : 웹서비스개발실습 oneline 과제 4월 28일까지 제출!!<input type="button" value="X"></input></li>
                <li><strong>[08:31] </strong>김서현 : 진로설계와자기계발 꿈날개 교육 수강 5월 23일 까지!!<input type="button" value="X"></input></li>
                <li><strong>[15:57] </strong>박서현 : 웹서비스개발고급 쇼핑몰 페이지 제작 과제 4월 25일까지 제출!!<input type="button" value="X"></input></li>
            </ul>
        </div>
</body>
</html>