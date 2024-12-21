### venv
sudo apt install fzf python3.12-venv git gcc npm wget curl vim
sudo apt-get install ripgrep

### nerdfont
wget https://github.com/ryanoasis/nerd-font/releases/download/v2.3.3/FantasqueSansMono.zip
mkdir FantasqueSansMono
unzip FantasqueSansMono.zip FantasqueSansMono
sudo mv FantasqueSansMono /usr/share/fonts/FantasqueSansMono/
sudo fc-cache -fv




### 使用系统剪切板  
需要下载xclip   sudo apt-get install xclip


### 下载不了 gopls 解决方法 ：
.bashrc 添加 : 
export GO111MODULE=on    
export GOPROXY=https://goproxy.io


### dap icons
-- Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
-- Breakpoint          = " ",
-- BreakpointCondition = " ",
-- BreakpointRejected  = { " ", "DiagnosticError" },
-- LogPoint            = ".>",


### 2024.12.16  还没有配置rust java  的dap配置
rustaceanvim 环境: 
sudo apt install cargo-nextest
