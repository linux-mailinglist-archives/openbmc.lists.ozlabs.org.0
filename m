Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB95294C9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FSn13RMz3bym
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n0urGepy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n0urGepy; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzNfD06G3z3bcj
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 17:27:47 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so7044064pjb.3
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RK7P/G14GNSW6jrJ4jgbop4KxUD85r0Sbd2J3CZlqLU=;
 b=n0urGepyXkIlytzvgQbpxoeR7OTPesI6aTPJlkc1SRT4V7EFD6bmI4VNHvB7G/f6WP
 mIUN4YyHTUSfbj1LfNM0RgrUE/XJEYOa9qjlx4+8KdW607ChbjI2WzVjHcDlwM4B7o8l
 dZH1XORjjKLskrHsS2IOZHSYm+2e+xjYdmpcK3xdcYV+o5q9+8rX110IdCV8WESLLPXZ
 8NBKB+HpAcG8AVxDDVqQ6rRIKLdPXrmF+rk79MNFj1UH6ZRswArcECxche89z0uEh+y5
 2G4QTATbfoq9pkNKk7B4Rcuzq7IldGezhMoXawS4Fm29701B87CHlDXrCMWnmaXDryfd
 29Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RK7P/G14GNSW6jrJ4jgbop4KxUD85r0Sbd2J3CZlqLU=;
 b=lPn+rx8TlwdF8kjPkKi93vVZYD8CaLaYpG1YYCmvpF1X/Uu1FDsnbFyO85Md4efZZI
 b980wWgOpBC+eo4/zE4XMoIKY4wwKTpfmgJSDYkIGZcN7y0tK4JI2laiRL3538C9NSfW
 GfM1ZuLjEzVOQkPyxR1P7z+NnhRCmgckgV/fCrEF7Q0bZBcN7UQI/7JrftnAPYLH//Ql
 LI61KypKPhjCox2qfekWqCejDt3IVkXSxVnSdEJGAlkU7g7W0WbpokBBVQ2Mvk/a+8G0
 QCM8Ra0/orgKI7c7emKVfPwOduZ3NN2cu2kOH6fvEh5Celz9M+oHdT6KIc0kdykNBfwA
 XbXw==
X-Gm-Message-State: AOAM530EPeW3khN94ROepmf3E12MjivZojPQ/wY5fim+NjGikZoDBjqc
 vioz9jC4PZUcy/BlJ2UW9d4=
X-Google-Smtp-Source: ABdhPJzQIUQvr2MhSwIcDBA4+9eHkXPEPxoE+OjmFiWCMlb/eVF6SwH0qEJCYXTllPC6Pw1hlH6zvQ==
X-Received: by 2002:a17:902:c3cb:b0:15c:e5d2:227e with SMTP id
 j11-20020a170902c3cb00b0015ce5d2227emr28378826plj.13.1652340465672; 
 Thu, 12 May 2022 00:27:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b0050dc762813csm3082779pfq.22.2022.05.12.00.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:27:45 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] media: Add HEXTILE compressed format
Date: Thu, 12 May 2022 15:27:21 +0800
Message-Id: <20220512072722.25005-5-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512072722.25005-1-kflin@nuvoton.com>
References: <20220512072722.25005-1-kflin@nuvoton.com>
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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

Add HEXTILE compressed format. This format is defined in Remote
Framebuffer Protocol (RFC 6143) and is used by VNC features.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

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
index 3768a0a80830..e0e69f71d700 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -710,6 +710,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
+#define V4L2_PIX_FMT_HEXTILE  v4l2_fourcc('H', 'X', 'T', 'L') /* Hextile */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
-- 
2.17.1

