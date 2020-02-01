Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A960014FADE
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 23:53:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4898Ws2YBFzDqbr
	for <lists+openbmc@lfdr.de>; Sun,  2 Feb 2020 09:53:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00::f03c:91ff:feae:de77;
 helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 454 seconds by postgrey-1.36 at bilbo;
 Sun, 02 Feb 2020 09:52:51 AEDT
Received: from relay.sandelman.ca (relay.cooperix.net
 [IPv6:2a01:7e00::f03c:91ff:feae:de77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4898W70F7vzDqfF
 for <openbmc@lists.ozlabs.org>; Sun,  2 Feb 2020 09:52:48 +1100 (AEDT)
Received: from dooku.sandelman.ca (dc3829c8a.static.telenet.be
 [195.130.156.138])
 by relay.sandelman.ca (Postfix) with ESMTPS id 4A1BD1F45D;
 Sat,  1 Feb 2020 22:45:00 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id BCC511A38D2; Sat,  1 Feb 2020 23:44:59 +0100 (CET)
From: Michael Richardson <mcr@sandelman.ca>
to: Samuel Herts <sdherts@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Starting Point
In-reply-to: <7601.1580558972@dooku>
Comments: In-reply-to Samuel Herts <sdherts@gmail.com>
 message dated "Fri, 31 Jan 2020 12:15:19 -0500."
X-Mailer: MH-E 8.6; nmh 1.7.1-RC3; GNU Emacs 25.2.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 01 Feb 2020 23:44:59 +0100
Message-ID: <24610.1580597099@dooku>
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
Content-Transfer-Encoding: quoted-printable


Samuel Herts <sdherts@gmail.com> wrote:
    > We got the Hello World to work perfectly, thank you for the assistanc=
e!
    > How would we now go about doing the exact same thing, but hardware
    > implemented?  By that, I mean actually running the phosphor state
    > manager modified module on the physical BMC chip? How do we install t=
he
    > OpenBMC sdk? Also, is there a method to read from the computer's BIOS
    > chip from this modified state manager?

I'm aware of only one hardware platform that explicitely supports openbmc,
and it was rather expensive.  Apparently it can run on quite a few other
boards, and I'd like to try to get a list of things I might be able to get =
on
ebay... I don't need something new to experiment with... old and well
documented seems better to me.

I don't think you'd ever install the *SDK* on the target system.
You compile it with the build system on an ubuntu server or equivalent
container, and then install the resulting image as the BMC image.=20
That might require a JTAG load for some systems, and then OTA afterwards.

=2D-=20
]               Never tell me the odds!                 | ipv6 mesh network=
s [=20
]   Michael Richardson, Sandelman Software Works        | network architect=
  [=20
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [=20


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl41/2sACgkQlUzhVv38
QpDRwwf/b/tLSzn5j42DcVNZiP5CDYVG+/t6X1HpTDpb8IScrirxToGO0eGNEsx5
H88yanGUh9BfTNP56cIEMnsFZiMYovAPY8oFhcyIJ6tyI0FKXU+ZtPIjenuVG7ls
4Q1OeazoedFGT42wq4tA9JZa7pTgAmZp0RIePrM0YGuX2k+MGq511L6tzQivwTP9
YGTCFYpIs6IUDNPtPnVjMK5e7tS7Uej/vNQhsEKWTkR0EjWJ1kCoPozFD/fnm2fo
C1BAdEzk8VP+xqvVm70rnkT+RH2gKx+DXVeRVN7flfzfYOeBDmztNwz+Uq87RMv2
qmNPQhIOsoVvef6jEzsYepati/0THQ==
=0HQg
-----END PGP SIGNATURE-----
--=-=-=--
