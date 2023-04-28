Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C826F1EA5
	for <lists+openbmc@lfdr.de>; Fri, 28 Apr 2023 21:15:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7Ml363mWz3f5N
	for <lists+openbmc@lfdr.de>; Sat, 29 Apr 2023 05:15:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=g8Rj+06F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=g8Rj+06F;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q7MkV75LCz3brK
	for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2023 05:15:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1682709309; i=j.neuschaefer@gmx.net;
	bh=OIUIhU/6PWDogQO/lmzOqywaW9TBLhjV4hyEduc671g=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
	b=g8Rj+06Fzsk+0BdszfBBVPG+nDIQ5FTAjy8r/+IF+mWE2ZprDTMNCkjnRWpOw3gNv
	 aMxNLtbOdKPotd4pUMLpUM6MpxmiNtYjrxFWMd2t3I7nF06QwmonqRVYCu1kiCO3Jr
	 jwX2OjQRRhpGEORW8puWEsCek26rQjhzDtU7zyZiiXnXe27sKzpcM95ruwb3xtSZ3f
	 jGoHdAxmvP6jtwrYRnYCLlmsQwpVYj3oY8hhjwnz/Vcw8Byi9rjIzRzlGjxZXVeIW3
	 Mh3tJNBUJS6R93sJVlUtYO2ImeCXq+ZF9YUG60kyiKPA2v/qoLrwJL+vkYvLwzXC4K
	 lGLCl77wMqpbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.41.149]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1qIZFT3IZy-011VAF; Fri, 28
 Apr 2023 21:15:09 +0200
Date: Fri, 28 Apr 2023 21:15:08 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>
Subject: Upstreaming Nuvoton EMC (100 Mbit Ethernet MAC Controller) support
Message-ID: <ZEwbPFW5p6jB0kLR@probook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KCaJrWtlOFCFs1Oi"
Content-Disposition: inline
X-Provags-ID: V03:K1:ttOsNeBbzFq+MeMP1kegUIZc1rpPyS9ec03eqVcAD3ejw4J/oiI
 yz+FdvacoVdraxU/5dCEgOwvTJYi+vrN+BXzetiiQRNThLBE6bxpq4OcvosSkYrIfptO/pt
 CLh2lwIN0xzHvXnvDZoCZA83Av0exxoSlhejJGPaWThhOabKKnr8Uu3izwYgnVFVsx/DqVC
 XlCTOw9Hmn9eQku0l5D2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uvyANSMm2M8=;1QyN2DkNVMrvHhsPOQ5gn9ru+QF
 /XR6ej5oInLycrrOhqVcg72BUyzBJBAlVVmC7v1uSDNzset7aABXGNjjoB6CcVCJE68BKfo93
 n/3Zl2tqk+IT9RWjn/TyGJhwTsVYR2R0n3IsfBj+62hktDjzz8/dMSyA+AewskhmRMONbYqzK
 QlsIo4fYrcIYfWyqXATk40E5cApQS1FdzRzUi4xUdX0/HmXBh3FIIbGm4mJ9tGC91xZTPbsMH
 hfSXeh/fE7FgETMPMR+tgLVDxHtOUJo44fYcv1ZQOL7Rnj7tCcJjfO+SRCOtIyQrs++trvSJF
 wGCkO/N+NiHreZKu3pe8SpvHtAe59VaR/Pg37cBDnjvm9bqQHfF9pRHYpd0Iatvii4rf0MvY/
 6ie1GYxgcKY8Tng0amt7a2QfTKrjd1yIPTl0Nb0efbnu/U6WjLTlAVi+JQu7fc9LJ2+5p1UGs
 ozhqvNuzueVezmoWiBUAd7NeiROY/bDtReA0tuLh8JcjTlTJqg/4vi36A6e/BKkmD7LykgM8Z
 e9bRBBg0LMqylOiBUR+v9Cf3GOLdu3E4nHmHpMa60DQybKNHhD24bfJfm3MLKz0Nju3A6HXHB
 BVTYD1mxTnfZbfx2I+v3dOMgIDT25wHGy/Ah/uLg/XcKAsruj5CtWuq7Rgh9ounhSJhdNHbYs
 MQ1BgGIpbKliwS7w/Evns6ef24LOcFsvQFXdxnLZjxrGoJhXtGLLIkv8fIHxxANg01dS/pgc7
 BUPatQwNeiG20NkdrsUd8LyyJOHoYmnnPaylU2qwQTRPPOruPSrRQcjEo+cgxS0wp+hi2+fq8
 PZn1+yChRlzesZ5O/ztWuA57TwR8zsTkNQTuDrex7mNwhhEOcmmmVTw+Crxm41arsMkIg4JUz
 Ledkz4vP0uzkDKmuGPXgYp5seE7Lkz8s+yBHf9hpjadmaHE3mPPL7PUaillxuK94nZ6YFQxPc
 2gcXCw+QaNIUpwKJOLIdzsbbP3U=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KCaJrWtlOFCFs1Oi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Avi and others,

in my ongoing project to support the Nuvoton WPCM450 BMC in mainline
Linux, I have reached the point where the next useful step would be
Ethernet support. The WPCM450 contains a Nuvoton EMC, which is also used
in some older Winbond SoCs, and newer Nuvoton NPCM7xx BMCs.

In my downstream branch I have a EMC driver based on the W90P910
Ethernet driver that was part of mainline Linux in the past but has
since been removed. My version of the driver is heavily refactored,
though.

Nuvoton's downstream repository[1] also contains a EMC driver, albeit a
different one.

Is the Nuvoton BMC team interested in upstreaming EMC support at the
moment?


Best regards,
Jonathan


[1]: https://github.com/Nuvoton-Israel/linux

--KCaJrWtlOFCFs1Oi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmRMGxsACgkQCDBEmo7z
X9u08RAAyGjo5vNwzJCJCz3WNF3fmJYVY59g7MiM1pbnnMReym3hB3+4VvXqhJab
2Z0UaAg7og5xSWCLVUrDYP9AAQSTYTzJ1BT/Ni6WR8L+D0tBnRmYZBMW0bB5BSne
qEbFFsRvpMG2UZbVPzWaL+iDiM8bwGIegfejO9rn8g1K0l0BIBulYXiwGuXcgGwd
h6alcKh6GNxBWy7z0nrOsl/gbpbeB6d1AoTMwX/Q91rQu0rug63/aUn/q+9gFeDE
5Itza1eSYIJVPeh2guLd4kcQbNfSAH/oECxbygskJaMT+RVHda/6EmHAQgskyfvI
zWJ9HwTEbfrJfJCl4UJk2FZjz7BeIajiNYtTujcEk6mpycygw0RFfyAejX6sKL7k
Dn1wVUHxjj5jEvEOrFrHyQQxn385a4511c28yyWafvilAi3e0WkE1iCDpxfHhS6u
OaZSKrabDmkinnp++A4KfE5ecrB0AAodndKRpMqaCHeYbaEpSEijr8zOOd5SdobW
vJqsCJ1duJPtgR49JW3bqf+lDv2aLrecCiGJDeLItvjBycfQU2ThWfJUA+xNXoql
GIQrBkeiESRCgqU2RMCMkbVkxYbFsVinG6JpZNiCCmaXV9HQe2u9j3bKXesGotXw
EtG+enuW6abXVXiUovs1ffQySHc2CPmqo0st431jpafvdzHschs=
=aAJp
-----END PGP SIGNATURE-----

--KCaJrWtlOFCFs1Oi--
