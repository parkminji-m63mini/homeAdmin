
function copy(num, msg){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = num;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert(msg);
}

function ltype(){
	//ajax 구현
}

function htype(){
	//ajax 구현
}

// 코드 셀렉트 박스로 가져오기
//링크 제대로 안잡혀서 못씀
/*
function selectCode(cd){
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  cd : cd
			}
			,url :"${contextPath}/my/code.do"
			,success : listGo  
			,error : function(result) { alert(result + "실패"); }
		});
	}
	function listGo(msg) { 
		$("#ListFrm").html(msg);	
	}
	
// 세번째 코드 테이블 코드 가져오기
	function selectCode3(scd,cd){
		
		
		$.ajaxSettings.traditional = true;
			$.ajax({
				type : "post"
				,dataType : "html"
				,data :{
				  scd : scd,
				  cd : cd				  
				}
				,url :"${contextPath}/my/code3.do"
				,success : listGo  
				,error : function(result) { alert(result + "실패"); }
			});
		}
		function listGo(msg) { 
			$("#ListFrm").html(msg);	
			
		}	
*/
		
function reload() { (location || window.location || document.location).reload(); }		
