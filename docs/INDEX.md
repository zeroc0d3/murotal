# Murotal

High Quality Murotal Qur'an from Archive.org

## Prerequirements

- Internet Connection
- Library `wget`
- Bash script
- [Tmux](https://github.com/tmux/tmux)

## Step-to-Run

- Install library `wget` & `tmux`
  ```
  # Ubuntu
  sudo apt-get install -y wget tmux git

  # CentOS & Fedora
  sudo yum install -y wget tmux git

  # MacOs
  brew install wget tmux git
  ```

- Clone / Download this repository
  ```
  cd ~
  git clone https://github.com/zeroc0d3/murotal.git
  ```

- Running Script (in root folder)
  ```
  bash ./1000-misyari-rasyid.sh

  ## or ##
  ./1000-misyari-rasyid.sh
  ```

## Convention

- Identity Murotal Script
  ```
  [MId]-[SyaikhName].sh
  eg:
  ---
  1000-misyari-rasyid.sh
  ```

- Folder Murotal Name
  ```
  [MId]_[Syaikh_First_Name][Syaikh_Last_Name]
  eg:
  ---
  1000_Misyari_Rasyid
  ```

- Juz Naming Convention
  ```
  ## id-JuzNumber

  [MId]_[Syaikh_First_Name][Syaikh_Last_Name]/[MId][JuzNumber].mp3
  eg:
  ---
  1000_Misyari_Rasyid/1001.mp3  ## Juz 01
  1000_Misyari_Rasyid/1010.mp3  ## Juz 10
  ...
  1000_Misyari_Rasyid/1030.mp3  ## Juz 30
  ```

- Surah Naming Convention
  ```
  ## Id-JuzNumber-SurahNumber

  [MId]_[Syaikh_First_Name][Syaikh_Last_Name]/[MId][JuzName][SurahNumber].mp3
  eg:
  ---
  1000_Misyari_Rasyid/100101.mp3  ## Juz 01 - Surah 01
  1000_Misyari_Rasyid/101003.mp3  ## Juz 10 - Surah 03
  ...
  1000_Misyari_Rasyid/1030114.mp3  ## Juz 30 - Surah 114
  ```

- Ayyah Naming Convention
  ```
  ## Id-JuzNumber-SurahNumber-AyyahNumber

  [MId]_[Syaikh_First_Name][Syaikh_Last_Name]/[MId][JuzName][SurahNumber][AyyahNumber].mp3

  eg:
  ---
  # 10|01|001|0001

  1000_Misyari_Rasyid/10010010001.mp3  ## Juz 01 - Surah 01 - Ayyah 01
  1000_Misyari_Rasyid/10010010007.mp3  ## Juz 01 - Surah 01 - Ayyah 07

  Continuous Ayyah
  ---
  1000_Misyari_Rasyid/10010010001007.mp3  ## Juz 01 - Surah 01 - Ayyah 01-07
  ...

  # 10|01|002|0141
  1000_Misyari_Rasyid/10010020141.mp3  ## Juz 01 - Surah 02 - Ayyah 141

  # 10|02|002|0142
  1000_Misyari_Rasyid/10020020142.mp3  ## Juz 02 - Surah 02 - Ayyah 142

  # 10|03|002|0253
  1000_Misyari_Rasyid/10020020142.mp3  ## Juz 03 - Surah 02 - Ayyah 253
  ```