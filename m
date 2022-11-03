Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91723618B32
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 23:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3J2S2ykkz3cQl
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 09:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LIvpT5PB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N19e0A/+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=LIvpT5PB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N19e0A/+;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3J1n3Df6z3cBf
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 09:13:48 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BF0C15C00BD
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 18:13:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 03 Nov 2022 18:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1667513620; x=1667600020; bh=fKhKtXDUYii+SLkwdOcvXZb2HprTIVSb6mL
	6qllD6kw=; b=LIvpT5PBKeqI+x+pnc17n1rMqflLTLf4vYP8bKrrXASDFg8LaF4
	MPeOS15TO6C6JAktdwgN43GIoW1K7zGER9EHxSdVfXfXyESCmO9IwxjboMwmjUfE
	mWOe71sDYPVqakWLmtw5s8Vi69wlZEXO7AbUjyWdU/w2HPddNDEpbBoT+jc5FV6C
	M4NRgc2fxlFuVqWP3/ScyULHVWbwu3YP9FDHZNySLUqExkwfv1ccBLBCDIvpUUd9
	wzhS7OLF2J8RxeSeWMaBTzLkCmEnFWs9r3c/AitX5MgEbeqDjL7fAehJRyWQBI0/
	bmSfzabPa/G4p13oWSA8djjDvSU1WaEbCKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667513620; x=
	1667600020; bh=fKhKtXDUYii+SLkwdOcvXZb2HprTIVSb6mL6qllD6kw=; b=N
	19e0A/+GX0RjmScCuS6irF+Rdx99S07sMs3aYv9r4oa3Q03BGwSDzDg3AisJoru+
	PnHIIKOR5mIm7OscSX4jTVltmuVB/A2pmUDUqCFG0ID0j7Bmj7dKt+qhSpBKEVlH
	Ey7tKW2+98pV9TfQIk3C+y43uG8+D+YaA3PIoyFMejKA8bVMArbTc6/vMD92fJDv
	cARSmMNirlZ9AWK9EEflL6l8eA+p9uirtd4HO64Q3SNuDxkELf4Y0iSxrPFreJ/y
	Yo26A0GT7kFPrQ0kBjocq+gDdfmO78klUew4ZXDfE0l/q1LnMZ2ArldjsAL585qM
	QChjjxSQwdtSc+ecC6f1A==
X-ME-Sender: <xms:FD1kYyqL6PqCAQ8wYis0GWDqg3Ok3yGjpMp6hTK5sV2kXrLP3sxaVA>
    <xme:FD1kYwoZucBObQc3H3Xs23f3ypx3WN9kMuMFVfcU4XnM_IvWspEBStdpMET0zvJ0w
    2_GaUXNTRzaGpYwskc>
X-ME-Received: <xmr:FD1kY3P95hNx2yjKpIwsjB2E6EqN4hg4jXh1KqWjJOLYWCRMjXIsQ09g3-D0apKX-fT_wFsgW6ZKqybmzbOj7M4sLjAzzYr4S6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdduheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgfdtudektdetuddvkeetgeehlefh
    vddtieffueejffeiteekvefhjefhueeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:FD1kYx6o9qWpsrW6oWZ0uL_0dJZ7KyksLJNKtD0z3ON-Kc3DsQcb5Q>
    <xmx:FD1kYx5N_ICqLSj8AgYWqdzZo_aufCsXEdTzycVQUo4knoYzqbE0aw>
    <xmx:FD1kYxhmRDVrr9dbFH0rf3Z2UeM_z80Bs4FzaAXYMTKrOLgsbIM_cw>
    <xmx:FD1kYyWjnxKYyZcx2KhD3iEcMyy_OzN31zTdN656gOZtqWhrfrlfPQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 3 Nov 2022 18:13:40 -0400 (EDT)
Date: Thu, 3 Nov 2022 17:13:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Minor breaking change in sdbus++ YAML
Message-ID: <Y2Q9EsdVqfzx7X4S@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0h1O4ScDXWjXTKWZ"
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


--0h1O4ScDXWjXTKWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I made a minor change to the sdbus++ YAML format to remove the
backwards compatible "path" type.  Almost 2 years ago I added
"object_path" as a more accurate description of the dbus type but hadn't
removed "path".  I've recently updated phosphor-dbus-interfaces to have
no more references to "path" and similarly removed it from sdbus++.

If you have externally maintained sdbus++ YAML files you may need to do
a `sed "s/type: path/type: object_path/"` on it if you're still using
the old type.

1. https://gerrit.openbmc.org/c/openbmc/sdbusplus/+/58126
2. https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/58124
--=20
Patrick Williams

--0h1O4ScDXWjXTKWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNkPQ0ACgkQqwNHzC0A
wRlrlg/+LRS1z2LhF6tk0Y7HojcJdjocwrmyUQJBOvpEAsC8eGp7DBbBus7Du4u1
+Yp/Q99+iJSehIbaYFv6fo/3oiwkwv78yYFdO3lXWd1YH7x907kD4NkhVHXaMi9m
HR4SQubeMrTeLI8qbJNZCvkv88ujiXSZyY1MYGtS4awp0dnEddIqKC0zuxyCaFfj
dA40BBpvZST5KbwYn+SK52AQfeANOcnknAMRY05XIboFIWE11upKiK/V8+jvvrGI
dVcAVtKkO5s00RRO+bJz8JX3d2ko/VDb7rkkT6SSxyVQU9zq/hBDxhYC9nEyF1Vd
OcxK8UbBBlD9yXYvuQjVDQRKzjJetTmECRxhCEKqk0gUnf8/I7caWIX8OEKgTIa1
Fdayg4xqM0/sGbC/D7PT6EjW90GN9+rHmqHhcTb3ED40b0MABuiosWMpt257r1xh
RGaHyd5AHEjaDdZj8J07WmE5vg7fjDltMs/SEPa4BN3ph4t+DqkmLj5s1Ppg/Ymt
R7D0ss4Pz3/ASq+iElUH4Y0GG3JNYKBh2FLq3imD5ick+BD8zfPNLnMtk0UmCrEl
OJ6RphK8dxLRmIoh5/jteCEKgBGa9uDq/32WiW3J11UbrdoNHp48X5+PM20axEnr
g3FS1T2DmY2EZCNqGQgUNY5Ad+yE+31QBx0ghEVTGdAHYGji+Vs=
=DAD2
-----END PGP SIGNATURE-----

--0h1O4ScDXWjXTKWZ--
