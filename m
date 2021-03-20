Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CFD342F10
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:47:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2qWS031Bz2yy9
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:47:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=NSfDKI2F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=NSfDKI2F; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2qWD5Mpfz2xYb
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:47:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616266033;
 bh=LuOjfQRBhHaxebGkf9teuGUSZn3FEqur6K8tG5qXzbw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=NSfDKI2FYEv4rlvO2c/VGEasauxFNeXLDT9XBpN/3AGKYEkXk1HANVmi9TSY2F/kL
 GjCctfv90pKvApD/4WbtMi0wbmDbhjsX3+mxFPMxeTDifaI5N1wPGVyvmR03ygFqWM
 qhW8824Xkj7EPmfOUL1cE0xlygYfIwHmVMdY5/Ww=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdefJ-1lxIQa02AD-00Zjd1; Sat, 20
 Mar 2021 19:47:13 +0100
Date: Sat, 20 Mar 2021 19:47:12 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 00/14] Initial support for Nuvoton WPCM450 BMC SoC
Message-ID: <YFZDMN2Y45LywFhp@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u+V4Hm1L7gfdagCz"
Content-Disposition: inline
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
X-Provags-ID: V03:K1:o8+G4TVvh3KdxtyWxezJR3C4JAolmncFVIJVLrEkLtrqwecWd9p
 OKjY6SZZo2QXxEEVtO6KvB7rqC/AWy3Dz2rUOQSzYZQ7ZHhIeSTOpJ5AoRmsIgz5oTc1Z0f
 lIWHXcaBN+nrI0MYoFR2EoRvuwOaAjt0oZT1ven8FiZMt+Dx/xHZeh52aCR8t/1/zeGck3P
 Xs6+KWaS5T/bY4oJIixYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b093PQXZp68=:pheTT2yS73H0mjRqZcfJQY
 IhFsMWInNOs/KEXtpDqYKZifUuzPtcwNtPTta4TuDqquzixrDL1kasqRk8D1VIqljfYO5nRAz
 lMy2QGXAjp/f4Ich8q6Kzu23I8BZIA6ULqG3/JXDCggWQ1et7RF++BPdWtuV3WWi8dNZEKSF9
 zqvTEu3W0y6QlT4CM470EpNXCEtKWdmmEal0u6LoHsYAoLA7vlTraNRthvL1RGeqDUisIt30Z
 sxZJu7X4cXbsqqwf8T3iu6bZ3g04tFalZZBdMiwvv7y8U3S36vOcvQDRR/vfkndD5F3aKxra9
 0Rtl0nNK7B06RrCPkIp70dbks2GfQhBSu6toZmERZu83gwKRJLiuUnQozKWQTudeugEz3IyjU
 EVvbTNQfJrSa2ZeebLS5Ld+BHuqWwR2+tekgG+2XqKiZIupSOEN5cfQHNPMPea0eDwnmv0y4I
 P2SnWvEHJV/qKqr2LjOjoddeahuPjVDqCLAkk7lopjeO1STYrDsKvRJkm7ZIGAvaQaKDkWGBv
 pGQjcFfxYpniSctUT+7gmD9RQnAJjaVuB8h4u4ixBcYbiq2ZnyIQIleb7M37C2hDI1fPfSfkq
 qOKiPVn50LZe6hzcpLQVRaKwf0T4Hpa4c7vJ9QI30MzBy+6vu6N6XOY4UByC8KGi+yi1YFwSY
 RvbCYDMjx72LmVqELUsEUmKnRe/vRiEqpu/KgF0EDJbGt5Hf0h2LuzSiV0b5zjrcsvIryGrgp
 ENA5MYbPbH1AMnZreYBIGetw8y2Nf8Wtkts71zbQyGnu9+mtt4bzHoR8HdBdrsFFOHGQ3RXN/
 slx9/pbd9PTdg+z0BUWacF774XnP0aSaD59uR+C/IDcVVFkvvIezRaO2hc6nnX0h74SQ3745X
 AW+cMbo+l68EMjZJagpeDy6Ewi00Ap1sJ5d7mvGWk9ASb8ggP6+i6Ab+sbJr/X0UR1u0PuYUh
 PeLkQeN/G2fcqSgXdFRg0bAdvFEF2pLuisHrO+XvFzCaa+8EKE8lt+gkQivOFPkrEw7x0fZ4p
 8XU1JYM1y6QkeeCXhZ28GIYXZNB62xaYebZnUeacm6l9CcYasd1pbamT3Ni7l8gbuqy7oA5z/
 d0Tnr2pa1e0lbpcNTrX3IzHYx3gkYLxIo5ONA0pFs5aswWEYhWH2tp38hlEOhrj7XQQmWirGI
 k0ERrJyrRZUlVoIW8DJTh2yipkWpmpw2Aj9MG/1x9qbC5wBje1zAykInEKL4epniNsJq95jB/
 ott8/6Gi/wguFRklB
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--u+V4Hm1L7gfdagCz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 07:15:56PM +0100, Jonathan Neusch=C3=A4fer wrote:
> This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an o=
lder
> SoC but still commonly found on eBay, mostly in Supermicro X9 server boar=
ds.

Something I forgot to mention: I wrote a bit of third-party
documentation based on the various vendor kernel trees and it's
available at:

  https://github.com/neuschaefer/wpcm450/wiki



Best regards,
Jonathan Neusch=C3=A4fer

--u+V4Hm1L7gfdagCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWQzAACgkQCDBEmo7z
X9sNUQ//QYevCWqjbbrsYVVPQWIT8JzCoGIJDIpfzMsgBsu3pkklN9zSZs/R+yH9
O4lDdU3eHDU53sgkoOEreUR89NfqJZ+/nZQD1V5KmrNl3gDFFiuofKSDGs8ay7JA
2Eu5oyFceIoB93QjE6JIjcYXy2eQutaui+3q5/dqqJfUwBPHCHcDygLynoXuSb1R
q7IpkNms4PrZzcCoOd2FS81TWEsnuSwABx9n6s7SfNCn2RMMzyVsOwfPiCryleQI
LLz8bFWaeIM+VpxGwWvOK6xPO0PMnzXL6+sl2XPakyJSc74slvw0+X2XBvzUx+tg
oFf8IKpDcO/j7A6LS68jInhUFOp3NIIxuvFZj+pk4zOg9a4Z0jnx6jZxCNIk9K8e
OsSK1tHf5Oyh2eJrKRNAVEE3xSjvKfGLcJFDLRpgNKEoeSDBqTdFHarOilKGHzHJ
revhD2cryCtdcvUaaJX/TCE8KSwQVzKkpgL/xAjzxqQMpl+yTEpLQf4qUY3G9K/Q
S00Dd/He+q9FLT8mLfwwzYdXOU3o/HNcj+lcOc320C0DVyDmQG7OU4B7DM7U7hVD
34PhR9AswDGo01EESVuU2NZtBVn4TQYTeUsdQJLlkN9Y0/lp1C6I/BLzn6uFwkXV
L67mVUZHLhDmV63EgRh7WhlA4wJB4Lueg8w6cEbgEAx99DIy6S4=
=Bcqm
-----END PGP SIGNATURE-----

--u+V4Hm1L7gfdagCz--
