var page_g_pl = 2;
var rownumber_g_pl = 10;
var total = 0;
var IsWin = 0;

function LoadDefault_Game_LuckyDraw() {
    $(".listcustomer").fancybox({
        'width': 830,
        'height': 535,
        'autoScale': false,
        'transitionIn': 'none',
        'transitionOut': 'none',
        'showCloseButton': false,
        'autoScale': false,
        'margin': 0,
        'padding': 0
    });
    $("a.listcustomer").click();
    $('[id$=g-pl-bs]').click(function () {
        page_g_pl = 1;
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

function LoadDefaultLuckyDraw() {
    $('#g-pl-sf').val('');
    $("#g-pl-sr table table").html('');
    $(".g-gl-total").html('');
    page_g_pl = 1;
    total = 0;
    var filter = document.getElementById('g-pl-sf').value;
    LoadLuckyDraw(filter, page_g_pl, rownumber_g_pl);
    return true;
}

var LoadLuckyDraw_FLAG_CALL = true;
function LoadLuckyDraw(f, p, r) {
    if (LoadLuckyDraw_FLAG_CALL == false)
        return;
    LoadLuckyDraw_FLAG_CALL = false;
    if ($('#cbSMS').length == 1) {
        if ($('#cbSMS').is(":checked"))
            IsWin = 1;
        else
            IsWin = 0;
    }
    $.ajax({
        type: "GET",
        cache: false,
        data: { intProductID: productID, intCategoryID: cateID, KeySearch: f, PageIndex: p, PageSize: r, IsWin: IsWin },
        url: "/aj/GameV2/GameShockCustomerPaging",
        beforeSend: function () {
            if (p == 1) {
                $('#g-pl-sr').hide();
                $('.g-pl-loading').show();
                $('.control').hide();
            }
        },
        success: function (args) {
            $("#g-pl-sr table table").append(args);
            if (p == 1) {
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
            LoadLuckyDraw_FLAG_CALL = true;
        },
        error: function (e) {
            LoadLuckyDraw_FLAG_CALL = true;
        }
    });
}


function ChangeCustomer(t, amount) {
    $('.input-wrapper li').removeClass('active');
    $(t).addClass('active');
    $('[id$=g-pl-bs]').click();
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