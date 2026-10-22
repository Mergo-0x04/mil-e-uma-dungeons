#!/bin/bash
# Cria o repositório no seu GitHub e envia o jogo. Requer: git e GitHub CLI (gh) - https://cli.github.com
gh auth status >/dev/null 2>&1 || gh auth login
git init -q && git add . && git commit -qm "Dungeon Knight" && git branch -M main
gh repo create dungeon-knight --public --source=. --push
gh api -X POST repos/:owner/dungeon-knight/pages -f "source[branch]=main" -f "source[path]=/" >/dev/null 2>&1
echo "Pronto! Jogo online em breve em: https://$(gh api user -q .login).github.io/dungeon-knight"
