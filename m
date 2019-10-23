Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FBFE1206
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:21:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygHS1BBHzDqBN
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 17:21:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tY3uNL20"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygFD0qPfzDqN8
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:19:11 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id p1so11506657pgi.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 23:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ONgX4FZLoLMsOHrEMVo4P1Wm/D+LhJo/26NHOQ0g6cg=;
 b=tY3uNL20g+RZCjCehHvO7mRKsz4iwcCtUNr3n396ZrTNrp+CT/aspQsaoPRk1uYo5q
 4g8KxBYp05unTLDYxmFeCWOsu6FeZhk4tRcj8Qq+UeoxIGCEVwWESVq1JV9yVtAKAE8p
 oRXpU+iXJnS4Hf5XfFIZiy2Fmglxjml4og9bkPLDyV4pA2hjt8aX62Buy+m/fDQigWy/
 zPaD7tXRM8rvo3HrY5tpCuBu6LRB9JOzyutqAxulVR96NF+z9bchJpRA0FOZWvO7Nm/c
 QSfxWd5Zp0vXK1ZgCjr+U1mEq/jND10JjFGKwNWgpgKpUDZ97nlrtqA8pG80K/lDtO7j
 s8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ONgX4FZLoLMsOHrEMVo4P1Wm/D+LhJo/26NHOQ0g6cg=;
 b=brp8jy87CxC37SHrV4X1M2pmeFGk+aOg8MomMVqzujhpPEcPuOSTQIRLOM+K7R55Vc
 gUcJQRdUBRSrY0nEM4gXzC4yKsmSrT+xM02GoC1zFpE3kXefhh1xN3XImocdDMZ+Jasb
 Uz5GCYEcyVbWwhduhEROaoWCM8Uorr3vnv12E17udS+PGQhLVqA/K+ywbQNVE8hEJS8W
 cfGdQeYmcZViATdZ8de9M284ysMyjQbKaZG51f0FrXXiJctFJ/zuMLcmGsN8SyZbh7wt
 JeB3hu0a/5qTCBS1r93S2LEW13xar1g7hKfMfDF8deecpbSIv7oWSteXc6PuVc9PfVl6
 V6MQ==
X-Gm-Message-State: APjAAAVIVjjrc9EX2gLp8l5HNqmRHhU0zfkbFNPPELabIZ8ircJXwdUM
 WC1La74Ajop2w89w3ghT09JLiP3Oh7w=
X-Google-Smtp-Source: APXvYqx2/WXN+oK7EqirrtW6UUy+eySh/JqumHx4JDGEXJZEco8t6tC01NRFNtpEDiETQ4N+RMXhPQ==
X-Received: by 2002:a63:1743:: with SMTP id 3mr8374115pgx.161.1571811549004;
 Tue, 22 Oct 2019 23:19:09 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 4sm6364598pfz.185.2019.10.22.23.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:19:08 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/4] fsi: aspeed: Add clock debugfs file
Date: Wed, 23 Oct 2019 17:18:45 +1100
Message-Id: <20191023061849.16926-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023061849.16926-1-joel@jms.id.au>
References: <20191023061849.16926-1-joel@jms.id.au>
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

From: Jeremy Kerr <jk@ozlabs.org>

This can be used to adjust the divisor for the FSI bus clock.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 95b7f833e8bc..60d302871db3 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -483,6 +483,50 @@ DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_debugfs_ops,
 			 fsi_master_aspeed_debugfs_get,
 			 fsi_master_aspeed_debugfs_set, "0x%08llx\n");
 
+static int fsi_master_aspeed_clock_debugfs_get(void *data, u64 *val)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	u32 out;
+	int rc;
+
+	rc = opb_read(aspeed->base, ctrl_base, 4, &out);
+	if (rc)
+		return rc;
+
+	*val = (u64)((be32_to_cpu(out) >> 18) & 0x3ff);
+
+	return 0;
+}
+
+static int fsi_master_aspeed_clock_debugfs_set(void *data, u64 val)
+{
+	struct fsi_master_aspeed *aspeed = data;
+	u32 reg, rc;
+	__be32 raw;
+
+	if (val > 0x3ff)
+		return -EINVAL;
+
+	rc = opb_read(aspeed->base, ctrl_base, 4, &raw);
+	if (rc)
+		return rc;
+
+	reg = be32_to_cpu(raw);
+
+	reg &= ~(0x3ff << 18);
+	reg |= (val & 0x3ff) << 18;
+
+	rc = opb_write(aspeed->base, ctrl_base, cpu_to_be32(reg), 4);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(fsi_master_aspeed_clock_debugfs_ops,
+			 fsi_master_aspeed_clock_debugfs_get,
+			 fsi_master_aspeed_clock_debugfs_set, "0x%llx\n");
+
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -642,6 +686,9 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		debugfs_create_file("mectrl", 0644, aspeed->debugfs_dir,
 				    &etrs[idx++],
 				    &fsi_master_aspeed_debugfs_ops);
+
+		debugfs_create_file("clock_div", 0644, aspeed->debugfs_dir,
+				aspeed, &fsi_master_aspeed_clock_debugfs_ops);
 	}
 
 	rc = fsi_master_register(&aspeed->master);
-- 
2.23.0

