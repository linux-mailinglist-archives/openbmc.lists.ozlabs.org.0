Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3A665792
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 10:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsMx326S3z3cKm
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 20:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bU6uyyVa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bU6uyyVa;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsMtN41YGz2xH6
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 20:33:16 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id n12so15297647pjp.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 01:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04Pq7MkT+QYZidf+j7cMLtCJPnocBGHBHBGxy1XfZlE=;
        b=bU6uyyVagRm7mOv1aZ3gQz55Eoy5d+bMIfNCDZeFW2tgO4h8L5idJVgledXrTlMS93
         foXhEPpu4pq9eItwhj6dY8bzLE7FcOfLn4crPPTqRsjLUcbpHoOtrpvQW0Q9EC1a7SZN
         WnPwjlAUK5tt9YZUh+vAGtCd5ELdq/NlQ+DmrPlYUkKrJ+SC8SaH42038za5+9ry12/m
         k9bdZpZpfBKN8fSEoRd7ggZuloaViSjtkLAIqciLNgaUnXmFkEp+L3rfhta2kudjKZ/b
         IEY+dL1TjAjEFbktwZ8lXbjOPfUIowuNYioBr3O3HcypVQQSPaS4u8VTV/OTSCxWMuZu
         FIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04Pq7MkT+QYZidf+j7cMLtCJPnocBGHBHBGxy1XfZlE=;
        b=1F2mZTDVnYR/udrV26C7B2f9vZJz0ak1iMfrLU6/t3jhrd5aitpnId5JMLZbTbHLAV
         QFC6QabsrSQbEh0j00aUC4WpTxetTgxMO724Ot9OSpml+AOy2xxPW/SPlmfWzRNjOizo
         Ibh6C3edConU/vCBX0zJQDCYJzFZklutdts2jWwg6rq6irWcpna7b0nczIl1a7ZDFAcY
         M9OVZcMoQsmSczFruCC8GWke0eQiNoM91kEbjOTktMmqb97IbUQhp68cMqKwSEPHHHur
         mRyRjdhsKYCcY1+2jMLrtoSriuOKye+mkTe0iQp3eZAga6cb8Cc1/pD2Nwbn4fpBeerC
         mbMQ==
X-Gm-Message-State: AFqh2kqklhRU6Xiv7Myby+cEYFIoQS8ZvDcCJhiLpcro/jeGWN36UR/B
	tcvU0Daw/ZlIfPYas3muD6s=
X-Google-Smtp-Source: AMrXdXvEgyl+40V2qNwoQJiAL/kOPJkH3yxsQ5OkOicj4z59EPaUdL4YO7z+LKm32SXN3zr4DDtYXw==
X-Received: by 2002:a17:902:c702:b0:191:2a9b:ec9b with SMTP id p2-20020a170902c70200b001912a9bec9bmr68842416plp.67.1673429595971;
        Wed, 11 Jan 2023 01:33:15 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902714600b001769e6d4fafsm2001341plm.57.2023.01.11.01.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:33:15 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com
Subject: [PATCH v18 2/3] dt-bindings: memory-controllers: nuvoton: Add NPCM memory controller
Date: Wed, 11 Jan 2023 17:32:44 +0800
Message-Id: <20230111093245.318745-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111093245.318745-1-milkfafa@gmail.com>
References: <20230111093245.318745-1-milkfafa@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, ctcchien@nuvoton.com, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../nuvoton,npcm-memory-controller.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..ac1a5a17749d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nuvoton,npcm-memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Marvin Lin <kflin@nuvoton.com>
+  - Stanley Chu <yschu@nuvoton.com>
+
+description: |
+  The Nuvoton BMC SoC supports DDR4 memory with or without ECC (error correction
+  check).
+
+  The memory controller supports single bit error correction, double bit error
+  detection (in-line ECC in which a section (1/8th) of the memory device used to
+  store data is used for ECC storage).
+
+  Note, the bootloader must configure ECC mode for the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-memory-controller
+      - nuvoton,npcm845-memory-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mc: memory-controller@f0824000 {
+        compatible = "nuvoton,npcm750-memory-controller";
+        reg = <0xf0824000 0x1000>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

