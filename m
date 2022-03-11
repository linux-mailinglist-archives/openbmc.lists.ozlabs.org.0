Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA24D62F2
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 15:08:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFST70BZ5z308F
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 01:08:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QpWCf0Qr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QpWCf0Qr; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFSSc6gJqz2xTp;
 Sat, 12 Mar 2022 01:08:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD79061D7C;
 Fri, 11 Mar 2022 14:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339ADC340F7;
 Fri, 11 Mar 2022 14:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647007676;
 bh=yWuOwgCKKH3cUQ5RmtkkII7ase31tF+oYbnerblLvgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QpWCf0Qrck+zSaJE47tBgImiRqglXOFjUPQxPhC5ayhWGorCOKPdrECbanYgw2Ybp
 VsOka/+ZKE/Msht00BGN3dcBaMpQ9JWm2vlHpse5XVjjAQ/ioDe+IjBkbscB9fiZCC
 VKUPg9ztSO21kJVpBMmKy/NGGP9rlWkubVZW6hL17gcO/mAJiL6p8UkJ70ZLsC+QVR
 MggGCjVA1YsZvek+yXv5B3vLre1tLHTPIfrbjx31DkMRF3xZo+2lynbzQceX7SVZW/
 Dkkr+LJIq1hGjVVm3M0rOXFQx/WsQEalMemdlIpypOd4NJ+5+H0RCP7luF1a3IJ0xB
 +EvgYifjDZ2yg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nSfvt-000lAu-SD; Fri, 11 Mar 2022 15:07:53 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 06/38] media: platform: place Aspeed driver on a separate
 dir
Date: Fri, 11 Mar 2022 15:07:19 +0100
Message-Id: <97fe1a5a4183c04ac8bed0cee7583fcda96a3dd6.1647006877.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Jammy Huang <jammy_huang@aspeedtech.com>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Jacopo Mondi <jacopo@jmondi.org>, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In order to cleanup the main platform media directory, move Aspeed
driver to its own directory.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/

 MAINTAINERS                                        |  2 +-
 drivers/media/platform/Kconfig                     | 10 +---------
 drivers/media/platform/Makefile                    |  2 +-
 drivers/media/platform/aspeed/Kconfig              | 10 ++++++++++
 drivers/media/platform/aspeed/Makefile             |  1 +
 drivers/media/platform/{ => aspeed}/aspeed-video.c |  0
 6 files changed, 14 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/aspeed/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Makefile
 rename drivers/media/platform/{ => aspeed}/aspeed-video.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a9fb0615925..1b6f48a660de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3026,7 +3026,7 @@ L:	linux-media@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/aspeed-video.txt
-F:	drivers/media/platform/aspeed-video.c
+F:	drivers/media/platform/aspeed/
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 1cb73f09d0b5..ad95a25ae2fc 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -57,15 +57,7 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
 
-config VIDEO_ASPEED
-	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
-	select VIDEOBUF2_DMA_CONTIG
-	help
-	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
-	  AST2400 and AST2500 SOCs. The VE can capture and compress video data
-	  from digital or analog sources.
+source "drivers/media/platform/aspeed/Kconfig"
 
 config VIDEO_SH_VOU
 	tristate "SuperH VOU video output driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index c7ee7dafe6b3..1a52a1a784b5 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -5,6 +5,7 @@
 
 # Place here, alphabetically sorted, all directories
 obj-y += allegro-dvt/
+obj-y += aspeed/
 obj-y += am437x/
 obj-y += amphion/
 obj-y += atmel/
@@ -44,7 +45,6 @@ obj-y += vsp1/
 obj-y += xilinx/
 
 # Please place here only ancillary drivers that aren't SoC-specific
-obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
 obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
 obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
new file mode 100644
index 000000000000..5025e892844c
--- /dev/null
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_ASPEED
+	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_V4L2
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
+	  AST2400 and AST2500 SOCs. The VE can capture and compress video data
+	  from digital or analog sources.
diff --git a/drivers/media/platform/aspeed/Makefile b/drivers/media/platform/aspeed/Makefile
new file mode 100644
index 000000000000..4ee15b3ddd90
--- /dev/null
+++ b/drivers/media/platform/aspeed/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
similarity index 100%
rename from drivers/media/platform/aspeed-video.c
rename to drivers/media/platform/aspeed/aspeed-video.c
-- 
2.35.1

