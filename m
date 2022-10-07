Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C85F72F7
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 04:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkCh75fz1z3c46
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 13:59:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PGi6gn3M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PGi6gn3M;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkCbY0y3nz305M
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 13:55:20 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 10so3462142pli.0
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 19:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvL1aZr91L1V33rsnzxvcgISHyMWNTs0KNs/7UZbFFY=;
        b=PGi6gn3MIqWVU+TXE142oPnMYkNf09HM03D5L62+SYiUCf45J/3yYB0YkB79hUZT7n
         r5OlglrXHLber7Gvrab2kMPPcz+58awc3A6ZGcNXIHKfXF+Ex1lVqFRDH8vnxAz4ti3l
         rnPqT+T+bKx9+NTPXhj2H3XbGqIGJGNy+ENlqPzTIFHVB3qhr1wdWdbjG0nH+idw1uwC
         TZMX44zirG6fgYxUlLHpl64skPgmpXX0/njv+cgUCOp14dC1/OhuIK61yTWa2ZP6cIAS
         5oKT2a3NnJgil8bBTGIkQVJR0AklEsXQsJ2BpX8d9bKRpyQNDSu7k/fOn011UGtD3yfw
         h0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvL1aZr91L1V33rsnzxvcgISHyMWNTs0KNs/7UZbFFY=;
        b=ajibvKWyZcihqE1uyC6TZuWwEwzV8sAUU+6lzKFl3fSL4QpCvtn6Uw7qyUhbkdBlxj
         JYeA/JXO1bJkUahb9loY+Jp6JJmSFmu1WyF4HTGKeKVeJIaO0587OcnRb1yKYEclMmT6
         wcNjAr4epa2/0vuZjEDZhtF5n8L1gX9G0S4d/boResNxljf+o1qHX1YhJW8osuX9aJCC
         wyUujluVjE6b5T8oALiJvIJlblHu2vuHPFtu3RJP7Gqq8rG3kTew1bKpWM1c0nhuZxPC
         xLWXexAyWJhBNLMX23XOHVLwMhlvKouKHEqdJc8aQjJvnyil8l499kr1NE/nChU2cQtb
         L7Qg==
X-Gm-Message-State: ACrzQf0nHO9pwMF5DCbMnH82r5sT1cj8UpoY8z0/9kGTe0jTdEtR/9np
	zWLIuYJ7QdNnE7LBG90ixFfddAPm8OWCjg==
X-Google-Smtp-Source: AMsMyM6NKPDU09xKFC634Gb0hqUzIkZuq+9cRdMf8L/kgzn2tQP5ySKyTCinHCInUMd4bFnxsC+GPg==
X-Received: by 2002:a17:90b:1644:b0:20b:aa58:125c with SMTP id il4-20020a17090b164400b0020baa58125cmr261176pjb.110.1665111316011;
        Thu, 06 Oct 2022 19:55:16 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a63574c000000b0041c0c9c0072sm476944pgm.64.2022.10.06.19.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:55:15 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v1 4/5] media: Add HEXTILE compressed format
Date: Fri,  7 Oct 2022 10:54:12 +0800
Message-Id: <20221007025413.3549628-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007025413.3549628-1-milkfafa@gmail.com>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add HEXTILE compressed format. This format is defined in Remote Framebuffer
Protocol (RFC 6143) and is used by Encoding Compression Engine present on
Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 8 ++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 0b879c0da713..719e2c4f0256 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -261,6 +261,14 @@ please make a proposal on the linux-media mailing list.
 	and 16-aligned resolutions for the chrominance plane (with 2x2
 	subsampling).
 
+    * .. _V4L2-PIX-FMT-HEXTILE:
+
+      - ``V4L2_PIX_FMT_HEXTILE``
+      - 'HXTL'
+      - Compressed format used by Nuvoton NPCM video driver. This format is
+        defined in Remote Framebuffer Protocol (RFC 6143, chapter 7.7.4 Hextile
+        Encoding).
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 7c596a85f34f..7536bc21c76d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1436,6 +1436,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_S5C_UYVY_JPG:	descr = "S5C73MX interleaved UYVY/JPEG"; break;
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_SUNXI_TILED_NV12: descr = "Sunxi Tiled NV12 Format"; break;
+		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9260791b8438..6fcd1a61914a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -737,6 +737,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
+#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile compression */
 
 /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.34.1

