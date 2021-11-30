class TenantsController < ApplicationController
    def index
        tenant = all_tenants
        render json: tenant
    end
    
    def show
        tenant = find_tenant
        render json: tenant
    end
    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant
    end
    
    def destroy
        tenant = find_tenant
        tenant.destroy
        header :no_content
    end
    
    
    
        private
        def tenant_params
            params.permit(:name, :age)
        end
        def all_tenants
            Tenant.all
        end
        def find_tenant
            Tenant.find_by(id: params[:id])
        end
end
