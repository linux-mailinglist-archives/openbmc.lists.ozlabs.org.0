Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B54DD2CB
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:08:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS9f2xPHz2xVq
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:08:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.a=rsa-sha256 header.s=mail header.b=DA60gc/c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.197; helo=aposti.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=DA60gc/c; 
 dkim-atps=neutral
X-Greylist: delayed 447 seconds by postgrey-1.36 at boromir;
 Fri, 18 Mar 2022 02:00:22 AEDT
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK9LG0mlFz2xVb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 02:00:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647528764; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVYJfPU0rzzGa9hX02z9sV1yDGsv5kDMcOfss8bv8eQ=;
 b=DA60gc/c3O8sCB3ECGs5CZQzjoDCZ/waPK9k7Zq4U7G3cdq3ndgtsDeflLRpFdP5rWBvGm
 6ZzEaKzLG70I+KcjgiY8Tf4K21S6xik2OJpvAba9nnqS+tQeil+vC9kxMNsHnFjShS9Jj4
 AeKBbEbYiofc5rJMCXES0b70ObmpB/M=
Date: Thu, 17 Mar 2022 14:52:28 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 06/18] dt-bindings: irqchip: ingenic: include generic
 schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-Id: <GB9W8R.4WH3AK5NKGDC@crapouillou.net>
In-Reply-To: <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: Nishanth Menon <nm@ti.com>, Bert Vermeulen <bert@biot.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Daniel Palmer <daniel@thingy.jp>, Sagar Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, Suman Anna <s-anna@ti.com>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Paul Burton <paulburton@kernel.org>,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 John Crispin <john@phrozen.org>, Birger Koblitz <mail@birger-koblitz.de>,
 linux-oxnas@groups.io, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 Jonathan =?iso-8859-1?q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>,
 Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Le jeu., mars 17 2022 at 12:56:53 +0100, Krzysztof Kozlowski=20
<krzysztof.kozlowski@canonical.com> a =E9crit :
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  .../bindings/interrupt-controller/ingenic,intc.yaml          | 5=20
> ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yam=
l=20
> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yam=
l
> index 0358a7739c8e..74597a98f86c 100644
> ---=20
> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yam=
l
> +++=20
> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yam=
l
> @@ -9,6 +9,9 @@ title: Ingenic SoCs interrupt controller devicetree=20
> bindings
>  maintainers:
>    - Paul Cercueil <paul@crapouillou.net>
>=20
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    $nodename:
>      pattern: "^interrupt-controller@[0-9a-f]+$"
> @@ -50,7 +53,7 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
>=20
> -additionalProperties: false
> +unevaluatedProperties: false
>=20
>  examples:
>    - |
> --
> 2.32.0
>=20


