Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BE307460
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 12:06:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHjT0dKRzDqBL
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 22:06:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iz7sr5CJ; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHQK6RKCzDqSf
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:45 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id o16so4049068pgg.5
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XNXjOS+RhXn1WwOlVyDSdQVxGXNK6doUSivvRrwQqmc=;
 b=iz7sr5CJOD4m/wUsww++k/P0ZnqkAx6XtO9M4ZJN8WVyXhUdIsmqt6S56Hi2mJY5eW
 xrZR79GLoUwG7dPdMRimzazfikJUC5T2Qrc1waAZYNLJ/7BytkbUHhVBLVxbP2fHS2Yr
 lfAxMnue65r1UznnxsstQj3zVOsUeKatO48w72fgyu/O96cO3BNAWMtUkhrhcK64HyTD
 chNINtdax7sRPS29ibLcEjI6Mp/4V0PY545kBxPAryvyddKTjom8PgErobqXPNBoktwW
 8ziMjmwZC3mpjHU1emq0gwQ/6xnCZdkyhghejGls0oaMlDepv9yjDfO4QwXv7PLB6WIq
 dnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XNXjOS+RhXn1WwOlVyDSdQVxGXNK6doUSivvRrwQqmc=;
 b=AdAV2/M1fREy5UnLkuU6xbie1Bhx5YjYBd5xRGHpNXsl8Np0baSectTBFbDbKtfS+5
 2wYsvNUZFKX4OiIHLyETyeegApb9MymUycYZgILuTwcyAEyOM3HADUXX32O2WjVoUayo
 URhV39KZQdzZMUPsoqMuzpexO8UotumEuhxuIzgWL3idWIBk9agyq7e4st3Db9f6tX1M
 iRSfe8ScVtp+EMo+iDpcYimCza3ZuJKAqO4AFk3l3z90AMw4zn3ALpbb/21NKu5o1TJA
 E8QNC3zjezzEJm04EzqtWHXkkNK8n7q1KkUArNcFmZXUHpQZw6sPeQ0zAl0MIS4dw7r+
 UUWQ==
X-Gm-Message-State: AOAM531a8786HfoYCVSplUs4xMIZKFEUe8Wz6GaBgcQV5xu49ApeSGxR
 YUYnxo7IoF916tcv4NOaC8U2NTDUCmE=
X-Google-Smtp-Source: ABdhPJz3JaNb9NgORUOEFIsWG93FVafVD3BjsIF0D8yEJuS/3WXb3s+I42JMYfwKpnfLODdyM1PnsA==
X-Received: by 2002:a63:1456:: with SMTP id 22mr15905763pgu.386.1611831223440; 
 Thu, 28 Jan 2021 02:53:43 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:42 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 7/7] image-fit:
 fit_check_format check for valid FDT
Date: Thu, 28 Jan 2021 21:23:04 +1030
Message-Id: <20210128105304.401058-8-joel@jms.id.au>
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

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

fit_check_format() must check that the buffer contains a flattened device
tree before calling any device tree library functions.

Failure to do may cause segmentation faults.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
(cherry picked from commit ea1a9ec5f430359720d9a0621ed1acfbba6a142a)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-fit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/common/image-fit.c b/common/image-fit.c
index be4d9dc9c3b1..e64949dfa73d 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1473,6 +1473,12 @@ int fit_image_check_comp(const void *fit, int noffset, uint8_t comp)
  */
 int fit_check_format(const void *fit)
 {
+	/* A FIT image must be a valid FDT */
+	if (fdt_check_header(fit)) {
+		debug("Wrong FIT format: not a flattened device tree\n");
+		return 0;
+	}
+
 	/* mandatory / node 'description' property */
 	if (fdt_getprop(fit, 0, FIT_DESC_PROP, NULL) == NULL) {
 		debug("Wrong FIT format: no description\n");
-- 
2.29.2

