Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D34DD2CC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSBK3X82z30Jk
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=Dlf3eoBU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=Dlf3eoBU; 
 dkim-atps=neutral
X-Greylist: delayed 507 seconds by postgrey-1.36 at boromir;
 Fri, 18 Mar 2022 02:02:25 AEDT
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK9Nd23kSz2yQG
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 02:02:25 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id AD5E02223A;
 Thu, 17 Mar 2022 15:53:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647528833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hyh5t4TKfoidnQYqHVP2vqC50I83Xx9jmc0tLpP0DG0=;
 b=Dlf3eoBU3JxuwJp0t9qUNEYrcPpx2XIxKnh5YLHVURl12SCaTP6ci7wAu3gdGlTVWlKHl+
 tSQXuOteLrEmULdicZc70uyIH0OnWAh8NhuwC5eaXEmJCfrFO5p4k5J2pDDPkKbpJwFXr5
 IRSWVfIURbWPWg3VZlrIL35zsEGQJzo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 17 Mar 2022 15:53:48 +0100
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 08/18] dt-bindings: irqchip: kontron,sl28cpld: include
 generic schema
In-Reply-To: <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-7-krzysztof.kozlowski@canonical.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9bbda22b8ad713bd901e209cda85d65d@walle.cc>
X-Sender: michael@walle.cc
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
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@thingy.jp>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-riscv@lists.infradead.org,
 Suman Anna <s-anna@ti.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Paul Burton <paulburton@kernel.org>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, John Crispin <john@phrozen.org>,
 Birger Koblitz <mail@birger-koblitz.de>, linux-oxnas@groups.io,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Santosh Shilimkar <ssantosh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tero Kristo <kristo@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Am 2022-03-17 12:56, schrieb Krzysztof Kozlowski:
> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Michael Walle <michael@walle.cc>

> ---
>  .../bindings/interrupt-controller/kontron,sl28cpld-intc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> index e8dfa6507f64..1d0939390631 100644
> ---
> a/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> +++
> b/Documentation/devicetree/bindings/interrupt-controller/kontron,sl28cpld-intc.yaml
> @@ -29,6 +29,9 @@ description: |
>      7  n/a           not used
>    ==== ============= ==================================
> 
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -51,4 +54,4 @@ required:
>    - "#interrupt-cells"
>    - interrupt-controller
> 
> -additionalProperties: false
> +unevaluatedProperties: false

-- 
-michael
