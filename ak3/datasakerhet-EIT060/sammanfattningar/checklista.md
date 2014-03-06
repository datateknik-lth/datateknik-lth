Checklist for exam 2014-03-12


3:

*
  Confidentiality -  Prevent unauthorized disclosure of information.
  Integrity - Prevent unauthorized modification of information.
  Availability - Prevent unauthorized with-holding of information and resources.
  Authentication - Act of confirming the truth of an entity, i.e. person/program.
  Nonrepudiation - A way to guarantee that a sender/reciever cannot deny having sent/receieved a message.
  Accountability - Users affecting security are held responsible.
  
*
  Data - Physical phenomena
  Information - What we assign to data
    Data is used to transit and store information.
    
4:

*
  Spoofing - A way to obtain password. Used when user does not authenticate system.
  E.g. false login screen.
  
*
  Brute force - Go through all possible passwords.
  Dictionary - Passwords are often based on words. Normal passwords stored in dictionaries.
  Time-Memory Tradeoff (TM TO) - In a way brute force. 
    Preprocessing phase, calculate hashes for number of passwords.
    Realtime phase, find hash in table, go to starting point -> password.
    
*
  Time-Memory Tradeoff - Pick password, calculate several reductions of hashes. Save start and end in table.
    T=t² P=N M=mt N=mt² -> N²=M²T P=N
    
*
  Rainbow tables - Improvement of TM TO. Use different reduction funtion for each computation. Fewer collisionchains. One table. Used when hash is known.
  
*
  Salts - Adds uniqueness to passwordhash
  
*
  Help from system - 
    Password checkers.
    Automatic password generation.
    Limit password time
    Limit Login attempts
    Show audit information
    
*
  Biometric systems - System that uses biological login information.
    FRR - False rejection rate
    FAR - False acceptance rate
    ERR - Equal error rate
    ERR -> FAR=FRR
    
5:

*
  Discretionary access control - The owner of an object decides the rights.
  Mandatory access control - The system decides the rights.
  
*
  Capabilities - List rights from user perspective
    Ex. Alice: A read, B read, C write.
    
  Access control list (ACL) - List rights from file perspective.
    Ex. A.txt: Alice read, Bob read.
    
*
  Powersets in access control - P(x) is the set of all the subsets in x, partial ordering. TODO NOT DONE!!
  
*
  Lattices - Graphical representation os a partially ordered set.
    Least upper bound u: a={x} b={y} u= {x,y}
    Greatest lower bound l: a={x,y} b={x,z} l={x}
    
*
  Reference monitor - Abstract machinery that controls all access to objects.
  Security kernel - The hardware, software etc. that implements the reference monitor concept.
  Trusted computing base (TCB) - The set of all protection mechanisms enforcing a security policy.

*
  Reference monitor:
  
                            -------
                            |Audit|
                            ---^---
                               |
                               |C
  ---------       A            |           D             -------
  |Subject|----------------->(RM)----------------------->|Object|
  ---------                   |^                          -------
                              ||
                              ||B
                          ----V|-----
                          |Security |
                          |Kernel   |
                          |Database |
                          -----------
  A: Requests access
  B: Checks if subject has right to access object
  C: Writes to audit 
  D: Grants/Denies access
  
  
*
  Controlled invocation
    User wants to execute an operation requiring supervisor mode.
    Switch modes.
    System performs predefined sets of operations, returns to user mode, and gives back control.
    
*
  UID Unix:
    Real - ID of logged in principal, can only be changed by root -> How login works.
    Effective - ID used for access control. Root can change to anything. Anyone can change to real.
    
*
  Crypts
                    |  DES crypt         MD5 crypt         bcrypt
  ---------------------------------------------------------------------------
  Password length   |  Max 8 chars       Infinity          max 72 chars
  Salt length       |  12 bits           12-48 bits        128 bits
  Variable cost     |  No                No                Yes
  Evals/sec         |  1 000 000         10 000            450
  Conclusions       |  Fast                                Safe
  
*
  Shadow file - Save password in non-world readable file. Hide hashes.
    Username
    Hashed passwords
    Date of last change
    Min days between password change
    Max valid days
    Days in advance to warn about user change
    Days account is active after password expire
    Date of account disabling
    -Last entry is reserved-
    
*
  Access control in Unix - Discretionary access control, owner of file can change permissions.
    User - Group - Other
    Read - Write - Executable
    
    Read = List Directory.
    Write = Delete, rename & insert files in directory.
    Executable = Access directory ans access files in directory.
    
    CHMOD for changes (CHMOD 111 file.txt)
    
*
  Setuid - Set user ID, Used to temporarily change access rights.
  
*
  Inode - Stores file information. ls -i gives files with inode pointers
    Stat file gives detailed inode information.
    Size          Inode number
    Access rights
    Last access
    Last modification of file
    Last modification of inode
    
*
  UMASK - Default access rights.
    Control default permissions.
    UMASK tells which permissions to exclude by default.
    Opposite of CHMOD.
    
*
  Searchpaths - When executing programs, system needs to know where to look -> PATH
    PATH=.:$HOME/bin:/usr/bin:/bin.
    Trojan horse, if found first, executed instead of program.
    Current directory in searchpath, bad if executed by root.
    
*
  Hosts.Allow/Hosts.Deny - Files containing pairs to determine Allowed or Denied network access.
  Check Allow -> Check Deny -> Allow
  
8:

*
  LM & NTLM
    Problem w/ LM:
      DES is a fast block cipher
      No salt
      Security does not increase after 7 chars
      No lowercase
      
    NTLM is better because:
      More chars
      All cases
      
*
  Access token - Contains the security credentials for a login session and identifies the user, users group, the users privileges + other.
  
*
  Privileges - The right to perform system related operations e.g. shutdown.
    Applies to local computer
    Differs from access rights
    Stored in access token.
    
*
  Security descriptor - Data structure that contains security information associated with an object.
    Owner SID, Primary group SID, DACL, SACL.
    
*
  DACL - Discretionary access control list.
    Identifies who is allowed/denied access to object
    No DACL -> full control
    Empty DACL -> Denied.
    SID can be allowed/denied.
    Denies stored in beginning.
    List of access control entries (ACE).
    
    Search:
      Go through list until ALL requests is allowed, or ANY is denied, otherwise deny.
      
    Consequences:
      Deny has precedence before allow.
      
    Windows:
      User  -r
      Group rw ------> user rw
      
    Unix:
      User  -r
      Group rw ------> user -r
      
*
  SACL - System access control list.
    Specifying types of events that should generate audit records.
    
*
  Access control in networks:
    Users must go through two access control lists to access file via a share.
    1st share ACL 2nd file ACL
    Effective permission is A&B
    1010 & 1000 -> 1000
    
*
  Access control for restricted token:
    Group SID used for deny ONLY.
    Two access checks
      User
      Restricted token
    Both MUST allow.
    
9:

*
  General tracker to derive information from statistical databases:
    Tracker w/o specific target.
    TODO NOT DONE!!!!
    
10:

*
  Buffer overflow:
    Find buffer to overflow in a program.
    Write the exploit
      Inject code in buffer.
      Redirect control flow to code.
    Target stack or heap.
    
  Memory                  Stack
  --------------      /   ---------------
  |Kernel code  |   /     |Function     |
  |& data       |  /      |Parmeters    |
  ----------------        ---------------
  |Stack  |               |Return address
  |       V               ---------------
  ----------------        |Saved frame  |
  |Extra memory | \       |Pointer      |
  --------------    \     ---------------
  |       ^     |     \   |Local        |
  |Heap   |     |       \ |Variables    |
  --------------          |             |
  |Global data  |         ---------------
  --------------
  |Program      |
  |machine      |
  |code         |
  --------------


  How does it work?
    Copy a large buffer into a small buffer.
    If length is not checked, data will be overwritten.
    Strcpy() does not check.
    Will overwrite return address.
    If return address is outside process space, result in segmantation fault.
    If dangerous code within process space -> able to run.
    Prepend NOP when attacking other program to make the guess easier.

  Detection:
    Usage of Canary value between local variables and sfp.
    If changed -> terminate.
    Include option -fstack-protector in GCC

  Prevention:
    Do not use unsafe functions.
    Mark stack as non executable.
    Use address space layout randomization.
    Java instead of C or C++. (JVM can be written in C though).

*
  SQL-injections Code injection technique.
    By inserting malicous SQL statements into an entry field for execution.

    Ex. input: '; drop table users;--
      can result in SQL query:
        $QUERY=SELECT * FROM users WHERE name = ''; drop table users;--';

    Prevention:
      Excape quotes.
      Check syntax using rewular expression.
      Turn off error reporting when not debugging.
      Use table and column names that are hard to guess.
      Name form fields different from columns.

11.1-11.2 & 12.1-12.3:

*
  Bell-LaPadula properties:
    ss-property - Simple security property.
      Mandatory access control
      No read-up: A user is not allowed read (observe) access to objects with higher security level.

    *-property - Star property.
      Mandatory access control.
      Does not apply to trusted subjects.
      No write down: A user is not allowed write (alter) access to objects with lower security level than the current level of subject.

    ds-property - 
      Discretionary access control.
      Subject may pass an access permission on to other users.
      Access rights given in access control matrix must also be followed.

*
  Tranquility in Bell-LaPadula
    Security levels and access rights never change.

*
  Biba difference from Bell
    Subject and objects mapped to integrity  levels forming a lattice.
    TODO NOT DONE DO NOT KNOW!!!!

*
  Integrity levels Biba
    Automatically adjusted.

    - Subject s read Object o at any integrity level.
      New integrity level of subject is the greatest lower bound of Fs(s) and Fo(o)

    - Subject s modify Object o at any integrity level.
      New integrity level of Object is the greatest lower bound of Fs(s) and Fo(o)
    

*
  Clark-Wilson focuses on integrity!

13:

*
  Security evaluation
    Strengths:
    Limits:
    TODO DO NOT KNOW NOT DONE!!!!!

*
  Functionality and assurance for products
    Orange book
      Uses evaluation classes that combine the two.

    ITSEC
      Security functions specified individually or by predefined functionality class.
      Assurance??

    Common Criteria
      Security Functional requirements
      Ecaluation assurance level, package of assurance requirements. 7 levels total.

      TODO NOT DONE!!!!!


*
  Classification of products
    Orange book

    ITSEC

    Common criteria

    TODO DO NOT KNOW NOT DONE!!!!!

14:

*
  Empirically secure
    Secure based on the fact that no one has broken it for sometime.

  Provably secure
    We prove that breaking a scheme is at least as hard as breaking som well known problem like factoring or deiscrete log.

  Unconditionally secure
    The schemes are secure even if the adversary has unlimited computing power.

*
  Kerckhoff's principle
    Only the key should be unknown to an adversary.
      Security should not be based on the fact that an algorithm is secret.

*
  Stream ciphers and One time pads (OTP)
    Stream cipher
      Take a short random key and sxpand it to a long pseudorandom sequence of bits.

    OTP
      Different substitutions for every character

    "Stream cipher is a number of OTP that repeats"

*
  Stream cipher vs Block ciphers
    Stream send message bit by bit in a stream.

    Block sends larger blocks.
      Cannot retain states between blocks.


*
  Block cipher modes
    ECB - Electric code book
      All blocks encrypted independently of eachother.
      Redundancy preserved.

    CBC - Cipher block chaining
      Redundancy removed.

    OFB - Output feedback
      Turns the block cipher into a stream cipher.

*
  Symmetric and Asymmetric

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


  Symmetric - Same key for encryption and decryption

  Asymmetric - Private + public key
    Public used to encrypt or verify
    Private used to decrypt or sign

*
  Birthday paradox
    Meaning:
      How many people do you need in a room such that the probability that two have the same birthday is >0.5

    Consequences:
      Number of trials before collision with given h(x) is 2^n

      Number of trials before collision with ANY earlier trial is 2^n/2

*
  Property of MAC functions
    Defining properties
      Ease of computation - given parameters
      Compression
      Conputation resistance - not given parameters.
    Does not provide encryption.

*
  Digital signatures
    Scheme consists of:
      Key generation algorithm
      Signature algorithm
      Verification algorithm

    Private signature key
    Public verification key

    Does not provide encryption

    Unlike MAC, it provides nonrepudiation

*
  El Gamal is based on the discrete logarithm problem.


15:

*
  Terms:
    Key establishment:
      Key transport - One party creates/obtains secret key and securely transfers it to the other party (aka key distribution).

      Key agreement - both parties contribute to the generation of the secret key.

    Other:
      Implicit key authentication
        One party knows that no one besides a specifically identified second party may gain access to a secret key.

      Key confirmation
        One party is assured that the second party has possession of a secret key (but identity of the other party may not be known).

      Explicit key authentication
        Both implicit key authentication and key confirmation.


*
  Replay attacks:
    Resending an eavesdropped hash will authenticate anyone with the hash.
    Prevented with nonce (Number used once)

*
  Certificates
    Primarily binds a subject name to a public key.
    Information is signed by CA, Certificate Authority
    Ca trusted -> certificate trusted.

    Important Certification fields:
      Version
      Issuer name
      Period of validity
      Subject name
      Public key information
      Extensions
      Signature

    Certificate chain
      CA->Alice->Bob
      Bob is certified indirectly by CA via Alice


*
  Diffie-Hellman protocol
    How it works:
      A and B do not share any secret in advance.
      Goal is this shared secret.
      Agree on two primes
      Send equation based on these with random number.
      Compute shared key from this

    Problem:
      No key authentication - Man-in-the-middle attack

*
  STS (station-to-station) solves DH
    Authentication added bu adding signature.

*
  Other protocols:
    AKEP2 - TODO DO NOT KNOW NOT DONE!!!!!!!

    EKE - Encrypted key exchange
      Use a temporary public key encrypted with password to encrypt session key.

    Needham-Schroeder - uses nonce
      Problem: B does not know if Kab is fresh!

    Kerberos - Like Needham-Schroeder with timestamps and limited lifetime for keys, solves NS problem.

16:

*
  Traffic analysis-Communication patterns can be found, who is talking to who and how often?

*
  SSL handshake when RSA is used:
    Client generates "premaster secret" and uses RSA to encrypt it with public key of server.

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

*
  Purpose of random numbers in SSL
    Provide known seed to the PRF (pseudo random function).
    Allow both client and server to contribute to key generation (key agreement).
    Avoid replay attacks.

*
  IPSec
    Provides security at network (internet) layer.
    Mandatory for IPv6, optional for IPv4.

    Authentication header, AH
    Encapsuling security payload, ESP

    Transport mode
    Tunnel mode

*
  Combos
    AH:
      Data origin authentication and integrity with MAC
      Authenticates payload + most of header
      Prevents replay and IP spoofing

    ESP:
      Provides confidentiality and/or Authentication.
      Uses symmetric encryption and MAC


    Transport mode:
      End-to-end security
      Endpoints must implement IPSec
      Covers payload only
      Append new header behind old header.

    Tunnel Mode:
      Gateway-to-gateway security
      No need for hosts to implements IPSec
      Covers entire IP datagram


    ESP makes real source and destination unknown to intermediate routers when combined with tunnel mode.

17:

*
  Packet filters
    Working on layers 3 (IP) and 4 (TCP/UDP).
    Packets examined individually.
    Base filter on ip and port.
    Permissive policies - Allow all except...
    Restrictive policies - Deny all except...

    Problem: must allow all ports >1023 in order to allow e.g. ftp, http ...

  Stateful packet filters
    Solution to above problem:
      Keep track of connection in a table. Allow incoming packets on ports ports >1023 only if it is in table.

  Application level proxy
    Relays application-level traffic
    Sets up own connection to remote host.
    Can audit and log at application-level
    Slower than packet filter, higher cost.

*
  Anomaly detection
    Uses statistics
    Attacks are not necessary anomalies
    Common metrics
      Counter, Gauge, Interval timer, resource utilization...
    Finding anomalies
      Mean and standard deviation.
      Multivariate
      Markov process
      Time series
      Operational model - What is normal?

  Misuse detection
    Looks for attack signatures, examining network traffic and logs e.g. failed logins.
    Uses database for signature.
    Works well against attacks with fixed behaviour.
    Race between attackers and signature developers.

*
  Honeypots
    Purpose is to:
      Draw attention away from real system.
      Collect information on attackers.
      Encourage attacker to stay in system long enough to be identified.

19: TO BE ANNOUNCED FRIDAY SEMINAR!!!





    TO BE CONTINUED!!!!!!!!!!
    ----------------------------------------------------------
