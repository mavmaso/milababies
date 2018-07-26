class ApplicationController < ActionController::Base
  def after_sign_in_path_for(*)
    au_pairs_path
  end
end
