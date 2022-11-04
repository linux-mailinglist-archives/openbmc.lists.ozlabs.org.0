Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0C618F3C
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 04:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3RKR0YsTz3cMs
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 14:42:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ByPQtXsq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ByPQtXsq;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3RDn62ryz3cKn
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 14:38:49 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id b11so3459453pjp.2
        for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2022 20:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTLUEyz86f0omThz6CvcZ5BTclh51H59iTgL5ZiQNn4=;
        b=ByPQtXsqQIx5ZYpazFrdOHFs0OFCPH0L+b81DwSDPD+isnGdvV3xSupNuDcy9K8Bgl
         sVT7iSe26DuT9KIKqAW1P+e2Pw/+c6smO46o3yuhWg40kO/tDAJEbhxmdw9iCfhet8QN
         g3uvPl6EUDSHKjowO7Io1lomxufEQiG1toYWH1pEymLuf+1fVXdCuhQq5nknSBe8mVKe
         rBGv5GtjqieA2v705iEIvZTyFgk4utg+9XC1QL5frT1UW9I2MWK4MQxOZ9eSAPA+FeFh
         RlTuWYZxT0/tPoaogDuW011vNHyaXDZQs650P+WOMg3GVQr6CuG8tPaCSyoiejD3cWWa
         mUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTLUEyz86f0omThz6CvcZ5BTclh51H59iTgL5ZiQNn4=;
        b=mW0y5/XIDjuucK4wMq4FU6hVw5jinv6sPVFl1qF6+DerYLgpMjnS42DIN5eRRaTDR7
         ZT7MAr3W3WWGeu8QwgLGKKlSYXZD+hG22xMxexagKXebwSR4eRJ59PTyQnSN54YXmlVi
         adZQ9+MeXWLvrlOXI1ujbe8Dp30jwBkj/W85r9KeQpkZRbC8Vyg42AvYgnN/FDA0kuse
         omlnFjUxnJuJcYGNVN+aAlj+wMS7NQSCxWnfPgYy+5a/JJno/xJrLDFVyXOqtpBScTXU
         cp9PcD2dq2YNFv1W/3gqxV50M2PcflROLK7uHJWOCHyqGle8lAD4bQLefCFnsTn0pRf8
         6mCA==
X-Gm-Message-State: ACrzQf1rlSai7J+gwfgE1b0fgKJThx2XLtKyA6oJlwl6SgOmnwDWFy3h
	i3z10/GUbSfZH6z20CFMtBE=
X-Google-Smtp-Source: AMsMyM5wN4TZuGXTDyr433nntTpfgzqtVWMIPy8fD43HafqG1HYtBWAqR3XGAlQQSHK5fwo1kb6nEw==
X-Received: by 2002:a17:90a:520c:b0:212:d135:4471 with SMTP id v12-20020a17090a520c00b00212d1354471mr53048603pjh.71.1667533128091;
        Thu, 03 Nov 2022 20:38:48 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b0056bb06ce1cfsm1545759pfq.97.2022.11.03.20.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:38:47 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] media: Add HEXTILE compressed format
Date: Fri,  4 Nov 2022 11:38:09 +0800
Message-Id: <20221104033810.1324686-5-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104033810.1324686-1-milkfafa@gmail.com>
References: <20221104033810.1324686-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>, kflin@nuvoton.com
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
index 0ff68cd8cf62..b45d8aa2e8b0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -258,6 +258,13 @@ please make a proposal on the linux-media mailing list.
         and it is used by various multimedia hardware blocks like GPU, display
         controllers, ISP and video accelerators.
         It contains four planes for progressive video.
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
index c314025d977e..bdbbba12f17c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
 		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
+		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
 		default:
 			if (fmt->description[0])
 				return;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 01e630f2ec78..4241dd4a0bfa 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -776,6 +776,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
 #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
 #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
+#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile compression */
 
 /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
-- 
2.34.1

