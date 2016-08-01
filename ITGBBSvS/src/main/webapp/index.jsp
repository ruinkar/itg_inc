<script>
var cmd2move= [
	"/review/list.do",
    "/free/list.do",
    "/rank.do",
    "/evinfo/list.do"
    ];
location.href = "${pageContext.request.contextPath}" + cmd2move[1];
</script>
