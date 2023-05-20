ActiveAdmin.register Bicycle do
  permit_params :model, :style, :price, :color, :description, :image

  controller do 
    def create
      # debugger
      if bicycle_params[:model].include?("cat")
        response        = HTTParty.get("https://catfact.ninja/fact")
        cat_fact_length = JSON.parse(response.body)["length"]
        cat_pricing     = (bicycle_params[:price].to_i * cat_fact_length) / 5
        @bicycle        = Bicycle.create!(bicycle_params.merge!(price: cat_pricing))
      else
        @bicycle = Bicycle.create!(bicycle_params)
      end
      redirect_to admin_bicycles_path, notice: "#{@bicycle.model} bicycle has been added to the database successfully!"
    end
  
    private
  
    def bicycle_params
      params.require(:bicycle)
            .permit(:model, :style, :price, :color, :description)
    end
  end

  form do |f|
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
