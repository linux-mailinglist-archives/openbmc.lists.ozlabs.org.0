Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C851FB634
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 17:33:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mXK76VkbzDqlR
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 01:33:15 +1000 (AEST)
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
 header.s=fm2 header.b=ZJKnDd4e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Sjjz4PJN; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mXHn53NXzDqpg
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 01:32:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1A49E252;
 Tue, 16 Jun 2020 11:32:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 16 Jun 2020 11:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xVzUzx2nwm/JTMBELoTC9TmtUhs
 FP7aLrrIIG2DhpG4=; b=ZJKnDd4esRIH5rb+I2Mn9Gk8trhJ7rFWtGEjpsO8WyJ
 R1mWURCTZBB+FjyQFGiG9MCZj73gT+lWr17zXyPWrrx60/DYD5kLJJWUOBk6EkI3
 PbrpyXNHi2P19gKUIH4YrJQ0HRIekF3EsWi5DVGSNktEGGm85pXu0LaeTJpX8Wl0
 AARrYUq5E0jQpFzVoUPjpiWXrDv0yUbQfQ16J2nY7NAKhdK6RZls4S0n2TEAKE8p
 oCHBvWMjjj2fHVBC18/Jww14W8BStuVSJHdCKGwkpSAMwIskR/sUIgh0WsKXa1v/
 qq/N0ccVGSgSPidRFPmjwTlxqVrUUW51IkEqgLs7Fmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xVzUzx
 2nwm/JTMBELoTC9TmtUhsFP7aLrrIIG2DhpG4=; b=Sjjz4PJNSNGpveGQmGG4ZP
 1Y4wB7PWStHE+9v/XqWZ4HSdOQK8dJl66e9YVdRlvGiD0iwgW9kOMAa8fMiiGQZW
 bn0ARqbDyiGJtuMd0QCtjv8+QToxE5QpUn17SikL05L3phk3Xz8U9UsjNbz0AGwL
 mER/j7Y4ZEoQvgEe0H4tUEWaS3eoq8U7z3YKKU3/8IQdq6XFu3fqvVjJdCW0C9re
 R6zVzRi5jBiLvWbhc/+9n8KvcUC5yVqlTrK/T2eX1YgC6Nx0jhvRlYhO1wHEkAHB
 7EcWrgwjWrkdnvhOVEB+BmX2qVb479xOkPFeogT9x4FMEVGkFeZDZvr5oDSN4kLw
 ==
X-ME-Sender: <xms:8uXoXrc1dy_Ash6RWT57c2DI-PQXKNh806x9VTeGU0INcBVnT0p6Tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepuddtjedrledvrdeiuddrudeiudenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8uXoXhNlrs6D_EkUkcnBcDdHCvC_6Fa7PzmZLpTOXessBx6s7cg9UA>
 <xmx:8uXoXkhz9E1tUPuQ1ouHlflCAouWgPaThDjPKDQuzlQaERff4_tfjA>
 <xmx:8uXoXs8x68vadWTKNe-XvFaw_KcFx425NizePpr70aWfG8U6tAYqbA>
 <xmx:8uXoXk4Hxc2Bzw8qS5U-856Yai2quZ1YdKVb95NYBRTeo-AwpN-7Wg>
Received: from localhost (mobile-107-92-61-161.mycingular.net [107.92.61.161])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5443F3280064;
 Tue, 16 Jun 2020 11:32:02 -0400 (EDT)
Date: Tue, 16 Jun 2020 10:32:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: vasant patil <vasantpatil2@gmail.com>
Subject: Re: Redfish Support
Message-ID: <20200616153201.GB4618@heinlein>
References: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
In-Reply-To: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 04:25:23PM -0400, vasant patil wrote:

Hello Vasant,

> Is below two functions supported via redfish
>=20
>    1. System Boot order change
>    2. Changing SBIOS(UEFI) control & configuration parameters .

I just merged this design document from Suryakanth, which seems related
to this question.

https://github.com/openbmc/docs/blob/master/designs/remoteBIOSConfiguration=
=2Emd

I believe the implemention on BMCWeb is already in progress.

--=20
Patrick Williams

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7o5fEACgkQqwNHzC0A
wRk8Sw//dDLUhqWM/gJ1LSaZTqWHCCvlwbf1LuAvJ1uG0K8BGi8HXmHTiKLK4uZg
nrJcM92jufHRPoWpr63T8hhVMh9wPzRkDyyHVHcdNi/2h3W8Xyr2YPJ+aNpOA5mS
+mzbw7HVGax72230ltD/6Bx62Xmo7/bsWe4FixtwJZ00QG2hE0VeS1PtQIDf9XwP
B6IhN5g/8GjNMM5jqHfH3B7j+cXpjIDYahFfbDEjrua818wOD7b5hq2UeyZ7ovoW
Fg5G6I58DQ4MbY1669mJjDu7OPVoxP01H+KjZLk2sMN1C8WGLIkMdkpi6uahqg5b
Fk9ZxwNiPVE+7BLc8JDNubx/WtAoDyPoR0hduSOOVjonCSzfJ5iLqwqzp565h5Gq
o2ucAnZSu82IApYsC4PKltIaGjbe2M6EFVN8kf35vT/zVTua4tslEkHZKR+gSaVb
agN7zNkgJhP1Bf7HrW88NJC2QyaitBBKQRlqsimqSFJZAjpes23UMnp26vPXa2IL
gGt8oQIewT4ckp8oaBar17ZUOIARxfVk6ZUwqebXLGTFNL+Kmi+uzdi+87R/6Iwr
V0DcZ1tFCf4CQmqZHYOl6KXGfYdxNmVlxrqubOZLB1WzFdXlB4RdLzmXjps7/0qv
VBmVTmT+2BDiSlnVdUvyXUr9BsPH1TJP/yYIximFo9jXhFlHZEQ=
=xZpX
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
