var TGDD_CDN_VERSION = '';

var keydtdd = 'dien thoai, dien thoai di dong, dtdd, smartphone, gia dien thoai, khuyen mai dien thoai, điện thoại di động, điện thoại, giá điện thoại, dien thoai gia re, dien thoai, dien thoai di dong, dtdd, smartphone, gia dien thoai, khuyen mai dien thoai, dien thoai di dong, dien thoai, gia dien thoai, dien thoai gia re';
var keylaptop = 'Laptop, máy tính xách tay, máy tính, Ultralbook, netbook, Notebook, giá laptop, giá máy tính xách tay, laptop cảm ứng, Laptop Touch, Laptop, may tinh xach tay, may tinh, Ultralbook, netbook, Notebook, gia laptop, gia may tinh xach tay, laptop cam ung, Laptop Touch';
var keymaytinhbang = 'Máy tính bảng, may tinh bang, tablet, gia may tinh bang, mua ban may tinh bang, May tinh bang, may tinh bang, tablet, gia may tinh bang, mua ban may tinh bang';
var keymayanhso = 'Camera, máy ảnh, máy ảnh số, máy chụp hình, may quay phim, giá camera, giá máy chụp ảnh, Compact, DSLR, Digital Cameras, Camera, may anh, may anh so, may chup hinh, may quay phim, gia camera, gia may chup anh, Compact, DSLR, Digital Cameras';
var keyphukien = 'Phụ kiện, phu kien, accessories, giá cả phụ kiện, thông tin chi tiết phụ kiện, Phu kien, phu kien, accessories, gia ca phu kien, thong tin chi tiet phu kien';
var game = 'Trò chơi trên mobile, game mobile, Tro choi tren mobile, game mobile';
var ungdung = 'Ứng dụng, Ung dung';
var k_pro = 'CK_CHECK_PROVINCE_OF_USER';
var isfancybox = false;
// set cookie
function CreateCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; visited=true; path=/; domain=" + rooturl + "; expires=" + exdate.toUTCString() + ";");
    document.cookie = c_name + "=" + c_value;
}

function CreateCookieWithHour(c_name, value, exMins) {
    var exdate = new Date();
    exdate.setMinutes(exdate.getMinutes() + exMins);
    //exdate.setDate(exdate.getHours() + exdays);
    var c_value = escape(value) + ((exMins == null) ? "" : "; visited=true; path=/; domain=" + rooturl + "; expires=" + exdate.toUTCString() + ";");
    document.cookie = c_name + "=" + c_value;
}

// get cookie
function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}

// delete cookie
function Delete_Cookie(name, path, domain) {
    if (getCookie(name))
        document.cookie = name + "=" + ((path) ? ";path=" + path : "") + ((domain) ? ";domain=" + domain : "") + ";expires=Thu, 01 Jan 1970 00:00:01 GMT";
}


// CALLING AJAX
function POSTAjax(url, dat, befHandle, sucHandle, errHandle, asy) {
    $.ajax({
        async: asy,
        url: url,
        data: dat,
        type: 'POST',
        cache: false,
        beforeSend: function () {
            befHandle();
        },
        success: function (e) {
            sucHandle(e);
        },
        error: function () {
            errHandle();
        }
    });
}

function BeforeSendAjax() {
    $('#dlding').show();
}

function EndSendAjax() {
    $('#dlding').hide();
}

// ErrorAjax
function ErrorAjax() {
    // Not implemented yet
    $('#dlding').hide();
}

// !!!!!! Suggest Search Home page
var strPathCatImg = '//cdn.tgdd.vn/category/';
var strPathProImg = '//cdn.tgdd.vn/Products/Images/';
var strPathManuImg = '//cdn.tgdd.vn/brand/'
var searchArr = new Array();
var beginTime = 0;
var endTime = 0;

function CheckTimer() {
    var d = new Date();
    if (beginTime == 0 && endTime == 0) {
        beginTime = d.getTime();
    }
    return;
}

function SuggestSearch(e) {
    var kw = $('#search-keyword').val();
    if (e.which != 8 && e.which != 46 && kw.length < 2) {
        return;
    }
    var sl = '#SuggestSearch ul li';
    var d = new Date();
    endTime = d.getTime();
    beginTime = endTime;
    if (e.which == 40) {
        if ($(sl + '.selected').length == 0) {
            $(sl + ':first').addClass('selected');
        }
        else {
            var t = $(sl + '.selected').next();
            if (t.hasClass('li-group'))
                t = t.next();
            $(sl + '.selected').removeClass('selected');
            t.addClass('selected');
        }
        return;
    }
    else if (e.which == 38) {
        if ($(sl + '.selected').length == 0) {
            $(sl + ':last').addClass('selected');
        }
        else {
            var t = $(sl + '.selected').prev();
            if (t.hasClass('li-group'))
                t = t.prev();
            $(sl + '.selected').removeClass('selected');
            t.addClass('selected');
        }
        return;
    }
    SetTimeer(100);
}


function SetTimeer(t) {
    CallSuggestPerTimer(t);
}

function CallSuggestPerTimer(t) {
    searchArr[searchArr.length] =
    setTimeout(function () {
        var s = new Date();
        var myTime = s.getTime();
        if (beginTime == endTime) {
            if (myTime - endTime < 750 && myTime - endTime >= 0) {
                clearTimeout(searchArr[searchArr.length - 1]);
                SetTimeer(t);
                return;
            }
            else if (myTime - endTime >= 750) {
                CallSuggest();
                return;
            }
        }
        else
            return;
    }, t);
}


function CallSuggest() {
    var kw = $('#search-keyword').val().replace(/:|;|!|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\.|\?|\/|`|~|\+|=|_|\(|\)|{|}|\[|\]|\\|\|/gi, '');
    var kwt = kw.trim().toLowerCase();
    var ss = '#SuggestSearch';
    if (kwt.length < 2) {
        $(ss).hide();
        return;
    }
    if (kwt.length >= 2) {
        $('#search-keyword').addClass('loading');
        $.ajax({
            url: '/aj/Common/SuggestSearch',
            type: 'GET',
            data: { Key: kwt },
            cache: true,
            success: function (d) {
                $('#search-keyword').removeClass('loading');
                if (d == '') {
                    $(ss).hide();
                }
                else {
                    $(ss).html(d).show();
                }
            }
        })
    }
}

function CloseSuggestCommon() {
    setTimeout(function () { $('#SuggestSearch').hide(); }, 1000);
}

// !!!!!! Submit Search Form
function submitSearchForm() {
    var strkeydtdd = keydtdd.split(",");
    var strkeylaptop = keylaptop.split(",");
    var strkeymaytinhbang = keymaytinhbang.split(",");
    var strkeymayanhso = keymayanhso.split(",");
    var strkeyphukien = keyphukien.split(",");
    var strgame = game.split(",");
    var strungdung = ungdung.split(",");
    var kw = $('#search-keyword').val().replace(/:|;|!|@|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\?|\/|`|~|=|_|\(|\)|{|}|\[|\]|\\|\|/gi, ' ');
    //var kwt = kw.toLowerCase().trim();
    var kwt = $.trim(kw.toLowerCase());
    if ($('#SuggestSearch ul li.selected').length != 0) {
        $('#SuggestSearch ul li.selected').each(function () {
            var link = $(this).children('a').attr('href');
            window.location = link;
        });
    }
    else {
        if (kwt != '' & kwt.length >= 2) {
            //Điện thoại di động, DTDD, điện thoại, smartphone, điện thoại 2 sim, giá điện thoại
            for (var i = 0; i < strkeydtdd.length; i++) {
                if (kwt == strkeydtdd[i].toLowerCase().trim()) {
                    window.location = '/dtdd';
                    return false;
                }
            }
            for (var i = 0; i < strkeylaptop.length; i++) {
                if (kwt == strkeylaptop[i].toLowerCase().trim()) {
                    window.location = '/laptop';
                    return false;
                }
            }
            for (var i = 0; i < strkeymaytinhbang.length; i++) {
                if (kwt == strkeymaytinhbang[i].toLowerCase().trim()) {
                    window.location = '/may-tinh-bang';
                    return false;
                }
            }
            for (var i = 0; i < strkeymayanhso.length; i++) {
                if (kwt == strkeymayanhso[i].toLowerCase().trim()) {
                    window.location = '/may-anh-so';
                    return false;
                }
            }
            for (var i = 0; i < strkeyphukien.length; i++) {
                if (kwt == strkeyphukien[i].toLowerCase().trim()) {
                    window.location = '/phu-kien';
                    return false;
                }
            }
            for (var i = 0; i < strgame.length; i++) {
                if (kwt == strgame[i].toLowerCase().trim()) {
                    window.location = '/game-ung-dung';
                    return false;
                }
            }
            for (var i = 0; i < strungdung.length; i++) {
                if (kwt == strungdung[i].toLowerCase().trim()) {
                    window.location = '/game-ung-dung';
                    return false;
                }
            }

            if (kwt == "điện thoại 2 sim") {
                window.location = '/dtdd';
                return false;
            }
            else if (kwt == "giá tablet" || kwt == "giá máy tính bảng") {
                window.location = '/may-tinh-bang';
                return false;
            }
            else if (kwt.indexOf("san pham ") == 0 || kwt.indexOf("sản phẩm ") == 0) {
                kwt = kwt.replace('san pham ', '').replace('sản phẩm ', '');
                window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (kwt.indexOf("tin tuc ") == 0 || kwt.indexOf("tin tức ") == 0) {
                kwt = kwt.replace('tin tuc ', '').replace('tin tức ', '');
                window.location = '/tim-kiem-tin-tuc?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (kwt.indexOf("rao vat ") == 0 || kwt.indexOf("rao vặt ") == 0) {
                kwt = kwt.replace('rao vat ', '').replace('rao vặt ', '');
                window.location = '/tim-kiem-may-doi-tra?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (kwt.indexOf("sim so ") == 0 || kwt.indexOf("sim số ") == 0) {
                window.location = '/sim-so-the-cao-thu-cuoc';
                return false;
            }
            else if (kwt.indexOf("sieu thi ") == 0 || kwt.indexOf("siêu thị ") == 0) {
                window.location = '/he-thong-sieu-thi-the-gioi-di-dong';
                return false;
            }
            else if (kwt.indexOf("game ") == 0) {
                kwt = kwt.replace('game ', '').replace('game ', '');
                window.location = '/game-ung-dung?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (kwt.indexOf("ung dung ") == 0 || kwt.indexOf("ứng dụng ") == 0) {
                kwt = kwt.replace('ung dung ', '').replace('ứng dụng ', '');
                window.location = '/game-ung-dung?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (kwt.indexOf("khuyen mai") == 0 || kwt.indexOf("khuyến mãi") == 0) {
                window.location = '/tin-tuc-dien-dan/khuyen-mai/31';
                return false;
            }
            else if (kwt.indexOf("sieu thi") == 0 || kwt.indexOf("siêu thị") == 0) {
                window.location = '/he-thong-sieu-thi-the-gioi-di-dong';
                return false;
            }
            else if (typeof searchpage == 'undefined') {
                if (typeof FilterValue == 'undefined') {
                    window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+').replace(/ /g, '+');
                    return false;
                }
                else {
                    if (FilterValue == "42" || FilterValue == "522" || FilterValue == "44" || FilterValue == "49" || FilterValue == "-888888") {
                        //window.location = '/tim-kiem?key=' + encodeURIComponent(kwt) + "&F=c:" + FilterValue;
                        window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                        return false;
                    }
                    else {
                        window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                        return false;
                    }
                }
            }
            else if (searchpage == 1) {
                window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (searchpage == 2) {
                window.location = '/tim-kiem-may-doi-tra?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (searchpage == 3) {
                window.location = '/tim-kiem-tin-tuc?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else if (searchpage == 4) {
                window.location = '/sim-so-the-cao-thu-cuoc';
                return false;
            }
            else if (searchpage == 5) {
                window.location = '/he-thong-sieu-thi-the-gioi-di-dong';
                return false;
            }
            else if (searchpage == 6) {
                window.location = '/game-ung-dung?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
            else {
                window.location = '/tim-kiem?key=' + encodeURIComponent(kwt).replace(/%20/gi, '+');
                return false;
            }
        }
    }
    return false;
}

function formatNumberValue(number) {
    var intLength = number.toString().length;
    var intLeft = 0;
    var strNumber = '';
    var strNewNumber = '';
    while (intLength % 3 != 0) {
        intLength++;
        intLeft++;
    }
    if (intLeft != 0) {
        for (var intCount = 0; intCount < intLeft; intCount++) {
            strNumber += '0';
        }
    }
    strNumber += number.toString();
    for (var intCount = 0; intCount < intLength; intCount++) {
        strNewNumber += strNumber.charAt(intCount);

        if (intCount > 0 && (intCount + 1) % 3 == 0 && intCount != intLength - 1) {
            strNewNumber += '.';
        }
    }
    strNewNumber = strNewNumber.substring(intLeft);
    return strNewNumber;
}

function GetAllFormData($f) {
    var dataElement = {};
    $f.find('input[type=text], input[type=password], input[type=radio]:checked, input[type=hidden], textarea').each(function () {
        dataElement[$(this).attr('name')] = $(this).val().trim();
    });
    $f.find('input[type=checkbox]').each(function () {
        dataElement[$(this).attr('name')] = $(this).attr('checked') == 'checked' ? true : false;
    });
    $f.find('select').each(function () {
        dataElement[$(this).attr('name')] = $(this).val();
        dataElement[$(this).attr('name') + 'text'] = $(this).find('option:selected').text();
    });
    var dataAttach = {};
    $f.find('input[type=text], input[type=password], input[type=radio]:checked, input[type=hidden], textarea, select option:selected').each(function () {
        dataAttach = $.extend({}, dataAttach, $(this).data());
    });
    var dataReturn = $.extend({}, dataElement, dataAttach);
    return dataReturn;
}

$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('#back-top').fadeIn();
        //setbackgroundright();
    } else {
        $('#back-top').fadeOut();
    }
});

$('#back-top a').click(function () {
    $('body,html').animate({
        scrollTop: 0
    }, 800);
    return false;
});

function getQuerystring(key, default_) {
    if (default_ == null) default_ = "";
    key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
    var qs = regex.exec(window.location.href);
    if (qs == null)
        return default_;
    else
        return qs[1];
}

function ShowMoreFooterSupportLink() {
    $('.colfoot li.showmore').remove();
    $('.colfoot li.hidden').removeClass('hidden');
}

//#region Tracking

$(document).ready(function () {
    setTimeout(function () {
        $.getScript("//wurfl.io/wurfl.js")
          .done(function (script, textStatus) {
              var isMobile = 0;
              if (WURFL.is_mobile == true)
                  isMobile = 1;
              var sFactory = WURFL.form_factor;
              var sDevice = WURFL.complete_device_name;
              var currURL = encodeURIComponent(document.URL);
              var keyword = encodeURIComponent(getQuerystring("key"));
              var categoryid = -1;
              var SessionId = '';

              if (typeof (GL_CATEGORYID) != 'undefined')
                  categoryid = GL_CATEGORYID;
              if (categoryid == -1 && $('#hdCategoryID').length > 0)
                  categoryid = $('#hdCategoryID').val();
              //productID
              var iProductid = -1;
              if (typeof (ProductID) != 'undefined')
                  iProductid = ProductID;
              if ((iProductid == 0 || iProductid == -1) && typeof (GL_ProductID) != 'undefined')
                  iProductid = GL_ProductID;
              if (iProductid == -1 && typeof (productid) != 'undefined')
                  iProductid = productid;
              //Keyword
              if (keyword == undefined)
                  keyword = '';
              //Urlreferrer
              var urlrefer = encodeURIComponent(document.referrer);
              if (urlrefer == undefined)
                  urlrefer = '';
              if (typeof (mysessionid) != 'undefined')
                  SessionId = mysessionid;
              //Screen width
              var iHeight = window.innerHeight;
              var iWidth = window.innerWidth;
              var sScreenSize = iWidth + 'x' + iHeight;

              var urlpara = tgddctr_urlroot + "/tracking/load?urlrefer=" + urlrefer
                  + "&key=" + keyword
                  + "&categoryid=" + categoryid
                  + "&productid=" + iProductid
                  + "&sessionid=" + SessionId
                  + "&pageurl=" + currURL
                  + "&ismobile=" + isMobile
                  + "&device=" + sDevice
                  + "&screen=" + sScreenSize
                  + "&factory=" + sFactory;
              var imgload = "<img width=\"0\" heigth=\"0\" id=\"imgtrack\" src=\"" + urlpara + "\" />";
              $("body").append(imgload);
          });
    }, 5000);
    getScriptChatTgdd();
});

//#endregion

//#region CHAT

function empty(mixed_var) {
    var key;

    if (mixed_var === ""
        || mixed_var === 0
        || mixed_var === "0"
        || mixed_var === null
        || mixed_var === false
        || mixed_var === undefined
        || $.trim(mixed_var) == ""
    ) {
        return true;
    }
    if (typeof mixed_var == 'object') {
        for (key in mixed_var) {
            if (typeof mixed_var[key] !== 'function') {
                return false;
            }
        }
        return true;
    }
    return false;
}

var gl_fLoadChat = false;
function getScriptChatTgdd() {
    setTimeout(function () {
        if (!gl_fLoadChat) {
            gl_fLoadChat = true;
            var strUserNameChat = getCookie('chat.username');
            if (empty(strUserNameChat) || (!empty(strUserNameChat) && strUserNameChat.indexOf('@') < 0)) {
                if ("undefined" != typeof g_version) {
                    var lnkChat = "https://cdn.tgdd.vn/dmxchat/chatclienttgddmobile.v" + g_version + ".js";
                    $.getScript(lnkChat).done(function (script, textStatus) {
                        console.log("GET SCRIPT CHAT: DONE");
                    });
                } else {
                    var lnkChat = "https://cdn.tgdd.vn/dmxchat/chatclienttgddmobile.js";
                    $.getScript(lnkChat).done(function (script, textStatus) {
                        console.log("GET SCRIPT CHAT: DONE");
                    });
                }
            }
        }
    }, 10000);
}

//#endregion