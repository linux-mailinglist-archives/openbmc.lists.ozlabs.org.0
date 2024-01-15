Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F29B82E1F4
	for <lists+openbmc@lfdr.de>; Mon, 15 Jan 2024 21:46:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=hRoP/TVh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Gr70xXlC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDPLR6nx7z3cSn
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 07:46:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=hRoP/TVh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Gr70xXlC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDPKl6f55z3cCn
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 07:45:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 890B03200B51
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2024 15:45:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Jan 2024 15:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1705351525; x=1705437925; bh=rtxoJMmU6T43o8UbjvMHyx5fjXumTRDd
	f+y4yz0d/bk=; b=hRoP/TVh1hmbCW7ylqdpFGf9guwkcT3j24XH3uO+cuuBt1Gd
	g78vL3cQp+XDZcdEYY6I2F6X26EUL33FGYLOCnbM/XR4mkyoSlJCoF/d35wX6T1u
	S4BPcOWvKTVHhbpvnOtl7PhdtTl0X+RSuiu+kgFC4SQfZos0wsUQgqGlK47bMqCE
	ZagX4pMYJo2HPQ0V0676Dxuzw87OdvtPTi32fH7FedN+UfT0UwA833H6AsKYYiEX
	VuhHQjtTqjBJkIdQ0+W08wLOmUzg8N8Y7BWcTRkqcFtcxempDtwgAQxVMjCqfN+u
	1smZGh2sAFiDJPsbEqFTZL385B0R7FpHtuxY1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1705351525; x=1705437925; bh=rtxoJMmU6T43o8UbjvMHyx5fjXumTRDdf+y
	4yz0d/bk=; b=Gr70xXlCqsJ0W7uU9tsFkWVu4hbSq7RLmyMT61+V7EXofYQWwLk
	ZRNRXcAUQIxcwgzPasILNEWn5drjF2MXNWR/nJTyosgZMuY1lks0aoOSSytkJRMd
	Mbe820qObb26tgcbov7I2gSL+gb31Hag8gO+ZDcGGatSIilHjyUF7/zhSpkRC1Ns
	p0JOBRJ2/RsgMbosvuHlxe0UY+C2rN6B2K7DIMtSnQ/1/Yc8GS2e5CYreIW380NH
	2nxw8nxduzQco6qB70n41wzIJudpm9AXsNje3Qjp6J4NXdZyxXrfjexNbYE9+RO2
	u6mmV2NiSQEZr//0K/y3Hs13lLipA3xzKPA==
X-ME-Sender: <xms:ZJmlZYuRxdkKLT6-9SO0JuHHP7ljzmTJBAZB7kCSsqOk-fapDLtegw>
    <xme:ZJmlZVf2-zci5Uz4MQpczZsfs2DJjwFLoaDAFJ62PonNOfQxapNFYOVSWT46Zoq4A
    9EAOXrZl0M28FIrGYg>
X-ME-Received: <xmr:ZJmlZTxlLrfFXTQxb_gTzdzsPzEsWZvorhlo7cpQPEWyBDOuRXbz3cRrVd11K_XvcSawUPSPEdSq-caAmbF5TnyqXCLO-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdejuddgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfggtggusehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhteelgffhledtgfejgfdtkeeiheel
    ffetfeejffffhfevgfehteevvedvudehveenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhmvghmsggvrhhshhhiphdqrghnugdqvhhothhinhhgrdhmugenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiii
X-ME-Proxy: <xmx:ZJmlZbNu6E17VAauz1CoUi_aGSRUWuoXSkXk7AZJGg6aO2qjK7yC_g>
    <xmx:ZJmlZY-4s4JTG3n3WSGnka31GVRw6aUiMASXNkTfo21qNiv5p7wWIQ>
    <xmx:ZJmlZTWrEMVYS4PZx3OQB0cfjcByfvB-rwRmTtgcS1M0iXos6_AEOQ>
    <xmx:ZZmlZRL90cidWmQ49Zmyqctbru0KFwiTXfAt4_cXEbbHzDkJpqT22g>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2024 15:45:24 -0500 (EST)
Date: Mon, 15 Jan 2024 14:45:23 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF elections for 2024H1
Message-ID: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zey9vp4AGQ1s2PR+"
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


--Zey9vp4AGQ1s2PR+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello everyone,

It is that time again for TOF elections[1].  The current election roll-call
is available at:
    https://github.com/openbmc/tof-election/blob/main/2024H1/rollcall.json

For this half, we have 4 seats up for election.  Currently those are
held by Andrew J., Jason, Patrick, and William.

Nominations for those 4 seats may be sent to the mailing list by
replying to this email.  Only those eligible to vote may be nominated.

Disagreements with the roll-call (ie. your body of contributions are not
reflected in our current score system) may be petitions for inclusion
at https://github.com/openbmc/technical-oversight-forum/issues

1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md

--=20
Patrick Williams

--Zey9vp4AGQ1s2PR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWlmWEACgkQqwNHzC0A
wRkSHhAAkfA2MWVOfyRX+B3vnm4ybN8eTJAJSpckbopgVd+zdl1xwMTTiDmyxETW
neOn29bQXxI9mEorkXEPacqzs+Rf8APjeBJCUOnpvP5PI9WS7lYpGIdl/nHzz6Qw
4IZ9N/vY44Yc75R3A/Z6D4yBUJuOIc3D9fqJP/EKnRyDu4oaBOrDwTobNkx64zp4
UHkaRr2w4BfpcPAq2IIp4G6OjK1SCmk0RFvfLBeZHtqEMReOCv9CDtvExu3NQxJn
QzI/0iezBRwfqSSeq372TalUQ+CHb0ScdXYgxPobw88M/5rRdw7/EV9HBCUlZjJt
ur+ET0iENrC7O1xdRWaGcspdicdcglHfhgunRu2gB3PCZSqaMPvXBUqo4XUGox9I
DNs60hZDcWGa423/qzkbVOzIxbZ6GQQf/ov8IfSBPikB6ln6NbLAb4TCNNcvOdlh
0O0u1drKX8GHAWs8ZGuP/sFlgY2lD2t/9Qr61Sv41KT/gQnVupPL8sLHdoR9yuqj
BpFCHspYld98o9MSSlT2hjBZDzBd1yNaFdr+EAiFPJztO+bSV1HeUjancYXzQE9N
+kPoHd8uu89s6ubEkuknGlqTEJ4Unf5fTZx8wIL+F7DkGEQ/YS24k1IMc+f8KNNo
MHhTclUtKhw3gt6aHFHZHQ0zmVpa6XnvtTLz9hJMBD6XAlMIA1g=
=hiG+
-----END PGP SIGNATURE-----

--Zey9vp4AGQ1s2PR+--
