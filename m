Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3D5745F6
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 09:46:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk64j3HQDz3c5G
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 17:46:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VMaaM5ak;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VMaaM5ak;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk64H3PZHz3bdM
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 17:46:05 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso7710625pjc.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y1g53qol5McwnVRHno6dZvEGOqjXj7CP/J/IenePGq8=;
        b=VMaaM5aknGxCTga9h+m/GtT1IoHTrj8Ze7r0jFQLcXz34b3hdTiL4N0qduHNEc9Tfr
         0c8VG9MAe+xQNiKA223aVeofz5e+X+7mfXqF/fHxjMrbMMG200HBLmYHkGia9zLZTSKK
         bwhPHO2X8EthqV5Xo9QuWA7jlHiB0CmJSjouNjEdwKq2rP0pbNw9TWxppP/X2yaFx0xR
         K3qvFIbvgaHmN26/4oTqXdRVDKhpmK1w+vkY+D4fBg7PTbFpEd3XFnRUK8U5MtYeVe6U
         cweSEPyOV2+l4vF40tRMdmz435H4jC6Yv221q4BxtGdYXOzT+5hkw+pf/PHH5opM9X8w
         TuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Y1g53qol5McwnVRHno6dZvEGOqjXj7CP/J/IenePGq8=;
        b=23ZCHry6L9VT5nGbPTRadQiQBZPnik6zyWUXasnV1r0NKv8oUILe5Rd3B2aAzQqTK6
         VJxAr43WBNE3bIKdsbeKh/ZLNgKFPRdXbqU54aIjMtsdZ1nvV29dXHGWpezwvZybI37T
         POjuMXV0JHCjUSob4i7Ps2nH1plHxHbZxbbWZgd/SWvmtr8ERIDcX+ihi23z8rMNOog8
         Xv2bsOS5ug9XU1tdEMekAiWOn5HjXjd+knHyibxVrhrPJxpuSF0SsFlHrv9jGKxVKHc3
         pek6XArYwAXeap0CJrgrZ1mx7FzVZ3FkWtmelBv2nospgayFsnC/mswvEfaoUR6mdDtU
         8JZg==
X-Gm-Message-State: AJIora+8LsLCFmP+WQ/RVMln1pKgtviLZ6klnhFEWebpG0oeWuNHmx06
	ldAVk2Wp3qzb83sS8siVN6xrAp4zXuw=
X-Google-Smtp-Source: AGRyM1uxssK9Rq3JHw7Af34WOD/lJ+Yn4CFmjyaDD1/syRxSB0UJpJktw0X5p73wa6RO0j0oSlB+3w==
X-Received: by 2002:a17:902:f60b:b0:16a:2dcf:989d with SMTP id n11-20020a170902f60b00b0016a2dcf989dmr7634094plg.90.1657784761847;
        Thu, 14 Jul 2022 00:46:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090332cf00b0016bf28cc606sm729390plr.156.2022.07.14.00.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 00:46:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] otp: Reduce size of struct otpkey
Date: Thu, 14 Jul 2022 17:15:52 +0930
Message-Id: <20220714074552.818306-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Don't store more information than is used.

  Function                                     old     new   delta
  _otp_print_key                               540     580     +40
  otp_verify_boot_image                       1336    1328      -8
  a2_key_type                                  640      40    -600
  a1_key_type                                  640      40    -600
  a3_key_type                                 1024      64    -960
  a0_key_type                                 1024      64    -960
  Total: Before=279318, After=276230, chg -1.11%

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 cmd/otp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/cmd/otp.c b/cmd/otp.c
index 049c217d6048..6dd2d2bdfb17 100644
--- a/cmd/otp.c
+++ b/cmd/otp.c
@@ -133,11 +133,11 @@ struct otpstrap_status {
 };
 
 struct otpkey_type {
-	int value;
-	int key_type;
-	int order;
-	int need_id;
-	char information[110];
+	int value: 4;
+	int key_type: 4;
+	int order: 1;
+	int need_id: 1;
+	char *information;
 };
 
 struct otp_pro_sts {
-- 
2.35.1

