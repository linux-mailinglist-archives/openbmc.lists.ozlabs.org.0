Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B24514F6407
	for <lists+openbmc@lfdr.de>; Wed,  6 Apr 2022 17:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYTjg5WfRz3bXR
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 01:59:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=UCII7QVA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MI+HfYYD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=UCII7QVA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MI+HfYYD; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYTjD05gJz2yHp
 for <openbmc@lists.ozlabs.org>; Thu,  7 Apr 2022 01:59:26 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6A9EA3201DD7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Apr 2022 11:59:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 11:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; bh=s
 /sVHAGE5T9RwThn8qcd2BeTRNwqdj7rkfmecmPmfRg=; b=UCII7QVAtbKTjsXFp
 8n2E8Qmf/Q7Ibjsa1PNm5eDPZXmwtdeNfxBC1rRJH01tfk21sAAjbEHk5HuL0feL
 0y/aU7n03Wxxb/91Q2/uuUKnBmTDZyU3exA1tExw6K21fUFoYFiODq8IXOV6B6qB
 Daa7CD0Jtid7K9CD4vqGNif+E+gkv1x9RyaOCM4Z8T820wVQcn0/S5amDJ8xlNY7
 uvMk4odoxM3Pg1VaQBy7M2YFRjYUVB+8iOU5TIt2GvddrbYzwc9EjCJfcZ2U4IFk
 nhd+yRKoYEpHX8wV0geCzFJrB9HXT3h2kF5aVP1SdpF1dqOXYJgPFVvZNhFX9iHp
 h2TpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=s/sVHAGE5T9RwThn8qcd2BeTRNwqdj7rkfmecmPmf
 Rg=; b=MI+HfYYDSMYgiqaP1UoiIIWmfl0hV5mJHXVaZUf32bu4gWJL6OuK8EB+i
 KFlTxbYIa6vC1dJ0+Jo7anCTglHcm/9MAYbM9yxwhPn52K3/2EmeoQ8H86M+Zvpw
 VKQ04sKvyLS1EhsbgS+TPe1R5EFwBuVDVkjPW+slO631aMS+ybDN9Py5n+uq9kNe
 rKJx5erGJzfaLV/aGH2r71i/6IDBSa8s9XqDo07kKNVMlAURLtKO3Qjj4bfr2Ay8
 VLFgxD7H5P6UoOzny36eXxmZxKKRUMHqJnZ9NXd3GbSmtHz7xC1PgdJ4x9ahGaar
 YJa48tqanymVyDke59QXrfhsv1DLA==
X-ME-Sender: <xms:2bhNYgrBhEd1Getm1seC2eHKLoYmNAGMzKvdwNHn4cmsZ0q8SeumFA>
 <xme:2bhNYmpJI6LY5FxQAtPwXViRX3ju9As2qJvz-wXN9LR_d_9RREkrbf1X2wznLL6fJ
 proFZLUYXk3-d-ajC8>
X-ME-Received: <xmr:2bhNYlPWE068elji3DYalK16Ho8YNAPBS4twk6Ajh8WcN20KoQgnHJ1eG4YAYpEG_XaEvRBBQCH6Nhx5yCGWDNW8F30qcYeoxXE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudev
 jeffffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:2bhNYn4_aOTLnCnQs_p0jZLkJBD6AjA2mgXrdCFRDxrIFsdNetV88g>
 <xmx:2bhNYv4A2vFtE4SuyU056y45xaRf9A5FzUU_0nDqk5XY1pFBSRIWgQ>
 <xmx:2bhNYng8xYWzDipQ0_wjcY3yLIZjPDYtH3XXKKYrvy_9fPU1MKBD1A>
 <xmx:2rhNYoV_O7MlysbbmIjE2t2OZ85LN9wfyJHCFJ0mTWfc5_wpRliZgg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 6 Apr 2022 11:59:21 -0400 (EDT)
Date: Wed, 6 Apr 2022 10:59:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF RFC: Backwards Compatibility of Persistent Data
Message-ID: <Yk242OnLIMxhoRdq@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cs83HhNXbdqIaM09"
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


--cs83HhNXbdqIaM09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I opened a TOF issue to potentially set a policy on our stance for backwards
compatibility of data in persistent storage.  If you have opinions on
this matter, please voice them.

https://github.com/openbmc/technical-oversight-forum/issues/13

--=20
Patrick Williams

--cs83HhNXbdqIaM09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJNuNYACgkQqwNHzC0A
wRlVFQ/9EWu6x3TekfcAJDiC3MyI2Jy7xIJk4zbvRhLj+a7oMFwIH4g70Hxlvgsu
5flDHE4P3oFyvFg6lhRVdLnaJ7J33rAYE4+J5+klLCiv2pzAvPI3o1nonGPu49+g
uf5b+epMHHU/XlVq9WVMIV6+xW88O0K8+i0DFqZWyHnwVVHgVEyXs6G8c+P2tT+c
TXulciVSq/03T3BkH7kBSHmVaBsAH/X5Q/Ye3PBlIgfObXCyjwo9CYqyTdjOzVAX
ym8X1KZbqgYNUMEm8TLnGthS8Hyfv0C34eL+qBZAGLX4r+2xpnQ/Gdj+3esRArtw
6/EnjPwaU2hI06ib3mBQjFY8ORX8hAyVurQyrypMtRe6lAX0Cc8cei8nKMm6uO/J
wrUFTlaVh8fW0O/II0NEAIU3sZBdH620jDoRMagtUvDkyAwEbU0dZyIvNEnltkDk
owRlSdNqDBZTxd1InotMluqsUw1sQwVFLlDw2Cx8ASJlL1w2mrHs0csxuJOYrFuC
cSDITOKIfjv50MWInkKNYTlwMfpNBiBrvZKQxKEhwzJpAXiwWqlPzCrNRMAEnjlF
aX5IrMaBpKx/bdiWWFe3yxu5Ld/J64xw9NF0DQ3C9xrPfj/zqsyaNU/8+JKoJGUt
Kno00iY0v3XLEYuzydqfRnRYWPYc2wavuaSwkD14/tTl1RYwo9g=
=/OtS
-----END PGP SIGNATURE-----

--cs83HhNXbdqIaM09--
