Return-Path: <openbmc+bounces-1434-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAUoE5i+qGmXwwAAu9opvQ
	(envelope-from <openbmc+bounces-1434-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:22:00 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E241208F26
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 00:21:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR7w06TWBz3c8x;
	Thu, 05 Mar 2026 10:21:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772529624;
	cv=none; b=Dc3ohG/4JslK1FA1WWz3+4DCI/fGbi09VtMLQlCOP4MMGmDFxFV+V1oQIffShAGwfvlrsOKOdiqypwZrKc8nO+F1GquaomcNk9esySYbGKVYrzCidWKvkjsdtPxr8Boq5PZ2ErOSjfkVe9srOrChsAcGOTNgWQQGt2lC/E9/y8eKpKAMRdkredWDML6GKb3gHkzp6w8VmSyukkl7nGrf6mHfYdcpx+8U4cbujqmjPyQzoaz9qRHf6SfvRWqbjozdt6Qhtg9gWAHRZgt4gA4bM95iOYirY5h3A7P0kJXhFyGjZyZhdqHiiD4q84uNXRG8eFMYck5rUlJTzzpOs8h8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772529624; c=relaxed/relaxed;
	bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRoG7Nibi5UgmNwhI3LEwNP1eoOWXhcb6cI+JUwOCOs5F9OnzlovnRFUsjKZZW6RY8r92Jyt/ziXP77giOqMtaFgDzZIyxc8amW7k7L+/dpDVFRW0Oq97b1do8dRWPXsieJd3c1pbrjqbmVT8OZEIA7h/CNb41/86fK+Af6q31JQENK2l0PcYo+jo4cqktSizu9T+SnZLJ3kKZmYMq8xgtFFo+pDyHFcl0MgERPV2lG4l60LQvZztECjEw9RcRTEy53uy4exT0583Wc58HTuyqGel3NAf0zbMqNQ++5Gt3PNLZXzgIcBk1xpV3onQ8mbw+Tn96evXESEyXtPI850MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVruX1Eh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVruX1Eh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQ9J741LNz30Lw
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 20:20:23 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ab077e3f32so23776865ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 01:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529622; x=1773134422; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=;
        b=TVruX1EhcYELJ5ORJll2C86vwAhSVjumgaqJZRLPpoF97Pd8Mfyzac2pZWMXoRr8bE
         vD0RXr9Zt0Jy6+G29B8aJtdiT8X0koGHoLc1TF0hF6lyTA5HMekvFvBpx7T/IN35MI4y
         6EFPwe4YUCrZfEGRweFk3VXRK7ZueMJnQsHxeFqt/7h6l+oUs0fKFuUPCz47GGy+ZETq
         X8nQ7NfRwoMKtriyjV+779L2v8yB/CFPhSj+6iCDq28WLOEoEWe45tsvit3Nljt9R/4w
         PUitbDYMZplBe5L19pCYM/Zs0qAQkNDqhwPyXehlGxNjALqO9fgsv93QzaJR5AgU39k0
         vveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529622; x=1773134422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlyHDmizNIkIW1kEBSDJurvUimBBLmNsme12b6R+fQc=;
        b=ntFZCZveJik60tzhMDY63s5oUVVyroX8SbY4uro7atB74lmqHASo+OZ/p9BsJmwR2/
         lG8XoXkkFppvJJfOcSrwL3PYAxCaUaSVySvK4aIeB2edEA3cBRTWD0B1MZo4U31LpGtD
         NS1CvJhfBxzLt205RzP5L8n7/GTZTMrgwQJezMOiEv59je+0DTXdJ9fgWr8cQt5k9Q++
         X5kmJrcm3Mp3n743sXFk13MWVZ87lJc+mmO/KJPEw27IVrhQTQtmazWgBgASENo3WoRN
         uA2np38o4tV4g8ZM9usn7xCyADgyeHe91oMKzoT8NDgqGDRZztP+Y8MD0NA/PwwXGmiM
         T14w==
X-Forwarded-Encrypted: i=1; AJvYcCXuu1lMxCEEgWoWKpyLJFDB9560R/GTPkwiX/jd8YfDN52PukWzFccsjY/j2t2symd9aazyjH6s@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywm3gqp6cn3qFYmkylAZAh/CC7HCEHgl/yp8nvpQrzcbsYCjEei
	Uwi+gp4Ui9rqbOHUV6XaP5E6L1FeNUSiHBCjdzepkeE+55ST/AU+nhKw
X-Gm-Gg: ATEYQzxldpP4Xezy/FUJMQd3KsLycSU1QhyuYUaHfuPwk4PwXe+W+JzArTZPpzgk7FY
	JWzXuK5pNImoSwHRZeDX0wAAarwUUCyTQisCH3n+wDSOltpKVMJXxKpxXRRbatpihnrmu6+3o3N
	lDgfoQHaRA/FQ39b93r64TzNoGXISzw2XJb+smQthCvmub6Zbmg+3WmOlqgk8pI0McxN5D2PU1T
	0EItHeKeYX0emRcwmnMjEdHWDv6TK/7+TZjhTfkIxZ9FmKO/UyEvMpI2Qn3hW6SAwRdrBwgT2Jz
	JLUm8OS50tJcUeI7SqeEnj41IW689e+BVagLG6dDfDU1P8wS6MTi0azr8xw0cIDmVvK/r3gwH/e
	NjSCusnRiIhQUAzE7rfqMBsVotwVx1Z3xjWIA5VUSvIDrlyv4J5FtaojM1bV6nxZXpi3XXAJEL0
	zRN/CS+9tv33Y1KY4bJYYJy8ifaw5jpL+/YTw8gTrrjC1+Rx7Kwu93dWPeSRA7ShKSpuLFZYsfV
	gFigrfkR5Th
X-Received: by 2002:a17:903:1b48:b0:2ae:5426:da4f with SMTP id d9443c01a7336-2ae5426dcabmr60869725ad.28.1772529621612;
        Tue, 03 Mar 2026 01:20:21 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm158777475ad.50.2026.03.03.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:21 -0800 (PST)
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
Subject: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Tue,  3 Mar 2026 17:20:04 +0800
Message-ID: <20260303092006.263715-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303092006.263715-1-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
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
X-Rspamd-Queue-Id: 4E241208F26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[38];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1434-lists,openbmc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,0.0.0.0:email,nuvoton.com:email,devicetree.org:url,2.100.46.192:email]
X-Rspamd-Action: no action

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 131 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..90c28fb13985
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,131 @@
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
+      - const: nuvoton,ma35d1-dwmac
+      - const: snps,dwmac-3.70a
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
+        compatible = "nuvoton,ma35d1-dwmac", "snps,dwmac-3.70a";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+        snps,multicast-filter-bins = <0>;
+        snps,perfect-filter-entries = <8>;
+        rx-fifo-depth = <4096>;
+        tx-fifo-depth = <2048>;
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
index 38bc34dc4f09..de04cbbab0c6 100644
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


