require 'rho/rhocontroller'
require 'helpers/browser_helper'

class FltinfoController < Rho::RhoController
  include BrowserHelper

  # GET /Fltinfo
  def index
    @fltinfos = Fltinfo.find(:all)
    render :back => '/app'
  end

  # GET /Fltinfo/{1}
  def show
    @fltinfo = Fltinfo.find(@params['id'])
    if @fltinfo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Fltinfo/new
  def new
    @fltinfo = Fltinfo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Fltinfo/{1}/edit
  def edit
    @fltinfo = Fltinfo.find(@params['id'])
    if @fltinfo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Fltinfo/create
  def create
    @fltinfo = Fltinfo.create(@params['fltinfo'])
    redirect :action => :index
  end

  # POST /Fltinfo/{1}/update
  def update
    @fltinfo = Fltinfo.find(@params['id'])
    @fltinfo.update_attributes(@params['fltinfo']) if @fltinfo
    redirect :action => :index
  end

  # POST /Fltinfo/{1}/delete
  def delete
    @fltinfo = Fltinfo.find(@params['id'])
    @fltinfo.destroy if @fltinfo
    redirect :action => :index  
  end
end
