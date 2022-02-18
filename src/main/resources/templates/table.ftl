<#import "work elemnts/gen.ftl" as c>

<@c.page>
    List of users
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col"></th>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Registration date</th>
            <th scope="col">Last connection date</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <form action="/user" method="post">
                    <th scope="row">
                        <input type="hidden" name="username" value="${user.username}">
                        <#list user.roles as role>
                            <div>
                                <label><input type="checkbox"
                                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></label>
                            </div>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </th>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.registrationDate}</td>
                    <td>${user.lastConnectionDate}</td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </form>
                </td>
                <td><form action="/user" method="post">
                        <input type="hidden" name="username" value="${user.username}">
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit">Block</button></form></td>
                <td><form action="/user/delete/${user.id}" method="post">
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit">Delete </button>
                    </form></td>

            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>