Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836FDBDCA
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 08:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vc1t0qQ4zDrQK
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 17:43:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vc195CBDzDrNc
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 17:43:06 +1100 (AEDT)
Received: from dooku.sandelman.ca (unknown [89.248.140.8])
 by relay.sandelman.ca (Postfix) with ESMTPS id 24DEB1F455;
 Fri, 18 Oct 2019 06:43:01 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id 5FCA810B6; Fri, 18 Oct 2019 08:43:55 +0200 (CEST)
From: Michael Richardson <mcr@sandelman.ca>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: x86-power-control
In-reply-to: <E127E69E-4BA1-49B8-9F6D-CA6A9D90C0FA@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
 <E127E69E-4BA1-49B8-9F6D-CA6A9D90C0FA@fb.com>
Comments: In-reply-to Vijay Khemka <vijaykhemka@fb.com>
 message dated "Thu, 17 Oct 2019 22:08:59 -0000."
X-Mailer: MH-E 8.6; nmh 1.6; GNU Emacs 24.5.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 18 Oct 2019 08:43:55 +0200
Message-ID: <11750.1571381035@dooku.sandelman.ca>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Vijay Khemka <vijaykhemka@fb.com> wrote:
    mcr>     Why in a target system wouldn't naming it in DTS be the most
    mcr> reliable and most easily accessible mechanism?  I can see that in
    mcr> development being able to define things helps, but it is not like =
the
    mcr> production systems would have wire-wrap where the GPIO pin might
    mcr> change.

    > I am not ruling out DTS definition but keeping that as optional. Many
    > platform doesn't want to change kernel and want to keep dts minimal as
    > well common across multiple platform. So providing this option will
    > help developer.

My experience is that the DTS file is loaded separately from the kernel.
I haven't had a chance to learn how things are booted in practice, since I
haven't gotten real hardware yet.

I would think that the DTS file may be the easiest thing for a VAR to update
compared to editing a configuration file that is embedded in the file system
image.=20

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

iQEzBAEBCAAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl2pXyoACgkQlUzhVv38
QpBTQAf/em09qjh9UVvGwb8C7IB5WSuLVE4GU1krv/PZmLugrTDmL9eKCpE+uD1s
jnL78gVaZvXEh0u1Si9z31Awi5WmSyNsKPxHH3A8XFqQjo081M3DuHaQBrBRDAWD
ADzgz1ji+SsONutNIl9S7u7klm/wy2ddq7k6RNglmg7A7nRGALPw2D7yPCKVouuI
fBsKGTBmdj6OgQQJaSVukHgtwuv6sq3kXxyE++ZN6NK0QzH7J//3YHOUp16euC5X
XsOkgCa6eGaRGvNoO1/ClKd0euHuK9WPRWswvCzgPlmSzwkxE7YNBd7pIR43r1gQ
SN1Drxgm3MQYJZJGrLpUJPf/ApSVsQ==
=FRT5
-----END PGP SIGNATURE-----
--=-=-=--
