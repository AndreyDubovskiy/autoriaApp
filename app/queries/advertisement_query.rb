class AdvertisementQuery
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:title])
    if (params[:commit] == "SearchUp")
      scoped = sort(scoped, :name)
    elsif (params[:commit] == "SearchDown")
      scoped = sort(scoped, :name, :desc)
    elsif (params[:commit] == "Up2")
      scoped = sort_by_otdelenies(scoped).reverse
    elsif (params[:commit] == "Down2")
      scoped = sort_by_otdelenies(scoped)
    elsif (params[:commit] == "Up3")
      scoped = sort_by_doctors(scoped).reverse
    elsif (params[:commit] == "Down3")
      scoped = sort_by_doctors(scoped)
    end
    scoped
  end

  private def search(scoped, query = nil)
    query ? scoped.where("title LIKE '%#{query}%'") : scoped
  end

  private def sort(scoped, sort_type = :name, sort_direction = :asc)
    scoped.order(sort_type => sort_direction)
  end

  private def where_autos_by_type(scoped, where_type = nil, value = nil)
    (where_type and value) ? scoped.joins(:auto).where(autos: { where_type: value }) : scoped
  end

end
