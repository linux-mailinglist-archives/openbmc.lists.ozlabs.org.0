Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2234DC25B
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 10:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK1Zb167Sz30NC
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 20:10:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 589 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 20:10:16 AEDT
Received: from relay.sandelman.ca (unknown [176.58.120.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1ZJ0Nv4z2xTq
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 20:10:11 +1100 (AEDT)
Received: from dooku.sandelman.ca (unknown [62.218.44.74])
 by relay.sandelman.ca (Postfix) with ESMTPS id 469871F4BF;
 Thu, 17 Mar 2022 09:00:02 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id 3CEC71A0461; Wed, 16 Mar 2022 15:45:31 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday March 16 - results
In-reply-to: <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
References: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
 <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
Comments: In-reply-to Joseph Reynolds <jrey@linux.ibm.com>
 message dated "Wed, 16 Mar 2022 12:51:11 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.7.1; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Mar 2022 15:45:31 -0400
Message-ID: <211577.1647459931@dooku>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > We also discussed encrypting data like logs, and storing keys in a
    > vault / trust zone /=C2=A0 TPM.

Wouldn't it make most sense to encrypt them *to* an asymmetric (public) key=
 that is
not on the BMC?   Or one can send them over encrypted syslog, or netconf to
another server for safe keeping.
Or are you thinking that you need to sign the logs?

If the key is stored locally, even in a TPM, and the point is to be able to
review logs locally, then the logs need to get decrypted, and that means th=
at
the key needs to be enabled/opened/activated locally, and which point,
if there was a compromised system, the bad guy wins.

I guess I wonder what the goals are here.

    > See also encrypted volume https://github.com/openbmc/estoraged
    > <https://github.com/openbmc/estoraged>

Same issue: where is the key stored?

=2D-=20
]               Never tell me the odds!                 | ipv6 mesh network=
s [=20
]   Michael Richardson, Sandelman Software Works        | network architect=
  [=20
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [=20
=09

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEow/1qDVgAbWL2zxYcAKuwszYgEMFAmIyPlsACgkQcAKuwszY
gENwtQwAkAB+tV5zgUtANQvsLgzbQb0uee4sagVjCWbvnldkcx+vMouFdvzNYESf
LYq9jXWWEW7xlyFqB3jwjUiP/efa8TJzfKzEZW4U6ltQdkTNPD4QTsFrrGqKzPer
Sb7u492MnwZoNwT3l2wGYx8xqR5rgWytYsdG8xl6oFgv8gdSY4ZTA2uAQyI+EP39
GXAS9g1ExbgnDUAyJQn6DmWmEG8HblCLKP33ErkiKzLezdP/jJnSSTZFcJDkw95Y
Xn3N6fW43wTJKc/WxPAHzESJGgrYunsqMjTdtgrrK7oOuZL/eUxk9le7/7reMBSV
5Hwcd+20eJ5FCxQaa1SnMdGJvWJnVfIHiBwMT0ShmzIpVv5zgpkZHioDYQlJn1I2
Bqgma3b4E0ypaEAaD5XkL1dVVufdTDU0qG/djNIzYqQZZOk9EQjykl85eZfn0syU
l8SVAborB+DAWbaTG/cJZCuj2Jb/9RfisMIroCbQqTWvMQfFlSJJHoqJ7M1EqYSq
CydvpyCG
=c8Kk
-----END PGP SIGNATURE-----
--=-=-=--
