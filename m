Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D1465975
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 23:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4DjT65gNz30CK
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 09:46:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZDL556JH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fgFI4veO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ZDL556JH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fgFI4veO; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4Dj14QkDz2yP9
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 09:46:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 72A793200BF9
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 17:46:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 01 Dec 2021 17:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=LsGDscRocfIViPJgbF2fwWpS7j5kdiVUX56gAENVXLo=; b=ZDL556JH
 wHl3abyY4dgxY6QOEHDGHoLol531l4yTys+UOLJnodac7VgPYBfp/XY9Uy+hY7lc
 pLzbPPby/0TPNlgSqUGXrH0A4tzUw8uvdyr/dkWJI0yTgG1veeE9yk5wrajcNsLN
 cVI1yu/flaO1xb+3aTZkYtOSX0ATR+J6xAnniAgDjwnuImkdzmZtEmxyr+7Qn7gk
 nwZePNQvb8GiLu00VTq/39P6G/g1emxblJMRhPnEj/PQY/SLLZnFDs3t3lReZwKP
 tZ1cXy5IOj7Zv1/WJiTBpLMMvS4ZPe6YMpzalaLwXV4x+quZYqTuTk0wj8AjqBM6
 FhMgbnc5khdwSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=LsGDscRocfIViPJgbF2fwWpS7j5kd
 iVUX56gAENVXLo=; b=fgFI4veOxxCFKEQ7+sLG6OqPi009eIdS3qsD+7m5ZKtBo
 dLl2MQUBIUQeNtsr8TJgiqpDK1LNVcVPAHtYLy9hA5QSemNTG9zLtY0iUj8GxwC2
 MXmlg455hUNzwIQU+XKl3X0t2I1tVQegElYNY2ZNIvb0A8wUhqOtdv032Kqn3eUJ
 TKvz4CW5GLl8w2XfcKItCVONPs5Ng0L6XK3Nj8CwvRyywlXTLcJsTyyXPN5GIMH0
 23gJfl6tqskkpglMB3bF21ynu69JlheMdYxkQGFy8IlHU468YanG8QURL345ORWV
 y9wYI2hLSNOt+7hDS1CdshhE5PI9Wq4WivOr0ZK1w==
X-ME-Sender: <xms:P_unYVZQC1Othu1WDYVCyNd6ufba90obgRk6afMQwxLKHS2yJX-E-A>
 <xme:P_unYcaUPHGG5ogpvhsPEBjSOASLhlj7Kl899T-UHvYDv2d-_BXgR2eujP9xFwrN9
 eF7dUb_iK5RHc420Qs>
X-ME-Received: <xmr:P_unYX-UXXauahwBsWr6pbPULFsehtTIfhsR9RHSWjW0Wxw94fPQRSOKnWJ3Xccm1jUYNE2itzed9euM_Ievd5gCkXK4KyD-gYbvJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucggtffrrghtthgvrhhnpeeftdffvefggeelleehteelkefgheduhfej
 feeggeeifedutdehvdethfehveehvdenucffohhmrghinhepohhpvghnsghmtgdqphhroh
 hjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:P_unYTrAOcWthkzcCv-ZyrUuZcBwfzjEjadHkXKn5l1w4-uehHihMA>
 <xmx:P_unYQq5BpovlyR9onkdM0hWzRzw7b9PsMbJCQdIOEtAhlqjNBtrfg>
 <xmx:P_unYZRhOmHdvTauS2C8S6EertIf_xW1Hf8Uw6QFUobZ_48tPmF8cA>
 <xmx:P_unYWFamCNrXV278P-c930uWyk3aAVYrG0x_StJhtwokPMlD1du-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 1 Dec 2021 17:46:23 -0500 (EST)
Date: Wed, 1 Dec 2021 16:46:21 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Multi-device / Multi-slot code update.
Message-ID: <Yaf7PR7vcQAsgC6L@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PwPOutRHvHn+WF9m"
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


--PwPOutRHvHn+WF9m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

I'm not sure who would be interested in this so I am broadcasting for aware=
ness.

The current software update design doesn't handle well being able to update
multiple devices or being able to update multiple flash banks on a single
device.  For example, we have no way today of modeling a static A/B model f=
or
the BMC itself.

The current design also has a fairly weak "Version.Purpose" enumeration and
we've left it up to individual implementations to ensure that a Tioga Pass =
BMC
image doesn't end up on a Witherspoon machine.

There are design proposals up in Gerrit that attempt to improve the situati=
on in
both of these respects.  We have some developers that have already done some
amount of POC development of this and plan to do the necessary refactoring =
in
phosphor-bmc-code-mgmt to support this. =20

I would appreciate any feedback before we get too far along in the
implementation.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/486=
54/2
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/492=
10/1

--=20
Patrick Williams

--PwPOutRHvHn+WF9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGn+zwACgkQqwNHzC0A
wRmmDA//f7x7MW9O9WGHicUxfknddL33HB0UVQMzaaMPqLkAC0q1tOSKBhwQOMDz
jy47UylPgvqaVPpHElnNz+XrkaxvNLfHK6xfOLxpjQaZAf1BAhXcRRuyxRHjtqGV
UuTqXeBLObj/TNVjXmEywURcTAIKMvSrGMNrHg76aG13SGla3DVcKNSo6Z2kVLCt
BMY0J4a3TPLFI6xMBtcrv9Ti1O2Rzoc+4jZuiKw/A+xhuPYyNPFEdrlZw/E9UYr4
H2a6++3NkcdVANyoyI68BtYU3YQqnwoHHh04svzgaggSr9EvGmOiYhTdD36hRfe9
5ejJHGxCl0Z46POMEh1wgfk6u15hsPQxWA0ZWzDKjtPcUFk8zQUX9FE8EVivD8nG
h0UjrQQPWSkBM7xiF8I+rMiKC9+ewl7g3RITCrzXHMy06TXf94nw3toaekd34HL/
hla/jh6yMB9afK1bqAtCw3idZBPBNiIjNGAFgAqzIbZ22suCyf4crNNJwyQuHLvS
Cw86pGHLQS1/SZFpx8FIKD4rWLqXrTnU/vTvWPYY3cFtYTOijrKI+feeGxLsMpTv
4wlO8iuZJ2CdSABePRRG6hWwcRDprMqN1ZVUesf47lXpPLrvlc0mYO0j5BjN9TT/
PVSpFfDAr8fsVchQM+pd3JXVYHLSDWC2hCyTeK/8rNHLgIiha9A=
=HpDu
-----END PGP SIGNATURE-----

--PwPOutRHvHn+WF9m--
