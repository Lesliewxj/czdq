(function(a){
	a.fn.hoverClass=function(b){
		var a=this;
		a.each(function(c){
			a.eq(c).hover(function(){
				$(this).addClass(b)
			},function(){
				$(this).removeClass(b)
			})
		});
		return a
	};
})(jQuery);

$(function(){
	$(".nav li,.scrollbox li,.product li").hoverClass("current");
});

function addToFavorite(){
	var d="http://www.jsfoot.com/";
	var c="";
	if(document.all){
		window.external.AddFavorite(d,c);
	}else{
		if(window.sidebar){
			window.sidebar.addPanel(c,d,"");
		}else{
			alert("");
		}
	}
}

function SetHome(obj){
	try{
		obj.style.behavior='url(#default#homepage)';
		obj.setHomePage('http://www.jsfoot.com/');
	}catch(e){
		if(window.netscape){
			try{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}catch(e){
				alert("");
			};
		}else{
			alert("");
		};
	};
};