<#include "../../common/option.ftl" />

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">链接信息</h4>
        </div>

        <div class="modal-body">
            <form id="link-form" method="POST" class="form-horizontal">
                <input type="hidden" name="link.id" value="${(link.id)!}" datatype="number"/>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="category">分类</label>

                    <div class="col-sm-8">
                        <select class="form-control required" name="link.category" id="category">
                        <@option code="LINK_CATEGORY" value=(link.category)! />
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="target">打开方式</label>

                    <div class="col-sm-8">
                        <select class="form-control required" name="link.target" id="target">
                        <@option code="LINK_TARGET" value="${(link.target)!'_blank'}" />
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="status">状态</label>

                    <div class="col-sm-8">
                        <select class="form-control required" name="link.status" id="status">
                        <@option code="LINK_STATUS" value="${(link.status)!2}" />
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">名称</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="link.name" id="name"
                               value="${(link.name)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="slug">别名</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="link.slug" id="slug"
                               value="${(link.slug)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="href">地址</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="link.href" id="href"
                               value="${(link.href)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="sort">排序</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12" name="link.sort" id="sort"
                               value="${(link.sort)!}"/>
                    </div>
                </div>

            </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-sm" data-dismiss="modal" type="button">
                <i class="ace-icon fa fa-times"></i> 取 消
            </button>

            <button class="btn btn-sm btn-primary" type="button" onclick="$('#link-form').submit()">
                <i class="ace-icon fa fa-check"></i> 保 存
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#link-form').validate({
            submitHandler: link.saveLink
        });
    });
</script>