<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">用户信息</h4>
        </div>

        <div class="modal-body">
            <form id="user-form" method="POST" class="form-horizontal">
                <input type="hidden" name="user.id" value="${(user.id)!}" datatype="number"/>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="username">帐号</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="user.username" id="username"
                               value="${(user.username)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">姓名</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12" name="user.name" id="name"
                               value="${(user.name)!}"/>
                    </div>
                </div>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-sm" data-dismiss="modal" type="button">
                <i class="ace-icon fa fa-times"></i> 取 消
            </button>

            <button class="btn btn-sm btn-primary" type="button" onclick="$('#user-form').submit()">
                <i class="ace-icon fa fa-check"></i> 保 存
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#user-form').validate({
            submitHandler: user.saveUser
        });
    });
</script>