class LeasesController < ApplicationController
    def create
        lease = Lease.create(rent: params[:rent])
        render json: lease
    end
    def destroy
        lease = Lease.find_by(id: params[:id])
        lease.destroy
        header :no_content
    end
end
