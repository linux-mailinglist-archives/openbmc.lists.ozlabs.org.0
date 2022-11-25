Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02F638C39
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 15:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJcml4mpkz3f4f
	for <lists+openbmc@lfdr.de>; Sat, 26 Nov 2022 01:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=fZqYgJIh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=fZqYgJIh;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJcm94W0kz3ccn
	for <openbmc@lists.ozlabs.org>; Sat, 26 Nov 2022 01:33:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1669386781; bh=84LcUfImveF3DBhyvjt767xtfPy4emu5UBKU4xPoz+E=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZqYgJIhcxeoP8NvoJwyjQReQX4Uyy6qtbQFOl+d3PqHq0eDfVnzz3QfZaGztom0F
	 bcYt/8ZWSGsLRs7Oty85FnuyyRZuvwLmTW9gHWHC75SmLLdOhEje3JP5UY3MtJTUf5
	 J0LHtEUdBld0myEbLuwDgZFH7ZrQdJxo6z4sVdc0/EaVCpMpxWA2/RG7Z1lUjwBHKQ
	 wGx+VJFenIrPQY429VdD145fGOcC8bdfpbjzFIpBxFXGMuGMXRHxaGPtdzEfygIqk8
	 g7JTLe/ksrZHzI4TSdo/eUSJA2rd0a79RAQdmPpNREe+UgT2ALMhFqtY0s4I7Ufmo/
	 mVA7CJzNxDKCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1p9L0U0SmN-00AjPQ; Fri, 25
 Nov 2022 15:33:01 +0100
Date: Fri, 25 Nov 2022 15:33:00 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Message-ID: <Y4DSHP5k6PGKWY2+@probook>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
 <Y4C/eSGckOyBY4XG@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MwL03TwS/LXKO9qo"
Content-Disposition: inline
In-Reply-To: <Y4C/eSGckOyBY4XG@sirena.org.uk>
X-Provags-ID: V03:K1:7kbxwJpIF/e6Bzhxtdag9R5TJvH61MCc7rj8DZf2MlyG8DE6dd8
 AnnLcWw4Ot+GTiLSb/FPu+J2ImTnnRSV1sYGioaaiGsh5Ni5+mCqXkQ/iJFPZPdHSYxy+DV
 WsqyzYrAnh5bZa15lnXbzQ+xujPkolXPFj3hNYw+eyIJM4BI0wort0xe5ToG1qxGs73cQEJ
 rJ3AnLNOqfyoqsDG2S2AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:85UX/bcHygU=;DsN/IwCDNxNN8AJkglI3XnduxPv
 vI7kmGOYiaUkpeTLciHJd70ntVjmRNAzPLhb2U69DorjHrNny1Q9/h5klMb3af/RYTQ8vj3ie
 fRhsRXPQdmuvJYMeQB/e/O4UGUFgZBATb5nyYnNdUBbsC6UHaHN7V8aTnKRw7n0j5uP8HITLZ
 ZQnv0b25+MTnYyTJM9q1Jy7VZjddKngMrblUH0MaeQPD7uiyMdtyIimGQcJv8D7gHSOOVNghq
 vbc2XZqjn+QcMt5alticBTpCmpnqz0YykFt8d1jQORMw4ELoXLxynLzqHgZfVMCjdT7UADyXY
 pHPM0DCvpEBTE/QkGA2PdkvOnIVMSq9wzU94xtpH2Ur57h/BD5bQyG/BFeTo4ePkic2c7Gnpr
 UYaRrJtrEfiB6SgOCpFB4VEcSu4sLjsN7A+i8UVGMmb78j0BSldXxJncuYauVOatWQGuIzV1K
 Q92zMHDuhurJGawrsYyoLTe8L6PPhsg11T8boSst4jXQPyucg810Nk7++Oc2UHYLQRD/tjt4j
 IQRXuZTuxB2zNgEWc1VgP7EDInLWVb4e/rl27Qy2vsV7BNwbigZbEaAl0AOuKCzBIcVSUkOtI
 PgmRXvMN5Wire2pjQb5G2LK0LSOEWXMOedsbMZ5NyTVIgJlyS5b5o8vNzAPgStXzh4mim/sgu
 a7l5LCkyPUsgR8UnRFiKLdQifmM26562VdZ3HJ+i9srdOIxmMKgNFxtE9dhLEs78FB/K1p+/d
 gMfjW/qD3i6C4Cg53iVQdNgdildb2tYC8/RlgyFppffKNBuP6XRziNrglQxNECDunX1PyVjWx
 1s7ZD4hnAaKRZq5ugbBWGKHVNFjqPz/gxthEXn0gb5qrPloyd6WJM78iNa5ja4x4zFLOz60bv
 OyyUiKvijpp5vpCVNo9TutB1S3JyAnn1ep2kTIGBRZb2+OJRcjhKbHGkpIXv/hr94bOikWMWW
 LzMM19OHKqOznob0ncy849NioqQ=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MwL03TwS/LXKO9qo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 01:13:29PM +0000, Mark Brown wrote:
> On Thu, Nov 24, 2022 at 08:13:58PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > The Flash Interface Unit (FIU) is the SPI flash controller in the
> > Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> > (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> > accessed by software-defined SPI transfers.
>=20
> You didn't send me the cover letter for this series.  As documented in
> submitting-patches.rst please send things to the maintainers for the
> code you would like to change.  The normal kernel workflow is that
> people apply patches from their inboxes, if they aren't copied they are
> likely to not see the patch at all and it is much more difficult to
> apply patches.

Ah, sorry. I wrongly associated you with a different subsystem (I think
MFD), which became irrelevant for this iteration of the patchset,
rather than SPI.

Here's the relevant/new part of the cover letter, for your convenience:

Changelog for v2:

- Dropped the patches which have been applied in the meantime, leaving
  only three out of eight
- Changed the binding to require both items in the reg property, because
  there is no need to keep the second item optional, suggested by
  Krzysztof Kozlowski
- Various other cleanups suggested by Krzysztof Kozlowski and the kernel
  test robot



Jonathan

--MwL03TwS/LXKO9qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmOA0fYACgkQCDBEmo7z
X9tXmA//fcTflqVCpji6kZT5FcIGCfLhu9g7nfr4cz1lqEXHAeeb8M1mNKRHNxrc
IiKAVBxl8a8YBOedvOCcmtsuiTWupBxFpj7bY6OX1wtvyGTFwtE2vS2kFgo0u8xi
4/0chvtZPjL6aOSKH7qZUMyE/2sTW5AGQGcOUnbmXpKIwtottoK6vO+hRLe7FZ43
Y8tOKfIr8mGNnDVywvFanhVVX9O3Pkjflc5mpMm5kWsaCJEFn7d0OVCAPmrmH4Nb
CUjM8OyGT9oNn2XPCI1T7xiqSMKS4KueVE2y6ZdlIgbjvD1LgIQUd6/Vi5cep02u
VRt9L4/kqG4nAoGqPZtUyewkelnTBVQ4INSRZRzX5FnxOiBnhZJgFb0LRFUvPnjI
FYU6i9C/2Jg1mQ9/jFaEy65muz0llW9ags3I2Q/mBHOJnfKHJd1q5LR+jLox0Np2
QhGld5zgw4ubsZUMuzB7LBTgnB+c6Po1Aw9lVB5sTU74BGkHrYyuQmaFOV+jgOKc
nyH/vKyKEja5A69/KsKO7f8LcRAE4XDcjGQ6pmLFj6A2S/MzX6HQu1vkpTIHvO8y
YO19b92FBX2gpnJPqFa44tO13PWuAAu/FIuubLgXTKPbc/0wjbFKoWKsB2SqohSk
mWDIyhCwRIH9LYNTpDuE6hRz+QpUsTivpt131p4N3Pn0vD1O2yQ=
=+bvD
-----END PGP SIGNATURE-----

--MwL03TwS/LXKO9qo--
