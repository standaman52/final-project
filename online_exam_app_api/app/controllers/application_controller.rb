class ApplicationController < ActionController::API

  require 'jwt'
  require 'dotenv-rails'
  require 'bcrypt'


  def authenticate_token
    puts "AUTHENTICATE JWT"
    render json: {status: 401, message: "unauthorized please login or sign up"} unless decode_token(bearer_token)
  end

  #parse incoming header from frontend
  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]
    #pass token without the bearer using regex
    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    #set token value
    puts token = JWT.decode(token_input, ENV['JWT_SECRET'], true)
    #render json: {decoded: true}
    #make sure this runs
    JWT.decode(token_input, ENV['JWT_SECRET'], true)
    #if it doesnt run
  rescue
    render json: {status: 401, message: "unauthorized please login in or sign up"}
  end

  def get_current_user
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    #puts "HELLO THERE WORLD I AM PRINTING HERE ================"
    User.find(decoded_jwt[0]["user"]["id"])
  end

  def authorize_user
    puts "AUTHORIZE USER"
    puts "params #{params[:id]}"
    render json: {status: 401, message: "unauthorized please sign in or register"} unless get_current_user.id == params[:id].to_i
  end

end
