# frozen_string_literal: true

module Api
  module V1
    # app/controllers/signin_controller.rb
    class SigninController < ApplicationController
      before_action :authorize_access_request!, only: [:destroy]

      def create
        user = User.find_by!(email: params[:email])
        if user.authenticate(params[:password])
          session = JWTSessions::Session.new(
            payload: { user_id: user.id },
            refresh_by_access_allowed: true
          )
          tokens = session.login
          response.set_cookie(
            JWTSessions.access_cookie,
            value: tokens[:access],
            httponly: true,
            secure: Rails.env.production?
          )
          render json: { csrf: tokens[:csrf] }
        else
          not_authorized
        end
      end

      def destroy
        session = JWTSessions::Session.new(payload: payload)
        session.flush_by_access_payload
        render json: :ok
      end

      private

      def not_found
        render json: { error: 'Cannot find email/password combination' }, status: :not_found
      end
    end
  end
end
