require 'rho/rhocontroller'
require 'helpers/browser_helper'

class AvhkeyController < Rho::RhoController
  include BrowserHelper

  # GET /Avhkey
  def index
    @avhkeys = Avhkey.find(:all)
    render :back => '/app'
  end

  # GET /Avhkey/{1}
  def show
    @avhkey = Avhkey.find(@params['id'])
    if @avhkey
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Avhkey/new
  def new
    @avhkey = Avhkey.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Avhkey/{1}/edit
  def edit
    @avhkey = Avhkey.find(@params['id'])
    if @avhkey
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Avhkey/create
  def create
    @avhkey = Avhkey.create(@params['avhkey'])
    redirect :action => :index
  end

  # POST /Avhkey/{1}/update
  def update
    @avhkey = Avhkey.find(@params['id'])
    @avhkey.update_attributes(@params['avhkey']) if @avhkey
    redirect :action => :index
  end

  # POST /Avhkey/{1}/delete
  def delete
    @avhkey = Avhkey.find(@params['id'])
    @avhkey.destroy if @avhkey
    redirect :action => :index  
  end
end
