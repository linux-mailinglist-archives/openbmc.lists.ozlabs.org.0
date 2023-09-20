Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C6C7A7091
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 04:33:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X2PtEu84;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr2dh6RV9z3cRX
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 12:33:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X2PtEu84;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr2XS14T8z3c7n
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 12:28:56 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c44c0f9138so31468625ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695176934; x=1695781734; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwbtYXnybBb97SoCFL69GICK++fjeLJoanazsQv4oQE=;
        b=X2PtEu84xN1Idl0rAw9MxXeb9CX6YhGpdy9MSAIR9z9nYfV1dqxg/Q8SYYyl2GpD57
         y1rPo7V/2NSKrgx8G988MqXQSy+fMhXmE1JV+EDFIKvJrzGteZIIEnWCiJQShNvVtdpT
         ap54Y6USGhZcJE99lifn858gI8qtLjsbLWS3PYbU7nTnKqEKyyhh+Qc89nrblGnC9k72
         PRL8WMbLXOLhcAVL7hN69ezxXXA/zNr0Deoruy0Y2ivBSbBy6wUXVIM6urAQKtHGEMuh
         QtWsK0nSIo+NS4DFLmvrERHusVlm3wI7gDsvnrATsnXyPgOawyDPfC0j/imO9D4UnChC
         G+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695176934; x=1695781734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwbtYXnybBb97SoCFL69GICK++fjeLJoanazsQv4oQE=;
        b=h1ITdFN/DheC3f7hcfTztouZM5uZa2/pdDUG5YablkLOkli48pF68oRKE7DO6tKMKP
         MeQ9btfjrlUHOfJgbTg33vcjfEvAio9LcwSNd/WlR3Yn8Fpoear/GiL9jSSVrUmNT4hj
         UsctOTgH2E8kcKyyPtrqsxs8egGQ+qS+PddZUmxBMLD6VLHPpLtjQMOAN2ciq8jJJ6FS
         N7NSCoB5yMjhZvMWz0JDPIgW0vZ8pNptOhETUSXN8L5lY0NbZ0M7G/yjk9c/qkYItNB/
         URRKDti/fVpQegxvQw7EBjE+Zb5F6EkpWiwOQkqJdbFODD3dCEb1AQ0/BSARedae3gP8
         msrw==
X-Gm-Message-State: AOJu0YyoLfvLUCZyq/sC4bkAeCzpLDnQSg2Tqkp2m2KhYCBRaSujbuPP
	iswNN7FrFbnppznoXGS2CyU=
X-Google-Smtp-Source: AGHT+IEzh5+tcQah+SlJ9h6z0FmZq28gRgfSagly08dVU65t3hBNj2CfItm/lAY64//E+dRPiVoDmA==
X-Received: by 2002:a17:902:7585:b0:1b9:e972:134d with SMTP id j5-20020a170902758500b001b9e972134dmr1047711pll.3.1695176933784;
        Tue, 19 Sep 2023 19:28:53 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001bc930d4517sm10610009plh.42.2023.09.19.19.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 19:28:53 -0700 (PDT)
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
Subject: [PATCH v15 4/7] media: v4l: Add HEXTILE compressed format
Date: Wed, 20 Sep 2023 10:28:09 +0800
Message-Id: <20230920022812.601800-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920022812.601800-1-milkfafa@gmail.com>
References: <20230920022812.601800-1-milkfafa@gmail.com>
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

