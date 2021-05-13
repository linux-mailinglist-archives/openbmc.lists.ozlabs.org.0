Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B737F105
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 03:51:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgZQJ23vcz2yYL
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 11:51:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=dno5jdE3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VhAJxSAs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=dno5jdE3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VhAJxSAs; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgZQ00fQnz2yXw
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 11:51:19 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 40115F98;
 Wed, 12 May 2021 21:51:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 12 May 2021 21:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/9r4XUy2YFhkkydx4A0ZhqNbJIy
 7q9DiVkFQCtibwSA=; b=dno5jdE39R3Sgusb58TH8bKyoaXSQDzGgfd/bUiNSsw
 mxepXTj/WaHWgQiyUTvRWVEH6Ft0swm28ZDHKwOYikZn+z4mXS87JyTMrK85spKF
 6JbHJLxPRdg8eZ0LXKv+LQRpn1tMa/0OQGH+rERBAd+aawxZEJTfgOFqixWNtEIK
 q+0DEH6m424L3ez7+WRmvqcHidceB7Eh4U79Q0JSxAMy03KI4cyazG5GQV6KwNAz
 B5ii7Fna0bh4cHBDXY01xBOEkntA1t5FDveIlzXCdR3Yppjh9C7PxY6N7+9omvmu
 Fr8x/mKsSezbdj3gv1XWRnxBOlKEEySNmXt1HOuxFIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/9r4XU
 y2YFhkkydx4A0ZhqNbJIy7q9DiVkFQCtibwSA=; b=VhAJxSAsYtj4IKaA3MRGoH
 C+OQoqk3MZTTpQxRJcBAXrfF9jFL7L8zMF47npx76TzRRR40+x5DQHRj0OtWmvX0
 bYN/J+dN8TK2RNSR4PNJAeVB8fbz9JAHrDvQuGz+N9MCQ8Cy3+AAGPDEG/TQ/3C0
 LNORwE35WywwMQsdX+d6/6MPGaGPr0P5dQGQ0LGJNWoNlGqAopDDcUJsprI2uoUe
 UekbA5bNiBxzfq2I/lat4La/7dRvFNv7nIo5dQ9soClOYTMlsVGFEBuf06dlsv0b
 OxUpDlrRUGJJHfWBr7GuUgSZdUwTiIl/POb3dkuYOzXPevdoDp41rgQeYLkIat4w
 ==
X-ME-Sender: <xms:FIacYJzeP0ZbQgsG77a-2ZAgawO6V-ciao8dt4cp9Qp0Z5KY3OGtBw>
 <xme:FIacYJQM-BLCaUonrZ7xwEEc-2fun_GOXt_3P9srUs1PXnFlc_kvsHRukSLLTl6hH
 w6OHJELFc256hZ8gmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdefhedtvefggfetueelhfetfeej
 ueevueekudefkeevfeejheffvdduudeikedunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdptghpphhrvghfvghrvghntggvrdgtohhmnecukfhppeejiedrvdehtddrkeegrddv
 feeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 grthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:FIacYDWrutbMzTxzf1DBWBHTeiSvqxF1Z6ziYgN5FkpVYIYUb_NJDw>
 <xmx:FIacYLjvCzMGizQYc5LA5xdtJG7BjfWmTfMkic2sLRnwZPuHz3_EZg>
 <xmx:FIacYLAlWD-epr21wI8bGy7xPhb0cLeyDpsceeLrifoQ_a_WgCf9JQ>
 <xmx:FIacYO-98a464Sm0YXRNEEZyxjg8PDWUbdAyEDo4xo4AA1h5X12qAg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 12 May 2021 21:51:14 -0400 (EDT)
Date: Wed, 12 May 2021 20:51:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: Use the right values for CODE_LINE and CODE_FUNC in journal traces
Message-ID: <YJyGDAcEtdpcC0C1@heinlein>
References: <CANFuQ7D-ujDJ0ZwE4QEYRPCSM78d3SdUuT=pB2Fk3t18QMr95Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/Ck6Quqz/AQDf3n/"
Content-Disposition: inline
In-Reply-To: <CANFuQ7D-ujDJ0ZwE4QEYRPCSM78d3SdUuT=pB2Fk3t18QMr95Q@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/Ck6Quqz/AQDf3n/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 02:03:19PM +0800, George Liu wrote:
> But for the log method, has defined a variable parameter, so it can
> not receive a default parameter again.
> link: https://github.com/openbmc/phosphor-logging/blob/master/phosphor-lo=
gging/log.hpp#L157
>=20
> Does everyone have a better way to process it? Please let me know and
> we can discuss it here.

There was similiar discussion in the past of using source_location to
get the real file/line as you suggested.  I don't think anyone put tons
of thought into how to get it into the function though.

source_location isn't supported by GCC until 11 per [1] and we don't
have that in Yocto yet.  I know I was at least holding off until we get
that to do much experimentation.

1. https://en.cppreference.com/w/cpp/compiler_support

--=20
Patrick Williams

--/Ck6Quqz/AQDf3n/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCchgoACgkQqwNHzC0A
wRny9w//RaOibSZWrBvifRosqqp2ZwOIbVGUvu3ssJGQR4vipZPq+0r4hhFe9aFg
yqAyYtuLla1DyOKPFf7ULmTApF9InBqu0ds3gSDMf1HAk65GnQUyGs5nYp1mxTma
UA3ptb5sNR5X3IrDQOUqJ3l/0U/X/As57o1JIKh4agbgaNRgLJ+BtxP7a0iL6hK6
DUX0jMgjHezVWdJ8BuqDoe21MIJ6+ppk9IGG3fQPGAeaQOl0MrjckoEiXWuEVBbZ
xWq0iXuNsLmOJ5pKiyrgUvZEDIv2xv8bIBv8Xaj/yfZPxPGKXhk5uhJil5sFCJpL
0FQz2VbJl9rpUK38SL0vcFEl1NT96lAwSF3BbooybDIIwAFfrZ69yXoFkKLt1mfH
GoxzClKey5DFnV87P/kPNP6lF7KhEXJZ+7NqPJ8+FvuC1OO8VQ8qLEZusnUBlj7P
+ePxbcKZ8nLcH3+eZMm8g/Mpz7RTLfZEAlKF3heBBJZbDxbr8SRC4X3s4Sju9hVu
zk2LCqS2kfBvF9zZsGBRttqrTQ0wkNyHSDBURP9FWlImE1vmRU+FzSmp/C+/1e0c
hlyneuVDpQv5rR/AAK/0tuLEmJ5vyS77w3UDtgmvLHOX+pL09nX4vvryiEsCYZf4
QAQuuHXGbHnIjJkQs2/jpNPc3lTxN28XlS601Gpp4CRiSbcXaI0=
=Rf7o
-----END PGP SIGNATURE-----

--/Ck6Quqz/AQDf3n/--
