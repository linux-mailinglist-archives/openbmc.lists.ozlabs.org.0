Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6A5288D0
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 17:29:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L237k0GQHz3c7q
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DNhRYJUr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DNhRYJUr; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L236g5KXtz3bsG
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 01:28:11 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id q76so14379312pgq.10
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mFpRGtOmuIhiGD7D0FWLTSmGnj4Hu/mNhuuhhbY9Ebg=;
 b=DNhRYJUrlkBhXbYqplYhNKX9LJJUn8zoAoD3oGkxHk/b4RlKVKv84ZjyOlKsmDYP1H
 LGY++k8NXTkFLrjvXqxNs7q7lEA/FAxvp+SIVNxc9qlp6kSQpi+61rFPf/JHgqexhEYt
 c/mrZ+74uOrsPQYTraAPvKtE6Cpr9QCRRdya48gTQsP30EOLos/FOCn8ipAtuoe8YP+T
 xAeTLl/7Qy3PPBzFLYLGmBi0yT2Mgc2rPk+K081h+4cSD6PkzN0qMMq2KRkzkAHB2eFc
 J9sLp5eUHgRnhyJtO6lDQN4mPucYEFtDjwHLtLG5/XK7Um0vesBPGxEQqq+vbtbNtFDP
 mzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mFpRGtOmuIhiGD7D0FWLTSmGnj4Hu/mNhuuhhbY9Ebg=;
 b=ferEroKXEGJyQXinusjMBU4OI7Dc0uErcpo216PINcowDyYKkNtlrtaHzfQ0TRqMzL
 Sc+whopc6yqEa2xjtn/UjZHEhA0hd+tNyIkV/cvYbbi2iJ+n77GVk0+LMdOmMBzJc2HD
 CZ/VOQPVhbLJ/SsD32XovwdeBnDfh0OMu4pvCv8MEo89wzGkVE6Lo4edzVblfHraLaQk
 7P77Kp8JW48/tSy7SWjqYRTDlxUk2+NNGGHEb5Yjp8cADHuTFDwn4O8ecxVu/u8iC2DA
 jqOy3TjO0wAxsxp/20OOaj9rH8z7/n2u+feHhp/C9EcMrX/n6Nb/qUqUuLJ1ZJybsjcU
 mCLQ==
X-Gm-Message-State: AOAM532QaPIVn2GzvHe7K34Tx/RDg0TsJL+hAsO4gzQ36IQRpf1rOi73
 ohx//qrWS7GoNhzq9OWi2vc=
X-Google-Smtp-Source: ABdhPJzpw/VXi0SgEApDCwAOAKLlNIiL/drvGpMjBE9bCvQPPS4xE3+AIeyS9T3cmuly0UDuRDoufA==
X-Received: by 2002:a63:85c6:0:b0:3ab:4545:e29e with SMTP id
 u189-20020a6385c6000000b003ab4545e29emr15300294pgd.573.1652714889354; 
 Mon, 16 May 2022 08:28:09 -0700 (PDT)
Received: from localhost.localdomain ([116.89.131.16])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a655acf000000b003c14af50605sm6895126pgt.29.2022.05.16.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:28:08 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: benjaminfair@google.com, yuenn@google.com, venture@google.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 robh+dt@kernel.org, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: [PATCH v1 2/3] dt-bindings: rtc: nuvoton: add NCT3018Y Real Time Clock
Date: Mon, 16 May 2022 23:27:50 +0800
Message-Id: <20220516152751.27716-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220516152751.27716-1-ctcchien@nuvoton.com>
References: <20220516152751.27716-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document devicetree bindings for the Nuvoton NCT3018Y Real Time Clock.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../bindings/rtc/nuvoton,nct3018y.yaml        | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
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
-- 
2.17.1

