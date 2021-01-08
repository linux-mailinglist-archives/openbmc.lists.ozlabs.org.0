Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120B2EF29F
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 13:44:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DC2q701T3zDr82
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 23:44:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=PPk95QFf; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DC2ny0lN0zDqvg
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 23:43:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610109685;
 bh=l9w+fA1nB7LgxEMoj4TbYENKSEtybJKSCvqFjsvIf28=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=PPk95QFfRFDtFmXK0NiRTcX2mLY8wd02DYWND6PEh09VyWrqWl6X0u6/4Cbf/T4D/
 xfJCYCDmBr9J4naDavpM+81kn5VwedHQR/F2Wd0qopAQ3eGnAREjoShrH+SIi7/LBT
 xVeeVR53YW2xLUD+TwLbP2lG4/j0wkvuZzymvWec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1jwAbV1rGy-0122Ls; Fri, 08
 Jan 2021 13:41:25 +0100
Date: Fri, 8 Jan 2021 13:41:23 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: timer: nuvoton: Clarify that interrupt of
 timer 0 should be specified
Message-ID: <X/hS86Ctfm6Rs2tG@latitude>
References: <20210108122804.359258-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K03Z6K2xej/j0lJ7"
Content-Disposition: inline
In-Reply-To: <20210108122804.359258-1-j.neuschaefer@gmx.net>
X-Provags-ID: V03:K1:oHFeoO5DEDuor9D937Hd/hNnJ87Dr0FeKq2Cx610lPJQQ2bI2cp
 DP4c6VwGbrCQJoby+PcdCsT1f8hZ3VtOo37MUSVCczyHcLrROxrX3IfHGPZStDafBBL8xnY
 6k7qxIgRnlF9FSNLznYTprUicr1v/zUFLf0Md2DEGfBlL5GDm/ztsgGff+GuZ/zTqn8wO8I
 u9XCXwtbXsnzXlCOtXmOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dfm7JvNsyIQ=:4+XijEtdxzqJLJSinQgrou
 dRbPH/Xg8WTTH1JBWHSMmJAwEPK9cDrl49D/bPKcFTGFIhpvgVlC+Ww8WNtm6L+ZLHoeq7UOZ
 HLHqYPlg2MuOumGdxvXwi77dSW86iq9rlQ7qGwo8ZuAuvjR52GMT8jWp7hWUOClSWtXMpg1ez
 WKFydmmkxlFbn/qrGPdcRnDY+QxjIzWq8EshXOMMC5AWIdaWO1Ft4Ait2u9KklhFeBFV1xD5D
 WRfqdQ34wH20z9qX7OH0rMKXv9ZIjvRlgaZyYH7va5otqT6rHbj72s9t2MGa2kNK51RbR1QDl
 +iFWxvaW9uXDDdClHq6PlC4V83Dz+omLMAVvZhQeIwD0U5vV0+5uMnexv6li5jv2ixul8qph8
 VeSbjuQP/UX58nIJjaiUeoAY99Wb8hsfWf5gaKzGCXbFeU6/bpIHX6xn2tpskKKL5WZFRwpqD
 DHyw8hEGS+f3KuoR7Yz/jW4W9tU9DERfzAoTBq74jRn0HsqXnACYh7SG6q9LCT6mtTgQ9wTXt
 zkU6kpjC8MG3qp51zK8u/jQsNF/SiPejFVMHU5Ettoyf+kvBj6BKwhMcpefXRM8dYxhbL9SaQ
 3LfdZ2wfC6zwzjyFT619RtmaSFUsLR51ZdV3ktdUUWTvidKaIsMh7Nj7pJZkF5MDd13PphYSL
 MbH/FUEUKu54sHTyKmh1dvUG9cgiWHNUoI4U73ncCXPrXLPJQOCumMX+2qyFG16mbMwFLx5+Z
 pJeXpCxj3PQ1A4gwreGIW8Q0jRuBcA6JclY+ScqI3nGlstWbsjDZiD/i4KdFC89e9PG8IxgEd
 Tgs8HDowFEcjSze02k2hPWxr2lMqbHuAUTnT4/z8QinhWYyeRf6qHzhw/TKsQJJFv30CiOcwK
 Nmj6x/J/uBcuQs/xo92w==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--K03Z6K2xej/j0lJ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 01:28:03PM +0100, Jonathan Neusch=C3=A4fer wrote:
> The NPCM750 Timer/Watchdoc Controller has multiple interrupt lines,
                    ^^^^^^^^

oops, that's a typo.

> connected to multiple timers. The driver uses timer 0 for timer
> interrupts, so the interrupt line corresponding to timer 0 should be
> specified in DT.
>=20
> I removed the mention of "flags for falling edge", because the timer
> controller uses high-level interrupts rather than falling-edge
> interrupts, and whether flags should be specified is up the interrupt
> controller's DT binding.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt        | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-time=
r.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> index ea22dfe485bee..97258f1a1505b 100644
> --- a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -6,8 +6,7 @@ timer counters.
>  Required properties:
>  - compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
>  - reg             : Offset and length of the register set for the device.
> -- interrupts      : Contain the timer interrupt with flags for
> -                    falling edge.
> +- interrupts      : Contain the timer interrupt of timer 0.
>  - clocks          : phandle of timer reference clock (usually a 25 MHz c=
lock).
>=20
>  Example:
> --
> 2.29.2
>=20

--K03Z6K2xej/j0lJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl/4UusACgkQCDBEmo7z
X9spyhAAn9X9Q9bYF3hwQdGBBaQXGHJR1mo0hmBSyHgIML2W1sioPUx1WLYab7WR
CNfEGJznnFn6PPZL9KwJr9aSS7qZ6iyiy1PdIj9C3xqaAHXz2XQArmZz2hd8NcMy
gqnYsV07ksSRqBTFR3N/tGCiEPII3IVia0jjqL9/ou60emVxxPCA41hAlP7L1iwn
Ejl0bOA5oRc9+UkrNaPbMmJFQwctR3FTiiHHv/L1gqpPkWNx6biETDpL1NDVtj0L
TVkZoMeqzmIKnEyG7A9kHTLzEsgpasdj/qvnSiTZlctKsNxkXW+6fgG6jyLqlF2b
mrcqfU9wp9T9eUfjJGbUbk8ki00p0BntQ+EgFFQzS8RSlm1u+Aeyf4AWFfxOyEJD
A0OYTRFYIPmdvR6orZVqF14hPXCp1/YJkJ3UhgYE63pgNzPtKh4mznQabFheOrYM
LyaXt92KO7YT10AGNxoy0O7m+nuvIuwBV328O+y9J0FwofgOC+aFK3ONzj4EZ555
OmRRootSzE29zjvQ15z+NQohUD6lJSWBhc3s0zo7DokLMTjCfy3B0Ec19awgDqKe
jbfyEfqEBAgQ18MsUkz8MzRIyqhBfAknMWRvxiSfiwDOM2u8oD60f8ey7/2XCb/Y
tlhRz3uskp05nSE5vQ9cEyLHm3yHgWgwqPGdnGbmOWZGRKziVTU=
=CHL0
-----END PGP SIGNATURE-----

--K03Z6K2xej/j0lJ7--
