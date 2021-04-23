Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3A36982B
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 19:19:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRgyL2MD8z30DW
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 03:19:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=AdH6yAio;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=eERFosoD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=AdH6yAio; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eERFosoD; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRgy65KR2z2yx1
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 03:19:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 62E4915F9;
 Fri, 23 Apr 2021 13:19:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 13:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=UT7PPFhHDQTs09yHNOaQRaWkOyc
 73FxrWhMjfCiuPRU=; b=AdH6yAioYjr+i7ofOCxvu1GBq4VHqBguAHZ50Zok6b3
 uBA8C1LDhzIx8tEmrqy6qP6+eQWz655yo5C3p60Sdzk6TH3qfbPNN4+vUJ2IijOF
 K90UpyiWrT4mobgiS8VBJoNhZdPpqYfABwRx3kCTOpvWI79+cFm3B17lBJDjBgLI
 DvtsUy9yO1YmE9JT+KWwqc1sWxciVdBXAQThYjNsBGejuqQbenIBjzFkcCL6C5rY
 fDk702ZzvmBUBLVeQ12iEu7I+Nc3bxPBFIS2FiPi11Gbo3/wNUk/l9/1KIv1iwMD
 GhjbpZkVWJeuPvifDyIIOwdHUM6qpLNy2tkjKkk9M6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UT7PPF
 hHDQTs09yHNOaQRaWkOyc73FxrWhMjfCiuPRU=; b=eERFosoDT/2MIScPfYlqxZ
 R1OFGU+mbqP7tJK3q8CJKcZ39zS4QoIrtYIZ1DXmHxdTWfazeEbHUES4TyTJ+yuA
 S0xu8u060EanLoQdhjkuSL0DtY4htmqHnUYF6feB0n/UomN6CbM6cv5HGsMhYwGP
 tSeq6D9gE+dyrKr9zS4EMc8iPTMympPwXMuisUCADZiQHVzNmE2mlo43weMn4i3T
 BzP0Ktep/IMZdwZblOsh/ye+pgg50BO6f76ODrCk2hwtcxw+T0bdWW5WHIC4/yyM
 koFOLy/1KZP8eIkdVLTRXkFlTn3M8xtgJiWGv9x9JR+StbF5jZDx2BCMIbJrokHA
 ==
X-ME-Sender: <xms:mwGDYG3oaLd40DJ91g6qnKwGo9QUfwY0O3exRsRXw5ffY8a1yhJbJQ>
 <xme:mwGDYJEA72qtV1hUb1AqRYVO9VC8DXDeGQxxkLGA0yjTL2xC54uQm08cERA1ndKY5
 _bkBKzbPrljKtZSj2Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepff
 fhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpefhieeugfefleeivddtledtkeduudetfeeiudffuefhjedtjeejhfdvtdetvdeffeen
 ucffohhmrghinhepohhpvghntghomhhpuhhtvgdrohhrghenucfkphepjeeirddvhedtrd
 ekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:mwGDYO7bUX0k6qLVTR7qkx6FKrFSVa6_64etVgCzP800a90eYw_k_w>
 <xmx:mwGDYH3kvU-eLzyd0GF6byI_nLE00nN-afx7n6s72Sae68IUmQHycQ>
 <xmx:mwGDYJFbotT7YQjH2uL_VATlOj5xLMwRS5Oum-FrZKaV_zD248Zpbw>
 <xmx:nAGDYIxU4s2TAzjkSFWJ1dhMLovu5PIlnIWLVSw_NdMiKIijm6Xmow>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 34E4924005C;
 Fri, 23 Apr 2021 13:19:23 -0400 (EDT)
Date: Fri, 23 Apr 2021 12:19:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: PMC
Message-ID: <YIMBmRyyjcchQFhA@heinlein>
References: <YILLjQfgD4Q2vH5L@heinlein>
 <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
 <1F0D01CD-2A39-49B3-9E63-DDFCA3371672@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kQL/TVjKNui0W4iG"
Content-Disposition: inline
In-Reply-To: <1F0D01CD-2A39-49B3-9E63-DDFCA3371672@gmail.com>
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


--kQL/TVjKNui0W4iG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, Apr 23, 2021 at 08:49:05AM -0600, Mike Jones wrote:
> Patrick,
>=20
> We are using spec: Open Rack V3 48V BBU.

Got it.

I think you'll want to look here:
 - https://www.opencompute.org/wiki/Open_Rack/SpecsAndDesigns

> In the case of a PMC, since I don=E2=80=99t know the OCP architecture wel=
l, is there a PMC device in the rack that would manage a BBU, or do devices=
 that plug into their rack each have a PMC?
>=20
> Looking at the above spec, the functions of the MCU are quite limited, so=
 I assume there is a PMC device that is managing these other elements like =
a BBU.=20

If you look at the Power Shelf design you'll see mention of a PMC/PMI
connector.  This is a slot for which two different designs can fit into:
PMC or PMI (and I don't recall exactly what the "I" stands for).

With PMC, the intended design was this was a full BMC-class device with
a network interface.  This would run OpenBMC.

With PMI, there is a MCU in place of the BMC and the PMI is connected to
the top-of-rack switch using a modbus / RS-485 over RJ-45 implementation
like was available in ORv2.  I think the PMI would speak the same exact
protocol as the similar device in ORv2.

You might find details on this modbus protocol in the above link, but
there is a lot to dig through...

--=20
Patrick Williams

--kQL/TVjKNui0W4iG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCDAZkACgkQqwNHzC0A
wRkpkg//dQ8kdZXrajDvs7qpPnXDW2LD/pQDFK+Gpcw9eXFnDbdeLYjysnA4REo1
oD/F8g+C8SdLXsKr4qfZsncg9sbAhOjN+OVZesMaiUQ40obIEyh8zgIv4DxMNnf0
bAW2pZkGoqX/NouFBRmhH2sGG5iHRzige6aTt7WmegQh8/ZwXiV82FGM8bCz0yQo
BBfkB/XMaqZ+SAJlxByY2adjBgZ97sfOgjzsV2fqOVpIt8Yv803ZY0qHbuQ+zREz
DYHqpFLuPzC0pBWRPKM+dsUB/1vWwyI978h+dIalO49f94YchpqRKeLvY0JDyz8u
kBSvCo5mGLanVDo/1pWVKp8qkrrIreMaZt3I2pQhispeLkKEL1Fd3KArkR5nnmjZ
sWXvUcbq9OEY7BvuqVXLSJRIiwPwjuXI9v8PAW1l86/24XQ0ZRPCRPb1RyD6pooK
7nVABKnuZch1tllqFEB7p6xmnCa1H6sSlo1VJhQoYMsPQG7xLN6CrRZwem4KrSzh
8GtnfHHdMCFo5BCqEiP0qGZK7WkXM9z+Yfep5UaEAiFdlNDxudq//ccucTKSGKWC
mrT7MPi2CLvbH3xuB05p4cpm8cCLUX3VPm3D+i3egWCMmQ2+LggpKOmSWNs9hky1
URgHh7UYaQ0WSzhtzErr6NH1GVA0phXroFsF4n0iFpAhcUs8NPI=
=jM40
-----END PGP SIGNATURE-----

--kQL/TVjKNui0W4iG--
