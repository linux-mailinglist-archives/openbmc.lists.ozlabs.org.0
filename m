Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 721B8307422
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:52:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHNn4msXzDqB4
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 21:52:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BoA7lYeb; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHKx6zLmzDqhn
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:49:57 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id md11so3636297pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ab+RIvlfrSl7hljDLw6CIrjUIt5Hddb9nyDOy3MEBJk=;
 b=BoA7lYebhIFdtvZp+MB7XGX8YQPLNbSwz5mn6DXok06nNF5m5F1FvuK87NeOuzi9eM
 qX0eZfDQQ1hWhgNvuhEooGPEBd+153UGxt+9RKv8DxXEoK3WDGzjUVvgXWc1c7Ce5uds
 QOmSX+hm/ez+8vVuT0/QKLIAA0HMQVe9gj1cimHm+jkfNEIVeNNxUntBY6wnJqM8yIFK
 3ejPRQ4wWQyc69bfMmG5q7QYevhRvjVmTA9ra/arVzkj6t/54u6jengWMt1lCGgVYLrE
 dJSyqlEKOL33NEcCJ9jqgSD/SqgB2OG56W2Ywr2ihBPSoKPxHknwiRiG38geHwzUvtme
 VCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ab+RIvlfrSl7hljDLw6CIrjUIt5Hddb9nyDOy3MEBJk=;
 b=KZ1PAiLEvUkUH3SlQegGb+qM9iggyNGXDVTYEy7FqdUskrSOSAsQu30VHIq/e0Tmub
 odKPfl+Pi+lT2GQSnUS2RRP8uV/zxICvKz2/zStFjXRESt29oa0DQttYZdBdOribDC3M
 LXtNTFCGCpycav6WmyHzuzE89valHat6UyPwSjNscOrUtpuBeCZUrtqisF2oudcpoPPQ
 vZCjK6Aq+no/n/ZR6XMm0f99u1xt+U5G1bB7qejInrZThXSNx+CZAcTju5+hCOOFQmFG
 CTOH9psfpH8CLg07J5RDFeMjt+kSQTz6K+RCQzbkVsA/q/3MJr+0rTBWoBsDk4l7k7HJ
 ZHrA==
X-Gm-Message-State: AOAM531cn6+3S5PXxALsHEpVpG4Z30WElbVBwHk3xJ2+Z4mWvak4RBSa
 5XwdPhz8o82xco8TeFLUCJcp/YQmqwY=
X-Google-Smtp-Source: ABdhPJx2zUghHkkiAISNlIMzQghWtvR5RoYd567zW6F3NOyWYrV7Jx49QtfrSZ75HjJCdfWGxlm7og==
X-Received: by 2002:a17:902:6b88:b029:df:ff72:7bc6 with SMTP id
 p8-20020a1709026b88b02900dfff727bc6mr15500527plk.23.1611830995222; 
 Thu, 28 Jan 2021 02:49:55 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u3sm5846216pfm.144.2021.01.28.02.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:49:54 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/7] rsa: reject images with
 unknown padding
Date: Thu, 28 Jan 2021 21:19:36 +1030
Message-Id: <20210128104942.400674-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128104942.400674-1-joel@jms.id.au>
References: <20210128104942.400674-1-joel@jms.id.au>
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
Cc: Patrick Doyle <pdoyle@irobot.com>, Patrick Doyle <wpdster@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Patrick Doyle <wpdster@gmail.com>

Previously we would store NULL in info->padding and jump to an illegal
instruction if an unknown value for "padding" was specified in the
device tree.

Signed-off-by: Patrick Doyle <pdoyle@irobot.com>
(cherry picked from commit 19495dd9b6f5f4e893b56b0c73e14b2e671c3780)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-sig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/image-sig.c b/common/image-sig.c
index 4f6b4ec412c3..004fbc525b5c 100644
--- a/common/image-sig.c
+++ b/common/image-sig.c
@@ -211,7 +211,7 @@ static int fit_image_setup_verify(struct image_sign_info *info,
 	info->required_keynode = required_keynode;
 	printf("%s:%s", algo_name, info->keyname);
 
-	if (!info->checksum || !info->crypto) {
+	if (!info->checksum || !info->crypto || !info->padding) {
 		*err_msgp = "Unknown signature algorithm";
 		return -1;
 	}
-- 
2.29.2

