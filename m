Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B72544B09B
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 06:16:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TBTG4xKPzDqjZ
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 14:16:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-m68k.org
 (client-ip=2a02:1800:110:4::f00:d; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Tue, 18 Jun 2019 00:43:51 AEST
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SDVb10cKzDqPw
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 00:43:49 +1000 (AEST)
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 45SDGn1kfhzMqpKT
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:33:37 +0200 (CEST)
Received: from ramsan ([84.194.111.163]) by michel.telenet-ops.be with bizsmtp
 id RqZQ200023XaVaC06qZQyw; Mon, 17 Jun 2019 16:33:34 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcshH-0002Hv-01; Mon, 17 Jun 2019 16:33:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcshG-000190-V2; Mon, 17 Jun 2019 16:33:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] dt-bindings: Add missing newline at end of file
Date: Mon, 17 Jun 2019 16:33:22 +0200
Message-Id: <20190617143322.4332-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:14:36 +1000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"git diff" says:

    \ No newline at end of file

after modifying the files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
 .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
 Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
 Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
index 3538a214fff156d4..352f5e9c759bc3f5 100644
--- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
@@ -36,4 +36,4 @@ Example:
             kcs_chan = <2>;
             status = "disabled";
         };
-    };
\ No newline at end of file
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
index 83f4bbac94bb19db..a1264cc8660dcd59 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt
@@ -213,4 +213,4 @@ pinctrl: pinctrl@f0800000 {
 		groups = "clkreq";
 		function = "clkreq";
 	};
-};
\ No newline at end of file
+};
diff --git a/Documentation/devicetree/bindings/regulator/pv88060.txt b/Documentation/devicetree/bindings/regulator/pv88060.txt
index 10a6dadc008eb38d..6a7c8a92fdb0bf1c 100644
--- a/Documentation/devicetree/bindings/regulator/pv88060.txt
+++ b/Documentation/devicetree/bindings/regulator/pv88060.txt
@@ -121,4 +121,4 @@ Example
 				regulator-max-microvolt = <5000000>;
 			};
 		};
-	};
\ No newline at end of file
+	};
diff --git a/Documentation/devicetree/bindings/sound/cs42l73.txt b/Documentation/devicetree/bindings/sound/cs42l73.txt
index 80ae910dbf6c3880..47b868b5ab011470 100644
--- a/Documentation/devicetree/bindings/sound/cs42l73.txt
+++ b/Documentation/devicetree/bindings/sound/cs42l73.txt
@@ -19,4 +19,4 @@ codec: cs42l73@4a {
 	reg = <0x4a>;
 	reset_gpio = <&gpio 10 0>;
 	chgfreq = <0x05>;
-};
\ No newline at end of file
+};
-- 
2.17.1

