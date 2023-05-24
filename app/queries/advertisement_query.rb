class AdvertisementQuery
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search_title(initial_scope, params[:title])
    scoped = search_city_id(scoped, params[:city_id])
    scoped = search_color_id(scoped, params[:color_id])
    scoped = search_model_marka_auto_id(scoped, params[:model_marka_auto_id])
    scoped = search_color_id(scoped, params[:country_id])
    scoped = search_type_auto_id(scoped, params[:type_auto_id])
    scoped = search_type_kuzov_id(scoped, params[:type_kuzov_id])
    scoped = search_type_fuel_id(scoped, params[:type_fuel_id])
    scoped = search_type_transmission_id(scoped, params[:type_transmission_id])
    scoped = search_type_drive_auto_id(scoped, params[:type_drive_auto_id])
    scoped = search_valute_id(scoped, params[:valute_id])
    scoped = search_year(scoped, params[:year])
    scoped = search_price_range(scoped, params[:min_price], params[:max_price])
    if(params[:sort_price] == 'up')
      scoped = sort_by_price(scoped, :desc)
    elsif (params[:sort_price] == 'down')
      scoped = sort_by_price(scoped, :asc)
    else
      scoped = sort_by_title(scoped)
    end



    scoped
  end

  private def search_year(scoped, query = nil)
    (query and query != "") ? scoped.where("year = #{query}") : scoped
  end

  private def sort_by_title(scoped, sort_direction = :asc)
    scoped.order("title #{sort_direction}")
  end


  private def sort_by_price(scoped, sort_direction = :asc)
    scoped.joins(price_data: { price: :valute })
          .order(Arel.sql("prices.count * valutes.rate #{sort_direction}"))
  end

  private def search_valute_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(price_data: { price: :valute }).where("valutes.id = #{query}") : scoped
  end

  private def search_type_drive_auto_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { type_drive_auto_id: query.to_i }) : scoped
  end

  private def search_type_transmission_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { type_transmission_id: query.to_i }) : scoped
  end

  private def search_type_fuel_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { type_fuel_id: query.to_i }) : scoped
  end
  private def search_type_kuzov_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { type_kuzov_id: query.to_i }) : scoped
  end

  private def search_type_auto_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { type_auto_id: query.to_i }) : scoped
  end

  private def search_title(scoped, query = nil)
    (query and query != "") ? scoped.where("title LIKE '%#{query}%'") : scoped
  end

  private def search_city_id(scoped, query = nil)
    (query and query != "") ? scoped.where("cities.id = #{query}") : scoped
  end

  private def search_country_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(auto: :country).where(countries: { id: query.to_i }) : scoped
  end
  private def search_color_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { color_id: query.to_i }) : scoped
  end

  private def search_model_marka_auto_id(scoped, query = nil)
    (query and query != "") ? scoped.joins(:auto).where(autos: { model_marka_auto_id: query.to_i }) : scoped
  end

  private def sort(scoped, sort_type = :name, sort_direction = :asc)
    scoped.order(sort_type => sort_direction)
  end

  private def where_autos_by_type(scoped, where_type = nil, value = nil)
    (where_type and value) ? scoped.joins(:auto).where(autos: { where_type: value }) : scoped
  end

  private def search_price_range(scoped, min_price = nil, max_price = nil)
    if min_price.present? and max_price.present? and min_price
      scoped.joins(price_data: { price: :valute })
            .where("prices.count BETWEEN ? AND ?", min_price.to_f, max_price.to_f)
    elsif min_price.present?
      scoped.joins(price_data: { price: :valute })
            .where("prices.count >= ?", min_price.to_f)
    elsif max_price.present?
      scoped.joins(price_data: { price: :valute })
            .where("prices.count <= ?", max_price.to_f)
    else
      scoped
    end
  end

end
