Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 631164AB94D
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 12:22:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JskJP17KBz2xD7
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 22:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=K6+qAcgX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=K6+qAcgX; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JskHz2xlhz2xD7
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 22:22:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644232887;
 bh=lqTCzfaXoYJ6xzRKRc8BodZxPW5s9n0MDFMCYqCahgE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=K6+qAcgXvkGc3L1k7wzsz0VnntwCE0FMx5QiGyDjhLGM22jjdLOep1BZKitB/Zasb
 huTOTJK7dTFYF3iAccAJ5cVs5eNuoYnFK/0/jLIcf4r1qFl7y/ISBv33Vgb9WIFT9d
 EeZD8vmp+rLITLxWh6hS+jrV0y9LS9lxk874WWkw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1nt7zZ0o38-00c7kl; Mon, 07
 Feb 2022 12:21:27 +0100
Date: Mon, 7 Feb 2022 12:21:21 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YgEAsTW6DrZSSgL+@latitude>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NaN2xgGUpssnCj8u"
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
X-Provags-ID: V03:K1:AsivsehVN199XEIOqSWLNn43v72Gcc2UASqJDvfKfVl22rdsl5Q
 kdM4NIVpL+f4UzDCnWB9MMzUYm406GUqtXSIGuy1QGz/aLBV7JuUPPM1ThmxTfvB9uYMVmP
 2r7xGYruhwlCJ8dlvIm7rQV7MQHSaKua3ydumGTrxm5tmZzcXUgv672Csfxia58bdjtkbaZ
 ebDj9zA+W8zQG9PNoZ6Ew==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GaZ2y6GegmA=:nri3H3ackiszY7YzRHiwp/
 yKvuuFQfMcuwy/mE2KIMq9GjYWXGVXzgbnHj20VeDbmJlRu1NkK0zEtcI6UJuy2ivUABCTZPZ
 cSzCb0rRAIlppWUbiCWnmWW01RJD3Q0z8+em1+WKochzzwkVHDIGHZkLbfpbDIbq9YslOTCVb
 1VDL7/yKsrjzMGKXEujwmd7KE7LWUGitnFOtNQR2ZYduRCixJbgnulGptgPYHvuQXBaTjGZcR
 SKwCX6kd55FYH+TRSVXqw48HWFQYYPk3b7gWzp/G9+wGvWwshTX1lD2ooZwVgNZBjkkEwxJeV
 pNRc1pm3Li0c/xiqSf8tqp4NIWht7z+1Xg/kE0ZmKeU0SvFPDrqTOCdoKz0IQ7udJJs0CArkb
 Q92oKFZD8RSOr8pKS4J7xuSLu4pfE2mSb7Eye3fXEfuD2lhj8i4Q9UXLe8L3Fik8APq5hh/+v
 RslTAFoUloShBzED5qRH15itjZEBUe8wgcW1GF+e9MC4ODcfChI57eVP62sALYJsUy7c1gBnF
 xkTBY2DEVMFGJJzUR3LaiAU8jVrGwjtaZgH2mqKeQwf1QPRX5D/AlykDWyzYpP52gJnqw3dlr
 WKlq/Z2TQ1GQ3F07z9ois43m763EAKZvHCcFp6wNeJyL2fFp+3RvbHxMniLV8j7fp+d8RC9QQ
 M67nxc+ddlBPu3ywgf1HVrv2iwtzx2fFlkYGOARd0CQ+dEUEmLCNMC2zavrHq++VSOOgaAXzH
 GstfUEPgfpEGVDkvt0/+RkuW1U9WLwiwvhA/Pr3X+IxpiEcBFNLLk7uOZl3KzbPcys9yS7w8M
 nO6f3El0xnsCwTO2gEivncuRFFvPQzkdHSdZqr0PXSmoxeX7qDGssir7cBSw6CalXk2/M4Dly
 JbQCXn1pZuc9KrqUqzAtoDzWj01RdGct1FTrI4r+q1XOneakk6qmg155hNzsRw3NMPRLqMKkK
 CJhrROybohEzg64ZyamEj4BaVWBmQ8PWKvJKVb98CMgEwVNpPoMhUObCrQnPqHUUkGE/4FEY8
 giX7dO3N3YBb2Zx6ykS7nRQ1kxgs5oMo8/aeNWkT3Ppe0iOkOcxH2FG0SsbnEiGQKC+xPdxJ5
 ANjxP2pgvHoo1k=
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NaN2xgGUpssnCj8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> This commit adds compatible and syscon description for NPCM845 i2c module.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
[...]
> =20
> +  syscon:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon

By making the syscon property required, the existing npcm7xx devicetrees
become wrong (because they don't have the syscon property).
Please, either keep it optional, or adjust the npcm7xx devicetrees in
this series.


Best regards,
Jonathan

--NaN2xgGUpssnCj8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIBAIsACgkQCDBEmo7z
X9sN+hAAxwYehg8JfvdijxWJEGC9oYMzKVhAiQcyLJQUFWyKpIj9X8UVhwdUvDdp
zFzr/+Q9H0xFTRvJuRY6L0j2BpoQcmEu6TmqC4UVeElY6aJkxtBhtwGogdNI7ZRz
9xw8BEAypsCh2Aqx1RWI8M9uvfVov/6PuSVFmowTiL+D/j5SzhZPC4F2aK7iMucs
3VEpS9mTwS01TR3U6afuHjUfeqPW9SgORy776khM8gM61mvku0dfnE+YTlvuT8nB
Yj7kNvFqjSz0h2ETItDdERXycwEijVOpOK7yst6Eh2POE/A+u3TTgC8hUjkjwmsM
r8Tii/9ssnpEsG8u/vUPPdzSiqq1Xlte7cnaex0EZvQSQ6J/FEZQtdeN975BMg8n
W0RvAFE0+sZ0su+olsShCg9LXvtlU7mHuJtnd6Rqc9LpQHXhzPqtaUCn0c+S7p4E
3HPTdtN92zbSdQ0S37Wb4BtDPSzFwekYd2NUSozdRclT9Vm9r/XJwyI8C+suRuTN
8fihbstXrryOHpMsy2DReOlJ31K4RhSorgzTHJAyTo5mMCnS9uLxlhqZDDNGwvl+
Jh1n96uAETIeqFT9G7IW6VY+ntvP9ekKlu+FiQpu56DK+NmF0fxeTJusMr2AvMzH
j+kI/tULDt8ZfX4lmfqt6BSPwlGuG0APBkYwJPRJ4IRPjYv03uM=
=auDF
-----END PGP SIGNATURE-----

--NaN2xgGUpssnCj8u--
