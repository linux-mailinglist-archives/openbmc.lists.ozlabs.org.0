Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB987AA90F
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 08:28:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKeFdPNR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsMmS2WfXz3cPf
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 16:28:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fKeFdPNR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsMgN6jg7z3cM7
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 16:24:32 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-578a6bb11ecso1351936a12.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 23:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695363870; x=1695968670; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwbtYXnybBb97SoCFL69GICK++fjeLJoanazsQv4oQE=;
        b=fKeFdPNRD0mS50ZARaroOSGQFfVfnYhYTuBPxzsMRjzCn4UUaU0EG0+6+fayyzbaPv
         NKlOrnUdS8ham45Riyy3DjhLL95UPiT0yuBJXVK6665BbBd1x4f5Y1z0KwSiTHqSPWvG
         10soxcWZQaNib6jy7Vc6Dm/CSZ4F3Ghfrvax/3ZcbWMKBBnyM4ix/9yGqltzKxWCgbKm
         WQlU4Q4MYoyF7JiTk5a0TmjHmeqgxf72dW0AlsAMua29ohFBKMeTpJPoC1AQC1TWQ/bP
         rsdPCJNAp8dtTksiNdVU54/UTAnVXRBblnCwyRGEtksppOR2LPoIdbP/9IiqpYDfR7qm
         Wgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695363870; x=1695968670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwbtYXnybBb97SoCFL69GICK++fjeLJoanazsQv4oQE=;
        b=pJZ4hnHFdqQvgUbGvOdPZGLZ8LgG9kVf6Z7gPyY2PMMwpp341IaqTTzBJVDCz3/8Fr
         LpNbNuDg5ZTSrA17mFTW+wVt0cjp0YdzXQJMLpSNFlCi//xzcq50I3F2ENGA5NGHEulw
         ORUqsY+bX5lrCbudK+9BVyz1XqdR93FP3YpKb0aktdnHu7aTTiEXWyNKDmmQ3Tgqi2f5
         aWzstVhX1+hNjxYs1GPA5WVy1Sfpu8QaNIHuuFRoMlmokcrwfrYW1spMZi9QQlIt6DyC
         qEp4WoKvCv7cM0valWinKU4IXgs4fc1S3dyQoLmKdQEYOE7mm62YKOI/AtAWhSBm0yHn
         Cv1g==
X-Gm-Message-State: AOJu0Yy/rv1CWQQLppEXpl/ZWFZfQllujlM77aprAEOXiM44UaoWA8Qx
	H6OeO00tojyvqmlzK2mRioA=
X-Google-Smtp-Source: AGHT+IGjJ/lGi2ldN3E+TLfQOmoRwDd/IiBE1Wqc41iQsZNfJTLcqQg2r3SgxkTiR7gy/ipXxIbLqg==
X-Received: by 2002:a05:6a20:325a:b0:153:73dd:282c with SMTP id hm26-20020a056a20325a00b0015373dd282cmr6678561pzc.58.1695363870144;
        Thu, 21 Sep 2023 23:24:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090ade0b00b00274de7c8aacsm4157417pjv.45.2023.09.21.23.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:24:29 -0700 (PDT)
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
Subject: [PATCH v16 4/7] media: v4l: Add HEXTILE compressed format
Date: Fri, 22 Sep 2023 14:24:02 +0800
Message-Id: <20230922062405.2571850-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922062405.2571850-1-milkfafa@gmail.com>
References: <20230922062405.2571850-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add HEXTILE compressed format which is defined in Remote Framebuffer
Protocol (RFC 6143, chapter 7.7.4 Hextile Encoding) and is used by
Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index 296ad2025e8d..886ba7b08d6b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -288,6 +288,13 @@ please make a proposal on the linux-media mailing list.
       - 'MT2110R'
       - This format is two-planar 10-Bit raster mode and having similitude with
         ``V4L2_PIX_FMT_MM21`` in term of alignment and tiling. Used for AVC.
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
index f4d9d6279094..9b1de54ce379 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1510,6 +1510,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
+		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 78260e5d9985..c3d4e490ce7c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -804,6 +804,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
 #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
 #define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
+#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile compressed */
 
 /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.34.1

