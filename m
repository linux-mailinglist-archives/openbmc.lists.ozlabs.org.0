Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F32B4D904F
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:26:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXj70h5jz2xTs
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:26:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EijL8UVG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=jim.t90615@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EijL8UVG; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFG231jRFz2xXd
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 17:17:47 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id a5so7103992pfv.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 22:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FLJvetiEVjSl2Z/q1Pm7lZvV+L+ilwexJGJt6xRhYkQ=;
 b=EijL8UVG0fQcWZrkhXqYaB9eHeaIkfHdSv02uOrRAK4nPXz7TwZUYqF+VlFbIxgmem
 1vdVBw681p2Fpk2oFgcY5hpXanNIm8CzsdkVnTCQa4wueMS32/ROX/5uZpG/vc7HA4dj
 B1rmMLYxFUp2jWYwC24WtSD9duxa+6AAw8C+Nj5F4SL9mCsX7vL7vE8VzV3J2UtluQw8
 L4vjt5G+isKb6PEoqdgIlyx1xUBLTW0lSVjXoJOzdygnVxFgSLvxuYYHTAzFXlhsLyAu
 7xkPzlp/Y3XfX4acIzi4mGWWMN02UJ/xqF1WGRFUtCfd+ai92SpdkJD7xH7N+8hEx54K
 HSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FLJvetiEVjSl2Z/q1Pm7lZvV+L+ilwexJGJt6xRhYkQ=;
 b=3pIMBzz0+qnVx5PA1dXHtJff6gmG1CjstBHwOoCctWN8HFYtFZl4JwSSZZtWbP22zU
 cG5xIHwjBNlSz+khXeHK1kKNFk1eKu0lZFqAFBfaVmO7E8gj2N0UyGveiGAySFCCuqYH
 MdsiLPqkIlQtMZs7pAyddOLFvj+xkPc+ICNpIwKIrpxPYoKHi96K3QuoQA2VAmFMw377
 1MqUdJEZm5/0vounPXYynTusSbaO+QGV+7jbocqKqk9btmGZPDgGPBzZbagn+1b6lQyg
 UmuepXN3JeaJU3T9csU2Rdt151nvMcZKkT2PzZ6loLli9zyZ85GVRQeVyPLkr+u8n0dH
 RteQ==
X-Gm-Message-State: AOAM531qbpeuXCLaeGYkVJGuTEXfLVF/gMxKYVGI7ssvpRlok+PrpuSC
 CjEbyU6Lf6Q+1lEGKthfV+g=
X-Google-Smtp-Source: ABdhPJzOt/fejTiZOCiY5w1JYuR70gXh/h14mWMIrl8pCKWFI+ebG/iwX49rrPcwnNDQbeNRBYNg0g==
X-Received: by 2002:a05:6a00:a2a:b0:4f7:68db:5e60 with SMTP id
 p42-20020a056a000a2a00b004f768db5e60mr8752812pfh.58.1646979465091; 
 Thu, 10 Mar 2022 22:17:45 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a0010d400b004f7093700c4sm9101764pfu.76.2022.03.10.22.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 22:17:44 -0800 (PST)
From: jimliu2 <jim.t90615@gmail.com>
X-Google-Original-From: jimliu2 <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
 brgl@bgdev.pl, robh+dt@kernel.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jim.t90615@gmail.com,
 CTCCHIEN@nuvoton.com
Subject: [PATCH v1 2/3] dt-bindings: support Nuvoton sgpio
Date: Fri, 11 Mar 2022 14:09:35 +0800
Message-Id: <20220311060936.10663-3-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311060936.10663-1-JJLIU0@nuvoton.com>
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add nuvoton sgpio yaml in dt-bindings

Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
---
 .../bindings/gpio/nuvoton,sgpio.yaml          | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..8766e1fa4528
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton SGPIO controller
+
+maintainers:
+  - Jim LIU <JJLIU0@nuvoton.com>
+
+description:
+  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC,
+  NPCM7xx/NPCM8xx have two sgpio module each module can support up
+  to 64 output pins,and up to 64 input pin.
+  GPIO pins can be programmed to support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity option (level-high, level-low, edge-high, edge-low)
+  - Directly connected to APB bus and its shift clock is from APB bus clock
+    divided by a programmable value.
+  - ngpios is number of nin_gpios GPIO lines and nout_gpios GPIO lines.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-sgpio
+      - nuvoton,npcm845-sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nin_gpios: true
+
+  nout_gpios: true
+
+  bus-frequency: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - nin_gpios
+  - nout_gpios
+  - clocks
+  - bus-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sgpio1: sgpio@101000 {
+        compatible = "nuvoton,npcm750-sgpio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0x101000 0x200>;
+        clocks = <&clk NPCM7XX_CLK_APB3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&iox1_pins>;
+        nin_gpios = <64>;
+        nout_gpios = <64>;
+        bus-frequency = <16000000>;
+    };
-- 
2.17.1

