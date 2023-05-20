module StylesHelper
  def all_styles
    styles = ["all"]
    Bicycle.all.each do |bicycle|
      styles << bicycle.style if !styles.include?(bicycle.style)
    end
    styles
  end
end