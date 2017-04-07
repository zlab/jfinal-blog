<title>${title!}</title>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
<link rel="icon" type="image/x-icon" href="${ctx}/favicon.ico"/>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${ctx}/ace/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${ctx}/ace/css/font-awesome.min.css"/>

<!-- text fonts -->
<link rel="stylesheet" href="${ctx}/ace/css/ace-fonts.min.css"/>

<!-- third styles -->
<link rel="stylesheet" href="${ctx}/ace/css/jquery.gritter.min.css"/>
<link rel="stylesheet" href="${ctx}/ace/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="${ctx}/ace/css/chosen.min.css"/>
<link rel="stylesheet" href="${ctx}/ace/css/bootstrap-editable.min.css"/>

<!-- ace styles -->
<link rel="stylesheet" href="${ctx}/ace/css/ace.min.css"/>

<!-- scripts -->
<script type="text/javascript" src="${ctx}/ace/js/jquery.min.js"></script>

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement)
        document.write("<script src='${ctx}/ace/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<!-- basic scripts -->
<script type="text/javascript" src="${ctx}/ace/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/ace.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/ace-extra.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/ace-elements.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/fuelux/fuelux.tree.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/fuelux/fuelux.wizard.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/bootbox.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/jquery.gritter.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/x-editable/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/x-editable/ace-editable.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/date-time/moment.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/date-time/moment-zh-cn.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/date-time/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/ace/js/additional-methods.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript" src="${ctx}/js/common/form.js"></script>
<script type="text/javascript" src="${ctx}/js/common/ajax.js"></script>
<script type="text/javascript" src="${ctx}/js/common/ace.ajax-content.js"></script>
<script type="text/javascript" src="${ctx}/js/common/jquery.tag.js"></script>
<script type="text/javascript" src="${ctx}/js/common/jquery.util.js"></script>

<script type="text/javascript">
    var ctx = '${ctx}';
</script>

<style>
    .table td.padding-6 {
        padding: 6px;
    }

    .page-info {
        float: left;
    }

    .pagination {
        float: right;
        margin: 0;
    }

    .popover {
        max-width: 100%;
    }

    .popover .arrow {
        display: none;
    }

    .popover .popover-content .list-item {
        margin-right: 5px;
        width: 100px
    }

    #post-tags span {
        margin-right: 5px;
    }

    .form-control.blog-desc-input {
        width: 400px;
        height: 30px;
    }

</style>