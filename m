Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B3E4DBAF0
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 00:22:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJmWt6Xn5z308B
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 10:22:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=I0xOwJpY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JnlC5mg3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=I0xOwJpY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JnlC5mg3; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJmWP3h6Yz2xCM
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 10:21:52 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6E7325C01CA;
 Wed, 16 Mar 2022 19:21:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 16 Mar 2022 19:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=tilKnQscnvZCKw0Vbe6Y/VAAWTPdX9TxUMmxNx
 F7L6w=; b=I0xOwJpYacyblPfPdQQvIDudVLPNMDOAzYdmrkCM5vogTuyu7GW5H3
 pwkMJIg99ux5F/JqfGrf+/GPMT/WfqIYT6t1VXqWp2Y0MabR0revENin9oTp6QbP
 v2uUeLruNrMI9Bdx9BL3mZ9MJ1sLHxRoMdN6Gm5FYqrIwRHhM/0+btQQ3JZBOZdx
 cePGUHDZgoqZI2alEaTVVMoyxoZNjSv7dtbstoCtSv0EdWNB6OxafmtIRyO6pDEN
 1s5WuxHlQxcO9uWQISFeGu3h3IHsQn4D/uCNJtPyUxt86BI2Avi6tJYgb0oNgPHe
 FOEoq1VI4kYRixnE7As8AX6262b9Ybzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tilKnQscnvZCKw0Vb
 e6Y/VAAWTPdX9TxUMmxNxF7L6w=; b=JnlC5mg35G89wemwDrZx+ucx/ozvkveF1
 CCW/cF5W4qkhPYiOBWcvvlVfD1an2+8FdO6kRRkUs4b6X5ZrgNxSHOhdzg/z6MHh
 UxMo5t7NQUJyrVJJciLrJjUFmuiZTEpQs2wNxig+9watuwawB/nrqiL7ClE1idVN
 HIX7ouR8mTzMyuDMw1L+4sCNobRNLpXlvkvxvsl8ldEGh6ghHA4cbmIxSXiBzJsU
 M8r3hX2bW+wRihaGJIx0tB2hnpUjylK+GE49fpWZ5ufFhgHwy5GUxC15WWMY5wV0
 ObXOesaFFU4N3K+oKgT8Vv6QpRNlsz7nfHZw1AcUS9kRNheenGUAw==
X-ME-Sender: <xms:CnEyYpBAcTN9Ub9zodfVf-P2sAIq48K7i9ZC9zfe7fwYyq3sSmCU7Q>
 <xme:CnEyYnj571N7GrQ4uM2VHLRFjMc9mH5i5piFuot0yAdcKbZTeCzp1ZwIF6KVHP9ok
 Pqab4YC_z-5cHe1bBI>
X-ME-Received: <xmr:CnEyYklgT1ljfwLSkHb4gDQFjkp_BQLRVfUpzjYV_ftYfcEvk3USQyoJSBFuC3vBxvbx9NFRbLgm73shFRPwdfTzO2Bam8CKvOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeffedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdettddvkeetiefgleegheelkeef
 hfefjeekheetgfdujefggfehtdffteffudeunecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiipdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
 ii
X-ME-Proxy: <xmx:CnEyYjwBfa35ht-ejKIvcg-2VBi8EXKwOiqiptj5izHF6kkbkK5aCw>
 <xmx:CnEyYuQy6ZR5IgdGxwkF42Nl89B8u_PGYrH2-Dmww5rrQZn9AZiFIQ>
 <xmx:CnEyYmYfGg58Tc1A0QMsInvrkpKytyzRUtMARpEx0QEKNk2TQMJ-_w>
 <xmx:C3EyYn7d4jk-5ROJ5w-0hl_h9r_XjP9k3XLzTypI0y8gOCoflaf4rg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Mar 2022 19:21:46 -0400 (EDT)
Date: Wed, 16 Mar 2022 18:21:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday March 16 - results
Message-ID: <YjJxCRUZQD1HcRXF@heinlein>
References: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
 <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FcvmoUYGv/fIxnzq"
Content-Disposition: inline
In-Reply-To: <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
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


--FcvmoUYGv/fIxnzq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 12:51:11PM -0500, Joseph Reynolds wrote:

> 1 Please review the phosphor audit design=20
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023=20
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023>and related=20
> code under https://github.com/openbmc/phosphor-logging=20
> <https://github.com/openbmc/phosphor-logging>directory phosphor-audit.
>=20
> IBM is interested in working on=A0 this.

Was there any feedback on the design?  The current proposal seems very
foundational, like phosphor-logging itself, so I want to make sure we have =
broad
consensus on it before we invest a lot of effort in this approach.

--=20
Patrick Williams

--FcvmoUYGv/fIxnzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIycQcACgkQqwNHzC0A
wRnFGxAAlhclqyhpANtnUla9XMZRrACtG1sZy3+m2maX0+KTckNaLX0TsuwaFS6n
5gepkqFnjcZDt5JxeUDRTdmL5uI6xK1+p/+T7AhwLmfFh3AC/EzLozXNSIzAVLGF
eirA67nS+NwveueM+YXADT7+ELKVT0G2Xn26w461MoTZiLQ3b1ZQE4o0SWVsSSum
ocws6i1kJeOPv/EYSyZ/4e8rhWyncJGBmdAGqONkHI0ea5XAo2znjRvhUy7SKY02
zK5PRH3FiacKNoMJOKKdviQsAmHuQcgSY91Y38R+xuOOOyYZggyC5shlBFmcpr3J
cPqnYAkghm0Yd/DM/GxlzByXMvuyZ5tqrtKGrzid/255UUztkmp/ForVCSmzf4ZB
yqFkpjcwJBwOWN2Ex29snX5aJfvAebRpODbP3pPn2cYroyjA1nM2nC9MM7PlyD7o
f2T86fS2Hfa3Jar+dxFgkyWYqNtQvNIFm2Aakt4dXRnRAKF5Ju/ZCz27WfFvwPkq
xDkv2+wMUUPDjr4Z/itsOFxjEzKTiuROE17ei8TiNArl+lYGerKMiowQ7p1SH8mZ
RRWoR5FnTsB5bUQztTlfaZISdLUgr43speuU2P9luMZDBg4EKNIb8G+YjrjOlL6H
iCEiNZzC5FyRlFeGxdk10sgxuSRi/FYmBgbTksMLY/46c2ca6Vo=
=8FTe
-----END PGP SIGNATURE-----

--FcvmoUYGv/fIxnzq--
