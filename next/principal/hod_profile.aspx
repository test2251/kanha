﻿<%@ Page Title="" Language="C#" MasterPageFile="~/next/principal/principal.master" AutoEventWireup="true" CodeFile="hod_profile.aspx.cs" Inherits="next_principal_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="container">
            <div class="row">
                <form role="form">
                    <div class="col-md-6 col-md-offset-3">
                        <b>UPDATE HOD</b>

                        <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
                        <div class="form-group">
                            <label for="InputName">First Name</label>
                            <div class="input-group">
                                <asp:TextBox ID="fname" CssClass="form-control" placeholder="First Name" required runat="server"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Last Name</label>
                            <div class="input-group">

                                <asp:TextBox ID="lname" CssClass="form-control" placeholder="Last Name" required runat="server"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Email</label>
                            <div class="input-group">
                                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Email" autocomplete="off" type="Email" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputName">Date of Birth</label>
                            <div class="input-group">
                                <asp:TextBox ID="dob" CssClass="form-control" placeholder="DD/MM/YYYY" required runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="dob_CalendarExtender" runat="server" BehaviorID="dob_CalendarExtender" PopupPosition="Right" TargetControlID="dob" DefaultView="Years" TodaysDateFormat="d MMMM , yyyy"></ajaxToolkit:CalendarExtender>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Contact Number</label>
                            <div class="input-group">
                                <asp:TextBox ID="contact" runat="server" CssClass="form-control" placeholder="Contact Number" autocomplete="off" type="number" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Department</label>
                            <div class="input-group">
                                <asp:DropDownList ID="department" CssClass="form-control" required runat="server">
                                    <asp:ListItem Text="-------------------------select-------------------------" Value=""></asp:ListItem>
                                    <asp:ListItem>Computer Science Engineering</asp:ListItem>
                                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem>Civil Engineering</asp:ListItem>
                                    <asp:ListItem>Electronics and Communication Engineering</asp:ListItem>
                                    <asp:ListItem>Applied Science</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Father Name</label>
                            <div class="input-group">
                                <asp:TextBox ID="father" runat="server" CssClass="form-control" placeholder="Father Name" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Mother Name</label>
                            <div class="input-group">
                                <asp:TextBox ID="mother" runat="server" CssClass="form-control" placeholder="Mother" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Address</label>
                            <div class="input-group">
                                <asp:TextBox ID="address" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="4" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Last Updated</label>
                            <div class="input-group">
                                <asp:TextBox ID="lastupd" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Password</label>
                            <div class="input-group">
                                <asp:TextBox ID="password" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="InputEmail">Confirm Password</label>
                            <div class="input-group">
                                <asp:TextBox ID="cpassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password" required></asp:TextBox>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <asp:Button ID="submit" runat="server" Text="Update" CssClass="btn btn-info pull-right" OnClick="submit_Click" />
                                <asp:Button ID="edit" runat="server" Text="edit" CssClass="btn btn-info pull-right" OnClick="edit_Click" />

                            </div>
                        </div>


                        <asp:Label ID="success" runat="server" Text="" CssClass="alert alert-success glyphicon glyphicon-ok "></asp:Label>
                </form>
                <%--    <div class="col-lg-5 col-md-push-1">
            <div class="col-md-12">
                <div class="alert alert-success">
                    <strong><span class="glyphicon glyphicon-ok"></span> Success! Message sent.</strong>
                </div>
                <div class="alert alert-danger">
                    <span class="glyphicon glyphicon-remove"></span><strong> Error! Please check all page inputs.</strong>
                </div>
            </div>
        </div>--%>
            </div>
        </div>
    </div>
</asp:Content>

