Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E69BF911
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:17:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKM25c68z3cyg
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730860788;
	cv=none; b=AnY2j1//QmQhcey2oTn/CRBm/6Az6yEbvLvYjqr3ovbTe/oyIgbpd5JrLUItTQKI3xqOk1YOSFPvi1QC7Mewp1/JSkJewhtfLiQh0x5jlWBTaQzsJO9+HEdbQbTKkuT9qHlb892UsBzxnrvryzHHTyua0FuvGuT3FgXpIZS1bdHSe/R3ZawRavrC20HWb6d2XSOUqwpfyGXtfuYsgSCgqZ34F9iio4/lCxuR5+89PLkKKm2D+bZnL1K4Ji83987SzZGfECyXvaSo7wJNwf1wgJNcnQA6IxKEhfy+oZCHRZaJ//C+JZFzmXWS3JRyOUNoKOs3tzrBj/uQ8yw1w9W7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730860788; c=relaxed/relaxed;
	bh=BHS3Y8b/Fo+tfKbUb9aeyhX4djXRjn2LjQvdEaB1Y7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aFYOqULguW3/8dOs4idECAFSpmF1iGUziASbb9+w3BEcwFl/28U6DY00r/XrcJlD1Zt682qgq1Q+cNYu9q7U46jl/kkPUWpH3QZF6QVKTpkeEfLHlE5n3FoduzWSqWH1J0fQ2JaVokIKh5DSRaRRnuntptuhfq7CPAVTIPvbNyIqBBuUVpoTxnara4vH7nnePa/xniP54oibyVZMakaCln8BaR13jY4GkYzI0ZAVyFQfCwg9WlqSe8Qb5lRrm/r8LufMhwatQ4Dt+0Tv0khn+CWQa8sdTcUqHQEW8O5jhcrjqz8JI+C+jlhNS/80DSyXpeLn0i8l6FW/KMA86mbx/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RZALvjZa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RZALvjZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjqDK3kfwz2xqc
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 13:39:44 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-723db2798caso2886214b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Nov 2024 18:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730860781; x=1731465581; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHS3Y8b/Fo+tfKbUb9aeyhX4djXRjn2LjQvdEaB1Y7E=;
        b=RZALvjZa3MsOE0cZcJ+4yASYBo4z2syms94u96f0DyH2PSCFPLwXtTYeqzNtyraeO5
         fvr2nFoc9036fTrk0a56MGboEFcHzhByJQnOjnCjdC5hmJ1c0cJiikJVOb7Lo5Yin17W
         g2Ufg+NfZRfp486m1RhGXmME6E6iR49s8x5eqRjrF6RC1m7xPRzSzFaO7FlVqwcYtgfc
         la+H30USJXv8c+qFwKaaDitUYGyQS2GGaHW7HX0UqpVOSg5udLrqzngFep64MYSeh6EG
         OxgHNnoG9MgzuUwzmZYcj+Hfo8LrBT5i9Ct+I0HKkfb/tZgF8/wVdTyewov/DbX+mRn4
         d3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730860781; x=1731465581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHS3Y8b/Fo+tfKbUb9aeyhX4djXRjn2LjQvdEaB1Y7E=;
        b=sY5rKCpSy1MRdzU3NRmx2c1/S6PcJd+uFEbrzbsn3hPFVJT1Z4v5T2Ydiu6T+7Mfvy
         mnam/B9qwnyiVfIsrQC5ylRhDD4kjKhtbDJI5dUbkZePUqct3V6RYZyhD4ng63xlB8EW
         qx6zPjsRXPqpjSNDbjiBHSD18cTRLQQm75zbtlvw2+5JC2/K4GOpInRn9kiCLUTl5HJx
         HoMCC5feXUzjX2yLtuVhdF8+MokCrQQRLfGZXz3VhFKXHzO+VdeO+EKxX1OL5X0RwXGQ
         gFB3lC7g6BeC94BmN4r1iXFBRsFy0JShnrCzUwRuSpDBEJiik1B5UEmKBi+6Ybcvt4FR
         RPQw==
X-Gm-Message-State: AOJu0Yxn/81XaoF9VMWlh/cl47anKkFe/EJ0peW39hPr7Y0l7NwyKTka
	FpYaTAv+Q/03Q7pJLh9Zw+Rx9MS2xOW2LbTiUNNS9bEw/pELUR4b
X-Google-Smtp-Source: AGHT+IHwEasur5W2BzFXhkyHmzfpBWvqNKBDJ7DTJOZ+oe/ng648CAcTEkZDXo/hKeBLtP6R2cO3Vw==
X-Received: by 2002:a05:6a00:4644:b0:71e:7636:3323 with SMTP id d2e1a72fcca58-720ab3babdemr33084062b3a.7.1730860780789;
        Tue, 05 Nov 2024 18:39:40 -0800 (PST)
Received: from hcdev-d520mt.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c39acsm10382484b3a.137.2024.11.05.18.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:39:40 -0800 (PST)
From: Eason Yang <j2anfernee@gmail.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com,
	matteomartelli3@gmail.com,
	alisadariana@gmail.com,
	joao.goncalves@toradex.com,
	marius.cristea@microchip.com,
	mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton NCT720x ADCs
Date: Wed,  6 Nov 2024 10:39:15 +0800
Message-Id: <20241106023916.440767-2-j2anfernee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241106023916.440767-1-j2anfernee@gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eason Yang <j2anfernee@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds a binding specification for the Nuvoton NCT7201/NCT7202
family of ADCs.

Signed-off-by: Eason Yang <j2anfernee@gmail.com>
---
 .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
new file mode 100644
index 000000000000..3052039af10e
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton nct7202 and similar ADCs
+
+maintainers:
+  - Eason Yang <yhyang2@nuvoton.com>
+
+description: |
+   Family of ADCs with i2c interface.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7201
+      - nuvoton,nct7202
+
+  reg:
+    maxItems: 1
+
+  read-vin-data-size:
+    description: number of data bits per read vin
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16]
+
+required:
+  - compatible
+  - reg
+  - read-vin-data-size
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nct7202@1d {
+            compatible = "nuvoton,nct7202";
+            reg = <0x1d>;
+            read-vin-data-size = <8>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0609db61b..68570c58e7aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2746,6 +2746,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
 F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 F:	arch/arm/boot/dts/nuvoton/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
-- 
2.34.1

