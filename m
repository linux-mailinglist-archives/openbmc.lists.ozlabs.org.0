Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C3A26898
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 01:32:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn47Z6cp9z3cj7
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 11:32:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738561431;
	cv=none; b=UavQDO07sfxuxrFBrGJb6P3CBL36KI23Fc5WJUViXzgCXhROzNzehFcalZ5ekcUgSvuxQendt9N+HEMEIehcpwVodlWyISQrEeBkGDzMMbbUVAPdH3nqO938tkPJVpO5wwpkNx7cWFoVH/8j6d5SnkrcJ+FKfDPET+f7R8Si/Qq8fI4+CtrRTNxJWJSoGfN4uVe4XjUOckN6XTwDN9wsYEnbsLmrNaGMbkLlMuRdfAixvhcd+LVc6i/XWjU7344BUsXyK0mvTvOEGM6O4JZLpUxFZRYIYGz0qCNRBp7tIRZkP/n7blrCp+uDDjzi4vbPmtjRSbUv+50QjNUja2FAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738561431; c=relaxed/relaxed;
	bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YNUCBu0ejMIAr6KFXwH4CCW2Ofb4Z8s/7uDsYlvaTG2s7TWGem3hRfIH2X/XZN83WzI8d0TEbQaJ88gGyoSFasbKFe7X58EcjDIpqNeg5umAeBijvYCOHJ97H2J33JLn11/FTld7rSaRlqW11x0e3uM232UAIZbsJUK5mnR0PFhW5c11TkKV2AeyIoIhWep7NfRdrKwW6XZH2q9CDBpeSBdsFoTWmJbIj9hg4/EZQdyHnwcPLIxWBz4CtAgQhAz0ej9wZn8cQkk2puiu0Grujzs61AOHf9s/BRt9mcrEy25oNjZh73tZb34i106W9gGhfpKs9yMPoqyQojOL2UueXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HuDoxktD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HuDoxktD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymb5f2tTNz2xZj
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 16:43:50 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so6940580a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 02 Feb 2025 21:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561428; x=1739166228; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=HuDoxktD0TKTnBRI+WlRKa1JqB41kW1zEBCTOkK35QOPGYLRCKU/ZeJci6IXyqtPIM
         X5OI/Z8X6E9pKQdAEdB9Ha+bsu3Rhpf2pqnkRs9dZCD8uQE6WaHgmsi0d4itN57JhqWM
         6yzGoO8z9lTcPxHtuluUNddQWhgPLQvfl1id2eSYh6wofxLMGbB9awFskyfEmGFa84cO
         WjVZzkMhiGnwQSoOcVxA+EPKwb8eO5xAZxZLxInvuyuKFThL9C8d84RMqypumCy9pPFv
         SNiDdcuhREvXnf8hQ6+xCNsD3nh/bmfwyrJ+A7qB8Wl202vN/9S0D3CNsvqNyuuMpwG9
         /OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561428; x=1739166228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=hoJfEioc5IFivZQ78PbNjemA1Jh50Flx+O2G47jgsFNLBTyb7GCQ4YrYRJIbJZMtzm
         snMH6x4Jqh1n2V108ZImhkNLGqv0ZwD3udEJY8+LjLKY8Ey37XgtVh+PsuMxXVkrypLh
         4PpvbMpmqi6P6gOAGt6TE918bz6uBC/OBrdt0kimSmjnQoK39+cwJXesx3JLt4pijMKX
         uQeAkj4IuBfTIZHseq+Ccgw+2lNVG1/hd1CbZ3qABicgvWZVVzQlbKMk5JHCowj75SLx
         G9Y69PlLvojvls2n+q6NkgD9OvEtMa4kVqdUlUkfnMI6VALOw6yTBgAOFWu8tR3UVXZ8
         L23Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJzbNQfGhVeeQ7ldKoETr2jzwWPPgdvv3WIVUS6It7HRdQG5sh/S+nrRDQwSTYQRRtMt3ikpd/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzupqvHohHl/rgNJ0iaLSZg8D5cDzLtpgktWEJvsooVqkhv9s6F
	tU+lgfTWhuskJbFJOITAjDmWI4RWVuRBts5ZC/NIF/34z1AAO9Yh
X-Gm-Gg: ASbGnctkAFIPZqFtArdlA49aZpc4B5niY++9GEsMadxsDnoW81IDED3n5vO498fi2ds
	UWQQ7bdjVUleBuxj5Mub7xPFC1gmBJT4Ac48GNEw9hgL/jVjxGjSTV0K3VLWPc5e5ujduV5Gww5
	omZEiySVsyvjs899YthssP2rTRsTsXJ4mO3xfGwn1R4oHthCurTITuga38x3EIRoBOcZYn6a4yK
	Tq66Hwc0tH29hQgOk9D8NKZtvyjZWgezBaWBRC0/wzL7JsCiwVo9jchC8SDKFmszAJfc9nlH00r
	NK1asuNFtZjy5D3Myg3kYLzzZXmePdJ3kVu+poMuxUHsBAlgAEMiUMFE
X-Google-Smtp-Source: AGHT+IFgxTohM+aTPsUswT4Bo8XmTsTW2WTDB9DTwTUXt0vxuR95dvrKJqCuVM8BYlZj72Q46ZHtyw==
X-Received: by 2002:a17:90a:c888:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-2f83abdf0f2mr32127614a91.11.1738561428296;
        Sun, 02 Feb 2025 21:43:48 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:48 -0800 (PST)
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
Subject: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon,  3 Feb 2025 13:41:58 +0800
Message-Id: <20250203054200.21977-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 04 Feb 2025 11:32:08 +1100
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

