# If PYTHON_VENV_NAME is not set, use "venv"
: ${PYTHON_VENV_NAME:=venv}

# Deactivate the current venv and activate the one from the folder
load_pyvenv() {
  if [[ -f "${PYTHON_VENV_NAME}/bin/activate" ]]; then
    (( $+functions[deactivate] )) && deactivate > /dev/null 2>&1
    source "${PYTHON_VENV_NAME}/bin/activate" > /dev/null 2>&1
  fi
}
# Load the venv both when PWD changes
add-zsh-hook chpwd load_pyvenv
