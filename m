Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351254BC18B
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 22:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0knm36ctz3cX0
	for <lists+openbmc@lfdr.de>; Sat, 19 Feb 2022 08:08:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=G29tO0fi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VFm8LGNR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=G29tO0fi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VFm8LGNR; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0knH2FRnz2yQK
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 08:08:18 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D1705C0454;
 Fri, 18 Feb 2022 16:08:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Feb 2022 16:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=AfUHdFMMYoSEy3QTDHR+LpjmknIsEJnQnQiyWH
 7ZNt0=; b=G29tO0fian7ta5yETpWMfRJn6J3SpiQ3iizMAesBEB9YRi3n013bPD
 Zc3JLns5ADozCZL4lMJz3Eia5Av3bbox9kHVQhOkJNu+tKeyHVfdE8lD8spFI9l0
 n48qS3GXtn+20+UyAa8ncO7+0twXrcBUQfR4IfxmKqUGZ0IIs3i5ACxH9ZmiTFzb
 xDrrdaXvcMHVovBFH7KOSgtSDsgIPc/oegtyGQEoflz3C2+FMBmFCZQIveBlHuky
 biUMmma+QexzU3YyBLr6QnM/AUEGIUJg59Z0xOtWM9ZQrbyUOzYN+Y71I34XHZsl
 iXPTeaHUa6aDfyvv4tfB38u+bSpcnl3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AfUHdFMMYoSEy3QTD
 HR+LpjmknIsEJnQnQiyWH7ZNt0=; b=VFm8LGNRpTteoP5RPkCW8Bf9RLbRz+CEq
 spOL3yHkHW2n+M08VviV4RQa7crMmSGNrfRzjPB9DVMprCCDX4NSpXxW9DYfl4lG
 FHv/JQFYX1cAFRajBg3gefKsUCg9mdbf4CSeM1N+/511hr3FBZ1WVqEXSM+OoZI+
 mPm2OGJCcI2AXLKdg1Z9FDMZI4HCCjOoY6Z4VljM+W3QAM3uoOl892+D1T3hubL+
 awxD3xLEFBiTL2fF6sWYWUlp/m2M/xtyThAodqXFteUy7elUop6xocAnkNT7yvHk
 vd1s/ARScERxX6RE0tjCK4JA1AHJaR2xQ9ogyvQaZ5eJGh0jyMOuA==
X-ME-Sender: <xms:vAoQYmeNSHM8WMlPMb9p_j7NfXCOOspBLRZms3rh1RSRmaTCeVB2EA>
 <xme:vAoQYgPb2DnC_ohzU2VTnp0oOGY61iLCAS-V1NASp-DYw2BPjdMWfy4q6oUfzZIb-
 A_yTCWVTdE65HYqwJg>
X-ME-Received: <xmr:vAoQYnhKPu682xTD8g1Z9idRgzZ4vg3RV8ZyRmiCTwov_1iqPbA4KdzE4TA5eWmvnf7Dusc4aTbORLaXTiHEJi3prwiM2iOJ5_lnwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkedtgddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vAoQYj_x8GIcz20umKouKjwug2y9S-lMCvwl012CmR_Rv5RdcHo2tQ>
 <xmx:vAoQYisWrd20_QOIh45a56erzdHlFVYNWkdTm5xImUZhc-MFbBAOFw>
 <xmx:vAoQYqGuJx8H62D8v_fXPBBFbTDF_B1Ekp-e1TOhd-bmb-MVYJAvTQ>
 <xmx:vgoQYmLngMv5v9X9FeIe8t7sFe4XxNExm2eKs_5a7nn_2bTnQGmBtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Feb 2022 16:08:12 -0500 (EST)
Date: Fri, 18 Feb 2022 15:08:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] configs: increasing SPL
 stack size
Message-ID: <YhAKu6NBTAq39ELY@heinlein>
References: <20220218100104.1380598-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+aBnvDINfzQFj6bv"
Content-Disposition: inline
In-Reply-To: <20220218100104.1380598-1-troy_lee@aspeedtech.com>
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
Cc: jamin_lin@aspeedtech.com, openbmc@lists.ozlabs.org, leetroy@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+aBnvDINfzQFj6bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 18, 2022 at 06:01:04PM +0800, Troy Lee wrote:
> With commit 5e8cacaa7096 ("Support UART1/2/3/4 as booting console"),
> the SPL requires more memory. Without this patch, the machine will stop
> execution right after "Trying to boot from RAM".
>=20
> Tested with AST2600-A1 and AST2600-A3 evaluation board.
>=20
> Fixes: 5e8cacaa7096 ("Support UART1/2/3/4 as booting console")
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---

Tested-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--+aBnvDINfzQFj6bv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIQCrkACgkQqwNHzC0A
wRko6w/5AalAB4TS8dcQULGYPAcARwkA5H//keiYLRfid9VOBQRt8ur1JA5eRnN2
mfPWyesqgkgp8vLYraER1l/+pu1wfr6cfsPyULFJ5g337faiNzKJdZs1sVrpOShe
zr9c3lPQxMFQUHSt/jszAhc6YBv7zBpeAnVlJk4SXIOiwRzLyjw1NFQGeV7nn+/o
KgVlWoTYCjOtwhXM8+w7p0Bhcm/wZ0bTG3xA+kKOtmhaJbw40y7EhpHm3gJakonM
M/9i+zhvqISou9/edr/f8GWH66AmfAJWsixjCrjo4RK6YjmvEXGNOfmriiKdIe1L
PWwxU4FEfISJGJMARrI0xyI34a5ygfjqKxEwvmawFqE/slXrELaFoo6GtkaoP2dO
Xi8jrDNQVxhiB+3d1w3paelSGjaT9z0FGBDDkjIQamfkE170ZbYjfg4eZPm2EpjU
6OCr9xfv5WejFuJNGWUUANy4Am5/U/mH+1M+M9ZeAIoQMCVrCeQFYg9b5MgjIm1i
38969oB4vUIQXi6IfH7jAIoyqVbAI4d9jwISBGfJaPZ0C+vGcFgX7FwvAklDD82e
loIF9Po9WKAGX7FVTkXXhe6Qi8gFHb69zbLC2J+2YPGBhSngEgckMgFhg3lxxwez
v3+Nhx9K+lu1Pt8+DJqBjb9vLfU8pRJO6yhEA5a+nkRtNT3+qAA=
=YSx2
-----END PGP SIGNATURE-----

--+aBnvDINfzQFj6bv--
