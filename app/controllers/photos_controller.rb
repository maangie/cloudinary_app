# 写真の一覧表示・詳細表示・登録・編集・削除を扱うコントローラ。
# HTML と JSON の両方に応答する。
class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # 写真の一覧を表示する。
  #
  # GET /photos
  # GET /photos.json
  #
  # 戻り値:: なし（一覧画面または JSON を描画する）
  def index
    @photos = Photo.all
  end

  # 写真の詳細を表示する。
  #
  # GET /photos/1
  # GET /photos/1.json
  #
  # 戻り値:: なし（詳細画面または JSON を描画する）
  def show
  end

  # 写真の新規登録画面を表示する。
  #
  # GET /photos/new
  #
  # 戻り値:: なし（新規登録画面を描画する）
  def new
    @photo = Photo.new
  end

  # 写真の編集画面を表示する。
  #
  # GET /photos/1/edit
  #
  # 戻り値:: なし（編集画面を描画する）
  def edit
  end

  # 写真を登録する。画像は Cloudinary にアップロードする。
  # 成功したら詳細画面にリダイレクトし、失敗したら新規登録画面を 422 で再表示する。
  #
  # POST /photos
  # POST /photos.json
  #
  # 戻り値:: なし（リダイレクトするか、画面または JSON を描画する）
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: t(:created, model: 'Photo') }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_content }

        format.json do
          render json: @photo.errors, status: :unprocessable_content
        end
      end
    end
  end

  # 写真を更新する。
  # 成功したら詳細画面にリダイレクトし、失敗したら編集画面を 422 で再表示する。
  #
  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  #
  # 戻り値:: なし（リダイレクトするか、画面または JSON を描画する）
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: t(:updated, model: 'Photo') }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_content }

        format.json do
          render json: @photo.errors, status: :unprocessable_content
        end
      end
    end
  end

  # 写真を削除し、一覧画面に 303 でリダイレクトする。
  #
  # DELETE /photos/1
  # DELETE /photos/1.json
  #
  # 戻り値:: なし（リダイレクトするか、空のレスポンスを返す）
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html do
        redirect_to photos_url, notice: t(:destroyed, model: 'Photo'), status: :see_other
      end

      format.json { head :no_content }
    end
  end

  private
    # URL の id で写真を探し、@photo に入れる。各アクションの before_action で使う。
    #
    # 戻り値:: 見つかった Photo。見つからなければ ActiveRecord::RecordNotFound を投げる
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # リクエストから写真の属性を取り出す。許可するのは title と image だけ。
    # 画像があれば、そのファイルサイズを bytes に入れる。
    #
    # 戻り値:: title・image・bytes を持つ ActionController::Parameters
    def photo_params
      p = params.expect(photo: [:title, :image])
      p[:bytes] = p[:image].size if p[:image]
      p
    end
end
