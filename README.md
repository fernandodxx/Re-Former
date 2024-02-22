# Isso faz parte do Projeto Forms no Currículo Ruby on Rails do Projeto Odin. Encontre-o em http://www.theodinproject.com 

* 1 Create Model User Params name, email, password 

* 2 Create validates model user
 ````
   validates :name, :email, :password, presence: true
   validates :password, length: { in: 6..15 }
   validates :name, length: { minimum: 2 }
   validates :email, uniqueness: true
 ````

* 3 Create controller User com methods new e create

* 4 Create vews user new.html.erb

* 5 Method new 
 ````
  def new
    @user = User.new
  end
 ````
* 6 Routes resouces User
 ````
 resources :users, only: [:new, :create]
 ````
* 7 Create form vews/users/new.html.erb
 ````
  <%= form_with model: user do |f| %>

    <% if user.errors.any? %>
      <div style="color: red">
        <h2><%= pluralize( user.errors.count, "error") %> prohibited this user from being saved:</h2>
  
        <ul>
          <% user.errors.each do |error| %>
            <li><%= error.full_message %></li>
          <% end %>
        </ul>
      </div>
    <% end %>

    <div>
      <%= f.label :name, 'Name:'%><br>
      <%= f.text_field :name%>
    </div>
  
    <div>
      <%= f.label :email, 'Email:'%><br>
      <%= f.email_field :email, placeholder:"Exemple@email.com"%>
    </div>
  
    <div>
      <%= f.label :password, 'Password:' %><br>
      <%= f.password_field :password%>
    </div>
  
    <div>
      <%= f.submit %>
    </div>

  <% end %>
  ````
*8 Method create
 ````
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
 ````
* 9 Private params 
 ````
 private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
 ````
* 10 method edit 
 ````
  def edit
    @user = User.find(params[:id])
  end
 ````
* 11 Create View edit.html.erb
  ````
  <h1> Edit User:.</h1>
  ````
* 12 Create View _form.html.erb
 ````
  <%= form_with model: user do |f| %>

    <% if user.errors.any? %>
      <div style="color: red">
        <h2><%= pluralize( user.errors.count, "error") %> prohibited this user from being saved:</h2>
  
        <ul>
          <% user.errors.each do |error| %>
            <li><%= error.full_message %></li>
          <% end %>
        </ul>
      </div>
    <% end %>
  
    <div>
      <%= f.label :name, 'Name:'%><br>
      <%= f.text_field :name%>
    </div>
  
    <div>
      <%= f.label :email, 'Email:'%><br>
      <%= f.email_field :email, placeholder:"Exemple@email.com"%>
    </div>
  
    <div>
      <%= f.label :password, 'Password:' %><br>
      <%= f.password_field :password%>
    </div>
  
    <div>
      <%= f.submit %>
    </div>

  <% end %>
 ````
* 13 update new.html.erb end edit.html.erb
 ````
  <%= render "form", user: @user %>
 ````
