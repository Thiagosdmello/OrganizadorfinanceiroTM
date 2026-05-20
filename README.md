# 💰 Salário Organizer

Gestão financeira pessoal — ganhos, despesas e aplicação de recursos.

---

## 🚀 Deploy em 3 passos

### 1. Supabase

1. Acesse [supabase.com](https://supabase.com) e crie um projeto gratuito
2. Vá em **SQL Editor**, cole o conteúdo de `supabase_setup.sql` e clique em **Run**
3. Vá em **Authentication → Settings**:
   - **Confirm email** → **desligado**
   - **Site URL** → cole a URL do Vercel (preencha depois do deploy)
   - **Redirect URLs** → mesma URL + `/**`
4. Vá em **Project Settings → API** e copie:
   - `Project URL`
   - `anon public` key

---

### 2. Configurar as chaves localmente

```bash
# Copie o arquivo de exemplo
cp config.example.js config.js
```

Abra o `config.js` e cole suas chaves:

```js
window.__SUPA_URL__ = 'https://xxxx.supabase.co';
window.__SUPA_KEY__ = 'eyJhbGci...';
```

> O `config.js` está no `.gitignore` — as chaves nunca vão para o GitHub.

---

### 3. GitHub

```bash
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/SEU_USER/SEU_REPO.git
git push -u origin main
```

---

### 4. Vercel

1. Acesse [vercel.com](https://vercel.com) → **Add New Project**
2. Importe o repositório do GitHub
3. Clique em **Deploy** (sem configuração extra — é site estático)
4. Copie a URL gerada → cole no Supabase em **Authentication → Settings → Site URL**

> Como o `config.js` está no `.gitignore`, o Vercel não terá as chaves.
> Para produção no Vercel, adicione um `config.js` manualmente via **Vercel CLI** ou use as **Environment Variables** com o `inject.js` (abordagem avançada).
>
> **Para uso imediato:** abra o `index.html` direto no navegador com o `config.js` preenchido — funciona localmente sem servidor.

---

## 📁 Estrutura de arquivos

```
salario-organizer/
├── index.html            # App completo
├── config.js             # ⚠️ NÃO sobe pro GitHub — suas chaves ficam aqui
├── config.example.js     # Exemplo — esse sobe pro GitHub
├── vercel.json           # Config do Vercel (static site)
├── manifest.json         # PWA manifest
├── supabase_setup.sql    # SQL para criar a tabela
├── favicon.ico           # Ícone
├── favicon-32.png
├── icon-192.png
├── icon-512.png
├── icon.svg
└── .gitignore            # config.js ignorado aqui
```
