Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C3DA2BA
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:33:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqs04zLvzDqx1
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:33:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rwHZXlvg"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqnK4vqBzDr7h
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:30:13 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id q24so213876plr.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 17:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YOR7HLK5u7hItT3LoGlCZtVCQKapcp9aeW3bELjdErs=;
 b=rwHZXlvg4dWBTfwEr4NzxjrjTfRsazuyBBT8NmGR882KZEhDHi8u+KaGciQH63hKqa
 BPK69Wkap2pAlZYRy/L7G8UphnGaRfMEHzyu8Wt0WQfbSMvoevHVM/iM8DVPmgAnzS/G
 +i/hSstqFdPI6dJPGPVBgsiJZMlMm0fKSPAVYGzz3tDRIo8J7cuWaB9zTn1mLLJQ79Uj
 J7cUReMiHuhqQ8ut5ys6U9izw0JRNxt02XLcj4fxpvxv++qjCFHGaaBzibgdkxMgeCiR
 3Z82EbkT8dQEjSIpn2hFI7OVeGE5EWo0k5MjNIonWggY/DlpniPFThstLbyZ2R/YUehk
 P1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YOR7HLK5u7hItT3LoGlCZtVCQKapcp9aeW3bELjdErs=;
 b=dZJ0bNxiw0CYXxz9a60mTtNtPjGdaSkUsEzYIshTo4heH4g1t8yn0N4CvvjT4CQsN0
 03lwdc1S/apYff5SIZ6Ttspp5vskbwqYcT+c4flohcsPOLEh8ljKx92ngWQTy95cUXyi
 RLOBJhShGPNy0tuNvEHekvkf3S9tCnpKBMvBsuHAAAzabJlaTjv/P01Tsoj960pq4Ezt
 raAUO2/Hb2qSZKL9VIlzPBAcIPjwq1v8r3onw4NUyalb5kCKP5qnZjhWbrEie1lMvfUP
 FRBnrKQUhuVNszPRqR4cSDYibZEHTPakGF+nup+C0VvXT9GFVkVMklhPyYplxXkDz+Xo
 2nVg==
X-Gm-Message-State: APjAAAVGkK1zU4TQiw4uVIbP+WGKz5egiwIPNfNkuMpp31Klinv5hcv5
 V66e0MaS813MLaUryWwvr35R6PsLmWQ=
X-Google-Smtp-Source: APXvYqxisEQZbJPje0DAQ+KHGjGbyji60LCBoXmxTGn7TZyfZmYEkmUmSjsn5/sCn/95k4rLgtEaKw==
X-Received: by 2002:a17:902:ff18:: with SMTP id
 f24mr1019806plj.205.1571272211057; 
 Wed, 16 Oct 2019 17:30:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z2sm265261pfq.58.2019.10.16.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 17:30:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 v2 3/3] fsi: aspeed: Disable IPOLL
Date: Thu, 17 Oct 2019 10:59:55 +1030
Message-Id: <20191017002955.2925-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017002955.2925-1-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
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

Having IPOLL enabled when turning on the host causes FSI to stop
working.

In the future we will need to add a mechansim for the BMC to enable
IPOLL once it is ready.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 4e7d8a4bbc19..95b7f833e8bc 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -421,7 +421,7 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
 	opb_write(aspeed->base, ctrl_base + FSI_MECTRL, reg, 4);
 
-	reg = cpu_to_be32(FSI_MMODE_EIP | FSI_MMODE_ECRC | FSI_MMODE_EPC
+	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC
 			| fsi_mmode_crs0(0x7f) | fsi_mmode_crs1(0x7f)
 			| FSI_MMODE_P8_TO_LSB);
 	opb_write(aspeed->base, ctrl_base + FSI_MMODE, reg, 4);
-- 
2.23.0

