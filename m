Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FE4DD2BA
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS2Z6MRYz308B
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:02:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=olEP/6Gm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=olEP/6Gm; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hl5MDYz2ynx
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:55 +1100 (AEDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2A04F40160
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518273;
 bh=LNamuvhrzviKyHuQ4L0rCxs+G11+opr3Fg5u/5wPXa8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=olEP/6Gm/JBG/+GSivmTYckQEmW7KS9x1pdGKCGCFQMqYA9c9uKlqPSaaocHhddJl
 Ql9LemGCC2pzvT2rAlh3VfU3j30l0fAqXUQ9nXbaRhnlWiIOqHBkMjruMqbkFCcGup
 HixTYPLLSWge4d9E3JL3ai6xk8BCGNoJFSIe9lE+yvsaO78ZUVBMY01rlkalmtcsEj
 GZGKzAVAp4aaX0y4mxIUoRcn+KeEBRV/n1ktwmnt3rWnM04MNO0TdHCKDuA5ClQOF9
 BwluZwGqMoOf6sLTuSe5dBsq/H87GfSPb2ynoDkWqbfjyzML2Pir3esfwIr3DuTUww
 OzetY7JXvsXfg==
Received: by mail-wm1-f71.google.com with SMTP id
 r83-20020a1c4456000000b00385c3f3defaso201039wma.3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNamuvhrzviKyHuQ4L0rCxs+G11+opr3Fg5u/5wPXa8=;
 b=csFWwrqNnz6MzuJdKNJy1VFkTwdmQ7GwfrB8IX5uAxR9QEFINuW4EuWVJwwWanijR0
 uQmi20TgyaAT59AdBS5mojAaFqCHPGtW0ngox1kocs5exUKOaMjK+XTOgpSl8EJAizB7
 u6nI/exoRZ3TA7eBcz1EjJGqSnR41G4ZWbKXEw0kxAwEvDluK6a9sqyggVVMB/TRCfGj
 UYWFkDdN21XUY0Ey8djD6GovtIkrrPyCFJoUkJzP05Yhj6OOV6jG0GMTtyB7mhsavwbE
 5iXpgcqvSEaGx6aa8UfSrMeTwVz2H2iHUWttQAnh0cY/u9NyvuzULiYfzfzi8XOKIjED
 Wjtg==
X-Gm-Message-State: AOAM530Ixz3F2plOhWm7QYr7R8FJ2mD6SZwkluLbAmTdwxRbdn6nnU4x
 Ln5MSZrvLCqEkNc5VaJoKtDvdPgOHsqEXuwLkKudt/EtUjUYJdO5vA4LtAGa/EboSJNkx/6Ps6A
 uL1dXLEe+U8YJMJE6h0NbUI7g9gAdjiWwu8kR
X-Received: by 2002:adf:ee06:0:b0:203:d69f:ee6a with SMTP id
 y6-20020adfee06000000b00203d69fee6amr3573313wrn.376.1647518272278; 
 Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmlGAG4WbY9Y9ECnGHhG7nICuH9qeB/Pd7q3rLG8W4tmsHHiqlovZiXlafy2xr1sXRMtPxDw==
X-Received: by 2002:adf:ee06:0:b0:203:d69f:ee6a with SMTP id
 y6-20020adfee06000000b00203d69fee6amr3573270wrn.376.1647518272033; 
 Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:51 -0700 (PDT)
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
Subject: [PATCH 16/18] dt-bindings: irqchip: renesas: include generic schema
Date: Thu, 17 Mar 2022 12:57:03 +0100
Message-Id: <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
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
 .../renesas,intc-irqpin.yaml                  | 28 ++++++++++---------
 .../interrupt-controller/renesas,irqc.yaml    |  5 +++-
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
index f4aae56c6469..2a55581e0f4f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
@@ -65,19 +65,21 @@ required:
   - '#interrupt-cells'
   - interrupts
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,intc-irqpin-r8a7740
-          - renesas,intc-irqpin-sh73a0
-then:
-  required:
-    - clocks
-    - power-domains
-
-additionalProperties: false
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,intc-irqpin-r8a7740
+              - renesas,intc-irqpin-sh73a0
+    then:
+      required:
+        - clocks
+        - power-domains
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 620f01775e42..ab827bd8590f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -9,6 +9,9 @@ title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -70,7 +73,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

