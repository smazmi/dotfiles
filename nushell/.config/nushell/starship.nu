$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""


$env.TRANSIENT_PROMPT_COMMAND = ""

$env.PROMPT_INDICATOR_VI_INSERT = "╰─" ++ (ansi green) ++ "❯" ++ (ansi reset) ++ " "

$env.PROMPT_INDICATOR_VI_NORMAL = "╰─" ++ (ansi yellow) ++ "❮" ++ (ansi reset) ++ " "

$env.PROMPT_INDICATOR = "╰─" ++ (ansi green) ++ "❯" ++ (ansi reset) ++ " "
