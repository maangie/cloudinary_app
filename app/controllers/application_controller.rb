# すべてのコントローラの基底クラス。
class ApplicationController < ActionController::Base
  # webp 画像・Web プッシュ・バッジ・import map・CSS のネスト・CSS の :has に
  # 対応した新しいブラウザだけを受け付ける。
  allow_browser versions: :modern

  # importmap が変わったら、HTML レスポンスの ETag を無効にする。
  stale_when_importmap_changes
end
