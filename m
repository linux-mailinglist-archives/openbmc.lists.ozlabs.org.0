Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 597B1746A13
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 08:50:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uk58Xeg4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwD1h16Gtz3c6v
	for <lists+openbmc@lfdr.de>; Tue,  4 Jul 2023 16:50:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uk58Xeg4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwCvc0mL1z30hM
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2023 16:44:43 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-668730696a4so2541946b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2023 23:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688453081; x=1691045081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJTkCoWmCbMtHWUFBdWByh/qbNj1+660uOBQdn+P8iE=;
        b=Uk58Xeg4W4VsC9fg1JBjTHNdn8GFx2Q982tAp12nRkQrIjSTOG/Fb8VUMV7CziTpIQ
         MHsozBo8E2pOnVOeZSxxDqRW6BdL4621WOPuUG+aEZcbxnuTVoUd002zeiunu7ugauJj
         bLRTj0lrOAaPbI67c+ItPhrQjxKLodSufIo9K1ntFjyZcXJIyNFKRQjk1E4T/ZhuVBFM
         /oDJLcjZOrG7QlvgHpDt9U/Eq3UjyMQcAv5gvmZGcHayF81ZkJYmjCyXO1mVS0KeBPJk
         s7Sq348OiEqp86HB7u11+h4Qf+aT57tznPWysKyDda32MxeZBQXznwkMM3iKwFm7MKEw
         5ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688453081; x=1691045081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJTkCoWmCbMtHWUFBdWByh/qbNj1+660uOBQdn+P8iE=;
        b=Eq87w4afCG6D4JqPa1NS/tjho2Tyjr/t8cMj8/0GwN5QqN5WPiqXA28sGeHGpW7u71
         XINRnUPnV6ywsvkyeavyfJaxmK73GfDgBhv42bIBr9rKu43xxAsSWHKCuoCyhRtlIfyH
         ux8M+MMBCeUzdxIK3IisG11HmkIhdNfhUKt4NoXvUxKn7eLcWju+ywe9uSRz7qZ8GF4A
         z73REwZ58tQQ0MAHdk7kBZrowsb8NdbUmDUBgZomjY2+ID/9kZnCw228GVNK6wfgrBnH
         GxVK69jSzkpWPHaSbgtkS3KnHPJfxNATPjtzDZgHvi06QV8Mbg5l9+2dxwzDXA8wb5h5
         rBVQ==
X-Gm-Message-State: ABy/qLYXsaPvsOwIeVYJc2dATVSbE9jKq+fa1AW17smG9EKC+DgekLkH
	lYZlIl5Wd9sRxcWCCXroMHg=
X-Google-Smtp-Source: APBJJlFQQuqe8XxyD0X1T0vHtHrvuQj7uK+jeVXFB/3LONnxxeEmErBv7/6mJZUi+mNZoJV1HAhoNg==
X-Received: by 2002:a05:6a00:2e22:b0:66e:fd84:c96d with SMTP id fc34-20020a056a002e2200b0066efd84c96dmr12862841pfb.13.1688453081022;
        Mon, 03 Jul 2023 23:44:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78382000000b00668652b020bsm14863429pfm.105.2023.07.03.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 23:44:40 -0700 (PDT)
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
Subject: [PATCH v13 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Tue,  4 Jul 2023 14:44:10 +0800
Message-Id: <20230704064412.2145181-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704064412.2145181-1-milkfafa@gmail.com>
References: <20230704064412.2145181-1-milkfafa@gmail.com>
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

Add a control base for Nuvoton NPCM driver controls, and reserve 16
controls.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5e80daa4ffe0..19d2651249fa 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -203,6 +203,12 @@ enum v4l2_colorfx {
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

