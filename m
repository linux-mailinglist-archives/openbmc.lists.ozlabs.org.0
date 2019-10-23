Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E020E1209
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:23:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygKy20lDzDqNS
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 17:23:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PsZysKug"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygFK0Vj6zDqP2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:19:16 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id y5so12235583pfo.4
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJV/a6ecpyj/8HGd9ES6BmvcxseaHO4zbYaHBAHTTyI=;
 b=PsZysKugwjNNW+cAt3jczYBFKsIbGTmXJJ88DGPKaYwFC86FHCxw9AkiFPSEbmBRq/
 yse1R36O7MthakZ7YkjG3aDnkAKSaVXeR4p5v0BI5g0xrjOOqhhyeSytobxsnoDsnVCC
 w1vQGkdmpHTQT/vYj0BkoCBKuvAt9INn23l+8Ky3SYbtzQMOF+sSv+xbgFdVdy9+BCXG
 K4aBc7Dqenl5NxsCAwrUemJ96zTCdDWZJVts6/6Nd9/4wISyCoeG+Vl/T8+cQrLo5DVb
 JTsM5b8N4e6TMGbZUbsSIlpFci+e8jnqOk4SWw4iA7zRz2dn2L//cgMDhEeboLTYZ3Jc
 xtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bJV/a6ecpyj/8HGd9ES6BmvcxseaHO4zbYaHBAHTTyI=;
 b=VB695D8CUCS1M2bUMT/LFBKCx0SWjZ4JHn3ofYV7eHzOXZABi8IxEzIECyouzCAwad
 xfo/s3o8dHWqgM+/XIf2+flvtW0RRouv5ouXVT4o+ZmmFc0tYaE43cR94Lt6HLDTR+uD
 ss48W8iNFXy79JtAedAwOGgrViZtePUTN5DNbQJ1+tDUgvQh3a7aMcDTYXMXRYUXH62b
 gcRTN73vHF7dx8dHywjATTU2biya8wGggyJvau8DH9lUoXR7vk9/X16JVkdVyyKj1fHS
 +O4WfwqkDPxN39Sk30j3AtjjNAinKugJl4AMCLGbWlVZQBp3MHMNerMUbZmD7JEm/T2G
 nR1Q==
X-Gm-Message-State: APjAAAXTJwO7yMBZkm9UQhbCfG+/Id9MZ9l58tv1kcHIWrdnJ8uOH2Oe
 IbOqwiCR97nbM1eW6nGFAuSZoaYBs+o=
X-Google-Smtp-Source: APXvYqwPP+gQcHrNBYcfSrU1sk2PYMJUyVEGV+Pq6fgWzkW3JeAlDi/8ixOzBxg5iJe+f3zq6paDUg==
X-Received: by 2002:a17:90a:a416:: with SMTP id
 y22mr9583113pjp.74.1571811553886; 
 Tue, 22 Oct 2019 23:19:13 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 4sm6364598pfz.185.2019.10.22.23.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:19:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 3/4] fsi: aspeed: Add more registers to debug
Date: Wed, 23 Oct 2019 17:18:47 +1100
Message-Id: <20191023061849.16926-4-joel@jms.id.au>
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

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 18f6012f19a8..8c5eb2bb1994 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -33,6 +33,9 @@
 #define FSI_MRESP0		0xd0		/* W: Port reset */
 #define FSI_MESRB0		0x1d0		/* R: Master error status */
 #define FSI_MRESB0		0x1d0		/* W: Reset bridge */
+#define FSI_MSCSB0	 	0x1d4		/* R: Master sub command stack */
+#define FSI_MATRB0	 	0x1d8		/* R: Master address trace */
+#define FSI_MDTRB0	 	0x1dc		/* R: Master data trace */
 #define FSI_MECTRL		0x2e0		/* W: Error control */
 
 /* MMODE: Mode control */
@@ -70,7 +73,7 @@
 
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
-#define FSI_NUM_DEBUGFS_ENTRIES		14
+#define FSI_NUM_DEBUGFS_ENTRIES		17
 
 struct fsi_master_aspeed;
 
@@ -681,6 +684,24 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 				    &etrs[idx++],
 				    &fsi_master_aspeed_debugfs_ops);
 
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MSCSB0;
+		debugfs_create_file("mscsb0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MATRB0;
+		debugfs_create_file("matrb0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
+		etrs[idx].aspeed = aspeed;
+		etrs[idx].addr = FSI_MDTRB0;
+		debugfs_create_file("mdtrb0", 0200, aspeed->debugfs_dir,
+				    &etrs[idx++],
+				    &fsi_master_aspeed_debugfs_ops);
+
 		etrs[idx].aspeed = aspeed;
 		etrs[idx].addr = FSI_MECTRL;
 		debugfs_create_file("mectrl", 0644, aspeed->debugfs_dir,
-- 
2.23.0

