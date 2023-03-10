#\bin\bash

#
# Author: Diego Neves Faria (diegonevesfaria@gmail.com)
# CoAuthor: Eder Luis (0xffff)
# License: MIT
#

# Update Kali
updatekali(){
    echo ""
    echo " >> Updata Kali"
    echo ""
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
}

installdependencies(){
    echo ""
    echo " >> Installing Dependencies of Digital Forensics"
    echo ""
    sudo apt update && sudo apt install linux-headers-$(uname -r) pcregrep python2-dev dwarfdump curl wipe disktype sleuthkit dc3dd dcfldd ewf-tools xmount fcrackzip pdfcrack foremost testdisk exif exiftool -y
    sudo apt install build-essential git libdistorm3-dev libraw1394-11 libcapstone-dev capstone-tool tzdata libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev -y 
    sudo apt install python3 python3-dev libpython3-dev python3-pip python3-setuptools python3-wheel -y
    sudo python3 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
}

cloninglime(){
    echo ""
    echo " >> Cloning LiME to Kali"
    echo ""
    sudo git clone https://github.com/504ensicsLabs/LiME.git /opt/LiME/
}

cloningfmem(){
    echo ""
    echo " >> Cloning fmem to Kali"
    echo ""
    sudo git clone https://github.com/NateBrune/fmem.git /opt/fmem/
    sudo /opt/fmem/make
}

cloningautollr(){
    echo ""
    echo " >> Cloning autollr to Kali"
    echo ""
    sudo git clone https://github.com/Dead-Simple-Scripts/AutoLLR.git /opt/AutoLLR/
}

cloningusbstor(){
    echo ""
    echo " >> Cloning usbstor to Kali"
    echo ""
    sudo git clone https://github.com/kevthehermit/volatility_plugins.git /opt/volatility_plugins/
}

cloningjohn(){
    echo ""
    echo " >> Cloning office2john to Kali"
    echo ""
    sudo git clone https://github.com/openwall/john.git /opt/quebras-john/
}

cloningoletools(){
    echo ""
    echo " >> Cloning oletools to Kali"
    echo ""
    sudo git clone https://github.com/decalage2/oletools.git /opt/oletools/
    sudo pip install -r /opt/oletools/requirements.txt
}

# Install Volatility
installvolatility(){
    echo ""
    echo " >> Instalando e configurando Volatility"
    echo ""
    echo " >> Clonando o Volatility para o Kali"
    echo ""
    sudo git clone https://github.com/volatilityfoundation/volatility.git /opt/volatility/
    sudo chmod a+x /opt/volatility/vol.py

    echo ""
    echo " >> Configurando o Volatility para o Kali"
    echo ""
    cd /opt/
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
    sudo python2.7 /opt/get-pip.py
    sudo pip2 install --upgrade --force-reinstall requests
    sudo pip2 install --upgrade setuptools
    sudo pip install --upgrade setuptools
    sudo pip2 install pycrypto
    sudo pip install distorm3
    sudo pip2 install distorm3==3.4.4
    sudo pip2 install wheel
    sudo chmod a+x /opt/volatility/setup.py
    sudo python2.7 /opt/volatility/setup.py install
    sudo python2.7 /opt/volatility/vol.py --info
}
updatekali
installdependencies
cloninglime
cloningfmem
cloningautollr
cloningusbstor
cloningjohn
cloningoletools
installvolatility

