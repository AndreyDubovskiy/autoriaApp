class AdvertisementsController < ApplicationController
  #GET
  def allAdvertisements
    #@advs = AdvertisementQuery.new(Advertisement.all).call(params)
    #@advs = @advs.page(params[:page]).per(10)
    @advs = Advertisement.all
    render 'all'
    #<%= paginate @advs %>
  end

  def show
    @tmp = Advertisement.find(params[:id])
    if(@tmp)
      render 'show'
    else
      redirect_to advertisements_path
    end
  end

  #GET
  def createPage
    render 'create'
  end

  #POST
  def create
    @new_auto = Auto.new
    @new_auto.is_new = (params.has_key? 'is_new' ? 1 : 0)
    @new_auto.year = params[:year].to_i
    @new_auto.mileage = params[:mileage].to_i
    @new_auto.type_auto_id = params[:type_auto_id].to_i
    @new_auto.model_marka_auto_id = params[:model_marka_auto_id].to_i
    @new_auto.type_kuzov_id = params[:type_kuzov_id].to_i
    @new_auto.country_id = params[:country_id].to_i
    @new_auto.color_id = params[:color_id].to_i
    @new_auto.type_fuel_id = params[:type_fuel_id].to_i
    @new_auto.type_transmission_id = params[:type_transmission_id].to_i
    @new_auto.type_drive_auto_id = params[:type_drive_auto_id].to_i
    @new_auto.save
    @new = Advertisement.new()
    @new.user = current_user_login.user
    @new.title = params[:title]
    @new.text = params[:text]
    @new.auto = @new_auto
    @new.city_id = params[:city_id].to_i
    @new.save
    @new_photo = Photo.new
    @new_photo.file.attach(params[:file])
    @new_photo.advertisement = @new
    @new_photo.save
    @new_price = Price.new
    @new_price.count = params[:count].to_i
    @new_price.valute_id = params[:valute_id].to_i
    @new_price.save
    @new_price_data = PriceDatum.new
    @new_price_data.date = Date.today
    @new_price_data.price = @new_price
    @new_price_data.advertisement = @new
    @new_price_data.save

    redirect_to advertisements_show_path(id: @new.id)
  end

  #GET
  def editPage
    @tmp = Advertisement.find(params[:id])
    render 'edit'
  end

  #POST
  def edit
    @tmp = Advertisement.find(params[:id])
    if @tmp
      @new_auto = @tmp.auto
      @new_auto.is_new = (params.has_key? 'is_new' ? true : false )
      @new_auto.year = params[:year].to_i
      @new_auto.mileage = params[:mileage].to_i
      @new_auto.type_auto_id = params[:type_auto_id].to_i
      @new_auto.model_marka_auto_id = params[:model_marka_auto_id].to_i
      @new_auto.type_kuzov_id = params[:type_kuzov_id].to_i
      @new_auto.country_id = params[:country_id].to_i
      @new_auto.color_id = params[:color_id].to_i
      @new_auto.type_fuel_id = params[:type_fuel_id].to_i
      @new_auto.type_transmission_id = params[:type_transmission_id].to_i
      @new_auto.type_drive_auto_id = params[:type_drive_auto_id].to_i
      @new_auto.save
      puts("pipiska")
      puts(@new_auto.errors.full_messages)
      @tmp.title = params[:title]
      @tmp.text = params[:text]
      @tmp.city_id = params[:city_id].to_i
      @tmp.save
      if (params.has_key? 'file')
        @new_photo = @tmp.photos.first
        @new_photo.file.attach(params[:file])
        @new_photo.save
      end
      @new_price_data = @tmp.price_data.last
      @new_price = @new_price_data.price
      if (params[:count].to_i != @new_price.count)
        @new_price_data = PriceDatum.new
        @new_price_data.date = Date.today
        @new_price_data.advertisement = @tmp
        @new_price_data.save
        @new_price = Price.new
        @new_price.count = params[:count].to_i
        @new_price.valute_id = params[:valute_id].to_i
        @new_price.price_datum = @new_price_data
        @new_price.save
      else
        @new_price.valute_id = params[:valute_id].to_i
        @new_price.save
      end
    end
    redirect_to advertisements_show_path(id: @tmp.id)
  end

  #DELETE
  def delete
    @tmp = Advertisement.find(params[:id])
    if @tmp and current_user_logins.user.id == @tmp.user.id
      @tmp.delete
    end
    redirect_to advertisements_path
  end
end
