Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EE656946
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 10:57:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh9793tDgz3bT7
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 20:57:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TkuNIbW4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TkuNIbW4;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh9141p7hz3bW2
	for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 20:52:08 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id f3so8502125pgc.2
        for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 01:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=TkuNIbW419DCqnsMr8eROaVQRmpRqJUmz8qFDChR3AkvRG2XJwiv9WqKS3cZkR06pM
         m7kx4XFi3Zxf5mM7a76yH8bJsn+EXflGk8c+dFvTjSt35Ap8UegvtHW9JhCzwyEmoFZx
         dU4yrPuiKyI0uFiZpqWjXbdyL7b7LMRjcBWUkympMUPTpT22Or0BLRCoP1nNvFLVNM77
         I8Eh7sj67inMzq/UU3vak5c4+UAKFKuKCpD0DxFwIlgywrW5AmXJAH9DFutP/5nYo/NJ
         U8bhgmhW/YpRvbA19PyUNJjoa5Yf0WPmL932dZzcKZh+yCnxmUpDQnUGGWM1KtjpjHuu
         +SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=OSEX+bIDyPyl+9FlDJNy5KBIDug5T13Llz/mlZHgqarce619/m9387Thp9z8/h0f53
         jHZwsKkvcf8KhM0ui7k9g8bG5QFUrXX5YkMaGw3bsh4Z6CEfQhINiQdX8uZenK8IZaqd
         ut9JM8V2uxzSgsHYVUv3z7EQsDXn3Mw03xrsrJSP1T31XYg6tq2OoFuXbujpWjXa6gPq
         tFKyg6u6xkbW0za7Dyq+uZ4m7A1n6iKERDFbeX8gcLDimZxvUlBmsX1iL8XQV+XALx9S
         dKEdJ16ouuvO4ub0eIzsLUo+CrkN6VQndTo8xqHBas26kNnY+TYX587kFGyQfiR6S1Uh
         s2eg==
X-Gm-Message-State: AFqh2kr2N2EABkH1uxM6PyPROwV2SDiw2JmouCmWzkJe3KU4sr9Jm6Yl
	DijofGIKZlA1BOvcDd9KGis=
X-Google-Smtp-Source: AMrXdXtH7P1bk4khx+VeL2/j7rwXJlz5kYFRm5DvOOlO25yNuhzpS0JkzL4B3kdOIcFBLflDj4UfRw==
X-Received: by 2002:a62:bd19:0:b0:566:900d:a1de with SMTP id a25-20020a62bd19000000b00566900da1demr23770765pff.26.1672134726050;
        Tue, 27 Dec 2022 01:52:06 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 21-20020a621515000000b005813aec74bdsm2619052pfv.139.2022.12.27.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:52:05 -0800 (PST)
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
Subject: [PATCH v10 5/7] media: v4l2-ctrls: Reserve user control base for NPCM video controls
Date: Tue, 27 Dec 2022 17:51:21 +0800
Message-Id: <20221227095123.2447948-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227095123.2447948-1-milkfafa@gmail.com>
References: <20221227095123.2447948-1-milkfafa@gmail.com>
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

Add a control base and reserve 16 controls for Nuvoton NPCM video
controls.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b73a8ba7df6c..aa5c9f64f1d6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -199,6 +199,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ASPEED_BASE		(V4L2_CID_USER_BASE + 0x11a0)
 
+/*
+ * The base for Nuvoton NPCM driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NPCM_BASE			(V4L2_CID_USER_BASE + 0x11b0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.34.1

