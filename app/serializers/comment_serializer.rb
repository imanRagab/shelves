class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :comment, :created_at
  def user
    id_user=object.user_id
    User.where(:id => id_user).select(User.column_names - ["password_digest","email_confirmed","confirm_token","created_at","updated_at","password_reset_token","password_reset_sent_at","email","gender","role","rate"])
  end 
end
