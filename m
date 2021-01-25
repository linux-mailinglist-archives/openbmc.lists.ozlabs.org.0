Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D0302188
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 06:01:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPHl83rjbzDqDF
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 16:01:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RvpcUj2d; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPHhV3f5YzDqk8
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 15:59:06 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id g15so7864138pjd.2
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2021 20:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6hAdmqqYoYF3i5KU3rzF00xA70QkJZQpVxhJgwalli4=;
 b=RvpcUj2dtpy+THpca77TWTbWDUmShi7XxQAilj1CceO3cmfh96lcwB9iZwTfsKudc+
 McBGcYuCDZxJOEmvVFtZzalI4+UbZVklEx2ndmP3GsignC3BIXmkdyELoBzlxvGK7UJK
 DVxvoXkVL4xhfCQmXIg4KFgGLBVW+61ftfYscvSmsMJa/tLgxRWB7Ywf2m8Wnl1lXoj7
 354hZiuU9J9xgapTm1OKknr25EXHCJBjeLmydm6gxOFWQznVyuNl0M8ECBQZmomYIlRA
 ZOGkZIK5KbEOPRjejcNNioPoiZEH1P7+n3xUo8JslEhWOhRLZd0LsR2OLorNng54sq9n
 YNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6hAdmqqYoYF3i5KU3rzF00xA70QkJZQpVxhJgwalli4=;
 b=YbkQ0kSf0/5ef8n4KDy8Y9AVhTWsxvCBSIIKdsmhSaMgYRSxP/bQtvdFGwIgWMnSW+
 6u8SDRTt4ONrGQRHpRae1c3S9edK3JQ/ay23UxZqcwJXEHKcQD4GzLWKOJ59/d8G4UNZ
 oAh1YntbORSwdM5HCYmqokz2IA/2qkjNyDvmoBC33JvRZ4ukm+aF1xelVu8v/HPqzodV
 jnbTw+9GDsPj9IAzpaK4eKyFGW2DcsymbfORDDRQL+vk8SDcZ41zA4OFu4RaJv657/4t
 /+ufsggE4ehu4Uuue8YsSVBAiJ7miOU1xVY16oKjtMeMosUg8biAfVz7J6+L0S42IsVw
 95tg==
X-Gm-Message-State: AOAM533iaMZ6lscFodpO6kBAcdBfDVEYwO3a/lzrsFmldPojC9gq2dgr
 lHDkUL67rTBlnMzJ8qSa4DwTS5IY6i8=
X-Google-Smtp-Source: ABdhPJyOS1x0DRnspOZ25YTZ1jmZkNAW3HOGSCu2nFMzfCxbOipbi6LF1YN3qLmOUHttC4ldfmzsow==
X-Received: by 2002:a17:90a:f309:: with SMTP id
 ca9mr20011253pjb.11.1611550742527; 
 Sun, 24 Jan 2021 20:59:02 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gx21sm17525048pjb.31.2021.01.24.20.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:59:01 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ast2600: Modify SPL SRAM
 layout
Date: Mon, 25 Jan 2021 15:28:45 +1030
Message-Id: <20210125045846.448399-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125045846.448399-1-joel@jms.id.au>
References: <20210125045846.448399-1-joel@jms.id.au>
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
supports) and plcae the stack at the top of the 24KB of SRAM.

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

