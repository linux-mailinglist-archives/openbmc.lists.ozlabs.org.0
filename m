Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323236337D3
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 10:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGdZr6jDpz3cMk
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 20:03:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CC1vrTs0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CC1vrTs0;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGdSk1fb8z3cHX
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 19:57:58 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id y4so13021307plb.2
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 00:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97ilrjfj8pUFRe5S094ixQpLdDuhbA3k3+0nRBAN5U0=;
        b=CC1vrTs0jqiiMpEXcZ4i5eqqQB/tYQhbhlWJMF46zAmUtEkk8/b35yKEXFEBJfd3sQ
         zvIUwypclkY4g16aIetRdZtJimuO9mSmV7T3JtPRzfqwk+Z5YBJEqfVdAaoGJZOa4qWY
         INOJBrcMdUf8Gsw3AnW2pZIeURTyBbkQoEYJNMovMBDiw/s5fuW+GHM3kXlKKgvJZpNT
         D8XpYfVLLODmInZXcfL35aRHBhwK2V4g1eyz358UD5GrbyrKAbajBz5sZXfXBGEfWLvT
         H8lhNXlLDsAgJzKydLJftSmDJohWrQqHR8pCQHW6D5Fe5frHFwLhc1HKCD7gTc7b4yv+
         QKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97ilrjfj8pUFRe5S094ixQpLdDuhbA3k3+0nRBAN5U0=;
        b=fVTN7WtXmRm1UGY2dcgurDz0/scZwVDac1kDOxhiqA5OnQEsrlx5V8QbkQNU9SFTmI
         96Nn/ZmB19jJ1W6JHDpAOcuCsNF7veETeVg3ccWZ7dPRGX2xFAkNrslBznT9nhx8rhs9
         VaH9aazo8YAIPu+MTsZ9Sdx79nCtBxWQsNEGaLojpPZO6WiJOE6thf7hny1LyBLiAwto
         0mCtZFaOEOyrLlO4SLKLKyKiGqc0GhIiEA7B1VB6fJLIT/jGYsom7fZar22+/PiZsxy7
         1O6aQD/RqWWdpIAtgfCPK3KdlYC5IhsvGW1eFANhXTaWPgZzd8oG6pJvvOR0aPsCO2TW
         Cecw==
X-Gm-Message-State: ANoB5pnrW1hBFMIO/jfQVP5IqFfbZK5DsHuBS92RKgUQ04/i1sOvKDaC
	rjQaJ0Q2zo18/coTgLx/2lg=
X-Google-Smtp-Source: AA0mqf4wz0jzAquNQgvEp2rOnBEUe5yNnzaalWrc4n3aFVS+kHpIjryTUmQTZd3zxnXs57BE1XoucQ==
X-Received: by 2002:a17:90a:5d0e:b0:202:c5cc:15bd with SMTP id s14-20020a17090a5d0e00b00202c5cc15bdmr30633786pji.235.1669107477704;
        Tue, 22 Nov 2022 00:57:57 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b0017a0668befasm11400246ple.124.2022.11.22.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:57:57 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 5/7] media: v4l2-ctrls: Reserve user control base for NPCM video controls
Date: Tue, 22 Nov 2022 16:57:22 +0800
Message-Id: <20221122085724.3245078-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122085724.3245078-1-milkfafa@gmail.com>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a control base and reserve 16 controls for Nuvoton NPCM video
controls.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b5e7d082b8ad..9623ba378295 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -231,6 +231,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
 
+/*
+ * The base for Nuvoton NPCM driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NPCM_BASE			(V4L2_CID_USER_BASE + 0x11a0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.34.1

