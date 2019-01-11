
function ShowPop(t) {
    if (typeof $.fancybox == "undefined") {
        $.getScript("/Scripts/desktop/jquery/fancybox.js")
          .done(function (script, textStatus) {
              ShowPop(t);
          });
        return false;
    }
    $('#wrap_cart .register').show();
    $('#wrap_cart .subSussess').hide();
    AddScriptUserCookies();
    $.fancybox({
        'href': $(t).attr('ref'),
        'transitionIn': 'none',
        'transitionOut': 'none',
        'titlePosition': 'over',
        beforeShow: function () {
            $("body").css({ 'overflow-y': 'hidden' });
        },
        afterClose: function () {
            $("body").css({ 'overflow-y': 'visible' });
        }
    });
}

function AddScriptUserCookies() {
    $.getScript("/Scripts/desktop/libs/tgdd_cookies.js")
             .done(function (script, textStatus) {
             });
}

function getGender()
{
    if ($('.gender input:radio[name="BillingAddress.iGender"]:checked').length == 1)
    {
        return $('.gender input:radio[name="BillingAddress.iGender"]:checked').val() == "1" ? "anh " : "chị ";
    }
    return "bạn ";
}

var SUBMIT_QUICK_ORDER_BOX_CALLING_FLAG = true;
function SubmitQuickOrder($form) {
    $('#IsCallSupport').val('false');
    $('.noteerror').hide();
    if (!SUBMIT_QUICK_ORDER_BOX_CALLING_FLAG)
        return;
    $("#wrap_cart input[name='BillingAddress.ProvinceName']").val($("#wrap_cart select[name='BillingAddress.ProvinceId'] option:selected").text());
    $("#wrap_cart input[name='BillingAddress.DistictName']").val($("#wrap_cart select[name='BillingAddress.DistictId'] option:selected").text());
    $('#PriceClient').val($('#wrap_cart .asideleft .pricesale').html());
    var postData = $form.serialize();
    SUBMIT_QUICK_ORDER_BOX_CALLING_FLAG = false;
    POSTAjax("/aj/Order/SubmitQuickOrder/", postData, BeforeSendAjax, function (data) {
        CallBackSubmitQuickOrder(data);
        EndSendAjax();
    }, ErrorAjax, true);
}

var qo_submitting = false;
function SubmitQuickOrderDelay() {
    qo_submitting = false;
}

function AddEventPageLoad() {
    $('.dropdown').on('click', function (e) {
        $(this).next('.showdropdown').slideToggle('fast');
        setTimeout(function () { $.fancybox.update(); }, 400);
    });
    $('.closedropdown').on('click', function () {
        $('.showdropdown').slideToggle();
        setTimeout(function () { $.fancybox.update(); }, 400);
    });
    $('.color-list input:radio[name="colorproduct"]').change(function () {
        $("#wrap_cart input[name='ProductCode']").val($(this).val());
        ChangePriceByProductCode($(this).val());
        ChangeImageByProductCode($(this).attr('img'));
    });
    if ($('.color-list input:radio[name="colorproduct"]').length == 1) {
        $('.color-list input:radio[name="colorproduct"]').trigger('click');
    }
    $('.gender input:radio[name="gender"]').change(function () {
        $('#BillingAddress.iGender').val($(this).val());
    });

    $('.enteradd').on('click', function (e) {
        e.preventDefault();
        $('#IsShipAtHome').val($(this).next('.showdropdown').is(':hidden'))
        if ($('#IsShipAtHome').val() == "true") {
            $('.phuctapqua').show();
        }
        else {
            $('.phuctapqua').hide();
        }
        CheckLoadProvince();
        $(this).next('.showdropdown').slideToggle('fast');
        setTimeout(function () { $.fancybox.update(); }, 400);
    });

    //Mã giảm giá Coupon
    $('#IsProductCode').change(function () {
        $("#wrap_cart input[name='IsProductCode']").val(this.checked)
        $(this).parent('.choosepay').next('.showdropdown').slideToggle('fast');
        $.fancybox.update();
    });
    //Xuất hóa đơn
    $('#IsCompany').change(function () {
        $("#wrap_cart input[name='IsCompany']").val(this.checked)
        $(this).parent('.choosepay').next('.showdropdown').slideToggle('fast');
        $.fancybox.update();
    });
    //Change pay
    $('#cbxPayOnline').change(function () {
        if (this.checked) {
            $(this).parent('.choosepay').next('.showdropdown').show();
            $('#payment').hide();
        } else {
            $(this).parent('.choosepay').next('.showdropdown').hide();
            $('#payment').show();
            $("#wrap_cart input[name='PaymentMethod']").val('0');
        }
    });

    //kiểm tra coupon
    $('.btnapp').click(function () {
        var data = { 'CouponCode': $('#CouponCode').val(), 'PhoneNumber': $("#wrap_cart input[name='BillingAddress.PhoneNumber']").val(), 'ProductId': productID, 'ProductCode': $("#wrap_cart #ProductCode").val() };
        POSTAjax('/aj/Order/CheckCouponCode', data, BeforeSendAjax, function (d) {
            if (d != null && d != '') {
                if (d._error != '') {
                    if (d._show)
                        alert(d._error);
                    else
                        console.log(d._error);
                }
                else {
                    $('#CouponCode').attr('readonly', true);
                    $('.priceline').html($('.pricesale').html());
                    $('.pricesale').html(formatNumberValue(d._result) + '₫');
                    $('.coupon1').hide();
                    $('.coupon2').show();
                    $('#spanCouponCode').html($('#CouponCode').val());
                    $('#IsProductCode').attr('disabled', 'disabled');
                }
            }
            EndSendAjax();
        }, ErrorAjax, true);
    })

    //Hủy coupon
    $('.btndelete').click(function () {
        $('#CouponCode').attr('readonly', false).val('');
        $('.pricesale').html($('.priceline').html());
        $('.priceline').html('');
        $('.coupon2').hide();
        $('.coupon1').show();
        $('#spanCouponCode').html('');
        $('#IsProductCode').removeAttr('disabled');
    })

}
//Chỉnh lại hình sản phẩm theo màu
function ChangeImageByProductCode(lnkImg) {
    if (lnkImg != null && lnkImg != "")
        $('#imgthumb').attr('src', lnkImg);
}
//Chỉnh lại giá sản phẩm theo màu
function ChangePriceByProductCode(code) {
    POSTAjax('/aj/Order/GetPriceByCode', { "prodCode": code, iProductId: productID, cateId: cateID, iOrderType: 0 }, BeforeSendAjax, function (data) {
        if (data != null && data != '') {
            var data = JSON.parse(data);
            $('.asideleft .pricesale').html(formatNumberValue(data.p) + "₫");
        }
        EndSendAjax();
    }, ErrorAjax, true);
}

function CallBackSubmitQuickOrder(e) {
    if (e != null && e != '' && e != undefined) {
        var tmp = JSON.parse(e);
        if (tmp.ResultType != 1) {
            SUBMIT_QUICK_ORDER_BOX_CALLING_FLAG = true;
            f_SubmitQuickOrderSupport = true;
            if (tmp.ResultMessages && tmp.ResultType != -11) {
                alert(tmp.ResultMessages[0]);
            }
            switch (tmp.ResultType) {
                case -6:
                    window.location.reload();
                    break;
                case -10: //Captcha
                    $('.captcha').show();
                    $('.captcha a').click();
                    break;
                case -11:
                    ShowErrorLockPhone(tmp.ResultMessages[0]);
                    break;
                default:
            }
        }
        else {
            switch ($("#PaymentMethod").val()) {
                case "2":
                    location.href = tmp.ResultMessages[1];
                    return;
                    break;
                case "3":
                    $('#wrap_cart').html("<div style=\"text-align:center;padding:10px;\"><p>Bạn đang được chuyển sang trang nhập thông tin tài khoản thanh toán</p><p><img src='/Content/desktop/images/loading_02.gif' /></p></div>");
                    setTimeout(function () {
                        location.href = tmp.ResultMessages[1];
                    }, 2000);
                    return;
                    break;
            }
            POSTAjax("/aj/Order/OrderSuccess/", {}, BeforeSendAjax, function (e) {
                if (e != null || e != '') {
                    if ($('#wrap_cart').length == 0)
                        $('body').append(e);
                    else
                        $('#wrap_cart').replaceWith(e);
                    $.fancybox.update();
                }
                EndSendAjax();
            }, ErrorAjax, true);
        }
    }
}

//Kiểm tra đã tải dữ liệu tỉnh thành lên chưa
var IsLoadProvince = false;
function CheckLoadProvince() {
    if (IsLoadProvince)
        return;
    POSTAjax('/aj/Common/GetAllProvince', {}, BeforeSendAjax, function (data) {
        if (data != null && data != '') {
            IsLoadProvince = true;
            $("#wrap_cart select[name='BillingAddress.ProvinceId']").html(data);
            var ipro = getCookie('tgdd_province');
            if ($.isNumeric(ipro) && ipro > 0)
                LoadDistictByProvince(ipro);
            else
                LoadDistictByProvince(3);
            $("#wrap_cart select[name='BillingAddress.ProvinceId'] option[value='" + ipro + "']").prop("selected", true);
            $("#wrap_cart select[name='BillingAddress.ProvinceId']").change(function () {
                LoadDistictByProvince($(this).val());
            });
        }
        EndSendAjax();
    }, ErrorAjax, true);
}

var flag_LoadDistictByProvince = false;
function LoadDistictByProvince(pro) {
    if (flag_LoadDistictByProvince)
        return;
    flag_LoadDistictByProvince = true;
    POSTAjax('/aj/Common/GetDistrictByProvince', { 'ProvinceID': pro }, BeforeSendAjax, function (data) {
        if (data != null && data != '') {
            IsLoadProvince = false;
            $("#wrap_cart select[name='BillingAddress.DistictId']").html(data);
            var idis = getCookie('tgdd_distict');
            if ($.isNumeric(idis) && idis > 0)
                $("#wrap_cart select[name='BillingAddress.DistictId']  option[value='" + idis + "']").prop("selected", true);
        }
        flag_LoadDistictByProvince = false;
        EndSendAjax();
    }, ErrorAjax, true);
}

function ChangeHours(select) {
    var selectedOption = select.options[select.selectedIndex];
    $("#wrap_cart select[name='BillingAddress.ShipHour'] option").removeAttr('selected');
    if (selectedOption.value != "0") {
        $("#wrap_cart select[name='BillingAddress.ShipHour'] option:eq(0)").attr('selected', 'selected');
        $('.today').show();
    }
    else {
        $('.today').hide();
        $("#wrap_cart select[name='BillingAddress.ShipHour'] option:not(.today):first").attr('selected', 'selected');
    }
}

function ShowErrorLockPhone(html) {
    var top = $("#wrap_cart input[name='BillingAddress.PhoneNumber']").offset().top;
    var left = $("#wrap_cart input[name='BillingAddress.PhoneNumber']").offset().left;
    $('.noteerror').html(html);
    $('.noteerror').show();
    $('.noteerror').offset({ top: top - $('.noteerror').height() - 30, left: left })
}
