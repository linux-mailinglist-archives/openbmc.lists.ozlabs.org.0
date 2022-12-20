Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4CA651DF3
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 10:48:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbsGR3ZGMz3cf4
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 20:48:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pr5onYIp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pr5onYIp;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbs6Y22v8z3fFZ
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 20:41:57 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id f9so7971154pgf.7
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 01:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=pr5onYIpgIwqxyD1wGQPdnZ1iGEXKVapyWpDEbM01PRH1XCZBF6M9gt9A2zgqNw+Rz
         7lQSoynKI5RzwiW3YL8T4e11U0t8ng2R2brQYM8d/MKxt4Gw2B9xaG1LpEf763qmz21Z
         +XpQDbWcAA3CgcbAeqgPZ0UmZcfPQ3K7rAoOM5nk8hOoo0c3abWUvuuKI82LrXD0jr6H
         h2TbnnHbQtMauIdEmsncd78226zA02iG78V2qnuzyck61lQxducp7bI+Ckt2j2L+JnYO
         kT1aidxZVuucSA+k6sjhNsb6U3XI3bnaZP6Rz5bzF4YnSS4+/HfiNpes9OHOI9pVijCV
         sR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLpWFlG8mxCCWcewzRCKKTz15AMme8ZuJhE5IEg3io0=;
        b=s48IUgh/ChIuBB/p85itrwDl6u35NpmdEyyenvgP6d63MM/yxkl8swc3nth82j9gHm
         IjLfDsUQmDmPgam8gDonUA5iS2bEtsq1CU9k8SoiiiN1ci5l/fZML60sxVnALg2+56Wx
         CU9PxbNXK9bLqCx1t3rQRVZHlAvCI8TNrsRvzzp6T3QeXaDhiUOll+5EtF/dAXa4POY8
         hKXEu2pIa3FetCuBXONIAp21QthhverTijTLbwnUuQOajLKrXg9Up8QJuA4C5o57h+47
         IIRfbdxl4q6UnN6nFnxs/1hkC0nd9ISACjCAFQkePiYcwcsltx5aIkFT7rIjL9u0o+TS
         vjaQ==
X-Gm-Message-State: ANoB5pl7C8QaQDSDZlxO3EhTaobURgj6rpuIRlgoRus5sQG40wCmDzzQ
	39EdbZfVh871hhPZc2tt2PI=
X-Google-Smtp-Source: AA0mqf5Z46defw4uXeAOP4+3taG47dB6NazuRKQBQrvkUMs8BDqxqrCwwynxHZN5UYX91iJ2vGMSQw==
X-Received: by 2002:a62:33c4:0:b0:56c:7216:fbc6 with SMTP id z187-20020a6233c4000000b0056c7216fbc6mr40481807pfz.30.1671529315156;
        Tue, 20 Dec 2022 01:41:55 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm8210230pfb.63.2022.12.20.01.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 01:41:54 -0800 (PST)
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
Subject: [PATCH v9 5/7] media: v4l2-ctrls: Reserve user control base for NPCM video controls
Date: Tue, 20 Dec 2022 17:40:53 +0800
Message-Id: <20221220094055.3011916-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220094055.3011916-1-milkfafa@gmail.com>
References: <20221220094055.3011916-1-milkfafa@gmail.com>
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

