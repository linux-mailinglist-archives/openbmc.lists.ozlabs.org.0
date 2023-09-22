Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5A77AA915
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 08:29:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nSxvzYo6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsMnT2F34z3bd6
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 16:29:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nSxvzYo6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsMgS07qVz3c2k
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 16:24:35 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2749c756bcaso1323506a91.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695363873; x=1695968673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=nSxvzYo6KX96mYQR4PyXN5j8Gyy1v1tHNR9khpH4hVi9SEr067O5hhLUErzNRTvdNf
         Naa+y9kGVSA0EtUuxrHtaYSBtqRsiV6oDDYVTZDK/ZSbvtVbKm9ekawNXTGnWPpzgPKV
         Xx4+wTN8ydaRuaT3k3U4sSPaQ2tNwR3ksFMutKj5GMVf6mXN+Y01Vg2+JOa0rsSzybbs
         egQTdFHVVmnoHBb9b0jHb2rujt6moOPtzK0pooGpOqzzT4Z9GnO+xKVvreVa/YvfEu/q
         iON4xdz0eEwKhxcsZ0AmPIhsiYEo8xT9AWtDokRy6Gd63+/OmjRVPoWT6LCqtuqjrIAp
         grxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695363873; x=1695968673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=UX/1V1szB80v263nep1r/bYIUHpMT8zDUSXayZreClXwOZDbsUnbIFjpqar10SMiv4
         eVLYjLDE4cmE8IzK87jTC5/MrsGpgCstlitEo1YKHZkq1RVTq7zLDo6JwRk6yw3SG3d5
         7FA+p97NYLoCCRKp5MlCysAF618QWaNsqYOw+aAVKnMGtH9DtAZfQuvFbHJmJucSmY4O
         zqX4wqUB4tXWV+8DbStidmQ6z5VEvoqaq2PHBgUQWVPEbU+CKd1kF9hV3tSEhvybfcNr
         3GjmhZ1wK6ymuSem7fwuI4MaSYg7yfMWMFLCXCkK1gARTFSb0i6N/J20xpMfYuQET23f
         W6AA==
X-Gm-Message-State: AOJu0Yxp+PjG3Zn85yfzvJv0T2uTTseL69pBnbWSt0sEubHrgjWUHfod
	a9znqi5G7zpip+NTfzgNwAk=
X-Google-Smtp-Source: AGHT+IFo/dMHrKhrXzrmuTbA2nbaz+4CumVSEQs5uTcJpaZheSgUBnAikJtCr6iNfGXaL4eFNV+iMQ==
X-Received: by 2002:a17:90a:f687:b0:274:74ee:eda5 with SMTP id cl7-20020a17090af68700b0027474eeeda5mr7615562pjb.4.1695363873229;
        Thu, 21 Sep 2023 23:24:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090ade0b00b00274de7c8aacsm4157417pjv.45.2023.09.21.23.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:24:32 -0700 (PDT)
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
Subject: [PATCH v16 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Fri, 22 Sep 2023 14:24:03 +0800
Message-Id: <20230922062405.2571850-6-milkfafa@gmail.com>
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

