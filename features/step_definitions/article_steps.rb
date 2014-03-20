Given /2 similar articles, each with a new blogger and 1 comment/ do |articles_table|
  articles_table.hashes.each do |article|
    default_param = {:login => 'null', :password => '123456789', :password_confirmation => '123456789', :email => 'test@test.com', :profile_id => 2, :state => 'active', :firstname => 'test', :lastname => 'test', :nickname => 'test', :editor => 'visual', :text_filter_id => 1, :notify_via_email => 0, :notify_on_new_articles => 0, :notify_on_comments => 0}
    param = default_param
    param[:login] = article[:blogger]
    param[:email] = "#{article[:blogger]}@test.com"
    @user = User.new
    @user.attributes = param
    @user.name = @user.login
    @user.save
    @article = Article.new
    @article.title = article[:title]
    @article.body = article[:body]
    @article.author = article[:blogger]
    @article.user = @user
    @article.published = true
    @article.save
    default_param = {:author => 'test', :email => 'test@test.com', :url => 'http://test.com/test', :body => 'test'}
    param = default_param
    param[:author] = article[:blogger]
    param[:body] = article[:comment]
    @comment = @article.with_options(new_comment_defaults(@user, @article)) do |art|
      art.add_comment(param)
    end
    @comment.save
  end
end

def new_comment_defaults(current_user, article)
  { :ip  => '127.0.0.1',
    :author     => 'Anonymous',
    :published  => true,
    :user       => current_user,
    :user_agent => '',
    :referrer   => '',
    :permalink  => article.permalink_url }
end
