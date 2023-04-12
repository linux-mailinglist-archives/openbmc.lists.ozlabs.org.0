Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF696E00CA
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 23:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxbNs5bg3z3fBL
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 07:26:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=MqM6pNlG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=MqM6pNlG;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxbNJ0Shwz3cjN
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 07:25:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1681334692; i=j.neuschaefer@gmx.net;
	bh=1lJ48Ks8BJLDV0858j+7zFjPkSScyLQQDytPILWRroU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MqM6pNlGjibfGdC5QKhvhl0yAmQ6mAkFTyqgS2272odvCrSvQmS4ltpfUkiY90dI5
	 d3KUzTohx/Co/RD0hnN6ghpmwAeJtDx2GC4NRUGTn5jjlk1gTbvaijwzTt5xuB/yBQ
	 UtpJrZswJHgcWG/B0kU8KoLDZXahrC8QML3dTaUaoWGBSzq8Mgp89+O0A3tmcJP3rX
	 Kd9sbSxVE9+YEhrPSaMKhM1YeGbn7b2J0EG52rDY2Rt1pkFvkvYX+NULQyO9konDpU
	 nSyRULg01htzm+6FiJnP4+z9zjOVNB2XyPGqFZuIKu1HcKq/nUpjoDXFJsOYdlDybS
	 xP0NGKdsOecqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([185.66.193.41]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6siz-1qQmcN1JRn-018LPv; Wed, 12
 Apr 2023 23:24:52 +0200
Date: Wed, 12 Apr 2023 23:24:49 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 3/6] dt-bindings: clock: Add Nuvoton WPCM450
 clock/reset controller
Message-ID: <ZDchofAGChRo3rUi@probook>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
 <20221104161850.2889894-4-j.neuschaefer@gmx.net>
 <20221209202120.0AFACC433D2@smtp.kernel.org>
 <ZDcC9JBidzfu94NW@probook>
 <ed34eacdb1d35be8b9b2c44944f828e7.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ijRhWXEzdUKaiJe1"
Content-Disposition: inline
In-Reply-To: <ed34eacdb1d35be8b9b2c44944f828e7.sboyd@kernel.org>
X-Provags-ID: V03:K1:11HHXOJlEmu5SAf22Qo6cW7aqsbyy3MHsKrLND7Ec+YYY+jpmto
 9zVADJVVK4YnjFYNDkNIn9xJ5m64xdfkRF0cFN3m7pLlp8NoQAxYUUbftgABatNOuPzNnRh
 nFGcF345rtT+y5LlMU/PPajrz1crlQv82C79eWKcdRPue/rfQFkbJ1iniuNOFPXkQ+aMWCU
 VX+gD2p6lVWxttOseUhzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NqMDQeZ0dwY=;T2pOs7OeULQAguNA9usaI6xaFqM
 4vCrI2hHUwH7+38dwDt8IM/G1OYZic062fuk27MXLOzR3jaDUCBqYRjHqPEBp25vxH4zNuRiQ
 QCM+GdqPnNPkPOjR4OP3lg/Av5ynhpA4AUAVIewcY/pGeET2smtIX7e70UFsUEdiz97n2wSFe
 jWL0mLsDB60LbgIr3pBymlfBBIGY7ymC9WuaDzMrhPFbjYi8bqQPVSmMXrkGZvk0+NeNGJ+je
 qwAMHy3HPnImwruXp/7EbZUnnEzMgd7RxBvnSyFI33B6iIulf/WApJcdeCUYdJy6k3WlTz8kz
 0Y17UzFIUAbCTExbUs4J58JAoVQzdMdgPQIFTaag49ePD+NVT9LHK6GowJpEu5yQO66DA3wyk
 vsJuXnYzv3ceyryUkqWPv20WeJcrj1o7KXa2r3ZlQuVnc9/SMsocT1RwzUq4aonySjZSobW5u
 2fXVQYaTNp5pAZQJfuAuEbgsXe4Ddnk7pb8jmYUGJkN8VLBmgCjmcJL5oucjGowKAqHFeSLzP
 SXIW5PtFLaWaoww2YLmeW8/vRGNIztthhnBJTW2LPsvlmJ6Eid59L336rd/lKktz+xojsvLBR
 vclo1nlQgrloQst5MD+HnPsQ3JeyPfQtQZUE8Octg4cU3cyOGcuA2yG/o2qxXd397PT+ZisZ3
 6lVNH5X2n6Helyibrew/sEdnSGenLf4EI+LJFOHiO/2i/9zPvdBud1L4p2zAhrzcKzrW3bXnO
 Ge1yLYPJPC70hyoJ3zpCV31Qjipq/w2BsKchdrQp3sogwtxk44NszHSZq8mnyaAtromqYqNCT
 XB1QylVqZv1h6QD1c7MQm3nFfZdEronREeG3TFwbZPI+nzoFWT0m/zJyt6FsTno5/SAqen45X
 m0GJ9sI7i18QLof6ZhcDLOBvZ2s/+oSPZBFBv9c1TmUZpozw61L53Cx15jVEWTYGNL7fWX+ss
 ONi7jw==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ijRhWXEzdUKaiJe1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 01:34:20PM -0700, Stephen Boyd wrote:
> Quoting Jonathan Neusch=C3=A4fer (2023-04-12 12:13:56)
> > Hi,
> >=20
> > On Fri, Dec 09, 2022 at 12:21:17PM -0800, Stephen Boyd wrote:
> > > Quoting Jonathan Neusch=C3=A4fer (2022-11-04 09:18:47)
> > > > The Nuvoton WPCM450 SoC has a combined clock and reset controller.
> > > > Add a devicetree binding for it, as well as definitions for the bit
> > > > numbers used by it.
> > > >=20
> > > > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > ---
> > >=20
> > > Applied to clk-next
> >=20
> > I don't see this patch in clk/linux.git's clk-next branch. Did it get
> > lost somehow?
> >=20
>=20
> Must have gotten lost. I don't see it in my branch history locally.
> Resend?

Will do.

Thanks,
Jonathan

--ijRhWXEzdUKaiJe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmQ3IYAACgkQCDBEmo7z
X9v0qA//ZCyWw17Vh1uj88edHIAvM13FiSkcbtje9SXoTMnffVwvHTaP5fh82Zs0
RJ7zJy080xBuP5dpeNcFKwNy+lv8XULtk3Y1ACzQjsZZRWUf37VEcaKZuuE9cjNJ
QjArNXSqv0PVk0DJAcSCGOrJe11A51whZy8Tv/vF+67nu6QjFaGKFAtuG9RMtYLm
5trTn96XKvFAOwckwzQe4FMLMLxXsHnsOk0G2fMj+jVoEDrMW9iC603lAIMqOCFJ
ODk+NlA5IpDBFC/Z+yayafGX9YVuoMlOimWvSxKWh313uD84EfgDfuoEhM3MwSzZ
c02XfSNQaWdMwFA93sj5Zw0Ar5wxDDuDxUkCTRH4PQo6RNSItsly8NfwnRKypysd
140br+efe14Gv67Z37Z2XhfYLd64B7fjRJhz9ukqi8cOrS/eQlapCK5JASnFzJdZ
f5HCXDNHF41HBL4r+hWgXsTCrB82N3jjGBptqr+qs9i7ZNKxxMKqy0NjTbAa2SzS
4WMEib4xX3fuELGor6g2NoKrftduQ2uHKmdT9kPo+PdtHh/gp4l7yIvSmKZPqqJy
oYnYWN+Yo/LkIV1mgXpLSzZTLuW0iyKv0iUM9N8jXRm4wQWfO0VjCpj69pk/26zq
QEsxsPNA3UYQzMcO8vIOMbYJ8X5LGVK393TvACKt0TBodX4k2dA=
=EKxn
-----END PGP SIGNATURE-----

--ijRhWXEzdUKaiJe1--
