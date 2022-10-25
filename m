Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179860C744
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 11:04:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxQww0hHJz3bqw
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 20:04:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxQvr15c3z30F7;
	Tue, 25 Oct 2022 20:03:19 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 29P8dHbv031240;
	Tue, 25 Oct 2022 16:39:17 +0800 (GMT-8)
	(envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 Oct
 2022 17:02:03 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <xavier.roumegue@oss.nxp.com>,
        <ezequiel@vanguardiasur.com.ar>, <stanimir.varbanov@linaro.org>,
        <nicolas.dufresne@collabora.com>, <sakari.ailus@linux.intel.com>,
        <ming.qian@nxp.com>, <andrzej.p@collabora.com>,
        <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 3/5] media: Documentation: aspeed-video: Add user documentation for the aspeed-video driver
Date: Tue, 25 Oct 2022 17:02:01 +0800
Message-ID: <20221025090203.5623-4-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025090203.5623-1-jammy_huang@aspeedtech.com>
References: <20221025090203.5623-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29P8dHbv031240
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add user documentation for the aspeed-video driver.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v10:
  - new
---
 .../media/drivers/aspeed-video.rst            | 61 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst     |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/aspeed-video.rst

diff --git a/Documentation/userspace-api/media/drivers/aspeed-video.rst b/Documentation/userspace-api/media/drivers/aspeed-video.rst
new file mode 100644
index 000000000000..798a2588b175
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/aspeed-video.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+ASPEED video driver
+===================
+
+ASPEED Video Engine found on AST2400/2500/2600 SoC supports high performance
+video compressions with a wide range of video quality and compression ratio
+options. The adopted compressing algorithm is a modified JPEG algorithm.
+
+There are 2 types of compressions in this IP.
+
+* JPEG JFIF standard mode: for single frame and management compression
+* ASPEED proprietary mode: for multi-frame and differential compression.
+  Support 2-pass (high quality) video compression scheme (Patent pending by
+  ASPEED). Provide visually lossless video compression quality or to reduce
+  the network average loading under intranet KVM applications.
+
+More details on the ASPEED video hardware operations can be found in
+*chapter 6.2.16 KVM Video Driver* of SDK_User_Guide which available on
+AspeedTech-BMC/openbmc/releases.
+
+The ASPEED video driver implements the following driver-specific control:
+
+``V4L2_CID_ASPEED_HQ_MODE``
+-------------------------------
+    Enable/Disable ASPEED's High quality mode. This is a private control
+    that can be used to enable high quality for aspeed proprietary mode.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 4
+
+    * - ``(0)``
+      - ASPEED HQ mode is disabled.
+    * - ``(1)``
+      - ASPEED HQ mode is enabled.
+
+``V4L2_CID_ASPEED_HQ_JPEG_QUALITY``
+-------------------------------
+    Define the quality of ASPEED's High quality mode. This is a private control
+    that can be used to decide compression quality if High quality mode enabled
+    . Higher the value, better the quality and bigger the size.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 4
+
+    * - ``(1)``
+      - minimum
+    * - ``(12)``
+      - maximum
+    * - ``(1)``
+      - step
+    * - ``(1)``
+      - default
+
+**Copyright** |copy| 2022 ASPEED Technology Inc.
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 32f82aed47d9..46a494e00b72 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -31,6 +31,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
+	aspeed-video
 	ccs
 	cx2341x-uapi
 	dw100
-- 
2.25.1

