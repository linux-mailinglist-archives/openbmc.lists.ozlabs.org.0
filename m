Return-Path: <openbmc+bounces-264-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59628AE1498
	for <lists+openbmc@lfdr.de>; Fri, 20 Jun 2025 09:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNpWv0S9mz30Nl;
	Fri, 20 Jun 2025 17:10:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750403402;
	cv=none; b=aH5GyDkSv5bMffCYIwZRWma4lbPnOCf8a+NbECI1qjp4WsbuAqzX0oeax3xgE/7LKv98tIRMl/YnKFHLkGe3ptb7sPov0PqI5kcD8KvkiMXnqr4nz6quLN4dtRvPdzgKwl5b3OYZtPf6Ssd3PAYaleZYTe10N//Sqfm4e+zJTurqb9DNXdqmBVQU2RvKfdUfzW178vauTCOte4RXQ9CC8n7/xwYlHid+OFmd653yIzQIamp9MwCeC3MgKqroIzC4Fd9ffpV2748NnYJpcWCL+z9gIzvLRev2ngDsiT+bEUkVOZt6JaL9qvgdMdAfaZPywiNlFcyk+0MqBDz9DdMnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750403402; c=relaxed/relaxed;
	bh=VJVc/Bqimb/04dTPJhdiePqGlWXQYi6s6TXswEG790U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEpztqRhKGHPeM+aFWO/ejjEoKT0p6DgyBe3td3pMUdL6eIAwzv2NTAUO4Z2LU712xwIT938jQ77DGPbsT6hU3gKfmgDBGP7A9Bi9N+m+DH/uxsljlsmS7mNniWJDUMmoE8tDEZ4wdFoD34JgjrEgr8HHNvtYhVKTJNZIE0wbvvWUSzO2+2BUATbzO3jhoHVw+kd0H900lOfct+dm6Z1LtrHKtLzoubi/A83KvkwJnezZxBBXoLhDzJPRS6jq7iL4cCS8ykYwXyFc0rhvyI953xVWaTViJPOkQdepTgDJ2XAlDhV/2hTdPy3uP0wupsK8KV/TquwJRty/9QQ7JB7Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aw8vMIFr; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aw8vMIFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNpWt0Mv5z2xHY;
	Fri, 20 Jun 2025 17:10:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750403401;
	bh=VJVc/Bqimb/04dTPJhdiePqGlWXQYi6s6TXswEG790U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aw8vMIFr+cXE2mO/q8Oyu1dt9tnCq1lFaxSAROzAWBthwSXvbUQkKB1U6L6uCSkLL
	 2+acxXCyNDkhpz0/pbbOIZSy1x4qwTS3WjNq1nqRpnfLjTjFo0L1DCpeNywuHWsQNP
	 /xmQNCIlx4wV06dP6nDW2tuKvxvIBMeL/eGduIs1nknST7JZlIbBB3mMSOWU/HGi7u
	 y2y/qZTIOwZgrg6zSoXs3t0MtVzQOeK7/MmIoI9aK6W0XyouS7MCZ00VA2dRKTZQoU
	 ypcf0Lm4d/vLU3gBemeyjhzLtybrXugWPxjIDkxa8T+/Qx3H+QvBYSdQjl4eD/aXfG
	 wY/kl+cgKfeMA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 40186640A0;
	Fri, 20 Jun 2025 15:09:58 +0800 (AWST)
Message-ID: <10d493cb37748aeb1f4c97856929845727c4c3bc.camel@codeconstruct.com.au>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 vkoul@kernel.org,  kishon@kernel.org, linus.walleij@linaro.org,
 p.zabel@pengutronix.de,  linux-aspeed@lists.ozlabs.org,
 linux-pci@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com,  yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Date: Fri, 20 Jun 2025 16:39:57 +0930
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
	 <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
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

On Fri, 2025-06-13 at 11:30 +0800, Jacky Chou wrote:
> The PCIe RC PERST uses SSPRST# as PERST#=C2=A0 and enable this pin
> to output.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 12 +++++++++++-
> =C2=A01 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 5a7cd0a88687..c751703acdb9 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -17,6 +17,7 @@
> =C2=A0#include "../pinctrl-utils.h"
> =C2=A0#include "pinctrl-aspeed.h"
> =C2=A0
> +#define SCU040=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x04=
0 /* Reset Control Set 1=C2=A0 */
> =C2=A0#define SCU400=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x400 /* Multi-function Pin Control #1=C2=A0 */
> =C2=A0#define SCU404=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x404 /* Multi-function Pin Control #2=C2=A0 */
> =C2=A0#define SCU40C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x40C /* Multi-function Pin Control #3=C2=A0 */
> @@ -52,7 +53,7 @@
> =C2=A0#define SCU6D0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x6D0 /* Multi-function Pin Control #29 */
> =C2=A0#define SCUC20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00xC20 /* PCIE configuration Setting Control */
> =C2=A0
> -#define ASPEED_G6_NR_PINS 256
> +#define ASPEED_G6_NR_PINS 258
> =C2=A0
> =C2=A0#define M24 0
> =C2=A0SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
> @@ -1636,6 +1637,12 @@ FUNC_DECL_1(USB11BHID, USBB);
> =C2=A0FUNC_DECL_1(USB2BD, USBB);
> =C2=A0FUNC_DECL_1(USB2BH, USBB);
> =C2=A0
> +#define D7 257
> +SIG_EXPR_LIST_DECL_SESG(D7, RCRST, PCIERC1, SIG_DESC_SET(SCU040, 19),

The documentation for SCU040[19] says it will assert the reset. I
expect that's not what's desired.

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SIG_DESC_=
SET(SCU500, 24));

SCU500[24] seems okay.

> +PIN_DECL_(D7, SIG_EXPR_LIST_PTR(D7, RCRST));
> +FUNC_GROUP_DECL(PCIERC1, D7);

It only makes sense to describe pins with multiple functions. The other
function this pin has is the reset line for the secondary service
processor. Can we describe that too?

Andrew

