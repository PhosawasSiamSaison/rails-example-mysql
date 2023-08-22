class HelloController < ApplicationController
  def index
    render json: {
      message: "Hello welcome to rails-example-mysql",
      env:  Rails.env,
      database: ENV['RDS_DATABASE'],
      username: ENV['RDS_USERNAME'],
      password: ENV['RDS_PASSWORD'],
      host: ENV['RDS_HOST'],
      port: 3306,
      DATABASE_URL: ENV['DATABASE_URL'],
    }
  end
end
