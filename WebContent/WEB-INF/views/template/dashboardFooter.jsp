</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap.js"></script>
<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
	toastr.options = {
	  "closeButton": true,
	  "newestOnTop": false,
	  "progressBar": true,
	  "positionClass": "toast-top-right",
	  "preventDuplicates": false,
	  "onclick": null,
	  "showDuration": "300",
	  "hideDuration": "1000",
	  "timeOut": "5000",
	  "extendedTimeOut": "1000",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	};
	let is_success = "${is_success}";
	$(document).ready(function(){
		if(is_success === "1"){
			toastr.success("${message}");	
		}
		else if (is_success === "0") {
			toastr.error("${message}");	
		}
		$('#dataTable').DataTable();
	});
</script>
<%
String sessionUserId = (String)session.getAttribute("user_id");
%>
<script>
$(document).ready(function(){
	let sessionUserId = "<%= sessionUserId %>";
	console.log("sessionUserId", sessionUserId)
	if(sessionUserId == "null"){
		window.location.href = "<%= request.getContextPath() %>/logout";
	}
});

let delete_query = "";
let delete_id = "";
$(document).on("click", ".deleteRecord", function(e) {  
	e.preventDefault();
	deleteQuery = $(this).attr("href");
	delete_id = $(this).attr("data-aspectid");
	$("#deleteModal").modal('show');
});

$(document).on("click", ".confirm-delete", function(e) {  
	e.preventDefault();
	$("#preloader").addClass("show");
	$.ajax({
		url: "http://localhost:8080"+deleteQuery,
		success: function(result){
			toastr.success("Successfully Deleted!")
			$("#deleteModal").modal('hide');
			$("#preloader").removeClass("show");
			$("#ascpt-"+delete_id).remove();
		},
		error: function(err){
			toastr.error(err);
			$("#deleteModal").modal('hide');
			$("#preloader").removeClass("show");
		}
	})
});

$(document).on("click", ".editScore", function(e) {  
	e.preventDefault();
	const goUrl = $(this).attr("href");
	$("#preloader").addClass("show");
	$.ajax({
		url: "http://localhost:8080"+goUrl,
		success: function(result){
			$("#scoreDetails").html(result);
			$("#scoreModal").modal('show');
			$("#preloader").removeClass("show");
		},
		error: function(err){
			toastr.error(err);
			$("#preloader").removeClass("show");
		}
	})
});
$("body").on("change", ".changeScore", function(e) {
	e.preventDefault();
	const userId = $(this).attr("data-userid");
	const aspectId = $(this).attr("data-aspectid");
	const newScore = $(this).val();
	const newUrl = "/ProjectEvaluator/updateScore?userid="+userId+"&score="+newScore+"&aspectid="+aspectId;
    $.ajax({
        url: "http://localhost:8080"+newUrl,
        success: function(response) {
        	if(response == '1'){
        		toastr.success("Score has been updated!");
        		$(".updatedMessage").addClass("show");
        		$("#clickToRefresh").show();
        	}
        	else {
        		toastr.error("Something went wrong!");
        	}
        	setTimeout(()=>{
        		/* location.reload(); */
        	}, 3000)
        },
        error: function(err) {
        	toastr.error(err);
        }
    });
});
$("body").on("click", "#clickToRefresh", function(e) {
	e.preventDefault();
	location.reload();
});

</script>
</html>