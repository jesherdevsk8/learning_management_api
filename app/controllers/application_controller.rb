class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    auth_header = request.headers['Authorization']

    if auth_header
      token = auth_header.split(' ').last

      begin
        JWT.decode(token, 'secret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_student
    student_id  = decode_token[0]['student_id'] if decode_token
    @student    = Student.find_by(id: student_id)
  end

  def authorized_instructor
    instructor_id  = decode_token[0]['instructor_id'] if decode_token
    @instructor = Instructor.find_by(id: instructor_id)
  end

  def authorize
    render json: { message: 'You need to login first' }, status: :unauthorized unless authorized_student || authorized_instructor
  end
end
