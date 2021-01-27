Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF893053E1
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:03:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZM23SVBzDqs3
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:03:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pe1IyPm8; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJV6fGRzDqWM
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:14 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id n25so969943pgb.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HVGAtWSR2VUvb17t/H+3yt+3nsKddkFuw0I0IZd+DY=;
 b=Pe1IyPm85MR0SAXfm20OYc+u+UZImxpQKPpY2HVpFmr7WY2WoHuY9s7a+Q6VrdwdT5
 WgqvczSbOw1l/jo11I2cSvxsu8Cr8MjU7nehqP75wb8da4IwNJXVa4YYArum8yUcMlcc
 5saaRNKPwpUNvPmqcT2b4wpmHEvUj5nmPGnVf4maxt8WBtc/9sZ2WHCjfYayy5HctaWh
 Sx7gzBdppX+2ctlQJm30bIGU8UePdSOG3HduTqsYUFjrmvPrOsmo1JryH+i7gdUKCmhS
 NdtpInHw3MD8c1vCVbgTmj8MzzEsCtcJEqvW1ENhVyRZf5Xvnf0AnIvoiNe3TE7xaOXi
 8wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0HVGAtWSR2VUvb17t/H+3yt+3nsKddkFuw0I0IZd+DY=;
 b=tm+bkPAWLyhBpl+r5HWKYg1NY9GJEb8Uu8oSTLjlJAJ533/hLDoTHyM78ue1+onpwU
 /chIDWI5buPfUZXZPcUUkqVMxJup5WFKJAwjwogemXiSX2BWcXgIg6Z+wGekNI6o23I+
 1YxHGkxYlrTXh1ZydZf1XaP1Son5CbxftMgUEzeHxXLsYa2VgU3wRoJE1nw+N8xpSghi
 SfSC2e0WTUZM04tiC2FYnvDxwLU+Ft9AHognEpd3NuPXBOBNUzrHYfmI2ooodmm7pkJ/
 WGfVGaq5GE1LgTWNVQMO9sc+lA6mgt15BE7WC5btedbYkfKVIOaXZq4eaAJWS2wB2RuN
 muhw==
X-Gm-Message-State: AOAM530lx6zGSAFNwi6n780H+f3tCMnruw66NMRJ+kerKb1wMA6R4g5y
 xllVVQGeDQ1yajKbSOOJviw=
X-Google-Smtp-Source: ABdhPJydbcxdyslhyZL2csXJkl4U3iHloeBzMTQ3Mqt1O3ZpuPZyLUOd+6KaxPXfV5FWNXZ0ShSEyA==
X-Received: by 2002:a62:7e46:0:b029:19e:786b:9615 with SMTP id
 z67-20020a627e460000b029019e786b9615mr9351653pfc.37.1611730871771; 
 Tue, 26 Jan 2021 23:01:11 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:10 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/6] ast2600: Modify SPL
 SRAM layout
Date: Wed, 27 Jan 2021 17:30:49 +1030
Message-Id: <20210127070054.81719-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
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

The SRAM is 89KB on the A1 and beyond:

 0x1000_0000 to 0x1000_ffff: 64KB, with parity check
 0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
 0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once

Allow the image to fill the full 64KB payload size (max that secure boot
supports) and place the stack at the top of the 24KB of SRAM.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/configs/evb_ast2600a1_spl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index 69f3c32ce1d5..a39988820add 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -25,8 +25,8 @@
 
 /* SPL */
 #define CONFIG_SPL_TEXT_BASE		0x00000000
-#define CONFIG_SPL_MAX_SIZE		0x0000E800
-#define CONFIG_SPL_STACK		0x10010000
+#define CONFIG_SPL_MAX_SIZE		0x00010000
+#define CONFIG_SPL_STACK		0x10016000
 #define CONFIG_SPL_BSS_START_ADDR	0x90000000
 #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
 
-- 
2.29.2

