<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Jsp page sample</title>
<script src="/js/jquery.min.js"></script>
<script language="javascript">
    function exceldown_type1() {
        $.ajax({
            url: '/exceldown/v1/car',
            type: 'GET',
            success: function(data) {
                $("#fileDownload").find("[id=filePath]").val(data.filepath);
                $("#fileDownload").submit();
            },
            error: function(xhr, textStatus, errorThrown) {
                alert("textStatus : "+textStatus);
            }
        });
    }

    function exceldown_type2() {
        location.href = '/exceldown/v2/car';
    }

    function exceldown_type3() {
        $.ajax({
            url: '/exceldown/v3/car',
            type: 'GET',
            success: function(data) {
                $("#fileDownload").find("[id=filePath]").val(data.filepath);
                $("#fileDownload").submit();
            },
            error: function(xhr, textStatus, errorThrown) {
                alert("textStatus : "+textStatus);
            }
        });
    }

</script>
</head>
<body>


    <!-- 엑셀 다운로드 할때 스피너 처리를 위한 코드 -->
	<div class="text-center" id="fontSpinner" style="display:none">
		<div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1">
		    <div class="modal-dialog modal-sm d-flex flex-column align-items-center justify-content-center">
		        <div class="row">
                    <div class="spinner-border" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div class="row">
                    <strong>다운로드 준비중 입니다.<br/>데이터량에 따라 다운로드 시간이 늦어질 수 있습니다.<br/>잠시만 기다려 주십시오. (1만건 기준 약 15초)</strong>
                </div>
	       </div>
	   </div>
    </div>

	<div>
	    <ul>

	        <li><a href="javascript:exceldown_type2()">
	                <span>excel download sample v2 (추상화)</span>
	            </a></li>

	        <li><a href="javascript:exceldown_type1()">
	                <span>excel download sample v2 (추상화,서버생성,ajax down)</span>
	                </a>
	            </li>

	        <li><a href="javascript:exceldown_type3()">
	                <span>excel download sample type3</span>
	            </a></li>


	    </ul>
	</div>

    <form id="fileDownload" name="fileDownload" action="/download/file" method="get">
        <input type="hidden" id="filePath" name="filePath">
    </form>
</body>
</html>
