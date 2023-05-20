class Bicycle < ApplicationRecord
  has_one_attached :image

  def self.filter(model, style, min_price, max_price)
    style == "all" ? style = nil : style
    
    return where("model LIKE ? AND style = ? AND price >= ? AND price <= ? ", "%#{model}%", style, min_price, max_price) if !model.empty? && style && !min_price.empty? && !max_price.empty?
    return where("model LIKE ? AND style = ? AND price >= ? ", "%#{model}%", style, min_price) if !model.empty? && style && !min_price.empty?
    return where("model LIKE ? AND style = ? AND price <= ? ", "%#{model}%", style, max_price) if !model.empty? && style && !max_price.empty?
    return where("model LIKE ? AND price >= ? AND price <= ? ", "%#{model}%", min_price, max_price) if !model.empty? && !min_price.empty? && !max_price.empty?
    return where("model LIKE ? AND style = ? ", "%#{model}%", style) if !model.empty? && style
    return where("model LIKE ? AND price >= ? ", "%#{model}%", min_price) if !model.empty? && !min_price.empty?
    return where("model LIKE ? AND price <= ? ", "%#{model}%", max_price) if !model.empty? && !max_price.empty?
    return where("style = ? AND price >= ? AND price <= ?", style, min_price, max_price) if style && !min_price.empty? && !max_price.empty?
    return where("style = ? AND price >= ?", style, min_price) if style && !min_price.empty?
    return where("style = ? AND price <= ?", style, max_price) if style && !max_price.empty?
    return where("model LIKE ?", "%#{model}%") if !model.empty?
    return where(style: style) if style
    return where("price >= ? AND price <= ?", min_price, max_price) if !min_price.empty? && !max_price.empty?
    return where("price >= ?", min_price) if !min_price.empty?
    return where("price <= ?", max_price) if !max_price.empty?
    return Bicycle.all
  end
end
