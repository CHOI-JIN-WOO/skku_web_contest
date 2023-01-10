function fnCompareNo(sObj,eObj,msg){
	if( Number(sObj.val()) > Number(eObj.val()) ){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}

function fnCompareDate(sObj,eObj,msg){
	if( new Date(sObj.val()) > new Date(eObj.val()) ){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}

function fnValiCheck(obj,msg){
	console.log(obj);
	if( obj == undefined || obj.val().trim() == ''){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
		$('#modalschk').focus();
		return false;
	}
	return true;
}

function fnValiMinCheck(obj, msg, minLen){
	if( obj == undefined || obj.val().trim() == ''||obj.val().trim().length < minLen){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}

function fnConfirm(msg, callback){
	modal({
		type: 'confirm',
		title: '',
		text: ""+msg+"",
		callback: function(result) {
			callback(result);
		}
	});
	$("#modal-window").children().find(".modal-title > a").focus();
}

function fnModalMsg(msg, callback){
	modal({
		type: 'alert',
		title: '',
		text: ""+msg+"",
		callback: function(result) {
			if(typeof callback == 'function'){
				callback();
			}
		}
	});
	$("#modal-window").children().find(".modal-title > a").focus();
}

function fnValiEmail(obj, msg) {
	var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(!re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;
}

function fnValiEmailId(email,objId, msg) {
    var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var objId = $("#"+objId).val();
    
    if(!re.test(objId)){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;    
}

function fnValidPhone(obj, msg) {
    var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if(!re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;
}

function fnValiAlphabet(obj, msg) {
    var re = /[^a-zA-Z]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;
}

function fnValiDizit(obj, msg) {
    var re = /[^0-9]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;
}

function fnValiAlphaDizit(obj, msg) {
    var re = /[^a-zA-Z0-9]/;
    if(re.test(obj.val())){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
    	return false;
    }
    return true;
}

function passwordCheck(obj) {
	var passObj = obj
	var password = $(passObj).val();

    if(!/^[a-zA-Z0-9!@#$%^*()?_~\,\.\/\<\>\;\:\'\"\[\]\{\}\\\|\-\=\+]{9,14}$/.test(password)){
		modal({
			type: 'alert',
			title: '',
			text: "The password should include a number, English, and special letter with 9~14 digits.",
			callback: function(result) {
			}
		});    	
        return false;
    }
    
    if(/\s/g.test(password)){
		modal({
			type: 'alert',
			title: '',
			text: "You cannot use a blank with the password.",
			callback: function(result) {
			}
		});		
        return false;
    }
    
    var chk = 0;
    if(password.search(/[0-9]/g) != -1 ) chk ++;
    if(password.search(/[a-z]/ig)  != -1 ) chk ++;
    if(password.search(/[!@#$%^*()?_~\,\.\/\<\>\;\:\'\"\[\]\{\}\\\|\-\=\+]/g)  != -1  ) chk ++;
    if(chk < 3){
		modal({
			type: 'alert',
			title: '',
			text: "The password should include a number, English, and special letter with 9~14 digits.",
			callback: function(result) {
				//$(passObj).focus();
			}
		});
        return false;
    }
    return true;
};

function passwordCompare(pwdObj, pwdChkObj) {
	var pwd = pwdObj.val();
	var pwdChk = pwdChkObj.val();
	
	if(pwd != pwdChk) {
		modal({
			type : "alert",
			title : "",
			text : "The passwords are diffrent.",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}

function bthdyCheck(obj) {
	var brthdy = obj.val();
	var year = brthdy.substr(0, 4);
	var month = brthdy.substr(4, 2);
	var day = brthdy.substr(6, 2);
	
	if(year < "1901" || year > "2099" || month < "01" || month > "12" || day < "01" || day > "31") {
		modal({
			type : "alert",
			title : "",
			text : "Please check the date of birth",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}


function fnCheckboxChecked(obj,msg){
	if( obj == undefined || obj.prop('checked') == false){
		modal({
			type: 'alert',
			title: '',
			text: ""+msg+"",
			callback: function(result) {
			}
		});
		return false;
	}
	return true;
}

function onlyNum1(id) {
    $('#'+id).numeric({allow:"-"});
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}

function onlyNum2(id) {
    $('#'+id).numeric();
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}

function onlyNum2_class(classNm) {
    $('.'+classNm).numeric();
    $('.'+classNm).css("ime-mode","disabled");
    removeKorClass(classNm);
}

function onlyNumAlpha(id) {
    $('#'+id).numeric({allow:"abcdefghijklmnopqrstuvwxyz"});
    $('#'+id).css("ime-mode","disabled");
    removeKorId(id);
}

function removeKorClass(classNm){
	$('.'+classNm).keyup(function(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
            return;
        else
            event.target.value = event.target.value.replace(/[\ㄱ-ㅎㅏ-ㅣ|가-힣]/gi,'');
	});
}

function removeKorId(Id){
	$('#'+Id).keyup(function(event){
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
            return;
        else
            event.target.value = event.target.value.replace(/[\ㄱ-ㅎㅏ-ㅣ|가-힣]/gi,'');
	});
}

function ajaxSubmit(url, data, dataType, callback){
    $.ajax({
        url : url,
        data : data,
        dataType : dataType,
        type : 'POST',
        success : function(result) {
            callback(result);
        },
        error : function(e) {
            alert("error :" + e.responseText);
        }
    });
}

function fnHtml2CanvasDown(obj,fname){
	html2canvas(obj, {
		onrendered: function(canvas) {
			var img = canvas.toDataURL();	    
			var $a = $("<a>").attr("href", img).attr("download", 'fname').appendTo("body");
			$a[0].click();			
			$a.remove();
		}
	});
}