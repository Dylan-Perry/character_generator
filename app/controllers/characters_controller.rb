class CharactersController <ApplicationController
  before_action :generate_categories, only: [:new, :edit]

  def new 
    @character = Character.new()
  end

  def show 
    @character = Character.find(params[:id])
  end 

  def create 
    character = Character.create(character_params)

    if character.save
      character.generate_character_image
      redirect_to character_path(character)
    else 
      require 'pry'; binding.pry
      flash[:error] = character.errors.full_messages.to_sentence
      redirect_to new_character_path
    end 
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    
    if @character.update(character_params)
      redirect_to character_path(@character.id), notice: "Character was successfully updated."
    else
      render :edit
    end
  end

  private 

  def character_params 
    params.require(:character).permit(:style, :name, :gender, :homeland, :skin_color, :hair_color, :likes, :dislikes)
  end

  def generate_categories
    @categories_style = [
      { id: 1, name: "High Fantasy" },
      { id: 2, name: "Low Fantasy" },
      { id: 3, name: "Sci-Fi" },
      { id: 4, name: "Cyberpunk" },
      { id: 5, name: "Steampunk" },
      { id: 6, name: "Post-Apocalyptic" }
    ]

    @categories_gender = [
      { id: 1, name: "Male" },
      { id: 2, name: "Female" },
      { id: 3, name: "Non-Binary" }
    ]

    @categories_homeland = [
      { id: 1, name: "Forest" },
      { id: 2, name: "Riverlands" },
      { id: 3, name: "City" },
      { id: 4, name: "Town" },
      { id: 5, name: "Mountains" },
      { id: 6, name: "Plains" },
      { id: 7, name: "Swamp" },
      { id: 8, name: "Underground" },
      { id: 9, name: "Desert" },
    ]

    @categories_skin_color = [
      { id: 1, name: "Black" },
      { id: 2, name: "Brown" },
      { id: 3, name: "Yellow" },
      { id: 4, name: "Tan" },
      { id: 5, name: "White" },
      { id: 6, name: "Beige" },
      { id: 7, name: "Red" },
      { id: 8, name: "Orange" },
      { id: 9, name: "Green" },
      { id: 10, name: "Blue" },
      { id: 11, name: "Pink" },
      { id: 12, name: "Purple" }
    ]

    @categories_hair_color = [
      { id: 1, name: "Black" },
      { id: 2, name: "Brown" },
      { id: 3, name: "Yellow" },
      { id: 4, name: "Tan" },
      { id: 5, name: "White" },
      { id: 6, name: "Beige" },
      { id: 7, name: "Red" },
      { id: 8, name: "Orange" },
      { id: 9, name: "Green" },
      { id: 10, name: "Blue" },
      { id: 11, name: "Pink" },
      { id: 12, name: "Purple" }
    ]
  end
end 