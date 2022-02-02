Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37834A78E5
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 20:48:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpsmM3tdKz3bcW
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 06:48:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=I27RTCQy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=I27RTCQy; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpsly2Mq5z2xvV
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 06:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643831270;
 bh=5U9CnV/KKYbMvTjECYzPkLNYMSXa+nJQvJjUFVr5+wg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=I27RTCQy/bgZzEkA6IWQWMKZE36HFgsUjYeZ5zezC5GABMebc15NFwZ2aBfqoui4L
 5iD3FT8+ikOyCXmGpHcIqjMBvmiYSZvA85U0EQWv2DaOUzc2O51RVJuy3tSI1rj5a2
 Oh15F4RENCsdyQSiyQ1TzsH2lcMvDoDaU9f+tQq0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9XF-1n6r9514jp-009Av1; Wed, 02
 Feb 2022 20:47:50 +0100
Date: Wed, 2 Feb 2022 20:47:49 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: [PATCH 1/2] Enable pass-through on GPIOE1 and GPIOE3 free
Message-ID: <Yfrf5d4qWBV8KCf3@latitude>
References: <3f326d63-a803-0305-ce82-6d9f7fcba830@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TvWmv27h3/0RgW3Y"
Content-Disposition: inline
In-Reply-To: <3f326d63-a803-0305-ce82-6d9f7fcba830@linux.intel.com>
X-Provags-ID: V03:K1:mDIiro8f00Pj6ON4HMFevu8nEFLV2b7CTdxqSutC13sx+TwhS8l
 muUsWf5oVPx/epJQEc5RU/t7zlS0zNR0NcgSiAZQqjwFeD27a0GSDKzVlekfWcaJxENdI8q
 QQtYS06rofYR9wpa0+IENK61uXr4HATy54TN+tDXjzhASDGP7KJeV9DF9UD0TmULMA+vz/B
 rZ/QXMqS0rgGAXRClIwIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtGGZCD0fB0=:cdzUfMh0PQCmkd3+Enq8tu
 lK+4PQ0J/p9DFt0VVJ1eYCUvvUiMBD7KZPPrYcVJEsa0gzOWm5Gs/WOvjFByu8a5OHDRN35Sf
 DQIrTeYCyr2PAD062pyVzQZOO6yGYq5dD98xH15XQGaQrR9NHwYi3sNU+8wKGX8Mu1ffstuUu
 octjDCuEZCv2IcvpYhKL2r9NVVe5dtgKvFk3OEHCg0zynX1VJEtf/0VF3LIVMTMxXTUtVAFiR
 EEntrJfsf/I0xUFaLPBp2jRJcI5pjFxjWciRrhux+B7k+rys1XfqwZA5ZuW/aMKG9I0yq05CZ
 LvnZ26Iwz4xkXrkAyvZyC77asjGwhwFjETrSwCIMJcFeb2MGynpqvEv2pne6G02w/LL8T7Wtr
 FwASFg/bLEoJpYgM+x8jb/rjXRc/bW6dkSn0rRLkTvmQGFES4Mti+oZbyZuDclmB4BzurxHZO
 /RtYHfj+WbQ2VWF0NIKVa8YWgDwiIMrqNkxMtFuHgV+MCS2xmMKgK/9Mk0pGCX8ydHNEEyCsI
 RHDwLMn/xfQTjDLorUYu5lcas1u8DqQV4k/6Fic4ko7q1lWJw3a5ZeTCpq8Tk7hyEWgxBeIgD
 ZKpaAUMkf1gNohjY9VaL0V2T92iAcX1gLcyw27TnIuSrNuVIjUE4DJUq4iqs6izv3j7eJHOgo
 kVGfwKbmXSwqN5T+3BgGa4bA23iSdeggKoEPEo7gvK/GBbGlnqO/M8/Qb6YKV18XIDwiK8+lD
 YcMCNEwmW0nrtqFoDej2PrFlM+SuOtYHEsUtzeUX7Zchcj59HUvPj3zbGcdQMNU7zI/A056Nz
 bA9wLVwVH1ndYrIhs8TDDSDXtTIoNcw4QpqFS5oiBJcu6wh9ZNSUt5+O3s/+7b410wNRyaVBa
 iWgz7OtjHFQboY1sMeKEWT2702KZCsb8XSa1EUg8GEQlbUf9CV1/snP6LW3ycDBa/gJC6rq4a
 ge3AMvzClXIC+RYbIMr5NCZKPrqY6GoBHX7s71JyS+Mi05Wx11rWShOpJ5cDZAGJd6mOEYPGC
 PKfefw9wlIhWc+k1oh4QGrJdxTGjM+N6OJznHLwyJu8pzv3tuzQuNBM8SMcJUtY6bfUwHACMn
 nJDXVNS7dh7LCc=
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


--TvWmv27h3/0RgW3Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 02, 2022 at 12:41:01PM -0700, Bills, Jason M wrote:
> From a511f72a6514e67ee332715f1950140be528f112 Mon Sep 17 00:00:00 2001
> From: "Jason M. Bills" <jason.m.bills@linux.intel.com>
> Date: Fri, 3 May 2019 16:12:39 -0700
> Subject: [PATCH 1/2] Enable pass-through on GPIOE1 and GPIOE3 free

Please use a prefix such as "pinctrl: aspeed:" in the subject line.
This way, the context of the patch will be clear to everyone who sees
only the subject line.


Best regards,
Jonathan Neusch=C3=A4fer

--TvWmv27h3/0RgW3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH638EACgkQCDBEmo7z
X9skZBAAgm2i3PwQ8KeA3UXv5Smptg5Yax/UZ6eWOmxOAsiRhE8eDHOeGszVGaKe
jeC3wHVsufyUQCPPRujDu86wYTkabm9wsrdRivDlQWCGEKHY3VyREzIGZ5Fr81lg
YzRYxd04Xy5e3CyAktzwrcUVlkbXp3ePRREP1dO2ztCyznzy2kS8g8s4r9/9ImSa
cFQ35mzMh6UqivZV+xJ/WVxebmQMP1klDqUBbhSNqNedPx1emPP4jFGahY5GsLhK
jlp6alq2rXgedcfYPQjOIz25YQi/ejLegjR15RIAVc9g3u+LuqPgS9Pb9bHi6LPF
xpjx/Y8G+60mBjsYKBZShn/vQKjkMc/lZQX8r36LqqChejKgh3RQQOWumIxoQUep
In/ICuaVfpJ0OO3HN6yyLw1MxXkYCHWsbVTuOn+WbdIS9CgSRvxcsVXJhfHxgPoy
4atKn1Ch0j/DGk2rngfAAJFeir+YT3obZSrJ/kxKdOdXSnZR3ZXgzxoNGW9h5HiX
jWIGhV7mxSHJDCT6v1uINZAyGhg9UvDwrNeE13+tCJAyB6qVtpv28dmVBUaXLO1W
//rjFyc4eyX0MHYMaMsoqFFXxIRoxPNaRXD89hWYsctvV7JuWF8thkqPWOGiJhLX
U8zSvo9wYTGwBMRfzL01NcEetWLAKIP09DWmO0ddqXiRygz+bSs=
=kCQe
-----END PGP SIGNATURE-----

--TvWmv27h3/0RgW3Y--
