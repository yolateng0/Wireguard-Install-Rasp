# Menu de sélection de DNS
echo "Sélectionnez un DNS :"
echo "1. Cloudflare DNS (1.1.1.1, 1.0.0.1)"
echo "2. Google DNS (8.8.8.8, 8.8.4.4)"
echo "3. OpenDNS (208.67.222.222, 208.67.220.220)"
echo "4. Quad9 DNS (9.9.9.9, 149.112.112.112)"

read -p "Votre choix : " choice

# Détecter l'OS en cours d'exécution
if [[ $(uname -m) == "armv7l" && $(uname -o) == "GNU/Linux" ]]; then
  # Installer les packages nécessaires pour WireGuard
  sudo apt-get update
  sudo apt-get install -y raspberrypi-kernel-headers

  # Installer WireGuard
  sudo apt-get install -y wireguard

  # Télécharger et installer NetShield Antipub
  wget https://github.com/AdguardTeam/AdguardHome/releases/download/v0.107.0/AdGuardHome_linux_armv7.tar.gz
  tar -xzvf AdGuardHome_linux_armv7.tar.gz
  cd AdGuardHome
  sudo ./AdGuardHome -s install

  # Configurer le DNS sélectionné
  case $choice in
    1)
      sudo sed -i 's/#DNS=/DNS=1.1.1.1,1.0.0.1/' /etc/systemd/resolved.conf
      sudo systemctl restart systemd-resolved.service
      ;;
    2)
      sudo sed -i 's/#DNS=/DNS=8.8.8.8,8.8.4.4/' /etc/systemd/resolved.conf
      sudo systemctl restart systemd-resolved.service
      ;;
    3)
      sudo sed -i 's/#DNS=/DNS=208.67.222.222,208.67.220.220/' /etc/systemd/resolved.conf
      sudo systemctl restart systemd-resolved.service
      ;;
    4)
      sudo sed -i 's/#DNS=/DNS=9.9.9.9,149.112.112.112/' /etc/systemd/resolved.conf
      sudo systemctl restart systemd-resolved.service
      ;;
    *)
      echo "Choix invalide"
      ;;
  esac

elif [[ $(uname -m) == "aarch64" && $(uname -o) == "GNU/Linux" ]]; then
  # Installer les packages nécessaires pour WireGuard
  sudo apt-get update
  sudo apt-get install -y raspberrypi-kernel-headers

  # Installer WireGuard
  sudo apt-get install -y wireguard

  # Télécharger et installer NetShield Antipub
  wget https://github.com/AdguardTeam/AdguardHome/releases/download/v0.107.0/AdGuardHome_linux_arm64.tar.gz
  tar -xzvf AdGuardHome_linux_arm64.tar.gz
  cd AdGuardHome
  sudo ./AdGuardHome -s install

  # Configurer le DNS sélectionné
  case $choice in
    1)
      sudo sed -i 's/#DNS=/DNS=1.1.1.1,1.0
