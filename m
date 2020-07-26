Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334022E298
	for <lists+openbmc@lfdr.de>; Sun, 26 Jul 2020 22:36:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFF8Z2X2NzF10g
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 06:36:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFF7T6bBdzDrMs
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 06:35:33 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id AFAFB38A54
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2020 16:14:49 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ZP7q4nSsNuaP for <openbmc@lists.ozlabs.org>;
 Sun, 26 Jul 2020 16:14:49 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id ED55238A1C
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2020 16:14:48 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id F202E1AA
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jul 2020 16:35:18 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
In-Reply-To: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 26 Jul 2020 16:35:18 -0400
Message-ID: <14851.1595795718@localhost>
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
    > Problem:
    > BMCWeb apparently treats certificates that are either expired or not =
valid
    > until a future date as unusable (investigation needed).=C2=A0 And BMC=
Web deletes
    > unusable certificates.=C2=A0 This can confuse the administrator, espe=
cially
    > considering the BMC's time-of-day clock may not be set as expected.

    > Proposal:
    > What certificate management policy should BMCWeb use?=C2=A0 Here is a=
n initial
    > proposal:
    > 1. certificate is perfectly good - Use the certificate.

okay.

    > 2. certificate is good but expired or not yet valid - Use the certifi=
cate and
    > log a warning.

very good.

    > 3. certificate is missing or bad format or algorithm too old - Use an=
other
    > certificate or self-generate a certificate (and log that action).
    > In no case should BMCWeb should delete any certificate.

I think that there is a problem in 3.

"certificate is missing" is pretty much unambiguous.
"bad format" depends a bit upon evolution of libraries.
In particular, a new version of libssl might support some new algorithm, and
then should the firmware be rolled back, it will "bad format".

So I suggest that the certificate+keypair is never deleted, but may be rena=
med.
I think that we could have a debate about getting telemetry about bad
certificates back via HTTP.

I think that there are some operational considerations relating to
determining root cause that may trump some security issues relating to
telling bad actors whether they have succeeded in damaging a certificate.

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

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl8d6QYACgkQgItw+93Q
3WVHfwf+IUhCn6zPZxIDA2IW2Bd75XGQMVEGOdltF9XE4iZ5qtMwr52bN+PAaLpT
wm/ACb9ZgLAthILlr9MJtfOfOdYWjm2ytK1UKhwNQn/jSxio00gMhF8xuW2kweF2
HjnpyVJlT+z4ioN3xMjjk/fCSqwG6U/5VGjeprB73l1KfCXtThlgM772H1dap1O+
F7F1hS8ukbFbifCmtO5RByBzcy4vOQ79WJa6sQ2PTbvHNU5d9uph5MQY0P1ws86p
UBIcQ21h5UyZ31hM5DJi/Dd0Z27cFr6ty6bdpSjs01T/bososwZdslWvEWdnzyDi
O2brSePQKTTFIEidbDXw9x9h//U0XA==
=bHkb
-----END PGP SIGNATURE-----
--=-=-=--
