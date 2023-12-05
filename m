Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758378050E9
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:43:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pt+4I0+M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxwL6hqzz3dF0
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:43:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pt+4I0+M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxlm74tQz3cJN
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:20 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso2284922e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772576; x=1702377376; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkWrOF+Tbg1zeu9NCdUddDmIHRAWNVNjds7PaG64M2Y=;
        b=Pt+4I0+MrXC91ZsJKjute8lq9XUU267f9GCJ4/9Mh9L7gSx3tUG8574Fu+ROLlydAp
         B5A76SAt77p45U7K/d6qEzcPIsfNoCQpI4WZ1kicNxdtmSTtisgVH/Vzx4wnjOV/FT+o
         lqDoHetPchBCtyEaZ+cRLjfptQ1xyGqt9dkk3zaHk8yKHHKUAv9QiuxUFeeN1WccDowO
         +ZNmoSi+BZ79HzoY6QVNkD855aV60nj1k5+Qc4Iy7x0ovtAxHRE3MXziNJJD51eG5ylU
         cATh8stK7CcqG02xpK3KtsgDaxaXimK49o5k4FeCmr9bFi9oC+dbFUJpGB94Gj5MWe6I
         /lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772576; x=1702377376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkWrOF+Tbg1zeu9NCdUddDmIHRAWNVNjds7PaG64M2Y=;
        b=izz8EIpFFR3lXhLctvqDL2kPG3mS8RcjM2H3R9CnKFRLxL/larag6GHznB3dKiF3Dn
         4gQa9DLPh8kImF9dKzPwbrLn1NGO1nLOkc9u/Lxs+OplvZ/ymVQjvBSKC/jWcph8Dy5P
         +AR3ew5Ec15Hlw+w/tZ5M+0bemWbZ+QOVjwAH2Tuw0Vn6vb3jsDbIGwhCjs+Ty5jcaqZ
         qmmmtvyx+P1j5rloHXrNKUg93euhHR4lwxNP12CUYjfe2Z4xbDak7ydPyzxNJDBwsipi
         JhjxexRKoF9QuJz/fMxq0gFHfFHEgio3BDHE8qnRVMk6zNOPuZru2MgU7LaInJPO9GmX
         GalA==
X-Gm-Message-State: AOJu0YxNpX2r4VHHbfDoKtE1MBoEHlA4IjWfbSP4grtMXwde/cxOnA95
	3+TwZjz0JPXsGgfH8bSR2Yg=
X-Google-Smtp-Source: AGHT+IHW1p9aU8tTY9sg91uEzIDkgdKT+nrzGfXjbWF3melerUTwy66MPZnO/elp4AuS+/rL2RSIaQ==
X-Received: by 2002:a05:6512:ac8:b0:50c:e6c:685a with SMTP id n8-20020a0565120ac800b0050c0e6c685amr187819lfu.124.1701772576328;
        Tue, 05 Dec 2023 02:36:16 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id fc5-20020a056512138500b0050bfbb6a388sm445422lfb.22.2023.12.05.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:15 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 08/16] dt-bindings: net: Add Synopsys DW xPCS bindings
Date: Tue,  5 Dec 2023 13:35:29 +0300
Message-ID: <20231205103559.9605-9-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Synopsys DesignWare XPCS IP-core is a Physical Coding Sublayer (PCS) layer
providing an interface between the Media Access Control (MAC) and Physical
Medium Attachment Sublayer (PMA) through a Media independent interface.
From software point of view it exposes IEEE std. Clause 45 CSR space and
can be accessible either by MDIO or MCI/APB3 bus interfaces. The later
case is described by means of a dedicated DT-bindings which imply having
the DW XPCS Management Interface defined as a DT-supernode which child the
PCSs nodes would be (in the same way as the standard MDIO buses and
devices are normally defined).

Besides of that DW XPCS DT-nodes can have the interrupts and clock source
properties specified. The former one indicates the Clause 73/37
auto-negotiation events like: negotiation page received, AN is completed
or incompatible link partner. The clock DT-properties can describe up to
two clock sources: internal one and the one connected to the chip pad.
Either of them is supposed to be used as the device reference clocks.

Finally the DW XPCS IP-core can be optionally synthesized with a
vendor-specific interface connected to Synopsys PMA (also called
DesignWare Consumer/Enterprise PHY). Alas that isn't auto-detectable
anyhow so if the DW XPCS device has the respective PMA attached then it
should be reflected in the DT-node compatible string so the driver would
be aware of the PMA-specific device capabilities (mainly connected with
CSRs available for the fine-tunings).

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../bindings/net/pcs/snps,dw-xpcs.yaml        | 88 +++++++++++++++++++
 .../bindings/net/snps,dw-xpcs-mi.yaml         | 88 +++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
 create mode 100644 Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
new file mode 100644
index 000000000000..9694ef51abad
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/snps,dw-xpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Jose Abreu <Jose.Abreu@synopsys.com>
+
+description:
+  Synopsys DesignWare Ethernet Physical Coding Sublayer provides an interface
+  between Media Access Control and Physical Medium Attachment Sublayer through
+  the Media Independent Interface (XGMII, USXGMII, XLGMII, GMII, etc)
+  controlled by means of the IEEE std. Clause 45 registers set. The PCS can be
+  optionally synthesized with a vendor-specific interface connected to
+  Synopsys PMA (also called DesignWare Consumer/Enterprise PHY) although in
+  general it can be used to communicate with any compatible PHY.
+
+properties:
+  compatible:
+    oneOf:
+      - description: Synopsys DesignWare XPCS with none or unknown PMA
+        const: snps,dw-xpcs
+      - description: Synopsys DesignWare XPCS with Consumer Gen1 3G PMA
+        const: snps,dw-xpcs-gen1-3g
+      - description: Synopsys DesignWare XPCS with Consumer Gen2 3G PMA
+        const: snps,dw-xpcs-gen2-3g
+      - description: Synopsys DesignWare XPCS with Consumer Gen2 6G PMA
+        const: snps,dw-xpcs-gen2-6g
+      - description: Synopsys DesignWare XPCS with Consumer Gen4 3G PMA
+        const: snps,dw-xpcs-gen4-3g
+      - description: Synopsys DesignWare XPCS with Consumer Gen4 6G PMA
+        const: snps,dw-xpcs-gen4-6g
+      - description: Synopsys DesignWare XPCS with Consumer Gen5 10G PMA
+        const: snps,dw-xpcs-gen5-10g
+      - description: Synopsys DesignWare XPCS with Consumer Gen5 12G PMA
+        const: snps,dw-xpcs-gen5-12g
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      System interface interrupt output (sbd_intr_o) indicating Clause 73/37
+      auto-negotiation events like':' Page received, AN is completed or
+      incompatible link partner.
+    maxItems: 1
+
+  clocks:
+    description:
+      PCS/PMA interface be can clocked either by internal reference clock
+      source or by an externally connected (via a pad) clock generator.
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [ core, pad ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mdio-bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      xgmac_pcs: ethernet-pcs@0 {
+        compatible = "snps,dw-xpcs";
+        reg = <0>;
+
+        interrupts = <79 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&ccu_core>, <&ccu_pad>;
+        clock-names = "core", "pad";
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml b/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
new file mode 100644
index 000000000000..67ddba9d61fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/snps,dw-xpcs-mi.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/snps,dw-xpcs-mi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Ethernet PCS Management Interface
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description:
+  Synopsys DesignWare Ethernet PCS provides an interface between MAC and PMA
+  through the Media Independent Interface. The PCS CSRs can be accessible over
+  the Ethernet MDIO bus or directly by means of the APB3/MCI interfaces. In the
+  later case the XPCS can be mapped right to the system IO memory space.
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: snps,dw-xpcs-mi
+
+  reg:
+    items:
+      - description:
+          DW XPCS CSRs space can be either 'directly' or 'indirectly'
+          accessible. In the former case all Clause 45 registers are
+          contiguously mapped within the address space MMD '[20:16]',
+          Reg '[15:0]'. In the later case the space is divided to the
+          multiple 256 register sets. There is a special viewport CSR
+          which is responsible for the set selection. The upper part of
+          the CSR address is supposed to be written in there thus the
+          corresponding subset would be mapped over the lowest 255 CSRs.
+
+  reg-names:
+    items:
+      - enum: [ direct, indirect ]
+
+  reg-io-width:
+    description:
+      The way the CSRs are mapped to the memory is platform depended. Since
+      each Clause 45 CSR is of 16-bits wide the access instructions must be
+      two bytes aligned at least.
+    default: 2
+    enum: [ 2, 4 ]
+
+  clocks:
+    items:
+      - description: Peripheral MCI/APB3 bus clock source
+
+  clock-names:
+    items:
+      - const: pclk
+
+patternProperties:
+  'ethernet-pcs@[0-9a-f]+$':
+    type: object
+
+    $ref: pcs/snps,dw-xpcs.yaml#
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@1f05d000 {
+      compatible = "snps,dw-xpcs-mi";
+      reg = <0x1f05d000 0x1000>;
+      reg-names = "indirect";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      clocks = <&ccu_pclk>;
+      clock-names = "pclk";
+
+      reg-io-width = <4>;
+
+      ethernet-pcs@0 {
+        compatible = "snps,dw-xpcs";
+        reg = <0>;
+      };
+    };
-- 
2.42.1

