<%@page import="com.predict.entity.UserAuthorPublisherRatingEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.ArrayList,com.predict.entity.BookEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>SEARCH</title>
    <style>
body 
{
        
background-color: #EAEAEA;
        color: inherit;
    font-family: "Helvetica Neue"
}
</style> 
<script type="text/javascript" src="figue.js"></script>
<script>
// By Simon Sarris
// www.simonsarris.com
// sarris@acm.org
//
// Last update December 2011
//
// Free to use and distribute at will
// So long as you are nice to people, etc

// Constructor for Shape objects to hold data for all drawn objects.
// For now they will just be defined as rectangles.
var data = [ 
      {'company': 'c1' , 'size': 71259, 'revenue': 60420},
      {'company': 'c2' , 'size': 100000, 'revenue': 98787},
      {'company': 'c3' , 'size': 9000, 'revenue': 7160},
      {'company': 'c4' , 'size': 18000, 'revenue': 11567},
      {'company': 'c5' , 'size': 94000 , 'revenue': 6426 },
      {'company': 'c6' , 'size': 45000, 'revenue': 8700}
   ] ;
<jsp:useBean id="users" class="com.predict.entity.UserAuthorPublisherRatingEntity" scope="page">

</jsp:useBean>
var Author=[];
var Publisher=[];
<% String bookTitle1=request.getParameter("bookTitle");
   ArrayList<UserAuthorPublisherRatingEntity> usersList0=users.retriveRows();
%>
<% for(int i=0;i<usersList0.size()/20;i++){%>
Author[<%=i%>]=<%=usersList0.get(i).getBookAuthorWeightedValue()%>;
Publisher[<%=i%>]=<%=usersList0.get(i).getPublisherWeightedValue()%>;
<%}%>


document.write("Hello World!");
document.write(Author[0]);
document.write(Publisher[0]);
document.write(data[0]['size']);
var arr={};
arr[0]="cool";
arr[1]="asdf";
function Shape(x, y, w, h, fill) {
  // This is a very simple and unsafe constructor. All we're doing is checking if the values exist.
  // "x || 0" just means "if there is a value for x, use that. Otherwise use 0."
  // But we aren't checking anything else! We could put "Lalala" for the value of x 
  this.x = x || 0;
  this.y = y || 0;
  this.w = w || 1;
  this.h = h || 1;
  this.fill = fill || '#AAAAAA';
}

// Draws this shape to a given context
Shape.prototype.draw = function(ctx) {
  ctx.fillStyle = this.fill;
  ctx.fillRect(this.x, this.y, this.w, this.h);
}

// Determine if a point is inside the shape's bounds
Shape.prototype.contains = function(mx, my) {
  // All we have to do is make sure the Mouse X,Y fall in the area between
  // the shape's X and (X + Height) and its Y and (Y + Height)
  return  (this.x <= mx) && (this.x + this.w >= mx) &&
          (this.y <= my) && (this.y + this.h >= my);
}

function CanvasState(canvas) {
  // **** First some setup! ****
  
  this.canvas = canvas;
  this.width = canvas.width;
  this.height = canvas.height;
  this.ctx = canvas.getContext('2d');
  // This complicates things a little but but fixes mouse co-ordinate problems
  // when there's a border or padding. See getMouse for more detail
  var stylePaddingLeft, stylePaddingTop, styleBorderLeft, styleBorderTop;
  if (document.defaultView && document.defaultView.getComputedStyle) {
    this.stylePaddingLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingLeft'], 10)      || 0;
    this.stylePaddingTop  = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingTop'], 10)       || 0;
    this.styleBorderLeft  = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderLeftWidth'], 10)  || 0;
    this.styleBorderTop   = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderTopWidth'], 10)   || 0;
  }
  // Some pages have fixed-position bars (like the stumbleupon bar) at the top or left of the page
  // They will mess up mouse coordinates and this fixes that
  var html = document.body.parentNode;
  this.htmlTop = html.offsetTop;
  this.htmlLeft = html.offsetLeft;

  // **** Keep track of state! ****
  
  this.valid = false; // when set to false, the canvas will redraw everything
  this.shapes = [];  // the collection of things to be drawn
  
  this.dragging = false; // Keep track of when we are dragging
  // the current selected object. In the future we could turn this into an array for multiple selection
  this.selection = null;
  this.dragoffx = 0; // See mousedown and mousemove events for explanation
  this.dragoffy = 0;
  
  // **** Then events! ****
  
  // This is an example of a closure!
  // Right here "this" means the CanvasState. But we are making events on the Canvas itself,
  // and when the events are fired on the canvas the variable "this" is going to mean the canvas!
  // Since we still want to use this particular CanvasState in the events we have to save a reference to it.
  // This is our reference!
  var myState = this;
  
  //fixes a problem where double clicking causes text to get selected on the canvas
  canvas.addEventListener('selectstart', function(e) { e.preventDefault(); return false; }, false);
  // Up, down, and move are for dragging
  canvas.addEventListener('mousedown', function(e) {
    var mouse = myState.getMouse(e);
    var mx = mouse.x;
    var my = mouse.y;
    var shapes = myState.shapes;
    var l = shapes.length;
    for (var i = l-1; i >= 0; i--) {
      if (shapes[i].contains(mx, my)) {
        var mySel = shapes[i];
		
		//document.getElementById('disp').value=arr[i];
		var oTable = document.getElementById('dynamicTable');
		var oCells = oTable.rows.item(0).cells;
		if(i<data.length)
			{
				oCells.item(1).innerHTML=data[i]['revenue'];
				oCells.item(0).innerHTML=data[i]['size'];
			}
			else
			{
				oCells.item(1).innerHTML=my*1000;
				oCells.item(0).innerHTML=mx*1000;
			}
		
        // Keep track of where in the object we clicked
        // so we can move it smoothly (see mousemove)
        myState.dragoffx = mx - mySel.x;
        myState.dragoffy = my - mySel.y;
        myState.dragging = true;
        myState.selection = mySel;
        myState.valid = false;
        return;
      }
    }
    // havent returned means we have failed to select anything.
    // If there was an object selected, we deselect it
    if (myState.selection) {
      myState.selection = null;
      myState.valid = false; // Need to clear the old selection border
    }
  }, true);
  canvas.addEventListener('mousemove', function(e) {
    if (myState.dragging){
      var mouse = myState.getMouse(e);
      // We don't want to drag the object by its top-left corner, we want to drag it
      // from where we clicked. Thats why we saved the offset and use it here
      myState.selection.x = mouse.x - myState.dragoffx;
      myState.selection.y = mouse.y - myState.dragoffy;   
      myState.valid = false; // Something's dragging so we must redraw
    }
  }, true);
  canvas.addEventListener('mouseup', function(e) {
    myState.dragging = false;
  }, true);
  // double click for making new shapes
  canvas.addEventListener('dblclick', function(e) {
    var mouse = myState.getMouse(e);
    myState.addShape(new Shape(mouse.x - 10, mouse.y - 10, 5, 5, 'rgba(0,255,0,.6)'));
  }, true);
  
  // **** Options! ****
  
  this.selectionColor = '#CC0000';
  this.selectionWidth = 2;  
  this.interval = 30;
  setInterval(function() { myState.draw(); }, myState.interval);
}

CanvasState.prototype.addShape = function(shape) {
  this.shapes.push(shape);
  this.valid = false;
}

CanvasState.prototype.clear = function() {
  this.ctx.clearRect(0, 0, this.width, this.height);
}

// While draw is called as often as the INTERVAL variable demands,
// It only ever does something if the canvas gets invalidated by our code
CanvasState.prototype.draw = function() {
  // if our state is invalid, redraw and validate!
  if (!this.valid) {
    var ctx = this.ctx;
    var shapes = this.shapes;
    this.clear();
    
    // ** Add stuff you want drawn in the background all the time here **
    
    // draw all shapes
    var l = shapes.length;
    for (var i = 0; i < l; i++) {
      var shape = shapes[i];
      // We can skip the drawing of elements that have moved off the screen:
      if (shape.x > this.width || shape.y > this.height ||
          shape.x + shape.w < 0 || shape.y + shape.h < 0) continue;
      shapes[i].draw(ctx);
    }
    
    // draw selection
    // right now this is just a stroke along the edge of the selected Shape
    if (this.selection != null) {
      ctx.strokeStyle = this.selectionColor;
      ctx.lineWidth = this.selectionWidth;
      var mySel = this.selection;
      ctx.strokeRect(mySel.x,mySel.y,mySel.w,mySel.h);
    }
    
    // ** Add stuff you want drawn on top all the time here **
    
    this.valid = true;
  }
}


// Creates an object with x and y defined, set to the mouse position relative to the state's canvas
// If you wanna be super-correct this can be tricky, we have to worry about padding and borders
CanvasState.prototype.getMouse = function(e) {
  var element = this.canvas, offsetX = 0, offsetY = 0, mx, my;
  
  // Compute the total offset
  if (element.offsetParent !== undefined) {
    do {
      offsetX += element.offsetLeft;
      offsetY += element.offsetTop;
    } while ((element = element.offsetParent));
  }

  // Add padding and border style widths to offset
  // Also add the <html> offsets in case there's a position:fixed bar
  offsetX += this.stylePaddingLeft + this.styleBorderLeft + this.htmlLeft;
  offsetY += this.stylePaddingTop + this.styleBorderTop + this.htmlTop;

  mx = e.pageX - offsetX;
  my = e.pageY - offsetY;
  
  // We return a simple javascript object (a hash) with x and y defined
  return {x: mx, y: my};
}

// If you dont want to use <body onLoad='init()'>
// You could uncomment this init() reference and place the script reference inside the body tag
//init();

function init() {
  var s = new CanvasState(document.getElementById('canvas1'));
  
  
  s.addShape(new Shape(10,10,10,4,'blue'));

  // Create the labels and the vectors describing the data

  var labels = new Array ;
  var vectors = new Array ;
  for (var i = 0 ; i < data.length ; i++) {
      labels[i] = data[i]['company'] ;
      vectors[i] = [ data[i]['size'] , data[i]['revenue']] ;
  }

  var clusters = figue.kmeans(4, vectors) ;

  var txt ;
  if (clusters) {
    txt = "<table border='1'>" ;
    txt += "<tr><th>Label</th><th>Vector</th><th>Cluster id</th><th>Cluster centroid</th</tr>";

    for (var i = 0 ; i < vectors.length ; i++) {
      var index = clusters.assignments[i] ;
      txt += "<tr><td>" + labels[i] + "</td><td>" + vectors[i] + "</td><td>" + index + "</td><td>" + clusters.centroids[index] + "</td></tr>";
	  color='';
	   sw = clusters.assignments[i]%4;
       if(sw==0)
	   {
			color='orange';
	   }
	   else if(sw==1)
	   {
			color='yellow';
	   }
	   else if(sw==2)
	   {
			color='green';
	   }
	   else
	   {
			color='blue';
	   }
       s.addShape(new Shape(Author[i]*10,Publisher[i]*10,4,4,color)); // The default is gray
    }
    txt += "</table>"
  } else 
    txt = "No result (too many clusters/too few different instances (try changing K)" ;
  
  document.getElementById('mypre').innerHTML = txt;
  for (var i = 0 ; i <= data.length ; i++) {
       
       
  }

 
  
}
</script>
<script>
 function load()
 {
	 document.getElementById("details").style.display = "none";
	 init();
 }
function getTableValue(i,j)
{
 var oTable = document.getElementById('books');
 //gets table
 var oCells = oTable.rows.item(i).cells;
    return oCells.item(j).innerHTML;
 /* var rowLength = oTable.rows.length;
 //gets rows of table

 for (i = 0; i < rowLength; i++){
 //loops through rows

    var oCells = oTable.rows.item(i).cells;
    //gets cells of current row
    var cellLength = oCells.length;
        for(var j = 0; j < cellLength; j++){
        //loops through each cell in current row
           <!--get your cell info here-->
           var cellVal = oCells.item(j).innerHTML;
           alert(cellVal);
        }
 } */

}
function plotCanvas()
{
	var c=document.getElementById("myCanvas");
	var ctx=c.getContext("2d");
	ctx.beginPath();
	/*ctx.moveTo(0,0);
	ctx.lineTo(10,20);*/
	for(i=0;i<10;i++)
	{ 
		
				ctx.moveTo((Number(getTableValue(i,0).trim())%300),(Number(getTableValue(i,5).trim())%150));
				ctx.lineTo((Number(getTableValue(i,0).trim())%300)+1,(Number(getTableValue(i,5).trim())%150)+3);
				
			
		
	}
	ctx.stroke();
	alert(getTableValue(0,5));
}
 function toggle()
 {
	//plotCanvas();
   if(document.getElementById("books").style.display == "none")
	   {
    	document.getElementById("books").style.display = "block";
		document.getElementById("details").style.display = "none";
	   }
     else
        {
         document.getElementById("books").style.display = "none";
		 document.getElementById("details").style.display = "block";
       }
 }
</script></head>
<body onload="load()"><span style="font-family: American Typewriter;"> </span>
<h6>This Application is in preliminary development stage</h6>
<h6> Click on the Results to toggle between cluster view and the results </h6>
<h6> click on the plots to drag</h6>
    <div style="text-align: center;"><span style="font-family: American Typewriter;"><br>
      </span> </div>
    <span style="font-family: American Typewriter;"> </span>
    <div style="text-align: center;"><span style="font-family: American Typewriter;">&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <br>
      </span> <span style="font-family: American Typewriter;"><br>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br>
        Please enter the book name:<br>
      </span> <span style="font-family: American Typewriter;"><br>
        &nbsp;
        <form method="post" action="BookSearch.jsp">
        <input style="font-family: American Typewriter;" value="Book name" name="bookTitle"/>
          &nbsp;&nbsp;&nbsp;
        <br><br>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <span style="color: #ccffff;"><br>
          <span style="font-family: American Typewriter;"><input value="search"
              name="search"
              type="submit"></span></span></span></div>
       </form>
       <jsp:useBean id="Book" class="com.predict.entity.BookEntity" scope="page">
       
       </jsp:useBean>
      <table id="details">
      	<tr>
      		<td onclick="toggle()">empty</td>
      		<td onclick="toggle()"><canvas id="canvas1" width="500" height="600">This Text is Displayed if the browser does not support canvas.</canvas><table id="dynamicTable">
<tr>
	<td><p>Label1:</p></td>
	<td><p>Value1</p></td>
</tr>
<tr>
	<td><p>Label2:</p></td>
	<td><p>Value2</p></td>
</tr>
</table>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<pre id="mypre"></pre>
<br/>
<br/>
<input type="text" id="disp"></input>
      		</td>
      	</tr>
      </table>
       <%
       String bookTitle=request.getParameter("bookTitle");
       ArrayList<BookEntity> BooksList=Book.retriveBooks("%"+bookTitle+"%");
        pageContext.setAttribute("BookList", BooksList);//this will make the booklist accesible to the jstl in the page
       	 String str="%ary%";%>
       	 <!-- replacing all anchors with empty i.e <a> and </a> with empty -->
       <table id="books">
       <c:forEach var="outputItem" items="${pageScope.BookList}">
        <c:out value="<tr>" escapeXml="false" />
 		<c:set var="search" value='\'' />
		<c:set var="replace" value='\"' />
		<c:set var="left" value='\<'/>
		<c:set var="right" value='\>'/>
		<c:set var="anchor" value=""/>
		<c:set var="modified" value="${fn:replace(anchor, 
                                search, replace)}" />
        
        <c:set var="final" value="${modified}"></c:set>
        <c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
        <c:out value="${final}"  escapeXml='false'></c:out> 
		<c:out value="${outputItem.getISBN()}"></c:out>
		
		<c:out value="</td>" escapeXml="false"></c:out>
		<c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
		<c:out value="${final}"  escapeXml='false'></c:out> 
 		<c:out value="${outputItem.getBookTitle()}"></c:out>
		
		<c:out value="</td>" escapeXml="false"></c:out>
		<c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
		<c:out value="${final}"  escapeXml='false'></c:out>
		<c:out value="${outputItem.getBookAuthor()}"></c:out>
		
		<c:out value="</td>" escapeXml="false"></c:out>
		<c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
		<c:out value="${final}"  escapeXml='false'></c:out> 
		<c:out value="${outputItem.getPublisher()}"></c:out>
		
		<c:out value="</td>" escapeXml="false"></c:out>
		<c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
		<c:out value="${final}"  escapeXml='false'></c:out> 
		
		<c:out value="</td>" escapeXml="false"></c:out>
		<c:out value="<td onclick='toggle()'>" escapeXml="false"></c:out>
		<c:out value="${final}"  escapeXml='false'></c:out> 
		<c:out value="${outputItem.getYearOfPublication()}"></c:out>
		
		<c:out value="</td>" escapeXml="false"></c:out>
		
		<c:out value="</tr>" escapeXml="false"></c:out>
	   </c:forEach>
	  </table>
    <span style="font-family: American Typewriter;"> </span>
  </body>
</html>


