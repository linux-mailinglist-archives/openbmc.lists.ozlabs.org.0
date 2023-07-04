Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82D7469EA
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 08:47:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KY2obyYE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwCz61CfRz3c3W
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 16:47:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KY2obyYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwCvV1s3dz30dp
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2023 16:44:38 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-55e04a83465so3602214eaf.3
        for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2023 23:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688453074; x=1691045074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=KY2obyYESzVjRBeUsmZ60npJo2lZdksg//QRatxMy4X6uTgeTH330jAXlM1kxn4bcx
         +oZrv+Rk8AGPumczcrqQe1OI7rjWRb2Otd04BEeuOyYElrUTacsxdD7nT9AI61xlRD+C
         NOsC6vB0j5Ckh0M1f81CgZYi8Tk8yRLeYZob2TxvxmceX72Jr6fIZY3Hj0qt4wKHqJOz
         mOPCWzz81GE6+jbZ74v+h5eDTPYQzu45Mm345kUTJzBai+5/aAzS7K7xLxrr45x51Hph
         hmYyoaT+g250b30VjmisILMIeE50kGsq7ZUswM8GH1TSMhxjkpc8LvebWbUgyEckH6Mv
         G4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688453074; x=1691045074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OHbfvvmaSbzlb/vBLJ9aFEGcvRSExJ6vAXO7h1XWQ4=;
        b=I2lgUO/txoeVjghDKYxTgI1GMHjKvAdvZrgdYiR5hj77XtNPCabbniZk+oaHLn/FqP
         Ckv0H6sOEtpMD7FevXqBKPOi6j/24/v7YCTiXRtkCXFs2y42K6rugd9PUuLOaNVQ6FNZ
         HPeOwSBkcIdGXilunPU33DBkxrC4bGi8l7d6TMyg+/kbZrIazRt6AWODs1zeITlMOVHq
         ZKA4JrKjDl4AJ1PlXwuEk9Ea4xQMRFq2aULAKDBcG0SHISqlPX4i6smtvUHz6Ndl07UH
         Rlfig8n56mvGR78lH58Mza+sSWBFprVYIBioG1bC0+zuioWXvk33eBSpB+aZ4Y3KNCr8
         eDDQ==
X-Gm-Message-State: ABy/qLbG7QXMnCmyx+A+w+O95//Um0UnxeuWLVrUh2OTn2V37393wBdZ
	hEETUHGfVjgNASVC2TFzRc0=
X-Google-Smtp-Source: APBJJlHD6Bco3FK8+YJv9FEp4SHU73++m6lHAAoBoXMzH7wGLP95nW1aLC6eAF3yywPVlsMsaw6OtA==
X-Received: by 2002:aca:1308:0:b0:3a3:9293:dd75 with SMTP id e8-20020aca1308000000b003a39293dd75mr8857519oii.28.1688453074572;
        Mon, 03 Jul 2023 23:44:34 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00668652b020bsm14863429pfm.105.2023.07.03.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 23:44:34 -0700 (PDT)
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
Subject: [PATCH v13 3/7] dt-bindings: soc: nuvoton: Add NPCM GFXI
Date: Tue,  4 Jul 2023 14:44:08 +0800
Message-Id: <20230704064412.2145181-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704064412.2145181-1-milkfafa@gmail.com>
References: <20230704064412.2145181-1-milkfafa@gmail.com>
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

