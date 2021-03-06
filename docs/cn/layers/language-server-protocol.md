---
title: "SpaceVim lsp 模块"
description: "这一模块为 SpaceVim 提供了 language server protocol 的支持，提供更多语言相关服务。"
lang: zh
---

# [可用模块](../) >> lsp

<!-- vim-markdown-toc GFM -->

- [模块描述](#模块描述)
- [模块特性](#模块特性)
- [模块安装](#模块安装)
  - [安装语言服务器](#安装语言服务器)
- [模块配置](#模块配置)
- [快捷键](#快捷键)

<!-- vim-markdown-toc -->

## 模块描述

lsp 模块提供了 [language-server-protocol](https://microsoft.github.io/language-server-protocol/) 的支持，
默认使用的 lsp 插件为：

1. vim-lsp: for vim
2. LanguageClient-neovim: for neovim
3. built-in lsp: for neovim(>=0.5.0)


## 模块特性

- 异步调用，避免卡顿
- 代码补全，（需要载入 [autocomplet](https://spacevim.org/layers/autocomplete/) 模块）
- 实时代码语法检查
- 重命名函数
- 显示错误信息
- 跳至定义处
- 列举所有引用
- 文档检索
- 代码格式化
- 代码自动修复

**注：** 以上所有信息依赖于语言服务器所实现的功能，请查阅 [Language Servers](https://microsoft.github.io/language-server-protocol/implementors/servers/) 列表。

## 模块安装

默认未载入，如需载入该模块，可在配置文件加入：

```toml
[[layers]]
  name = "lsp"
```

### 安装语言服务器

**Bash**

```sh
npm i -g bash-language-server
```

**JavaScript:**

```sh
npm install -g javascript-typescript-langserver
```

**Python:**

```sh
pip install --user python-language-server
```

**julia:**

安装 `LanguageServer` 包需要 Julia（0.6 或更高版本）.

```sh
julia> Pkg.clone("https://github.com/JuliaEditorSupport/LanguageServer.jl")
```

在 Julia 0.7 新的包管理系统下，可以在 REPL 模式下进行安装，只需要输入 `]` 即可切入到包管理模式，
然后执行 `add LanguageServer` 来安装对应的包。

**vue:**

```sh
npm install vue-language-server -g
```

**css:**

```sh
npm install -g vscode-css-languageserver-bin
```

**ruby:**

```sh
gem install solargraph
```

**vim**

```
npm install -g vim-language-server
```

## 模块配置

为指定模块启用语言服务器支持，需要在载入模块时，指定 `filetypes` 选项：

```toml
[[layers]]
  name = "lsp"
  filetypes = [
    "rust",
    "javascript"
  ]
```

默认语言服务器的执行命令列表如下：

| 语言         | 命令                                                                                                                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `ada`             | `['ada_language_server']`                                                                                                                                                                        |
| `c`               | `['clangd']`                                                                                                                                                                                     |
| `cpp`             | `['clangd']`                                                                                                                                                                                     |
| `crystal`         | `['scry']`                                                                                                                                                                                       |
| `css`             | `['css-languageserver', '--stdio']`                                                                                                                                                              |
| `dart`            | `['dart_language_server']`                                                                                                                                                                       |
| `elm`             | `['elm-language-server']`                                                                                                                                                                        |
| `go`              | `['gopls']`                                                                                                                                                                                      |
| `haskell`         | `['hie', '--lsp']`                                                                                                                                                                               |
| `html`            | `['html-languageserver', '--stdio']`                                                                                                                                                             |
| `javascript`      | `['typescript-language-server', '--stdio']`                                                                                                                                                      |
| `javascriptreact` | `['typescript-language-server', '--stdio']`                                                                                                                                                      |
| `julia`           | `['julia', '--startup-file=no', '--history-file=no', '-e', 'using LanguageServer; server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false); server.runlinter = true; run(server);']` |
| `objc`            | `['clangd']`                                                                                                                                                                                     |
| `objcpp`          | `['clangd']`                                                                                                                                                                                     |
| `php`             | `['php', 'path/to/bin/php-language-server.php']`                                                                                                                                                 |
| `purescript`      | `['purescript-language-server', '--stdio']`                                                                                                                                                      |
| `python`          | `['pyls']`                                                                                                                                                                                       |
| `ruby`            | `['solargraph', 'stdio']`                                                                                                                                                                        |
| `reason`          | `['ocaml-language-server']`                                                                                                                                                                      |
| `rust`            | `['rustup', 'run', 'nightly', 'rls']`                                                                                                                                                            |
| `sh`              | `['bash-language-server', 'start']`                                                                                                                                                              |
| `typescript`      | `['typescript-language-server', '--stdio']`                                                                                                                                                      |
| `typescriptreact` | `['typescript-language-server', '--stdio']`                                                                                                                                                      |
| `vim`             | `['vim-language-server', '--stdio']`                                                                                                                                                             |
| `vue`             | `['vls']`                                                                                                                                                                                        |

如果需要修改语言服务器的命令，在载入模块时，需要指定 `override_cmd` 选项：

```toml
[[layers]]
  name = "lsp"
  filetypes = [
    "rust",
    "javascript"
  ]
  [layers.override_cmd]
    rust = ["rustup", "run", "nightly", "rls"]
```

如果使用的是nvim(>=0.5.0)，则需要指定 `enabled_clients` 选项：

```toml
[[layers]]
    name = 'lsp'
    enabled_clients = ['vimls', 'clangd']
```

## 快捷键

| 快捷键          | 功能描述      |
| --------------- | ------------- |
| `K` / `SPC l d` | 显示文档      |
| `SPC l e`       | 重命名 symbol |

如果 `checkers` 模块未载入，则以下快捷键将被引入：

| 快捷键    | 功能描述                        |
| --------- | ------------------------------- |
| `SPC e c` | 清除错误列表                    |
| `SPC e n` | 跳至下一个语法错误位置          |
| `SPC e N` | 跳至上一个语法错误位置          |
| `SPC e p` | 跳至上一个语法错误位置          |
| `SPC e l` | 列出错误列表窗口                |
| `SPC e L` | 列出错误列表窗口并跳至该窗口    |
