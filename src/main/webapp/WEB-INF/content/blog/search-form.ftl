<form method="get" id="search-form" class="search-form" action="${ctx}/search/">
    <div>
        <label class="screen-reader-text" for="key">搜索：</label>
        <input type="text" value="${key!}" name="key" id="key"/>
        <input type="submit" id="search-submit" value="搜索"/>
    </div>
</form>