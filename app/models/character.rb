class Character < ApplicationRecord
    validates :style, :name, :gender, :homeland, :skin_color, :hair_color, :likes, :dislikes, presence: true

    has_many :character_tags
    has_many :tags, through: :character_tags

    def generate_character_image
        client = OpenAI::Client.new
        response = client.images.generate(
            parameters: {
                model: "dall-e-3",
                prompt: "This is a #{self.gender} #{self.style} roleplaying character named #{self.name} who lives in a #{self.style} #{self.homeland}. Their skin color is #{self.skin_color}, and their hair color is #{self.hair_color}. They like #{self.likes}, and they dislike #{self.dislikes}.",
                size: "1024x1792",
                quality: "standard" 
            }
        ).symbolize_keys

        self.update(
            portrait: response[:data].first["url"], 
            description: response[:data].first["revised_prompt"]
        )
    end
end