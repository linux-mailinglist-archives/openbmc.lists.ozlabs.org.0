Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBF6F3F8D
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 10:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9Ycy10T2z3cfT
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 18:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E3MdIO/A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=E3MdIO/A;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9YYS0B7Yz3bmL
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 18:44:59 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24df161f84bso1676372a91.3
        for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 01:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683017098; x=1685609098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=E3MdIO/ALfBUzoPr+2/LB9OBzNa03bCDt3HgtRaNCIBsOxyTZAoTEnUzOlUzUfL5UZ
         2nbTqUt+LGCSITOtDlIWRVJLNGTjwTqZSxt9fcAVgi95YeHuHD+qalIUpGsChTrbe6xv
         BWztvbUY6fBNbB7p76SF5LhvDmDWcAuugwpG5DwKEEQLpX6+XAB/mMNUNkAvlrZON/h/
         HFIL3G4hK32fjrUv9WzY1gh1avfDnJ19ttx7B2ndMGFsd67B8QCoOnYuUNMTfyHWx278
         MzQdIFdhcwNkQ5SQ8Ht0+gW3V8lnlF5CAxhIvZeamC/yvKan/FgVHwYSx+TqArpxZteO
         FOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683017098; x=1685609098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxkElKmgrqtTP5be0jVrJHJmBiDppX9Zdl7lKzzovCQ=;
        b=KZlpoGap4lZpVbnsoqQ99vhAYslD4jW0K1VcKvOPAUo8FnPzU94y9EzGDeMWSGdib+
         uHXEZ0xr81IVo/JVbAma8yuL8DwXpY9AQjkPhOlQcl0Y+dRe10gEmqMqy6JQz0lP1ruf
         Fy8eBcyNhDBRhkPPssUvEiVQbKl7fhu9NxVdaK4zONNlVkTFOa3KLEzsjk7BvZRW5Yd+
         CQVUhh0ggWwqv57yaVbjQM6K3hldnUY78z1ty1Eq0JJmIp5wgmXpV4PtyCVEmI+AG49S
         qd+oYwQEjTBFzWEqRWBmpISV/aRb6JoK7HdHVelqE4OJQ+3AnmKcsPMMe7RhYBf4ciQA
         EbLg==
X-Gm-Message-State: AC+VfDx/te05HQidsh+4mF34zC/aBPfedAxBuomIapZnAZnt2KjgJsGE
	ykxTdryAe6YKEqrr3ZyIzrM=
X-Google-Smtp-Source: ACHHUZ4PzPq9FpvGx6sDrB/f0bcJ2nCoy0IVJqdQr7wggK5QJhhDJ1ywGFCdBy6kjzzXylmFUalsFQ==
X-Received: by 2002:a17:90b:1645:b0:247:e4c:d168 with SMTP id il5-20020a17090b164500b002470e4cd168mr17812992pjb.10.1683017097685;
        Tue, 02 May 2023 01:44:57 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a520a00b0023fcece8067sm7059039pjh.2.2023.05.02.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 01:44:57 -0700 (PDT)
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
Subject: [PATCH v12 3/7] dt-bindings: arm: nuvoton: Add NPCM GFXI
Date: Tue,  2 May 2023 16:44:26 +0800
Message-Id: <20230502084430.234182-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502084430.234182-1-milkfafa@gmail.com>
References: <20230502084430.234182-1-milkfafa@gmail.com>
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

