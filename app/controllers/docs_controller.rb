class DocsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  # GET /docs
  # GET /docs.xml
  # GET /docs.atom
  # GET /docs.js
  def index
    where = Where.new

    unless params[:q].blank?
      where.and('title LIKE ?', "%#{params[:q]}%").
            or('body LIKE ?', "%#{params[:q]}%")

      @head_title = "#{params[:q]} - #{@title}"
    end

    @page = params[:page] || 1
    @per_page = params[:per_page] || 10

    @docs = Doc.paginate(
      :page => @page,
      :per_page => @per_page,
      :select => 'd.*',
      :from => 'docs d',
      :order => 'updated_at DESC',
      :conditions => where)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @docs }
      format.atom { render :layout => false }
      format.js   { render :json => @docs.to_json, :callback => params[:callback] }
      format.csv { render :layout => false }
      format.txt { render :layout => false }
    end
  end

  # GET /docs/1
  # GET /docs/1.xml
  def show
    @doc = Doc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @doc }
      format.js   { render :json => @doc.to_json, :callback => params[:callback] }
    end
  end

  # GET /docs/new
  # GET /docs/new.xml
  def new
    @doc = Doc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @doc }
    end
  end

  # GET /docs/1/edit
  def edit
    @doc = Doc.find(params[:id])
  end

  # POST /docs
  # POST /docs.xml
  def create
    @doc = Doc.new(params[:doc])

    respond_to do |format|
      if @doc.save
        flash[:notice] = t('Doc was successfully created.')
        format.html { redirect_to(@doc) }
        format.xml  { render :xml => @doc, :status => :created, :location => @doc }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /docs/1
  # PUT /docs/1.xml
  def update
    @doc = Doc.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        flash[:notice] = t('Doc was successfully updated.')
        format.html { redirect_to(@doc) }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @doc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.xml
  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to(docs_url) }
      format.xml  { head :ok }
    end
  end
end
