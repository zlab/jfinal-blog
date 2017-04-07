<#macro window type="blog" bodyClass="">
<!DOCTYPE html>
<html>
<head>
  <#if type == "blog">
        <#include "${viewPath}/blog/source.ftl" />
    <#else>
    <#include "${viewPath}/admin/source.ftl" />
  </#if>
</head>
<body class="${bodyClass!}">
  <#nested>

<script type="text/javascript" src="https://tajs.qq.com/stats?sId=13218366" charset="UTF-8"></script>
</body>
</html>
</#macro>