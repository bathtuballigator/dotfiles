#!/bin/bash

# Welcome to my crappy script. I dont know much about bash, but I know I'm not using it right.
# This is script is without any warranty and im not responsible for anything you do with it. Including damage to your hardware.
# You may modify however you like, and if you leave some credit i'd appreciate it.

# Depends on:
#  Hyprland - Hyprshade - GNU core utils - Notify-send

# Here's some instructions:
# add the script somewhere, I keep my hyprland scripts in ~/.config/hypr/scripts/
# Then you add a bind to run it with exec.
# Example from my config file: 
# binds for enabling and controlling the intensity of the blue light filter shader
# $shaderController = $scriptsDir/shaderController.sh
# bind = $mainMod, code:35, exec, $shaderController --step-up # 35 is '['
# bind = $mainMod, code:51, exec, $shaderController --step-down # 51 is ']'
# bind = $mainMod SHIFT, code:35, exec, $shaderController --toggle # Toggle shader, SHIFT 35 is '{'
# bind = $mainMod SHIFT, code:51, exec, $shaderController --set-temperature # Sets a arbitrary temp, SHIFT 35 is '}'

# You may want to change the variables below to fit your needs.
TEMPERATURE_STEP=200 # This controls the step up and down. Change if you want finer controls.
DMENU_APP="fuzzel --dmenu" # Change this to your dmenu app (rofi, wofi, dmenu, etc)
SHADER_STATE_FILE="$HOME/.config/hypr/shaders/currentShader.tmp" # You may want to change this to `$HOME/.cache/currentShaderCache` or something
SHADER_OPTIONS=("blue-light-filter" "vibrance") # This is a list to choose from, you may add or remove.
SHADER_GLSL_FILE="$HOME/.config/hypr/shaders/blue-light-filter.glsl" # You could improve this, I dont need to, you do you.
# DMENU_APP="wofi --show dmenu" should work.

# Observation: I dont particularly care for switching shaders so I didnt implement it.
#               Should be easy to do it yourself.

ACTION="$1" # Tracks the performed action, dont touch.
# Function to toggle shader state
# Performs checks.
toggle_shader() {
  local shader="$1"
  echo "Toggling shader: $shader" # Debug.
  hyprshade toggle "$shader"

  return $? #Returns the exit code.
}

quick_toggle() {
  # Little checks, simply toggles the shader, period.
  local currentShader=$(hyprshade current)
  # Simply refreshes the toggle state or ignores.
  [[ -z "$currentShader" ]] && echo "No shader active, ignoring." || hyprshade toggle $currentShader && hyprshade toggle $currentShader
  # Toggles twice, its lazy, its bad, and it works.
}

toggle_logic() {
  # If you are reading this, I'm sorry. I hate the if blocks on bash, therefore I did it my way.

  # Checks if file exist and is not empty.
  [[ -f "$SHADER_STATE_FILE" && -s "$SHADER_STATE_FILE" ]] && { # OK block.
    currentShader=$(cat "$SHADER_STATE_FILE");

  } || { #Failure block.
    currentShader=$(hyprshade current)

    # Prompts with the DMENU_APP for you to set up a inital shader state.
    [[ -z $currentShader ]] && {
      currentShader=$(printf "%s\n" "${SHADER_OPTIONS[@]}" | $DMENU_APP -p "Select Shader:")
        [[ -z $currentShader ]] && notify-send "Hyprshade" "No shader was selected." && exit 1  # May panic.
        echo "$currentShader" > "$SHADER_STATE_FILE"
    }

  }
}

# Adjust the temperature doing wizardry with regex
adjust_temp() {
  local step="$1"
  local line_number=7

  local current_value=$(sed -n "${line_number}p" "$SHADER_GLSL_FILE" | awk '{print $NF}' | sed 's/;//')

  case $ACTION in
    --step-up | --step-down)
      # Calculates the new value using 'bc'
      local new_value=$(echo "$current_value" + "$step" | bc)
      ;;
    --set-temperature)
      local new_value="$step"
      ;;
  esac

  sed -i "${line_number}s/const float temperature = $current_value;/const float temperature = $new_value;/" "$SHADER_GLSL_FILE"
  quick_toggle
  notify-send "Hyprshade" "Brightness adjusted: $current_value -> $new_value"
}

case "$ACTION" in
  --toggle)
    toggle_logic && toggle_shader "$currentShader"

    # Keeps annoying you with a notification.
    # You could change `notify-send` to echo if you prefer. Your case.
    [[ $? -eq 0 ]] && {
      notify-send "Hyprshade" "Toggled shader: $currentShader"
    } || {
      notify-send "Hyprshade" "Failed to toggle shader: $currentShader"
    }
    ;;

  --step-up)
    adjust_temp "$TEMPERATURE_STEP"
    ;;
  
  --step-down)
    adjust_temp "-$TEMPERATURE_STEP"
    ;;

  --set-temperature)
    new_temp=$(echo | $DMENU_APP -p "Set temperature:")
    # Im not even sure if this does what I think it does. But it works.
    # Should never allow anything but a Integers and Floats.
    [[ "$new_temp" =~ ^-?[0-9]+(\.[0-9]+)?$ ]] && adjust_temp "${new_temp}.0" || {
      notify-send "Hyprshade" "Invalid temperature: $new_temp\n*Must be a floating number"
    }
    ;;

  *)
    echo "Usage: $0 {--toggle|--step-up|--step-down|--set-temperature}"
    exit 1
    ;;

esac
