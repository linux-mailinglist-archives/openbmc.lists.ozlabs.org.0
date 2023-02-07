Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB368D2A8
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 10:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9yP60lXfz3c8x
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 20:23:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jx8S9Qdt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jx8S9Qdt;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9yJy6NqYz3cL8
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 20:20:18 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id bx22so11436331pjb.3
        for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2023 01:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=jx8S9Qdt4e94z5twK1nX5KVCvgxctmayeMLoJUjw/e//zQAxurC9ajeRWdx5GqVPqO
         F+DPxAKRR5F63lb+7A3dZADRrpEDK6lbGSDkfhQQ/Oeecrbez9iFe5ffG51XgGb2rw98
         5naQMqdtyxSDcfksu0067Egfm2PJ4QAhJHyAA33VPsC80VQpjZ8F+1QI9y4VVmv2mK4K
         P6TmLgjyn/amWRMTVhpEuj6gT8zE7ApAxSOArB0YvMSIBZRgmSJHuu0+a1j3Ov9VuGIJ
         T+n+iKte2dODH5C1a5fIrczYQ6OS3TkooS+Ago52iLthG0GXwt1bagUDCRRLvyn0OKxP
         7K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=R+yIyv8GCKxfh5H4l8Y55nyXvCFZRUwI2IYSxail6sVUhEZTl0ZbZkng3E8MiNPI1/
         MKdYa/zB1ZcTrFrL6gZGVBDRMJr0ykQcc25jJsbvfGUnJ25Bf0tlAgJpry/pchWy3REW
         2NGCgBOtymcAG4peGcasikD6l5p5o9Y94GR9vyG4moZWGIDYjutNgiNDg6C39rWhkqdY
         qQZMXN95jmF3J3QzfALnJtCeuJYvZmb8aCBXRJDNONGURStIDEfXca8d4m5FmvNIcEeS
         laBWw8uOdLJ/A2JdoflH6ZD9qOyDngSjA6cbKSifuWOAmS3voLLqKLpGZLp3ec9sg6zB
         8dNA==
X-Gm-Message-State: AO0yUKUEQsApuC8NtYHUGduL1zGKuLGeVzGnE4Og1CllrXpEyXuclmtW
	ys8UdXzkcrtaqEoXmpBJdiU=
X-Google-Smtp-Source: AK7set8vzilXOFhkDUuUxNOjw4kQaE2wDpspWEjsB8rypoNfhnbBkZ2/OvEv8ION7oXovA6eEevWeQ==
X-Received: by 2002:a17:902:f0d5:b0:199:1fa:7abe with SMTP id v21-20020a170902f0d500b0019901fa7abemr1697355pla.58.1675761616474;
        Tue, 07 Feb 2023 01:20:16 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b0019934030f46sm545327plb.132.2023.02.07.01.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:20:16 -0800 (PST)
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
Subject: [PATCH v11 3/7] dt-bindings: arm: nuvoton: Add NPCM GFXI
Date: Tue,  7 Feb 2023 17:18:58 +0800
Message-Id: <20230207091902.2512905-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207091902.2512905-1-milkfafa@gmail.com>
References: <20230207091902.2512905-1-milkfafa@gmail.com>
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
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..c033128e567a
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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

