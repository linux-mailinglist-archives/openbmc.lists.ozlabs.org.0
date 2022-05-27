Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8341535BE6
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 10:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8djm4fvyz3bq7
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 18:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bwOhKhGj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bwOhKhGj;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8dhl2HYlz3bhK
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 18:47:03 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id n8so3604458plh.1
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=weRfekXLILP2lO9stplYBl5Nh9WF88pncFfI0g1b4VA=;
        b=bwOhKhGjb/m9lMftPARFL9G9QWdmo2ZN94jP34cX52XrrR4UlLbaqJ1zqo77jNXkfj
         3i2Gc1p+tMeyCBKMyKH8uJ9hJ4s44dLuERP6u2zESv19WNVoUp5Vm1Bnl8NxM5bEl0Be
         LK7auQhiGtlONlt7WPJqmNDKpDn2lpMtTQp4z0jqVSH8QstNuceYMFPGaI2L8SkBHn5n
         q1bHWBVQAoQJqHPwjWQMrW+VgZ78JGdNNHLAJ99+JX7FWK/N6fzfULj4+F763GubBIav
         9kXx9mHiny8+d5x6cQed+k+KKaE96oq7caMMX+kKz0TKHxSB4R82BYiguCQDrD++4OLI
         NeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=weRfekXLILP2lO9stplYBl5Nh9WF88pncFfI0g1b4VA=;
        b=tm0goHAeqNlE7axqyY+hiz0KkkHtJoGSXJseKiqNcZC19wyusCmJ7IOhrthV2yHvoa
         cRNLAcHbvwXUaIIfTqVI29n7QJOFzyRCsc1tkRhpfxbcCfG5+bWHw+iPqNmLxX+vA7R2
         ZCkwsIFQeKRCp6YMM8kPV1bh9tAg2eLclVXDJqKXzpA4jUiFDSdQ7L2Wpt77BB+damqZ
         HYjEOkCK1AILBCcM4W3EsbLluiqiysvGLvMnowQad0CqyWA51rGZ+Y6fARodfIiZImMc
         0Gsfmd0TKE3JRaYgiF821q0+rFw9bGhgB+h5RlTWNGW5enaQ8akSUV/28A7IXmJZPL0Z
         SLAw==
X-Gm-Message-State: AOAM5335kzDb8T07/ZPhUFcuYOvIiPXfdbwgF4Vq05Xuu4X/Jq8LqjDT
	JyIRcwOpxFIldOPb5kgOmxM=
X-Google-Smtp-Source: ABdhPJztQyPOcuF5GRPQYyE4itPVdRodDdyKbv4q+AyEl96UVBPCXZXsLrIzvYUJd1Zy4BcI8kIv5Q==
X-Received: by 2002:a17:90b:38c2:b0:1e0:44ca:8de6 with SMTP id nn2-20020a17090b38c200b001e044ca8de6mr7167371pjb.243.1653641221327;
        Fri, 27 May 2022 01:47:01 -0700 (PDT)
Received: from localhost.localdomain ([116.89.143.231])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902d58c00b0015e8d4eb1ebsm3003254plh.53.2022.05.27.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 01:47:00 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	tali.perry1@gmail.com,
	tmaimon77@gmail.com,
	avifishman70@gmail.com,
	robh+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	a.zummo@towertech.it,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	ctcchien@nuvoton.com
Subject: [PATCH v3 1/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
Date: Fri, 27 May 2022 16:46:45 +0800
Message-Id: <20220527084647.30835-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220527084647.30835-1-ctcchien@nuvoton.com>
References: <20220527084647.30835-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
new file mode 100644
index 000000000000..788d92a32a70
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nuvoton,nct3018y.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NUVOTON NCT3018Y Real Time Clock
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Medad CChien <ctcchien@nuvoton.com>
+
+properties:
+  compatible:
+    const: nuvoton,nct3018y
+
+  reg:
+    maxItems: 1
+
+  start-year: true
+
+  reset-source: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+            compatible = "nuvoton,nct3018y";
+            reg = <0x6f>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4383949ff654..5a4302e9aad2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2367,6 +2367,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
-- 
2.17.1

