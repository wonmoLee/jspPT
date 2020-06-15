<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>반응형 웹연습</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	
</div>
<br>
<br>
<div class="container">
  <h1>Products Table</h1>
  <br>
  <br>
  <div class="buttons">
  <button type="button" class="btn btn-outline-success" onclick="selectAll()">전체보기</button>
  <button type="button" class="btn btn-outline-info" onclick="selectPrice()">가격순</button>
  <button type="button" class="btn btn-outline-warning" onclick="selectCount()">판매순</button>
  </div>
  <br>
  <br>
  <div>
  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>이름</th>
        <th>종류</th>
        <th>가격</th>
        <th>판매수</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
      <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td>${product.type}</td>
        <td>${product.price}</td>
        <td>${product.count}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  </div>
</div>
</body>
<script>
	function selectAll() {
		console.log("selectAll실행");
		$.ajax({

			type: "POST",
			url: "/practice/products?cmd=main",
// 			data: 
// 			contentType: 
			dataType: "text"
			
		}).done((result)=>{
			if(result == 1) {
				alert("전체를 봅시다.")
			}
		}).fail((error)=>{
			alert("업데이트 실패");
		});
	}

	function selectPrice() {
		console.log("selectPrice실행");
		$.ajax({

			type: "POST",
			url: "/practice/products?cmd=mainPrice",
// 			data: 
// 			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			dataType: "json"
			
		}).done((result)=>{
			if(result == 1) {
				alert("가격순으로 봅시다.");
			}
		}).fail((error)=>{
			alert("오류발생");
		});
	}

	function selectCount() {
		console.log("selectCount실행");
		$.ajax({

			type: "POST",
			url: "/practice/product?cmd=mainCount",
// 			data: 
// 			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType: "json"
			
		}).done((result)=>{
			if(result == 1) {
				alert("가격순으로 봅시다.");
			}
		}).fail((error)=>{
			alert("오류발생");
		});
	}
</script>
</html>