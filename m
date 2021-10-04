Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559842197B
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 23:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZHT1KVRz2yg5
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 08:54:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 341 seconds by postgrey-1.36 at boromir;
 Tue, 05 Oct 2021 08:53:57 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNZH93Dj4z2yMD
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 08:53:56 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id C162E1825F
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 17:56:05 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HliF5Xwyj5aE for <openbmc@lists.ozlabs.org>;
 Mon,  4 Oct 2021 17:55:57 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id BD2CD180C7
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 17:55:57 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 35C2B58B
 for <openbmc@lists.ozlabs.org>; Mon,  4 Oct 2021 17:47:55 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: SPAKE, DTLS and passwords
In-Reply-To: <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 04 Oct 2021 17:47:55 -0400
Message-ID: <17277.1633384075@localhost>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > The planned IPMI over DLTS function will have certificate-based
    > authuentication.=C2=A0

Do you mean that the server will be authenticated with a certificate, or th=
at
it will use mutual authentication?

    > For our use cases, we would like to add password-based
    > authentication, and we want to do so as securely as possible, meaning=
 what
    > protocol we should use.=C2=A0 In particular, we want to know if we sh=
ould avoid
    > sending a =E2=80=9Ccleartext=E2=80=9D password (tunneled over DTLS) t=
o the server.

If it can be avoided, yes.

https://www.rfc-editor.org/rfc/rfc8125.html#section-3.1 suggests that all
the PAKE candidates (whether balanced or augmented) satisfy this.
I strongly suggest that a PAKE be used.
The CHIP/MATTER IoT people are using
   https://datatracker.ietf.org/doc/draft-bar-cfrg-spake2plus/
although the IRTF CFRG hasn't adopted that document yet.  I don't know
exactly where they are with it.  But, I expect you will find many libraries
going forward.

    > However note the Redfish password authentication passes in the cleart=
ext
    > password to the Redfish/HTTP server (tunneled over HTTPS). Does not n=
eed the
    > existing ipmi_pass file, or will at least store the password securely=
 in it.

When the password is set, it can be set into two different hashed forms if =
necessary.

There are two concerns that I think this description deals with.

The first is:
  a) possibility that a cleartext password will be intercepted via
     Onpath active attack to the connection. (a "MITM")

The second is:
  b) possibility that a cleartext password will be recovered from the
     target system's authentication database.


Whether or not (a) is likely depends very much on whether or not the BMC wi=
ll
be provisioned or onboarded with useful certificates that the clients can
actually validate.   If the operational uses of IPMI-DTLS and HTTPS APIs
are regularly skipping certificate validation, then it's probably important
that this does not result in a password capture.

{I said in summer 2020 that I would be writing a BRSKI, RFC8995 client for
BMC. Sometime in fall 2020... but now I'm actually close to saying Winter
2022.  I have many questions about testing this that I'll come back to}

(b) wouldn't be a huge problem if all the passwords are unique.
Afterwall, if an attacker can get a password out of the system, then the
attacker already has access to that system.  If the passwords are unique,
then retrieving that password gets the attacker nothing.

Now, if none of the mechanisms require that a cleartext password be stored =
on
the system, then (b) is moot.

Best is if no passwords are used, even if they are never transmitted,
but many seem to find this operationally difficult to do.

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [





--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmFbdooACgkQgItw+93Q
3WWvVAf/b7CSf2KLxtROzDm08yHL9wwyWGmw3/Mw2V/MbdQXA+dFcPqg9eI2SZqB
3VmL6Y/bsJvsBAUy6PZ04LJ/5+GoynUpNklulUK/yJPbqfnZZnNczQmkKzq07DaQ
4JpqkiyPIdzDnMYYno1t4loF6JY4w2pbi6dcNKT24yFs5b7iGDiWbfYwBXqTveSl
R58FH/s24gjWb3oI9klR/5UF7mabNaVKv+1QiQmCqfTPpb0X81wUWCnf0crPqK/K
j9WvtoA+yD1XBqDXPxE7/29P3eozsXxHwypeyYsUcl8ws9fWc/SJsavm/vAA+rbK
JP95Kc1YwCW5DgTqopGGFVJlGwZGvg==
=Zj/K
-----END PGP SIGNATURE-----
--=-=-=--
