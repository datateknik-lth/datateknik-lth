General terminology
===================
* **Subject:** processes
* **Object:** files, folders, memory and I/O devices
* **Principal:** UID
* **Mandatory Access Controll:** the operating system constrains the ability of
  a subject to access or perform some sort of operation on an object. 
* **Threshold:** used in biometric scanners to adjust the FAR and FRR. A high
  threshold increases the probability that a valid user is rejected (FRR). But
  will at the same time lower FAR, false acceptance rate. And vice versa for a
  low threshold
* **Breaking WEP:** Since RC4 is a stream cipher the encrypted response is given
  by `response = challenge (+) RC4(IV || K)` the keystream can be computed as
  `RC4(IV||K) = response (+) challange`. If the challange and response are
  eavesdropped, the keystream can be obtained easily, without knowing the key.
  The IV is also sent in clear text and can be eavesdropped. To authenticate as
  Alice, all Eve has to do is take a challange and calculate the response
  described above.
* **How WEP fails**
  * **Confidentiality:** the usage of IV in the stream cipher is flawed, also
    the IV is too short
  * **Integrity:** The integrity algorithm used is linear (CRC32) resulting in
    the attacker being able to append to the message without failing the
    integrity check
  * **Authentication:** see "**Breaking WEP**"
* **Difference between data and information:** data is something storeable, and
  representable by ones and zeroes. Information is the interpretation of data.
  We usually want to protect information but we can only protect data
* **Data/Information in database security:** databases store data and access
  control can easily be specified by who has access to this data. Attacks,
  however, like the tracker attack uses data that is not sensitive according
  to the access control, in order to derive sensitive information
* **Preimage resistance:** for essentially all pre-specified outputs, it is
  computationally infeasible to find any input which hashes to that output
* **Second Preimage resistance:** it is computationally infeasible to find any
  second input which has the same output as any specified input. I.e. given `x`
  to find a second preimage `x' != x` such that `h(x) = h(x')`
* **Collision resistance:** computationally infeasible to find any distinct
  inputs `x`,`x'` which hash to the same output
* **Confidentiality in Bell-LaPadula:** Subjects are not allowed to read objects
  with a higher security level. Subjects are not allowed to write information to
  objects with lower clearance. The main idea is that information should not be
  allowed to flow downwards in a system
* **Integrity in Biba:** subjects and objects are labelled depending on their
  level of integrity. Where integrity means how reliable the information they
  provide is. The subjects are not allowed to read information from objects with
  lower clearance than themselves. Subjects are not allowed to write to objects
  with higher clearance than themselves. The idea is that information should not
  be allowed to flow upwards in a system.
* **Combining integrity from Biba with confidentiality from BLP results in
  information not being allowed to flow either upwards or downwards in the
  system**
* **ACE:** access control entry
* **Merkle-Damgård:** is a method that can be used to construct hash functions.
  Namely collision-resistant cryptographic hash functions from
  collision-resistant one-way compression functions. Used to construct **MD5**,
  **SHA1** and **SHA2**.
* **Protection profile:** a document in common criteria (CC) which specifies the
  functionality of a product
* **Security Association:** the SA holds information about algorithms, keys and
  usage modes for an IPsec connection
* **Clark-Wilson model:** a security model which focuses on integrity in
  commercial systems rather than military systems. Integrity is maintained by
  preventing corruption of objects in a system due to either error or malicious
  intent
* **Canary value:** a value that is inserted in the stack just before the local
  variables. When the function returns, this value is checked to make sure it
  hasn't changed, as it would have in the case of a buffer overflow attack
* **How UMTS provides non-repudiation:** only symmetric cryptography is used in
  UMTS meaning that there is no non-repudiation provided at all
* **Preventing spoofing:** system spoofing, can be prevented via a control
  sequence (trusted path) in windows this is *Ctr-alt-delete*.
* **Detecting spoofing:** The system can show number of failed login attempts
* **Real UID and effective UID in Linux:** The real UID is the ID of the logged
  in user. It is used to identify the logged in user in case the effective UID
  is temporarily changed. The effective UID an always be changed to that of the
  real UID. The effective UID is used for access control. Access rights for
  files are compared with the effective UID of the user
* **Group access control Win vs Linux:** in windows the rights are the union of
  the user's rights and rights of the user's groups. In Linux if the user is the
  owner of a file, the only permissions checked are that of the owner. Else the
  groups' permissions are checked.
* **Location of header in IPsec:** in transport mode the original IP header is
  placed before the ESP header. In tunnel mode the original IP header is
  encapsulated in the payload (gateway-to-gateway, meaning that the actual hosts
  do not need to be IPsec aware)
* **Differences between orange book and CC:** in OB, functionality and assurance
  were not separated, meaning that a product could not have low functionality
  and high assurance. In CC there is a separation. In CC a product can be
  evaluated against one ore more protection profiles, which state the
  functionality of the product. The assurance level is separated from this and
  is given by how much effort was put into the evaluation
