json.data do
  json.id @user.id
  json.email @user.email
  json.username @user.username
  json.role @user.role
  json.access_token @access_token
  json.refresh_token @refresh_token
  json.expires_in @expires_in
end