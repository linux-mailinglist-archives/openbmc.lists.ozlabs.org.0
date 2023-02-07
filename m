Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE668D2BA
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 10:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9yRD0lWQz3cFw
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 20:25:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Oxed55OO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Oxed55OO;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9yK50Y8fz3cNR
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 20:20:24 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so13610986pjp.0
        for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2023 01:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6+lCjCIw+d121nhHvuoYoRysIALsYtMY+doyqH/Okk=;
        b=Oxed55OOAfqxd31PCQBLgupCqjkSIAF09L+33CcLoJhrLRXXmznaKYHlwpPlUmWz64
         V7gEHp9S2hrk8Bo9oG8op9c2Ku09LZiJHhTy4AJ4Ty/7o+y2d8s/pRfyemPZF1XIBfo9
         8Boz0KrSkmfDv03yvwq31V3JvIZE37ILVwsLi0RE5RI0zTg76y2ZclAIzvQldHce0XT0
         ltmpPAzTAf3+nyPHu0BICdHoMprzGiig9nmcizzN4MfTkHUXufVInVDYEkD9YDtLkGtY
         RT83HGJkNNInoLXFIyyJD3UhGRRpRQXgeaI68hwqctQnESyZrA9dtgtpINaUXQ4nNC/z
         9/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6+lCjCIw+d121nhHvuoYoRysIALsYtMY+doyqH/Okk=;
        b=Jt4POs+6gGWEsYb7d2I3Puv/RGiN1HBm68dLdEYu6lymar0ZM6kdtEvl8PjoYtHNJH
         kOYHhfhDmpIFYkqwf4t+XCBEw86I5IfnWIAVMX9/FuIl/oT02lhK2/eq8jMHH7/YnXbb
         rqZ78CmxfFfx4d6PSKIPwAOOMBgrHcZDWszQ6MgLeDL71vWSnNbYczODfQk6F590o+Mj
         us3r+YWx+FohSjN7OSre9kaFyzeaJ0WkZC6O0LXcuuXsPuDxFlFxozNot4qAt9ax9Pvz
         nt0gQkoVZDGmnYi93HHv2J7tauBQ68PM92Lh3W3VG3kwNwpCIwkNfHWma8QVBPmruRUN
         lLMA==
X-Gm-Message-State: AO0yUKVBJdMsG8Pm8hPhNYKSbdMRDNqi0Q5fOBAuRzLi8S7DxKgt3Lc/
	EmHcrkkbn+ZmJ0UL/szHQEg=
X-Google-Smtp-Source: AK7set/Iot/ID55E3YLaEET0LXv0VhMzH/eYVcSzaabohSHX+tlnKdFf42veGm1ng/w61Oeoq1MkJQ==
X-Received: by 2002:a17:90b:4d81:b0:22c:59f2:9006 with SMTP id oj1-20020a17090b4d8100b0022c59f29006mr3257578pjb.34.1675761622808;
        Tue, 07 Feb 2023 01:20:22 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b0019934030f46sm545327plb.132.2023.02.07.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:20:22 -0800 (PST)
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
Subject: [PATCH v11 5/7] media: v4l2-ctrls: Add user control base for Nuvoton NPCM controls
Date: Tue,  7 Feb 2023 17:19:00 +0800
Message-Id: <20230207091902.2512905-6-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207091902.2512905-1-milkfafa@gmail.com>
References: <20230207091902.2512905-1-milkfafa@gmail.com>
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

