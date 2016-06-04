if User.all.blank?
  User.create(:email => 'tawcharlene@gmail.com', :password => 'ctaw1991', :password_confirmation => 'ctaw1991')
end
