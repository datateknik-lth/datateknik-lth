Exam Checklist
==============

## Chapter 3
* **Terms:**
  * **Confidentiality:**  Prevent unauthorized disclosure of information
  * **Integrity:**        Prevent unauthorized modification of information
  * **Availability:**     Information that should be available is not withheld
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
  * *Example:* program imitating login screen of Windows. The Ctrl-alt-Delete
    sequence can here be used to make sure that the login screen is not a
    spoofed version. I.e. even when it appears that the system is logged out
    a user should always press the control sequence
* **Password recovery**
  * **Brute force:** Testing every possible combination for a password. Time
    consuming for large passwords
  * **Dictionary:** Trying a set of common words/phrases/passwords as the
    password (usually from a large dictionary, i.e. RockYou.com and language
    specific words and phrases)
  * **Time-memory-trade-off:** Using a pre-computed table of resulting hashes and
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
* **Bio-metric Systems:**
  * **FRR:** False rejection rate, how many users were falsely rejected
  * **FAR:** False acceptance rate, how many users were falsely accepted
  * **EER:** Equal error rate
  * Relations: EER ->FAR = FRR if **FTA** (Failure to acquire, i.e. read
    bio-metric data) is zero

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
* **Search path:** an incorrect search path could have users executing false
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
  with a challenge sent by the server the result is then sent to the server and
  verified. Supports different cases and more chars
  * **Vulnerabilities:**
    * Backwards compatible with LM (meaning old passwords stored in LM)
    * Credential forwarding attack
    * MD4 is very fast, no salt so TMTO/Rainbow attacks are possible
* **Access tokens:** when a user is authenticated, the **Local Security
    Authority** (LSA) creates an access token for said user. The token is then
    attached to all processes run by the user and lists user, user's group and
    user privileges among others
* **Privileges:** are associated with operating system functions and relate to
  activities like system administration, backup, mail/network access. Is applied
  to the local computer and stored in the access token.
* **Security descriptor:** Data structure which contains security information
  associated with an object.
  * Owner SID
  * Primary group SID
  * DACL
  * SACL
* **DACL:** discretionary access control list, identifies who is allowed/denied
  access to object
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
  design queries that would further reveal information by returning a small (or
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
  * **ss-property:** If access operation includes read then subject security
    level must dominate classification of object (i.e. >= object)
  * **star-property:** (*-property) if access operation includes append or write
    then subject security level must be dominated by the classification of the
    object. (i.e. the object's level >= subjects)
  * **ds-property** access rights given in access control matrix must be
  followed, discretionary access control, subjects may pass access permission on
  to other users
  * **Basic security theorem:** if all above properties are satisfied, the
  current state can be considered secure. As long as any state change doesn't
  violate these properties the system remains secure
  * **Tranquility:** Security levels and access rights never change
* **Difference between BLP and Biba:** focuses on integrity, subjects and 
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
* **Purpose of evaluation:**
  * **Evaluation:** assessing whether a product has the security properties
    claimed for it
  * **Certification:** assessing whether a product is suitable for a given
    application
  * **Accreditation:** deciding that a product will be used in a given
    application
* **Strengths and limitations of security evaluation**
  * Fee paid for evaluation
  * Time devoted to producing evidence required for evaluation
  * Assurance for non-technical users resulting in improved user perception
  * Evaluation performed by private companies can result in certain bias since
    the company performing the evaluation is getting paid
  * Time consuming to do a proper evaluation, especially if the TCB is advanced
  * **Government evaluation:** fair, slow, not all products accepted for
    evaluation
  * **Private evaluators:** more difficult to avoid bias, consistency between
    evaluating bodies (meaning clear formulation of criteria is mandatory),
    faster evaluation
* **Orange Book**
  * Mainly security products i.e. operating systems
  * The orange book attempts to provide a general document providing:
    * A yardstick for users to assess the degree of trust that can be placed in
      a system
    * Guidance for manufacturers of computer security systems
    * A basis for specifying security requirements
  * Evaluation examines TCB, access control policies from Bell-LaPadula
  * Uses evaluation classes that combine security features with assurance
    requirements
    * **D** - minimal protection, i.e. submitted but does not meet requirements
      for higher rating
    * **C1** - discretionary security protection, DAC for users/groups,
      co-operating users, process data at same level, features identification
      and verification of users. Suitable for a "friendly" environment
    * **C2** - controlled access protection, DAC for individual users, no object
      reuse, audit needed, common for commercial applications
    * **B:** is generally intended for products that handle classified data and
      enforce the mandatory Bell-LaPadula policies
    * **B1** - labeled security protection, MAC (for some objects),
      documentation and source code analyzed, labels constructed from levels and
      categories
    * **B2** - structured protection, MAC for all objects, trusted path for
      login, formal model of security policy
    * **B3** - security domains, security administrator, automatic warnings from
      audit
    * **A1** - verified design, formal models and formal analysis, stringent
      configuration management and distribution control
  * **Limitations:** only recognized in the US, evaluation performed in other
    countries not valid in the US, focused on OS:s, MAC rarely used in
    commercial applications, integrity and availability not addressed, criteria
    creep (criteria become more and more specific, i.e harder to get C2 year X
    than to get C2 year X-1), very slow
* **ITSEC**
  * Co-op between European countries
  * Removes link between functionality and assurance
  * Applies to both products and systems
  * Evaluation levels determine confidence and correctness (E0-E6)
  * Close cooperation between sponsor/developer and evaluator
* **Common Criteria**
  * An effort to make security evaluations as widely recognized as possible
  * CC merges ideas from their various predecessors (extremely voluminous
  document)
  * Abandons strict separation of functionality classes and assurance levels and
    follow the Federal Criteria in using **protection profiles** like predefined
    security classes
  * New protection profiles can be added by anyone (is of course vetted and
    evaluated)
  * Some public sector customers require security evaluation, popular in smart
    cards sector
  * **Criticism:** expensive and driven by government requirements, cost can be
    10-40% of development cost, time delay, re-evaluating new version is
    expensive, only applies to **one** version and **one configuration**, EAL5-7
    are only accepted within the country where they're evaluated
* **Functionality and assurance for products**
  * **Orange book:** uses evaluation classes that combine the two
  * **ITSEC:** security functions specified individually or by predefined
    functionality class. Separation of functionality and assurance.
  * **Common Criteria:** security functional requirements, evaluation assurance
    level, package of assurance requirements

* **Classifications of products**
  * **Orange Book** - D to A
  * **ITSEC** - separation between functionality and assurance
  * **Common criteria** - EAL1 to EAL7, uses protection profiles which can then
    be assured

## Chapter 14
* **Empirically secure:** Secure based on the fact that no one has broken it for
  sometime
* **Provably secure:** We prove that breaking a scheme is at least as hard as
   breaking some well known problem like factoring or discrete log.
* **Unconditionally secure:** The schemes are secure even if the adversary has
   unlimited computing power.
* **Kerckhoff's principle:** Only the key should be unknown to an adversary.
   security should not be based on the fact that an algorithm is secret.
* **Stream ciphers and one time pads (OTP)**
  * **Stream cipher:** take a short random key and expand it to a long
     pseudo-random sequence of bits
  * **OTP:** different substitutions for every character, "Stream cipher is a
    number of OTP that repeats"
* **Stream ciphers vs. block ciphers:** stream send message bit by bit in a
   stream, block sends larger blocks and cannot retain state between blocks
* **ECB:** electric code block, all blocks encrypted independently, redundancy
  reserved
* **CBC:** cipher block chaining, redundancy removed
* **OFB:** output feedback, turns the block cipher into a stream cipher
* **Symmetric and asymmetric keys:**
  * Symmetric - same key for encryption and decryption
  * Asymmetric - public (to encrypt or verify) and private key (to sign or
      decrypt)
<pre>
                Security Primitives
                ------------------
                  |             |
          Asymmetric            Symmetric
          (public keys)         (Private key)
          -------------         -------------
          |       |             |         |
    Digital     Ciphers       MAC       Ciphers
    Signature   -------       ---       -------
    ---------                           |     |
                                      Block   Stream
                                      -----   ------

</pre>

* **Computing a toy RSA example:**

  ```
  //Pick primes p,q let n=p*q
  phi(n) = (p-1)(q-1)
  //Pick an integer e such that
  gcd(e,phi(n)) = 1
  //Find d such that
  e*d = 1 mod phi(n)
  //Public key: e,n
  //Private key d,phi(n),p,q

  //Encrypt:
  c = m^e mod n
  //Decrypt:
  m = c^d mod n
  ```

* **Properties of hash functions:** one way, deterministic, uniform (same
  probability for all values) , variable range, variable range with minimal
  movement, data normalization, continuous
* **Birthday paradox:** comes from statistical theory, and more specifically
  from the answer to "How many people do you need in a room such that the
  probability that two have the same birthday is 50%?" (Answer: 23). This means
  that chances of collision with given h(x) is `2^n/2` and chances of collision
  with **any** earlier trial is `2^n`. This is a n-bit long hash. If the number
  of different outcomes is "n", then 50% chance of collision comes at `sqrt(n)`.
* **Properties of MAC functions:** ease of computation (given parameters),
  signature algorithm and verification algorithm, does **not** provide
  encryption
* **Digital signatures:** key generation, signature and verification algorithm
  * Private key for signatures, public for verification
  * Does **not** provide encryption
  * **HOWEVER:** it does provide non-repudiation
* **El Gamal** is based on the discrete logarithm problem

## Chapter 15
* **Key transport:** one party obtains secret key and securely transfers it
  to the other party (aka key distribution).
* **Key agreement:** both parties contribute to the generation of the secret key
* **Implicit key authentication:** one party knows that no one besides a
  specifically identified 2nd party may gain access to a secret key
* **Key confirmation:** one party is assured that the second party has possession
  of a secret key, but doesn't have to know the identity of said party
* **Explicit key authentication:** both implicit and explicit key authentication
  and key confirmation
* **Replay attacks:** listening in on communication between parties and then
  repeating the information to one party. Can be used to authenticate when a
  nonce hasn't been used
* **Certificates**
  * Primarily binds a subject name to a public key, information is signed by a
    CA. If a user trusts the CA, it will trust the certificates signed by the CA
  * Important certificate fields: Version, Issuer name, Period of validity,
    subject name, public key information, extensions, signature
* **Diffie-Hellman:** A and B do not share any secret in advance, goal is to
  establish a secret shared key, send equation based on random number and
  compute key from this.
  * **Vulnerabilities:** prone to man-in-the-middle attacks
* **Station-to-station:** solves DH, authentication added by adding signature
  to handshake. Alice generates `g^x` and sends this to Bob. Bob calculates
  `g^y` and the key `K = g^x*y` concatenates `g^y` with `g^x` and signs with
  his asymmetric key and then encrypts the signature with K. He then sends `g^y,
  E_k(S_B(g^y,g^x))` to Alice. Alice decodes the message and sends her own
  encrypted package to Bob, verifying her own identity.
* **AKEP2:** authenticated key exchange protocol 2, uses nonce, two long-term
  keys shared by A and B. Two secure keyed hash functions, implicit key
  authentication against active attack
  * Limitations: two parties are required to share some secrets in advance. If
    one user has communications with a lot of people, a table for secrets has to
    be maintained
  * Solution: use a trusted middle party, i.e. a server
* **EKE:** encrypted key exchange, use a temporary public key encrypted with
  password to encrypt session key
* **Needham-Shroeder:** like EKE, but uses nonce
  * Problem: Receiving party does not know if key is fresh, prone to replay
    attacks. The key as in `K_ab` in `eK_bs(K_ab, A)` which is sent from A
    after telling key-server it wants to communicate with B.
* **Kerberos:** like NS with time-stamps and limited lifetime for keys, solving
  the problems with NS

## Chapter 16
* **Traffic analysis:** who is talking to whom, and how often? What types of
  information are they receiving? By looking at the length of messages
  statistical methods can be used to determine what information is being
  exchanged
* **The SSL handshake when RSA is used:** client generates "premaster secret"
  and uses RSA to encrypt it with public key of server. Process:

<pre>
    Client Hello
      Client random
      Suggested cipher suits
      Suggested compression

    Server Hello
      Server random
      Decided cipher suit
      Decided compression

    Server
      sends certificate
      requests certificate
      hello done

    Client
      sends certificate
      verifies certificate
      change cipher
      finish

    Server
      change cipher
      finish
</pre>

* **Purpose of random numbers in SSL:** provide known seed to PRF (pseudo random
  functions), Allow both client and server to contribute to key generation.
  Avoid replay attacks
* **IPsec:** provides security on the network layer, mandatory for IPv6,
  optional for IPv4 contains an **authentication header** (no longer recommended)
  as well as an ESP (encapsulating security payload
  * **Authentication header:** data origin authentication and integrity with MAC
  * **ESP:** provides confidentiality and/or authentications. Uses symmetric
    encryption and MAC
  * **Transport-mode:** end-to-end security, endpoints must implement IPsec,
    covers payload only, append new header behind old header
  * **Tunnel-mode:** gateway-to-gateway security, no need for hosts to implement
    IPsec, covers entire datagram. ESP makes real source and destination unknown
    to intermediate routers when combined with tunnel mode

## Chapter 17
* **Packet filters:** working on IP and TCP/UDPlayers. Packets examined
  individually, base filter on ip and port
  * *Permissive policies:* allow all except ...
  * *Restrictive policies:* deny all except ...
  * **Problems:** must allow all ports >1023 in order to allow
* **Stateful Packet filters:** solution to above issue, keep track of connection
  in a table. Allow incoming packets on ports >1023 only if it is in table
* **Application level proxies:** relays application-level traffic, sets up own
  connection to remote host, can audit and log at application level, slower
  than packet filter, higher cost
* **Idea behind anomaly detection:** user statistics, attacks are not necessary
  anomalies, common metrics like counter, gauge, interval timer and resource
  utilization.
  * Finding anomalies: mean and standard deviation, multivariate, Markov
    processes, time series, operational model deciding what is *normal.*
* **Misuse detection for IDS (Intrusion Detection System):** works against
  insider threats to vulnerable company data. Looks for attack signatures,
  examining network traffic and logs i.e. failed logins. Uses database for
  signature. Works well against attacks with fixed behavior. Race between
  attackers and signature developers
* **Purpose of Honeypots:** draw attention away from real system, collect
  information on attackers, encourage attackers to stay in system long enough
  to be identified

## Chapter 19
* **Authentication and key agreement in GSM**
  1. TMSI sent to MSC/VLR, IMSI sent from MSC/VLR to HLR/AuC
  1. AuC uses A3/A8 to compute RES and Kc, sends challenge to SIM
  1. SIM hashes challange with RAND (challange) giving Kc and SRES
  1. SRES sent to AuC, if SRES=RES SIM is authenticated
* **Improvements in UMTS compared to GSM:** GSM had broken encryption
  algorithms, only users were authenticated - the network was not. In UMTS the
  user is authenticated, a session key for encryption is used, the network is
  authenticated and a 128bit session key is used
* In GSM a stream cipher is used
* In UMTS a block cipher in a stream cipher mode
* **CRC-32 problem in WEP:** The remainder of the CRC32 is the ICV (Integrity
  check value). This allows for a message to be added to the original message
  without breaking the integrity check.
* **IV-size problem in WEP:** The initialization vector is only 24 bits, after
  `2^24` frames the IV will repeat. RC4 does not define how to use IV resulting
  in the IV being concatenated with the key. Which means that it is possible to
  recover the key very fast, no matter if the key is 40 or 108 bits. Since the
  IV repeats, there is no defense against replay attacks
* **Authentication problem in WEP:** when authenticating we send an auth request
  which is answered by a 128 byte challange. The challange is encrypted with the
  shared key, success if correct encryption.
  * *Attack:* Save `keystream = challange (+) response` for an IV, use the same
    keystream for any new challange and use same IV
* WPA2 uses AES and is completely different from WEP and WPA
