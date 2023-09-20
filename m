Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340297A7097
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 04:34:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4VBWu64;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr2fn0341z3cbN
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 12:34:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4VBWu64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr2XW0DYWz3c3p
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 12:28:58 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c328b53aeaso57153635ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695176937; x=1695781737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=V4VBWu64qDsUQniVZQTQoMLhw95D3DIfJXUulVYd0O10nF4ZfCkddKtNpGaUwN34si
         ef/IssgEy8e248l7xp6SkR8IAKcbHAvb+1lORGgIBQsYGDa15C6qMKdvNuYXnAwtxmVb
         8K/CtXXANTEPs6iq3NyaKuu+BLUI+XbI0HVXfuY5aHEERv0aZtgx4lLvCZ4aty/5hbF0
         54lSNPlTEWHpqB0N/JZDyrCj8dSjqNQ4cak1sDYRgR/rFMQbPwOXPfdOmR3DUuhCwVxw
         qCXbobP7I2D0x5qlUPI/PIWs/HMz9gf5LKGHHnr5g1UIGHjcaRnu/+YLrw55+Rcq81kU
         vk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695176937; x=1695781737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czUvoB2YphHxinmpy35aY7rZVy/pXgKwXq7ZvtF0H2o=;
        b=RGJhuBD/iJ1wO2yW/DsdMPiO5AyTyZOJ+IVPHj+NuID+qotpVrAoGfz4aq4dHTWa2V
         uKiXQtgbqZ9Cv3wkIwpXHDiO0A5crYNMT2IN0+wK5/xcKpU7O7yAkqtywIJAdyP01wnp
         U/DB52I2q80XqMv97LoUco03LstB0ZvsCMBUvU6hkPV8ibv1J9exdpSAUE3cn0VJNhFh
         r/uvFCcysj4JCZwzkjcg31DYJPVNfif+u5f8mIkIV6qSXPuDFzTLGLAIVEmrSFjNyBJN
         NNUbbHhQoJEOwHcowAW0rXOvBD1KFF2EorcymA+inISKeabNF8sFMTfe6C7G+/OC2v4J
         PAqg==
X-Gm-Message-State: AOJu0YyIyUeE2Yk4Pxzh+bcKD9uAaqw/Z+nIqEskZIO0hRR23Ib0sIFj
	Kcyv/uRP2O63CGXFaiwLehY=
X-Google-Smtp-Source: AGHT+IEZlDmWh7PrhaDhdl49q2CMxvu8uzds0DqTSVDtgAY96SSaYFWPfAb2DTn+AFysKoEXOjzLgw==
X-Received: by 2002:a17:903:191:b0:1bf:826:9e30 with SMTP id z17-20020a170903019100b001bf08269e30mr1357501plg.16.1695176936887;
        Tue, 19 Sep 2023 19:28:56 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001bc930d4517sm10610009plh.42.2023.09.19.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 19:28:56 -0700 (PDT)
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
Subject: [PATCH v15 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Wed, 20 Sep 2023 10:28:10 +0800
Message-Id: <20230920022812.601800-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920022812.601800-1-milkfafa@gmail.com>
References: <20230920022812.601800-1-milkfafa@gmail.com>
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

