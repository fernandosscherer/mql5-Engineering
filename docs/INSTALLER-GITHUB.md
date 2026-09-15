# Instalador via GitHub — MQL5 Engineering

Este guia mostra como publicar o repositório e disponibilizar a instalação da Skill por terminal.

## 1. Pré-requisitos

- conta GitHub;
- repositório `fernandosscherer/mql5-Engineering`;
- Git instalado localmente;
- repositório público para instalação anônima com `curl`.

Se o repositório for privado, o instalador precisará de autenticação e a URL pública abaixo não funcionará anonimamente.

## 2. Estrutura esperada

```text
mql5-Engineering/
├── mql5-engineering/
│   ├── SKILL.md
│   ├── README.md
│   ├── references/
│   ├── workflows/
│   ├── templates/
│   └── scripts/
├── .github/workflows/release.yml
├── docs/INSTALLER-GITHUB.md
├── install.sh
├── uninstall.sh
├── VERSION
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## 3. Primeiro push para um repositório vazio

Dentro da pasta `mql5-Engineering`:

```bash
git init
git add .
git commit -m "Release mql5-engineering v2.7"
git branch -M main
git remote add origin https://github.com/fernandosscherer/mql5-Engineering.git
git push -u origin main
```

## 4. Se o repositório já existe

Clone o repositório e copie/mescle os arquivos deste pacote:

```bash
git clone https://github.com/fernandosscherer/mql5-Engineering.git
cd mql5-Engineering
```

Depois de copiar os arquivos atualizados:

```bash
git add .
git commit -m "Update mql5-engineering to v2.7"
git push origin main
```

## 5. Testar o instalador publicado

Verifique primeiro o script:

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh -o /tmp/mql5-install.sh
bash -n /tmp/mql5-install.sh
bash /tmp/mql5-install.sh --help
```

Instalação universal:

```bash
bash /tmp/mql5-install.sh install --target universal
```

Ou diretamente:

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

## 6. Atualizar

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash -s -- update
```

## 7. Desinstalar

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- uninstall --target universal --yes
```

## 8. Criar a release v2.7

Confirme que `mql5-engineering/SKILL.md` contém:

```yaml
metadata:
  version: "2.6"
```

Crie e envie a tag:

```bash
git tag v2.7
git push origin v2.7
```

O workflow `.github/workflows/release.yml` valida a tag e publica automaticamente:

- `mql5-engineering-v2.7.zip`;
- `mql5-engineering-v2.7.zip.sha256`.

## 9. Nova versão

Para uma futura `2.8`:

1. atualizar a versão no `SKILL.md`;
2. atualizar `scripts/banner.sh`;
3. atualizar `VERSION` e `CHANGELOG.md`;
4. testar os scripts;
5. fazer commit e push;
6. criar a tag `v2.8`;
7. enviar a tag ao GitHub.

```bash
git add .
git commit -m "Release mql5-engineering v2.8"
git push origin main
git tag v2.8
git push origin v2.8
```

## 10. Repositório público x privado

A instalação simples por `curl` pressupõe que o repositório esteja publicamente acessível. Para distribuição privada, use autenticação com GitHub CLI/token e não exponha tokens dentro do `install.sh`.
