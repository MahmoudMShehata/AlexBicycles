ActiveAdmin.register Bicycle do
  permit_params :model, :style, :price, :color, :description, :image

  controller do 
    def create
      if bicycle_params[:model].include?("cat")
        begin
          response        = HTTParty.get("https://catfact.ninja/fact")
          cat_fact_length = JSON.parse(response.body)["length"]
        rescue SocketError
          cat_fact_length = 99 
        end

        begin
          cat_pricing     = (bicycle_params[:price].to_i * cat_fact_length) / 5
          @bicycle        = Bicycle.create!(bicycle_params.merge!(price: cat_pricing))
          redirect_to admin_bicycles_path, notice: "#{@bicycle.model} bicycle has been added to the database successfully!"
        rescue ActiveRecord::RecordInvalid
          redirect_back_or_to admin_bicycles_path, alert: "Bicycle Model, Style & price must exist."
        end
      else

        begin
          @bicycle = Bicycle.create!(bicycle_params)
          redirect_to admin_bicycles_path, notice: "#{@bicycle.model} bicycle has been added to the database successfully!"
        rescue ActiveRecord::RecordInvalid
          redirect_back_or_to admin_bicycles_path, alert: "Bicycle Model, Style & price must exist."
        end
      end
    end
  
    private
  
    def bicycle_params
      params.require(:bicycle).permit(:model, :style, :price, :color, :description, :image)
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
