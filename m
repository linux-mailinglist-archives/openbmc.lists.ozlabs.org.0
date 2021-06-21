Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7D3AE355
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 08:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7g1H0MCGz307L
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 16:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CPCpuWVt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CPCpuWVt; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7g0c45qsz2yXP
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 16:41:20 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id t32so1505245pfg.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cokFbF8iLGGUzLKFETJ3io2opwV1CZ67G7LOBelM9aI=;
 b=CPCpuWVt6aAyhrQ+nNkqw3vpvLynFgXd9gcynDuMRluH7yQoWDP9kVLWraNUCg8/Gf
 Buk/XeYij5oRXKNiz2vW72fDxIVbmXnFa5/BA+stXJDNn8utsf+qjzxvvkd3lD3zs+i4
 zMyLm8y4sCSsIP3UV7Q0Do0ODKJVyXSgPV02thWy5ElmZEXx/3/Z/6TkqR66g7dC9UKF
 6oANURIS9dPnBsqG7gKuQmNsvDnAVVn1qf+f9ppIqzgGGmd2rEfE7YOJXG1/vzeE1Fp2
 lGXv081RIT5r+AnPSMUXReEmMwDjc/qkuFf/8mshWPbHWUyYwSNt/dPIn5oXms6/EDhD
 evDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cokFbF8iLGGUzLKFETJ3io2opwV1CZ67G7LOBelM9aI=;
 b=PGa0XifKTg7nX6psiDvZc2AS8zuuwZPcdVdsxkqKBPd76LaKDnmyKVbMltUisDXD/Y
 SssjAHRmikDvfYHETAUOtHnc0ED2x8Tb6wOAkprGxPzkfqy+VZ4iaez60e7BoEF6Xbte
 oJV/BD1hXf+pmVZMaPIke8PITkP60JRyXXlmUplaSpdIQ4Mj5TFDQEENZOGt6CqNOwaD
 wDlgT4W+ymdljfFWpmjF+eAQpe2O4s0gMxxXqDi2Pcu6zPpz+vvaXIVcl8SHlkflG24F
 jGF0CbKxGE8olGPT06O+gmvNDlYnOtGI755+DLlblkqRMGfruW6NtMKpiiscDkj2H4Qf
 Felg==
X-Gm-Message-State: AOAM531cZ0mlCwrGudGn6DnyyMG9ftCyO+EIUzLpd97rAqjwyAGbiK79
 0ABtltRQhS6UvZVRtwRBPazniOkhiIE=
X-Google-Smtp-Source: ABdhPJznPJCyt17gij+cbxz0OXr/vLPTQEmo69/PjhNiH/lM09rnJ7mFPw9jIxWBgpXT+YErYWILCg==
X-Received: by 2002:a05:6a00:238e:b029:2ef:839b:adc7 with SMTP id
 f14-20020a056a00238eb02902ef839badc7mr18170857pfc.54.1624257675936; 
 Sun, 20 Jun 2021 23:41:15 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d16sm7865633pjs.33.2021.06.20.23.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:41:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] Makefile: Conditionally
 add defaultenv_h to envtools target
Date: Mon, 21 Jun 2021 16:11:01 +0930
Message-Id: <20210621064102.961633-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621064102.961633-1-joel@jms.id.au>
References: <20210621064102.961633-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When building the envtools target with CONFIG_USE_DEFAULT_ENV_FILE=y,
the tools require generated/defaultenv_autogenerated.h.

 In file included from tools/env/fw_env.c:126:
 include/env_default.h:115:10: fatal error: generated/defaultenv_autogenerated.h: No such file or directory
   115 | #include "generated/defaultenv_autogenerated.h"
       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Link: https://lore.kernel.org/u-boot/20210618020559.891395-1-joel@jms.id.au/
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index be0d9ea5c5bc..e1fa881b2aa4 100644
--- a/Makefile
+++ b/Makefile
@@ -1581,6 +1581,8 @@ endif
 
 ifeq ($(CONFIG_USE_DEFAULT_ENV_FILE),y)
 prepare1: $(defaultenv_h)
+
+envtools: $(defaultenv_h)
 endif
 
 archprepare: prepare1 scripts_basic
-- 
2.32.0

