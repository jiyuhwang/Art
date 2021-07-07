<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.badge {
	display: inline-block;
	min-width: 10px;
	padding: 4px 7px;
	font-size: 12px;
	font-weight: 550;
	line-height: 1;
	color: #2f2f2f;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	background-color: #ececec;
	border-radius: 5px;
	margin-right: 8px;
}
.bootstrap-tagsinput{	
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	
}

.xClass{
	font-size: 10px;
	color: #777;
	margin-left: 4px;
	cursor: pointer;
	padding: 3px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
  		function enterValue(){
  			
  			var tagSpan = document.createElement('span');
  			var x = document.createElement('span');	
  			var xMark = 'x';
  			var result = document.getElementById('tag');
  			var input = document.getElementById('tagId');
  			tagSpan.className='badge';
  			x.setAttribute( 'onclick', 'removeTag()' );
  			x.className='xClass';

  					
  			var content =  document.getElementById('tagId');
  			var string = content.value;
  			var string2 = string.trim();
  			var string3 = string2.replace("," , "");
  			
  			
  			
  			if(string3 !== ""){
  				tagSpan.append(string3);  
  	  			x.append(xMark);
  	  			tagSpan.append(x);
  	  			result.append(tagSpan);  			
  	  			input.value = null;		
  			}else if(string3 == string){}
 
  		}
  		
  		function removeTag(){
  			var listSpan = document.getElementById("tag");
  			listSpan.removeChild(listSpan.childNodes[0]);
  		}
  		</script>
</head>
<body>
<input id="tagId" type="text" name="post_tag" class="form-control"  placeholder="Tags,"  onkeyup="if(window.event.keyCode==13||window.event.keyCode==32||window.event.keyCode==188){(enterValue())}"/>
<div id="tag" class="bootstrap-tagsinput"></div>
</body>
</html>