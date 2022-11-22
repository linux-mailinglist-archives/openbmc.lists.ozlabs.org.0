Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B325B6337DC
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 10:04:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGdbv3lBnz3cF6
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 20:04:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i1Hlnyrk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i1Hlnyrk;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGdSp4Tsqz3cLr
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 19:58:02 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id y13so13772523pfp.7
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 00:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCuoC3ZK+f0MYOxr5GQA/jhwn1vyzgSzmA1l7LzDqeI=;
        b=i1HlnyrkOViZAulaPPBGMoLRp+7Dw0lgicmqiuFhVVnNhqFgP4XeRa9OWEIh+SuCYV
         PoDOCmEbUzivp8E1PhyJxP9YtFZheI/MXk6UeZ1mkP77Za9MeEd+9BkLkLEezUCwnJ0J
         yEYgUOOKr/KzHOWgzvk8I+0w76IQP11j8aoVtnd57OPipXgEtzSYybZKXvoqJ7ZBWrTq
         DHEJUL1kin2bV0OhiyjROxBfQdUZCo1hiyJlQJDTGkET0h/zwA9KNOaEJXkHB4NcHiWI
         yGPJhLWNFTT+8IYnyXLr7jHzkzby5HnMIYUnAIm7AjF0NcCG5AxxEnpp/nUfl4PDMoA1
         gk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCuoC3ZK+f0MYOxr5GQA/jhwn1vyzgSzmA1l7LzDqeI=;
        b=1bz3wDGJ8UDMsCd+1H88fB7k5w+/H+r8QYCoUO0/XDiU/SRXYW3DxujtbF+kdI8jPa
         bbDvYCw5nusD3e5uc31PPbMllMfKIHFwLtlhsr18sHP0IsKI4CN9xLgtiGlR50YG+f6q
         aNdMdR3WCGzNkmJn0cA4ei2Bet8neLbPyb9fYkrbPOFrW9u10PCRKy5idq0IpDM+Agzp
         Z1B9+RL6x0SXCTbjq0PjvtvVqXgTUVWDxlrameSPYsClcFaOakqowKeHPy8IWQgFGSAH
         M+RidfQEdC2XaAoSd470Jm8+Wy2KdGrXOu8iATTdW7xJl/8W15fvXhQeHTdk9u14VNzm
         p2TQ==
X-Gm-Message-State: ANoB5pkS17BNYTvwnVnuT2he7wQ4vU+1W/IVl61Mv/t3D0D6yz+f+Ii3
	pSNHB/aCaQG7rNmGBMRqXxmNfgEkF4EkkA==
X-Google-Smtp-Source: AA0mqf5NtAaMMznEc3iAagqWVa0t+kw+t23oM2duIe7OYDTlQIjrJY6tQFRAp1c75+3ca80xt5y0hw==
X-Received: by 2002:a62:1812:0:b0:56c:afe:e8bf with SMTP id 18-20020a621812000000b0056c0afee8bfmr3069036pfy.51.1669107480130;
        Tue, 22 Nov 2022 00:58:00 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b0017a0668befasm11400246ple.124.2022.11.22.00.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:57:59 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 6/7] media: uapi: Add controls for NPCM video driver
Date: Tue, 22 Nov 2022 16:57:23 +0800
Message-Id: <20221122085724.3245078-7-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122085724.3245078-1-milkfafa@gmail.com>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Create controls for Nuvoton NPCM video driver to support setting
capture mode of Video Capture/Differentiation (VCD) engine and getting
the count of HEXTILE rectangles that is compressed by Encoding
Compression Engine (ECE).

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../media/drivers/npcm-video.rst              | 68 +++++++++++++++++++
 include/uapi/linux/npcm-video.h               | 41 +++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/npcm-video.rst
 create mode 100644 include/uapi/linux/npcm-video.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 32f82aed47d9..27ce108b15e1 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -37,5 +37,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	max2175
 	meye-uapi
+	npcm-video
 	omap3isp-uapi
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/npcm-video.rst b/Documentation/userspace-api/media/drivers/npcm-video.rst
new file mode 100644
index 000000000000..3041122fe299
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/npcm-video.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+NPCM video driver
+=================
+
+This driver is used to control the Video Capture/Differentiation (VCD) engine
+and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs. The VCD can
+capture and differentiate video data from digital or analog sources, then the
+ECE will compress the data into HEXTILE format.
+
+Driver-specific Controls
+------------------------
+
+V4L2_CID_NPCM_CAPTURE_MODE
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The VCD engine supports two modes:
+
+- COMPLETE mode:
+
+  Capture the next complete frame into memory.
+
+- DIFF mode:
+
+  Compare the incoming frame with the frame stored in memory, and updates the
+  differentiated frame in memory.
+
+Application can use ``V4L2_CID_NPCM_CAPTURE_MODE`` control to set the VCD mode
+with different control values (enum v4l2_npcm_capture_mode):
+
+- ``V4L2_NPCM_CAPTURE_MODE_COMPLETE``: will set VCD to COMPLETE mode.
+- ``V4L2_NPCM_CAPTURE_MODE_DIFF``: will set VCD to DIFF mode.
+
+V4L2_CID_NPCM_RECT_COUNT
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+After frame data is captured, the ECE will compress the data into HEXTILE format
+and store these HEXTILE rectangles data in V4L2 video buffer with the layout
+defined in Remote Framebuffer Protocol:
+::
+
+           (RFC 6143, https://www.rfc-editor.org/rfc/rfc6143.html#section-7.6.1)
+
+           +--------------+--------------+-------------------+
+           | No. of bytes | Type [Value] | Description       |
+           +--------------+--------------+-------------------+
+           | 2            | U16          | x-position        |
+           | 2            | U16          | y-position        |
+           | 2            | U16          | width             |
+           | 2            | U16          | height            |
+           | 4            | S32          | encoding-type (5) |
+           +--------------+--------------+-------------------+
+           |             HEXTILE rectangle data              |
+           +-------------------------------------------------+
+
+Application can get these video buffers through V4L2 interfaces and use
+``V4L2_CID_NPCM_RECT_COUNT`` control to get the count of compressed HEXTILE
+rectangles that can be put in the field number-of-rectangles of
+FramebufferUpdate header.
+
+References
+----------
+include/uapi/linux/npcm-video.h
+
+**Copyright** |copy| 2022 Nuvoton Technologies
+
diff --git a/include/uapi/linux/npcm-video.h b/include/uapi/linux/npcm-video.h
new file mode 100644
index 000000000000..6d9c77068e45
--- /dev/null
+++ b/include/uapi/linux/npcm-video.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Controls header for NPCM video driver
+ *
+ * Copyright (C) 2022 Nuvoton Technologies
+ */
+
+#ifndef _UAPI_LINUX_NPCM_VIDEO_H
+#define _UAPI_LINUX_NPCM_VIDEO_H
+
+#include <linux/v4l2-controls.h>
+
+/*
+ * Check Documentation/userspace-api/media/drivers/npcm-video.rst for control
+ * details.
+ */
+
+/*
+ * This control is meant to set the mode of NPCM Video Capture/Differentiation
+ * (VCD) engine.
+ *
+ * The VCD engine supports two modes:
+ * COMPLETE - Capture the next complete frame into memory.
+ * DIFF	    - Compare the incoming frame with the frame stored in memory, and
+ *	      updates the differentiated frame in memory.
+ */
+#define V4L2_CID_NPCM_CAPTURE_MODE	(V4L2_CID_USER_NPCM_BASE + 0)
+
+enum v4l2_npcm_capture_mode {
+	V4L2_NPCM_CAPTURE_MODE_COMPLETE	= 0, // COMPLETE mode
+	V4L2_NPCM_CAPTURE_MODE_DIFF	= 1, // DIFF mode
+};
+
+/*
+ * This control is meant to get the count of compressed HEXTILE rectangles which
+ * is relevant to the number of differentiated frames if VCD is in DIFF mode.
+ * And the count will always be 1 if VCD is in COMPLETE mode.
+ */
+#define V4L2_CID_NPCM_RECT_COUNT	(V4L2_CID_USER_NPCM_BASE + 1)
+
+#endif /* _UAPI_LINUX_NPCM_VIDEO_H */
-- 
2.34.1

