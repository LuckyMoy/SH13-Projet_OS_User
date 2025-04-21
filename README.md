# Projet SH13 - Interface réseau graphique du jeu Sherlock Holmes 13 Indices

Ce projet réalise une version réseau et graphique du jeu de société **Sherlock Holmes: 13 Indices**, en C, avec gestion des communications via sockets TCP, threads, et synchronisation par mutex. L'affichage est assuré via la bibliothèque SDL2.

Projet réalisé dans le cadre du module **OS User** (4ème année EI, Polytech Sorbonne).

---

## 🎮 Règles du jeu (résumé)
Chaque joueur incarne un détective devant identifier le coupable d'un crime parmi 13 suspects. Chaque personnage est associé à un ensemble d'objets. Le but est de deviner le bon suspect (le coupable), à l'aide d'indices obtenus en interrogeant les autres joueurs.

Chaque joueur reçoit 3 cartes (les suspects qu'il peut éliminer) et dispose d'un tableau pour organiser les réponses aux questions posées.

---

## 🏙 Structure du projet
```
SH13/
├── README.md             
├── Makefile              # Compilation
├── doc/                  # Documents du projet
│   └── regle.pdf         # Règles complètes du jeu
│   └── rapport.pdf       # Rapport du projet
├── exec/                 # Binaires compilés (non versionnés)
│   ├── server
│   └── sh13
├── resources/            # Fichiers nécessaires au rendu graphique
│   ├── img/              # Images du jeu (cartes, boutons...)
│   └── sans.ttf          # Police TrueType
├── scripts/              # Scripts d’exécution rapide
│   ├── compile.sh
│   ├── compile_macos.sh
│   ├── run_sherlock0.sh
│   ├── run_sherlock1.sh
│   ├── run_sherlock2.sh
│   └── run_sherlock3.sh
└── src/
    ├── server.c         # Code serveur principal
    ├── sh13.c           # Code client (interface SDL)
    └── code_originaux/  # Versions initiales à compléter fournies
```

---

## ⚙️ Compilation

### Sous Linux
Des scipts permettent de faciliter la compilation. Pour les rendre executables, executer la commande `chmod +x scripts/[NOM_DU_SCRIPT].sh`.

Assurez-vous que les dépendances sont installées :
```bash
sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev build-essential
```

Puis compilez avec :
```bash
./scripts/compile.sh
```

### Sous macOS (Homebrew requis)
```bash
brew install sdl2 sdl2_image sdl2_ttf
./scripts/compile_macos.sh
```

---

## 🚀 Exécution

### 1. Lancer le serveur
Pour lancer le serveur, appeler l'executable suivi du port souhaité. Par exemple:
```bash
./exec/server 8000
```

### 2. Lancer les 4 clients :
Pour lancer un client, respecter le format suivant:
```bash
./sh13 $SERVER_IP $SERVER_PORT $CLIENT_IP $CLIENT_PORT $PLAYER_NAME
```
Des scripts shell dans `scripts/` permettent de facilment lancer 4 clients en local:
```bash
./scripts/run_sherlock0.sh
./scripts/run_sherlock1.sh
./scripts/run_sherlock2.sh
./scripts/run_sherlock3.sh
```

Chaque script correspond à un joueur avec un port et un nom différents. Vous pouvez modifier ces scripts si besoin.

---

## 📃 Fonctionnement interne

### Architecture réseau
- Le **serveur** gère les connexions et la logique du jeu (distribution des cartes, vérification du coupable, etc.)
- Chaque **client** lance un thread pour écouter les messages entrants et interagit avec le joueur via SDL

### Utilisation des concepts du module OS User :
- **Sockets TCP** : communication client <-> serveur, avec format de message simple (textuel)
- **Threads** : chaque client crée un thread serveur TCP pour recevoir les messages
- **Mutex** : synchronisation de la variable `synchro` entre thread récepteur et boucle SDL
- **Gestion d’événements SDL** : clics sur les cartes, boutons, etc.

### Communication
- `C ...` : un client se connecte au serveur
- `I` : identifiant du joueur attribué par le serveur
- `L` : liste des joueurs
- `D` : cartes reçues par le joueur
- `V` : information révélée sur les cartes des autres
- `M` : changement de joueur courant
- `A` : Résultat d'une accusation
- `G`, `O`, `S`, `P` : requêtes d’actions (guess, object, suspect, pass)

---

## 🏆 Auteur
Projet réalisé par Ugo Lucchi.

---

## 📄 Rapport
Voir `doc/rapport.pdf` pour un détail complet des choix de conception, difficultés rencontrées, et usage des concepts OS.

---

Projet réalisé en avril 2025 dans le cadre du module OS User de 4ème année de la formation ingénieur EI de Polytech Sorbonne.

