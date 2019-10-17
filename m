Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC97DA76E
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:30:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v2R001MfzDrB9
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 19:30:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00::f03c:91ff:feae:de77;
 helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 576 seconds by postgrey-1.36 at bilbo;
 Thu, 17 Oct 2019 19:29:30 AEDT
Received: from relay.sandelman.ca (relay.cooperix.net
 [IPv6:2a01:7e00::f03c:91ff:feae:de77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v2QL22WbzDqL9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 19:29:27 +1100 (AEDT)
Received: from dooku.sandelman.ca (unknown
 [IPv6:2001:67c:64:42:5650:5f0a:e07a:7e5f])
 by relay.sandelman.ca (Postfix) with ESMTPS id E5A521F455
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 08:19:36 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id A841910B6; Thu, 17 Oct 2019 10:20:30 +0200 (CEST)
From: Michael Richardson <mcr@sandelman.ca>
To: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Re: Recommendations for development platforms for the ASPEED
 AST2500 & AST2600?
In-reply-to: <6ed83860-c187-4da8-9f2d-17deef391dae@www.fastmail.com>
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
 <CABoTLcSgz-_LJ3tZ70-WenCqWqv3Kknfsbe1qstKmoTiP2wqQA@mail.gmail.com>
 <6ed83860-c187-4da8-9f2d-17deef391dae@www.fastmail.com>
Comments: In-reply-to "Andrew Jeffery" <andrew@aj.id.au>
 message dated "Thu, 17 Oct 2019 09:50:02 +1030."
X-Mailer: MH-E 8.6; nmh 1.6; GNU Emacs 24.5.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 17 Oct 2019 10:20:30 +0200
Message-ID: <20720.1571300430@dooku.sandelman.ca>
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


I looked around the Internet for new and used Tyan S7106 systems.
Not a lot of choices: building a system with a board (new or used) looks like
a $3K expenditure, about the same cost as the portwell system, which is out of
stock for 16-18 weeks.
So it's QEMU emulation for awhile for me :-)

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl2oJE4ACgkQlUzhVv38
QpClMAf+L8Bm2go183IwGrYWoDMUegG6WR2c18jsh1NIUeEEOHggQ3d1Oqob/FMl
/T9f6YusvdNvue/8ddvTxtU2im5K+01mwTP3VR8EE87c76z5NVBf8Rci1w9TVlvS
temB2McGgT80aml+MK/yPQe4j8pXfImSpJ+aaIdzgb6oDhiFgpfrQ53upP5B1QcO
NVPveQ1NhF2MZMm9xOL22SpYMpJGM7fA7tB+Iolu82lzpT+6Ruat4/bnBB8KSHik
UJk4KtzRYCEw/fTn0Mt8ZkWftjklLo2S2pwwVDPxDALcauCJlkgvI3HzRF5RUZ8S
HhRUeIPbFwoJviB80k/4u0mCLXaMJA==
=R3AG
-----END PGP SIGNATURE-----
--=-=-=--
