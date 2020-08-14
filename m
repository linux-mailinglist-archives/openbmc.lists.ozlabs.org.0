Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB1B244FA6
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 23:49:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSxtW0DptzDqlP
	for <lists+openbmc@lfdr.de>; Sat, 15 Aug 2020 07:49:55 +1000 (AEST)
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
 header.s=fm2 header.b=NgF4tmaF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aXiEbzCI; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSxsM2y0jzDqRr
 for <openbmc@lists.ozlabs.org>; Sat, 15 Aug 2020 07:48:52 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7F09F4E6;
 Fri, 14 Aug 2020 17:48:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 14 Aug 2020 17:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/VOQ6d7oBg8tT9tNvtQBqGf5LUj
 l8muTJOC26kS1J4w=; b=NgF4tmaFEx5bw4B6nHDT85P+Kc39TYRoRumJz8ZTo+f
 aSFDMfin/9guR+FjnVv5JwPS4ZHq1Jyet7PaMDoyWaqo7ByxSiPBWlV4Ls+6dLGZ
 FrvF9vB5BX0b96GgILSZCdyOERTiWMqfzQ+X7oMIWR2kyNntLW/dBcpi3pSixDU/
 cM3S8mBxLBX0JcfGwkr4tL2KKlKXQXMCbjyxPJSVvMbtTju+gZVMzP0+454oKWY7
 4L8xSt/vTv6/tpeggqKX69C63b/pKKlcNsoBb0MdUJPwf/M6oYQ5D+1p6h0XrWAn
 TFvgnEaUrAC6t+akSPjXeamHdQsLz0JLgZOwIQUjNUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/VOQ6d
 7oBg8tT9tNvtQBqGf5LUjl8muTJOC26kS1J4w=; b=aXiEbzCIa83KQzFEcZ1e1o
 oOjCxXTHsNJZjaKnGwL5kcjJWpB+oTN2Wcxw/zJeSiI4Dd7zhuqbTQHkc8kBNGfV
 k3WF0o4uzC8lY3MrybgYHwPARhlDuABCkp2orYIoIEwRMD8U2qPu38Gy6zZbXaT/
 PNccXTDEZhSzInUS9goPzgfp1D5dVufZsbuWl9bh9XHm2vcCTs6f99cVMnlMOGG6
 7dHffDIWMTGEn360PV+JjGrTzDKlyqNDnLReZkuPI/xZvTF2G4wmTxGdIAKP8VhJ
 X9P6BLsCS13wFgOUDV9OB++BZkuUKrwE339ToGSjO/SPQOn3RiJq1541eroQrmsg
 ==
X-ME-Sender: <xms:vgY3X2Ni0eIfycZzF3sGEfnzmic8yKFGd4S95xy6T3KuNa5E5wso6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrleekgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepuddtjedrledvrdeitddrudelne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhr
 ihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vgY3X0_yxYYAXWAgdsnW9PwyrOTsNuO8Bz51YWnn-XVL_2tep-k3rQ>
 <xmx:vgY3X9R9LxRd8Ot4_cRnzlQ1zFr0hbVN_tq9NMTyLa3H7mVLzmUizA>
 <xmx:vgY3X2t3mF-S9-X8O07iAmxVQ0GFGdkEuo-TkMBht5bTda-KD8YhFg>
 <xmx:vwY3X_ohdPdXW88WIsyXBdhRiI-NITjO-phLkN6MUIBZFnYw-QdIfA>
Received: from localhost (mobile-107-92-60-19.mycingular.net [107.92.60.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33BCF3280063;
 Fri, 14 Aug 2020 17:48:46 -0400 (EDT)
Date: Fri, 14 Aug 2020 16:48:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Subject: Re: IPMI implementation of Get Device ID command
Message-ID: <20200814214844.GD1675275@heinlein>
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d9ADC0YsG2v16Js0"
Content-Disposition: inline
In-Reply-To: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 benjaminfair@google.com, "Mauery, Vernon" <vernon.mauery@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 11:04:45PM +0530, TOM JOSEPH wrote:
> How are other companies converting their arbitrary tag formats to IPMI=20
> firmware revision fields? Does every company maintain their own=20
> downstream implementation of this command?

I'm not sure if this is helpful but our current tagging format is:

v<year>.<week>.<patch> - ex. v2020.33.0

I don't think we have code now that creates this field from the tagging
though.

--=20
Patrick Williams

--d9ADC0YsG2v16Js0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl83BrsACgkQqwNHzC0A
wRng6Q/+J+yelmIq7qhtSJnxDYcmLUxffydTzm6tYAZyTQDsmAnkkQiavxTwN0v7
jKvreCbqBDhPfx1abCwggo4jIKBBXox4Gref/T2I7DSzsZwCQZXrIurUn5kaYkE6
nlEQBqS4mqi6px9uQ9Yya8syIM40DwmzR8g5B46SKMegDuw/m2gra2maB8oue63P
2eOOBVJkgQpgvmRSrFgEPulWSMLdAwRZ08ID1y2dgzxIqD1SHQkqb5poeN9JA89O
pSzegeH4zLzjaTmdlrOiuxxd8vW1HmU/+Ths+biLsoDis88JXrvyXLaznJkj1R7l
z2B4hfGUholwCdZdeZWQTkjVc79vMUPOeyAVL+dl2ReGrAAPuEtoYhLasveaxST1
3XCI40iRZGrcIypjFTxPFHEe6UdSGIJ/b3ZZBdrdo7zdNn76hPoKDKqLnUtynZ5u
PENWvrzxD2ZKOG6G9ueUYSpBW3z0xBrA826Q06BA9GyfIRZbND6FfRtHpSeNzNcS
EDyp36SHNO0yGaOLLSjJTBfg0sUxWgdZM1x0RjZj8Drb3JLjs4ckJ0to/uI2iNbD
R4lDkc4UdqMKs+eYEkcQbjEyevNMdst86rBq9xfU58N0/eOvLyf8b0ed28cyeNYn
DN0X11ES1mIMFPTUWTB1kUMRJDFm9CVhWFeGxnWHykdQakDmPYQ=
=Lf5N
-----END PGP SIGNATURE-----

--d9ADC0YsG2v16Js0--
