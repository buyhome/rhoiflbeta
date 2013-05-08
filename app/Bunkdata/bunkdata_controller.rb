require 'rho/rhocontroller'
require 'helpers/browser_helper'

class BunkdataController < Rho::RhoController
  include BrowserHelper

  # GET /Bunkdata
  def index
    @bunkdatum = Bunkdata.find(:all)
    render :back => '/app'
  end

  # GET /Bunkdata/{1}
  def show
    @bunkdata = Bunkdata.find(@params['id'])
    if @bunkdata
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Bunkdata/new
  def new
    @bunkdata = Bunkdata.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Bunkdata/{1}/edit
  def edit
    @bunkdata = Bunkdata.find(@params['id'])
    if @bunkdata
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Bunkdata/create
  def create
    @bunkdata = Bunkdata.create(@params['bunkdata'])
    redirect :action => :index
  end

  # POST /Bunkdata/{1}/update
  def update
    @bunkdata = Bunkdata.find(@params['id'])
    @bunkdata.update_attributes(@params['bunkdata']) if @bunkdata
    redirect :action => :index
  end

  # POST /Bunkdata/{1}/delete
  def delete
    @bunkdata = Bunkdata.find(@params['id'])
    @bunkdata.destroy if @bunkdata
    redirect :action => :index  
  end
end
