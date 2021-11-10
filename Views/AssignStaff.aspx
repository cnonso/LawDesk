<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AssignStaff.aspx.cs" Inherits="LawDesk.Views.AssignStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
        <div class="content-heading">
            <div>Assign Staff to Case</div>
            <div class="col-md-4">
                <asp:DropDownList Style="margin-top: 20px" ID="ddlCases" CssClass="custom-select  mb-3" required="required" runat="server" OnSelectedIndexChanged="ddlCases_SelectedIndexChanged" AutoPostBack="true">

                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Literal ID="ltrMessage" runat="server"></asp:Literal>
            </div>
            <div class="col-xl-7">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="confirm"><b>STAFF LIST</b></label>
                                    <table class="table table-striped my-4 w-100" id="datatable1">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Staff Type</th>
                                                <th>Work Load</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%Response.Write(tableBuilder); %>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <script>
                                function toggle(source) {
                                    members = document.getElementsByName('Staff');
                                    for (var i = 0, n = members.length; i < n; i++) {
                                        members[i].checked = source.checked;
                                    }
                                };
                            </script>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-5">
                <div class="card card-default">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <div style="display: none">
                            <asp:TextBox ID="txtAppendedStaffIDs" runat="server">,</asp:TextBox>
                        </div>
                        <input id="appendedStaffIDs" value="," style="display: none" />
                        <label><b>Team Lead</b></label>
                        <%--<select id="ddlTeamLead" class="form-control">
                        </select>--%>
                        <%Response.Write(selectionDropDown); %>
                        <p style="text-align: center; margin-top: 20px">
                            <b>ASSIGNED STAFF   LIST</b>
                        </p>
                        <hr />
                        <div id="assigned-staff">

                            <!--Concept-->
                            <div style="display: none">

                                <asp:Button ID="btnSaveAssignment" OnClick="btnSaveAssignment_Click" runat="server" Text="Button" />
                                <input id="staffID_0" style="display: none" name="staffIDs" />

                                <p>
                                    <img class="mr-2 rounded-circle thumb32" src="../img/user/05.jpg" alt="Image">
                                    Staff Name <span style="float: right; cursor: pointer; color: red" id="rmvBtn_0" onclick="removeOption('id');">Remove</span><hr />
                                </p>
                            </div>
                            <!--Concept Ends-->
                            <%Response.Write(staffListBuilder); %>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div style="display: none">
                            <asp:TextBox ID="txtTotalAssignedStaff" runat="server">0</asp:TextBox>
                        </div>
                        <button type="button" id="saveSelection" class="btn btn-oval btn-primary" style="<%Response.Write(saveSelectionButtonStyle); %>" onclick="SaveSelection()">Save</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <script> 
        function SaveSelection() { 
            document.getElementById('<%=btnSaveAssignment.ClientID%>').click();
        }

        //Initialize number of staff in list
        var count = parseInt(document.getElementById('<%=txtTotalAssignedStaff.ClientID%>').value);

        function AddStaffToList(id, name, avatar) {
            //alert(id + ',' + name); 
            if (document.getElementById('<%=ddlCases.ClientID%>').value == "") {
                alert("No case selected yet");
                return;
            }

            var idCollector = document.getElementById('<%=txtAppendedStaffIDs.ClientID%>');
            //var idCollector = document.getElementById('appendedStaffIDs');

            var root = document.getElementById('assigned-staff');

            //input control
            var inputElem = document.createElement("input");
            inputElem.id = "staffID_" + id;
            inputElem.value = id + "~" + name;
            inputElem.style.display = "none";
            inputElem.name = "staffIDs";

            //Paragraph
            var pElem = document.createElement("p");
            //pElem.innerHTML = name;

            //Image
            var imgElem = document.createElement("img");
            imgElem.className = "mr-2 rounded-circle thumb32";
            //imgElem.src = "../img/avatar.png";
            imgElem.src = avatar;
            imgElem.alt = "Staff Image";

            //Span
            var spanElem = document.createElement("span");
            spanElem.innerHTML = name;

            //HR
            var hrElem = document.createElement("hr");
            hrElem.id = "hr_" + id;


            //Remover button
            var removeLinkElem = document.createElement("span");
            removeLinkElem.innerHTML = "Remove";
            removeLinkElem.style.float = "right";
            removeLinkElem.style.cursor = "pointer";
            removeLinkElem.style.color = "red";
            removeLinkElem.id = "rmvBtn_" + id;
            removeLinkElem.onclick = function () {
                --count;
                document.getElementById('<%=txtTotalAssignedStaff.ClientID%>').value = count;
                //alert(count);
                if (count > 0)
                    document.getElementById('saveSelection').style.display = "block";
                else document.getElementById('saveSelection').style.display = "none";

                removeOption(id);
                idCollector.value = idCollector.value.replace(id + ',', '');
                root.removeChild(inputElem);
                root.removeChild(pElem);
                root.removeChild(removeLinkElem);

            };



            if (!idCollector.value.includes(',' + id + ',')) {
                idCollector.value = idCollector.value + id + ',';

                pElem.appendChild(imgElem);
                pElem.appendChild(spanElem);
                pElem.appendChild(removeLinkElem);
                pElem.appendChild(hrElem);

                root.appendChild(inputElem);
                root.appendChild(pElem);

                var select = document.getElementById("ddlTeamLead");
                var option = document.createElement("option");
                option.text = name;
                option.value = id;
                select.add(option);
                ++count;
                document.getElementById('<%=txtTotalAssignedStaff.ClientID%>').value = count;
            }
            //alert(count);
            if (count > 0)
                document.getElementById('saveSelection').style.display = "block";
            else document.getElementById('saveSelection').style.display = "none";
        };
        function removeOption(id) {
            var sel = document.getElementById('ddlTeamLead');
            for (i = sel.length - 1; i >= 0; i--) {
                if (sel[i].value == id)
                    sel.remove(i);
            }
        };

        function removeLinkElemClicked(id) {
            //alert(id);
            var idCollector = document.getElementById('<%=txtAppendedStaffIDs.ClientID%>');
            var root = document.getElementById('assigned-staff');
            var inputElem = document.getElementById("input_" + id);
            var pElem = document.getElementById("p_" + id);
            var hrElem = document.getElementById("hr_" + id);

            --count;
            document.getElementById('<%=txtTotalAssignedStaff.ClientID%>').value = count;
            //alert(count);
            if (count > 0)
                document.getElementById('saveSelection').style.display = "block";
            else document.getElementById('saveSelection').style.display = "none";

            removeOption(id);
            idCollector.value = idCollector.value.replace(id + ',', '');
            root.removeChild(inputElem);
            root.removeChild(pElem);
            root.removeChild(hrElem);
            //root.removeChild(removeLinkElem);

        };
    </script>
</asp:Content>

