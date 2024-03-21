<img src="utils/logo.webp" alt="logo" style="width: 100%">
<img src="utils/banner.png" alt="banner" style="width: 100%">

---

<br>

## Introduction

Dans le cadre de notre cursus à l'école 42, nous attaquerons le projet intitulé "Inception". Ce projet ambitieux s'inscrit dans une démarche d'approfondissement et de mise en pratique des connaissances acquises en matière de virtualisation et de gestion de conteneurs. Notre objectif est de déployer une infrastructure complexe et sécurisée, entièrement configurée à l'aide de Docker et orchestrée par docker-compose, le tout dans une machine virtuelle dédiée.

Le cœur de ce projet réside dans la mise en place d'une petite infrastructure composée de plusieurs services, chacun s'exécutant dans son propre conteneur Docker. Pour garantir une performance optimale, nous avons le choix entre les versions penultièmes stables d'Alpine ou de Debian pour construire nos images Docker. Chaque image Docker doit correspondre strictement au service qu'elle représente et doit être construite à partir de Dockerfiles personnalisés, une exigence qui souligne l'importance de la compréhension profonde et de la maîtrise de Docker.

Notre architecture doit comprendre plusieurs composants clés :

- Un conteneur Docker contenant NGINX, configuré pour utiliser exclusivement les protocoles TLSv1.2 ou TLSv1.3.
- Un conteneur Docker dédié à WordPress + php-fpm, sans NGINX, soulignant notre capacité à segmenter et optimiser les services.
- Un conteneur pour MariaDB, isolé des autres services pour une sécurité renforcée.
- Deux volumes distincts, l'un pour la base de données WordPress et l'autre pour les fichiers du site web WordPress, assurant une gestion efficace des données.
- Un réseau Docker spécifique pour faciliter la communication inter-conteneurs, tout en respectant les bonnes pratiques de sécurité et d'isolation.

<br>

L'une des contraintes majeures du projet est l'interdiction d'utiliser des images Docker préconstruites (à l'exception des images de base Alpine/Debian) ou des services comme DockerHub pour nos services. Cette approche nous pousse à développer une compréhension plus profonde de la personnalisation et de l'optimisation des conteneurs.

En outre, nous devons veiller à ce que nos conteneurs soient conçus pour redémarrer automatiquement en cas de crash, tout en évitant les pratiques non recommandées telles que l'utilisation de commandes créant des boucles infinies comme point d'entrée.

Le projet Inception est aussi un exercice de sécurité et de configuration réseau, exigeant que le conteneur NGINX soit le seul point d'entrée de notre infrastructure via le port 443, utilisant des protocoles de sécurisation modernes.

Pour mener à bien ce projet, il est essentiel que nous plongions dans une documentation abondante et diversifiée, nous permettant d'acquérir les connaissances nécessaires sur Docker, les meilleures pratiques en matière de conteneurs, la sécurité des applications web et la gestion des bases de données. L'expérience acquise et les compétences développées au cours de ce projet seront sans aucun doute un atout précieux pour notre future carrière professionnelle dans le domaine de la technologie et de l'informatique.

<br>

---

<br>
