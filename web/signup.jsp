<%-- 
    Document   : signup
    Created on : 01-Aug-2022, 10:09:24 AM
    Author     : harshangprajapati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
        
    </head>
    <body 
        style="background: url(img/beach.jpg);
        background-size: cover;
        background-attachment: fixed">
        <div class="container">
            
            <div class="row">
            
                <div class="col m6 offset-m3">
                
                    <div class="card">
                    
                        <div class="card-content">
                        
                            <h3 style="margin-top: 20px;" class="center-align">Register here!!</h3>
                            
                            <h5 id="message" class="center-align">
                                
                            </h5>
                            
                            <div class = "form center-align">
                                
                                <form action="Register" method="post" id="myform">
                                    
                                    <input type="text" 
                                           name="user_name" 
                                           placeholder="Please Enter Your username"/>
                                    
                                    <input type="password" 
                                           name="user_password" 
                                           placeholder="Please Enter Your password"/>
                                    
                                    <input type="email" 
                                           name="user_email" 
                                           placeholder="Please Enter Your email"/>
                                    
                                    <div class="file-field input-field">
                                        <div class="btn light-blue accent-2">
                                            <span>File</span>
                                            <input type="file" name="image">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" 
                                                   type="text">
                                        </div>
                                    </div>
                                    
                                    <button type="submit"
                                            class="btn light-blue accent-2">
                                        submit
                                    </button>
                                    
                                </form>
                                
                            </div>
                            
                            <div 
                                class ="loader center-align" 
                                style="margin-top: 10px;
                                display: none">
                                
                                 <div class="preloader-wrapper small active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle">
                                            </div>
                                                </div>
                                        <div class="gap-patch">
                                            <div class="circle">
                                            </div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle">
                                                
                                            </div>
                                                
                                        </div>
                                            
                                    </div>
                                        
                                 </div>
                                
                                <h5>Please wait.....</h5>
        
                            </div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <script 
            
            src="https://code.jquery.com/jquery-3.6.0.min.js" 
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
            crossorigin="anonymous">
                
        </script>
        
        <script>
            
            $(document).ready(function () {
                
                console.log("page is ready........");
                
                $("#myform").on('submit',function(event){
                    
                    event.preventDefault();
                    
//                    var f = $(this).serialize();
                    
                    let f = new FormData(this);
                    
                    console.log(f);
                    
                    $(".loader").show();
                    $(".form").hide();
                    
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'post',
                        success: function (data, textStatus, jqXHR) {
                            
                            console.log(data);
                            console.log("Sucess,,,,,");
                            
                            $(".loader").hide();
                            $(".form").show();
                            
                            if(data.trim() === 'done' ) {
                                
                                $('#message').html("Successfully Registed... !!!!!");
                                $('#message').addClass('green-text');
                                
                            } else {
                                
                                $('#message').html("Something went wrong on server... !!!!")
                                $('#message').addClass('red-text');
                                
                            }
                            
                        } ,
                        error: function (jqXHR, textStatus, errorThrown) {
                            
                            console.log(data);
                            console.log("Error occured,,,,,");
                            
                            $(".loader").hide();
                            $(".form").show();
                            
                            $('#message').html("Something went wrong on server... !!!!")
                            $('#message').addClass('red-text');
                            
                        },
                        processData: false,
                        contentType: false
                    });
                    
                }); 
                
            });
            
        </script>
        
    </body>
</html>
