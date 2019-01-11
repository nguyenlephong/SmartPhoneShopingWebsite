$(window).load(function () {
    // load comment 
    $(window).scroll(function () {
        LoadJsComment();
    });
})

var flsc = false;
function LoadJsComment() {
    if (flsc == true) return;
    if (typeof cmtaddcommentclick == 'undefined') {
        //Chỉ load một lần thôi
        flsc = true;
        var tgddc = document.createElement('script');
        tgddc.type = 'text/javascript';
        tgddc.async = true;
        tgddc.src = jsCommentUrl;
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(tgddc);

        setTimeout(function () {
            InitEvent();
        }, 800);
    }
}