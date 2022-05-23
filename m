Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB7F5308AC
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65Ts6Nkmz3blp
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GGZZqE1G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GGZZqE1G; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65Qy3bkZz3blt
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:26:18 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so16524807pjb.0
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W3bZk2RgbGLiBzgiA1wbLysvDZIqXxx7I9gmSpoK2zk=;
 b=GGZZqE1G6hJLr/ahJFr3gQhYnlnoomS7qy2XXTXrFVfSdeMJqBE/k4+DYwU45vsRSz
 N+YbHvIFA+fZJwRk5MqDEIfiIaIvoOgROM/qMAdNsbOOW5TLDEJNQ+a63B2TP7VXhTmM
 3j6Uau1BEKbaS1GpEe0CWZfiFOkVOMPxFs250Lxxf92LiWmptKSVvcxQ3zwaoh4/q+oZ
 h7LivN6dKp3+d3k4OiGUW0WjOZ0MfW2bb1rXV7Eq1cdi1EEEwTfQjLFa+Sblb4WcZhU3
 oYaw+EzMUKnn+SkLGZN8EyWwRsjnR/D5hDkTIPScarHQvTmd2/yOKcStZmdaJzA3JVlk
 C1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W3bZk2RgbGLiBzgiA1wbLysvDZIqXxx7I9gmSpoK2zk=;
 b=5xBco1YWPEuWvEMoyymAl5Vtwl9AKecPwwRxT0rDCspWjIK8eT3CCjZsmm9h2Lf3hx
 ei3p5M1vfWpXy/Y4+jkH3AwS5CCUCkBAAIWE7yK4Gthfm+KxpEIVyWDP51zIblPAdxFI
 85OhckXvZHKMiRSg1XE9yQPtcKda7foD+V80uk2Y2OV2qo1tfIYLVxs9mYlhjUzFUBPN
 I9s3hplgz+0AWirVdpqrIYVrxer8Prlo5uAAxVwr8KICL2UXmkEMffiqFRpLdUBRJsLj
 K3Zb6z4d7ktmBgWlA3T4fMVRvGNTObov0b0H5hqokEodxDjgKON36/boM0ca+wCxlgX9
 zJEQ==
X-Gm-Message-State: AOAM530pcXBUHj5WaACZcV9qN1pzZjugQJ3mdsSDCEjEZ61OpZnkB7m7
 pjY5D874oiNlPuxTutXBmTg=
X-Google-Smtp-Source: ABdhPJwe47I2RtwOfEOVMvSG6THGgoQB0BelOFvSFBpoaS7XBR1cEiNWZrLKxIfwLBlI4mk0tBslHw==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id
 l17-20020a170903121100b0015e82088cc0mr21755804plh.52.1653283575987; 
 Sun, 22 May 2022 22:26:15 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a655285000000b003c14af50603sm3871523pgp.27.2022.05.22.22.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:26:15 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] media: Add HEXTILE compressed format
Date: Mon, 23 May 2022 13:25:47 +0800
Message-Id: <20220523052548.28109-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523052548.28109-1-milkfafa@gmail.com>
References: <20220523052548.28109-1-milkfafa@gmail.com>
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
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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

