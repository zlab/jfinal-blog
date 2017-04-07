<#macro option code value please=true>
  <#if please>
  <option value="">--请选择--</option>
  </#if>
  <#list params! as param>
    <#if param.code == code>
      <#assign selected = "">
      <#if param.value?string == value?string>
        <#assign selected = " selected=\"selected\"">
      </#if>
    <option value="${param.value}" ${selected!}>${param.name}</option>
    </#if>
  </#list>
</#macro>
