Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFBB7A7086
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 04:32:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FCiM75aw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr2c72lsKz3cFq
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 12:32:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FCiM75aw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr2XP22Qyz3c28
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 12:28:53 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68bed2c786eso5519613b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 19:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695176930; x=1695781730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=FCiM75awRYL0n5nG/UJYinNQzT2klWBRPQ/3vCBm56VvxQPLf0Yoz1CG34+riah7qp
         pBrCgSQA4OIxVWkhMQMyL96/R5HIWR8CNVvzwtobM4FZZWdeV5xdpdEsPuv2OGqE9PXj
         G/1ZWyxeDeu3qQF6HlWvREdMBNmlsh30nhH2RDtLIIPhlodvpjvG9KTFtQQAm8VPRNJH
         ZdaUPoNq14ZNmtRGZno8fjGgm3klHVteyfmGtZ8URkqqm8nJJDw8xD05BM4M3ZzNOUz9
         mhrOrTVa71FDjFeKqrVel1UmbEb+1AvgDv3SpaZDQNDjrtDtnRgCkRJDEW0AkCeO5r0L
         vIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695176930; x=1695781730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=nAzp/Omn+htjg42XJ2pAphOLaavKuwWVtPcUXORRmQMbOedtPsEuGAg2RcPMBsaprs
         AD5Il60tEKiFEp+XpV6XxWxklT562KXoUtFqQKMxO1csiQDtwJ1XJXvgM98lbAMplFIU
         N2xh1gJyBuKbXtlfHClOHUTSc79+jTaOT7yZF15gj2wrP/a3Au3HLZr2t0HPhnCX02mB
         EQayvBJAtlyu22Y91ftBeHg6jI5757qGmRRaG0552KSW+Ure9KNRk2oii8KoeSz/eBbI
         ft5Ob6+4f1uxDSWuhIlknorEjiOd3QVuHKBYVTg3AGWFu1mxGPZk2BcQQG3aqJN8WDNo
         EhRQ==
X-Gm-Message-State: AOJu0YzJuJCYMACga32KXW02ceNWMb/CeocVdT14kPj2cezPqLuajHDm
	pGjgao7h131G81j5n59Ipmk=
X-Google-Smtp-Source: AGHT+IFu/hzNGWz3qYAI+ycJkN0IMj5h7i2a3Pa9ZIOED17OWLzc/SnORoVfn2f/S86c3VKqPWBxoQ==
X-Received: by 2002:a05:6a20:8421:b0:15a:836:7239 with SMTP id c33-20020a056a20842100b0015a08367239mr1708600pzd.11.1695176930559;
        Tue, 19 Sep 2023 19:28:50 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001bc930d4517sm10610009plh.42.2023.09.19.19.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 19:28:50 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v15 3/7] dt-bindings: soc: nuvoton: Add NPCM GFXI
Date: Wed, 20 Sep 2023 10:28:08 +0800
Message-Id: <20230920022812.601800-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920022812.601800-1-milkfafa@gmail.com>
References: <20230920022812.601800-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Graphics Core Information (GFXI) node. It
is used by NPCM video driver to retrieve Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/nuvoton/nuvoton,gfxi.yaml    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..0222a43977ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,gfxi.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,gfxi.yaml#
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
+  that analyzes Graphics core behavior and provides information in registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-gfxi
+          - nuvoton,npcm845-gfxi
+      - const: syscon
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
+      compatible = "nuvoton,npcm750-gfxi", "syscon";
+      reg = <0xe000 0x100>;
+    };
-- 
2.34.1

