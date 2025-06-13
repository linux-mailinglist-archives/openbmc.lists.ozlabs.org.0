Return-Path: <openbmc+bounces-198-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D0AD82E2
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 08:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJTLc4g7Qz2ynh;
	Fri, 13 Jun 2025 16:02:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749794520;
	cv=none; b=gqV5LroDxk5dxT4jpJM9JIOrwA2qSrx6zLPyNidAYlt5s5lHzspsKubZLQ6C9yRsyyqgC2Z3liV2Wmial7cTaIaZyfNOL4P6CGdQjV5kZy9l6OHmrzfsTeofKgFmNeABjbS0u8dWwkhh/bS8sxZOHuSujaAIaO4oxSXnrnk+caP6n+Ri6s4ESNOFB4IY6q+J7arhwarFvg0hIMy7vLxDkVg6cvONnVuIZtLBnKhJ7y3ehnxgR1w2m6ZWTfMUxo0X7rKGuQhfda5jxG8C/pbgaJ60/+g19Ow+hvLfKFpmkSMEv/Z4DipYxX8SKz+eH6gR+SxMSG7iC8icVNs5txMcng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749794520; c=relaxed/relaxed;
	bh=vRQ8ZMLoPbaFwDBltMJ6qOm3lZshTN9aIziq1KOpcok=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tq+izrFHvx4CZWNgsue8bAGlWRgri/oafEDoySRFg3qmv6YMIBWxB4pvnFrZJwyojWQbDpstE3x3Q303tuYhL7DaOgcKBXkFUWEFC03jDY7ZCQJ65WxfWPG5/eW5cFkdGQUZac3x35sWemMBxBa55Dv34MB92xY789amcmi4tOWuKE/PZYAO9CL9aByZmrWiW03VfoDNLzQvxS937xRGtOG1NsMrNKAvJpdEfdwfQYs9/v1uVt6wYp6kvWrBCcrUOPo7a6Z3zQbAal4M6lpo9Vy1gzic/Z1u5WlI7aCZD9GcHIJD0CrMkwRZdeMTRb7C64C3/Pb3C3OmK3Ppc2mzYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WcpOqxT/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WcpOqxT/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJTLb6XKPz2yMF;
	Fri, 13 Jun 2025 16:01:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749794519;
	bh=vRQ8ZMLoPbaFwDBltMJ6qOm3lZshTN9aIziq1KOpcok=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=WcpOqxT//6fi8yZ2KKz/UJrAIKrqIw//zlTiWMPiqHCy4NOCEmX4tyHVtzUXDhwLn
	 cRoIDAIk+l0Yh1wp7os+nkjxPA+5MD0/OBlHkEcfONl7qTeVho7jSP35g+JuCJ87gm
	 3ONEa92gOEh28qKDV5uOSHdnJ6YbYZh1Yi9fmmXuC73pcAE9HvJI4OIZxjyo41nloI
	 /sbDbWU/IWvNqfAF9nPvH1K8i23NwP+e4OmYRV2tLlVuzMJ/FZ2DZbQHsO/INXmKdQ
	 UpGmF7O0hdQf93ZOMxLhMjKm1MJKmkxWxpMJ5w+svteD2N183MO2IzAhOR7iUDpQlQ
	 3p5fnOe4gD0sA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8A86680F3;
	Fri, 13 Jun 2025 14:01:58 +0800 (AWST)
Message-ID: <2cfe3813b7e330ba43f20a882c0c5035751fc7f0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed: Log error if SCU protection is active
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tan Siewert <tan@siewert.io>, Linus Walleij <linus.walleij@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org,  linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Fri, 13 Jun 2025 15:31:57 +0930
In-Reply-To: <20250612151900.32874-1-tan@siewert.io>
References: <20250612151900.32874-1-tan@siewert.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-06-12 at 17:18 +0200, Tan Siewert wrote:
> ASPEED pinctrl and other drivers accessing SCU registers rely on the
> bootloader to unlock the SCU before handing over to the kernel.
>=20
> However, some userspace scripts may re-enable SCU protection via
> /dev/mem,=C2=A0
>=20

Hmm, if this was caused by poking /dev/mem, then I'm not sure I'm in
favour of it. The source of your problem wasn't apparent to me in our
off-list discussion.

"Don't do that" :/

> causing pinctrl operations such as disabling GPIOD passthrough
> to fail in not-so-obvious ways. For example, a GPIO request for GPID0 on
> an AST2500 fails with:
>=20
> =C2=A0 [=C2=A0 428.204733] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() =
failed for pin 24
> =C2=A0 [=C2=A0 428.204998] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-24 (1e=
780000.gpio:536) status -1
>=20
> With dynamic_debug enabled, the SCU write failures become visible:
>=20
> =C2=A0 [=C2=A0 428.204657] Disabling signal GPID0IN for GPID
> =C2=A0 [=C2=A0 428.204673] Want SCU70[0x00200000]=3D0x1, got 0x1 from 0xF=
122D206
> =C2=A0 [=C2=A0 428.204708] Want SCU70[0x00200000]=3D0x0, got 0x1 from 0xF=
122D206
>=20
> Since SCU unlocking would need to be done in multiple drivers, adding
> unlock logic to each is not viable. Instead, this patch adds an
> explicit error message and early abort in `sig_expr_set()` if SCU
> protection is detected by checking the SCU Protection Key Register.
>=20
> Before:
>=20
> =C2=A0 [=C2=A0 428.204733] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() =
failed for pin 24
> =C2=A0 [=C2=A0 428.204998] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-24 (1e=
780000.gpio:536) status -1
>=20
> After:
>=20
> =C2=A0 [=C2=A0=C2=A0 43.558353] aspeed-g5-pinctrl 1e6e2080.pinctrl: SCU p=
rotection is active, cannot continue
> =C2=A0 [=C2=A0=C2=A0 43.559107] aspeed-g5-pinctrl 1e6e2080.pinctrl: reque=
st() failed for pin 24
> =C2=A0 [=C2=A0=C2=A0 43.559434] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-2=
4 (1e780000.gpio:536) status -1
>=20
> Suggested-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Tan Siewert <tan@siewert.io>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 21 +++++++++++++++++
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 24 +++++++++++++++++++=
-
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 26 +++++++++++++++++++=
+++
> =C2=A03 files changed, 70 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g4.c
> index 774f8d05142f..81680c032b3c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -28,6 +28,8 @@
> =C2=A0#define SIG_EXPR_LIST_DECL_SINGLE SIG_EXPR_LIST_DECL_SESG
> =C2=A0#define SIG_EXPR_LIST_DECL_DUAL SIG_EXPR_LIST_DECL_DESG
> =C2=A0
> +#define SCU_UNLOCKED_VALUE 0x00000001

Bit of a nit-pick but I'm not sure this is worthwhile, or that the
leading zeros are necessary. I'd be tempted just to use the constant
'1' directly inline ...

> +
> =C2=A0/*
> =C2=A0 * The "Multi-function Pins Mapping and Control" table in the SoC d=
atasheet
> =C2=A0 * references registers by the device/offset mnemonic. The register=
 macros
> @@ -36,6 +38,7 @@
> =C2=A0 * reference registers beyond those dedicated to pinmux, such as th=
e system
> =C2=A0 * reset control and MAC clock configuration registers.
> =C2=A0 */
> +#define SCU00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00 /* Protection Key Register */
> =C2=A0#define SCU2C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x2C /* Misc. Control Register */
> =C2=A0#define SCU3C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3C /* System Reset Control/Status Register */
> =C2=A0#define SCU48=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x48 /* MAC Interface Clock Delay Setting */
> @@ -2582,6 +2585,24 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pi=
nmux_data *ctx,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (desc->ip =3D=3D ASPEED_IP_SCU && desc->reg =3D=
=3D HW_STRAP2)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con=
tinue;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * The SCU should be unlocked, with SCU00 returning 0x01.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * However, it may have been locked, e.g. by a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * userspace script using /dev/mem.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0u32 value;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0ret =3D regmap_read(ctx->maps[desc->ip], SCU00, &value);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (ret < 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return re=
t;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (value !=3D SCU_UNLOCKED_VALUE) {

... i.e. `if (value !=3D 1)` here

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(c=
tx->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"SCU protection is active, cannot co=
ntinue\n");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -E=
PERM;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0}
> +

Doing this test for each value in the signal expression seems a bit
excessive.

I was suggesting we only print the warning if we detect the writes
failed to stick (this is checked towards the end of e.g.
aspeed_g4_sig_expr_set())

Andrew

