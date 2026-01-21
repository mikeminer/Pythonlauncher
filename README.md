
# 🚀 Universal Python Multi Launcher (Windows BAT)

Launcher leggero in **Batch per Windows** che permette di avviare facilmente **uno o più script Python**, inclusa la possibilità di eseguire **più istanze dello stesso script**, tramite un menu interattivo.

Pensato per **ogni tipo di programma in python**.

---

## ✨ Funzionalità

* ✅ Rilevamento automatico di tutti i file `.py` nella cartella
* ✅ Menu interattivo numerico (1, 2, 3…)
* ✅ Avvio di più script contemporaneamente
* ✅ Avvio di più istanze dello stesso script
* ✅ Sintassi semplice (`2x3`, `2*3`)
* ✅ Ogni istanza in una finestra CMD separata
* ✅ Menu ciclico (non si chiude dopo l’esecuzione)
* ✅ Nessuna dipendenza esterna

---

## 🖥 Requisiti

* Windows 10 / 11
* Python installato e aggiunto al PATH

Verifica Python:

```bash
python --version
```

---

## 📂 Struttura della cartella

```
project-folder/
│
├── launcher.bat
├── script1.py
├── script2.py
├── script3.py
```

Il file `launcher.bat` **deve trovarsi nella stessa cartella** degli script Python.

---

## ▶️ Come utilizzare il launcher

1. Inserisci `launcher.bat` nella cartella degli script `.py`
2. Avvia il file con doppio click
3. Verrà mostrata la lista numerata degli script trovati
4. Inserisci i comandi di avvio

---

## ⌨️ Sintassi dei comandi

### Avvia un singolo script

```
1
```

### Avvia più script

```
1 3 4
```

### Avvia più istanze dello stesso script

```
2x3
```

oppure

```
2*3
```

➡️ Avvia **3 istanze dello script numero 2**

---

## 🧠 Esempi pratici

Con questa lista:

```
1) script1.py
2) script2.py
3) script3.py
```

| Comando   | Risultato                   |
| --------- | -----------------------   - |
| `1`       | Avvia script1               |
| `1 3`     | Avvia script1 e script3     |
| `2x5`     | Avvia 5 istanze di script2  |
| `1 2x3 3` | Avvio combinato             |

---



## 🔁 Comportamento del menu

* Dopo l’avvio degli script il menu **riappare automaticamente**
* Il launcher **non si chiude**
* Per uscire utilizzare il comando **Q**

---

## ⚠️ Note importanti

* Salvare il file `.bat` come:

  * **ANSI**
  * oppure **UTF-8 senza BOM**

* Se Python non viene avviato:

  * verificare che sia nel PATH
  * provare da prompt:

    ```bash
    python nome_script.py
    ```

---

## 🔐 Sicurezza

* Nessun accesso a internet daparte del launcher
* Nessun servizio in background
* Nessuna persistenza
* Esecuzione completamente locale

---

## 🧩 Possibili utilizzi

* Bot automatici
* Trading bot
* Script AI locali
* Scanner
* Test multipli
* Ambienti di sviluppo

---

## 📌 Licenza

Utilizzabile liberamente per uso personale e professionale.

