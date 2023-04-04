<p style="color: green"><%= notice %></p>

<%= render @eleve %>

<div>
  <%= link_to "Edit this eleve", edit_eleve_path(@eleve) %> |
  <%= link_to "Back to eleves", eleves_path %>

  <%= button_to "Destroy this eleve", @eleve, method: :delete %>
</div>
