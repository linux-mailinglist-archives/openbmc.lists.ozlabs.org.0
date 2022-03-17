Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49E4DD2AA
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 02:58:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRxf1rxMz30Cm
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rj118Ytk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=rj118Ytk; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5H74kXMz307C
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:23 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 67BF93F618
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518241;
 bh=BPmH+sTMtK9KvdlWBUTtE4tsLSFnUjRMwkwF+kfhktM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=rj118YtkSon9h0dPV22tuA3vMTqP+/zuM5UautuqeC29vJzntM054cDSA74PUjMt/
 8sj7cyPAFnJ3XpunORwy634HX1L0VOINNfMezDMJKqI6PbEevw3fOaaGDT/Hau0RIQ
 mjz5t5eL74R12v1jaJ3ZMK0rTKiZ47xnoAmMCZbraSPtdVDXPN51go5I2XifG8Tm+V
 hv6F4YQTYi7veElE2eonUs0Wtns2/AbeB0+sBCgmtA36GEi6cx4fhMfobKLt7XSVls
 7elKmCNl3FJwEFtk+MMWkCj0vWiFhtdhy3d3mdaRhJISQRxVLNuRS7MqEtxEMLnIFm
 aEh1gnYE9O87A==
Received: by mail-wr1-f69.google.com with SMTP id
 s8-20020adfc548000000b00203eba1052eso355003wrf.1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPmH+sTMtK9KvdlWBUTtE4tsLSFnUjRMwkwF+kfhktM=;
 b=Mw89zvZCckFSJUU1uUWJjmoGWJvVoCVeYTbsSO4wITWXILDxQ40n82vfpxR4abvOEq
 utEtQ2WRDCodNtqbEuabJj513A4OsnxCHCfzWXwI9umaherGOGb0xZT6j8JnFBjtEP9N
 3yGpr3ZIzOfZuRx7UZcaY5mcxRrduvMm11b/7PB9MlnQn90EmwdtQQLI1yUZ3gTAOOBW
 NhP7Cee4iKnPArqstnswyYwkcZFiPBOss9TapkBL1ve7Y69fdiZJE2UrXgQQ3r/LPfWY
 0jqyzhuTZ6m1u7MuqM8h4bHcmXQcHd24A6c79qMqKxLgI3iK5gVBb54pVCs3m22vHaBw
 n94A==
X-Gm-Message-State: AOAM532mnpJVdmwwdZe7W83UrBh5TiHYTHQUK3npI9KuN59uVy0R+DHo
 ZuLjm1plyvF/Lx0CUWTzSinN9X9GSYDP8v8HbpFi8QL9Ap+2jz0nbb6ln2EPG7cIOhbHb9HHB9p
 g4jELarKf9pC0ifG92PKy24+5kzlrBVspLz4w
X-Received: by 2002:adf:e746:0:b0:1ef:8476:dab3 with SMTP id
 c6-20020adfe746000000b001ef8476dab3mr3772417wrn.449.1647518240631; 
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQHNNPp+cT6LCWfeTjsbKn2oDv2UQ8R2ucYLdbIGsLwf9N7IdLuy6eC+hFFDvk8H5WgkaZvQ==
X-Received: by 2002:adf:e746:0:b0:1ef:8476:dab3 with SMTP id
 c6-20020adfe746000000b001ef8476dab3mr3772388wrn.449.1647518240413; 
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
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
Subject: [PATCH 05/18] dt-bindings: irqchip: fsl: include generic schema
Date: Thu, 17 Mar 2022 12:56:52 +0100
Message-Id: <20220317115705.450427-4-krzysztof.kozlowski@canonical.com>
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
 .../devicetree/bindings/interrupt-controller/fsl,intmux.yaml | 5 ++++-
 .../bindings/interrupt-controller/fsl,irqsteer.yaml          | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
index 1d6e0f64a807..5ead6b7dcb42 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
@@ -9,6 +9,9 @@ title: Freescale INTMUX interrupt multiplexer
 maintainers:
   - Joakim Zhang <qiangqing.zhang@nxp.com>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: fsl,imx-intmux
@@ -45,7 +48,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index bcb5e20fa9ca..4b5080f754ea 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -9,6 +9,9 @@ title: Freescale IRQSTEER Interrupt Multiplexer
 maintainers:
   - Lucas Stach <l.stach@pengutronix.de>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -70,7 +73,7 @@ required:
   - fsl,channel
   - fsl,num-irqs
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

