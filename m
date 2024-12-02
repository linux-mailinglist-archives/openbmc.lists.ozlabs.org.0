Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 708039E0F07
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 23:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2JrC0HwVz3d81
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 09:49:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733107029;
	cv=none; b=Omz41hLwFGNU5qDAYwPlJTv0TU/v7C3hBuSffSkKjWsAeemnxR2L3tNUAjyr8UyIA2lJdF0in5v5RA+di3yGNbCjnKLu7ktQVPYhvdsMt4zFXUHrpAgIOe4F5xX9L+f8Q+HxEorA8IvnI1wSOBlned3N/S4ZYy6XrUrGuZ6jpoM9c3b6f31uwlvbiGP3icKypMWpQVE+kpvNw6n0M/nhyv3kUBA5MC+nr6JPip8YARdXyoArQINVWeygTRvnwJbFdwwKtS5ftXbdyJK2optTIvxImPE/VYvqMaskSDBsMnu+T34b3L+hO2bBrLM8wI4igkxdDvAne4JVcelSgclZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733107029; c=relaxed/relaxed;
	bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1ZqAXUXgSwTlTNCz/+EoVnEnqx2evZFyDiJSFOD0JpFiMZGjeoHIDSdwa1RwG0UVlMo28fB7fTT0eYKAN0DsYQbDE0Uv0b0KH2HlLXhovMjS4+7+/EZM/nW4ZpZrHwZtvyCu3NZCw0VpDt0ut/eOxX5nq1srocYGNJxH9dQPlvl5INj4vWLEOW0OoDMnBwIBqZTdOTd1RtDQUxaD0sOIH6KJXvcohO64EeouL2pX5ATyd2ypr7a31FraN6F/F/1QXRZge/SJ1xNyfVeRFC31c2XjaZGsq5ppJqGkbju2ZG/6csYI1fk9/lAcc1Je8nw5x6b5zOEYO5Oq8h4pstnzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+dYyEdW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X+dYyEdW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1nxJ2bWzz2yYd
	for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2024 13:37:07 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-215770613dbso5425685ad.2
        for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2024 18:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107025; x=1733711825; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=;
        b=X+dYyEdWtolRuD8x7r4s1T919YAXFoDJWn++SnHxmMiIgBJNddVzdvrBw0IQxlTN8R
         TY0uf7yPruukhaKkw8sxAIABo++tCbI4ykybsnGriXkLkif8hyOgdeudtjPFojBSCYO7
         s9MAjp/CI05UZuGu1R9zwmysC2MVayvTyw5HbhKYClSWn+Bc5GWuCB3X0q4piTsrpOeZ
         XoHSCeRJZs5kTMbcuV4dShqgNgtVWKdyi3kUo7N0FpYC2HStmnjGQk99W+piZWalH0Zj
         4FwjNqhqJbEJyTJTVz4MjejjrnANNDqAIDVu3hCvlYcz+BX5d+nhdGdJ07C+wVY/nD7z
         DXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107025; x=1733711825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG94va8ypf99d2NskGYXMHjsD3eWiwiqY5c/5WU2nZg=;
        b=f5WB3AChgyBx4X34rjg1Q6Oz0nZB/OZ+u7C90XZA9KF8sNkLIN5TSEbRi+LSwfkjQ0
         re4u72hrYASoOO2kgADgCz7hqFPLngwrEaTNdlTnzwstD7SIxmoM4yUl94tok2Xtd9ha
         DnGLws950xcFB3EztPdw9xq6WT9bF+/hwZXrCDNQTgPeUQjkJdS87Ds+2Y3x45bmkWpJ
         2/WH43JUs/eSdrEdv/VJJ2SobabI882N7TurOPpIMJg9RYJZ2pHOgiJfQ5vOsYC2CgCk
         y3Ks4IgRibFHeJdJq9sit3+pe5MCuFVfa/E8e6VCQTFMwYLZ0VU/2V58RQ3QaNGu1ND/
         x7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXePWPBzzitxMeHGU147K5Ir01cS5q7OFcPD7w6h+BVmhrvX2olF7SlB1uBgY+4l2xiEMzLB/gR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzRfQ1MQwM/6Sy9549xAB17N0uMEJ/FbdOC/B3ar3iweJglKYu
	O7AoMLre9c2ap/m8WRB9ln1SkhHwtSYsZIS1OTsF4OYpznNAiGM9
X-Gm-Gg: ASbGncv7tqXRj1mHKVTX8dyRqPRhPaoO7kKOtM2W7TTKqPBoMcJ1LlABf9IrW0DD5oI
	FxS/deOcbNuQ7jrpxukBr8G5ao7qRQHtes5cG93+Bb/Tshh7+5Eo3F4b33AzOz3Z01c1o1gEmTp
	Y4tlObvovR/NMH/9v+bNFg4/TP7STUflChfWP+IKNMRI2FP/Jvf+0F1nDWuE2G1EXqI8akukWUT
	4Lf0OzGTWGPKq1YkTEUx0YlCD1wD6ipcVVwnNqsDWekr0nS0XkWgYrikrri/qhMFhRmymBk9/CE
	MLFrwSnV5s5c8as=
X-Google-Smtp-Source: AGHT+IGyPeW7JXPciQ4EHmDYDKeuvpqZEgyqs8QENTRM0ZvMM7Orzqyw1FSYyWgIqIU42eiZfyWhgw==
X-Received: by 2002:a17:902:f60c:b0:215:8103:6339 with SMTP id d9443c01a7336-215810365demr56187415ad.41.1733107024763;
        Sun, 01 Dec 2024 18:37:04 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:04 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon,  2 Dec 2024 10:36:41 +0800
Message-Id: <20241202023643.75010-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202023643.75010-1-a0987203069@gmail.com>
References: <20241202023643.75010-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 09:49:25 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..e44abaf4da3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1-dwmac
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index eb1f3ae41ab9..4bf59ab910cc 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
-- 
2.34.1

