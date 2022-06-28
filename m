Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7A55BDDA
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 05:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX9BT2zLbz3bd9
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 13:32:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U+fOV2v1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U+fOV2v1;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX98G6gblz3bsH
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:30:06 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so14476684pjl.5
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
        b=U+fOV2v1sJ74tAGKSDutwxAjn8WfFAGL+W4N0TogvIZ5eld1TEXqlHrX/psC/4RAPF
         pZEDT26sAGoOI7RL7EPsPeqR0yZqWzrQF9nay9XtTeKOZnjLo6FTT6I4KWq/e0ADwFD4
         f/wpJsXvkfMnJrmoHT7DxCgDL/o2jB0ZjqKMdYkkvbdeFFP/d/DZoSA1IMU4cdZ1zxhU
         ZG+xFT42WTbAh03Pwk23aEJCFBtKn5dpDNwP+mn7Coh7m2FWYWQ0vDeuGTvzW4UF4hjk
         EjqrXcjpdAEEfI5Ka/2q3psGy9F+4UG7MgXmq0HXpNuIm9fssx54Tq8DrOkWQ5XVciDJ
         h0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
        b=W+aH2IVdifKo/WTqPP1OUIXjS2Q4mqazzbGBCjZ3J9csvIHYqe8j+iU3NNhQRMMo83
         dkb5B+3E6ZTIDvrp5zn3wWVi2R56LwJ9YX1jX6VuJ+0ICz2W0WrdiR0G5uaFwzxh/zHH
         yRNZap8dKeCZODHx/RTJnfjSiyQCmUOkgBsuUHSbz76TfMWvOOcGopzwIMRi3tse9TGx
         TuK32VFoFSnIf3p6pDmEwtfX7YKKjYvtwcEKX2cFCnmVOyOBdN4icOKHb4NK/3nrSJbI
         Iz8m16n8tgP5dVzjHv2vy474jd1tETtv00snUZyk8uQjFAY6IfYuIpPshogCe606Sree
         hrZw==
X-Gm-Message-State: AJIora/DkQOlFK2TiGB4IxYIxwGHIJroihKP2Q7oESxku4S2O94qzB0X
	NSn67j9nGlf4RrBdlavTMNY=
X-Google-Smtp-Source: AGRyM1uvWbK4wa/KhCuPEUhrWgsNAfn1M8V6mnTSD8KS1054N/LTGlzEcRK5eT6t3Qe+tBXPR1HeWQ==
X-Received: by 2002:a17:902:848d:b0:168:ab37:327c with SMTP id c13-20020a170902848d00b00168ab37327cmr2832693plo.112.1656387004569;
        Mon, 27 Jun 2022 20:30:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c26-20020a62e81a000000b0050dc762816dsm8091160pfi.71.2022.06.27.20.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:30:04 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics Core Information
Date: Tue, 28 Jun 2022 11:29:43 +0800
Message-Id: <20220628032945.15410-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220628032945.15410-1-milkfafa@gmail.com>
References: <20220628032945.15410-1-milkfafa@gmail.com>
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
2.17.1

