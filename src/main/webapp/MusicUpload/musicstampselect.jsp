<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <title>MusicStamp</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="/css/main.css" />
      
 
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
                           <h2>���Ǽ���</h2>
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
                        <form method="post" name="authenform" action="/FairMusic/stampselect">
                           <div class="row 50%">
                          
                          		<input type="text" name ="musicName">
                   				<div class="12u">
                   				����  : ${musicName}<br/>
                              ������ �ؽ��� �� : ${musicHash}<br/>
                         ���ü�� ���Ե� �����ؽ� �� :      ${txId}<br/>
      
                           ���ε� Ƚ�� :  ${Confirmations}<br/>
             ���ü�ο� ���Ե� �ð�:     ${msg}   ${Timestamp} 
                             
      
              
                  
                              </div>
                              <div class="2u 12u" align="right" style ="color:red; float:right;">
                                 <ul class="actions">
                                    <li><input type="submit" value="���ε�"/></li>
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

   </body>
</html>