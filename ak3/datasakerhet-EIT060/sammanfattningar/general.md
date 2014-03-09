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
