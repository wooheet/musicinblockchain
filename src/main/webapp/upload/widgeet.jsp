<!doctype html>
   <head>
      <meta charset="utf-8">
      <title>jQuery UI Widget - Default functionality</title>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <script>
         $(function() {
            $.widget("iP.myButton", {
               _create: function() { 
                  this._button = $("<button>") ; 
                  this._button.text("My first Widget Button") ;
                  this._button.width(this.options.width) 
                  this._button.css("background-color", this.options.color) ;    
                  this._button.css("position", "absolute") ;   
                  this._button.css("left", "100px") ;            
                  $(this.element) .append(this._button);
               },
               move: function(dx) { 
                  var x = dx+parseInt(this._button.css("left") ); 
                  this._button.css("left", x) ; 
                  if(x>400) { this._trigger("outbounds",{},  {position:x}) ; }
               }
            });
            $("#button4") .myButton();
            $("#button4") .on("mybuttonoutbounds", function(e, ui) {
               alert("out") ;
            });
            $("#button4") .myButton("move", 500);
         });
      </script>
   </head>
   <body>
      <div id="button4"></div>
   </body>
</html>