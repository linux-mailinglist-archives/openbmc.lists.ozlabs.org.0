Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D54525A2F
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvVx18Gfz3c97
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:38:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SqGraAyR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SqGraAyR; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvSH2K0Cz3c7t
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:35:59 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id q76so6327331pgq.10
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8zMHqi3yqKJENYLoeBcGjkD8v2fKK4XGuEyyjPVzsgk=;
 b=SqGraAyRoFb8lpXHJZOf7XAML98FWMltAyaZ/qIRk7slqYq1RghgCR4k9/6Yq5lc72
 MuWHDdamdAzuj2jr13aq8ir1TlcJLK5m7KOFafKPbKLR5JxFon6Bk/E/dNdozK1iSA8S
 /Rf9+1O/bqMUe+O+lkwBKYfm9rLtXll9CCiUSsUJn9qYhMbmqpJDLo7fkZX4hdIEFFWB
 SxjocHvE+egJ8vHi6n3NjYFZmZYuJ7jaNOI+y3jygdVTxNaGxWawcDJAk1C8762NGtkT
 7J0lL9unk9JZceBcUysjtSFrO54FSgeKO7nXuLHg9hmXGZF9UHU6aOExI8EnCfQs/uxK
 BWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8zMHqi3yqKJENYLoeBcGjkD8v2fKK4XGuEyyjPVzsgk=;
 b=D6loAAaX/F+4/5SRucx7HoGauUKpo83xPCWcddUqXCz0/zF0v2SlfpRHZAI3K/v+2W
 9bQR0YXyEx0EYPQOhWqpR7Xbkf5KjFBpVwjfqcpiJsBomtTfNXqLaGtDq9+QeUZCgVC1
 rJlT47SSok8JmUVh/w43Z8g6utyFCaeWZhOnSM0o23fle/j+Fh45VpNQNcdcerAtU25S
 MiZh3hJWMKIIx+JkQjQ5znpqOKxidaYJ0yAFk0yHZCqWnms6uF4uQtzIWNW92xPyJbpO
 xeviYG0WGAx8Vna9v2/HnBQl2JpAh7i1RzChU1oEghxs36YdGDcXUqfcC/A59AluFk40
 D6XA==
X-Gm-Message-State: AOAM533pDDMTkcLs0Y3s/WMv8qe81eYvcxF+QkxGL0D5qF4Sk+zsqMgo
 y/K9zKJVleHDGOAsLH4HYzQ=
X-Google-Smtp-Source: ABdhPJw6hfHnmaJiyVv9euLErcRUjbaSSV1uXQGHDMl6Yo6HT1YoHPBIVo1o8gYdh5mNtADNBzG6sw==
X-Received: by 2002:a05:6a00:2481:b0:50d:4839:5896 with SMTP id
 c1-20020a056a00248100b0050d48395896mr2685313pfv.37.1652412956923; 
 Thu, 12 May 2022 20:35:56 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm685133plm.17.2022.05.12.20.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 20:35:50 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] media: Add HEXTILE compressed format
Date: Fri, 13 May 2022 11:34:49 +0800
Message-Id: <20220513033450.7038-5-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513033450.7038-1-kflin@nuvoton.com>
References: <20220513033450.7038-1-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add HEXTILE compressed format. This format is defined in Remote Framebuffer
Protocol (RFC 6143) and is used by Encoding Compression Engine present on
Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
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

