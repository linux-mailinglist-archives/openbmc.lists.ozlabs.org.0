Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A14DD2B6
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:00:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKS0S4mJLz2ypV
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=o2Myfdqd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=o2Myfdqd; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5HN0Xt3z3085
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:57:36 +1100 (AEDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC1393F614
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518253;
 bh=HVRdo0a9Zp5ow/1mp1AbDSb5pnZ9OyDrT3JP+Xnx0c8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=o2Myfdqda1ht42ob/185ihNANRolha7l0O6teM6y3Dv0qx6W4zj539iJagEBffJ7s
 v36xPgBKWsatQbFLnRumn8i2NMC4JBhqM83Sr08AnVjZ1Due3NqY7B/m7Rs3vYdk0l
 vBLdHxzVoMgnJnnzoejkzfzn6Z3AGpaYk4ueSNDA03xFvwZ/z4F1QP+aWYW9XqAnwN
 PUW3gWeW/79UZHZm2gx3hi7hqs3xGck424x4x/T491YcdtqjNVw42qBxAzEY71zN1a
 pfE4yEHi+tm+YbcXWZJorZ2R7p26k60S0v0FpmzgKUyYWUgVLG8+f03AtJgtNSVGWU
 BnZ+MzXdlSzxg==
Received: by mail-wr1-f71.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so1465463wrh.16
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVRdo0a9Zp5ow/1mp1AbDSb5pnZ9OyDrT3JP+Xnx0c8=;
 b=1apEd8Hcjj5GUsv2ASWKY7MzdO26ljq8C1z3EXd8lAP6JgwOywfusbKn16RjjE0XyY
 9Ha+vLvJG7wOgKzOZTqkAM+5trnn3zwOBSaymfGGagpVx5XTYEb1jwHYuNQNcvoeLELY
 kHZFZSkuvUdABCP5C2vrG+LUrX3Pt4YajCELX0XYHxGAqKChOGkJ98e05Y0IxBYgWBLO
 IK8hsdaf4qEhfZPVaC+L1M6qHy5rswWYA0Sdh2Gobzb7QvxLoiWe3ItTVAlFMg6V9nOh
 vJHVVhd3HIN7lkccJe89ctG3M/3ear1i7CeFhWrr3lJqsTmZjF4FqzI9PcXpPNGcfIFu
 TMLw==
X-Gm-Message-State: AOAM5305dHGoDMhzth8U+V+bkpsJgxwRmAGmNLlc3qxc2UryB6gPEigX
 OdjSn/0nyr3hJO1kpxqoioN2ejSZuErgYCsnk2XcwzLaXQHvQqnivomjS4ZMvLMDrZCUFg72sTI
 2u90Qv0U7cFEXv7BWq0yBRge972G5GaWt4jQw
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr3514935wms.75.1647518253408; 
 Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3/O+rMez/BwQ/7F1CSUo1QHlpo1ME2REeH/FIItXP6CKvP9B/nZFl1eiLRHNeDKPj7C+b9g==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr3514901wms.75.1647518253208; 
 Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:32 -0700 (PDT)
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
Subject: [PATCH 09/18] dt-bindings: irqchip: loongson: include generic schema
Date: Thu, 17 Mar 2022 12:56:56 +0100
Message-Id: <20220317115705.450427-8-krzysztof.kozlowski@canonical.com>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/loongson,htvec.yaml        | 5 ++++-
 .../bindings/interrupt-controller/loongson,pch-msi.yaml      | 5 ++++-
 .../bindings/interrupt-controller/loongson,pch-pic.yaml      | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
index 87a74558204f..d58cbc852b09 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
@@ -13,6 +13,9 @@ description:
   This interrupt controller is found in the Loongson-3 family of chips for
   receiving vectorized interrupts from PCH's interrupt controller.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: loongson,htvec-1.0
@@ -37,7 +40,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
index 1f6fd73d4624..9b6d69066e54 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
@@ -14,6 +14,9 @@ description:
   transforming interrupts from PCIe MSI into HyperTransport vectorized
   interrupts.
 
+allOf:
+  - $ref: msi-controller.yaml#
+
 properties:
   compatible:
     const: loongson,pch-msi-1.0
@@ -46,7 +49,7 @@ required:
   - loongson,msi-base-vec
   - loongson,msi-num-vecs
 
-additionalProperties: true #fixme
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
index fdd6a38a31db..0c7bee42946a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -14,6 +14,9 @@ description:
   transforming interrupts from on-chip devices into HyperTransport vectorized
   interrupts.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: loongson,pch-pic-1.0
@@ -41,7 +44,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

