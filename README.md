# My Dotfiles | Hyprland Setup

Bem-vindo ao meu repositório de dotfiles! Este é o meu ambiente de trabalho pessoal, construído em torno do **Hyprland** para ser minimalista, rápido e visualmente agradável.

---

## Componentes Principais

| Componente | Ferramenta Utilizada | Descrição |
| :--- | :--- | :--- |
| **Compositor** | [Hyprland](https://hyprland.org/) | Window manager dinâmico baseado em Wayland com animações fluidas. |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | Emulador de terminal rápido e altamente customizável via GPU. |
| **Menu/Launcher** | [Rofi](https://github.com/davatorium/rofi) (Wayland fork) | Launcher de aplicativos, menu de energia e gerenciador de janelas. |
| **Barra de Status** | [Waybar](https://github.com/Alexays/Waybar) | Barra de status altamente customizável feita para compositores Wayland. |

---

## Estrutura de Pastas

A estrutura dos arquivos de configuração segue o padrão do XDG (`~/.config`):

```sh
 .config/
 ├── hypr/          # Configurações do Hyprland (keybinds, regras de janela, etc.)
 ├── kitty/         # Temas, fontes e atalhos do terminal
 ├── rofi/          # Temas e layouts do menu de aplicativos
 └── waybar/        # Estrutura HTML/CSS da barra de status
```

# Instalação e Requisitos

Antes de clonar e aplicar os dotfiles, certifique-se de ter os pacotes principais instalados na sua distribuição.
1. Dependências Básicas (Exemplo para Arch Linux)
Bash
```shell
 sudo pacman -S hyprland kitty rofi waybar
```
2. Clonando o Repositório

Você pode clonar este repositório diretamente na sua pasta home ou gerenciar usando uma ferramenta como o stow.

Método Direto:
Bash

# Clone o repositório
```shell
 git clone [https://github.com/seu-usuario/dotfiles.git](https://github.com/seu-usuario/dotfiles.git) ~/dotfiles
```

# Crie os links simbólicos para a sua pasta .config

```shell
 ln -s ~/dotfiles/.config/hypr ~/.config/hypr
 ln -s ~/dotfiles/.config/kitty ~/.config/kitty
 ln -s ~/dotfiles/.config/rofi ~/.config/rofi
 ln -s ~/dotfiles/.config/waybar ~/.config/waybar
```