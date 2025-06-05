class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :show, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: "Company created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: "Company deleted."
    else
      render :index
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
