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
$(document).on("click", ".editScore", function(e) {  
	e.preventDefault();
	const goUrl = $(this).attr("href");
	$.ajax({url: "http://localhost:8080"+goUrl, 
		success: function(result){
			console.log(result)
			$("#scoreDetails").html(result);
			$("#scoreModal").modal('show');
			setTimeout(()=>{
				$("#scoreDetails").DataTable();
			}, 100)
		}
	})
});

</script>
</html>