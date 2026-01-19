Return-Path: <openbmc+bounces-1244-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333FD3BA5D
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 23:06:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Kd5fBDz30N8;
	Tue, 20 Jan 2026 09:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768808036;
	cv=none; b=osAvHgbZrkqjTjocnoTSzB71+eH32gwZYsocR0/A/xMG9qPi5Qxwrh0lU97U1ktAZJ61rYosnK79aIn3AuX+Y1qFl2KgZK/rz30DZsFV/TY2Ltqo615xW+w2dPHr0ohrSowByHoQghd5gjo4EJmyRLuC9dVhvpnFkfbEWAT2wU81eiAJLKcGzJeEJCJH3Y/JPsETm2qs4IYCk3etJ6i3UQ7LSSIOtOcz1yD7c9NFIT+L1nABVs5dLeLDgZmxHVwwPkoLZL4mldHbIxaSH0UheXudu1hhlOMxS/iAJTLeQTM6px//iTtV5NzqL3jq6U4q9xOK+M2c+QYHuVOyYNMXug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768808036; c=relaxed/relaxed;
	bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmKOngYc+SwFXRSrGmRMpyYiXK8y8U1odBwm87uhE025Y0SuiOVbaIaxqTil0O8kevzzflapEXh1DUF6oTKXXWSkKo3QYnKZXhjvlE5K/es4UKCtPTd10eouT/EmvxskmpCcMaf6KPLHKeBfWL6nv9W7KcwhAcknLZ3f88aPwsnTm59hWan4AFDs+Gj0Lk4UiGLNxbJFbxf4pBdqpwCP1e4RUC/7XGWL5szBGAKWfMT+ZrhjQ+M4G60YfiJYASo8fB+G5s5u0DzO+lneYp5WidEg3gScPOsK0YuTCKtcapjdQcn5pIuPwzDj9xkXTiYHnktGnww4QOiT/X/TXn4Btg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmdJ/iOq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmdJ/iOq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhz70gm4z2xHW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 18:33:54 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0d67f1877so26769625ad.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 23:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808033; x=1769412833; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
        b=DmdJ/iOqEZ+z7UmpM71w/bl4hO93PaYUTahMdZYzWbEscoVXBAurjpIdBbWbcEL9Yx
         tNAOyjxzSfGpkxTyr8jA0is/ua8t4P/Jpt+CMFrDslzW1fK1LQQlQg5rx5m7g4z1QHBQ
         U/9jXLupgsrWq6oCKXf1OFFf8wxUShQO/m2ym4ctFwggDmE/iNHk25DrdLXQQ2y/vmZU
         7VVnRGz/qwB3S5AsxGLLaeTnCqzcTL38xHWHY0tunJo2EbLSQ/W5FzxGYrlzizW77VJU
         KemAnEv7WesNSfDCv1+FYqUS6h0XMIZoq3tyGjgFtlV2aXnlfuhjQPLZ8Mdrm209QDlS
         FzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808033; x=1769412833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwRM1gGaHi8PnymUuB5O39xP4xhmWw83uFj1UvSjw/w=;
        b=J9hPLk3aRvyD+wHF1KNJVJR4qGmemzryc4BcYYRyUhKXnL/4x90g0wCnH24/5/YlTX
         SwgleSPdLSW9lsKnqYBb8bjMnndoujAGh4smCVFEGq0+Lqg+VKhyF16P5MwWP6lPVUTV
         EBPlWs8sAPiRCVT9diMO4pcjOXOur5iClr0rcdA0NcVXVnj3+31vG89fDuYElSdZngMm
         UMeV6+4f+zqXzTcnmoR0e6TV5SZ20JhB+r1ExAGT6hhGtegIr7+IyQJv56qcMeyhYE0D
         qDkNHxhcLO/PNmLDY8F/5RcJUv0m65/zRX8GShJqvHlaRQzcHJYFKQp2SrPQ0/0Dy/0O
         kh3w==
X-Forwarded-Encrypted: i=1; AJvYcCUn2lSqAurlTEFyx3DLvRAkSR2GPAh6Y99REJ1R5e8p79P+/KKEQ2AFwk6PDsUEw1ibcJUydTdO@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx72fM/af+Y3hmyomP2Y/mpkweMhXpGn8ZPhr+otpka/KhAZ7uD
	W3Bmtbh+f8CCJrU/tK20Z9dpZvtEqBxAdEgmGx47+v2poAea2vD91m53
X-Gm-Gg: AZuq6aJNSauoz9Br3ZCxjor9DsGntclOKyZ+iMkSEI/UQ0pIIJEqFHPk92ckZM+D/Fu
	Zbv5e6VvGGqn7wghFcgDvcK8ub9ArWbpwWh2zuAEPUbSreb1ozMLnHv658iBaha85z7yCODJDjM
	CYS/iGlzDQxDdF7fWoh2Xfr/9sy3CDL0sWEyfbQy7JhTnIefPQt+C2412tdOCuKKwnr794MOupm
	hi5kgwtgMy/tiDcMzz+xyZbKynq4rYPjqSFKsGVd9U7xLkilvbSAROYcUwI6+NCte24VAF7KCpv
	EcL+6QmoJnHz02VPm4MKx0xHrahL0ijP7p/ftmFwtjDahOzpHtn1YyLUvBrmkVyL5J6oCVup7ps
	hOK2c2qcA2wnhoNPJYw2WFgJAMFXnvplrBpPIbbTnz9o2vFIeTfPEEW7wG6rSCKReoI9XsVH13a
	UHTNyOBz20CuLmkte16wPiZoTObTNi2Pd8IXuGt+66iKbOBD/RB5KnZouD2g4yKKGrGmU66mJLH
	46wbw3zCzQ=
X-Received: by 2002:a17:903:94f:b0:2a2:c4b4:f72d with SMTP id d9443c01a7336-2a718928be5mr113594955ad.30.1768808033242;
        Sun, 18 Jan 2026 23:33:53 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:52 -0800 (PST)
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
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 19 Jan 2026 15:33:39 +0800
Message-ID: <20260119073342.3132502-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100755
index 000000000000..8eaddfdc937c
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
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..10cb5e555750 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -69,6 +69,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.43.0


