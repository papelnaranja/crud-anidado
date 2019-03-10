class EmployeesController < ApplicationController
    def create
        #puede o no tener el @ ya que no sera accesado desde la vista
        @employee = Employee.new(employee_params)
        @employee.company_id = params[:company_id]
        if @employee.save
            # el patron de show necesita un parametro, que es el company id
            redirect_to company_path(params[:company_id])
        else
            redirect_to root_path
        end
    end
    def destroy
        # solo es necesario para la redireccion
        @company = Company.find(params[:company_id]) 
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to company_path(@company)
    end
    private
    #permite solo que desde la vista  permita estos parametros
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
    end
end
