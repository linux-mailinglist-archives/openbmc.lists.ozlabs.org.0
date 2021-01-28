Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADCC307437
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:57:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHVZ0Bc4zDr3D
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:57:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m5tdSlRc; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHPv1ZNfzDrBB
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:22 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t29so3733910pfg.11
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LCVsByA/OFDH4gjalH02a3QkvbDlFZgwKxZY22+/UTM=;
 b=m5tdSlRc+TQlYKBsdUwoo6fVRDJ23M+JfXGc7wkPm8ZCReR2lSFXoib8LJDGWEbjCB
 HdQ1enkY99PerxSNs0jI+O2R/cFJWB6UJ8Zqp0Lh2H0QOdtQhFgDBPwAqJhATfW2lYI4
 1EpPDq8NS8YBpByOPmcRTc1JhizDmaIJtCSRIY2w9LgHs3UOttAyMe0TqFbkfQi/1dY6
 L7dqh+UIq9u723vWAnHbDKdIS6dvB5OTnYCvKaKGRSZuB86n+wPeoQRWiUlv7p/yniPz
 MUw0HflIbhjYpeRTI71RVl6GDurScYDz4ui9juTolmodHDfUAmPm+mt67kvosaUN+EGZ
 WhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LCVsByA/OFDH4gjalH02a3QkvbDlFZgwKxZY22+/UTM=;
 b=UiVgzUezXzW9QbRbX4X/0ElRGheqxlKqMs0sCU/+aZDNUOkf/R/9l8zK9iFj0ULRnm
 A5mTy5sJMZSHLyuq3a4oI5bRTAx0sWJgd7Ag0necYRX5auuE4z8cnANuKXwT3guIhEEO
 UKP1bY6w3f7Cd06tFsxJAARyKdn3EbdgT80DiTIF5HUrDrmseENa7kNRqilaj08sCDeF
 mPlkQUmMgxnJruMIM4K2U4lSkHz5tP84riBgx+E9GytwrAPiaw+x1Ug76xBg86A7NpK3
 1dsTFfcMFB74AN2S14/sl846QFp8rFiPVl6WYZmj1acDBhnNXeDLdjP4OEEizQa/JJXf
 X03A==
X-Gm-Message-State: AOAM533DVeXLXEcG4XuAWdEgdgdDRlbG4JWl/pKcAbHpUqOvWiABo0eb
 z6LP/Z5CRtfUhvC77rfO4WCFT4NYONs=
X-Google-Smtp-Source: ABdhPJyfPx9BBOaJIoVvw8Z/Z3eRC8XNTSECH4V02YLoUqDodAk+EDf38vdjdTz2LEIh9WF5fo6sVA==
X-Received: by 2002:a63:fd04:: with SMTP id d4mr16132074pgh.232.1611831200535; 
 Thu, 28 Jan 2021 02:53:20 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/7] image: Be a little more
 verbose when checking signatures
Date: Thu, 28 Jan 2021 21:22:59 +1030
Message-Id: <20210128105304.401058-3-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
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

From: Simon Glass <sjg@chromium.org>

It is useful to be a little more specific about what is being checked.
Update a few messages to help with this.

Signed-off-by: Simon Glass <sjg@chromium.org>
(cherry picked from commit 382cf62039f775a1aec771645e3cbc32e1e2f0e3)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-fit.c | 2 +-
 tools/image-host.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/common/image-fit.c b/common/image-fit.c
index 95b5723f322e..c40169331c16 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1870,7 +1870,7 @@ int fit_image_load(bootm_headers_t *images, ulong addr,
 		fit_uname = fit_get_name(fit, noffset, NULL);
 	}
 	if (noffset < 0) {
-		puts("Could not find subimage node\n");
+		printf("Could not find subimage node type '%s'\n", prop_name);
 		bootstage_error(bootstage_id + BOOTSTAGE_SUB_SUBNODE);
 		return -ENOENT;
 	}
diff --git a/tools/image-host.c b/tools/image-host.c
index 88b329502ca3..8e94ee8f3e31 100644
--- a/tools/image-host.c
+++ b/tools/image-host.c
@@ -743,7 +743,8 @@ int fit_check_sign(const void *fit, const void *key)
 	if (!cfg_noffset)
 		return -1;
 
-	printf("Verifying Hash Integrity ... ");
+	printf("Verifying Hash Integrity for node '%s'... ",
+	       fdt_get_name(fit, cfg_noffset, NULL));
 	ret = fit_config_verify(fit, cfg_noffset);
 	if (ret)
 		return ret;
-- 
2.29.2

