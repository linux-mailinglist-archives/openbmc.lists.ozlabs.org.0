Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F4170E52
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:17:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SbsB4rjpzDqQn
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:17:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=hb18EYnC; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Pj3L6jN5zDqBj;
 Sat, 22 Feb 2020 20:00:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1Ec93HvvQv5rRZi0GxCPtkfIn9YVu0EbHv8lrpBvD3c=; b=hb18EYnCNMTfq2FTucvg/Rcg7Z
 j54mQwl64UFduej61QyAFVutIxKVK9HrfJUQnZxjMV7tDiURKzA3wksO01FtrqW//x5I2qARD5I8s
 ECkWnXfWb236+YVs8tOuastqyNZNllZN4qw7QJlKG6EsZm9l359jxbWRtZsKjo70wTIE/N2cRcNCe
 9mqyYyoclF9WbSH5WQwOd62eXErvUvQEZgzY9xggPE5pNpedBqmfyqwWkYbWlPlmTaHLK7MOtHaGK
 l4iNd6m2//JIyN1txAZNlP+6a6L+RNI6aVkwEuCKpZ+XyQ4tsjaY34wSrwNDH3wQvw4GUtLWBrliw
 eq+azmQw==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Qdz-0007Hq-AA; Sat, 22 Feb 2020 09:00:15 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j5Qdx-001N4H-Hu; Sat, 22 Feb 2020 10:00:13 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 2/7] docs: dt: fix several broken references due to renames
Date: Sat, 22 Feb 2020 10:00:02 +0100
Message-Id: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:09:16 +1100
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
Cc: Stuart Yoder <stuyoder@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Several DT references got broken due to txt->yaml conversion.

Those are auto-fixed by running:

	scripts/documentation-file-ref-check --fix

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,scmi.txt        | 2 +-
 Documentation/devicetree/bindings/arm/arm,scpi.txt        | 2 +-
 .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt         | 2 +-
 .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt  | 2 +-
 .../devicetree/bindings/arm/msm/qcom,idle-state.txt       | 2 +-
 Documentation/devicetree/bindings/arm/omap/mpu.txt        | 2 +-
 Documentation/devicetree/bindings/arm/psci.yaml           | 2 +-
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 2 +-
 .../devicetree/bindings/display/tilcdc/tilcdc.txt         | 2 +-
 Documentation/devicetree/bindings/leds/common.yaml        | 2 +-
 .../devicetree/bindings/leds/register-bit-led.txt         | 2 +-
 .../devicetree/bindings/memory-controllers/ti/emif.txt    | 2 +-
 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt   | 2 +-
 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-
 .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml  | 2 +-
 .../devicetree/bindings/reset/st,stm32mp1-rcc.txt         | 2 +-
 .../devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml  | 2 +-
 MAINTAINERS                                               | 8 ++++----
 20 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
index f493d69e6194..dc102c4e4a78 100644
--- a/Documentation/devicetree/bindings/arm/arm,scmi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
@@ -102,7 +102,7 @@ Required sub-node properties:
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Documentation/devicetree/bindings/power/power-domain.yaml
 [3] Documentation/devicetree/bindings/thermal/thermal.txt
-[4] Documentation/devicetree/bindings/sram/sram.txt
+[4] Documentation/devicetree/bindings/sram/sram.yaml
 [5] Documentation/devicetree/bindings/reset/reset.txt
 
 Example:
diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
index 7b83ef43b418..dd04d9d9a1b8 100644
--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -109,7 +109,7 @@ Required properties:
 [0] http://infocenter.arm.com/help/topic/com.arm.doc.dui0922b/index.html
 [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
 [2] Documentation/devicetree/bindings/thermal/thermal.txt
-[3] Documentation/devicetree/bindings/sram/sram.txt
+[3] Documentation/devicetree/bindings/sram/sram.yaml
 [4] Documentation/devicetree/bindings/power/power-domain.yaml
 
 Example:
diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
index b82b6a0ae6f7..8c7a4908a849 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm63138.txt
@@ -62,7 +62,7 @@ Timer node:
 
 Syscon reboot node:
 
-See Documentation/devicetree/bindings/power/reset/syscon-reboot.txt for the
+See Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml for the
 detailed list of properties, the two values defined below are specific to the
 BCM6328-style timer:
 
diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
index 115c5be0bd0b..8defacc44dd5 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
@@ -1,7 +1,7 @@
 * Hisilicon Hi3519 System Controller Block
 
 This bindings use the following binding:
-Documentation/devicetree/bindings/mfd/syscon.txt
+Documentation/devicetree/bindings/mfd/syscon.yaml
 
 Required properties:
 - compatible: "hisilicon,hi3519-sysctrl".
diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
index 06df04cc827a..6ce0b212ec6d 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
@@ -81,4 +81,4 @@ Example:
 		};
 	};
 
-[1]. Documentation/devicetree/bindings/arm/idle-states.txt
+[1]. Documentation/devicetree/bindings/arm/idle-states.yaml
diff --git a/Documentation/devicetree/bindings/arm/omap/mpu.txt b/Documentation/devicetree/bindings/arm/omap/mpu.txt
index f301e636fd52..e41490e6979c 100644
--- a/Documentation/devicetree/bindings/arm/omap/mpu.txt
+++ b/Documentation/devicetree/bindings/arm/omap/mpu.txt
@@ -17,7 +17,7 @@ am335x and am437x only:
 - pm-sram: Phandles to ocmcram nodes to be used for power management.
 	   First should be type 'protect-exec' for the driver to use to copy
 	   and run PM functions, second should be regular pool to be used for
-	   data region for code. See Documentation/devicetree/bindings/sram/sram.txt
+	   data region for code. See Documentation/devicetree/bindings/sram/sram.yaml
 	   for more details.
 
 Examples:
diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 8ef85420b2ab..f8218e60e3e2 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -100,7 +100,7 @@ properties:
       bindings in [1]) must specify this property.
 
       [1] Kernel documentation - ARM idle states bindings
-        Documentation/devicetree/bindings/arm/idle-states.txt
+        Documentation/devicetree/bindings/arm/idle-states.yaml
 
   "#power-domain-cells":
     description:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 17f87178f6b8..3647007f82ca 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -42,7 +42,7 @@ properties:
       be part of GCC and hence the TSENS properties can also be part
       of the GCC/clock-controller node.
       For more details on the TSENS properties please refer
-      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+      Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
 
   nvmem-cell-names:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
index 7bf1bb444812..aac617acb64f 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
@@ -37,7 +37,7 @@ Optional nodes:
    supports a single port with a single endpoint.
 
  - See also Documentation/devicetree/bindings/display/tilcdc/panel.txt and
-   Documentation/devicetree/bindings/display/tilcdc/tfp410.txt for connecting
+   Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt for connecting
    tfp410 DVI encoder or lcd panel to lcdc
 
 [1] There is an errata about AM335x color wiring. For 16-bit color mode
diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index d97d099b87e5..c60b994fe116 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -85,7 +85,7 @@ properties:
         # LED will act as a back-light, controlled by the framebuffer system
       - backlight
         # LED will turn on (but for leds-gpio see "default-state" property in
-        # Documentation/devicetree/bindings/leds/leds-gpio.txt)
+        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
       - default-on
         # LED "double" flashes at a load average based rate
       - heartbeat
diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.txt b/Documentation/devicetree/bindings/leds/register-bit-led.txt
index cf1ea403ba7a..c7af6f70a97b 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.txt
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.txt
@@ -5,7 +5,7 @@ where single bits in a certain register can turn on/off a
 single LED. The register bit LEDs appear as children to the
 syscon device, with the proper compatible string. For the
 syscon bindings see:
-Documentation/devicetree/bindings/mfd/syscon.txt
+Documentation/devicetree/bindings/mfd/syscon.yaml
 
 Each LED is represented as a sub-node of the syscon device. Each
 node's name represents the name of the corresponding LED.
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
index 44d71469c914..63f674ffeb4f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
@@ -32,7 +32,7 @@ Required only for "ti,emif-am3352" and "ti,emif-am4372":
 - sram			: Phandles for generic sram driver nodes,
   first should be type 'protect-exec' for the driver to use to copy
   and run PM functions, second should be regular pool to be used for
-  data region for code. See Documentation/devicetree/bindings/sram/sram.txt
+  data region for code. See Documentation/devicetree/bindings/sram/sram.yaml
   for more details.
 
 Optional properties:
diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
index bb7e896cb644..9134e9bcca56 100644
--- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
+++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
@@ -26,7 +26,7 @@ For generic IOMMU bindings, see
 Documentation/devicetree/bindings/iommu/iommu.txt.
 
 For arm-smmu binding, see:
-Documentation/devicetree/bindings/iommu/arm,smmu.txt.
+Documentation/devicetree/bindings/iommu/arm,smmu.yaml.
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
index bb690e20c368..135c7dfbc180 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml
@@ -17,7 +17,7 @@ description: |+
                     "aspeed,ast2400-scu", "syscon", "simple-mfd"
 
   Refer to the the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.txt
+  Documentation/devicetree/bindings/mfd/syscon.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index f7f5d57f2c9a..824f7fd1d51b 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -18,7 +18,7 @@ description: |+
   			"aspeed,g5-scu", "syscon", "simple-mfd"
 
   Refer to the the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.txt
+  Documentation/devicetree/bindings/mfd/syscon.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 3749fa233e87..ac8d1c30a8ed 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -17,7 +17,7 @@ description: |+
                 "aspeed,ast2600-scu", "syscon", "simple-mfd"
 
   Refer to the the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.txt
+  Documentation/devicetree/bindings/mfd/syscon.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
index aab70e8b681e..d3098c924b25 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -18,7 +18,7 @@ description: |+
                 "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
 
   Refer to the the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.txt
+  Documentation/devicetree/bindings/mfd/syscon.yaml
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
index b4edaf7c7ff3..2880d5dda95e 100644
--- a/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
+++ b/Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
@@ -3,4 +3,4 @@ STMicroelectronics STM32MP1 Peripheral Reset Controller
 
 The RCC IP is both a reset and a clock controller.
 
-Please see Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
+Please see Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
index d9fdf4809a49..f3e68ed03abf 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml
@@ -17,7 +17,7 @@ description: |+
                 "brcm,bcm2711-avs-monitor", "syscon", "simple-mfd"
 
   Refer to the the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.txt
+  Documentation/devicetree/bindings/mfd/syscon.yaml
 
 properties:
   compatible:
diff --git a/MAINTAINERS b/MAINTAINERS
index e8bcf73f63cc..d110256a6802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4022,7 +4022,7 @@ M:	Cheng-Yi Chiang <cychiang@chromium.org>
 S:	Maintained
 R:	Enric Balletbo i Serra <enric.balletbo@collabora.com>
 R:	Guenter Roeck <groeck@chromium.org>
-F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
 F:	sound/soc/codecs/cros_ec_codec.*
 
 CIRRUS LOGIC AUDIO CODEC DRIVERS
@@ -5673,7 +5673,7 @@ L:	dri-devel@lists.freedesktop.org
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/stm
-F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
+F:	Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
 
 DRM DRIVERS FOR TI LCDC
 M:	Jyri Sarha <jsarha@ti.com>
@@ -10193,7 +10193,7 @@ MAXBOTIX ULTRASONIC RANGER IIO DRIVER
 M:	Andreas Klinger <ak@it-klinger.de>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
+F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
 MAXIM MAX77650 PMIC MFD DRIVER
@@ -10496,7 +10496,7 @@ M:	Hugues Fruchet <hugues.fruchet@st.com>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Supported
-F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.txt
+F:	Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
 F:	drivers/media/platform/stm32/stm32-dcmi.c
 
 MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
-- 
2.24.1

