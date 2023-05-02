Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E246F3F98
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 10:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9YgP6CXxz3cfB
	for <lists+openbmc@lfdr.de>; Tue,  2 May 2023 18:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WMsQrSWf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WMsQrSWf;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9YYZ4NxFz3cKv
	for <openbmc@lists.ozlabs.org>; Tue,  2 May 2023 18:45:06 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso2652112b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 02 May 2023 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683017104; x=1685609104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJTkCoWmCbMtHWUFBdWByh/qbNj1+660uOBQdn+P8iE=;
        b=WMsQrSWfdIDHG5GT83wqCYp1SIlvdJ1jugJs99R2rCBZ3KSE9tIjCyXdXeXgwwEVBT
         PDfP9R/fp7KTS1feDOAv5EogFWy4oBrwsFsai0IMlv+/OHPJYkjsmN+KhOWGnQVcZSl8
         rO//3TbuB69ovYGxJQ2k93UkgXzWLl5BlyNB5eR1NJBr9BIOLdRKZI3GihgN6AfwSPX2
         mRu8zi0RCZYz0kt+7A1c6DGKB1omolPmE9tfYzDfLZ73MMN+2aWYnmds3cvePr+9KRzI
         tZfyzS1vpFmPVtRk6ytJybSzYMla1b6fUjfZqNBmNO1r7R1teQQtmIHf3+/OEFJJBUIF
         +AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683017104; x=1685609104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJTkCoWmCbMtHWUFBdWByh/qbNj1+660uOBQdn+P8iE=;
        b=YY9OyhiyM+XL8++0/lRt7xAZQ6tLGdQpcwfJ8/qo4XSKQl91XChMl4Hmq/4Xw6uV4r
         1/GywmJLv9z5Q/Gyyqwc5MR1rSGUM8JZGXh6k3BXBsiIxX0jvricv8hv2jFpr7pOx+pK
         XxHD8w08fdSHKIZRl3zWcAThLWehER3vnsl3JJLiL8tyR/7AUflUJggk11yHS/AdN29S
         6CmVTmEuyC0CuXVbVfmfgTcnxNW7Nm0/BbIfFJyBfPrQL60aFrVm2p3itO9fzw3W4ynh
         WMSxv5Tu2a+BKOLfl5y+4nqfYxtTQ5rHTI/tIZZ8N/3cjO2nUwQX/H36xC3dG7PuQ6GX
         wHJA==
X-Gm-Message-State: AC+VfDygLqrCfsexoBQiMk6ubOpZ46e+8+Dlznxn2tMXemp/7C2wWudq
	UWg8puGNRWFlfM1S+7Ic2K7U7qECW2ff2w==
X-Google-Smtp-Source: ACHHUZ6yS1veqvlhL0A4B/EOJ7hwQuu71Hi+5QNofB5Zx/eN+ESCf+6IsczFIzdCUxQFduyPspqniQ==
X-Received: by 2002:a05:6a21:6d84:b0:d6:80a4:f0b6 with SMTP id wl4-20020a056a216d8400b000d680a4f0b6mr21779423pzb.6.1683017104177;
        Tue, 02 May 2023 01:45:04 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a520a00b0023fcece8067sm7059039pjh.2.2023.05.02.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 01:45:03 -0700 (PDT)
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
Subject: [PATCH v12 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Tue,  2 May 2023 16:44:28 +0800
Message-Id: <20230502084430.234182-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502084430.234182-1-milkfafa@gmail.com>
References: <20230502084430.234182-1-milkfafa@gmail.com>
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

