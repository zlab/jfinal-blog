<#include "../../common/option.ftl" />

<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <div>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">文章信息</h4>
            </div>
        </div>

        <div class="modal-body">
            <form id="post-form" method="POST" class="form-horizontal">
                <input type="hidden" name="post.id" value="${(post.id)!}" datatype="number"/>

                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#info" aria-expanded="true">
                        <i class="green ace-icon fa fa-info-circle bigger-120"></i> 基本信息
                    </a></li>

                    <li class=""><a data-toggle="tab" href="#content" aria-expanded="false">
                        <i class="green ace-icon fa fa-pencil-square-o bigger-120"></i> 文章内容
                    </a></li>
                </ul>

                <div class="tab-content">
                    <div id="info" class="tab-pane active">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="title">标题</label>

                            <div class="col-sm-8">
                                <input type="text" class="col-xs-12 required" name="post.title" id="title"
                                       value="${(post.title)!}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="catid">分类目录</label>

                            <div class="col-sm-8">
                                <select class="form-control required" name="post.catid" id="catid">
                                <@option code="CATEGORY_LIST" value="${(post.catid)!}" />
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="post-tags">标签</label>

                            <div class="col-sm-8">
                                <div id="post-tags" class="tags" style="width: 100%; height: 34px;">
                                <#list (post.postTags)! as tag>
                                    <span class="tag-${tag.id} label label-default label-lg">${tag.name}</span>
                                </#list>
                                </div>
                                <div id="tag-list" class="hidden">
                                <#list tagList! as tag>
                                  <#assign checked = "">
                                  <#if tag.checked>
                                    <#assign checked = " checked">
                                  </#if>
                                    <input type="checkbox" data-owned="${tag.checked?string}"
                                           data-name="${tag.name}" class="tag tag-${tag.id}"
                                           value="${tag.id}" ${checked}/>
                                </#list>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="thumbnail">缩略图</label>

                            <div class="col-sm-8">
                                <input type="text" class="col-xs-12" name="post.thumbnail" id="thumbnail"
                                       value="${(post.thumbnail)!}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="pubdate">发布时间</label>

                            <div class="col-sm-8">
                                <input type="text" class="col-xs-12 required" name="post.pubdate" id="pubdate"
                                       value="${((post.pubdate)!.now)?string('yyyy-MM-dd HH:mm:ss')}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="status">状态</label>

                            <div class="col-sm-8">
                                <select class="form-control required" name="post.status" id="status">
                                <@option code="POST_STATUS" value="${(post.status)!1}" />
                                </select>
                            </div>
                        </div>
                    </div>

                    <div id="content" class="tab-pane" style="max-height: 347px; overflow: hidden">
                        <div class="form-group no-margin-bottom">
                            <div class="col-sm-12">
                                <textarea id="post-content" name="post.content" cols="" rows=""
                                          style="height: 345px; width: 100%;">${(post.content?html)!}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-sm" data-dismiss="modal" type="button">
                <i class="ace-icon fa fa-times"></i> 取 消
            </button>

            <button class="btn btn-sm btn-primary" type="button" onclick="post.KE.sync();$('#post-form').submit();">
                <i class="ace-icon fa fa-check"></i> 保 存
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        // 校验通过才能打开第二个选项卡
        $('.nav-tabs a:last').on('show.bs.tab', function (e) {
            if (!$('#post-form').valid()) {
                e.preventDefault();
            } else {
                $('#post-tags').popover('hide');
            }
        });

        //
        $('#post-tags').popover({
            html: true,
            trigger: 'manual',
            placement: 'bottom',
            // viewport : '#post-input-modal .modal-dialog',
            content: function () {
                var tpl = '';
                $('#tag-list .tag').each(function () {
                    var checked = $(this).prop('checked') ? 'checked' : '';
                    tpl += '<label class="list-item">' +
                            '<input type="checkbox" class="ace ace-checkbox-2" value="' + $(this).val() + '" ' + checked
                            + ' />' + '<span class="lbl"> ' + $(this).data('name') + '</span>' +
                            '</label>';
                });

                return tpl;
            }
        }).click(function () {
            $(this).popover('toggle');
        });

        $('input, select, button').click(function () {
            $('#post-tags').popover('hide');
        });

        //
        $('#post-form').on('click', '.popover .lbl', function () {
            var checkbox = $(this).parent().find('.ace-checkbox-2');
            var id = checkbox.val();
            var checked = checkbox.prop('checked');
            // checkbox.prop('checked', !checked);

            // 同步选中
            $('#tag-list .tag-' + id).prop('checked', !checked);

            // 移除/增加
            if (checked) {
                $('#post-tags .tag-' + id).remove();
            } else {
                var name = $(this).text();
                $('#post-tags').append(' <span class="tag-' + id + ' label label-default label-lg">' + name + '</span>');
            }

        });

        $('#pubdate').datetimepicker({
            language: 'zh-cn',
            useSeconds: true,
            use24hours: true,
            format: 'YYYY-MM-DD HH:mm:ss'
        });

        $('#post-form').validate({
            submitHandler: post.savePost
        });


        /********************* KindEditor ***************************/
        post.KE = KindEditor.create('#post-content', {
            resizeType: 0,
            pagebreakHtml: '<a href="#" class="more-tag">Read<!--more-->More</a>',
            filterMode: false,
            allowImageUpload: false,
            allowFlashUpload: false,
            allowMediaUpload: false,
            allowFileUpload: false,
            newlineTag: 'p',
            cssPath: [ctx + '/js/kindeditor/plugins/code/prettify.css'],
            items: ['source', '|', 'undo', 'redo', '|', 'code', 'plainpaste', 'wordpaste', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist',
                'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript',
                '|', 'formatblock', 'fontname', 'fontsize', '|', 'fullscreen', '/', 'forecolor', 'hilitecolor',
                'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
                'media', 'map', 'table', 'hr', 'emoticons', 'pagebreak', 'link',
                'unlink', '|', 'selectall', 'print', 'preview', 'clearhtml', '|', 'about']
        });
    });
</script>