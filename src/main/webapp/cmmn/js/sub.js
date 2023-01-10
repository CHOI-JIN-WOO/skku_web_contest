/*
 ★ Coding By DumiCode
 ★ homepage: http://www.dumicode.com
*/
$(function(){
	//FAQ
	$(".toggle_list .q a").click(function(){
		$(".toggle_list ul li").not($(this).parents("li")).removeClass("open");
		$(this).parents("li").toggleClass("open");
		return false;
	});

	//신용용어 사전 버튼클릭
	$(".key_button").click(function(){
		$(".key_button").not($(this)).removeClass("active");
		$(this).addClass("active");
	});
	//신용용어 사전 단어클릭
	$(".vws_cont .vws_result li a").click(function(){
		$(".vws_cont .vws_result li").removeClass("active");
		$(this).parents("li").addClass("active");
	});


});

//add,del FILE
var liFileID = 1; //개별ID
function addFile(ts) {
	//최대 5개 추가
	if($(".bw_file li").length < 5)
	{
		liFileID++;
		var fileLi = "";
		fileLi += '<li>';
		fileLi += '<button class="btn_graybg02" onclick="$(\'#fileF_' + liFileID + '\').click();">파일찾기</button>';
		fileLi += '<input type="file" id="fileF_' + liFileID + '" title="파일을 선택하세요." tabindex="-1" class="alt_text" onchange="$(\'#fileNM_' + liFileID + '\').val($(this).val());" />';
		fileLi += '<input type="text" id="fileNM_' + liFileID + '" aria-hidden="true" tabindex="-1" class="text" title="선택된 파일명입니다." readonly="readonly" />';
		fileLi += '<div class="ctl">';
		fileLi += '	<button class="file_add" onclick="addFile(this);"><span class="alt_text">첨부파일</span>추가</button>';
		fileLi += '	<button class="file_del" onclick="delFile(this);"><span class="alt_text">첨부파일</span>삭제</button>';
		fileLi += '</div>'
		fileLi += '</li>';

		$(ts).parents("li").after(fileLi);
	}
	else
	{
		alert("최대 5개까지 첨부할수 있습니다.")
	}

}

function delFile(ts) {
	//최소 1개 보유
	if($(".bw_file li").length > 1)
	{
		$(ts).parents("li").remove();
	}
	else
	{
		alert("삭제불가");
	}

}
