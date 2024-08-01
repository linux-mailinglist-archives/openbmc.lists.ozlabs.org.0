Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB63944560
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 09:23:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GbuFSBeZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZL6Q6YhLz3dSK
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 17:23:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GbuFSBeZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZL4z00g4z30Vy
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 17:22:10 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb77ecd7a2so1135067a91.1
        for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2024 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722496928; x=1723101728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evITfR508dWkC6GH2X8C7bD8ExWPXbUNlGzWar4VMrY=;
        b=GbuFSBeZQredwSaGZ3XgJuKXD409C/VDAYq2mpwdA6QmUtPiQfdwkbszc9iWjzekpJ
         vAscVzO/sTPuiKnKSm+grio6tqO3fK5n2w9yHxA2eUZLfc6tgPEOihC6wx9MWWDviJZG
         3FVpnTNbQ3lUPUNoKz/5Is5D0itH+WflH2UDBKm+TlXS+hY5c4ECTgfQbqJoCkFwjV1F
         k/KrlCsskCOQhjrVDdlt277G2oKv+49bHT/knun4VGBezZ4aNglK2Iw0w5yslOcGV9Wd
         ByaZeHWAJ79+hhUvCDrHWqy/2c90wliIty5l6DZ7blylwpRcQE+U60znLn8iuK8dv8Z/
         niAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722496928; x=1723101728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evITfR508dWkC6GH2X8C7bD8ExWPXbUNlGzWar4VMrY=;
        b=qwhVSi0uvTlkM3ctHKYKXro7II3EopI1E+CyP7eKDfH1vT5PlQusf30fmi0pO6/cEB
         o8RGqBpHucz56a0r/zEEGby+oo72bf3auDaFv/jIVSbTZXFmgm06uhfmy3YIUtta7Zx7
         N4qETW6rsHfgXgg95Y13Kt3vJTF+VzKGsJvzHbD0q0OhUq31huQfUbaobXoWlzdG2V+Q
         Nycu/WcNumBIixpEsK+VYA6etd3pYt6CjfEf5vZKXyiWK2KCzXRW6rd5LL2cJixNobGg
         tMqJm2ePHWWQc8PP3hHua6YJ+PpiADG6KlUrm6RDwagkiVBTVDXM4XupHPoNJLI4NzHc
         PSdg==
X-Forwarded-Encrypted: i=1; AJvYcCX8jCc2wFO5wyOO5RA4CKmlwtj7vpkn4MssH2BGDKZluZr2OW8KbQR6mw2oGTqIeUqE/PRdvdG5@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyu3s80AuKgiDceoxAnL1T0DghGuGR4X8VhJX49Rzo4IFC5jXQq
	u6UVPZq9pGTVVaSks6DUMU/aj7tMkqqWzM9U2Gpr2zsun/m7KEMc
X-Google-Smtp-Source: AGHT+IFJpGO3IL36H7tUcsLnZ2gQA+/8iTcyIiSWhG0CYi1+kos5rW5QPv4Kv6rMtavF6ypKU2LbRg==
X-Received: by 2002:a17:902:e741:b0:1fb:43b5:8793 with SMTP id d9443c01a7336-1ff4d271611mr11171945ad.6.1722496928382;
        Thu, 01 Aug 2024 00:22:08 -0700 (PDT)
Received: from cs20-buildserver.. ([180.217.140.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff4619793bsm22117425ad.120.2024.08.01.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 00:22:08 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
Date: Thu,  1 Aug 2024 15:19:45 +0800
Message-Id: <20240801071946.43266-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801071946.43266-1-yschu@nuvoton.com>
References: <20240801071946.43266-1-yschu@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, yschu@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The npcm845 i3c devicetree binding follows the basic i3c bindings
and add the properties for allowing to adjust the SDA/SCL timing
to meet different requirements.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
---
 .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
new file mode 100644
index 000000000000..a40b37b16872
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM845 I3C master
+
+maintainers:
+  - Stanley Chu <yschu@nuvoton.com>
+  - James Chiang <cpchiang1@nuvoton.com>
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,npcm845-i3c
+
+  reg:
+    items:
+      - description: I3C registers
+      - description: GDMA registers
+      - description: GDMA request control register
+
+  reg-names:
+    items:
+      - const: i3c
+      - const: dma
+      - const: dma_ctl
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: system clock
+      - description: bus clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: fast_clk
+
+  resets:
+    maxItems: 1
+
+  i3c-pp-scl-hi-period-ns:
+    description: |
+      If need to configure SCL with required duty cycle, specify the clock high/low period directly.
+      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in push pull mode
+      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are specified, the i3c pp frequency is
+      decided by these two properties.
+
+  i3c-pp-scl-lo-period-ns:
+    description: |
+      The low period ns of the SCL clock cycle in push pull mode. i3c-pp-scl-lo-period-ns should not
+      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3c-pp-scl-hi-period-ns + 150.
+
+  i3c-pp-sda-rd-skew:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private read.
+    maximum: 7
+    default: 0
+
+  i3c-pp-sda-wr-skew:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private write.
+    maximum: 7
+    default: 0
+
+  i3c-od-scl-hi-period-ns:
+    description: |
+      The i3c open drain frequency is 1MHz by default.
+      If need to use different frequency, specify the clock high/low period directly.
+      i3c-od-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in open drain mode.
+      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are specified, the i3c od frequency is
+      decided by these two properties.
+      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-period-ns or i3c-od-scl-lo-period-ns.
+
+  i3c-od-scl-lo-period-ns:
+    description: |
+      The low period ns of the SCL clock cycle in open drain mode. i3c-od-scl-lo-period-ns should be
+      multiple of i3c-pp-scl-hi-period-ns.
+
+  enable-hj:
+    type: boolean
+    description: |
+      Enable SLVSTART interrupt for receiving hot-join request.
+
+  use-dma:
+    type: boolean
+    description: |
+      Enable the i3c private transfers using DMA.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+additionalProperties: true
+
+examples:
+  - |
+    i3c@fff10000 {
+        compatible = "nuvoton,npcm845-i3c";
+        clocks = <&clk 4>, <&clk 26>;
+        clock-names = "pclk", "fast_clk";
+        interrupts = <0 224 4>;
+        reg = <0xfff10000 0x1000>,
+              <0xf0850000 0x1000>,
+              <0xf0800300 0x4>;
+        reg-names = "i3c", "dma", "dma_ctl";
+        resets = <&rstc 0x74 8>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
-- 
2.34.1

