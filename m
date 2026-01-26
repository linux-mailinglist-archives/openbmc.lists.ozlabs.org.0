Return-Path: <openbmc+bounces-1280-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIaGET3xd2lQmgEAu9opvQ
	(envelope-from <openbmc+bounces-1280-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 23:57:01 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779B8E1B2
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 23:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0P6L4sYcz30Sv;
	Tue, 27 Jan 2026 09:56:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::929"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769430084;
	cv=none; b=MDI0KCeMUz3m7IPgOLDYKeZxR/lt6dWct9i/UtKK7X/VtPYTQFOAJRpkCNBYL9PYU1HmYUYncztWTIUTffxVRVF7TP5TVwiOR4AEVNnK0GpRAopBPxeB+tCB1+EdUlRw6N8oHrt9YQMP7GFdq/UAgqyEgCI/l7aCyHOdgRiAYRlDUPKatbL5cSklmUxVvqKSblWKiZYpJm6YGpPdR/sQzrK+vMbSbXNpa8FFqco+/LUNU2m7ej/xeVj2bkvVq1ZaajLxTC7414U1jsyIKn/2HCyWP06s4ygOCzJN7bZ8hLMBWlFfjXAVDGONT0HFOY1O90+NrPRYlDY+4L2BWA7IrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769430084; c=relaxed/relaxed;
	bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZc2tLHswFJh2TUKZWxFQOt+f3m5bTdNqrIYZ4438WbyrRpQ/unRk3/xrJxVv2Q4+p+9kN98Abu/bEUGAyCz+PTys0D7airhMuiluMnkpDI1WUYYZZWJP/E39ztmcLomAru3TjQyzowHSCUrkivolLQveE+7r8n5QJnaOxe6keEiXrW1/nf9ykBK6mdbQkEPSfnubSjTqp4DJKJGb7QiOHk2O3vrh2tzVlfkoT2q+0b4B4RGw7Z52M2Zt29pXIvKq1jPXdLtKu8a0iakaClmLWZKm0qvyKg81i2DyfVeK0zl743IuoQweWzqR59T+NPzhLIkHVs6L8xHjx6X74xw1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iGiukZTA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iGiukZTA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f071Z2Ngtz2xpk
	for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 23:21:21 +1100 (AEDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso3090527241.2
        for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 04:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430077; x=1770034877; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=iGiukZTATjvSxPgYNnvz7zpbEwjfZXs5hAAF3/cBOM1S0srw9YHyT0sdk77TcnKaqE
         EUw2FiyVq3yEsjIOzk89ycaakxjeozexuXrCNNHQu0C8cFDcc7vY6axQaTMM9JD1pDOy
         BDia6xeHrR7uBNdjA8B9HGd3lOaTi9O2U+KrW2kGtzpewP/ZKN1wL4BWLApwXxUdfjvf
         RQZn21zZ0uWM9orEhXtR7eYU+s2Q3lw86VpcYYYkAhA4nXMmRkoRUc0/EK+zbm3uga8H
         mscRIqR+IkO1jx56eCLb5oje6FHBq/GhUK+m3VFDwExbDLUFOs00ld6GzZDsFQgr2M11
         hVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430077; x=1770034877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJ1+S2Wah0B24B4nb8d1ZRSd0AUn0CCMY72mwuIFWBk=;
        b=ktgd9xkcJuI/QhN3ed068XesQSdyR2G3cyAu8L4K4c/ZKLuLw+WXuWY/p6GM2EBRtb
         /BZFyQnOmGOL83O+YPFoOhBkSQHvJmDbU1TAWYOxzYru18CnKpArd5xNNtqVdW4mCe5D
         9p4cVZHrsrLKku5TjVbkbHlJU8LvModgWoxF4RNhjW7y2ZEhJwbJRbMLnGxwc2mOMrzo
         AEXHZm6sOswkNSdyXv2i2k9gMf6/hHVIxHPidigKeWkCfnDRXKcoJEujjhC8xsjWK+EA
         BkCT0H6xYM7Q8feGnjVKZzp0FseRCeNK5Htxs5Bm/0Psd5xHv6ztSpf0bXPILVpbrjvw
         GMZA==
X-Forwarded-Encrypted: i=1; AJvYcCUxw7kYMpT0DJEMFFGpqYYubQbFG8nGbInsD94XKvYuyLzs7QbhaTh2r1HSSuv4dQxwBnrwA/sL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDSlKQoMzH1awPRR+5n7b2uT1dJOZ3bAh1gCeJ1GykM3++crof
	cii4gb7A4yjYPc6PEHtLxfOOz5SobrB7XCIMGptpFgnN09WLQz3/eFOn
X-Gm-Gg: AZuq6aInRzUwTdEz05GzA9OMUCmLdfj2Vu9yzC4WWmMZAdTQEcqk7wpVlcJbZSsFxx0
	GlUbQkOxQR1mI9L0l4fslRPWBPBaR0akXG+vvwpDg97tKn3cw8pN+cAzmLArSSCpDDQaG7ufKTw
	gdBXJurA2o+jEWQHoMv0qNVcBwnr+dQ5Hq6boEctPdG9XuouTjNp7x9D5+7jCHCn/oIw0DCoLqi
	1wHPVh/k4Q5qkecjw82mnynh8W2DiENzVKxGWLyyWqUayHzx4zEFic8gSP+ibV2MvbcK5acVP65
	dbJ/YETVD8PajIovtPKHN9bfFTODJ4xSJ4JZArA1jWarYNPcd2m9vOC+PBiO1pZCSV+QDtE4dww
	3faUkGuhHZZoBrMnAeG0vutz/0WERUAUyKG/VCTKfDpKSWieJ2y0uJ7jQqGEWHwkDN7GLNzjDdu
	3g+sepcsuCHQ6FZeKzaWp1/Pfi+fqspSjMxLrz5r+THGlPJJ+HKVvFTT4I2B2alitxxoG3Eol/
X-Received: by 2002:a17:903:2f48:b0:2a7:a9b8:ebae with SMTP id d9443c01a7336-2a84531819bmr42437665ad.58.1769422988504;
        Mon, 26 Jan 2026 02:23:08 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:08 -0800 (PST)
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
Subject: [PATCH net-next v9 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon, 26 Jan 2026 18:22:55 +0800
Message-ID: <20260126102257.2619862-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102257.2619862-1-a0987203069@gmail.com>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1280-lists,openbmc=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.100.46.192:email,0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nuvoton.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 4779B8E1B2
X-Rspamd-Action: no action

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


