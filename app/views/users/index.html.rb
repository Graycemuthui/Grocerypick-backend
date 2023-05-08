<p style="color: green"><%= notice %></p>

<h1>Products</h1>

<div id="products">
  <% @users.each do |user| %>
    <%= render product %>
    <p>
      <%= link_to "Show this product", user %>
    </p>
  <% end %>
</div>

<%= link_to "New product", new_user_path %>
