Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3E4DD2BE
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:05:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS5Q1Hdgz3069
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:05:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=UJENPipi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=UJENPipi; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5Hs0SLjz30CP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:58:01 +1100 (AEDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3EBA43F312
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518277;
 bh=Se1x08TIKnomHmbPOsCcljQ9abxNVpGR1lbzQcpKc/g=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=UJENPipivXARjcYMWZngLJyBgVhk04DXb1JxK/2q6V9gINK9bfX0Pm+vkcGhT163g
 eZpsPThD9RdnxQ2qy9IniSb6ZlykgS4LYz//Q82Os3wWJHC+4eef9ynzkDQL4XSSwv
 FWhq68XS1a1ZWaoNAKaFQcJGY7a4/tawWEAzu06b2BRsZ0jHHBs3LxBw5BJzEylQxJ
 E36+xKJfhsTfrNQQJRqjg/z9hyoWWWf3Yu1kXv/TltBokqCHLcNQRx/w/SSQ8e63xs
 kz/+Dsk6iRGDh5utAcyBvMOFb6HIg0125NgKLp4HRE2hyv5DbwOyHAh7JAeCI9i86U
 hkl0e48DyYz2Q==
Received: by mail-wr1-f72.google.com with SMTP id
 71-20020adf82cd000000b00203dc43d216so1471271wrc.22
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Se1x08TIKnomHmbPOsCcljQ9abxNVpGR1lbzQcpKc/g=;
 b=j91VrlS+PQzeTNVHALJgLP1vnn+6uLtBXZ+iQoNxcPpQEEGO0yJLIgNuPolx59jOAs
 M8Jerf5QVicQDzqm85y1TLudWzUuOYIZsQRB5NllTk7FlEJANbAtNbGz//yIhF97LjQF
 GnmvQiekUNwE9h1qmQ2PVLJORb1hnp7CNSmVli/vUI8Yt/b+rocFc2ye979gZO+yN+nT
 uofVuqMu0RM065WaTXHKjIqFvz8mG4GD+J9alXX4yLhKChehLgI8Ce7ZCeNZd0KhWSKn
 kIMcBHFRMigx/1gHD0r5JnlvjiDzBVE36PAmALjLsZ7uRfHOXUBoQFHtKaEwC1JXif/F
 3nFA==
X-Gm-Message-State: AOAM531G7IP0y2l40BV9KueoLApeKiF5qmsw9OkY55fCF0cFjQjD7dww
 Z5UQrcSBeP906UJDkC9IgGgY4MT+KZbgnuQ5oXX1FfLUoVEf0ep79DaJ1XRHpU50E80jslgu2LU
 IDJlLOfXFXCs/fUmmP20BfSICrRnK44ORY+kL
X-Received: by 2002:a1c:7312:0:b0:38c:6f75:ab28 with SMTP id
 d18-20020a1c7312000000b0038c6f75ab28mr5970891wmb.19.1647518276640; 
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzGz1twNJ92VnBy+RepCLy4U1K/Q67OukVWGeTcahnkhBl7wcOvPZo8IwHXQJMuUSC1th66Q==
X-Received: by 2002:a1c:7312:0:b0:38c:6f75:ab28 with SMTP id
 d18-20020a1c7312000000b0038c6f75ab28mr5970841wmb.19.1647518276425; 
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:56 -0700 (PDT)
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
Subject: [PATCH 18/18] dt-bindings: irqchip: ti: include generic schema
Date: Thu, 17 Mar 2022 12:57:05 +0100
Message-Id: <20220317115705.450427-17-krzysztof.kozlowski@canonical.com>
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

Include generic interrupt-controller.yaml and msi-controller.yaml
schema, which enforces node naming and other generic properties.
The schema requires now proper naming of node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/ti,pruss-intc.yaml         | 5 ++++-
 .../bindings/interrupt-controller/ti,sci-inta.yaml           | 1 +
 .../bindings/interrupt-controller/ti,sci-intr.yaml           | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
index 65523d9459d8..983d10da4463 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
@@ -32,6 +32,9 @@ description: |
   This interrupt-controller node should be defined as a child node of the
   corresponding PRUSS node. The node should be named "interrupt-controller".
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   $nodename:
     pattern: "^interrupt-controller@[0-9a-f]+$"
@@ -106,7 +109,7 @@ required:
   - interrupt-controller
   - "#interrupt-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
index 88c46e61732e..935a61504aa0 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+  - $ref: msi-controller.yaml#
 
 description: |
   The Interrupt Aggregator (INTA) provides a centralized machine
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
index e12aee42b126..0d35a5e21a64 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
+  - $ref: /schemas/interrupt-controller.yaml#
 
 description: |
   The Interrupt Router (INTR) module provides a mechanism to mux M
@@ -92,7 +93,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    main_gpio_intr: interrupt-controller0 {
+    main_gpio_intr: interrupt-controller {
         compatible = "ti,sci-intr";
         ti,intr-trigger-type = <1>;
         interrupt-controller;
-- 
2.32.0

