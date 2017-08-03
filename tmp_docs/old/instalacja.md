---
output: html_document
---
# Warsztaty Apache Spark, 19.04.2016
## Przygotowanie środowiska 

Potrzebujemy:

 * VirtualBox
 * Vagrant
 
### Instalacja VirtualBox

Filmiki instruktażowe dla poszczególnych systemów operacyjnych:

- Windows: https://www.youtube.com/watch?v=0fPt7zrAW1k
- MAC OS: https://www.youtube.com/watch?v=0fPt7zrAW1k
- Linux: https://www.youtube.com/watch?v=1_4USzcKx6g

### Instalacja Vagrant

Filmiki instruktażowe dla poszczególnych systemów operacyjnych:

- Windows: https://www.youtube.com/watch?v=phsPValZUOE
- MAC OS: https://www.youtube.com/watch?v=hPmawNk2XQw
- Linux: https://www.youtube.com/watch?v=f2cufy6wRfA

### Instalacja wirtualnej maszyny

1. Stwórz nowy katalog o nazwie 'myvagrant' np. (`c:\users\my_name\myvagrant` lub `/home/my_name/myvagrant`).
2. Pobierz plik 'Vagrantfile' [stąd](https://www.dropbox.com/s/fpeinx4x6hykkoa/Vagrantfile?dl=0) i wklej go do utworzonego folderu (nie zmieniaj jego nazwy).
3. Otwórz wiersz poleceń/terminal, zmień ścieżkę na utworzony folder i wpisz polecenie `vagrant up --provider=virtualbox`.

Uwaga - proces może potrwać kilka godzin.

Jeżeli dostajesz błąd połącznia lub przekroczonego czasu spróbuj metody ręcznej:

1. Wykonaj pierwsze dwa punkty z listy powyżej.
2. Pobierz plik `package.box` [stąd](https://atlas.hashicorp.com/sparkmooc/boxes/base/versions/0.0.7.1/providers/virtualbox.box).
3. Otwórz plik `Vagrantfile`, który znajduje się w folderze `my_vagrant`, za pomocą edytora tekstowego i  podmień linijkę `master.vm.box = "sparkmooc/base2"` na `master.vm.box = "sparkvm"` i zapisz. 
4. W terminalu, gdy jesteś w folderze `my_vagrant` wpisz `vagrant box add sparkvm package.box --force` i potem `vagrant up`. W ten sposób maszyna powinna zostać włączona.

### Uruchomienie maszyny i rozpoczęcie pracy

W wierszu poleceń/termianlu wpisz `vagrant up`. Po zakończeniu pracy w celu wyłączenia maszyny używamy polecenia `vagrant halt`.

Gdy maszyna wirtualna działa, otwórz http://localhost:8001/ lub http://127.0.0.1:8001/.