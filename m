Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E252764E8
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 02:11:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxb7q4s83zDqZG
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 10:11:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=lKJqRNsu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=eJHLmXoG; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxb6t53j6zDqKr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 10:11:00 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7291DB05;
 Wed, 23 Sep 2020 20:10:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 20:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=5RCXIh1mYur+tCF/uTt1VipfDb7
 VokZfk23i2Phtw2U=; b=lKJqRNsuj/v7p/VDC8zG6eaKAjd3NX//JZ3oHDS7uhZ
 K2JJrkQCRq0VdS+qAhCGb3zgy5aMb3af+03o5cXRYBRFyOjyGys/Y/rzdRoVA/Ho
 I/Bdy3eCxpLGkO6qLvzKDLwk+k3OYrJOF4U7r19I5eJuwALAIZ72e6mm/4P2Klrk
 jiDKdhJ42QGth7TZ8gnen3IeH4QHnOpCDfw457CEepwSEr4cqPmykMPLddheAooa
 ZEihnz3qMObIrUN1r+m8hEAjxETz62Dw2D09SOBhbKCeHcSDxr0hPSe0DMwUOece
 YvREYymt/3cPLHIL31bx1kkkSv1u24J+bZLpd1OVEWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5RCXIh
 1mYur+tCF/uTt1VipfDb7VokZfk23i2Phtw2U=; b=eJHLmXoGF8l38frrjCtMYY
 5ePunrEFhSeOQq7QGEg17MUKym09RAZf1m+0Xw9KfMz0b48XxlMr0nTPwbIg0xg8
 tRJaUiH2tfrIpKnT4C8lT3cROqU+lqjvNVC4ZUWxuj+WIJmku/78SlqTAVLxDOvR
 OJ4UBdY0Aass9t7dxWZ59h6qraSOkeZVzM6tn/fLRkNQ33ctrT48two08TMYY5sR
 oJ4vmXQuxu8xLbBajGZQrEX4U8EO8GOwxreXzNPv6O3cKzqzV9bVcv1UE568z8ec
 OmLBk/wzoqPF8zTDk9EwwSQ3OwShcgCVqFXICtzD0IQQSWYH79LkJqM7nrMTCXRw
 ==
X-ME-Sender: <xms:EORrX1gk5SuOUKNXpHJH-YQmKVZ9EEIkFZdoLFp1Pt6a-w9X7igUHA>
 <xme:EORrX6ClTajvdFPFNae9dc18MYlUmHzXPhtH0ZW9Zp8AJD6hsChFTEhtoyWC9lclC
 Sl9BtNQrI_gEuNomYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekvdehudevkefhuedvteethfeflefh
 vdehiefgudegvdfggfetffevkeetudegudenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:EORrX1GdvdL1_72zOD-wvxKyx_Sg0-nkL4JeTRjU4fzF92BizAKhuw>
 <xmx:EORrX6Qtop-lKZ7GRamxAKa1RlzUK4rTAF8Ui43RcF3-c63-SRNhzg>
 <xmx:EORrXyyLgjQUaKg1yGh0CYZYAmgw4L2Rey-__XwYa4yq71Vavnl9Lg>
 <xmx:EeRrX3vsxKs-19-APRNGuk1sBG2Bt3Iev1pEUCRmM-X0LygOZF4K8w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 108E13064680;
 Wed, 23 Sep 2020 20:10:56 -0400 (EDT)
Date: Wed, 23 Sep 2020 19:10:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Cheng Yang <cyang999@apple.com>
Subject: Re: Difficulty booting on Raspberry Pi 4.
Message-ID: <20200924001055.GW6152@heinlein>
References: <CDC90A55-957D-47BB-9B42-4283BB6706AF@apple.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tuYRN1zEaS85jg/Y"
Content-Disposition: inline
In-Reply-To: <CDC90A55-957D-47BB-9B42-4283BB6706AF@apple.com>
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


--tuYRN1zEaS85jg/Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 10:36:03AM -0700, Cheng Yang wrote:
> Hi,  I=E2=80=99m openbmc noob here.

Welcome.

> I follow the instruction of https://github.com/openbmc/openbmc/blob/maste=
r/meta-raspberrypi/README.md <https://github.com/openbmc/openbmc/blob/maste=
r/meta-raspberrypi/README.md>

I don't think there are really many people using the meta-raspberrypi
with OpenBMC.  This comes from elsewhere outside the project as one of
the Yocto community meta-layers and isn't related to OpenBMC.

What happened was that someone had an idea to use a rpi as an
easily-accessible experimental platform for running OpenBMC code and
they asked to have the meta-layer added to our tree.  We keep it in
sync, but I don't think that experiment really went much farther.

See https://github.com/openbmc/openbmc/issues/399 for some of the
origin.

If you're doing just a simple rpi4 image build, without any of the
OpenBMC layers, and it won't even boot, that seems like something you
could tackle with the upstream community.  The README suggests that
the general Yocto mailing list is where to go:

```
* Mailing list (yocto mailing list): <yocto@yoctoproject.org>
```

--=20
Patrick Williams

--tuYRN1zEaS85jg/Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9r5A0ACgkQqwNHzC0A
wRldAA/+MPNKVyV7ldUlOmxDCoHAp6ZOT5jLj5poQHLU8/hF2FDv9y7zYmdXbpj7
uz+FZuBEcYTQ1FGLT/xOD+sgouLMGuFfg6mQZFg991NDrkkhBsnC/b1bmRxu2Muc
UZN8l8hK5oosVwN/AI0sb9Z5TbssD+DY0+1UFMT/vlPJsBCUFE0NHZzPi0oBp/xb
6TUPLRKp5TeohZVN1o/m2Tv3FSr46zDCXAnqK5KSvUDTOg4rrWosy47REU0xo40J
MlVkuuqKvm8FatgfF5eRFAYBmaHdUh7imGB+qR6F5JY5XQ1V7Rb0k3oOd3Xi6n0H
MUrBHyB/ZYryHYMvGmaRf9SL0tWArvR1HeTvKwEohfEwwbOjOAyVWU12Ku5a666o
bmQEwc69sK2HVBC48sYhVcDjXdPmmARijpsw7FneAoWXgKOeL36uzd1o9NXWmWqa
E+xSom+sQcDTEQhuzuMap/LBBsmJnHVYEEuidXQ08xI+GHP3CqcgQEXgISAC+cRJ
UZFy+ZdfJZaAXp99N5CKs0Pn4uZ9E1qefVM2jM9FKZvfaKGLI/MjGZ2v1rNdJHGt
e9MNL+yKDtupObZ75N/F98ozfiqUSE1lXgYSXHkrg6hi+ZbP4/R+4AJ08ktXTJw+
NYfEW39kK1A0trSZ2zb3ubcZq2N7vAgJcNQy1BeKb48AGHNmiOU=
=g+Bi
-----END PGP SIGNATURE-----

--tuYRN1zEaS85jg/Y--
