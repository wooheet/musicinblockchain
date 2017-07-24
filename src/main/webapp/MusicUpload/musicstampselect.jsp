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
                           <h2>음악선택</h2>
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
                   				제목  : ${musicName}<br/>
                              음악이 해쉬된 값 : ${musicHash}<br/>
                         블록체인 삽입된 음악해쉬 값 :      ${txId}<br/>
      
                           승인된 횟수 :  ${Confirmations}<br/>
             블록체인에 삽입된 시간:     ${msg}   ${Timestamp} 
                             
      
              
                  
                              </div>
                              <div class="2u 12u" align="right" style ="color:red; float:right;">
                                 <ul class="actions">
                                    <li><input type="submit" value="업로드"/></li>
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