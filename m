Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F9A0C5E0
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 00:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX8By1C6kz3fpd
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 10:50:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736747782;
	cv=none; b=HtV2oPKGt5S7yZCM3lFWKoU5OtV8GgrHSo2rBW7MLcmdQn8VhcdU/e9veEE4aXVDa0g48kawp9agjNW0ZU4Q9Eq6qQc9E7117h6eg4AlQqzXOlrE/B0qEX1dGDRchODirqkrZH7PuFRfWV7XVl7zx31IOULn+XebQZ5XfjRPNvSWncKP8RGuoNu9OMA2ejvVYCFn+l0U1W0OIknAisC1M9Jqn8gZHYNcmvIb907UweqtyODyITeuZB7NFHlXakenHtfFHAju6xgkbZmq70YYCAhuFyr9orkg7LrWkN7AlXbffpcJF5GvcDI20muIcanVCiQEWa4uqVz1+apap8B9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736747782; c=relaxed/relaxed;
	bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c91UaV7k3RjlY+U3jLZeYgu67in8Nfl+Q2Unxcx+vZHPV9kIfgA6i3exMkgP+qN5CLKcD65rO6M+dsmP2wavukc+664/SHgUxq+XL/6+DNVxS+ILpSlpsl5Jh7Mkd/heGVOxRZg9mY/SdlcX2GnDna2/Jszcp+XvmgAtjTO4HJT1yy8lpwSY1UCGHPoro9O4YrAUKholHyyiQ7YXWYEQCE9E2ovTKnNv5aEB08Ps22jypOBubBr3+qelyH7d1Sv7WYakaxj/pp8I2dtuw2Ex2jqwXB1ukYgKKZWyYG0j1q86YgVf/oQNtF7/z3J25cljosHRWYkQmxHPfnH+DtrcUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VLMVlh6q; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VLMVlh6q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWhMn1PwTz30VY
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2025 16:56:20 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so6600182a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 12 Jan 2025 21:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747778; x=1737352578; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=VLMVlh6qpnSplh4BH/6VSOYPCNET6JKdzI4lG+IOHMhK0kqOdMtvBUWdJRNwdgt0q+
         SMtSbVFaeMXXGwRdw4j57VHCbHmC2mHttXUtYrDj5A2CaAPBkTjsGya1CbkRWdY1G3kw
         VvIIyXfM4AIqt2If8BwRkHr3CDDZrIEBF8s5tnn5aIewOJtes8xeLQXnFsHhjtCMhqmM
         WpTyOAzKh5XstUkUuQbYppcnMz0sgfQppheDVpS7QF41/Gmu4aSy2Kqaeyz9nDp6DYjR
         fX7nWD5tKnMc4sjjpBJhOu1MOrhLtsFuBb5WVMm7yvvttCnZ/6qFpC1Z1C6gWEVfMf9j
         tIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747778; x=1737352578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=VSx+fhNaMwDJjrXBA4XLv/oOhv5tC4Z0Zm0+LaqSGXKVy7XbXjgYED+k2XifJweJcs
         1Ng20pBLEPwyjdMTBHR7NpIcgjRT9+w5nbvHXUT6DrIfQ0eq7TzOxte8fF+idVSmZIUv
         YR71Wxcp8a3GAM4JWgqbAAS3/P2o65HdVyQi7gtxuMlh/dUfMBEGh1fLhoLxPuu4ZWr3
         pwjaYtGWWOEK9kOnUsDzYymkydTV/1hQahw44kwhcWG7YZHwDo7rLzPtZXenpqDqLIWY
         Eg/vIQeFteUdc4LRXc9FlyMfw3v+gfzhAIUHhxINcrXK/ZuGH1HizABtFULJjYEqscdZ
         7Jmg==
X-Forwarded-Encrypted: i=1; AJvYcCVTC8Drh2NCSJAzrZB0JiWlFplGc8mt1jhPljWK0HY/uAaQSD2Bu7kO92rJ8xLm1kJgxArMbWrf@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8u2R0csIt2dDQYUzGk5vR/Z/zexCB6YV6hzxb0KUrLQjk1vul
	o8jkncKfe9HDFuzmabNd2zRfsKgWC0YJzzWApFZQ2vXVl5qp9PIe
X-Gm-Gg: ASbGncu6VfkdFOBFS+sq6cWsfTdd+AC02aJ45l9zsOfDQ9GKbXv3tFqxUMwbh0gV6ey
	Ry7OuJ4XmZsU1iXKG3TowwQmsJPCq8Mm1RdXgbys0dOhL0tDb6zq9DqW+kaMpLbTohnNA5nx3qS
	AKz57sDjnJW1cVwR6kwE93ClM5JnvYlVTy2KX9qjCgEN0Oh3OyC6DIJRfrX439ufpvQKX/PoMmm
	GLpdQgXOFqvnVhA/UBxOLWdn4XBGPrtQ1VGoyZ8vu2fwvSoY96ny3Ohlh3d9vMIz/O8nm7LhhGh
	cFeHnTXeLp1oFCLdRoiiDQ==
X-Google-Smtp-Source: AGHT+IELLG1qqRQ+iIq+SIppUMZASouWezROTI1mRuvbXLFmarI2XwZnJBZzTNIbEvSNR3O+6hTwOA==
X-Received: by 2002:a17:90b:2dc6:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2f548e9f9ecmr26288303a91.5.1736747777955;
        Sun, 12 Jan 2025 21:56:17 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:17 -0800 (PST)
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
Subject: [PATCH net-next v7 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 13 Jan 2025 13:54:32 +0800
Message-Id: <20250113055434.3377508-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113055434.3377508-1-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 14 Jan 2025 10:50:13 +1100
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..c3f2ad423cc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,126 @@
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
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
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
index 91e75eb3f329..c43dcae74495 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.34.1

