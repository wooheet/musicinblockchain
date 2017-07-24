<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <title>EmailVerify</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="assets/css/main.css" />
      
 
</head>
<body class="no-sidebar">
      <div id="page-wrapper">

         <!-- Main -->
            <div id="header-wrapper">
               <div class="container" id="main">
                  <div class="\35 0\25">
                  <!-- Content -->
                     <article id="content">
                        <header>
                           <h2>로그인</h2>
                        </header>
                     </article>
                  </div>
               </div>
            </div>

         <!-- Footer -->
            <div id="promo-wrapper">
               <div id="footer" class="container">
                  
                  <div class="row">
                     <section class="12u">
                        <form method="post" name="authenform" action="/FairMusic/email" ">
                           <div class="row 50%">
                              <div class="12u">
                                 <input name="id" placeholder="e-mail" type="text" />
                              </div>
                              <div class="12u">
                                 <input name="pass" placeholder="password" type="password" />
                              </div>
                   
                              <div class="2u 12u" align="right" style ="color:red; float:right;">
                                 <ul class="actions">
                                    <li><input type="submit" value="이메일 검증번호 받기" data-toggle="modal" data-target="#findidModal"/></li>
                                 </ul>
                              </div>
                             
                           </div>
                        </form>
                     </section>
                  </div>
               </div>
               <div id="copyright" class="container">
                  <ul class="menu">
                     <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="#">FariMusic</a></li>
                  </ul>
               </div>
            </div>

      </div>

      <!-- Scripts -->

         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.dropotron.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
         
         
   <div class="modal fade" id="findidModal" role="dialog">
      <div class="modal-dialog modal-lg">
         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-body">
               <jsp:include page="/emailVerifyResult.jsp"></jsp:include>
            </div>
            <div class="modal-footer">
               <button>이메일 검증확인</button>
            </div>
         </div>

      </div>
   </div>

   </body>
</html>