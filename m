Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824DF4DD2D1
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSBv2tZSz30Jm
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:09:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mediatek.com (client-ip=210.61.82.184;
 helo=mailgw02.mediatek.com; envelope-from=mark-pk.tsai@mediatek.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 304 seconds by postgrey-1.36 at boromir;
 Fri, 18 Mar 2022 02:14:39 AEDT
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK9fl3krvz2yK2
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 02:14:38 +1100 (AEDT)
X-UUID: 38b6bbde99fe4e84aeb373ab1ed4adbc-20220317
X-UUID: 38b6bbde99fe4e84aeb373ab1ed4adbc-20220317
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1317117794; Thu, 17 Mar 2022 23:09:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 23:09:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Mar 2022 23:09:19 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 12/18] dt-bindings: irqchip: mstar,
 mst-intc: include generic schema
Date: Thu, 17 Mar 2022 23:09:19 +0800
Message-ID: <20220317150919.2089-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
References: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: nm@ti.com, bert@biot.com, geert+renesas@glider.be, narmstrong@baylibre.com,
 lokeshvutla@ti.com, paul.walmsley@sifive.com, jiaxun.yang@flygoat.com,
 cristian.ciocaltea@gmail.com, paul@crapouillou.net, daniel@thingy.jp,
 sagar.kadam@sifive.com, linux-riscv@lists.infradead.org, s-anna@ti.com,
 mark-pk.tsai@mediatek.com, paulburton@kernel.org, maz@kernel.org,
 openbmc@lists.ozlabs.org, qiangqing.zhang@nxp.com, ssantosh@kernel.org,
 mail@birger-koblitz.de, devicetree@vger.kernel.org, jason@lakedaemon.net,
 mani@kernel.org, linux-actions@lists.infradead.org, j.neuschaefer@gmx.net,
 yj.chiang@mediatek.com, robh+dt@kernel.org, khalasa@piap.pl,
 tsbogend@alpha.franken.de, john@phrozen.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, kaloz@openwrt.org, kristo@kernel.org,
 linusw@kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@microchip.com,
 dinguyen@kernel.org, michael@walle.cc, palmer@dabbelt.com, krzk+dt@kernel.org,
 linux-oxnas@groups.io, afaerber@suse.de, l.stach@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/interrupt-controller/mstar,mst-intc.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> index bbf0f26cd008..7cae52490ff5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
> @@ -16,6 +16,9 @@ description: |+
>    The HW block exposes a number of interrupt controllers, each
>    can support up to 64 interrupts.
>  
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
>  properties:
>    compatible:
>      const: mstar,mst-intc
> @@ -49,7 +52,7 @@ required:
>    - reg
>    - mstar,irqs-map-range
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.32.0

Acked-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Thanks.
