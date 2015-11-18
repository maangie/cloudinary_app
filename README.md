# cloudinary_app
cloudinary アプリ試作

## 使い方

```bash
% git clone https://github.com/maangie/cloudinary_app.git
% cd cloudinary_app
% bin/bundle install --without=production
% bin/rake db:migrate
% cat > .env
CLOUDINARY_URL=cloudinary://999999999999999:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CLOUDINARY_API_KEY=999999999999999
CLOUDINARY_API_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxx
% bin/rails server -d
% open http://localhost:3000
```

## サーバ停止

```bash
% kill `cat tmp/pids/server.pid`
```
