Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D59E40D5
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:06:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmCs4Q4rzDqnF
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:06:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AnYzQJbW"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8k6Mh4zDqg9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:06 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q7so388054pfh.8
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmbTxMVNmqYtjZO4QqW8Gui6ZrBzqGCcDHtGz8UUhzE=;
 b=AnYzQJbW1sLhr6ij1TuLT82482MXx/JmxBfB+DlELyv3oi+QyKg/Zgyqyhlf4yBbs1
 6PdeLIFxLnsbo2m4mTM57PNfKEkZrr0LvS9JBWUjimkTMpjCdIM9YC+uuKR7VvQ1fII0
 jJ2/vWPutSqnwaLREH1FPeVu6yoK/+MqNBWWT6azw61uOBNAkL2Qlc6XZpOgtiqB3KRY
 RPQAY173R/fxfi8UTmoWl3CyblakTG65EUNx4Rm8NiAP5TTfpWP33ju9A9FRu2dojWTS
 JadctmHkjhApZVnLASiUHMokFS0HSLNadNd9hVsRti8V91vxbC216dRDZ+ioMpcu8dD8
 bozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HmbTxMVNmqYtjZO4QqW8Gui6ZrBzqGCcDHtGz8UUhzE=;
 b=Qyas4oztqG8WL/IbnAfvJ4iX3JM7YF9l95r4lXR6eRV4lkBm40XYpbP0sJxJCYOC+w
 ifUqTWz632Dli8VV1mQBtYH0aA8WW8x6v7O0oOEnP8B3Xf9mLOnXbw2JlSmK/7tasBGo
 dDGzoxc9GuxiIMyemosXPjoNLRRYJLxRxviVlD2QdYnTHZhFQkEvRo0AaKJ64POUBy3X
 SgzKpFrO/YeNFXVauVNDb1EmdvMVWX5/YxDRBIZVHWvgwLrABxMTNQF9qZbSzCOsFdP9
 03t8lmG0FYlCW6496e7+D2Ewe8HI44BjjAkt8goj39f9fDI19wgICA1ESAqOAQiAsANV
 bRpQ==
X-Gm-Message-State: APjAAAUJCh8Zjm6t8kLwzgQWkYG5sNdnyEpASFKXU49QzhRonJWmLJVQ
 sQWvosucNG9vA/v5HmCQ9R8=
X-Google-Smtp-Source: APXvYqz0yJc726OwUMMXhir3GUK9FAMtbtkY5OwKqmN0F/xhwa+kc9YCG8Hkz3qHA2h01krR8c3Wlw==
X-Received: by 2002:aa7:97b3:: with SMTP id d19mr1042134pfq.50.1571965444330; 
 Thu, 24 Oct 2019 18:04:04 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 2/7] fsi: master: Change default divisor to 14
Date: Fri, 25 Oct 2019 12:03:46 +1100
Message-Id: <20191025010351.30298-3-joel@jms.id.au>
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

We were running at 127, which equates to a bus clock speed of approx
1.4MHz. This changes that to approx 14MHz, which works on the EVB and is
reliable on the Tacoma systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 59537cab4f68..bef7690a0ddf 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -76,6 +76,8 @@
 
 #define FSI_NUM_DEBUGFS_ENTRIES		17
 
+#define DEFAULT_DIVISOR			14
+
 struct fsi_master_aspeed;
 
 struct fsi_master_aspeed_debugfs_entry {
@@ -441,7 +443,8 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	opb_write(aspeed->base, ctrl_base + FSI_MECTRL, reg, 4);
 
 	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC
-			| fsi_mmode_crs0(0x7f) | fsi_mmode_crs1(0x7f)
+			| fsi_mmode_crs0(DEFAULT_DIVISOR)
+			| fsi_mmode_crs1(DEFAULT_DIVISOR)
 			| FSI_MMODE_P8_TO_LSB);
 	opb_write(aspeed->base, ctrl_base + FSI_MMODE, reg, 4);
 
-- 
2.23.0

