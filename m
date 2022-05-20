Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7052E2B4
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4B7610mwz2yyf
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mt0Bm0NW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mt0Bm0NW; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4B3r48XSz3bY6
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 12:48:08 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id g184so6638471pgc.1
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Aut+o9rfvWHqOONG13fN766+RLiN2j4Zswig8lgnh6A=;
 b=mt0Bm0NWZ0PpZvy9PgPLDCWxkjLZm2wOIINCQ4B9h8CUWDJOQ9YHY9Gaqwkbvq1cX9
 Bo5zEjnm5PDzWqJnC5hyRCBkLlmdgIx63wzMCajrcNHyynpk/R5xblBQDA4RQRlQ6EPG
 0bi9uhu1NJt18engeMoepVNDUhPQLtuBKsQskN28wsoWcJ/HGW0DkVO1E6uIYrmPYotI
 5plUpuP3az6oDYE/c33NDpUafbTuwbt2/35I5jqIQOWQ2gYCQmdmkO5vfyPwOaO4MhtP
 EKD33M4M/3Vsgw3VH0fbOgSrMVmAe9fds9+vNcpL9JYrCeyAYYn3Y7RwRCYce29YQDUq
 bJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Aut+o9rfvWHqOONG13fN766+RLiN2j4Zswig8lgnh6A=;
 b=tmBjNJX6bPswgrzxRGCqrYelqyKOw8mhr0EyhSIklJwL8IlqEHMJUDftXVa/nB7KSY
 IjdHNY3l39kWR8DG1BcYUC+o93ZDEnvFIkqP5f6fOmOyx1R1HemN1an1bFFBcvsKXQsR
 mD6TpRpXyd0Az7lywcyVGy57pVitNgC9ZrPH6sQ/OYh7Orj48ZuvCyE7AWkdeKkevxY8
 TsURwoN50xZlc/YqhwpTtTo8c0mXWMUUasxBXxw2QJrb38plXrLxM3CllU86Favx78hP
 w5Z2IF0/mFh8Rc1Rsz5pxCcHEDpt8wCQi7YglFOULg+Q+Ekm0oSJit/EAFpZbYEQCmMX
 msNA==
X-Gm-Message-State: AOAM531u3ojdkrP1tTu+hlK4hWGQ+6TcTBbr5FU6S5rG8H8SIvWlqLWT
 4NyOMMANk1bzBRsUYOBh0hEisz0XRkkuxQ==
X-Google-Smtp-Source: ABdhPJx8c2HrsRQqil6H1HOfljjgTuyEBakwTDuLtQ2jkRB/emqOZN3P6TiGmK4xyMLPBlnru9siLw==
X-Received: by 2002:a05:6a00:24cc:b0:50d:58bf:5104 with SMTP id
 d12-20020a056a0024cc00b0050d58bf5104mr7716956pfv.36.1653014886022; 
 Thu, 19 May 2022 19:48:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm379406pfe.218.2022.05.19.19.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 19:48:05 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] media: Add HEXTILE compressed format
Date: Fri, 20 May 2022 10:47:43 +0800
Message-Id: <20220520024744.25655-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220520024744.25655-1-milkfafa@gmail.com>
References: <20220520024744.25655-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add HEXTILE compressed format. This format is defined in Remote Framebuffer
Protocol (RFC 6143) and is used by Encoding Compression Engine present on
Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index cabfa34b7db5..bad2b9a2f16e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -239,6 +239,13 @@ please make a proposal on the linux-media mailing list.
 	It remains an opaque intermediate format and the MDP hardware must be
 	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
 	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
+    * .. _V4L2-PIX-FMT-HEXTILE:
+
+      - ``V4L2_PIX_FMT_HEXTILE``
+      - 'HXTL'
+      - Compressed format used by Nuvoton NPCM video driver. This format is
+        defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4 Hextile
+        Encoding).
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 96e307fe3aab..9365519d65bb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1441,6 +1441,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_SE401:	descr = "GSPCA SE401"; break;
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
+		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3768a0a80830..1c7af015b43b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -746,6 +746,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
+#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile compression */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.17.1

