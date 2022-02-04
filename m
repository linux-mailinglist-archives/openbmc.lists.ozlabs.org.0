Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C8A4A9D34
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 17:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jr1qP3qwxz3bbk
	for <lists+openbmc@lfdr.de>; Sat,  5 Feb 2022 03:54:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00:e000:2bb::1;
 helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from relay.sandelman.ca (relay.cooperix.net
 [IPv6:2a01:7e00:e000:2bb::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jr1q34F0kz30Md
 for <openbmc@lists.ozlabs.org>; Sat,  5 Feb 2022 03:54:37 +1100 (AEDT)
Received: from dooku.sandelman.ca (unknown [142.169.78.77])
 by relay.sandelman.ca (Postfix) with ESMTPS id 0ADF21F44B;
 Fri,  4 Feb 2022 16:54:32 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id E99731A03ED; Fri,  4 Feb 2022 11:54:31 -0500 (EST)
From: Michael Richardson <mcr+ietf@sandelman.ca>
To: "Andrew Jeffery" <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday February 2
In-reply-to: <819fc231-cb0e-41d1-ad46-d7957a4c48e4@beta.fastmail.com>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
 <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
 <231809.1643915597@dooku>
 <819fc231-cb0e-41d1-ad46-d7957a4c48e4@beta.fastmail.com>
Comments: In-reply-to "Andrew Jeffery" <andrew@aj.id.au>
 message dated "Fri, 04 Feb 2022 17:51:01 +1030."
X-Mailer: MH-E 8.6+git; nmh 1.7.1; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 04 Feb 2022 11:54:31 -0500
Message-ID: <281326.1643993671@dooku>
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


Andrew Jeffery <andrew@aj.id.au> wrote:
    > On Fri, 4 Feb 2022, at 05:43, Michael Richardson wrote:
    >> Thanks for the great notes!
    >>

    > You might also be interested in chapters 9 and 10 of https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.00/SDK_User_Guide_v08.00.pdf :)

So, not completely under NDA then.
Thank you for pointing at that.
I wish I could edit the missing articles into that document.

I saw that the section after socsec is about boot from uart, which requires a
jumper to be moved.

I see a place for an RSA private key as well as the public ones to validate
the boot image.  Multiple OTP headers, up to 64k bits (8K bytes I guess) is
available.

Is anyone out there using this *today* for signing evidence for a measured
boot?  Or for including an IDevID into the system?   You can unicast me if
you prefer.

Getting manufacturer signed IDevIDs in is critical to getting better
onboarding story for BMCs.  I would love to work with someone to prototype this.

(Ah, xmodem/ymodem brings back many memories.  How much zmodem kicked their
ass.  And telebit trailblazers..)

I wonder if the OpenBMC project cares about the case of the name... as ASPEED
has "OpenBmc" everywhere.  Some people care... It's a bit like Brown M&Ms :-)
(e.g., RFC4301 says it is "IPsec" and not "IPSec")


--
Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
 -= IPv6 IoT consulting =-




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEow/1qDVgAbWL2zxYcAKuwszYgEMFAmH9WkcACgkQcAKuwszY
gENToAwAv7VnM7NTHduAtddpFm1sdJEDgS0pOxCVBvan7or0IRg0VhGsI3L+5z/k
pDq5TFDuU2Wmyq1AnfBhgZBgbYiYOLr7TAoA3BC420Jr7I3Htq2HuB6xYXwcQBqu
ukgEbRb6Y6yEGh0zhWfrkJIw/VPlpFqmlpiOFhpX/iB2GuWJBLsEPypinAuTJNLC
SBvhOKam8853GheK2ciLOiYJ1TdsZGHAN24vnQqT+NxOosgyfdoU377jJ+RvJ5cA
3FXdInprnr34AuVxRu5oJjnBlDffABhQh/3gpZ2cgfa+XkTcs9Fj1A9hz2F9S7aL
cVSwTInvj5m62TGsVaxkZEXP2nWD7gxgwp7+7tRGnq8xZi4qcLyFhbS2jyFrEP0D
Rzt9lbl7pUpAneynHjjGmKYd0pHhQbVx7HFFlxNnRAwKaGOhj5XkX2ePd/fPLhrr
i4fu59fFY3yzog5fkiuoEuM0NnjAtS0/wz4+Mrd8TiAzcaYoJzMG55ba01c8GnXl
DOFJ6Nbr
=+Fm5
-----END PGP SIGNATURE-----
--=-=-=--
