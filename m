Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE14DD2C0
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:06:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS6r4wBVz30HC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:06:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=fpLyMj79;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=fpLyMj79; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Ht4BQ0z3096
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:58:02 +1100 (AEDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 50A094004C
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518275;
 bh=upn41SGXInxzeh9yeucVbbgZI6J+Vh9tnHYXNDkdf7c=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=fpLyMj79tfCb6qmHPOQVsyVDVKHS73zVaXq6OaVh1B/sdJynfTPi+FavLuXRbjomc
 dOcaRbgTiBkeuAo5BI+GWqOri+jmFPDJws99npgsTafYguJtedUyXxqsZciY+vLJEN
 Av4fs17UdO20F4L7vdSY7DczE3uJWPSn3G99eNvilTSlivWE7wXvo2+KvYgFTt58tv
 v0YUvC848yWiMQa9BRuO5nsaYIvIkJMrhgnr0URK2gEAHyJ5z+5sYN55VuVHBrospF
 OouTENcOpXfs+448xyG4s6Qqgen6gF6P0qIZ3JOo35z2EZLbvQoXJJ3InQ11jaR9+O
 k04vhlAk4+2wA==
Received: by mail-wm1-f72.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso2027877wmq.3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=upn41SGXInxzeh9yeucVbbgZI6J+Vh9tnHYXNDkdf7c=;
 b=LW9xB1XOBBfFWDOoLx2U1yUDhLYyPZE/40QHeM1LoC89mHJxR0TaRFrOtZiIr18rAh
 /PNl2CDZzHiOu/NqRY+KUo+7jwLfAB73o95cSUR3sNzFMjkElDYgDVxDhxGWXQGvJDip
 9xxiopLxlDVUx4iBfSXUKKILdsMxxuK8ec4JjsL1yrPn8fvIKO0kK4BNuNVGV12SIxxf
 00rTHm4Y0afs/hePR/5ayuCsqrKd4OgMnVN1k9kFEIVL8+7ifO9DiL35Ap1M+y0F0RZg
 972VOM/KGPGLKSEnDvlnLYr1hUWe2v7FrVoozGgAT/9VvYLnciWqYExqSq4k3FcVabMm
 KAhQ==
X-Gm-Message-State: AOAM530mHVKe3oYWpvkRpsR5gujKAO3LzSErQ57wb/p7jZGT1egO27y5
 ZfyhKy4vAmYxkuGibcW4bR4v8cW5A+DQ22LUo3GeJ4S406Pae1vyOguczhEz/BU4TgRFUuFbTBd
 /XKEL0b1GTEB7vbdgVUT+IMTevK9Klw93lWDJ
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr3598842wmq.17.1647518261203; 
 Thu, 17 Mar 2022 04:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaJnwGCDWCgNxVBPz8602WsRzPCQWkTc7stpH5PT+AGMHTpue3CNd76a9vbasK9iibDzPBWw==
X-Received: by 2002:a05:600c:4e12:b0:38b:b715:18a6 with SMTP id
 b18-20020a05600c4e1200b0038bb71518a6mr3598815wmq.17.1647518260943; 
 Thu, 17 Mar 2022 04:57:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: [PATCH 12/18] dt-bindings: irqchip: mstar,
 mst-intc: include generic schema
Date: Thu, 17 Mar 2022 12:56:59 +0100
Message-Id: <20220317115705.450427-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/mstar,mst-intc.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
index bbf0f26cd008..7cae52490ff5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mstar,mst-intc.yaml
@@ -16,6 +16,9 @@ description: |+
   The HW block exposes a number of interrupt controllers, each
   can support up to 64 interrupts.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: mstar,mst-intc
@@ -49,7 +52,7 @@ required:
   - reg
   - mstar,irqs-map-range
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

