Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 995568D766B
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:42:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MgXEC8sc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsfhR4JFtz3cXk
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:42:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MgXEC8sc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZK6SNBz3cMQ
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:36:57 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52b8e0e98adso2511478e87.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339014; x=1717943814; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl+LGarOyxT8j4YojtyaSAfvFQWXeJMpYxDCX8TzbE4=;
        b=MgXEC8sccYyG/nGLaGNgUj09zELmSUdYjRZg8THe4VThq2QmV1hQNzPB7KGMGoFZ1M
         kFHZHFM//24jd8KYYVYExb7VeoVLEQT6S0UAoPDs6ahs2AFqcjex0uFliHSe+PIxfI4X
         VK2Jl8vOwmAEHIxpvVzpHaQqDQS4au96KopHrC6lhEt5sc5yWzAzYFfXyQ8f8l4LoV+q
         QEmJ+ZCDXha0PDFdzraAawVUTdweXYWtHgmKa2BHoTpFNGG8lux/TlMvO8rPnXSq8m9d
         OegrTmt4OZbMfboKQXT5cO/cg/2lf9GBOYj6zRJxiQEI7HcXZkDRwBswMXWDI5nJBVZ2
         iLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339014; x=1717943814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dl+LGarOyxT8j4YojtyaSAfvFQWXeJMpYxDCX8TzbE4=;
        b=GE3eGdcMcD3RERZyZz140emTtHHF942t3lRNa/4iA/QS+I6jeucww7ObakdzKNAO54
         kezT0MQ5CVoxBfRRBg7LSXb2C49B4RPGJDhtSZdVBVoo0FGH0+ieGtZPqAvbxbkfcYrP
         nJi6l5wBJEq8pWbGQjQZ7qcQ30fALCptNnOkI/1Vw7JqVJGlGmYSTNJ3LW70vqN6U6Ky
         8PSMQVQlofDyjs6+fOD+8AHsOU+LU+SrROfJLShaf5sHDpXMwjqATKVoo2rt+leuWCKt
         OIl+PUO3k9oG0HAyZe1340AJ99RgknC+Jbl4x1U0zJDZd/9cpZ4BgwIXWWSo5uu4ByVs
         m0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8qK2NTUG6TO1pyufgR1kwWTY+Yk4PtGrx0f04kx8NEjn04XhnWlXW+9lqFJ+4F1MJmRoVGkym1SqWBt715FQLPEORQsk46Y=
X-Gm-Message-State: AOJu0Yyl41KeHWmnTrL7ipjXaf6T3kYlScycoUFR45l32jx3F7csij55
	K8hctO+RtrynAiilMUcLw7sfZTSaxsVoUt6Z1LShlc4uF7wKYjxH
X-Google-Smtp-Source: AGHT+IG9A9+aPM7LWHLUZMZ13ql+h6wgBzijmSAf5TnSE582UtzoIEOPiQkQaci+dc385JZ92IKbhg==
X-Received: by 2002:a19:384d:0:b0:529:c0c6:faad with SMTP id 2adb3069b0e04-52b89596984mr4646645e87.28.1717339014019;
        Sun, 02 Jun 2024 07:36:54 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d764bbsm956841e87.179.2024.06.02.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:53 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH net-next v2 06/10] dt-bindings: net: Add Synopsys DW xPCS bindings
Date: Sun,  2 Jun 2024 17:36:20 +0300
Message-ID: <20240602143636.5839-7-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Synopsys DesignWare XPCS IP-core is a Physical Coding Sublayer (PCS) layer
providing an interface between the Media Access Control (MAC) and Physical
Medium Attachment Sublayer (PMA) through a Media independent interface.
From software point of view it exposes IEEE std. Clause 45 CSR space and
can be accessible either by MDIO or MCI/APB3 bus interfaces. In the former
case the PCS device is supposed to be defined under the respective MDIO
bus DT-node. In the later case the DW xPCS will be just a normal IO
memory-mapped device.

Besides of that DW XPCS DT-nodes can have an interrupt signal and clock
source properties specified. The former one indicates the Clause 73/37
auto-negotiation events like: negotiation page received, AN is completed
or incompatible link partner. The clock DT-properties can describe up to
three clock sources: peripheral bus clock source, internal reference clock
and the externally connected reference clock.

Finally the DW XPCS IP-core can be optionally synthesized with a
vendor-specific interface connected to the Synopsys PMA (also called
DesignWare Consumer/Enterprise PHY). Alas that isn't auto-detectable in a
portable way. So if the DW XPCS device has the respective PMA attached
then it should be reflected in the DT-node compatible string so the driver
would be aware of the PMA-specific device capabilities (mainly connected
with CSRs available for the fine-tunings).

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- Drop the Management Interface DT-node bindings. DW xPCS with MCI/APB3
  interface is just a normal memory-mapped device.
---
 .../bindings/net/pcs/snps,dw-xpcs.yaml        | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
new file mode 100644
index 000000000000..7927bceefbf3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/snps,dw-xpcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Ethernet PCS
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
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
+  The PCS CSRs can be accessible either over the Ethernet MDIO bus or directly
+  by means of the APB3/MCI interfaces. In the later case the XPCS can be mapped
+  right to the system IO memory space.
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
+    items:
+      - description:
+          In case of the MDIO management interface this just a 5-bits ID
+          of the MDIO bus device. If DW XPCS CSRs space is accessed over the
+          MCI or APB3 management interfaces, then the space mapping can be
+          either 'direct' or 'indirect'. In the former case all Clause 45
+          registers are contiguously mapped within the address space
+          MMD '[20:16]', Reg '[15:0]'. In the later case the space is divided
+          to the multiple 256 register sets. There is a special viewport CSR
+          which is responsible for the set selection. The upper part of
+          the CSR address MMD+REG[20:8] is supposed to be written in there
+          so the corresponding subset would be mapped to the lowest 255 CSRs.
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
+  interrupts:
+    description:
+      System interface interrupt output (sbd_intr_o) indicating Clause 73/37
+      auto-negotiation events':' Page received, AN is completed or incompatible
+      link partner.
+    maxItems: 1
+
+  clocks:
+    description:
+      Both MCI and APB3 interfaces are supposed to be equipped with a clock
+      source connected via the clk_csr_i line.
+
+      PCS/PMA layer can be clocked by an internal reference clock source
+      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
+      generator. Both clocks can be supplied at a time.
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+    anyOf:
+      - items:
+          enum: [ core, pad ]
+      - items:
+          enum: [ pclk, core, pad ]
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
+    ethernet-pcs@1f05d000 {
+      compatible = "snps,dw-xpcs";
+      reg = <0x1f05d000 0x1000>;
+      reg-names = "indirect";
+
+      reg-io-width = <4>;
+
+      interrupts = <79 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&ccu_pclk>, <&ccu_core>, <&ccu_pad>;
+      clock-names = "pclk", "core", "pad";
+    };
+  - |
+    mdio-bus {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      ethernet-pcs@0 {
+        compatible = "snps,dw-xpcs";
+        reg = <0>;
+
+        clocks = <&ccu_core>, <&ccu_pad>;
+        clock-names = "core", "pad";
+      };
+    };
+...
-- 
2.43.0

