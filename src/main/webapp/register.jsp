<%--
Document-signup
Created on-Feb 22 , 2022 ,9:30:08 AM
Author- Shashank
--%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
     <link rel="icon" type="image/png" href="images/reg.png">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
   
            
<meta charset="ISO-8859-1">
<title>Sign Up Page</title>
</head>
<body style="background:url(images/background.jpg);background-size:cover;background-attachement:fixed">
<div class="container">
<div class="row">
<div class="col m6 offset-m3">
   <div class="card">
          <div class="card-content">
  
<h3 style="margin-top:10px;" class="center-align">Register Here</h3>
<h5 id="msg" class="center-align "></h5>

      <div class="form center-align" >
        
        <form id="myform" action="RegisterServlet" method="post" >
        <input type="text" name="user_name" placeholder="Enter user name ">
        <input type="password" name="user_password" placeholder="Enter user password ">
        <input type="email" name="user_email" placeholder="Enter user Email ">
        
         <div class="file-field input-field">
      <div class="btn">
        <span>File</span>
        <input name="image" type="file">
      </div>
      <div class="file-path-wrapper">
        <input class="file-path validate" type="text">
      </div>
    </div>
        <button type="submit" class="btn red">Submit</button>
        </form>
 
      </div>
           
           
        
           <div class="loader center-align" style="margin-top:20px; display:none">
             <div class="progress">
                     <div class="indeterminate"></div>
              </div>
              <h5>Please Wait....</h5>
           </div>
   </div>
</div>
</div>
</div>
 <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script>
  $(document).ready(function (){
	  console.log("page is ready");
	  $("#myform").on('submit',function(event){
		  event.preventDefault();
		  
		  //var f=$(this).serialize();
		  let f=new FormData(this);
		  console.log(f);
		  
		  $(".loader").show();
		  $(".form").hide();
		  
		  $.ajax({
			  url:"RegisterServlet",
			  data:f,
			  type:'POST',
			  success:function(data,textStatus,jqXHR){
				  console.log(data);
				  console.log("success.........");
				  $(".loader").hide();
				  $(".form").show();
				   if(data.trim()==="done")
					  {
					  $("#msg").html("Successfully Registered");
					  $("#msg").addClass("green-text");
					  }
				  else
					  {
					  $("#msg").html("Something went wrong on server......");
					  $("#msg").addClass("red-text");
					  }
			  },
			  error:function(jqXHR,textStatus,errorThrown)
			  {
				  console.log(data);
				  console.log("error........");
				  $(".loader").hide();
				  $(".form").show();
				  $("#msg").html("Something went wrong on server.....");
			  },
			  processData:false,
			  contentType:false
		  })
		  
	  })
  })
 
  
  </script>
</body>
</html>