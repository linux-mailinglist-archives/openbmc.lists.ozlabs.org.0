Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A974B85AE72
	for <lists+openbmc@lfdr.de>; Mon, 19 Feb 2024 23:31:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=d6JFEHJA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdy1W4Q24z2yk7
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 09:31:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=d6JFEHJA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdhpj0414z3bsw
	for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2024 23:35:55 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d7393de183so33205415ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2024 04:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346153; x=1708950953;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDJhWgkmq4prdqrSz/AMeVpuz2xjBwxbRSxkSLXonWQ=;
        b=sIkb50QHb95aBgqw7JOOFJfUezBnUXhp80H3q0q6QC9OG56IHP7LB1RMzFhRDDr8tk
         eg5kDafXPGS4SQxQfxA/1PUxhrsLArnJ6UBQT2+M7n4m/Wx03DW1/w022b/wgLTC2pX1
         rIUbVeQxeyJhOLW3wINRtQos4SsOqd5XYDQADzouJtN7kO/xms93CfW9WIjJenLLbN46
         hCUKTD1q/EBoxxpafw9TNJZf1nwtFngmk1ww74tuU8qiOszfoyCUpThZmWH3CvFD89Ai
         xn/7UW912oVGIsKm/0fGorFzauvD1yPtMdAQqSjN7toeTB7FzpmOS8mKMxj74oIGoOSL
         wftA==
X-Gm-Message-State: AOJu0Yx0PSx21Uysc1QviheMck+aTh8771bkmFRa9YS2+uO4D2QVRtB5
	O0hfaNpboTvuIEBRZ/ftbP8KXeOY8lOIjNGulxKWuKINZvU6gPfh
X-Google-Smtp-Source: AGHT+IHQz/w6mTIal3bPMzsuUMb0nNOTFDqSmXx21186jWVoIilBbyhWzS83ykOfeYx9zBdqvtT2Kg==
X-Received: by 2002:a17:902:fc48:b0:1db:ab9e:8f90 with SMTP id me8-20020a170902fc4800b001dbab9e8f90mr8594978plb.37.1708346152677;
        Mon, 19 Feb 2024 04:35:52 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902b78200b001db45bae92dsm4212519pls.74.2024.02.19.04.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:35:52 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708346150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qDJhWgkmq4prdqrSz/AMeVpuz2xjBwxbRSxkSLXonWQ=;
	b=d6JFEHJAjRluzED4GrSpofATeV9Uu4rRE6WsQ0KPqTnrCgmQY24m/LKVvuFyv+lhWDt+bB
	HYDf6X5tnwc/QEClf3EZNYY/z+9KE+veKBYjXHBuWCaeR1V5QJroc1E24XouLzy9xqcsh2
	XRJf9aJndc1OOBtVj5gKJwz0+K/lS1LjKHRg4ekoxY/dscxUCOIYBAAw0/Lmwdwn2a4quL
	rJawMHVgy6PU4mIoYpkN5mwyl05L8IboUc/ZPJMdExlByBl56MrNvvyF8nZd/UbQzZgUyr
	/mdxQTsiK4gSyHBkdexaVx/v38mYUZCaCRDnXT1mdpq+aFvc/VZMpoUEHEDwIw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:36:35 -0300
Subject: [PATCH] peci: constify the struct device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-peci-v1-1-0727662616f7@marliere.net>
X-B4-Tracking: v=1; b=H4sIAFJL02UC/x2MQQqAIBAAvxJ7bsFMsPpKRMi21UKYKEUQ/j3pO
 DAzLySOwgmG6oXItyQ5fYGmroB25zdGWQqDVtoo3fS4FIl4poOdvwIGJkFn1s6StVa1DkoZIq/
 y/NdxyvkD2lN1PmUAAAA=
To: Iwona Winiarska <iwona.winiarska@intel.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=VY5HgFYLE2N/2C3h1whk/HJkl0Tv0K861rCXBGqg1Tw=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00tThQtl+cf7zlbbfl7NfHTibMvuI0pFpsfQm
 jH/MmQVwK+JAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNLUwAKCRDJC4p8Y4ZY
 ps7gD/0b4f3KZtx/eVFL+cOv1ECpO0uiztm726rM2dH/UXVDVE1O5aXv4ZpetIsV5l0YGFC2zrr
 Ww3b7Wwg+feYkHVGEsnLiuI/f+xp4mFcApIaMtuXYjrFA2gi7+rA5wygDE6/Qd1BdTQn2cMw8y6
 2GvJHjWcxXPmvX/aBybBM+26bVTvAh8O49QXemhjYalzjyfHP0WkpHvhMbvzDur+Oj5yVp7HB0i
 1EvMhYVrsCoecTWZlvVQ1pgX8PJKliOMK+6/Y3iXf6t7G+2bScyShcV8weFfymm57NDg552uLGg
 ahvdLgT9KfW85YPqsXfOXqAzWKLaVKB+iGdx8jiWogSw6TAsz6IlkRUm/bU93+cXX8Rwt7U+YJ4
 iYkKQQlt2j6De11kRhK3ao2zYsX+NhTNMrkUGvnkZwJRTWS7POo6REIbZpTMivGoTeScn1VYnlf
 /R9PBSxtIXg85yPh8P6EP/Tvl/spZLPHes2Ii+tpehGl53t7drDT7o65atCGbX2qpdmbjdvAoTQ
 AyZpPettpgzyHgvoTK77ViSzY4Mw1djz3vP1IwiBuNLVkyt1DoHT9yWCa2VfKKKVOvDTUtqiywa
 wzrJPY0Ssj6b5/fir4yBWpovGPwpINGQg/+K1p70cTGTyeOQtnjcppG0lMjY3ss7jy+juPD1g6W
 xcxtN0w7ZBIk9hQ==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Tue, 20 Feb 2024 09:27:24 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <ricardo@marliere.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
peci_controller_type and peci_device_type variables to be constant
structures as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/peci/core.c     | 2 +-
 drivers/peci/device.c   | 2 +-
 drivers/peci/internal.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 0f83a9c6093b..ab22d7d1948f 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -25,7 +25,7 @@ static void peci_controller_dev_release(struct device *dev)
 	kfree(controller);
 }
 
-struct device_type peci_controller_type = {
+const struct device_type peci_controller_type = {
 	.release	= peci_controller_dev_release,
 };
 
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index e6b0bffb14f4..ee01f03c29b7 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -246,7 +246,7 @@ static void peci_device_release(struct device *dev)
 	kfree(device);
 }
 
-struct device_type peci_device_type = {
+const struct device_type peci_device_type = {
 	.groups		= peci_device_groups,
 	.release	= peci_device_release,
 };
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 9d75ea54504c..fddae86bf13c 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -75,7 +75,7 @@ struct peci_device_id {
 	u8 model;
 };
 
-extern struct device_type peci_device_type;
+extern const struct device_type peci_device_type;
 extern const struct attribute_group *peci_device_groups[];
 
 int peci_device_create(struct peci_controller *controller, u8 addr);
@@ -129,7 +129,7 @@ void peci_driver_unregister(struct peci_driver *driver);
 #define module_peci_driver(__peci_driver) \
 	module_driver(__peci_driver, peci_driver_register, peci_driver_unregister)
 
-extern struct device_type peci_controller_type;
+extern const struct device_type peci_controller_type;
 
 int peci_controller_scan_devices(struct peci_controller *controller);
 

---
base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
change-id: 20240219-device_cleanup-peci-a4f87c77703a

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

