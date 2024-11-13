Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7566E9C7E12
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 23:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpcmG3pQ4z3ckl
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 09:05:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731475208;
	cv=none; b=IjNS9vnhoSf+hp7EYHwqcDyyr3LDerbToWqJG3mYCPs8kXhEPYU/Na+6T4DiJayACkVweEn/rwCtgbSAiFMvYD2So8GV/T2cMI1xEveQmCeuccHSeNm+jo3y4wFvgXRFWkzamdo+00JOWgKnYg6e5WvT6ZCsH0zzQePQJPsEMCH6z4YSJLNOyMNkDA3waG7QSWTKeYRT8/p1CP1Nzj7o4ncOoDh+vM/JEslsRk+LdJBksjSJGSv8vllO092jyDfh4Bex4o9XIvH7TSet1yxuwVraBtyH2oViuFoN5URmChUk9N/I7wR/xIbwkx5tep4DWQDcMFmUmn9U9MiywqPblg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731475208; c=relaxed/relaxed;
	bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aXZmgUuNj65+wLZGgHeFO9LJFmsUVJBzGRPUO2P6SoV8zwHjh2G0A6PVVasCIp9RLOSz+NJ8soLXAvVMBlUAZy0JbA3G9GWGTWgRME6ruNkRUliku0T2QmpWOq6mPtCcwlFn4agX45JGSHEgOhRdOYwnTAB+ihxIuHaWd9aQR9ZkQtio95gwZpimDwGPuspmwzekHEaYdHjNyJLpf0ZC1Nn6HkCi/lwiNt3uVNKGYCO3FWxC0CYeGwtJmfKM6aB7y9/0AvaOE4x//fNviIc2WYwvjWB5zJWqsyW5yZkpXBSNLmGEOd+bFTamGHhh1ewU8f/0W2DhfQCTZm8V/yvkrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ye86+K8X; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ye86+K8X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpBS65HXSz2xfB
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 16:20:06 +1100 (AEDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-288b392b8daso3041527fac.2
        for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 21:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475202; x=1732080002; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
        b=Ye86+K8XBD2IrEE2rthGhFIYAHmAyWULj1GBk7uxk7xor+VKcT8pPFX2NGy/ZuFhUw
         auT0M5EzPLw5TqbxWgllh/+8AYP4TT+6ec1Dt0R4/l+Btx+WFJWWezNKM7HWbGuH+sZW
         AOzQlF8ZhC3SD6GhL/G/TP8Iva6QKHl8IpKbyjaTwF6bL1r0M/5fLjoevJYhfCpuUwqg
         1YBS4535CUklEwuzcIY8yrBPe7Adj20GxC0fiwINLjYCcbF+vS84iBTnj8pnj4QTcpF5
         Q/8Xkq6rMOhRDdYq5QwrLz3gXz19LywPqpF2q3MdWaUWgm81LiAeFzwR7pnnVspalytO
         Ekrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475202; x=1732080002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMli1N+z0DyyhK39bT3ifRmFqQyEYElNZ9GJSN3gXSM=;
        b=kI6xlzUC/UBmbEKMQ3k++5B9e4N3LsrLDe0aquPvhbPk89ZgNOE7U2lR2v5ULGoYtS
         FjMh4vhIjYu//xl3Ff0ZXGkxrKefAnkEuyB0S63YlgdexsDzVbCs65Tgd00JOtN8LJsm
         lmc0mzCiT2heSIDSpIYN053DShZhq1w9mHCL0GExI7vFcLcdAbWoe42L7y2mLf0j8751
         XfoOuo+kGIu2L1OnwW50CSA3nLxeuIuiUKiXGd4/j2nJMuKYftNaaTSaV4c/ElssOcI6
         qe9HO1N2PfWakRNYrhuJUsoT43Y1gpfjKoLQd4F+9r1cj6Nz/kCbd6tB1CkyyBWITEAq
         J3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlNNl+Yr0YOWsBUy4FHlPjeGu8nehLWsWxhiTEpWE4W9YqkjxRkaxMKrC/XjZ34KLZ3Sn36nl8@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywpd3MBFa0PBD9SOPV21wb113aO1TewkqyFCauC1ONseN505KAJ
	UfSrM8dJQm0A9unRlA2VlPX9QugGVz+OVaECr/z3RwgEsRg0vuwp
X-Google-Smtp-Source: AGHT+IFe3VKkmjJmFK7cHt6HbH+71V9EWcoc7te6pi89V3VQcehyCiLGVfV8cx19XT/Qp+l+Gy43rA==
X-Received: by 2002:a05:6870:4686:b0:26c:64f8:d6c4 with SMTP id 586e51a60fabf-2956032f1bfmr14436206fac.38.1731475202093;
        Tue, 12 Nov 2024 21:20:02 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:20:01 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
Date: Wed, 13 Nov 2024 13:18:55 +0800
Message-Id: <20241113051857.12732-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Nov 2024 09:05:26 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..45eaf13467b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,170 @@
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
+# We need a select here so we don't match all nodes with 'snps,dwmac'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,ma35d1-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - nuvoton,ma35d1-dwmac
+        - const: snps,dwmac-3.70a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    minItems: 2
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
+            enum: [0, 1]
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
+  phy-handle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Specifies a reference to a node representing a PHY device.
+
+  tx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+
+  rx-internal-delay-ps:
+    enum: [0, 2000]
+    default: 0
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
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
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    //Example 1
+    gmac0: ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40120000 0x0 0x10000>;
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
+        mdio0 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
+
+  - |
+    //Example 2
+    gmac1: ethernet@40130000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x0 0x40130000 0x0 0x10000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 1>;
+        resets = <&sys MA35D1_RESET_GMAC1>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rmii";
+        phy-handle = <&eth_phy1>;
+        mdio1 {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            eth_phy1: ethernet-phy@1 {
+                reg = <1>;
+            };
+        };
+    };
-- 
2.34.1

