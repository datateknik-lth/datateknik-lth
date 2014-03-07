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
    * **Math for TMTO:**
    ``` T = t^2, P=N, M=mt, N=mt^2 => N^2=M^2*T P = N ```
* **Salt in password hashing:** Using large and random salts decrease the
  effectiveness of TMTO/Rainbow attacks as well as dictionary attacks since
  these are precomputed without (or hopefully without your) salt. The salt is
  concatenated with the password before hashing it. By the Kerckhoff principle
  the salt should be available to the attacker. Thus to be effective the salt
  should be unique for each user (a.k.a. dynamic).
* **How the system can help protecting against password compromise:**
  * Checking the password at appropriate events
  * Forcing password expiration
  * Forcing the user to use a strong password
  * Limiting log in attempts
  * Showing audit information
* **Biometric Systems:**
  * **FRR:** False rejection rate, how many users were falsely rejected
  * **FAR:** False acceptance rate, how many users were falsely accepted
  * **EER:** Equal error rate
  * Relations: EER ->FAR = FRR if **FTA** (Failure to acquire, i.e. read
    biometric data) is zero

## Chapter 5
* **Discretionary control:** Rights defined by owner of object
* **Mandatory control:** Rights defined by system
* **Capabilities:** A user has capabilities, i.e. the rights of the user
* **Access Control Lists:** From the object perspective i.e. which users have
  what rights
* **Powersets:** (how they can be used in access control)
* **Least upper bound (lattices):** a={x}, b={y} -> u={x,y} (smallest union)
* **Greatest lower bound (lattices:**  a={x,y}, b={x,z} -> l={x} (greatest
  set of common elements)

## Chapter 6
* **Reference Monitor:** An abstract idea of how to implement security in a
  system including how access to files should be handled other policies
* **Security kernel:** hardware, firmware and software that implements the basic
  security procedures described in the reference monitor
* **Trusted computing base (TCB):** hardware, firmware and/or software
  components that are critical to its security, if bugs or vulnerabilities
  occur within the TCB the security for the whole system could be jeopardized
* **Controlled Invocation:** when a user needs to run a program which performs
  something that requires elevated permissions, the system switches to a
  supervisor mode and performs the task, then reverts to normal permissions and
  gives back control to users. An example being running system programs in
  Windows Vista/7 or switching users in Unix

## Chapter 7
* **UID in Unix** 
  * **Real:** ID of logged in principal, can only be changed by root 
  * **Effective:** ID used for access control, i.e. a process can be run as
    another user
* Crypts

|                 |  DES crypt    |  MD5 crypt   | bcrypt        |
| --------------- | ------------- | ------------ | ------------- |
| Password length |  Max 8 chars  |  Infinity    | max 72 chars  |
| Salt length     |  12 bits      |  12-48 bits  | 128 bits      |
| Variable cost   |  No           |  No          | Yes           |
| Evals/sec       |  1 000 000    |  10 000      | 450           |
| Conclusions     |  Fast         |              | Safe          |

* **/etc/shadow-file:** saves password in hashed form along with:
  * Username
  * Hashed passwords
  * Date of last password change
  * Min days between password change
  * Max valid days of password
  * Days in advance to warn user to change password
  * Days account is active after password expiration
  * Days of account disabling
  * Also contains a reserved entry
* **Access control in Unix:** discretionary access control, owner of object can
  change permissions

  ```
  drwxr--r--
  ```
  The above stands for a directory with read, write and execute for owner, read
  for group and read for other (in that order grouped by three). First bit is
  reserved for directory and is left blank on files

  * Access control for folders:
    * **Read:** list directory contents
    * **Write:** delete, rename and insert files in directory
    * **Execute:** access directory and access files in directory
* **Setuid in Unix:**
* **Inode:** index node, contains information about object such as:
  * Size
  * Access rights
  * Last access
  * Last modification of file / inode
* **Umask:** like chmod, but sets default permissions
