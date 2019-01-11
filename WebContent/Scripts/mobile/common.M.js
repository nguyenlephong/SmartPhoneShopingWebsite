$.ajaxSetup({
    cache: true
});
$(window).load(function () {
    $(".menu").on("click", function () {
        $("nav").slideToggle();
        $(this).toggleClass("actmenu");
        $("section").toggleClass("fixbody");
        $('footer').toggleClass("fixbody");
    });
    console.log('Ready');

    $("nav").click(function () {
        $("nav").show();
        $(this).slideToggle();
        $(".actmenu").removeClass("actmenu");
        $("section").removeClass("fixbody");
        $("footer").removeClass("fixbody");
    });


    //drop down
    $('.dropdown').on('click', function (e) {
        e.preventDefault();
        $(this).next('.showdropdown').slideToggle(10);
    });
    $('.closedropdown').on('click', function () {
        $('.showdropdown').slideToggle();
    });
    // scroll body to 0px on click
    $('.gototop').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 600);
        return false;
    });

    $('.infoother').click(function () {
        $(this).toggleClass('arrow');
        $('.subother').slideToggle('fast');
    });
});

$(window).load(function () {
    setTimeout(DetectDevice, 10000);
    setTimeout(DetectRatio, 10000);
    getScriptChatTgdd();
    TrackingTGDD();
});

function DetectDevice() {
    if (getCookie('DEVICE') != undefined && getCookie('DEVICE') != '') return;
    $.getScript("https://wurfl.io/wurfl.js")
    .done(function (script, textStatus) {
        if (WURFL.is_mobile == true) {
            sDevice = WURFL.complete_device_name;
            userAgent = navigator.userAgent;
            $.ajax({
                type: 'POST',
                data: { deviceName: WURFL.complete_device_name, userAgent: navigator.userAgent },
                url: '/aj/CommonV3/DetectDevice'
            });
        }
    });
}

function DetectRatio() {
    if (getCookie('RATIO') != undefined && getCookie('RATIO') != '') return;
    var ratio = -1;
    // To account for zoom, change to use deviceXDPI instead of systemXDPI
    if (window.screen.systemXDPI !== undefined && window.screen.logicalXDPI !== undefined && window.screen.systemXDPI > window.screen.logicalXDPI) {
        // Only allow for values > 1
        ratio = window.screen.systemXDPI / window.screen.logicalXDPI;
    }
    else if (window.devicePixelRatio !== undefined) {
        ratio = window.devicePixelRatio;
    }
    if (ratio > -1) {
        CreateCookie('RATIO', ratio, 365);
    }
}

function Delete_Cookie(name, path, domain) {
    if (getCookie(name))
        document.cookie = name + "=" + ((path) ? ";path=" + path : "") + ((domain) ? ";domain=" + domain : "") + ";expires=Thu, 01 Jan 1970 00:00:01 GMT";
}

function CreateCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; visited=true; path=/; domain=" + rooturl + "; expires=" + exdate.toUTCString() + ";");
    document.cookie = c_name + "=" + c_value;
}

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

function ErrorAjax() {
    $('#dlding').hide();
}

var lastSuggest = new Date().getTime();
var timmer;
function CallSuggest() {
    var currentTime = new Date().getTime();
    if (currentTime - lastSuggest < 3000) {
        clearTimeout(timmer);
        timmer = setTimeout(function () {
            CallSuggest();
        }, 310);
        return;
    }
    var kw = $('#search-keyword').val().replace(/:|;|!|@@|#|\$|%|\^|&|\*|'|"|>|<|,|\.|\?|\/|`|~|\+|=|_|\(|\)|{|}|\[|\]|\\|\|/gi, '');
    var kwt = kw.trim().toLowerCase();
    var ss = '#SuggestSearch';
    if (kwt.length < 2) {
        $(ss).hide();
        return;
    }
    $.ajax({
        url: '/aj/Common/SuggestSearch',
        type: 'GET',
        data: { Key: kwt },
        cache: true,
        success: function (d) {
            if (d == '') {
                $(ss).hide();
            }
            else {
                $(ss).html(d).show();
            }
        }
    })
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

//#region Tracking

function TrackingTGDD() {
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
    }, 10000);
}

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