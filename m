Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35F48F005
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 19:42:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb9CT3V6cz30NC
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 05:42:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=rON5vdDG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=UeVxqpxf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=rON5vdDG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UeVxqpxf; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb9C522Sxz2xDD
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 05:42:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5FF7A5C0108;
 Fri, 14 Jan 2022 13:42:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 14 Jan 2022 13:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EN7k2gEbcOjT9x0EAuUZQzGLyDB
 GdbMrKkpgRIk1/RM=; b=rON5vdDGu/o9xquZ9anegZ1TkSMaq/KxSKiauyc1L3v
 CglyALAekTpW1PaPgiikybQ+BQ88gmH/sR77KtFUN7iQ9cDhK9tFKei1uiI0OBho
 3ltnhGOlY/XRjAuL9c6eZL4Lb9UnWkxoCT41hTkuBPWoQFoZc9KFs09o7YezJU1+
 LrT4Ht9r1tqNejdKWWsFvYkc0rc5DPXQRSXsgXgQAq8CdqIRedXEK/U3G60x4GpE
 K+fwM5s21bxQBI/naj/PvzZHhgkx3/edfw+IydhGM9WBudznu1F9zg8Omg1XJP3c
 kgNrVw9PGIsG3yEKzxfJUfvOSfbAQFt3idSVEwVAcyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EN7k2g
 EbcOjT9x0EAuUZQzGLyDBGdbMrKkpgRIk1/RM=; b=UeVxqpxfvFTVMaCMa2Qc1c
 d6AtLGUpyZn0CSzV4Xx8/pcMCZe1bukkPBAO6W9uiACdaq7NL4pINgTL/4+kHRaW
 sl3o5LcVO+vx2S4TKXRl9ogOIl3zL9xe1fNrL1XdbizjUBBF20KTEXVkAGL2qRj8
 7/alwKjhQtOVInDnNTnI6kXZoxbKZRLFrTXKd+Y3VmydkWYSGv0VqjD+QgsZ1hJN
 gMPcrT9W0T1082QxyWDE22Fwr05B86agWi9BlLnAWpK5CwxC/5jgAx7EIt5rcpEq
 FXiZ9l8B+7eb6QHLYirPjf26npsQxhrf7st5dia2+pF2NNpnOltKRGyFsawy+QnQ
 ==
X-ME-Sender: <xms:DsThYcYJ_y-8ZZ2crU4bEzBudwONR6hhXNIAtuEmob8skDSJoIePRA>
 <xme:DsThYXYp3ZDaESxDI4aw0tuw5df-C3vTfRI3AbV_7XRe1bMhd_nYZGsi9UlkjkXW6
 ci5d06grYGEaoDEsJM>
X-ME-Received: <xmr:DsThYW8Dk-X6emrsUCCp6ZyIps3t7PsWEZUbGBKnpIIgx7baiz3CcsNC0koq6eewR1-ZHBjYtPCWNvPrZM7o_h2tsV0J-vKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeefffeuudeuheduhfektdfgfedv
 feekffdtleeivdffieeuudffgfdtveffveehnecuffhomhgrihhnpegumhhtfhdrohhrgh
 dpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:DsThYWqc5YVeh1tm2nSBP046WZyBTdzKJEaRloegTYn2FIvtete5Jg>
 <xmx:DsThYXqZRqfZvzZChn99jot1ytouFarKuIcc_R0lBlSsMesPQVZdPw>
 <xmx:DsThYUSRUXDQGHxz_7xKTsvjoMxeifUCm3y9eWBbywDK3-20FT6CMQ>
 <xmx:D8ThYWR_bX-cFoQ1BVclYm6ufS6vc0QzgniIDNDgjdrovZ_Mq6h3BQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 13:42:22 -0500 (EST)
Date: Fri, 14 Jan 2022 12:42:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
Subject: Re: Redfish collection capabilities
Message-ID: <YeHEDNtVqR9Gl8M5@heinlein>
References: <SG2PR02MB27962E46AE874F41055B5F3785539@SG2PR02MB2796.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nGEDTjOIRhC3nq2w"
Content-Disposition: inline
In-Reply-To: <SG2PR02MB27962E46AE874F41055B5F3785539@SG2PR02MB2796.apcprd02.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nGEDTjOIRhC3nq2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 11:47:11PM +0000, Udupa.Ashwini ISV wrote:
> Is Redfish collection capabilities (https://redfish.dmtf.org/schemas/v1/C=
ollectionCapabilities.v1_3_0.json) supported in OpenBMC?

https://github.com/openbmc/bmcweb/search?q=3DCollectionCapabilities

--=20
Patrick Williams

--nGEDTjOIRhC3nq2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHhxAwACgkQqwNHzC0A
wRnlow/8DkvYWYIA3x6/v82VEUHh1HToNsFLPFWYHeUl5001JaW9w0/C0+qX3zGg
kgkYHPq/SqF7eZwkg1QaNMEQqhWJRpmxQmPQUBDRJeOjeSESvPFxOXG0P04C743c
bd1FRgoJSkIrYyTnXLPm0XYnvAj7YsfC7fXXLw7Xf7c537WVMeld8Rl1r5QSexgY
zvahzG+DAI5daGtJxI3CJnFPfty/GPg5Bk9E2tNDPiwWgjJ8Qd8tshV1Tufas7gD
Zynmm4ib1bNxUulRljwSgYQs2rMGr0twz7MTHMqkyBs9cy38KXwdpdYaS2AHosyj
Wi/74mthzTbsN1qrG7Yd1spUv7dfPXFBeeNqfJz/Bcj+pOZFDhYMRmRC4vapMdD6
+EkUmZFDvkWeeIaT45TxknpNQ+Gcm+ZtXS76Z9FS029iW25jXVDBXlw4L6kjxbMT
5/5G7X3eF4hgPU+goIcDKnLNHxgGbEEOuM7DyqKTDnxt/cb8hRJokaGsGbfqTvsM
8DL+7LkNXESKh/w8uYyPEv8UKnAO0ztSNp/Q0ltGyu6uliQMWWEReYE9WkQUWiDB
2QuN1P/bOSnoEnzz5f+XnuS3Lr7ThADIl1G7P/315UVa0qA4QUBUDCUXqa4eXw2d
R2CY3wN38wwrDvtB4BkP6MuSaS+oKXOcUSTB5bYRi5csvvafoLs=
=17Wz
-----END PGP SIGNATURE-----

--nGEDTjOIRhC3nq2w--
