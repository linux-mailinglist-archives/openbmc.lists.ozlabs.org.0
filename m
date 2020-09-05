Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D525E939
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 19:05:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkLXK6Pn2zDqjg
	for <lists+openbmc@lfdr.de>; Sun,  6 Sep 2020 03:05:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=IAGOR+qn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=uf//BxZB; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkLVk3mkFzDqjY
 for <openbmc@lists.ozlabs.org>; Sun,  6 Sep 2020 03:04:13 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 67F5E9C2
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 13:04:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 05 Sep 2020 13:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=M4wlUCFqdwY5IBzlmCOzx4P4UJMBwSRWIHrqpz95RvM=; b=IAGOR+qn
 KB9OxH45mQZARn0BNSrrriMgoMUz2ljr0RecH10T2eB8cjpH5FcqOB62bXC1S4dS
 JN4X52f4/Y603QNAsC3BMrg4oqCN2DaJqBdlbIciicubH+q11uSFWrn+MQJ2VlDA
 dFlFT9+jBW6xJ+tExRpMoezmNYXVridR588bPxROJDNGnvdbsHRYcSP55rYMCTDh
 jdZpTJvqX8d2qlorIR/9DsPs08rcqfXShsBPDisch3FYYRtbKnW37wUNvSErRgbA
 wwW4uKw648sZp9OssAve9aEMjPfdhPzA9mFnvH8G5mMilLfOqEEy0hnPQPe0fdPJ
 xGRL0Z6V9ZDEjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=M4wlUCFqdwY5IBzlmCOzx4P4UJMBw
 SRWIHrqpz95RvM=; b=uf//BxZBHciMLFsAHvVLdncvXEo/WWDBr2h0c2YPP0sPu
 ArZ41Sy6BymRM5E8cnn3zOurfg/Cgx1vCaDr/aTV3GLkSDiINU4OZKBzzkkCPdms
 38IDzvrZnkHFNbzRIfIFmp9t6DBf4xeakVSo8mWjhmTZ7rvo3xi0gMW0ASLFmKly
 i3EhYONy8d1yMXGyz4S8v+mEyon7JH3c1Ydiah0ovupXp6AcpjNzafx9Q0u1qj+I
 mPiiet3OLK85huP8I5+HNMFnu4gbx311e0TOa8oOcoj9/NuIBEfqLZzbeJEYChsa
 2voTkRORf6BkRpQrbvbwLPZmREeViCPnzxQGmlzZg==
X-ME-Sender: <xms:CMVTXwon9VP2dvP56uOVNOKGF7xhJ0VIC4-6SBtH4sqzoRu9ivTg5A>
 <xme:CMVTX2q3ovFmFGUQiO6b3OgoaUQO15pA83uHDzQg4bjYFbfkXOQjOcl78AIIRpECi
 AY0ZgRalgvu8VnUtRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeghedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduuedvfedtvdevjeduueelleekiedu
 veejffffffdvffdvjeekueejveetieeffeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:CMVTX1OsKQz2ahypgGpBSefOl6uIEkz8WoDhivFVDviQEyHqW__QIQ>
 <xmx:CMVTX35d-LmBRfIl_Z-qRivnfEU4hGFcxq6G3y3z7Ge0-E9tMQCJDg>
 <xmx:CMVTX_7GKgNORqt_lkiUWzOVE7eeuQTkALP9f0TzoVO-vQDw_9vJXQ>
 <xmx:CcVTXxGpm3wxcLZt0sxUlK77Qsd4BJqeiC2f54Bc7mWeb6XF3Zv-mg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 629933280059
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 13:04:08 -0400 (EDT)
Date: Sat, 5 Sep 2020 12:04:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: phosphor-dbus-interfaces transitioning to meson
Message-ID: <20200905170407.GA6152@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
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


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I just merged a patchset into phosphor-dbus-interfaces which starts a
transition from autotools to meson.  Right now you can build PDI with
either autotools or meson and it should be equivalent.  With meson, you
should also be able to use PDI as a subproject.  I will begin transitioning
the bitbake recipes to use the meson as well and then after that I will
clean up the autotools support.

There is one change for contributors to PDI because meson does not have
the same capabilities for generating code that our previous autotools
structure allowed.  When an sdbus++ YAML file is added or removed, there
is now an additional step to get that YAML file included into the meson
build process.  Within the `gen` subdirectory is a script
`regenerate-meson` which will identify all the YAML files present and
update the `meson.build` files to include (or remove) the YAML file.

This new process is documented at:
    https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/README.=
md#building

For the next few weeks, I will try to pay closer attention to any new
YAML file in the repository and confirm that the meson.build files have
been updated appropriately.  Please reach out to me if you encounter any
issues.

--=20
Patrick Williams

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9TxQUACgkQqwNHzC0A
wRnSYA/+JSixoR6RuJCS0wbyxCJ1RyAoGWt2HgCHDSKN6rw5FcCOdJJw8Yvce8z+
QqUFshGYGx1xYbjR6gpC22WPSqAa5AY1Cgg359tZjLvYLgNfTjllWMkWp1auQx0t
aT9ObXvhvut3BVFu64zpvD4SuBGnmrNxmQcbDTMf0AVeKjeYLnvQDscyHx23ef04
ZX4fC8pSd7gQZnHiBquxuR76n5b/38v0scF6d6dP4rBGzpCsXLt9Pd6/41scxI2J
ADlZIK7km0OvczZe8yR0Q6FVR9K9hYMrhnTHa4ZdIVsbWz7UV9L07xUl/Mt0H26Z
PD/wa1TGLVR+5HBkz1PHrkmDZCxpSemYUgKs/V+um2LlINDtCJQH/SpECuG46ND9
zAMZKYb/u3cTeO9PV3DgIAMPV+y2LOx/zwWPgdQViYsexDzYVETlczWTHJs3nysa
JZx+Zu2lZgLq6eaWPotPgekHVBTowo/gWuTHRVKPs98anRyPxB9bzoSdFMafA+c8
nV+znwb4R2gjrdPIWgMpAgvMH7oHpDO1F6CDS/bJjWbXNzqBbEEfL7q8xGC/N2R1
m94Uvo2zGV38rPBWpVQ85Hox4P29xIQGaRDoA5lkwKmeHA+k0cyFUbRwzl9RTIlq
NprIN3XciVHDuvNkhvhXBVJ26lATO/QFI2NhyK1b5qlDY5RYU9k=
=0a5Y
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
