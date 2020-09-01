Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B08259987
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:41:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgt9j0RkDzDqGC
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:40:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=bO8tosyr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=hyjc1uvD; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgstB3sX6zDqQL
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:27:30 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 848585C005A;
 Tue,  1 Sep 2020 12:27:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 12:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=GMRXj3DZPtrXV6ueRbXZrG79tKN
 EZ/y97cQcuZbUGv4=; b=bO8tosyracLTvVlid3EUCXImOBxEQKkWTag2Xal3vdn
 3binzONMgN67QleMX/L7tSdp9wVLWCcXUi9u6oUjEzKvSK5IA64+UbbnNsWr7AtK
 j4GYjgHFbPVB8dbxMKca/34FnFEl+sk5LyfOrZQfZO2ru7wJ2fWv9dfu+RXHpIc1
 SPKBnibL3YKoOORD2CwwFjA30gqndXIjZg6xzymQiVbnAvVFH3mrmyKHCMWb/rmV
 H5HWQNZKOWP5X9yQIiPBIFCuXlRRvwHNXcctGQpAYVJsPM+dfDcvvAmoyGNHsKwl
 70LcC7zggrvhG7i/gZ1Fw2Qlb0fJokP5rXFRTiWAGqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GMRXj3
 DZPtrXV6ueRbXZrG79tKNEZ/y97cQcuZbUGv4=; b=hyjc1uvDpKDeM7T6ZuZux/
 /OI45FUm14H4DIZKn9HMT+3QAvD56Sguklp0YeslFUU43TVnSsFhuEcvVBG3+rew
 HmAFkiuAsfao85vCAAMBoUOVXnQ9TeRMy2Hpe7efaWxeQOw17n2dnABwFR3qJXYX
 jMybJ/zHYyBszs02d/W4QJtbapLLp9k7lMHaLJD0+f72IgHJqai945VhLmx0sWGy
 tdrVR0nRtAIit2WM3XvEwXnwRjp/qnboazD3c1EKZPaeNsbR0wRvKCKm+gDCmhW8
 NaMJdZZRYxOp0Yax6UvJkAHXqMYcYyVVpfWX442UGhqB7ijYer6cTGgtRCwMyfiA
 ==
X-ME-Sender: <xms:bnZOX-s85MftSkNfYsXsd5h26T3TSlCaVn-dQvNv8saxXwmDaQ6ycQ>
 <xme:bnZOXzcug2WVCJec_3Kjjcr3w1qYT7ZrWXgAUbCmGYZSTfjRfBEIhxvyFdlOQSWxe
 nfo-_tgt8_4Cx-ptjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudef
 heelfeehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppedutdejrdelvddrheejrdefheenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:bnZOX5xvdFhsC3-wMq7eMg2JZpgkWCO8eQpLlToye77d0znjaAIJwg>
 <xmx:bnZOX5MZjbbRPIjXYoLGxJFR-2Yq_HYYO0oHXtx2l7DsjXh6musNzQ>
 <xmx:bnZOX--51cgdlZzoDDMQSKk8CZHqcdWBNsX-Bc03qLNR09pTydncVQ>
 <xmx:b3ZOX1YUFR5eIphqEImlYAs9oB3WbsUtEiq-NsAsB1ZwLioyzVA5LQ>
Received: from localhost (mobile-107-92-57-35.mycingular.net [107.92.57.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71D1F30600A3;
 Tue,  1 Sep 2020 12:27:26 -0400 (EDT)
Date: Tue, 1 Sep 2020 11:27:25 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: Re: IPMI implementation of Get Device ID command
Message-ID: <20200901162725.GU3532@heinlein>
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
 <20200814231020.GA16853@mauery.jf.intel.com>
 <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
 <20200824212702.GD3532@heinlein>
 <a5114308-309d-3c66-adb3-3da4e35b1b7b@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kSOhxpxUsM1s2qz/"
Content-Disposition: inline
In-Reply-To: <a5114308-309d-3c66-adb3-3da4e35b1b7b@linux.vnet.ibm.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 benjaminfair@google.com, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kSOhxpxUsM1s2qz/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 06:23:36PM +0530, TOM JOSEPH wrote:
> For translating IBM firmware revision to IPMI firmware version, the plan=
=20
> is to continue using VERSION_ID in os-release. This translation is=20
> obsolete=20
> (https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor=
/ipmi/phosphor-ipmi-config.bbappend),=20
> but I will update this to handle the major and minor firmware revision.=
=20
> I will work on pushing a patch for that.

Sounds good, thanks.  I just wanted to make sure there was an example to
point people to that did what was being suggested.  Looks like this
=2Ebbappend is it.

--=20
Patrick Williams

--kSOhxpxUsM1s2qz/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9Odm0ACgkQqwNHzC0A
wRnzCQ/3aJp8Zo58pLAf+xc9kpFUxCUnbk1Pfumpz1V/p4gN8V18tuSINcBwo2Iz
/DHZbHKHo9kvknyzi4pqkkkOEGzW618Kjx/are5X+MankSW0Qb+nDh93R0wEl2S6
IxfZ4958VcEqg0QWaoQgEj4vam3QObIWeS8x9+rKeYe+2HfLgRFE1rd51lnFgalk
BA1Pwm+pxyqeaR51TczzZMdFeyg2DtX5XdNhbrFBlbmaj0HFvB6/MBGrowUUUyrW
c81D1kOyV5zwy2lDmvUCwPPaJVYPRsVOyPJVkNQLEKt6ObPqsCuahh2Vr9U424Xa
e3kp4rdijb12E/9klOJLIOGE6i4pL6jKO1cbvuCT4CzcgusGPG1oDM4Q3D66t8eX
nsAm/RF7JlFkGKUCgS3FqiO0DoykC/AqB85TujBMK5i0Ea41d4cdSsFSB9junHN/
mZsF3ucMoSuf12j8CM9DS9iflMjCmVZjJQeVr3AnP+0YxBgCxVDCVtpHSjUkdw+g
ntkYht5spxpnlSC0w4TUYuGo2fajbwwQep3tkMM0u7+Zx102PZnVr0YVJ0FClFhn
7cJzLLA1+l5QX3igDIpiqYRWuaJcLZ34G+3oAIgMi96FT69+Uj3dfvbTXO5aWcXc
gY+eObogUU4nKMPYk6ONdtfx29ILNLrK6CBhUmBAQ2yGR56icQ==
=2Lok
-----END PGP SIGNATURE-----

--kSOhxpxUsM1s2qz/--
