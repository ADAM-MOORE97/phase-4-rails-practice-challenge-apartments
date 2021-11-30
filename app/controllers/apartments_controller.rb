class ApartmentsController < ApplicationController

def index
    apartments = all_apartments
    render json: apartments
end

def show
    apartments = find_apartment
    render json: apartments
end
def create
    apartment = Apartment.create(apartment_params)
    render json: apartment
end

def destroy
    apartment = find_apartment
    apartment.destroy
    header :no_content
end



    private
    def apartment_params
        params.permit(:number)
    end
    def all_apartments
        Apartments.all
    end
    def find_apartment
        Apartment.find_by(id: params[:id])
    end
end
