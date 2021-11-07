
	function pw_ck(){
		const target = document.getElementById("register_btn");

		var p1 = document.getElementById("password").value;
		var p2 = document.getElementById("password_confirm").value;
		
		if(p1 == p2){
			target.disabled=false;
			target.style.backgroundColor='blue';
			target.style.cursor='pointer';
			alert("비밀번호가 일치합니다.");
			}
		else {
			target.disabled=true;
			alert("비밀번호가 일치하지 않습니다.");
		}
	}

//	function checkpw(){
//	const target = document.getElementById("login_btn");
//	var p1 = document.getElementById("password").value;
//	var p2 = document.getElementById("password_confirm").value;
//	
//	if(p1 != p2) { 
//		//target.disabled = true; 
//		pw_ck = false;
//		}
//	else { 
//		//target.disabled = false;
//		pw_ck = true; 
//		}
//	
//	if(pw_ck && id_ck) target.disabled=false;
//	else target.disabled=true;
//}