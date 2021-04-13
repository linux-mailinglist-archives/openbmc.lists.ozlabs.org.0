Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729F35D9A2
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJCL15jbz30J6
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:08:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=se7XjXRY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=se7XjXRY; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBh4kPhz2yxS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:12 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id e2so3476383plh.8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1rx3c+zQ9Ln8uAv2IoFdGr+tmQLrpi8JfIe3thk2Kho=;
 b=se7XjXRYsnEnMvOhyWC90QrO0/4SR22IqmB87myzX2poYM8/CCGu1lq900SUTKYGHn
 N8WgI9gaL7vaQOIv5Arm70sGB06MwCxJMF3yqSMkxX6JWFhwWpyW2+yIP4hKescoFPal
 hauxHYbAJcb4UCuqBeCZ9r7AFi6aQh3JkpnFw2iRSDfR3fKia2UBu9t+RW0qPe5U83T/
 hppF10JS+o/dw6pi0T3GjYiWvhVXG102b0ETSXJjBYDlgBg4In/vuBPhs+C9lwLkI5e4
 6RvKFp5ukQf03f3HF+KQA/HJ+nhlUKPMWdgswMq/I/q8rntFOze2EGV5rvxMm5ZC1Xue
 i7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1rx3c+zQ9Ln8uAv2IoFdGr+tmQLrpi8JfIe3thk2Kho=;
 b=ndiH/osUKoVJNx7cT9TydhLiabrHRZdsVaq3xF7FOMDVTJNhx68ikN/BvxAzJJJqkq
 gbvbVQI6PdbLWMAMg+mp8pgoCZ9BIDNDorwZABVSZyDVlAq2j9Yi4bbo7wwh6VeNz4TV
 zba0mcLMgYkcYDBuA5WuGhS3KgNco+trnlo05qWSk8BtdTKzo9qHXO1vkkKtDtGVtnfD
 6RPJPk6k1mZn6pD6nsLWfks0vbwFkvrA8r/WVRBfizH5i3Mj+dgEazBpBUwxFdVdqHAF
 AVYJVEecd7yrzDQz0dLxO0MfzgO+5hloOvQQmqI6mX1zwNDRQ7Y+eY8469v4y+XoQB7k
 HkTA==
X-Gm-Message-State: AOAM533FSgRjz5u2E7EJhXEKNyR7C5c2dR8OOj3IsWO00eS1KZaPxdU4
 6OspMCfOghETZTO44It3KrYBHGHilxk=
X-Google-Smtp-Source: ABdhPJwuM9IshGxy1p9U5ckn22HXkUN68nbb2Vz3mYqtHgfiPTBAEcGiLBCJ5K5tFNOj+7J0IkZ51g==
X-Received: by 2002:a17:90a:a00e:: with SMTP id
 q14mr1915581pjp.70.1618301289719; 
 Tue, 13 Apr 2021 01:08:09 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 01/11] aspeed: Build secboot
 only when enabled
Date: Tue, 13 Apr 2021 17:37:45 +0930
Message-Id: <20210413080755.73572-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The configuration option controls if the secboot code is used. When
there are no callers it is removed from the final u-boot binary. Instead
of relying on the linker to do this, only add it to the build system if
enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/ast2600/Makefile b/arch/arm/mach-aspeed/ast2600/Makefile
index 0abac4c233e4..aafc4b2fe37f 100644
--- a/arch/arm/mach-aspeed/ast2600/Makefile
+++ b/arch/arm/mach-aspeed/ast2600/Makefile
@@ -1,2 +1,3 @@
-obj-y   += platform.o board_common.o scu_info.o utils.o cache.o crypto.o aspeed_verify.o
+obj-y   += platform.o board_common.o scu_info.o utils.o cache.o
+obj-$(CONFIG_ASPEED_SECURE_BOOT) += crypto.o aspeed_verify.o
 obj-$(CONFIG_SPL_BUILD) += spl.o spl_boot.o
-- 
2.30.2

