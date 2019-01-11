$(window).load(function () {
    var url = window.location.href;
    if (url.indexOf('#phu-kien') > -1) {
        var position = $('#phu-kien').offset();
        $("html, body").animate({ scrollTop: position.top }, 1500);
    }
    $("#category").change(function () {
        var link = $("#category option:selected").val();
        window.location.href = link;
    });

    $("#txtCouponCode").live("keydown", function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            CheckCouponInfo();
        }
    });
    //Load comment
    $(window).scroll(function () {
        try {
            LoadJsComment();
        } catch (e) {
        }
    });
    try {
        $("img.lazy").lazyload({
            threshold: 150
        });
    } catch (e) {
    }

});

function GetAllFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}

function SubmitContact() {
    var data = GetAllFormData($('#contactinfo'));
    
    $.ajax({

        type: 'POST',
        cache: false,
        beforeSend: function () { },
        data: data,
        url: '/aj/Other/SubmitContact',
        success: function (e) {
            
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
    
    var coupon = $('#txtCouponCode').val().trim();
    if (coupon == '') {
        $('.couponinfo').addClass('error');
        $('.couponinfo').show();
        $('.couponinfo').html('Vui lòng nhập mã giảm giá/mã phiếu mua hàng cần tra cứu');
        return;
    }
    if (coupon.length != 12) {
        $('.couponinfo').addClass('error');
        $('.couponinfo').show();
        $('.couponinfo').html('Mã thẻ chưa chính xác, vui lòng kiểm tra lại');
        return;
    }
    $.ajax({
        type: 'POST',
        cache: false,
        beforeSend: function () {
            $('.couponinfo').addClass('error');
            $('.couponinfo').show();
            $('.couponinfo').html('Đang xử lý, vui lòng chờ ... <img border=\"0\" src="/Content/mobile/images/loading_02.gif\"/>');
        },
        data: { strC: coupon },
        url: '/aj/Other/CheckCouponInfo',
        success: function (e) {
            if (e == null || e == '') {
                alert('Chức năng đang được bảo trì, vui lòng thử lại sau');
                window.location.reload();
            }
            if (typeof (e) == 'object') {
                $('.couponinfo').addClass('error');
                $('.couponinfo').show();
                $('.couponinfo').html(e._errors[0]);
            }
            else {
                $('.couponinfo').removeClass('error');
                $('.couponinfo').html(e);
            }
        }
    })
}
var SUBMIT_CUSTOMER_REGISTER = false;
function SubmitCustomerRegister() {
    if (SUBMIT_CUSTOMER_REGISTER)
        return;
    var _form = '#form-data';
    var _valid = requireValue(_form);
    if (_valid) {
        var data = GetAllFormData($('#form-data'));
        $.ajax({
            type: 'POST',
            cache: false,
            beforeSend: function () { },
            data: data,
            url: '/aj/Other/SubmitCompanyCustomerRegister',
            success: function (e) {
                $('#dlding').fadeOut(1000);
                if (e.status === 1) {
                    alert('Gửi thông tin thành công');
                }
                else {
                    alert('Chức năng đang được bảo trì, vui lòng thử lại sau');
                }

            }
        });
    }

}

function requireValue(frm) {
    if (typeof frm === undefined || typeof frm === '')
        return false;
    var result = true;
    var lstInput = frm + ' input[required]';
    $(lstInput).each(function () {
        if ($(this).val() === '') {
            result = false;
            if (!$(this).hasClass('activeInput')) {
                $(this).addClass('activeInput');
                var html = '<h4>* không được để trống</h4>';
                $(this).parent('li').append(html);
            }
        }
        else {
            if ($(this).hasClass('activeInput')) {
                $(this).removeClass('activeInput');
                var currentLi = $(this).parent('li');
                $($(currentLi).children('h4')).remove();
            }
        }
    });
    return result;
}

$('#txtCustomerMobile').live('blur', function () {
    var valid = IsMobileNumber($(this).val());
    if (!valid) {
        alert('Số điện thoại không hợp lệ. Vui lòng nhập đúng!')
        $(this).focus();
    }
})

function IsMobileNumber(e) {
    // for 11 digits
    regPhone = /^((09[0-9]{8})|(01[0-9]{9}))$/;
    if (!regPhone.test(e)) {
        return false;
    }
    else
        return true;
}

$('#txtCustomerEmail').live('blur', function () {
    var valid = checkEmail($(this).val());
    if (!valid) {
        alert('Email không hợp lệ. Vui lòng nhập đúng!')
        $(this).focus();
    }
})

function checkEmail(e) {
    var emailRegEx = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailRegEx.test(e)) {
        return false;
    }
    else
        return true;
}

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
    }
}
