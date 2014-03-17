Given /2 similar articles, each with a new blogger and 1 comment/ do |articles_table|
  articles_table.hashes.each do |article|
    default_param = {:login => 'null', :password => '123456789', :password_confirmation => '123456789', :email => 'test@test.com', :profile_id => 2, :state => 'active', :firstname => 'test', :lastname => 'test', :nickname => 'test', :editor => 'visual', :text_filter_id => 1, :notify_via_email => 0, :notify_on_new_articles => 0, :notify_on_comments => 0}
    param = default_param
    param[:login] = article[:blogger]
    @user = User.new
    @user.attributes = param
    @user.name = @user.login
    @user.save
  end
end
