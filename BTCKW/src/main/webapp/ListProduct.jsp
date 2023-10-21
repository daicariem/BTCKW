	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	
	<!DOCTYPE html>
	<html>
	<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link rel="stylesheet" href="styles.css">
	    <meta charset="UTF-8">
	    <title>ListProduct Page</title>
	    <style>
	    
	    .home-button {
	            position: absolute; /* Đặt nút ở vị trí tuyệt đối */
	            top: 10px; /* Khoảng cách từ trên xuống */
	            right: 10px; /* Khoảng cách từ phải sang */
	        }
	
	        .home-icon {
	            font-size: 24px;
	            color: #007bff;
	            text-decoration: none;
	            margin-left: 10px; /* Tạo khoảng cách giữa biểu tượng và văn bản */
	        }
	   
	    /* Định dạng cho logo */
	    .logo {
	        font-family: 'Pacifico', cursive; /* Thay đổi kiểu chữ độc lạ */
	        font-size: 24px;
	        margin-right: auto; /* Đẩy logo sang góc trái */
	        color:red;
	    }
	        .product {
	            border: 1px solid #ccc;
	            padding: 10px;
	            display: inline-block; /* Hiển thị cạnh nhau */
	            vertical-align: top; /* Căn chỉnh ở đầu trên */
	            margin:20px;
	            margin-bottom: 20px; /* Cách nhau 20px */
	            overflow: auto; /* Đảm bảo các sản phẩm không chồng lên nhau */
	            
	        }
	
	        .product img {
	            float: left; /* Đặt hình ảnh bên trái */
	            width: 250px; /* Đặt kích thước của hình ảnh */
	            height: 250px; /* Giới hạn chiều cao tối đa của hình ảnh */
	            margin-right: 30px; /* Để tạo khoảng cách giữa hình ảnh và mô tả */
	        }
	
	        .product-info {
	            overflow: hidden; /* Đảm bảo thông tin sản phẩm không bị tràn ra khỏi sản phẩm */
	        }
	
	        .product h3 {
	            font-weight: bold; /* Làm đậm chữ "Price" */
	        }
	
	        .buy-button {
	            background-color: #007bff;
	            color: #fff;
	            border: none;
	            padding: 5px 10px;
	            text-decoration: none;
	            cursor: pointer;
	        }
	    </style>
	</head>
	<body>
	<div class="logo">EYEWEAR STORE</div>
	<a href="home" class="home-button">
	    <i class="fas fa-home home-icon"></i> HOME
	</a>
	    <c:forEach items="${plist}" var="product" >
	        <div class="product">
	            <img src="${product.image}" alt="${product.name}">
	            <div class="product-info">
	                <h3>${product.name}</h3>
	                <p>Mã Sản Phẩm : ${product.description}</p>
	                <p>Chất Liệu : ${product.material}</p>
	                <p>Màu Sắc: ${product.color}</p>
	                <p><strong>Price:</strong> ${product.price}</p>
	                <a href="#" class="buy-button">Mua ngay</a>
	                <a href="cart.jsp" class="buy-button" onclick="addToCart(${product.id})">Thêm vào giỏ hàng</a>
	            </div>
	        </div>
	    </c:forEach>
	    
	  
	</body>
	</html>