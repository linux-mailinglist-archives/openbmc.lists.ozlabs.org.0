Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A13611AD
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 20:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLnMY6zsVz3bnF
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 04:06:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=OO1xmXD9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AAEu0r4f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OO1xmXD9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AAEu0r4f; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLnMG4VXTz304D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 04:05:44 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 024C25C00ED;
 Thu, 15 Apr 2021 14:05:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 15 Apr 2021 14:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SpBA78f035lwPqdwqFqnAuKN8Ac
 7uBDrVpp7De1WzpU=; b=OO1xmXD9cmkt29BVgvGun0/YUEH/Efkezg2+GQEaVSF
 bZ3IWuBEy0B9/fVM+K3LPKv4JxUWsUcLaKt42Owu3c4vPV1b3exS0/w/zcVfvMov
 QmmHBJw7iE91rqha+8uEXv+UuoZ3dZYxhgX+J9r/eiV8sTy4GngwlgYxGrNXmeTg
 DeRuJLDA9+Zr7g8aovsqyMr+nvBrWIjCAcc6qMIj944i19CwTP/chtDRY+APjnem
 r36xvx0k6e9YRGHYjx6SkF3rwXGBhYt/e8e4VJu6sXUd/h0eKS4E8E205DOE211d
 X8wKti6Gcud0VONsqQpXV5I6voy+Y5HMDZyP/pViwwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SpBA78
 f035lwPqdwqFqnAuKN8Ac7uBDrVpp7De1WzpU=; b=AAEu0r4fb9vutxIDIGKWVT
 e2w00x4QVa/JMsOzlsEJh3FPqsOmkogmkve7P0YfNv146oZcsNDBSaPh/Op4vZbj
 E02jhYb1ze29IwqptbJmp8trtznVyrqH5qRbZbSLeFgDY/nSrp4oEN5Qp2A4CbkW
 xGn0Le3oswYy4TJEywJh9uCvFM8tggq+7mTMAjEwdEXbkn9EiYnd8CJ5Ky9hX2iu
 FGBE5x9ScgC8tabWh1jZWAxXEwJmM1M7JBsvCH+veiyNMGsTXqz0X9XyE2lH8ZEk
 cqo05q9NuHbkFfe1p6q9JC6tOsV9VeGRNq8KWqrAIoJKJotLKwuYEKvwU5cG1bzQ
 ==
X-ME-Sender: <xms:coB4YLfX3VNsl3CpdIzjM7JLc-M-wgYeb1NwMVMEydgA2ZsQm-GAoA>
 <xme:coB4YK31i29eo3fOJVpACFQCXufBv2rkbRs0upKi2TjhiMg-MQr6AE2podDtRvH2G
 PUTCXf2p6rLNzVvbC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:coB4YEgAn3CrLylvydVHGBMGm3XDW05WeMVDfIgmpvF_IO2F8vRoMg>
 <xmx:coB4YATX0bRlfJmRVDLBW_vcoHhd9GErXREswYYV_4sy2TaV5WuW9w>
 <xmx:coB4YFioAB2pQdvCD773qw8lNvUJ4jdp2MhEnQ6X00RqHKZNpDxgRQ>
 <xmx:coB4YMiy2GhQ4oTItM1-GEaAlCwBKlfbKNLwOeUUDoPSMQK2cIJYNQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F170B240057;
 Thu, 15 Apr 2021 14:05:37 -0400 (EDT)
Date: Thu, 15 Apr 2021 13:05:36 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: Time for C++20.
Message-ID: <YHiAcM/iEICxoi4D@heinlein>
References: <YHdMjAsKKA+BKW8X@heinlein>
 <69ba3eb8-fab3-c0a3-2530-67ebe0de4526@linux.intel.com>
 <20210414231056.GA22459@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jluMTulcHv6UXAo2"
Content-Disposition: inline
In-Reply-To: <20210414231056.GA22459@mauery.jf.intel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jluMTulcHv6UXAo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 04:13:13PM -0700, Vernon Mauery wrote:
> On 14-Apr-2021 02:12 PM, Bills, Jason M wrote:
> >coroutines are also an interesting possibility for some of our async cal=
ls.
>=20
> The c++ coroutines are implemented differently than the boost::asio=20
> stuff that ipmid is currently using. It will require some rewriting. But=
=20
> I would prefer to move on to the standard than using an older=20
> implementation from boost.

Agreed.  I'm wanting to free up some time to work on enhancing sdbusplus
with co-routines support.

--=20
Patrick Williams

--jluMTulcHv6UXAo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmB4gG4ACgkQqwNHzC0A
wRlpNA//f2mmUzkSZ+qjvjg+VaUqMhOkqdgSZ5OqimEqlwcF8j8Ndr3yBxcfbbvj
cpTP89875u8RiKsylIMrCJklVD8Y7y0W0bNGa49XGVvp73XWT0u7n9uwulujFOoe
+FHiZY9BCf8Kufz+7jDtyIxZM3jT4iT4t5zdQqNjwPYuJ89EQfPPqqaJ2bTkGk2q
AWx16z7bwWFHnYc/x13asoeIYIOr61nYmcINoSJBjUdQBOD2pholcQzczcAZ9sln
W15wmD+Yo3xc2C1WxKiol3vKUGEsYGLVV+WQah0a7UJM3fOhkFGhFBocOS6A9ih7
hbBKQbtrxdmvNfHXuZbxuXFUaJIcIgQObN+cq8oXEYeiVULXQSCsu09FfmjhSrNX
hFAY+QPQ2kvDTXqkIOajBVvGvY/+kD4kTLMDnyRPkFVTyeGYCIt7eNrKhRovxpR3
6/WM5q2PsI5kZlNgqBKS5jKH65X6nZ2DoO0wJD/Wjh1ItK1SO7exjgZ3jOYa+DmR
6/QiswWf+WfWQBfvCWcAH+NMBNZ92R1DINpNa9+PkzezlU+zGb1QkQZn6t6WsvDB
UXWAYFWlVtSaUOJAMlkPQfToA2tANlu5VwuyFyzLiM0EXWDswZ7haKS6DLQeJyrW
2U0fzt/UCPspFyw0x8IyvoUpCTO08srXbFdL8OiXdeVrEbnv/ug=
=o/lH
-----END PGP SIGNATURE-----

--jluMTulcHv6UXAo2--
