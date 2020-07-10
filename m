Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66D21B615
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 15:15:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3D6c0flxzDrNG
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 23:15:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=rfwcLxKF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YlLH2b/9; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3D5H1f3gzDrMS
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 23:13:53 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 07F2DC55;
 Fri, 10 Jul 2020 09:13:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 10 Jul 2020 09:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=m0e6idHpPnX4tyVy6Ua87tugqWK
 05tqd8xTGtrxbRcY=; b=rfwcLxKFOIrkMJbUu325NSpBkajeMml0W3AdPjLyNMV
 id4W4UL41lVWH4RSdLfPy1k44AUlkdgEMbBVnWJby8N5viPmNT5iptpJlctXzUfR
 zsQa6WNUBNskCOHl3a4EuK3Zfn4im8K2YV90+G9nLVzI5vSUEERIzcuEfVDLSJSG
 LXWPLTd96KcVrJZ8iVw5J+UHLHib4lJDg/63T6VsyQgTr5KIWxCNlc9bJd69jvT/
 83B//kwd1JwnFBMc+Cja2AlsafhBh7gfe0/tLktz0LtVRHrlNXIiVxkZ7wNCwx42
 U8ZfbeJlBYd5aJvk6SlLEkRTJyXDnTs+hT6T0O8660g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=m0e6id
 HpPnX4tyVy6Ua87tugqWK05tqd8xTGtrxbRcY=; b=YlLH2b/9zJqLeMxkSZ6EQt
 IUX1N7hEB6o4hIgiW6v7q41RG05HV+Xo4M8L6rb97AomLblc0pUuVVzSN3DX0e7S
 ZSchzw3qqXTF49ziXLfClmjwR8i6a7gt3HGiTgw9AYuF03TGv5tHmpP1Lsrz9V/o
 4SJ4LR7m6gfjYheTa/L1nWlhUU2EOIQAr7fVqxRaQM3FIm6xMtdWBny+A8Zr6/iS
 RmZYqLYy9cO1WfMn9l+jXoi46tnCI/7YbD4EjYV6TsRnlZRMJvM/3+6X80GbuuTT
 DechGcLFI70U79GmSB658khAmU6VUBprNy+DTk6K6v+vPY0SqdDFn/oPP1SVAlHw
 ==
X-ME-Sender: <xms:i2kIX1DniH22s0bgXa2_fphUKqTAbvlEPeO1zPu14F0-nbC9H3NzYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:jGkIXzh50lgsK6CIET-2NriY_1_t8WPhIvbPxCSe0yJfF0tfbBsnGA>
 <xmx:jGkIXwlFhjHLpB5VqiHIlQTqipt7E33HenT3C_N8r5dG7doErd-fRA>
 <xmx:jGkIX_zmYG-MsAVe1IPuHHcddxguAXCFhUzScuuDTrvK1mUCVqjeqQ>
 <xmx:jGkIXxObR-lebdGwp3Rp0kKK9xE59c-xtzus4anxUSePLnGfG0XDVQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE15330600A6;
 Fri, 10 Jul 2020 09:13:47 -0400 (EDT)
Date: Fri, 10 Jul 2020 08:13:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.7 v2 0/2] clk: Aspeed: Fix eMMC clock speeds
Message-ID: <20200710131345.GI3922@heinlein>
References: <20200709194113.12119-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ijf6z65S790CMqo8"
Content-Disposition: inline
In-Reply-To: <20200709194113.12119-1-eajames@linux.ibm.com>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ijf6z65S790CMqo8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eddie,

On Thu, Jul 09, 2020 at 02:41:11PM -0500, Eddie James wrote:
> There were two problems affecting clock speeds to the eMMC chip. Firstly,=
 the
> AST2600 clock was not muxed correctly to be derived from the MPLL. Second=
ly,
> the SDHCI clock control divider was not calculated correctly. This series
> addresses these problems.

Do either of these affect the AST2500?  It looks like maybe the sdhci
one would affect both?

>=20
> Eddie James (2):
>   clk: AST2600: Add mux for EMMC clock
>   mmc: sdhci-of-aspeed: Fix clock divider calculation
>=20
>  drivers/clk/clk-ast2600.c          | 49 +++++++++++++++++++++++++-----
>  drivers/mmc/host/sdhci-of-aspeed.c |  2 +-
>  2 files changed, 42 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.24.0
>=20

--=20
Patrick Williams

--ijf6z65S790CMqo8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8IaYcACgkQqwNHzC0A
wRlc4w/9FiWgcl5pv9+ezIkPBkpQXyERFPcSR36mK+d8Z6qUMi642dwgJdXvitHM
6prkvmTRbCjHg7u5xoZLZvy4jBDwSeprZXmNDOiZzvVWDVg/UgcAlGroE3y7mI7v
axVZz2e6k/H6TY3YFfd1Y3FSAdL/6rklqWqbWDFyDHKEioVsLHkb1USQ1RZmWRA2
DFig9hPiktuN78zqQc+pOoL3TQM1k4RlQAajCdTgSw0Imv6y7NcHWDV8BG/u97JJ
wWFV1P2N9s/jWFnGd41QbeYS0eQ/7uhiUrv5GmTNY/M4Zb07viVL+0UrmSSTpSjw
+tINcgPykRqSWLnV/m1FTubx404iux0OEuFLiBIOswYhHvJjap3kvFM4qSufJ08+
2tt1iw4/vCBCW5SkNLVnD22TeQu3iRukU6g6JACbrfy9YSvyM1WcWmFFudC/puBk
R2AYWOP1MUFppl8yKywKeAZaxvElfMVKKef6yKjTDWLSxwIS6Bi8Fh2xYKCNA63m
V5anzqM0h57FthLxU2xUH0q/ZfdU9WtbzSEzu425TC8PMy9gmViBjyYuJN/ed+Nc
+0Tb+z9oDi+0t/4/FxNYmcnrIqlA7hJTpGaJcTLVSLZowAaUL3GbWBOx0rqWIT7t
gI/wiNkOwPAxgVXQiLIlCOuy9spA8HqVoBL8PIGtKXg3X9wPVcI=
=AQSw
-----END PGP SIGNATURE-----

--ijf6z65S790CMqo8--
