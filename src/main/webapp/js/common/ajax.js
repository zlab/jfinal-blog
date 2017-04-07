/**
 * Loading
 */
(function($) {

    $.mask = function(el) {
        $('<div class="ajax-backdrop-mask"></div>').css({
            position : 'fixed',
            top : 0,
            right : 0,
            bottom : 0,
            left : 0,
            'z-index' : 1040,
            'background-color' : '#000',
            opacity : 0
        }).appendTo('body');

        var loader = $('<div style="position: fixed; z-index: 2000;" class="ajax-loading-overlay-mask">\
                <i class="ajax-loading-icon fa fa-spin fa-spinner fa-3x orange"></i></div>');

        var contentArea = $('.page-content-area');
        if (contentArea.length > 0) {
            contentArea.css('opacity', 0.6);
            loader.insertBefore(contentArea);
        } else {
            loader.appendTo('body');
        }

        var offset = contentArea.offset() || {
            top : '33%',
            left : '49%'
        };
        loader.css({
            top : offset.top,
            left : offset.left
        });
    };

    $.unmask = function(el, abort) {
        var contentArea = $('.page-content-area');
        contentArea.css('opacity', 1);
        $('.ajax-loading-overlay-mask').remove();
        $('.ajax-backdrop-mask').remove();
    };

})(jQuery);

/**
 * Ajax
 */
(function($) {

    /**
     * 全局设置
     */
    $.ajaxSetup({
        mask : true
    });

    /**
     * ajax
     */
    function ajax(url, data, success, failure, complete) {
        return $.ajax({
            url : url,
            async : true,
            timeout : 10000,
            data : $.paramJSON(data) || {},
            type : 'POST',
            //dataType : dataType,
            beforeSend : function() {
                $.ajaxSettings.mask && $.mask();
            }
        }).done(function(json, statusText, jqXHR) {
            $.unmask();

            if ($.isString(json)) {
                return;
            }

            if (json.success != false) {
                success && success.apply(this, arguments);
            } else {
                $.error(json.msg, 3000);

                failure && failure.apply(this, arguments);
            }
        }).fail(function(json, statusText, jqXHR) {
            $.unmask();

            if (statusText == 'abort') {
                $.error('请求已被中断！', 3000);
            } else if (statusText == 'timeout') {
                $.error('请求超时，请稍后再试！', 3000);
            } else if (json && json.status == 404) {
                $.error('页面没有找到，请联系管理员！', 3000);
            } else if (statusText == 'error') {
                $.error('无法连接服务器，请稍后再试！', 3000);
            } else {
                $.error('网络故障【' + statusText + '】，请稍候再试！', 3000);
            }
        }).complete(function(jqXHR, statusText, jqXHR) {
            $.unmask();

            complete && complete.apply(this, arguments);
        });
    }

    $.postJSON = function(url, data, success, failure, complete) {
        return ajax(url, data, success, failure, complete);
    };

    $.fn.load = function(url, data, success) {
        var self = this;

        return ajax(url, data).done(function(result) {

            if($.isString(result)) {
                self.html(result);

                success && success.apply(self);
            }
        });
    };
})(jQuery);