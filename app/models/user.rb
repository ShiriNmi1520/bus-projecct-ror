class User < ApplicationRecord
  def register
    request.raw_post
  end

  def login
  end

  def generateResetToken
  end

  def verify
  end

  def resetPassword
  end
end
