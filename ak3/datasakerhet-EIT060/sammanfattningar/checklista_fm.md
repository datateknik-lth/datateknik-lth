Exam Checklist
==============

## Chapter 3
* **Terms:**
  * **Confidentiality:**  Prevent unauthorized disclosure of information
  * **Integrity:**        Prevent unauthorized modification of information
  * **Availability:**     Information that should be available is not witheld
  * **Authentication:**   Confirming the identity of person or process
  * **Non-repudiation:**  Sender/Receiver cannot deny having made a transmission
  * **Accountability:**   Entities affecting security are held responsible
* **Data:**         Raw, unorganized facts in need of processing
* **Information:**  Organized data interpretable by humans

## Chapter 4
* **Spoofing attacks:** An attempt to fool users that an illegitimate 
  site/e-mail is legitimate. I.e. spoofing e-mails from sysadmins, spoofing
  a banking site. Usually in attempt to gain passwords or other sensitive
  information such as credit cards etc
* **Password recovery**
  * **Brute force:** Testing every possible combination for a password. Time
    consuming for large passwords
  * **Dictionary:** Trying a set of common words/phrases/passwords as the
    password (usually from a large dictionary, i.e. RockYou.com and language
    specific words and phrases)
  * **Time-memory-tradeoff:** Using a pre-computed table of resulting hashes and
    passwords. During the offline portion of the attack, the table is
    constructed. During the online phase, the table is used to look up the
    result of a reduction function. When the string is found in the column with
    hashes, the password on the same corresponding row is then considered as the
    password. Several tables are used for reasons that follow
    * **Rainbow tables:** When increasing table size in TMTO, we also increase
      the chance of collisions. Rainbow tables introduce a solution to this. By
      using a different reduction function for each step in the chain we
      eliminate large collisions and can thus use a single table instead of many
      different tables with different reduction functions as in regular TMTO
* **Password hashing:**
* **Salt:**
