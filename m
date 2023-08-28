Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50178A8E4
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 11:26:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pN5+8kdL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ4tM3k0Yz3c3c
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 19:26:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pN5+8kdL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ4lR024Dz3btq
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:20:02 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68c0d262933so1545486b3a.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693214400; x=1693819200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9/IAi2WKAiTTNgYoMQrx/m0c+NwYKV1J+3q3HTRy94=;
        b=pN5+8kdLHT/JCsmuvv0NmqVzDo6cCAutdgRJyM7SJFpKwNufXLMX1pGw+vUUOP7NuK
         sVMaovZ3ve3zZEuSUfHiwzhY0Z0Jowb1N+Ji8LOt+v8GH7qSjrN1mJhR6dSctJArYqzW
         YSK7xfHldRgKt8JS1kPCUoRLT6lhlETlA7Ef2A1r6OGa9Zz5OV/zh/cxIt9zjAN2d3ed
         7kmggCfoQ6WJ74BEUUZDlOlQV0s9jt90PV5+MxTG9YMkjrNBSBEYl7oBe3OrVIUG99K4
         8k8CyFDjz9rryJ5cHGcsjeEUHyVm8nBNxGpTTE966PP4SL4cjAJy0Pp4h3PtAFyWAQv1
         g6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693214400; x=1693819200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9/IAi2WKAiTTNgYoMQrx/m0c+NwYKV1J+3q3HTRy94=;
        b=QYMMvFslWnS6TXLH0amGA1xfdRjZF59wyTE/6AyfwJ+Twcvvn4PpL693B9Kmv7rHLk
         vLbsndS/E7yBAW3SYmw79ohyDhMcXZrZN6LOlYZkc2h3DogZ0fb3JsblD1bJ2nKTNeC8
         HPXSeaoyVsK6jPnR/m5Pl8cdaGhtF8Z6ntURb4VYQg46G8vMt+fzf/L3l0Dex3utAoXj
         W99ZxiNCtdPIOsNWnA32mWsM95YAjGoLyQxxhoeFMfwl6KENrRnWOXpGyOhezmIsfkdj
         5KuPbxevufM7hu7bdUttQTFVZJYUjQ5t87yd6ycIcnPUlQi/vbM6HpJoRSJ3BnfNdDBW
         TU8Q==
X-Gm-Message-State: AOJu0YyRX0rWzZFJG76A62illCD6UjhveOILKmgXwqkVK8rUL3C/HeAP
	Ng4Qtpwy1FtQrLY8MV515vE=
X-Google-Smtp-Source: AGHT+IE/Dm+/HkQkkTY3/IWMOgu9Mv6poyWiHDwAJdjvEieGkNJVTeUoeBbfb6FSXmYMMuS5c4WSlQ==
X-Received: by 2002:a05:6a20:428c:b0:13f:4e70:ad48 with SMTP id o12-20020a056a20428c00b0013f4e70ad48mr24690367pzj.52.1693214399985;
        Mon, 28 Aug 2023 02:19:59 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b001bf8779e051sm6749403plg.289.2023.08.28.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 02:19:59 -0700 (PDT)
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
Subject: [PATCH v14 6/7] media: uapi: Add controls for NPCM video driver
Date: Mon, 28 Aug 2023 17:18:58 +0800
Message-Id: <20230828091859.3889817-7-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828091859.3889817-1-milkfafa@gmail.com>
References: <20230828091859.3889817-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Create controls for Nuvoton NPCM video driver to support setting
capture mode of Video Capture/Differentiation (VCD) engine and getting
the count of HEXTILE rectangles that is compressed by Encoding
Compression Engine (ECE).

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../userspace-api/media/drivers/index.rst     |  1 +
 .../media/drivers/npcm-video.rst              | 67 +++++++++++++++++++
 include/uapi/linux/npcm-video.h               | 41 ++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/npcm-video.rst
 create mode 100644 include/uapi/linux/npcm-video.h

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 6708d649afd7..783f92f01a4c 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -37,6 +37,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	dw100
 	imx-uapi
 	max2175
+	npcm-video
 	omap3isp-uapi
 	st-vgxy61
 	uvcvideo
diff --git a/Documentation/userspace-api/media/drivers/npcm-video.rst b/Documentation/userspace-api/media/drivers/npcm-video.rst
new file mode 100644
index 000000000000..d0d596d1fb82
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/npcm-video.rst
@@ -0,0 +1,67 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: <isonum.txt>
+
+NPCM video driver
+=================
+
+This driver is used to control the Video Capture/Differentiation (VCD) engine
+and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs. The VCD can
+capture a frame from digital video input and compare two frames in memory, and
+the ECE can compress the frame data into HEXTILE format.
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
+After frame data is captured, if using V4L2_PIX_FMT_HEXTILE format, the ECE will
+compress the data into HEXTILE format and store these HEXTILE rectangles data in
+V4L2 video buffer with the layout defined in Remote Framebuffer Protocol:
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
diff --git a/include/uapi/linux/npcm-video.h b/include/uapi/linux/npcm-video.h
new file mode 100644
index 000000000000..1d39f6f38c96
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
+	V4L2_NPCM_CAPTURE_MODE_COMPLETE	= 0, /* COMPLETE mode */
+	V4L2_NPCM_CAPTURE_MODE_DIFF	= 1, /* DIFF mode */
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

