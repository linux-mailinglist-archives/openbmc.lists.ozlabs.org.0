Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3DD94237B
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 01:39:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=myT/5OP5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYWsf2dwxz3cjv
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 09:39:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=myT/5OP5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WY4tF3zqHz3cRF
	for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2024 16:23:33 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb80633dcfso724364a91.0
        for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2024 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722320611; x=1722925411; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhfU9eHhxSShS5G9Tff/V3V/eNkhXwja7YqIPhd9dDU=;
        b=myT/5OP51CTuf9vWti7sETz0w2xvpauYOlpNxIuCyrvU4jN5wfWiWe5BBWrfheQ3NB
         q29tDOPI2avBZilGFRrX8lTMvXrBNtp455gCwB5k9LqVOP+b9TO0+inusKOhuHl/BZAC
         Gj5/9T7mUeheGcmKmoH2qQhBaeUFBFnbsXggJtAFaThrThe0to0zmErU0rS7DfjK45vo
         Y7Ch/RGnbn6ruxZGsZOh7MfdDC5MteYK/81w4kmhToalnzd4D+Xg6FSlbUOq19O+x0R4
         eeob1uLz+k917eZCOC3JQKOAhR6QOKhv5wzX5M3Tid8MXaR+HamtiGGI7czOljvoT9n4
         UoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722320611; x=1722925411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhfU9eHhxSShS5G9Tff/V3V/eNkhXwja7YqIPhd9dDU=;
        b=MyuQ15/VHU2IYkQqeyGmqVDGCTZ9U37cdaRInBBwdny3mlO5QN/DNmOFmaUwCunGUJ
         LqCNCvChwCCwevKOcxdknmf8uACSzjPpOTiFZEEqVynIHZpCDbsRb1z10OpGXrSJjti6
         b3G8LAPGRC5cqkKSQVzEu09Myc8CTcU2HJruGSQSf9wSHPwZ2Nk/V+DYJqCW9tRjmiRD
         L02GLggdmgWwn9xUkUFxA12YfKwEwWtLOteKW4FUBFQkBRpxe6n6FgaZ+P0nmDA2DORg
         uorrbijmF+dPvmgNzaU0dChK6piqhotghCMEH4TtzjnE4OWT3HUeAzD+COvsYXPWSMSr
         WVUQ==
X-Gm-Message-State: AOJu0Yy/8VZvXQWXNWUfWveyX3HxsGsCJTfxi95ZrFoxd3DF0RGXQkig
	u/oIexU89Cx7g+6SHmJkjdGnXhj2Z3elfu/wcMBS9QgRyhr+y7hfQ78kMQ==
X-Google-Smtp-Source: AGHT+IFQ41/oZwyg08dN0iahpSWG/UdjC4FnAmGTyPlTMAOFBEZJxG/dH4GBV+kAE0/9Ic5Bscq1vw==
X-Received: by 2002:a17:90b:4a43:b0:2cb:4382:668f with SMTP id 98e67ed59e1d1-2cf264139camr10676370a91.5.1722320610723;
        Mon, 29 Jul 2024 23:23:30 -0700 (PDT)
Received: from cs20-buildserver.. ([1.200.155.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e8957sm11643019a91.39.2024.07.29.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 23:23:30 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [linux dev-6.6 v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
Date: Tue, 30 Jul 2024 14:21:21 +0800
Message-Id: <20240730062122.3781121-2-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730062122.3781121-1-yschu@nuvoton.com>
References: <20240730062122.3781121-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 09:38:20 +1000
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, cpchiang1@nuvoton.com, joel@jms.id.au, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a devicetree binding for the npcm845 i3c controller hardware.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
---
 .../bindings/i3c/nuvoton,i3c-master.yaml      | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
new file mode 100644
index 000000000000..6bf5f9752006
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
@@ -0,0 +1,126 @@
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
+    minimum: 40
+    maximum: 160
+    description: |
+      If need to configure SCL with required duty cycle, specify the clock high/low period directly.
+      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in push pull mode
+      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are specified, the i3c pp frequency is
+      decided by these two properties.
+
+  i3c-pp-scl-lo-period-ns:
+    minimum: 40
+    maximum: 310
+    description: |
+      The low period ns of the SCL clock cycle in push pull mode. i3c-pp-scl-lo-period-ns should not
+      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3c-pp-scl-hi-period-ns + 150.
+
+  i3c-pp-sda-rd-skew:
+    minimum: 1
+    maximum: 7
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private read.
+
+  i3c-pp-sda-wr-skew:
+    minimum: 1
+    maximum: 7
+    description: |
+      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
+      pull operation when transfers i3c private write.
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
+    minimum: 200
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
+    i3c-master@fff10000 {
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

