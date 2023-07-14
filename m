Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828CC7540CE
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 19:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2f5N2Tvhz3cN3
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 03:45:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.43; helo=mail-io1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2f4W4Mvyz3c2B
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 03:44:43 +1000 (AEST)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-786f25bcb40so90107539f.3
        for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2023 10:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356681; x=1691948681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV9Da8S/o+GcXZDxCrzxUGI5PHKINHHUjNM42LhtDVI=;
        b=knzXRdRXlK+M94AIyMzBKRS24UPOXikIM2uXIoL4vBrkP4hPxR1tXS4xJrW3raIUf6
         J4TpjgxQe86vX+ueG/uXKHIwz9fAUkHcNsCEmNlA781VIh+ptA896CtuKnKN5DhnhwHo
         ReFeCMaqXM2Yz5urT/TYx5D4uLjsAAvNmVWNpkXjPW0qSfEUS68pQAS1LzGXaVAsxQOP
         ZrOxSBU5NYsBkxZA1HYedw+zFNK8SnlnMusfv6mZ/mokMLNMM2PIq/0e753sec+DnOx+
         Vl60NT3ERQT7TWA61hJHTXg5C7PhB14NLHGc23fo7wv1jrUeesvW2H+nl1AOrug2NiqZ
         e4lQ==
X-Gm-Message-State: ABy/qLY/hZFJ8UcdqSZc4WdHChWji7XgLOf/hlnmu1kdBB6AEC8y7f7k
	ruiIIDcWWbNezDmb0igxOQ==
X-Google-Smtp-Source: APBJJlGlFtyf4Tie/h8dCIM7jryLsyrObgUhLDCFK/NgH9zG9diy+SFgnTmnsvaGmL9uZCjfxqHyPA==
X-Received: by 2002:a92:dc92:0:b0:340:8cb1:aaa8 with SMTP id c18-20020a92dc92000000b003408cb1aaa8mr5022077iln.21.1689356681136;
        Fri, 14 Jul 2023 10:44:41 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id d13-20020a92d78d000000b00345d3f2bb6asm2861052iln.56.2023.07.14.10.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:44:40 -0700 (PDT)
Received: (nullmailer pid 4054811 invoked by uid 1000);
	Fri, 14 Jul 2023 17:44:37 -0000
From: Rob Herring <robh@kernel.org>
To: York Sun <york.sun@nxp.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Richter <rric@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Johannes Thumshirn <morbidrsa@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Marvin Lin <kflin@nuvoton.com>, Stanley Chu <yschu@nuvoton.com>, Michal Simek <michal.simek@amd.com>
Subject: [PATCH] EDAC: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:44:34 -0600
Message-Id: <20230714174434.4054728-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/edac/fsl_ddr_edac.c     | 3 +--
 drivers/edac/highbank_l2_edac.c | 3 ++-
 drivers/edac/highbank_mc_edac.c | 3 ++-
 drivers/edac/mpc85xx_edac.c     | 3 +--
 drivers/edac/npcm_edac.c        | 3 ++-
 drivers/edac/synopsys_edac.c    | 1 -
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index ac2102b25706..b81757555a8a 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,8 +22,7 @@
 #include <linux/smp.h>
 #include <linux/gfp.h>
 
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
diff --git a/drivers/edac/highbank_l2_edac.c b/drivers/edac/highbank_l2_edac.c
index c4549cec788b..140d4431bd0d 100644
--- a/drivers/edac/highbank_l2_edac.c
+++ b/drivers/edac/highbank_l2_edac.c
@@ -7,8 +7,9 @@
 #include <linux/ctype.h>
 #include <linux/edac.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/of_platform.h>
 
 #include "edac_module.h"
 
diff --git a/drivers/edac/highbank_mc_edac.c b/drivers/edac/highbank_mc_edac.c
index 19fba258ae10..a0c04a7f95e9 100644
--- a/drivers/edac/highbank_mc_edac.c
+++ b/drivers/edac/highbank_mc_edac.c
@@ -7,8 +7,9 @@
 #include <linux/ctype.h>
 #include <linux/edac.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/of_platform.h>
 #include <linux/uaccess.h>
 
 #include "edac_module.h"
diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 55320546c174..2b5703e5066e 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -22,8 +22,7 @@
 #include <linux/gfp.h>
 #include <linux/fsl/edac.h>
 
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include "edac_module.h"
diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
index 12b95be3e989..6d15c1550263 100644
--- a/drivers/edac/npcm_edac.c
+++ b/drivers/edac/npcm_edac.c
@@ -3,7 +3,8 @@
 
 #include <linux/debugfs.h>
 #include <linux/iopoll.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include "edac_module.h"
 
diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index f7d37c282819..c4fc64cbecd0 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -11,7 +11,6 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "edac_module.h"
 
-- 
2.40.1

