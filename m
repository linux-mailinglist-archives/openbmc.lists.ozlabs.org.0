Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F791D31E4
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:55:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCjP01VlzDqqK
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:55:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=tGvGhdb2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=zf3lksqX; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NCh01ZtMzDqjM
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:54:08 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C38087E7;
 Thu, 14 May 2020 09:54:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 14 May 2020 09:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0SBWHzEsoopwM3WTj31CrEcqTnN
 TI+iPmNEZgSil7ow=; b=tGvGhdb2TUF4i+glf8IcCPsi93urTQw8e63yPXjgQAj
 PytTklkaueXbWF9pYUxZs+I+09DZKFqLkmUOjPl+cQvcflDfpI7w2kcESQS8taJ8
 lz6PGCuW/RrKLnmtUWh4/gdpBudWJCI7vtgWiFyhzeFn5NmPxoQQo6Rl7Ozsuzq0
 7Dl0zrFY/RYcZtlnegFqf3UDuh1dvB/pp35ecPa+BwGAWwKe2a4nYP1C+CqWedb+
 Vizvuvz+nx4V2EtEiP33s3obN5mIhktuzvnQa1QTQjcl1eiYrfjQLM+Mq3YDXOXW
 W7nDIH7ua153lHou5IAU5Wy831EUIMiiz7cQchbQxPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0SBWHz
 EsoopwM3WTj31CrEcqTnNTI+iPmNEZgSil7ow=; b=zf3lksqXG/LStvaIfi2MMg
 loSSPnmc/nstA75t1dnqTzC00oNdPAOtQUglcCEN0bctBRpX+8tgoq/lTB6BbjTL
 ou4MKUi0cy/yvMahj4JqIfdV38k0ZZch6HzZCAzsiEtT1HGaZz4ETCUyt17LPLLg
 1rsInzDO+8Y5ha3BoMHLAh6v5ywITelcp2YAOrP3bRZN8d8qTvDOxAqcuMxl6pPR
 6YgSVWrBCigU8rWi5QAPergX4lFYcuy1tw1NZUV+NAiyC6YzD6CZefGvK9glA+/3
 HYHyjjPohn56w6B02goJtnd5WZTcqS3G8LEL5VLkdtoz5LMEUrRKNTUHzJpI261w
 ==
X-ME-Sender: <xms:e029XlgGiVZupgI0oRfZJFPf_qXkbjZHzQKJQ-epqX5p8THLjOLt-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejiedruddvtddrud
 ehvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:e029XqDfIGUpVa4vVDJkzlYgdjoHyPHdfTLNRquS3xBEOXdduXw0qA>
 <xmx:e029XlFPyXamvgJzeA1kvfDhLAgaOIOnJ4BU5osVYo0raSYUzaxACg>
 <xmx:e029XqT3iBLP6e4l7xiD2zRoMruZO5tCD2LOz21eKDUl_A38WV5s5g>
 <xmx:e029XntmBZYEiVZ4SifVOY0umUHU0NgxSG7wBP2WgxkzSmeAa7X06w>
Received: from localhost (mobile-166-176-120-152.mycingular.net
 [166.176.120.152])
 by mail.messagingengine.com (Postfix) with ESMTPA id F112E3060EE4;
 Thu, 14 May 2020 09:54:02 -0400 (EDT)
Date: Thu, 14 May 2020 08:54:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH linux dev-5.4 4/4] ARM: configs: aspeed-g5: Set
 CONFIG_FORTIFY_SOURCE=n to appease kprobes
Message-ID: <20200514135401.GD1166713@heinlein>
References: <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline
In-Reply-To: <20200514132703.448317-5-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 10:57:03PM +0930, Andrew Jeffery wrote:
> Setting CONFIG_FORTIFY_SOURCE=3Dy and CONFIG_KPROBES=3Dy on arm gives a p=
anic when
> trying to insert a new probe:
>=20
> $ echo r:myretprobe do_sys_open '$retval' >> /sys/kernel/debug/tracing/kp=
robe_events
> [   51.688589] detected buffer overflow in memcpy
> [   51.689430] ------------[ cut here ]------------
> [   51.689627] kernel BUG at lib/string.c:1096!
> [   51.689800] Internal error: Oops - BUG: 0 [#1] SMP ARM
> [   51.690107] Modules linked in:
> [   51.690442] CPU: 0 PID: 107 Comm: sh Not tainted 5.4.39-00272-ga1ee7c9=
73659 #6
> [   51.690674] Hardware name: Generic DT based system
> [   51.691184] PC is at fortify_panic+0x18/0x20
> [   51.691371] LR is at __irq_work_queue_local+0x40/0x7c
> [   51.691575] pc : [<8083eaa4>]    lr : [<8020e0ec>]    psr: 60000013
> [   51.691812] sp : bd237cb0  ip : bd237bc0  fp : bd237cbc
> [   51.692129] r10: 00000007  r9 : 00000000  r8 : 00000060
> [   51.692395] r7 : 8011f2f0  r6 : b5092480  r5 : 7f000000  r4 : b4c53b4c
> [   51.692723] r3 : 80c04c48  r2 : 00000000  r1 : bd7c5448  r0 : 00000022
> [   51.693088] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segme=
nt none
> [   51.693449] Control: 10c5387d  Table: b50f406a  DAC: 00000051
> [   51.693769] Process sh (pid: 107, stack limit =3D 0x4e9b7225)
> [   51.694126] Stack: (0xbd237cb0 to 0xbd238000)
>=20
> YOLO it and disable fortified source.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Doesn't this mean we're just hiding a bug with KPROBE code and
potentially hiding more bugs with other drivers?

--=20
Patrick Williams

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl69TXkACgkQqwNHzC0A
wRnQWg/+I5+mAL9GthOCw1se5cpAqd7rANOcfWk8PCpHrkchSR/0cd5dWmxwBIsx
L1u+gTGUY8qKj3qB79JeeDU4KlIfSacDN5UJQJzK0f6COIVo/yNUvBiPX7lYKc/N
4GG6aYHw4tXnh7C5RKaGCWI6OyW4GsYsDYcZ+2XhuwUjbypcMxpq3K28eY8kFL4P
fRyjbQV5zs1qdhMZdHqc9DQ6+afSRiqWcnKUHCGmmFbliyySRfIbFM2dOMJu+l16
3jmujsqg5VZue18N/KfZWMNl9b40jogBbZZTABYzs2GtVBoRXlBkhezx1m17pECQ
6prUJniXzKAYj1MhhFlR4pXXSupIG2wy6LzBfo07qnBR4mCV3X2H4DrnhhFLvMku
MKti6QczUHLOx/K+XMVY/hECQbcF5rpXp4ySkcJ04EwiBNfiddaKjegAp3R/hw3J
V+yWDIQX4xx33UCOaYgDT4mFZ0jX6d8H5TppigttCeAfod8F0qk2IEOGUTD+l2ae
otTULHe3VMuEkEQY7uT4VfeIoW6N88OCk2sk6TMIMTwDeUiWLOiuwaB6ufrq2Zhw
KjBj3eFyYxI1VD8/2ATKuCV+98NwuUUHQ/kN8WAwXjKPyKLQ+yLt8KegZ2j1YcT8
HFkVBoPZbnnJ99f09OLEBWekOSxyijj8UGMUORJ3EsfAVSUTioo=
=V46H
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
