Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A024216D5
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 20:54:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNVJC3K2hz2ym7
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 05:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=tOXx6cH4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SdPuX6ts;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=tOXx6cH4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SdPuX6ts; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNVHp3M1yz2yg4
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 05:54:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 48B6A5C011B;
 Mon,  4 Oct 2021 14:54:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Oct 2021 14:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=QbGQ0IhRhM4z8WlciGfECLF9pbW
 f/uhnRjd0Mjd3qHw=; b=tOXx6cH4/jGVp4huSKTPkCTG2iHMGDn0Mas1qgVIrjM
 tOWd187kkMgDE5HFGkSz53icQXO/E0Lf1/UcEX6lr8SToGnw0gbF7cyNoarpaJr6
 btjsQ/pnl0/26vWjxXDcfCFkQ+79aszoq3tCWsi2/eeTb/17MdfJazQXGNgW70Ty
 UhYSghRvZ4KZt+TYew1MVQbFjDm1wcxpJtWvhbYQuiGxf+oVtAbbUeyWRswWbcNk
 HIADyaVdSdcg2evhxyYYXTa3EHgU4awq6CNvjOXFLtDcSnrSAFfJfZM2vN49+eAK
 tJX+RtBmA5rKfnCEDr41hprcJgSLz3NJ1wo+kyHULpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QbGQ0I
 hRhM4z8WlciGfECLF9pbWf/uhnRjd0Mjd3qHw=; b=SdPuX6tsMnk2lMMKFOEogu
 MI1ufat+Av0kLUCg/KknJb5ZjH0wgXNI+6D//nM0yICxEARqN7yQXaNbggwzD28Q
 pX9F0NVvbyuJoZvY6vitk4ftaIrmMjucfKwLbXaYAEKnHuYfDOMnlVaCLzDjljvc
 uZEBHKKhlllMRUDTsc+QBT9h5hGpvbab1tdhF/i6xjpEK8dw6sazRPFl/Fz+edHu
 HULpbD7kRjvUFGIhdBBFDU6N5ekmlPC6r+bRoti+9flgVjWOFVx3HFyX4JdIIw7/
 tR8GcfYccaXRXqgrhoyHPzwShoxfGNXCqOkavhf3rRAGJn85Fd3sFyf2mJszNwHg
 ==
X-ME-Sender: <xms:y01bYTuBTuHJiaSmFdhl8H5W5XYE0rzh-9auNLbseDn-3p6_nQNHRw>
 <xme:y01bYUck4goNfvqy6x_-b7_wFbGsstd-UrzLFQQaGcrNLhgAfEAgSNdmtjR9dzL6Q
 Go4bF8vgVGvHk5FFFY>
X-ME-Received: <xmr:y01bYWyUtckZYyKZaVBMGyyzR2e5bre-mE-NzVKiHA_TBZma4TfWV7UHFyftP9BxQk6S8ffpWhixW-awM-gnbpsbWxiwQ-KtokSpTKEF8VIsZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudef
 heelfeehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:y01bYSOmHMZEnmKc9q-xgQzsCol92u6Qk4Nqdyfl7eZE4sAHOJtMvg>
 <xmx:y01bYT_z_dUUbvv7Z3g_SPgSXPgZjAs7r0xT1xBAt8t3KWwMTjEXeQ>
 <xmx:y01bYSXIpab8NcJHRt6iSvklXcj8PIhJEmMs6T_XJpYhlhisnLacTg>
 <xmx:1E1bYVKJtlVrVQptZ1eJFNgkvXQr4MPHrTeXAgP47h4MILPnFq_4Yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 14:54:03 -0400 (EDT)
Date: Mon, 4 Oct 2021 13:54:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: aspeed-adc driver kpanic
Message-ID: <YVtNypUnYfp/kztP@heinlein>
References: <YVtJTrgm3b3W4PY9@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NU+qcW9MQq7+i/dl"
Content-Disposition: inline
In-Reply-To: <YVtJTrgm3b3W4PY9@heinlein>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, Peter Delevoryas <pdel@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NU+qcW9MQq7+i/dl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 01:34:54PM -0500, Patrick Williams wrote:
> Hi Billy,
>=20
> When I run the latest linux-5.14 on QEMU with the Witherspoon config, I e=
nd up
> with a kernel panic[1].  I think there is an ordering problem in the aspe=
ed_adc
> driver. =20
>=20
> See [2,3].  The code registers with devm a pointer to the prescaler objec=
t which
> is not yet created.  I think it is possible that the struct value contains
> uninitialized data as well.  Can you please take a look at this?
>=20
> 1. https://gist.github.com/williamspatrick/4a0f0d1e0ca6f54816461a8df09e6c=
b8
> 2. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_=
adc.c#L513
> 3. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_=
adc.c#L527
>=20
> --=20
> Patrick Williams

Also, Peter D. has been working on getting the QEMU code for the ADC working
and I cherry-picked his commits[1] and the code gets farther but crashes wi=
th
what seems like a memory alignment issue in a read at [2].  New gist of ker=
nel panic
at [3].

1. https://github.com/peterdelevoryas/qemu/tree/adc-support-v2
2. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_ad=
c.c#L248
3. https://gist.github.com/williamspatrick/76827c99e2db8fce385b9a87f7526d33

--=20
Patrick Williams

--NU+qcW9MQq7+i/dl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFbTcgACgkQqwNHzC0A
wRkzCA//RT0Mi9Y2zW6isPyZrvCBniJ8Faeb7TphlK7/NXYzfKz7Z7fIRtnZHIGf
6KlsYRaI6US3Z3S6+ivnai5Izu5KY3lD0QbN6UFNDxVqTOOEGY8y95EKAJ3s5rFo
EkYJL6TETcKBIVCdK74iuNB9kcNT/ovxBPBLOOFc3kZCqymr1DRr5BQkWedsZvCE
7ByBVwHG5R/ghzkrOeQoyLGd/c8j5RMBEUjql8tro0O8shEKrcGAHcZGBZ7bL1jx
APCIcEx9huhikgZH/McNBXNvD4BxnyCpruhp1gWKC3SOUde80irbQMFp884Bub5h
CPl9ah29q+Oj6f2Ssb8swt7t69AU2pCj0jNezIt+v5zibGdhhR4l4YxjQgkXYOlE
XNd422u9GN1STLkbOobqkaFfRc5N4A1nPQew4d52guehku5tBcW0ar2kXyzArUQw
OmAqeJ1TEReDz2Nm4nAvmuxcCoM33qH0+ctV/BEV5cMvSDfMYiyK7HujHLoZARl/
20JG92+sZPgV61qS8wWGoDwLUxBLn4jom9aUfvoKK50ArQfpPBmlAzhvGyzOGtRi
lYndIjgs9sKBfNvGJJkhcuM8+AZSlLpzDsDLJ5tgAmZgt6KdtqhlgnWiaO9xLh/K
h+fQvx5bylz2yk5czmrh/A0/yYFXOYtT00pT+2cKr5D1HLVi7L4=
=PhuE
-----END PGP SIGNATURE-----

--NU+qcW9MQq7+i/dl--
