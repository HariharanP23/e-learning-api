class departmentTermsController < ApplicationController
  before_action :authenticate_user

  def index
    @terms = Term.all
  end

  def create
    @term = Term.new(term_params)
    if @term.save
      render_success "Create Successfully"
    else
      render_error @term.errors, status: 422
    end
  end

  private

  def term_params
    params.require(:term).permit(:name, :start_date, :end_date)
  end
end