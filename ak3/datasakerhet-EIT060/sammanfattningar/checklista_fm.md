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

    ```
    T = t^2, P=N, M=mt, N=mt^2 => N^2=M^2*T P = N
    ```

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
  * **Real:** ID of logged in principal, can only be changed by root - inherited
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
  reserved for directory and is left blank on files ('c' for a character device,
  'b' for a block device)

  * Access control for folders:
    * **Read:** list directory contents
    * **Write:** delete, rename and insert files in directory
    * **Execute:** access directory and access files in directory
  * **Setuid in Unix:** can be used to change the UID giving elevated
    permissions to a process. Programs using this function should be heavily
    scrutinized
* **Inode:** index node, contains information about object such as:
  * Size
  * Access rights
  * Last access
  * Last modification of file / inode
* **Umask:** like chmod, but sets default permissions which are anded with the
  permission of the object
* **Searchpath:** an incorrect searchpath could have users executing false
  programs, i.e. a custom version of "ls" is added to path and then used
  maliciously. Since folders are searched in order, adding this malicious
  program earlier than its real counterpart results in the "wrong" program
  being executed, without the user's knowledge.

  ```
  PATH=.:$HOME/bin:/usr/ucb:/bin:/usr:/bin:/usr/local:/usr/new:/usr/hosts
  ```

* **hosts.allow, hosts.deny:** in Unix TCPD and SSHD services will allow access
  to hosts in the **hosts.allow** file first, if the host isn't found the 
  **hosts.deny** file is searched. If the host isn't found in either, access is
  granted

## Chapter 8 - Windows Security
* **LM hash:** The LM hash is considered weak as the password is converted to
  uppercase and padded to 14 bytes (giving a maximum of 14 chars) then split
  into two and encrypted with a known salt (KGS!@#%) using DES. The result is
  stored in the SAM database
* **NTLM hash:** The NTLM hash is better, the password is hashed using MD4 and
  then padded up to 21 bytes. It is then split into three parts and encrypted
  with a challange sent by the server the result is then sent to the server and
  verified. Supports different cases and more chars
  * **Vulnerabilities:**
    * Backwards compatible with LM (meaning old passwords stored in LM)
    * Credential forwarding attack
    * MD4 is very fast, no salt so TMTO/Rainbow attacks are possible
* **Access tokens:** when a user is authenticated, the **Local Security
    Authority** (LSA) creates an access token for said user. The token is then
    attached to all processes run by the user and lists user, user's group and
    user privileges amongst others
* **Privileges:** are associated with operating system functions and relate to
  activities like system administration, backup, mail/network access. Is applied
  to the local computer and stored in the access token.
* **Security descriptor:** Data structure which contains security information
  associated with an object.
  * Owner SID
  * Primary group SID
  * DACL
  * SACL
* **DACL:** discretionary access controll list, identifies who is allowed/denied
  acces to object
  * No DACL: full control
  * Empty DACL: denied access
  * SID can be allowed/denied - denies stored in beginning
  * List of ACE (access control entries), containing flags, object type,
    inherited type, access rights, principal SID (the principal to which the ACE
    applies)
  * Difference between Windows and Unix:
    * Windows: user read, group rw -> user read and write
    * Unix: user read, group rw -> user read
* **SACL:** system access control list, specifies types of events that should
  generate audit records
* **Network access control:** users must go through two access control lists to
  access files via a share, namely the share ACL and the local ACL. The
  permissions are then anded together for the resulting permission
* **Access control for restricted token:** used to remove privileges from a
  given access token by adding a restricted token to the token. If both the
  access token and the restricted token are allowed access is given

## Chapter 9
* **Tracker attacks:** basically using statistical methods to elicit information
  from a database. If information is known about the target this can be used to
  design queries that would further reveal iformation by returning a small (or
  single) amount of entries. A basic fix would be to disallow queries that
  result in small entries. The query's complement could then be used, so to we
  would also have to ensure that the query's complement is large enough. This
  alone is not enough and other measures must be taken

## Chapter 10
* **Buffer overflow attacks:** in non-safe languages such as C, a buffer's
  bounds can be overwritten resulting in the adjacent data being overwritten
  in the stack or heap. If enough of the buffer is overwritten on the stack we
  can effectively change the return address to some address we control, such as
  the beginning of malicious input in an adjacent program.
  * Countermeasures: canary values, defining a section of the stack as
  non-writable or switching to a "safe" language
* **SQL-injections:** when a user is allowed to inject his own queries into the
  database by ending a previous query or modifying one that will be sent to the
  server.
  * Example:
  ```
  val input = getRequest("uid")

  val query = "SELECT * FROM users WHERE uid = " + input
  ```
    Where the user would enter something like "105 or 1=1" resulting in all
    users
  * Countermeasure: escape special characters, always use prepared statements,
    check for correct types, i.e. "1=1" is not an integer

## Chapter 11
* **Bell-LaPadula**
  * **ss-property:** simple security property, mandatory access control
    * Condition: State (b,M,f) satisfies the ss-property if for each element
    (s,o,a) belongs to b where the access operation is read or write, the
    security level of s dominates security level of o, i.e. `f_o(o) <= f_s(s)`
    * Attacks: since the condition implies no read-up the attacker would
    insert a trojan at a higher level transferring information to a lower level
    process
  * ***-property:** does not apply to trusted subjects, no write-down
    * Condition: State (b,M,f) satisfies the *-property if for each element
    (s,o,a) belongs to b where the access operation is append or write, the
    current security level of s is dominated by the security level of o, i.e.
    `f_c(s) <= f_o(o)`
  * **ds-property** access rights given in acceess control matrix must be
  followed, discretionary access control, subjects may pass access permission on
  to other users
  * **Basic security theorem:** if all above properties are satisfied, the
  current state can be considered secure. As long as any state change doesn't
  violate these properties the system remains secure
  * **Tranquility:** Security levels and acces rights never change
* **Difference betweeen BLP and Biba:** focuses on integrity, subjects and 
  objects are mapped to integrity levels, forming a lattice. Integrity levels
  in biba are automatically adjusted:
  * Subject s reads object o at any integrity level, the new integrity level of
  the subject is now the greatest lower bound of `F_s(s) and F_o(o)`.
  * Subject s modifies object o at any integrity level, the new integrity level
  of said object is now the greatest lower bound of `F_s(s) and F_o(o)`.
* **Clark-Wilson:** addresses security requirements of commercial applications
  where the focus is mainly on integrity. *Internal consistency* refers to
  properties of the internal state of the system, manageable by the computing
  system. *External consistency* refers to the relation of the internal system
  and the real world and has to be enforced by means outside the system, like
  auditing

## Chapter 13
* **Strengths and limitations of security evaluation**
  * **Orange Book**
  * **ITSEC**
  * **Common Criteria**
* Classifications of products (in above books)

## Chapter 14
## Chapter 15
## Chapter 16
## Chapter 17
## Chapter 18
## Chapter 19
