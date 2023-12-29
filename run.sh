setup_install(){
    if pip list | grep -Fq "virtualenv"; then
        echo " Library [ virtualenv ] is installed"
        pip list | grep virtualenv
    else
        echo " Installing..." 
        pip install virtualenv
    fi

    if [ -d "TOMI-env" ]; then
        echo " Folder TOMI-env exists."
    else
        virtualenv TOMI-env
    fi

    source TOMI-env/Scripts/activate
}

setup_install

pip install -r requirements.txt
pip freeze > requirements.txt
echo -e "\n ------------------------------------------------ \n"
echo -e " TOMI processing...\n"

cd TOMI-project
python Main.py
echo -e "\nEnd processing..."
read