Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E323614260
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 01:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1WLS0Vm2z3cBX
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 11:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=J16DQCVz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=J16DQCVz;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1WKq4p8Vz2xH9
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 11:36:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667262975; bh=xNrSYuVcNP5WrbbqEMql1DEKS8f3dgJjlNcdXVkrsu0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J16DQCVzUl7reu3kcBC+HKkzqCh9lkTYDmgryvpKInPnEdbeHoStaeRhQTDptF/+h
	 XBssVisBpMrf7gAKs5kHnwf0F0ELsJiT+wib0ZCNZ74LAUURb7ItE6uR1rDrLZJ5wo
	 Qy6ZwiOuH3qooosj/udIG4wze9/Hh6UHdSV8NBp2n9/DYqaJKcxafBfoL7I0FlxLkP
	 Q2zMX3TIvRBuI/H7zPpA02g9HmTxN9BEBdZ7boXU+BY5kO0fHYbPUZUZqmKKa9Wn4n
	 r2AESLxDe2qaiiX2K6NbRly2GY5pvo06HaIT7kM0aX3t/z/83i058mTzckyEB5Rbfs
	 zBWRFG1uMkAMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M42nS-1opfGJ0YYy-0003KC; Tue, 01
 Nov 2022 01:36:15 +0100
Date: Tue, 1 Nov 2022 01:36:13 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,npcm-fiu: Change spi-nor@0
 name to flash@0
Message-ID: <Y2Bp/bmrbg1uWO8m@probook>
References: <20221031222559.199509-1-j.neuschaefer@gmx.net>
 <Y2BURsf5xKyfMn4+@sirena.org.uk>
 <Y2Baq2gtpGVoIBJs@probook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QVnX+LE0aV3XCUSr"
Content-Disposition: inline
In-Reply-To: <Y2Baq2gtpGVoIBJs@probook>
X-Provags-ID: V03:K1:VsNVW23BvtuUv/C3JqwyLDD+OxT6FesjAJ/Sy0+sCeZYK0WAh1d
 r+decQ102ZvRvqKBT/1d0kDKkU0RcKvR1RYOqmdBLK1WuQoi1JO3HljcB3G0SNvwsQ70oqw
 ofdl1N/zuMJdMpcEtINUKSK0QHvxtmeCv/NWQ3JnYkELNPRMVmcg/8QQnEDhD/aSUp9x8fM
 Z8iwTYlM7KLAlfiNZ3NbQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aivzwCu7ZDM=;ldTaWpnwiri6PH5P9eSTKgyM7oR
 FL6bVfoXdXlQgAiNcatyTNJMWfTPQgvYYVdgA/b6b1R7o+2CiXDNsjk6AVzUr8QrSIlbp5Mn1
 zXx8AbED7wb5Uq0MOmOqM1tWjN5dLmucaIllYlMlhNly/dfifeK0RzdXvSBtGOeK7j0Fptz3u
 fwZ3WGvm6/KWrlXQqNiPyLYRX3SqKbRs7FUxbeBY5y1aIu2XH4C9WrnY8eYLNu0rNjX3AcyPR
 YQ9KQkzTvekPfTKKfN0KMfa6gzOiI9s7+Zlh9+BqbD3BUzHLusAeupvku9XMgSyFI9vuzXoM2
 GgSdFJCr9gJYooU79hcwJQdL9AZTZkCTrd6WUztlYL1KXJhVx0o8TDstApVcESMJGWT6sQoOQ
 psYKKhb5U2nbgv1w5RQh6fXjCeLm5NDRsIGfHNKuwIZKSzDBODa0sSTZFJNy2XyCwETbbYhCO
 dEsZntdUNjfZu+sTPpAzzrflcP8hlgxxFvSc8AuwmOQ1AfthAZm/wIsVLYgky2+1kENb8EuFe
 xpdL5Dmx62EE8dbuDMm0X6IA2PzksLFvhhmjdhGEUTOiDtMa2ZcsQQQqCVwbku1MMLDbIOHQ2
 vHi+ap52FvIxcyaPsEVLUWjGSren+6cqOno7mPIDRBdynMWcezRsIRnTwaJ+vZfPslVwCCaAk
 Q03hv47ZMxf94p3mu5KDzcdUXjYl2g84MrYRhrK5CmwEXFNEaOxaAr4aXPYEaGr5hOoGWHecz
 PdvifGBhzVhfcFKPxM12X2008YAaGiDAYnqn7IU5pfq4ziskaWfGRDK3e7K6M8qUWfOXA0ubh
 otQo08tnH7OlAa73hJvqHQlA6g/FxY4feHUCr3S7M/Hj97ncK6NM4o08yi3QYnyuGlFWlngSS
 cHzC9zM3pfLM95n+kc6EgHT1A1xrbg7PMJ/JXvXLg7oFBjjOUUZTkwKy1dNnujn9Gd6CK2jCt
 91bEs2uQWvzQIAROleajms76PUw=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--QVnX+LE0aV3XCUSr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 12:30:51AM +0100, Jonathan Neusch=C3=A4fer wrote:
> On Mon, Oct 31, 2022 at 11:03:34PM +0000, Mark Brown wrote:
> > On Mon, Oct 31, 2022 at 11:25:59PM +0100, Jonathan Neusch=C3=A4fer wrot=
e:
> > > The node name for flash memories has been standardized to "flash@...".
> > > Fix the example in nuvoton,npcm-fiu.txt accordingly.
> >=20
> > Please submit patches using subject lines reflecting the style for the
> > subsystem, this makes it easier for people to identify relevant patches.
> > Look at what existing commits in the area you're changing are doing and
> > make sure your subject lines visually resemble what they're doing.


Ah sorry, I missed this line:

> > There's no need to resubmit to fix this alone.



>=20
> Documentation/devicetree/bindings/spi/ has a wild mix of
>=20
>  - spi: <some vendor>:
>  - spi: dt-bindings:
>  - dt-bindings: spi:
>=20
>=20
> "spi: dt-bindings:" seems to win out slightly. I'll switch it to that for=
 v2.

So, no v2.


Jonathan

--QVnX+LE0aV3XCUSr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNgadwACgkQCDBEmo7z
X9tIZg/9HuIIa19SgaWQxuFMqJ8zvTu7gKSSYiWfc7vgLxWHRczUewtItrlDJutY
yC+Ixd+5vux8N7FV56Mwd44nuYItWvcceCTVHkzIDw70xF/TivsJ1RDffJwiVIYS
AFjQddErzDGdk7ETgW7GssY9KGTTfHPJkCWX6X0Ct8yIhYNaNcR9Sf9W7OfDXW6v
27wjtKEJhAwrz9g5ld0yJzR1c0nmNVxEa7ITvwqa0rBOtC1dNKpIZ6242B+Agmgg
RmB4+7yudoVnJQ+kFkRsoAjHZhonV9SIngh8JUgUzYY/V7nmlLGnXqu+s4dsZ7rN
d6jUHwu/+VmgJxWcTeOcOaaN1J+RiUECvr64GiyvIvdKXAUud4J4MhjYTNPC+bkK
N7gZ4BLxduKbNA459TnSflVV3RJ+ssVdatM+Dr9lq7GQQ8dUg050fT06XNdEMQgm
Z36khA9ThdaDXjEAma7jD42dwnf3JJ8LF7U9KimE6YoEX9J9fsegZcsLQoWZTYQv
j6Cj3Gf1npvpJBrm0SCnTeJdkUTRNVa1IZnycuI65itA8z5QkhTywSYvk9LZJMfc
dxUPLgI38+WjP3tDPtL1UD5ZqOYOsx8xYq6k41iYWMRwEIsX7nDEU6yfqHe0Po9e
lXXPGpuY/ovcoRpkzNqqgqMlnB73Kydf08Rcl/VVwpDThW/uPHI=
=X73p
-----END PGP SIGNATURE-----

--QVnX+LE0aV3XCUSr--
