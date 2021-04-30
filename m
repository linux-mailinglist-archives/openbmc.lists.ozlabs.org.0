Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3836FC5A
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:27:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvp45YSgz304Q
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ma+F8ex0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kOVGolb8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ma+F8ex0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kOVGolb8; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvnR2vFfz3001
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:26:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0238D5C00A7;
 Fri, 30 Apr 2021 10:26:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 30 Apr 2021 10:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=HNQoBNJkOss8Nz8+K0E82uCpfEn
 X3WI9bsrpgZ6tsgY=; b=ma+F8ex06nO/mCuMBQ/9I94TCMCv8nIPB8Bpe9y4IKN
 /pHX2a9rPHkFU1AYayw8pwuBFgKmolbRKW0aeUvtg60CN6AouxZ8G0wGDX31cOZG
 qwlJ9X2dP3tUphHU9DtUHbtacxtdloBm9Us4meKxFUN9H5bMrBsculYh6R4syU/f
 VF/HP4RBfdBemlsjv+RFEkqpFfDOuzuDXVP4SAVsXXVFnPwm7LQJwCFrqtn/gTqw
 fA6NbppnhzYaprN/i6xLaciAnLRt/kx6cUoJ7AS+mm81mqxat+v0itbMvP7WS2hm
 yEZIQPZo5McdVNN0CybkXz+a5CxK7FgsDoQkfE2ob4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HNQoBN
 JkOss8Nz8+K0E82uCpfEnX3WI9bsrpgZ6tsgY=; b=kOVGolb8SNHAqwTJA4ypnC
 DDDsY9VLW4l3rtpfN6wSveDvKW51KPF5xMzs2yuiWF8zMcdkMY/egk17jYJQLb+v
 Kp+PRU/7JIYWpQyRLtWEbCwUoezfELAiNSSSTHFB8XvoLlcvO2Tz3x5D9eEGZCge
 pl7tNO/MczxjYOPM2bBJepAKTnGQVORHoerBLVLkKZwWFW12QEX/c4q00ZVoMNVx
 qcJ1z8pYecpABE8ixEH2crp2w10Xz8Opz1gOVNmRMzDuGU0SdeN4RH4UQWDBMW29
 hs31uffuYK8+VvtZEH9rAiH/UdtWwIlWH8oqSidsbOM3NusBwD67L3skVF677j4A
 ==
X-ME-Sender: <xms:mBOMYMsjElaFgYSHSYcmQcKUy5o1li7WW5dLTa5BdKy1AFNRPJu24Q>
 <xme:mBOMYJe7-0Iw1g9U5epypoTITlXEve89In3PdO2WlGLyIQZGbBp3VRQVjIlhnM7he
 zn8PPVvknCeFhaM-jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mBOMYHzhTIidlYTyUKehppWubKCLiUWOTX82S9xRKsDWCqUM0HFi5w>
 <xmx:mBOMYPPVhMb3Nu2v6hFiFllHS6hwEzhE2YP1XkHgQOO-tCWXPZHJ8g>
 <xmx:mBOMYM8uDxHdzN-Etw6fcHBNaIjtPNbPGpHiRzXWi6ll5xhw6HeZlA>
 <xmx:mBOMYFIqjVHasE7rw3Fkd4on8IgqrwILi9V9mf2CksztUCgwd_lyXg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 30 Apr 2021 10:26:32 -0400 (EDT)
Date: Fri, 30 Apr 2021 09:26:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: PMC
Message-ID: <YIwTlxp0a/c+LO64@heinlein>
References: <YILLjQfgD4Q2vH5L@heinlein>
 <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
 <1F0D01CD-2A39-49B3-9E63-DDFCA3371672@gmail.com>
 <YIMBmRyyjcchQFhA@heinlein>
 <845C5760-C7CA-4ACB-A465-63BF0EA851DB@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="agSXuSy4NlLH0EhB"
Content-Disposition: inline
In-Reply-To: <845C5760-C7CA-4ACB-A465-63BF0EA851DB@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--agSXuSy4NlLH0EhB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 11:30:54AM -0600, Mike Jones wrote:
> Patrick,
>=20
> Are there existing PMC implementations for ORv3, or is the work of your i=
nterest the first? Is their existing hardware to base OBMC running in a BMC=
 to work from?

There is not.  To the best of my knowledge our work in this area was the
first.

--=20
Patrick Williams

--agSXuSy4NlLH0EhB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCME5cACgkQqwNHzC0A
wRnWOA//YmZIEumCeCDQUQEYT5zI8LP67arJIVoz4aFsV+eEz3OvKqTC5gQo81rW
fGhSF2DD81SPSxy3ag7Uj3pFSgXui/8ZBoEHWmRGcE406yFOx2OtLTsybPcC8Kg8
X5SQ026TS5jkYEfmVXNSbmLZ7sIrpSU7LZM4W20ECOR4cq4jBnqQvKsUczUbrYA9
gs3455uyVFgVLtvfNkVlpyk/oFP6uBaydn7HPrg/iJUlCk2ciDoKgL1BlqPj+BO9
BcvJoR7Hc0O+x+lWqN0W8EGNs0Qx5IG9Uf4jQRud4gKKO/XrkMEGoGPW/RsfFRyk
y4d/drz6M4/JP0fxbfH5Q5RESARKXQ/v+ZQr7/MvrzaEYWKpEMPxPDB7CHYWugIf
VleAbhv5+etXyySCrOkBRidFUCbQuszM2BM8dVZtkEhBAS77bDG+UUdkLvXErDVU
QZMDtGBDck8ZIxGTZ7v46nw4iRf7tQ1spfoqZOkW5/di7k6ZZUV3+iFku7VNxX77
JDxKWv4N/wEBWBh488N8r3vGJpFPEZoUST5J5Ne0G/37flEquU5RTjbi4waj4pfF
3Ggfqb2JXDFswMxO6BIKu+It8kjCW03y18PcxY8gkMrKRfnTvsBFg9646GzxFfJh
OidNdtkjpmqcengx49of6ATTbwlKCQUFrNE4Xxh5IC9d2/uM1oM=
=cO1e
-----END PGP SIGNATURE-----

--agSXuSy4NlLH0EhB--
