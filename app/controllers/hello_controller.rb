class HelloController < ApplicationController
  def index
    render json: {
      message: "Hello welcome to rails-example-mysql",
      env:  Rails.env,
      all_env: ENV
    }
  end
end
