Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7167E40D8
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:10:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmHX2msXzDqdV
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:10:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KxYZv5Hv"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8t5qZfzDqmJ
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:14 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id v19so403578pfm.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9Qh9KVE1ppMbnYtXQGdN8eBPKJY5W1H02syqdWhLmw=;
 b=KxYZv5HvLvIKSXrUN3rPYmwteaT22dB2fUqmPM8hj0TtwvpLg+yGq8sxH1RThD20Q3
 G020wYcmy/SgrjXMemVa4jGHWBudhycpZKlRsUUxeeuEwGassW18oWJVy/OMs/U1/SHe
 pB7Fz7f4nYC/SK8cvvy5RVK7EzOVD7BfrbtnyjCNOlTVfJgPg49REuaozS5HhUzvYm+w
 Z3xSbE1baiKLwOgcU2vji3iJK8wELggLsaSC5mlp2hePRyysdch/sxZ+ZxF9kRUSgetD
 koxSNALyI4pLem8gpas8y/mXIdN/IthoWtndKShOp9zfcrYrxUieUn3jlZUBstDENVMu
 DOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g9Qh9KVE1ppMbnYtXQGdN8eBPKJY5W1H02syqdWhLmw=;
 b=B8wyqUmAL7NJoLfyvtSA16f3JBZsNKJkyHByuRseXVhUkX/Nze+opGl4mXEFckcFc2
 VqGjjdcgOVSg+/qKwk7DHlOqVK50JXBgzdc/V07SngB4YoT58g0aJHWzJV6uMPjLdsaK
 sHbinfOeWUyMS27XEGnqm+Lb1nO/ts98Ovs326ZnC4rdAIklKe31WWDqyy+TU6PwAadH
 9u6KP7LQPK+5XnMcfcnxMq8HCzJUhXg0c9+/ITvDZAtzFQoXb8JiTQNO3q/ry4rrxn7i
 3HAnyYImOXiXVgOQGVnJnzFte4zy2gXKJoy3hFBKAh5g1oGsSFMHrJhKIjCkn5nG54rk
 iM4A==
X-Gm-Message-State: APjAAAV8EVNIHWGS2EAx6aZAZw+kkOd1+/F7gX4pfq3MzGAC0keecDrD
 0jEpgEtQU+Frk+QfzGQeGr0=
X-Google-Smtp-Source: APXvYqxBnYOzXrM8Pt0VClUqb7tj9O9rHnD9hzHw0dfSvEYRbYA4FPCtcR6VvLgft0QuP49sucfxMA==
X-Received: by 2002:a63:6586:: with SMTP id z128mr1110240pgb.260.1571965452874; 
 Thu, 24 Oct 2019 18:04:12 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 5/7] fsi: aspeed: Avoid copying read data twice
Date: Fri, 25 Oct 2019 12:03:49 +1100
Message-Id: <20191025010351.30298-6-joel@jms.id.au>
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
 drivers/fsi/fsi-master-aspeed.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 58b090e2cf46..c98b1bf179a8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -303,20 +303,17 @@ static int aspeed_master_read(struct fsi_master *master, int link,
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
 	int ret;
-	u32 data;
 
 	if (id != 0)
 		return -EINVAL;
 
 	addr += link * FSI_HUB_LINK_SIZE;
-	ret = opb_read(aspeed->base, fsi_base + addr, size, &data);
+	ret = opb_read(aspeed->base, fsi_base + addr, size, val);
 
 	ret = check_errors(aspeed, ret);
 	if (ret)
 		return ret;
 
-	memcpy(val, &data, size);
-
 	return 0;
 }
 
-- 
2.23.0

