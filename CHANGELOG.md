# Change Log History (Murotal)

High Quality Murotal Qur'an from Archive.org

## Version 0.1

### Per-Juz (30 Juz)

- 01. Syeikh Misyari Rasyid
- 02. Syeikh Saad Al-Ghamidi
- 03. Syeikh Abdurrahman As-Sudais
- 04. Syeikh Hany Ar-Rifa'i
- 05. Syeikh Yasser Al-Dosari
- 06. Syeikh Saud Al-Shuraim
- 07. Syeikh Nasser Al-Qatami
- 08. Syeikh Abdul Basith

## Version 0.2

### Per-Juz (30 Juz) - Categories

```
1000. Syeikh Misyari Rasyid
1200. Syeikh Saad Al-Ghamidi
1400. Syeikh Abdurrahman As-Sudais
1600. Syeikh Hany Ar-Rifa'i
1800. Syeikh Yasser Al-Dosari
2000. Syeikh Saud Al-Shuraim
2200. Syeikh Nasser Al-Qatami
2400. Syeikh Abdul Basith
```

## Version 0.3

- Refactoring script downloader
- Added skip sequence for existing file
- Added documentation how to use in `docs/index.md`
- Added test script

## Version 0.4

- Added autodownload script for selected ID Murotal
  ```
  ./autodownload.sh [MID] [PATH_FOLDER]
  ---
  eg:
  ./autodownload.sh 10 /home/zeroc0d3/Documents/murotal     # Download all murotal Syeikh Misyari Rasyid and save to spesific folder
  ./autodownload.sh 16 /home/zeroc0d3/Documents/murotal     # Download all murotal Syeikh Hani Ar-Rifai and save to spesific folder
  ```
- Fixing wrong path download from MID: 2400
  ```
  PATH_MUROTAL="[PATH_DOWNLOAD]/2400_Abdul_Basit_AbdulSamad"
  ```