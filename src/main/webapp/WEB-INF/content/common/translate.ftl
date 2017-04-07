<#macro translate code value defaults="">
  <#assign match = false>
  <#if value != "">
    <#list params! as param>
      <#if param.code == code>
        <#if param.value == value>
          <#assign match = true>
        ${param.name}
          <#break>
        </#if>
      </#if>
    </#list>
  </#if>
  <#if !match>${defaults}</#if>
</#macro>
