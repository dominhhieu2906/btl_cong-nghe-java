<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tin tức thời sự mới nhất 24h ngày hôm nay trên VnExpress</title>
</head>
<body>
<header>
        <div class="top-header container d-flex justify-content-between">
            <div class="left-top-header d-flex">
                <div class="img-logo">
                    <a href="/btl_docbao/views/home.jsp">
                        <img src="/btl_docbao/assets/images/Logo.png" alt="">
                    </a>
                </div>
                <span class="date-now"></span>
                <span class="location">Hà Nội   <i class="bi bi-cloud-sun-fill"></i>  32 <sup>o</sup></span>
            </div>
            <div class="right-top-header d-flex">
                <a href="">Mới nhất</a>
                <a href="">Tin theo khu vực</a>
                <a href="" class="d-flex align-items-center"><img src="/btl_docbao/assets/images/MiniLogo.png" alt="" class="me-2"> International</a>
                <span class="btn-search"><i class="bi bi-search icon-search"></i><input class="input-search d-none" placeholder="Tìm kiếm..." type="text"></span>
                <div class='account'>
	                <%
	                	 String email = (String) session.getAttribute("email");
	                	 if (email != null) {
	                		 out.print("<span>" + email + "</span>");
	                		 /* Dropdown */
	                		 out.print("<div class='dropdown'>");
	                		 out.print("<div class='dropdown-content'>");
	                		 out.print("<p>Trang cá nhân</p>");
	                		 out.print("</div>");
	                		 out.print("<p class='pt-3'><a href='/btl_docbao/logout'>Đăng xuất</a></p>");
	                		 out.print("</div>");
	                	 } else {
	                		 out.print("<a href='/btl_docbao/views/login.jsp'><i class='bi bi-person'></i> Đăng nhập</a>");
	                	 }
	                %>
                </div>
                <!-- <a href="/btl_docbao/views/login.jsp"><i class="bi bi-person"></i> Đăng nhập</a> -->
                <span><i class="bi bi-bell"></i></span>
            </div>
        </div>
        <div class="line" style="Border-bottom: 1px solid #ccc">
        </div>
        <div class="bottom-header d-flex justify-content-center">
            <ul class="d-flex justify-content-between navs">
                <li class="nav-item"><a href="/btl_docbao/views/home.jsp" class="nav-link"><i class="bi bi-house-fill"></i></a></li>
                <%
                	var service = new TheLoaiService();
                	var theLoais = service.getTheloais();
                	for (var theLoai : theLoais) {
                		out.print("<li class='nav-item'><a href='/btl_docbao/views/theloai.jsp?tl=" 
                		+ theLoai.getTextUrl() + "' class='nav-link'>" + theLoai.getName() + "</a>");
                		out.print("<ul class='sub-navs'>");
                		for (var theloaitin : theLoai.getTheLoaiTins()) {
                			out.print("<li><a href='/btl_docbao/views/theloai.jsp?tl="
                			+ theLoai.getTextUrl() + "&tlt=" + theloaitin.getTextUrl() + "'>"
                			+ theloaitin.getName() + "</a></li>");
                		}
                		out.print("</ul></li>");
                	}
                %>
                <!-- <li class="nav-item">
                	<a href="" class="nav-link">Thời sự</a>
                	<ul class="sub-navs">
						<li><a href="">Dân sự</a></li>
						<li><a href="">Dân sự</a></li>
						<li><a href="">Dân sự</a></li>
                	</ul>
                </li> -->
                <li class="nav-item"><a href="" class="nav-link"><i class="bi bi-list"></i></a></li>
            </ul>
        </div>
        <script type="text/javascript">
        	/*Btn search*/
        	document.querySelector(".btn-search i").onclick = function(){
        		const inputsearch = document.querySelector(".input-search");
        		inputsearch.classList.toggle('d-none')
        		document.querySelector(".location").style.display = "none";
    			};
        </script>
        <script>
        	/* Get date now */
        	const date = new Date();
        	const dateNow = "Thứ " + (date.getDay() + 1) + ", " + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear()
        	document.querySelector(".date-now").innerHTML = dateNow;
        </script>
    </header>
</body>
</html>