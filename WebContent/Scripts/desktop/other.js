$(document).ready(function () {
    var url = window.location.href;
    if (url.indexOf('#phu-kien') > -1) {
        var position = $('#phu-kien').offset();
        $("html, body").animate({ scrollTop: position.top }, 1500);
    }

    $("img.footermoneylazy").lazyload({
    });
    $("img.footerpinlazy").lazyload({
    });
    $("img.lazy").lazyload({
        threshold: 150
    });

    $(window).scroll(function () {
        try {
            LoadJsComment();
            // $.lockfixed(".nolist", { offset: { top: 100, bottom: 380 } });
        } catch (e) {
        }
    })

    //active menu 
    try {
        var curURL = window.location.href;
        $("#help-navigation > ul > li > a").each(function () {
            $(this).parent().removeClass("active");
            var ahref = $(this).attr("href");
            if (curURL.indexOf(ahref) > -1) {
                $(this).parent().addClass("active");
                return false;
            }
        });
    } catch (e) {
    }

});

var flsc = false;
function LoadJsComment() {
    if (flsc == true)
        return;
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
        }, 500);
    }
}

function GetAllFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}

var SUBMIT_CUSTOMER_REGISTER = true;
function SubmitCustomerRegister() {
    if (!SUBMIT_CUSTOMER_REGISTER)
        return;
    SUBMIT_CUSTOMER_REGISTER = false;
    var data = GetAllFormData($('#frmCompanyCustomer'))
    debugger;
    $.ajax({

        type: 'POST',
        cache: false,
        beforeSend: function () { },
        data: data,
        url: '/aj/Other/SubmitCompanyCustomerRegister',
        success: function (e) {
            debugger;
            if (e != null || e != '') {
                if (e.status == 1) {
                    alert('Cảm ơn bạn đã đăng ký. Chúng tôi sẽ sớm gửi những điều bất ngờ đến cho bạn.');
                }
                else if (e.status == -3) {
                    var html = 'Rất tiếc, thông tin bạn cung cấp chưa đúng: \n';
                    for (var i in e.errors) {
                        html += '-';
                        html += e.errors[i];
                        html += '\n';
                    }
                    alert(html);
                }
                else {
                    var html = alert('Chức năng đang được bảo trì, vui lòng thử lại sau');
                }
            }
            $('#dlding').fadeOut(1000);
            SUBMIT_CUSTOMER_REGISTER = true;
        }
    })
}

function SubmitContact() {
    var data = GetAllFormData($('#contactinfo'));
    debugger;
    $.ajax({

        type: 'POST',
        cache: false,
        beforeSend: function () { },
        data: data,
        url: '/aj/Other/SubmitContact',
        success: function (e) {
            debugger;
            if (e != null || e != '') {
                if (e.status == 1) {
                    alert('Đã gửi thông tin thành công!');
                }
                else if (e.status == -3) {
                    var html = 'Rất tiếc, thông tin bạn cung cấp chưa đúng: \n';
                    for (var i in e.errors) {
                        html += '-';
                        html += e.errors[i];
                        html += '\n';
                    }
                    alert(html);
                }
                else {
                    var html = alert('Chức năng đang được bảo trì, vui lòng thử lại sau');
                }
            }
        }
    })
    return false;
}

//get coupon
function CheckCouponInfo() {
    debugger;
    var coupon = $('#txtCouponCode').val().trim();
    if (coupon == '') {
        $('#help-main .divCoupon .r .error').html('Vui lòng nhập mã giảm giá/mã phiếu mua hàng cần tra cứu');
        return;
    }
    if (coupon.length != 12) {
        $('#help-main .divCoupon .r .error').html('Mã thẻ chưa chính xác, vui lòng kiểm tra lại');
        return;
    }
    //reg = /^(\d)+$/;
    //if (!reg.test(coupon)) {
    //    $('#help-main .divCoupon .r .error').html('Mã thẻ chưa chính xác, vui lòng kiểm tra lại');
    //    return;
    //}
    $.ajax({
        type: 'POST',
        cache: false,
        beforeSend: function () { },
        data: { strC: coupon },
        url: '/aj/Other/CheckCouponInfo',
        success: function (e) {
            if (e == null || e == '') {
                alert('Chức năng đang được bảo trì, vui lòng thử lại sau');
                window.location.reload();
            }
            if (typeof (e) == 'object') {
                $('#help-main .divCoupon .r .error').html(e._errors[0]);
            }
            else {
                $('#help-main .divCoupon .r .error').html('');
                $('#help-main .couponinfo').replaceWith(e);
            }
            $('#dlding').hide();
        }
    })
}
