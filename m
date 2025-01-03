Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794FA01C6C
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRClz72Lmz88M2
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885995;
	cv=none; b=ianvEFHZZ6CoLumCZSDmVQ1Y379X4kFKF6y+AXqjRt463vfBezkvOLJ0XdoGa1Fk83zPWA9b3JGgKJImz+Cls00BqcQhIc4e9BJQoUto7zAxLqr5L2uvY3lYSzAXNFSVDXrWVoRsmXAllJw1vm4m8vdXjRm/Bzt3JW8JqhIMlJTc7VKtnZDd8Pkwfw8mwF33NRHZALVOQI9stxXYfnCC0SWwOxJJOK1rx8IbR8zFMB47BK9bVMN4hivmlFjje2kvuYKqIsSzNQmwDDRpZUbqM+nIHBizaczOYhmGmX6KBXE1mrtZGKetG/ewmW+swzVSt0W4a2a3Dq2dk/7aoSB8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885995; c=relaxed/relaxed;
	bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FBKZkZDN1P8miU/90/CzGUKLOoCUk2fWaDL3nEZkylexDVyq7T4qpKvtYotEbVHOKwLC2wf1CGueS5XGmmBupxNxfOk+DyaJnEEwT52Dlsel+ICDwIK7z2JmMqv/FKeqk6sJbIEvwmZv9ROaS/fOjDSCWatm0/b5lqpFJWB5hG2vEiFsivzcjnkJYmH9P9DzSbgYdGKNQKpygFK5ziBiKSn5O2tEfRzIEeAvIflp5yqs486ATDSuc4PzDSdkrgOMfquFzw4TWA9+AHWue0vj68d4vjbW6U4FAA7opo4idHGtwZNUAErDgdJC3O9RRzwCqUv9h7F21T4c1XP3oJCE4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DnHQUBfF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DnHQUBfF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYfy49Llz305n
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2025 17:33:14 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso13569864a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2025 22:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885991; x=1736490791; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=DnHQUBfFVx8kXVhE0ACZhu2E5UJ/vdamdAw7cwVcI9XQ1dZvTCBEJQHB4x2/Fz9fqX
         eYTaHHWli0H3HxH3OyA1HW5FJ143/lCOPWzYnolq/lQ7NHuVmjmJIgldzsf4Kg0D/S8s
         Zh6Ya1bT0bAvyAOnpLDBYl95MA1Xr1y0K0AlreUevTDFgZdD5fjNOxqKqWPA0jshqjlq
         06dDIZtFu4KPIjoYOhHe4w0chpvWL6hudvN73FV/Ks5jwX2PbTqSTutu2ooLlZhc5uKq
         VeQ4OAoSGCdW/alD9d8trdx3AuH7shBqOtctkd7dXtoqdqHHT98tRMk2q9+wMSfx7mRt
         G+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885991; x=1736490791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dW9tSKSb3CcOFy1YNdY01ABpN6qWxIbLh8Rm1LEF2s=;
        b=H8g8sP/fOdsPSgjENR8tHKXUSWzVPdJHgu1RYlEw1S9baICPDcnIt6GkBGk64mryxH
         r1cttxKM0T1GLCKBd8+gPzt6+x/p+j8ls0Akt3iK2JxBQp/jGfXy4h7rNhYWBYbbG1c1
         dH9GVXnqcj9fxWujBl7GPkMueQfeSWL28uDAmINqJ5hKDXl2mlEhm56LuTnjjdjI8VL0
         nwojkPS3qK823O0Qv1cnALivG8LLreaBOC0c1HieUR29986FCiHoA8ZE5Y8AefSUQS9Z
         DuzMuxa5BvSlBMj3Y9zzEZTFVZIGOr7gtAo5z6RlSpSIv/rhOKDfflDRTCwk1KcNKWJL
         Oo5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8UJd6eBEezsv9/84GLlfCZMfBRaKadG7iehjy8vy4ke5TWlmVQkk5KlK32Nx5gPwZXEO3lRkO@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2SsIv7LRPJGsoDfe7KjWtkdIBtcNPAMIqmc1ENVnl/HFACwSO
	kmlJEPOY21HVPeoycJv/BtOrWkXQSLJocy07XTK6WxfD9E671WgS
X-Gm-Gg: ASbGncv3EgKBr+qgIl0d08FpnwMVvpDuhTTxyoY0WIxyDULPnV8LItmENFpIJBt6Q2y
	Lai5XjR6lgYjNsgCGkbyhi+NjD+6LzR58Nz8b9dkrbA2JHyFJ30z1mAyVNfgQN5kXKYaz0fBVyf
	KtriSzARh6TGWt0fCrUdWVY4CPiSNDOUi30JHVxk6yl/DQyu47MYfUTJEu7v+c4HHL0lWK1FZJn
	pJUYPVjYgP+xzmFoB0gkCPuOGZ5ZZRDISCMCCAKlA3zMfX/47FCAUCE1Uq6cwib7NC6t1kFK0iY
	Bv//681DH3O1WWfbBvkG8A==
X-Google-Smtp-Source: AGHT+IEiOFe4evfri1nnuFO6yzTBznHLXu75pnxX+t4aHQDSqgiu6wv6g4L6GtYLrIIjCWk7VdcMRQ==
X-Received: by 2002:a17:90b:3d50:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-2f452e458ccmr71154893a91.19.1735885991475;
        Thu, 02 Jan 2025 22:33:11 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:11 -0800 (PST)
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
Subject: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Fri,  3 Jan 2025 14:32:39 +0800
Message-Id: <20250103063241.2306312-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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

