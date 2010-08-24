class DocsController < ApplicationController
  before_filter :authenticate, :only => [:new, :edit, :create, :update, :destroy]

  def index
    @docs = if params[:q].present?
      Doc.search(params[:q])
    else
      Doc
    end.paginate(params[:page],
      (params[:per_page] || 10).to_i,
      :order => "updated_at DESC")

    respond_to do |format|
      format.html
      format.xml  { render :xml => @docs }
      format.atom { render :layout => false }
      format.js   { render :json => @docs.to_json, :callback => params[:callback] }
      format.csv { render :layout => false }
      format.txt { render :layout => false }
    end
  end

  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @doc }
      format.js   { render :json => @doc.to_json, :callback => params[:callback] }
    end
  end

  def new
    time = Time.new
    @doc = Doc.new(:created_at => time, :updated_at => time)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @doc }
    end
  end

  def edit
    @doc = Doc.find(params[:id])
  end

  def create
    @doc = Doc.new(params[:doc])

    respond_to do |format|
      if @doc.save
        flash[:notice] = t('Doc was successfully created.')
        format.html { redirect_to doc_path(@doc) }
        format.xml  { render :xml => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        flash[:notice] = t('Doc was successfully updated.')
        format.html { redirect_to doc_path(@doc) }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to docs_path }
      format.xml  { head :ok }
    end
  end
end
