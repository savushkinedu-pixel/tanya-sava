# CLAUDE.md — tanya-sava deployment notes

## Stack
Static site: HTML + CSS + images (no build step)
Server: nginx:alpine
Host: Railway (railway.app)
Repo: github.com/savushkinedu-pixel/tanya-sava

---

## Railway deployment — что работает

### Dockerfile (финальный рабочий вариант)
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
CMD sh -c "echo 'server { listen ${PORT:-80}; location / { root /usr/share/nginx/html; try_files \$uri \$uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
```

**Ключевые моменты:**
- Railway динамически назначает `$PORT` — nginx должен слушать именно его, не хардкодить 80
- `${PORT:-80}` — fallback на 80 если переменная не задана
- `location /` — обязателен пробел между `location` и `/`, иначе nginx падает с `unknown directive`
- `try_files $uri $uri/ /index.html` — нужен для корректной навигации между страницами
- Удалять дефолтный конфиг nginx не нужно — CMD перезаписывает его

### railway.toml
```toml
[deploy]
healthcheckPath = "/"
healthcheckTimeout = 30
restartPolicyType = "ON_FAILURE"
```

### Public domain
- Генерируется через Settings → Networking → Generate Domain
- Порт указывать 8080 (Railway проксирует на внутренний $PORT)
- Итоговый URL: `tanya-sava-production.up.railway.app`

---

## Что НЕ работает

- `nginx:alpine` с шаблонами в `/etc/nginx/templates/` — папка не существует в базовом образе
- Хардкод `listen 80` — Railway healthcheck падает, сервис недоступен снаружи
- `location/` без пробела — nginx не стартует (`unknown directive`)
- HTTPS git push с паролем — не работает, нужен Personal Access Token или SSH
- SSH без настроенного ключа — `Permission denied (publickey)`

---

## Деплой — пошаговый флоу

1. Изменения делаем локально или прямо на GitHub (Edit file)
2. Commit → Railway автоматически подхватывает и деплоит
3. Статус смотреть: Railway → проект → Deployments
4. Логи: кнопка "View logs" рядом с деплоем
5. Если healthcheck падает — смотреть deploy logs, там причина

## Обновление сайта

Добавить картины в галерею:
1. Загрузить файлы в папку `PICS/` на GitHub (Upload files)
2. Добавить `<div class="gallery-item">` блок в `galerie.html`
3. Commit → автодеплой

---

## .dockerignore (держать в репо)
```
DESIGN.md
Dockerfile
railway.toml
CLAUDE.md
.git
README.md
```
