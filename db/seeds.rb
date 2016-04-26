if User.all.blank?
  User.create(:email => 'admin@kapshop.com', :password => 'password', :password_confirmation => 'password')
end
