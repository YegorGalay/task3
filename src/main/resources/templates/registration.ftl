<#import "work elemnts/gen.ftl" as c>
<#import "work elemnts/login.ftl" as l>

<@c.page>
    <div class="mb-1">Registration here</div>
    ${message?ifExists}
    <@l.login "/registration" true />
</@c.page>