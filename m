Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95278A8E2
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 11:25:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KtfxJlLq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ4sK1qT0z3bw8
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 19:25:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KtfxJlLq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ4lL3s1gz3bTC
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 19:19:58 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf3a2f4528so23129855ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 02:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693214397; x=1693819197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=KtfxJlLq2da8xTFKGL07onU+phdbVJYfopLOIgC1oCiWeIMNZc/srqIeIF/c5KnnWN
         rBeynEHATH1W1+jov/WZcLbDfWNMqKsW4T7qMdMk+bfaj4AszqCRb+dCaAb0BA2uMHDb
         iHAzt3vtP3NDbKZl5QZ9evKvcpgDdUwh1pQGSdWWbGtEzWOFn38yaOI7ka77eoxN1J95
         cXYXH1iSkKhwrdQkT5lifIcsKQt3zh6CVxU0ITRVQJJsXaXczIn+eR/FUTNsqq2QXcGO
         8sAyFaFrUvfnXIFMg0xCYKIXoJRPj2WqO7KRYTIX6+kiE4nijtBxBkVQZted0xKL++el
         b5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693214397; x=1693819197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=bw6P2DmBq5w6iaYxuHCTBkDyEJ7fKRY04YS3CIY1tofnsdpK4knfl7mk/ikCorKLX8
         FjvG7XFDGvbwJiBU0CW80X72QkIayZpPG8xAGJkoTEukbjrxeZors8XqKPWWftO2hZkh
         BVFKI2Ad18azStMLCguZBzLLn5PjxHIZKf/IdfVPi/mbyC2MfZtkFlpWDeqlXPZZlnTc
         m/PeVzTNMy5Ss+/bbRLXBJN1VNjQhcfSg5snUTPAN8jcspvnV8P1Uzj+K+2Pc5q3k+bG
         +xCX58inGK6b1Qu4vOxAQ9J7bDU/n4uldw7NSVY9yvlCrbhjP1FWHkyk6MRyIyYNlWZf
         LFBw==
X-Gm-Message-State: AOJu0YybYjPl32CzFN9jP5KYm0wfwht4AeCy2iZwzfmZ4RVpNFSISeH9
	arxTqZInDbpXrKfLkytVUec=
X-Google-Smtp-Source: AGHT+IHY36XFt0VstHzp1KS4I2+sBZqCcWlOjpWKoh/gOkIqxF3dcxCclfcnddEDA8S8+CBpzqDr6Q==
X-Received: by 2002:a17:902:8f97:b0:1b8:400a:48f2 with SMTP id z23-20020a1709028f9700b001b8400a48f2mr26168545plo.62.1693214396894;
        Mon, 28 Aug 2023 02:19:56 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b001bf8779e051sm6749403plg.289.2023.08.28.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 02:19:56 -0700 (PDT)
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
Subject: [PATCH v14 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Mon, 28 Aug 2023 17:18:57 +0800
Message-Id: <20230828091859.3889817-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828091859.3889817-1-milkfafa@gmail.com>
References: <20230828091859.3889817-1-milkfafa@gmail.com>
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
index c3604a0a3e30..68db66d4aae8 100644
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

