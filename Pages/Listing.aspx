﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="Automobile_repair_shop.Pages.Listing" MasterPageFile="~/Pages/Store.Master" %>
<%@ Import Namespace="System.Web.Routing" %>
<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
      <asp:Repeater ItemType="Automobile_repair_shop.Models.Service" SelectMethod="GetServices" runat="server">
          <ItemTemplate>service
              <div class="item">
                  <h3><%# Item.Name %></h3>
                  <%# Item.Description %>
                  <h4> <%# Item.Price.ToString("c") %></h4>
                  <button name="add" type="submit" value="<%# Item.ServiceId %>">
                      В корзину
                  </button>
              </div>
          </ItemTemplate>
      </asp:Repeater>
    </div>
    <div class="pager">
        <%
             for (int i = 1; i <= MaxPage; i++)
            {
                string selectedCategory = (string)Page.RouteData.Values["category"] ?? Request.QueryString["category"];
                string path = RouteTable.Routes.GetVirtualPath(null, null, new RouteValueDictionary() { { "category", selectedCategory}, { "page", i} }).VirtualPath;
                Response.Write(String.Format("<a href='{0}' {1}>{2}</a>", path, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>