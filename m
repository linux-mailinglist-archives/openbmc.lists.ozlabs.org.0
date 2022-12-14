Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C764C603
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 10:33:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX9Bz5Bhrz3cDM
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 20:32:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NdoF3cNF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NdoF3cNF;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX94q1rgRz3c6p
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 20:27:39 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id f3so1589996pgc.2
        for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 01:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=NdoF3cNFvXv/M3+aBr6oTDL01XCH53BB6efW2D9TwDjttKAN2fqd9wCLBFKRra84A8
         076QSS5+5Xkj5xaxUarsRhRtVHABJncmznu2U7yewp0pYZlUZljVPRUnxYZnI6obuK3g
         ZCmexl3Z6dHEpdO9/o2XmBrO1JyHtwYi1Kh+ME7XqmY3qLukNNze0iwxNHOe9zMA2aqD
         gJlKq61sDR2PXffsV7tFOZT+2RsbzxzPJ3D+3SCpmmCwiWDIvdX29VXXCga/Z+ChheUE
         utTXUnbbIBPjlGonsBnxjcK5k+7DMC6OiMEmJedwF2A4GDcJt2t6dIVf1WuxDE/17eAC
         ygDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=oGNK/cKN79Zql6mHeZMt5h7kJ5HoAF1ERtOFKjwttIzyZWleOhTI2REBY15n4OH8Km
         UquoOup8LLM5CaSu7NIqXJGaRdPwvIhB2KiAljqTXddz9gS+IOM2LzvyuszSqFNkRTcj
         XM0UAHxVCaAHVcDzC6VvcMGVHFTyI+PjkbaIuT1TSaJgFc8oh7FPhDsPbbVhn4hjpyGT
         BahjhgxhXR1w+QbsH9NAd1pU3I4+RFrMhuuwO5V4pKJSf525Y5VhRAgIRJOz1gs3TPNH
         G8eYAb77MVxLM5OlLgN5PyhumiQPEJ6JMC/Na8ueAMqYzi+uYDR1DaM7lqdbwUj0oVEI
         ohyg==
X-Gm-Message-State: ANoB5pmMtPfKR8PhVbyaElG0Fk3M0SpecCN5yAw+2nozLbBxfxbwfouz
	oGTOsDuXcqsbX7jxke04UD+2y3WN7sdmtQ==
X-Google-Smtp-Source: AA0mqf4Ng4hlbOW8z0BGWKEyNXler717YQ1Fdr8pfObDXmNg3crKRtCmJj3s5c5PMKDUy7jCnC7gqA==
X-Received: by 2002:aa7:9297:0:b0:573:f869:2115 with SMTP id j23-20020aa79297000000b00573f8692115mr21004739pfa.9.1671010057016;
        Wed, 14 Dec 2022 01:27:37 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b00576145a9bd0sm9003312pfd.127.2022.12.14.01.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 01:27:36 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 5/7] media: v4l2-ctrls: Reserve user control base for NPCM video controls
Date: Wed, 14 Dec 2022 17:26:34 +0800
Message-Id: <20221214092636.810883-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214092636.810883-1-milkfafa@gmail.com>
References: <20221214092636.810883-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kflin@nuvoton.com, benjaminfair@google.com
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

