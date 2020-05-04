Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C811C3F46
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 18:02:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G7106tWRzDqXw
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 02:02:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=HODRCJbF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GrZweSmn; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G6yZ0dmjzDqRW
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 02:00:36 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C74B5C00DC;
 Mon,  4 May 2020 12:00:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 04 May 2020 12:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3Sh1KeegqeDyjTUVAbLJGnMT1q/
 MYRHrW9TQR5rf/yc=; b=HODRCJbFtstpqKMWJqg4wy7iTYibN5tKfPpSks4IuBU
 kAPP1eaRyxaaZV/M/cFNCqilsDnmZGr4r/AHQaWnq9sRE1RADX/l7D98Ks8ozQo1
 qD4+PtgjWOok8+2XdkXufeISUCdYCzANolGWOtjoi2i92DsbeRa56UwkvGnXmIRb
 BxRKqs1ZbJB/zxVMFwB9hd6A+lBvjE92AlIUo00jvgbkc/yIGoAc0FfEU21gmJG4
 bbQ90Xb0RIf195YPFPg/X/o1GLco6rbFRvOOF51//KJhQypeRaMWuVgEAbCVtq8a
 ZxC7jh9SQxqE9qaa2TXoN36yH03VxhsM9ZtYKz1uy2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3Sh1Ke
 egqeDyjTUVAbLJGnMT1q/MYRHrW9TQR5rf/yc=; b=GrZweSmnTw1WsWPHfUFqvB
 3U52wNqQTQBpGxBnHEIBFLuSzNP6fZFD7py2dLnwu08U6HykG5AxEHgoQ/ION81S
 9dePDd50v1PQngoTg1d3WMD2nE7u53lg/KHH89YpzkPV9VquUn4MzdIaAqjnhiJO
 5c3aF826II/b2mT5vJxqOA3x1DCS5o7S4iPajS2qafhqEAB197eHNwoBZxe5fMKJ
 H5yTwQXfCsahFiIkRyrsoJb9NTVvb4EquNihskHzFVfPbCS8e0qe7llS60hmFqcG
 kGAz/fPDmTa7Mr6Dr7N4QdA5zyZUFGhXxM1iZzfy0T73AoWjG5EgjC2m1ArY5kQw
 ==
X-ME-Sender: <xms:HzywXhGRpdQ9bAPYM3Bd_u40-IOKxS-zVEb3qPzaHm39igKn6emfpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekvdehudevkefhuedvteethfeflefh
 vdehiefgudegvdfggfetffevkeetudegudenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecukfhppeduieeirddujeeirdduvddtrddutddtnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:HzywXir3KobdmW8s4dG9kQDjlmD151Z8uIHzAFw6VgdwyZTfmoWA6A>
 <xmx:HzywXl4CEhDElT5bU-KtJTTFcK94iq8a2why1T72g_F6tzy2cf-J7g>
 <xmx:HzywXo4VB5Hrzyt_DFPDj0g1b7SRdcVacY1-QAksfI3aA8ZusW98yA>
 <xmx:IDywXh2q3Vhwcyg-1rO4I1kAmTU-_WY6ZPcZR4-byeSoJqIHAPEC5g>
Received: from localhost (mobile-166-176-120-100.mycingular.net
 [166.176.120.100])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B3E8306602E;
 Mon,  4 May 2020 12:00:31 -0400 (EDT)
Date: Mon, 4 May 2020 11:00:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= Regarding power control
Message-ID: <20200504160030.GA7000@heinlein>
References: <HK2PR04MB38261661F9BD9194120C795CFEAA0@HK2PR04MB3826.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <HK2PR04MB38261661F9BD9194120C795CFEAA0@HK2PR04MB3826.apcprd04.prod.outlook.com>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>,
 Jason Bills <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jason,

Can you give some suggestion on if this is something where
x86-power-control should be modified to support?


On Thu, Apr 30, 2020 at 01:58:58AM +0000, zhouyuanqing8@outlook.com wrote:
> Hi Patrick Williams=EF=BC=8C
>=20
>      My board hardware is connected to CPLD through I2C of AST2500, BMC r=
eads and writes CPLD register through I2C, and then CPLD controls power on =
and off.
>=20
>     So, I think The x86-power-control implementation cannot be directly a=
dapted to my board.
>=20
>      Please help me to suggest what to do next, which can solve this prob=
lem and adapt well to the code of openbmc community.
>=20
> Thanks
> Harley
> ________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Williams
> =E5=B7=B2=E5=8F=91=E9=80=81: 2020 =E5=B9=B4 4 =E6=9C=88 30 =E6=97=A5 =E6=
=98=9F=E6=9C=9F=E5=9B=9B 0:04
> =E6=94=B6=E4=BB=B6=E4=BA=BA: zhouyuanqing8@outlook.com
> =E6=8A=84=E9=80=81: openbmc; uperic@163.com
> =E4=B8=BB=E9=A2=98: Re: Regarding power control
>=20
> On Wed, Apr 29, 2020 at 01:50:09PM +0000, zhouyuanqing8@outlook.com wrote:
>=20
> > Regarding power control, I read the codes in the following two director=
ies(github.com/openbmc/x86-power-control.git & github.com/openbmc/skeleton/=
tree/master/op-pwrctl). The power control is controlled by GPIO, but the po=
wer of my board is controlled by CPLD.
>=20
> The x86-power-control implementation uses GPIOs from the BMC, but those
> GPIOs are wired to a CPLD for the signalling.  The CPLD monitors the
> GPIOs to know when to begin the power sequence.  This is what we use on
> Tiogapass.
>=20
> --
> Patrick Williams

--=20
Patrick Williams

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6wPBwACgkQqwNHzC0A
wRnr4Q/7Bep2liRYIInGuvfoGAhVw2lre5czoaKdhWTAlpOtI3ZzUih0BmITVvte
mb6MLqa0uwq9Ylg7KZ0r6mNIAO1ldVj+26D8bQiluVF5Ta1T5p38iFhB2N1dHEn6
fS44Jtup0KszFWROBVq2tlaUeXd/c5eQM6NUZLeVUff3ky07tpGJmLB417Ra8rI2
X9thIWBTlDekJ7nUfBg+NnWLn9q2izljFiOKzrcUbV2Ubvoq4Dm3PwqIN3OgB4pP
/tnD36m1UtxTP2GuCVo9B3yG9/lv6CRIPOTLDW++ps10n9s4rTaL8RWDQBegwxYJ
YIpnQTA/tI5An8qBPe5Pw+5AsiNf/ftQ7Caj5bdgeUU2nm/ZPRX8xG14vvVlt/3g
Gtp9QjrRnr1RnD0LoJ0eBTvgsFZaGi+fzfN6phUVw+NBCBAohU0MmE/bd7VgWEjS
LdOufHa9up10NpDepyqjd912a9j+aRhbE/ByEByakGCrh/2tUgKMrC0ay5/HkfDy
IxY7+vyRUuYdP9P5PN7xamyXjv0IVHVw3GHtpRyy14S+kmTabRPWQ41y6x55BLBJ
DE40Yf05JVPisNKio4L6UPknUSF5K19xGutw8tt4bzNpOZyfgGJEwinuzXrMbPht
wubPF8mcqrx6yk0pdA1PLlK2+cqrXqTunOyydDGo/rCantrIr1Q=
=ZNsm
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
