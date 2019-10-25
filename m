Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C12CE40D6
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:08:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmFB1c1bzDqNG
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:07:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tP0J3PH3"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8n6ccgzDqg9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:08 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f19so358527pgn.13
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SZyDETyQz9XATFcjY6UWXc/6c+7mCj6WxtyTA0bAYRM=;
 b=tP0J3PH3bng2rzq9d8iuyA+ZqX7EXiLcXEkZYgLp8ahLGxaFFUJwNQtaC381aF+oQs
 bKQByPFGr0o1AUJsEgRcBVbPBDyvIUHfazuGMbj79Whh6VC63F4I7P31PKrwvr6bjb3G
 t20j5tKeGBAcIwkoL1/ttLXAAlEyAbf8H3wIAy2BUqqClhE/v6l5yQT9UaKVpBOyj/Si
 K+8jQMH2hMmdSoJC+MtqcxCnAkD5XagmRixJ8UMeKI6Afko06WhXRqYcudzHuXrw1bIQ
 ZnmwLeKEcOKJvvps75O+NIi7yEMNKvVxh/kKK4lQi2FvaRmzIjQAIFSdQ7ibj9VrFtYG
 nkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SZyDETyQz9XATFcjY6UWXc/6c+7mCj6WxtyTA0bAYRM=;
 b=f0I+yxJNmKrTNTeqeHXJcu6feqDsgoXNcjpsb4QDfYIACUPlKvzDirZ/ZNw/fG9Tx2
 hvH/f/K7WYx0/s4kX4FjR+RkwNWueU3CefzzIBN1KlomFAPHNh/RwQ/aogdBkTdOhtGa
 6gD1oVQTtYo6y3zyZE56zaxvj0kuFqmCITg+Z2orfn5C5wkZqjhyCfjGrStvdYQhY/z8
 ShZcYfl5jW78vtV8NfT+H85zoCkfSzV5qLki7xZZo+KZTijbaIe84SGn+sdj/SSbVT8X
 5KFSy75/U8i7mCI7R1K2iidmaowQLwN5VvRDBsfF8aiKh55jjBLwKtxYhtVNeHO2wdyc
 GvSw==
X-Gm-Message-State: APjAAAUTY6HtgL/tulByMaNdHsK1nYSkXxRNiOhh2/AZ1iQOH7PQP4m/
 FDiLb98trDi6ulr/buvY23wwIAlZ2Jo=
X-Google-Smtp-Source: APXvYqw32FKSgmrIxO7p0E3xQvNIqQm+XXjUt6UJ8oZGn/6b/VDS13f8aYjTYUmUUSsCQ1jOu5uJew==
X-Received: by 2002:a62:685:: with SMTP id 127mr966558pfg.227.1571965447051;
 Thu, 24 Oct 2019 18:04:07 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:06 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 3/7] fsi: aspeed: Enable relative addressing
Date: Fri, 25 Oct 2019 12:03:47 +1100
Message-Id: <20191025010351.30298-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025010351.30298-1-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index bef7690a0ddf..d2c01956663f 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -42,6 +42,7 @@
 /* MMODE: Mode control */
 #define FSI_MMODE_EIP		0x80000000	/* Enable interrupt polling */
 #define FSI_MMODE_ECRC		0x40000000	/* Enable error recovery */
+#define FSI_MMODE_RELA		0x20000000	/* Enable relative address commands */
 #define FSI_MMODE_EPC		0x10000000	/* Enable parity checking */
 #define FSI_MMODE_P8_TO_LSB	0x00000010	/* Timeout value LSB */
 						/*   MSB=1, LSB=0 is 0.8 ms */
@@ -442,7 +443,7 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
 	opb_write(aspeed->base, ctrl_base + FSI_MECTRL, reg, 4);
 
-	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC
+	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
 			| fsi_mmode_crs0(DEFAULT_DIVISOR)
 			| fsi_mmode_crs1(DEFAULT_DIVISOR)
 			| FSI_MMODE_P8_TO_LSB);
-- 
2.23.0

