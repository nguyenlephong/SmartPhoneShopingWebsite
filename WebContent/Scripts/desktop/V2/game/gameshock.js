var GAME_LUCKYDRAW_CUSTOMER_BOX_CALLING_FLAG = true;
function LoadLuckyCustomer() {
    if (!GAME_LUCKYDRAW_CUSTOMER_BOX_CALLING_FLAG)
        return;
    GAME_LUCKYDRAW_CUSTOMER_BOX_CALLING_FLAG = false;
    if (typeof $.fancybox == "undefined") {
        $.getScript("/Scripts/desktop/jquery/fancybox.js")
          .done(function (script, textStatus) {
              GAME_LUCKYDRAW_CUSTOMER_BOX_CALLING_FLAG = true;
              LoadLuckyCustomer();
          });
        return;
    }
    var data = { intProductID: productID, intCategoryID: cateID };
    POSTAjax("/aj/GameV2/GameShockCustomer/", data, BeforeSendAjax, function (e) {
        if (e != null || e != '') {
            $.fancybox.close();
            if ($('#box-customer-luckydraw').length == 0) {
                $('#box-customer-luckydraw').remove();
                $('body').append(e);
            }
            else {
                $('#box-customer-luckydraw').replaceWith(e);
            }
        }
        $('#dlding').fadeOut(1000);
        GAME_LUCKYDRAW_CUSTOMER_BOX_CALLING_FLAG = true;
    }, ErrorAjax, true);
}