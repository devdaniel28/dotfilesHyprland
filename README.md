# 🚀 My Dotfiles | Hyprland Setup

Bem-vindo ao meu repositório de dotfiles! Este é o meu ambiente de trabalho pessoal, construído em torno do **Hyprland** para ser minimalista, rápido e visualmente agradável.

---

## 🛠️ Componentes Principais

| Componente | Ferramenta Utilizada | Descrição |
| :--- | :--- | :--- |
| **Compositor** | [Hyprland](https://hyprland.org/) | Window manager dinâmico baseado em Wayland com animações fluidas. |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | Emulador de terminal rápido e altamente customizável via GPU. |
| **Shell / Launcher** | [Brain Shell](https://github.com/seu-usuario/brain-shell) | Launcher de aplicativos, menu de energia e gerenciador de interface. |
| **Lock / Idle** | Hyprlock & Hypridle | Gerenciamento de sessão e bloqueio de tela nativo do ecossistema Hypr. |

---

## 📁 Estrutura de Pastas

A estrutura dos arquivos de configuração segue o padrão XDG (`~/.config`):

```sh
.config/
├── Brain_Shell/      # Configurações do Brain Shell
├── hypr/             # Configurações do Hyprland (keybinds, regras de janela, etc.)
└── kitty/            # Temas, fontes e atalhos do terminal

```

---

## 📦 Instalação e Requisitos

Antes de clonar e aplicar os dotfiles, certifique-se de ter os pacotes principais instalados em sua distribuição.

### 1. Dependências Básicas (Exemplo no Arch Linux)

```bash
# Via Pacman
sudo pacman -S hyprland hypridle hyprlock hyprsunset kitty cava

# Via AUR Helper (yay/paru) para o Brain Shell e pacotes adicionais
yay -S hyprland hypridle hyprlock hyprsunset kitty cava brain-shell

```

---

### 2. Clonando e Vinculando o Repositório

Você pode clonar este repositório diretamente na sua pasta pessoal e criar os links simbólicos (symlinks) para a pasta `~/.config`.

```bash
# Clone o repositório
git clone [https://github.com/devdaniel/dotfilesHyprland.git](https://github.com/devdaniel/dotfilesHyprland.git) ~/dotfiles

# Crie os links simbólicos para o seu ~/.config
ln -s ~/dotfiles/.config/Brain_Shell ~/.config/Brain_Shell
ln -s ~/dotfiles/.config/hypr ~/.config/hypr
ln -s ~/dotfiles/.config/kitty ~/.config/kitty

```

---

## ⚠️ Dicas e Observações de Configuração

* **Atalhos (Keybinds) do Brain Shell:** Certifique-se de validar se as chamadas de atalho do **Brain Shell** não estão duplicadas entre o arquivo de configuração principal (`hyprland.conf`) e arquivos de atalhos dedicados (ex: `keybinds.conf`), para evitar execução dupla de comandos ao acionar um atalho.