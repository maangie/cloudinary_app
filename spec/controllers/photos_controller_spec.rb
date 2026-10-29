require 'rails_helper'

# このテストは、scaffold ジェネレータを実行したときに rspec-rails が生成したもの。
# scaffold ジェネレータで Rails が生成したコントローラのコードを、RSpec で
# どのように仕様として書けるかを示している。
#
# 実装のコードは、Rails の scaffold ジェネレータで生成されたものを前提にしている。
# 拡張ライブラリを使って違うコントローラのコードを生成している場合、
# このテストが通るとは限らない。
#
# 使っているのは Rails と rspec-rails の API だけ。テストをもっと表現豊かに
# 書けるツールはいろいろあるが、単純で安定した状態を保つため、Rails と
# rspec-rails の API だけにとどめている。
#
# このジェネレータの以前の版と比べて、スタブやメッセージの期待はほとんど
# 使っていない。スタブを使うのは、テストに必要なオブジェクトを手に入れる
# もっと簡単な方法がないときだけ。メッセージの期待を使うのは、インスタンスが
# 特定のメッセージを受け取ることを示すもっと簡単な方法がないときだけ。

RSpec.describe PhotosController, type: :controller do
  # 正しい Photo を作るのに必要な、最小限の属性を返す。
  # Photo にバリデーションを追加したら、ここの属性も忘れずに合わせること。
  let(:valid_attributes) do
    attributes_for(:photo)
  end

  let(:invalid_attributes) do
    attributes_for(:photo, title: '')
  end

  # PhotosController に定義したフィルタ（認証など）を通るために、セッションに
  # 入れておくべき最小限の値を返す。こちらも忘れずに最新に保つこと。
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'すべての写真を @photos に代入する' do
      photo = Photo.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:photos)).to eq([photo])
    end
  end

  describe 'GET #show' do
    it '指定した写真を @photo に代入する' do
      photo = Photo.create! valid_attributes
      get :show, params: { id: photo.to_param }, session: valid_session
      expect(assigns(:photo)).to eq(photo)
    end
  end

  describe 'GET #new' do
    it '新しい写真を @photo に代入する' do
      get :new, params: {}, session: valid_session
      expect(assigns(:photo)).to be_a_new(Photo)
    end
  end

  describe 'GET #edit' do
    it '指定した写真を @photo に代入する' do
      photo = Photo.create! valid_attributes
      get :edit, params: { id: photo.to_param }, session: valid_session
      expect(assigns(:photo)).to eq(photo)
    end
  end

  describe 'POST #create' do
    context '正しいパラメータのとき' do
      it '写真を 1 件作成する' do
        expect do
          post :create, params: { photo: valid_attributes }, session: valid_session
        end.to change(Photo, :count).by 1
      end

      it '作成した写真を @photo に代入する' do
        post :create, params: { photo: valid_attributes }, session: valid_session
        expect(assigns(:photo)).to be_a(Photo)
        expect(assigns(:photo)).to be_persisted
      end

      it '作成した写真の詳細画面にリダイレクトする' do
        post :create, params: { photo: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Photo.last)
      end
    end

    context '不正なパラメータのとき' do
      it '作成したが保存されていない写真を @photo に代入する' do
        post :create, params: { photo: invalid_attributes }, session: valid_session
        expect(assigns(:photo)).to be_a_new(Photo)
      end

      it '新規登録画面を再表示する' do
        post :create, params: { photo: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context '正しいパラメータのとき' do
      title = FFaker::BaconIpsum.words.join(' ')

      let(:new_attributes) do
        attributes_for(:photo, title: title)
      end

      it '指定した写真を更新する' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: new_attributes },
            session: valid_session

        photo.reload
        expect(photo.title).to eq title
      end

      it '指定した写真を @photo に代入する' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: valid_attributes }, session: valid_session
        expect(assigns(:photo)).to eq(photo)
      end

      it '写真の詳細画面にリダイレクトする' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: valid_attributes }, session: valid_session
        expect(response).to redirect_to(photo)
      end
    end

    context '不正なパラメータのとき' do
      it '写真を @photo に代入する' do
        photo = Photo.create! valid_attributes
        put :update, params: { id: photo.to_param, photo: invalid_attributes }, session: valid_session
        expect(assigns(:photo)).to eq(photo)
      end

      it '編集画面を再表示する' do
        photo = Photo.create! valid_attributes

        put :update, params: { id: photo.to_param, photo: invalid_attributes },
            session: valid_session

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it '指定した写真を削除する' do
      photo = Photo.create! valid_attributes
      expect do
        delete :destroy, params: { id: photo.to_param }, session: valid_session
      end.to change(Photo, :count).by(-1)
    end

    it '写真の一覧画面にリダイレクトする' do
      photo = Photo.create! valid_attributes
      delete :destroy, params: { id: photo.to_param }, session: valid_session
      expect(response).to redirect_to(photos_url)
    end
  end
end
