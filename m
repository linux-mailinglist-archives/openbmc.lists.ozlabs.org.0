Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC323105C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 19:04:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGNLZ5ysXzDr3N
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 03:04:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 160074 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Jul 2020 03:03:24 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGNKm5fmRzDqN2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 03:03:23 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id ABDF038A2F;
 Tue, 28 Jul 2020 12:42:44 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id IirdVvsMlG_S; Tue, 28 Jul 2020 12:42:43 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 3AC04389E3;
 Tue, 28 Jul 2020 12:42:43 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id DE6061AA;
 Tue, 28 Jul 2020 13:03:14 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Ed Tanous <ed@tanous.net>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
In-Reply-To: <CACWQX81hRk+syCoDmhnQRLEZx-usQRbos___vTDOCCBFF7LqVQ@mail.gmail.com>
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <14851.1595795718@localhost>
 <CACWQX81hRk+syCoDmhnQRLEZx-usQRbos___vTDOCCBFF7LqVQ@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 28 Jul 2020 13:03:14 -0400
Message-ID: <17750.1595955794@localhost>
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
Content-Type: text/plain


Ed Tanous <ed@tanous.net> wrote:
    >> "certificate is missing" is pretty much unambiguous.

    > Unfortunately, this ambiguity comes with the territory.  On first
    > boot, bmcweb has no certificate, and doesn't know the difference
    > between "missing" and "was never there".  Regardless, to bring up TLS
    > it needs _some_ certificate, so the original behavior was that it

This is reasonable behaviour, but given that browsers are trying very hard to
make the certificate exception box go away, this does not really help
long-term in my opinion.

Missing means: "ENOFILE", not "Can we use this certificate file for starting
up an SSL Connect".

    >> "bad format" depends a bit upon evolution of libraries.

    > Today this is defined as the above.  "Can we use this certificate file
    > for starting up an SSL context?"  If the answer is no, we regenerate.
    > In theory, the only library we rely on for this is OpenSSL, which I
    > would hope doesn't have a backward incompatible evolution in this
    > area.

Yes, it does.
For instance, you can't load 1024-bit RSA keys with 1.1.1.
It refuses to start.
Meanwhile, 1.0.x does not have any ECDSA support, and you won't find this out
until the TLS session actually tries to start, at which point, it logs an
obsure message to stderr, and returns an error that most programs don't know
what to do with.
(And the TCP connection just ends)

    >> In particular, a new version of libssl might support some new algorithm, and
    >> then should the firmware be rolled back, it will "bad format".

    > In this hypothetical, you're thinking about a new, non x509
    > certificate file format?  I vote let's cross that bridge when we get

Nope, not about non-X.509.
Algorithms and keysize changes.

    > there, as it seems like there's a lot more discussion that would need
    > to happen around upgrades and downgrades.  Today the assumption we
    > make is that x509 certificate reading is backward and forward
    > compatible since the begining of openbmc, which, to my knowledge, it
    > is.

Until... it isn't.
But, the proposal would have considered a certificate with an invalid date as
being invalid, and generated a new one.

    >> So I suggest that the certificate+keypair is never deleted, but may be renamed.
    >> I think that we could have a debate about getting telemetry about bad
    >> certificates back via HTTP.

    > We can have a discussion, but I suspect a lot of people would be very
    > against using unencrypted HTTP for this purpose.

I agree.
So, how do you get information at this point?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl8gWlIACgkQgItw+93Q
3WXn1AgAnoG1Xj28QcEW4hYyMNmmuQw0JLfhBJO+yaNGX757K/FM9YU3w/ikt3Sl
XtS5AgdOGuX7NC6R/liuPOFTqUqNiXa88aQs3iTFFzrL6IUl4BuqK8VJsjzGfPmR
HWYflJ1dqZnSR81NsvkIOjq53jrpucoypv2VvwdtP4Pyqv9hS9Ii5o2jX9h98AYi
J8+ELCCDu9QBtd7K9Zu0yeltevdnkUg2JRM0PGhXoQvnXOAu3lWYBEZ0b+mLZHDc
sK/f2ABfX7sEQy8uEs1YGSxNpKgxA0lZxv9h8ChXG5g8T4IjkZi5kV7yj25Bq16H
3kYn6Iet8FZY779rqyF+ElyhZZsFrQ==
=/5kY
-----END PGP SIGNATURE-----
--=-=-=--
