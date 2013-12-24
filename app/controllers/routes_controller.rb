class RoutesController < ApplicationController
  require 'open-uri'
  require 'net/http'
  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.where(:verified => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

  # GET /routes/1
  # GET /routes/1.json
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.json
  def new
    @route = Route.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(params[:route])

    route_html = Nokogiri::HTML(open(@route.url))

    @activity_id = @route.url.split('/').last()
    @api_url = "https://www.strava.com/api/v3/activities/" + @activity_id + "?access_token=9a3dd1938530a0db29fc42f4eedc4ff975e78190"

    parsed_uri = URI.parse(@api_url)
    http = Net::HTTP.new(parsed_uri.host, parsed_uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(parsed_uri.request_uri)
    response = http.request(request)
    parsed_response = JSON.parse(response.body)

    @route.distance = parsed_response["distance"]
    @route.elevation = parsed_response["total_elevation_gain"]
    @route.map_polyline = parsed_response["map"]["summary_polyline"]

    if @route.name.empty?
      @route.name = parsed_response["name"]
    end

    respond_to do |format|
      if @route.save
        format.html { redirect_to routes_url, notice: 'Route was successfully created.' }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end
end
