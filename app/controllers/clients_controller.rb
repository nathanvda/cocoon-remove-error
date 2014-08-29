class ClientsController < ApplicationController
  # GET /clientes
  # GET /clientes.json
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @clients }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @client }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.json
  def new
    @client = Client.new
    respond_to do |format| format.html # new.html.erb
      format.json  { render :json => @client }
    end
  end

  # GET /clientes/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, :notice => 'Cliente cadastrado com sucesso.') }
        format.json  { render :json => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to(@client, :notice => 'Cliente atualizado com sucesso.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.json  { head :ok }
    end
  end

  private
  def client_params
    params.require(:client).permit(:name, stores_attributes: [:client_id, :name, :name2, :district, :address, :number, :complement, :cnpj, :city_id, :mail, :obs, :status, :phone, :phone2, :phone3, :sversion, :created_at, :updated_at, :_destroy])
  end
end