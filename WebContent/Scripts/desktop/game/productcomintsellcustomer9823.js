var page_g_pl = 1;
var rownumber_g_pl = 10;
var total = 0;

function LoadDefault_Game_LuckyDraw() {
    $(".listcustomer").fancybox({
        'width': 830,
        'height': 535,
        'transitionIn': 'none',
        'transitionOut': 'none',
        helpers: {
            overlay: {
                closeClick: false
            }
        },
        'margin': 0,
        'padding': 0,
        beforeShow: function () {
            $("body").css({ 'overflow-y': 'hidden' });
        },
        afterClose: function () {
            $("body").css({ 'overflow-y': 'visible' });
        }
    });
    $("a.listcustomer").click();
    $('[id$=g-pl-bs]').click(function () {
        page_g_pl = 0;
        total = 0;
        $(".g-gl-total").html("");
        $("#g-pl-sr table tr.tritem").remove();
        $('#g-pl-sr').hide();
        $('.g-pl-loading').show();
        $('.control').hide();
        SearchLuckyDraw();
    });
    $(".g-gl-more").click(function () {
        $(".g-gl-more").hide();
        $(".g-pl-loading-more").show();
        SearchLuckyDraw();
    });
}

var LoadLuckyDraw_FLAG_CALL = true;
function LoadLuckyDraw(f, p, r) {
    if (LoadLuckyDraw_FLAG_CALL == false)
        return;
    LoadLuckyDraw_FLAG_CALL = false;
    $.ajax({
        type: "GET",
        cache: false,
        data: { intProductID: productID, intCategoryID: cateID, filter: f, pageindex: p, rownumber: r },
        url: "/aj/Game/ProductComingSellCustomerPaging",
        beforeSend: function () {
            if (p == 0) {
                $('#g-pl-sr').hide();
                $('.g-pl-loading').show();
                $('.control').hide();
            }
        },
        success: function (args) {
            LoadLuckyDraw_FLAG_CALL = true;
            $("#g-pl-sr table table").append(args);
            if (p == 0) {
                $('#g-pl-sr').show();
                $('.g-pl-loading').hide();
                $('.control').show();
                $(".g-pl-loading-more").hide();
            }
            else {
                $(".g-gl-more").show();
                $(".g-pl-loading-more").hide();
            }
            var total = $(args).find('.totalcurrent').text();
            if (total > 0)
                $(".g-gl-more").show();
            else
                $(".g-gl-more").hide();
            page_g_pl++;
        },
        error: function (e) {
            LoadLuckyDraw_FLAG_CALL = true;
        }
    });
}

function SearchLuckyDraw() {
    var filter = document.getElementById('g-pl-sf').value;
    LoadLuckyDraw(filter, page_g_pl, rownumber_g_pl);
    return true;
}

function SearchRegisteredLuckyDrawKeydown(evt) {

    var keyCode = evt ? (evt.which ? evt.which : evt.keyCode) : event.keyCode;
    if (keyCode == 13) {
        $("#g-pl-bs").click();
        return false;
    }
}