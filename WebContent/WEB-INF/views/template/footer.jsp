</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/toastr.min.js"></script>
<script src="${pageContext.request.contextPath}/particles.js"></script>
<script src="${pageContext.request.contextPath}/particleApp.js"></script>
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
	});
</script>
</html>