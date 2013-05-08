require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FltController < Rho::RhoController
  include BrowserHelper

  # GET /Flt
  def index
    @flts = Flt.find(:all)
    render :back => '/app'
  end

  # GET /Flt/{1}
  def show
    @flt = Flt.find(@params['id'])
    if @flt
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Flt/new
  def new
    @flt = Flt.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Flt/{1}/edit
  def edit
    @flt = Flt.find(@params['id'])
    if @flt
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Flt/create
  def create
    @flt = Flt.create(@params['flt'])
    redirect :action => :index
  end

  # POST /Flt/{1}/update
  def update
    @flt = Flt.find(@params['id'])
    @flt.update_attributes(@params['flt']) if @flt
    redirect :action => :index
  end

  # POST /Flt/{1}/delete
  def delete
    @flt = Flt.find(@params['id'])
    @flt.destroy if @flt
    redirect :action => :index  
  end
end
