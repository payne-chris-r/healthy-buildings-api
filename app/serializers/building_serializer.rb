class BuildingSerializer < ActiveModel::Serializer
  attributes :id, :BID, :name, :address, :city, :state, :zip, :lat, :long, :sq_ft, :year_const, :num_floors, :notes
end
