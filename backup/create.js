$("#comments").append('<%= escape_javascript(render(:partial => @comment)) %>');
$(".comment:last").fadeIn();
$(".comment:last").effect("highlight");