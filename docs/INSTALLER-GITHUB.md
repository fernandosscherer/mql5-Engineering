# Instalador via GitHub — MQL5 Engineering v3.0

## Publicar

```bash
git add .
git commit -m "Release mql5-engineering v3.0"
git push origin main
```

## Testar main

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh -o /tmp/mql5-install.sh
bash -n /tmp/mql5-install.sh
bash /tmp/mql5-install.sh --help
bash /tmp/mql5-install.sh install --target universal
```

## Instalar

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

## Criar release v3.0

Confirme que VERSION, SKILL.md e banner.sh estão em 3.0.

```bash
git tag v3.0
git push origin v3.0
```

O workflow gera ZIP e SHA-256.
