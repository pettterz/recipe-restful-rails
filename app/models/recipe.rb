class Recipe < ApplicationRecord
    include ActiveModel::Serializers::JSON

    attr_accessor :name
  
    def attributes
      {
          id: nil,
          title: nil,
          making_time: nil,
          serves: nil,
          ingredients: nil,
          cost: nil
      }
    end

    def as_json(opts = {})
        json = super(opts)
        json["cost"] = self.cost.to_s
        json
    end

    def json_all()
        json = self.as_json()
        json["cost"] = self.cost.to_s
        json["created_at"] = self.created_at.to_formatted_s(:db)
        json["updated_at"] = self.updated_at.to_formatted_s(:db)
        json
    end
end
