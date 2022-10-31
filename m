Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6366141D7
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 00:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Tv36L88z3cDq
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 10:31:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N6jqJdwt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N6jqJdwt;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1TtR5Kthz2xZ7
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 10:31:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667259053; bh=Ydt30ZiOwoAlHwQQhVHso8KMBpJhTV2zmKzAWz49L3k=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N6jqJdwt6r4UlyHJQ5Nn9gf2K4rMAeSo0GJU2XVV5AXdc2fEgh8lynBJApgPusUHR
	 wCO56RusmAVBcUfheAapG3hHFC00SpeM3YHztaYPoZllAfB2AGtrdPMNUkKx+TAgeF
	 ZmEIaCgqVgKmJiFS7pTlS4pebGwVXKupBVy+bCe77vNtybUtsfGnf18tDWtFl/xaiN
	 KnLPvYv2LIK0Tj0dz2XHdPoxAcn1rchdHPO8Ra8gB2cRJBofvpBAhDFH/SvnkXLVw4
	 m/eFObmS2ohMOdE1QO0j9OoNCg+YCQobYwzMjeOIFdMr//25N2PtYqZtIGXby8koRY
	 XmwIUrCmHcExg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.189.154]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1pOifb34md-00qkAn; Tue, 01
 Nov 2022 00:30:52 +0100
Date: Tue, 1 Nov 2022 00:30:51 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,npcm-fiu: Change spi-nor@0
 name to flash@0
Message-ID: <Y2Baq2gtpGVoIBJs@probook>
References: <20221031222559.199509-1-j.neuschaefer@gmx.net>
 <Y2BURsf5xKyfMn4+@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yYhPxXbmJxZLcJpQ"
Content-Disposition: inline
In-Reply-To: <Y2BURsf5xKyfMn4+@sirena.org.uk>
X-Provags-ID: V03:K1:WWR7Zc4ssSK8aKgo/jAZe4YzExcnZi0wjzmJdCstujb1AiDoe2G
 zQkc4A4mWO0ihGrS95QQEQs+wl1OWvtrfK8A0YiBUoY1jLYvYxSvKsPuO56soJQIchQZDSk
 iA4l3UuycOWFZsLnKwzN6q64ZbqgDQhkJ2u6Ecsthnyzh4nLGt5AFUS1k3rI6299bzQWsQ8
 xdlNp21AtQ/+7rbkv78og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6695kWv5LRI=;FJ9O1qSTJw53FfkUYY9HmLoLg1O
 +Fz2ysyLqXhd2rmXJAafBcWaWpM5vl6YduohLD6+mXiEgk6M/1lMIX/tPVCj8JEBCR8Cj+EIU
 bNCLm4NiFhZkRzW3/vrHYJ28B1cb7FeCKLg8ca1zS6vfqyJIlGR6nulWqryoVv3UzlH+zAcO+
 /LraYSMPOwnZ+ZRZlViHAI3LQyWM+m777otmHUCTuzunlhTZTSG1jNaS32w8gTs775/yn6+CN
 0LVeXgLqMX6SIB5YPOjtHjCDzR7nsp5W6MLl5ldzFyp44HdJazmbAM4Q1E2zieJPMyQRtm7ws
 B2wvHmsx0mp3+bwGHeIIKylUpd/ryuhJ/Z+x0zuJtFe3bhMvCQg76mtCcKvQSo/u8R3mAu46R
 q6fZ+A7GchCVR9k/KqzSJfwXOwjD7Qq5aZ5ORoAK3gzmliEIwAvfShgzgjeUKeVKsx1yRar4v
 8kpbbtxpBUZu0etYQFTELptbHTVJ+49rfJhgHbd4gnbYukHH5+HihqHJZ2ljKT1DdvjdG2FF4
 YugG0tqdaP/yDZPVPpncch6Rk6sgGaK3N7BltD00jmsdc3bfDHa+hKDWN+5JnVggHR4j/cGzT
 iunMwZNMzliCL6WaNH5b1Ax5ZxRy5O5QnQjLaKdBOF4jJteVDqZurI7/V2rJjheRgm8kEGCzn
 Pj0mCRUGmVdy9tvA2QG8lBrGfbm2LYD9w04M0t4fhrk+gxMuxHQeL5NE4MclutGjUOUKyY3gD
 VXBnkR0Wnifu02f9BEPjD9vcynQqJWTk0MAa1K3RBdMU/qlyciSp/Zz57BzSvwljdrtPlSf43
 /l9EoY+X81ATguOFS9+ahLwnFK+F5SlbsUyuPxdlY+SnzYD2OiEdpk5teZG8r1GB77X3I9pqX
 n23AdRfsikAwO5Tn0FkA9yHR+t+t+/HaWHfocT/UwUOUlE6C3bC/m5CWUK975k6lczY/TRl8j
 jbu+ccHbTbeh3KcuAYbgvbc4mOo=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yYhPxXbmJxZLcJpQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 11:03:34PM +0000, Mark Brown wrote:
> On Mon, Oct 31, 2022 at 11:25:59PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > The node name for flash memories has been standardized to "flash@...".
> > Fix the example in nuvoton,npcm-fiu.txt accordingly.
>=20
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Documentation/devicetree/bindings/spi/ has a wild mix of

 - spi: <some vendor>:
 - spi: dt-bindings:
 - dt-bindings: spi:


"spi: dt-bindings:" seems to win out slightly. I'll switch it to that for v=
2.


Jonathan

--yYhPxXbmJxZLcJpQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNgWogACgkQCDBEmo7z
X9vfshAAiK26wbBQbFCBucnUGZTFpx0brpsEL/LKl/3IH2xTjgIlMC/mjHwCXWS+
42hZfk/brTkVYFHR3w/OFbdAPTb5YcpRXkgsaTP3acYDFHBs6YSn/KKYb7AWRaz4
mp0HKDLU8138sZbmQnAXRf2S74prur6KvEKYynQRLn5gQJnY7pVCRrHMIdzsKXIK
pU/hjFLIobZGQtFRzvd34ObiaWzf0j2PBtJ8zPWIP3r3fmyrX3LGBt76ENX9QDjt
xeuvxfEkoQE2q0IXyb3M4uhzSHENE7C1ExXwr5WNxvKAKrLQwGj34BBIBfi3jCeo
QqBZETCja3NFEqYTWdKZY0tH9q9onZcQG6T8QQZ8pJ1ZSqV/3okQM1CNw1XS2TWi
9+cT7wg+IJG/f8789gqdYFJlemXx4uQ0E+wjEuWinptX+AqTjRJMhhXFYAy9uFA2
AnERTsD03R2vET5abhHFV9u3Oi+nlyLMhc3UF4wyEhVtIMIAplOHnPKfrkdicTgi
9my93+U2QIdCooZNzT4raEHxASBdLF7B/cc+GmiYRhouPFSY728bjBcQIrM7Mkua
ibVX8inuw+k/DsLpnqIvIhojEGi3dRn2EEXpDb04nQNPRFXfXq6FgwdyYRMYklVR
rCcMNE9wdw3G3Q99ecvy1DGDz3cYvZpiLk3hkCfcdsN9gSpoiUo=
=2Gef
-----END PGP SIGNATURE-----

--yYhPxXbmJxZLcJpQ--
