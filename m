Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B056F618F3B
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 04:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3RJN3fmMz3cMP
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 14:41:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LxkauC06;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LxkauC06;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3RDl6kVpz3brQ
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 14:38:47 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so6711021pjh.1
        for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2022 20:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpUM4DPw4PRlVAAk+U/JNafDpQLlQw9oEkCZcgNX0RU=;
        b=LxkauC06VejSBsAckjZBGDEDRNz2SBZjQ9gMJLr9A2GtW9Y6KhTvGBRpaJ5Wr2AFIX
         wvK+Kzz2AX+Eh0jHczD5CG62G0F113vZU/t0+CAW5bwupAlaGjme9nVGIwTMYa4OABDJ
         5V0XaH9C2HWawbIoM5LLCxH7ZpHmDi6LL/P9mLFDat6mDGIaHYOT2Lsmu/E8Z+Zlj4Cw
         0t1ZMFACPl9G+/z5iChlo4hah2OfFikD9XP9ZO/YMsv6Ks4J0wRUOeB6NlpJlN2eNOpu
         sYQzrf+P/VdDyZ8EBPnq8ER/kV93OBMGrgmF01EQMY4M4wHQuKxw7PpkJH674n6KGKCn
         GPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpUM4DPw4PRlVAAk+U/JNafDpQLlQw9oEkCZcgNX0RU=;
        b=RZipNoqleutuMHv9TOj1Eb0jo1Pl+JXeJYIRQgtsWJGYZNjo79Q94+aBpf9fb26qfx
         i3Hd/ZzduUIeqbz4FOrS9T4MeZ0MWnmfFw3a9qlAQkklO8f9BvsjEckEmAdw5bbSbESy
         6j6JDg0BdPoaxqroXMGsf1brDGuswYvU7Yu33n4QsnSBUzKTMgDeNeXOkO7rrHQSfyhA
         rhv+dokq1ZcgSyOPlq5lwCFzjWe1nzM3qOvQBUDDucJvkxAayXhHa2kSkU27QdOXOS02
         P3JRJvL/IMtUPjdSeTYYfeUqTQgiYlIDxWGH/WSLpRfT7/RuBXGfZoqev3glqyjUEwqA
         RVpA==
X-Gm-Message-State: ACrzQf24Hng6ePmw28OUEnSy1K6VxF6hgt/177pA2YViV+rOZbC6v9Bk
	3NFoq8Yaf4Dvlh7DzzoqQ0YGJQLb3SgSrQ==
X-Google-Smtp-Source: AMsMyM6Fw0X/jGTNSbL/TUfTdLbFU+ZffcKr2BAHToIRdjTd4iCwxb40S/QBdeqSm0w7I33rqwNjBQ==
X-Received: by 2002:a17:90b:3504:b0:214:199e:7e6d with SMTP id ls4-20020a17090b350400b00214199e7e6dmr16125190pjb.192.1667533125662;
        Thu, 03 Nov 2022 20:38:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b0056bb06ce1cfsm1545759pfq.97.2022.11.03.20.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:38:45 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
Date: Fri,  4 Nov 2022 11:38:08 +0800
Message-Id: <20221104033810.1324686-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104033810.1324686-1-milkfafa@gmail.com>
References: <20221104033810.1324686-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It is
necessary for the NPCM Video Capture/Encode Engine driver to retrieve
Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..5b785bda5739
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gfxi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Graphics Core Information block in Nuvoton SoCs
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description:
+  The Graphics Core Information (GFXI) are a block of registers in Nuvoton SoCs
+  that analyzes Graphics core behavior and provides inforomation in registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-gfxi
+          - nuvoton,npcm845-gfxi
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gfxi: gfxi@e000 {
+      compatible = "nuvoton,npcm750-gfxi", "syscon", "simple-mfd";
+      reg = <0xe000 0x100>;
+    };
-- 
2.34.1

