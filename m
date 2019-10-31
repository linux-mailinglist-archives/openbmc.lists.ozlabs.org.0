Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFDFEAA77
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:48:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473ZBS33RVzF51S
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:48:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+dx00bF"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywv46QKzF4Nf
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:37:03 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so2147658plr.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68uKnOyDBcH3pu6SlFzLY9SmEB6t5nEYzTsNrY5zRz4=;
 b=l+dx00bFwYXzRTMGCo93Xzz+DH31qFnbvth/CKyQuKK5d0x5/TMpe0YY59ADLWZKsz
 Zb+MVZkheGuk1UjNOXtuIhJlGLTX4sivXn5JLelZURuY4klvLP8puHv7TZdvhNA/wusg
 AkB8Z47bci7kywY2bZrdT6lvG/WF9StFavJ390bzGXjaspWkMCEUA3uUZK5/wLbKJXfs
 Q+l1GfkC7GqfxJAaRDH6FccR4IUn005ldh87ODxfbVZEGk24pmd62xr5XHXj9h6+6Aa1
 cV3n9fxGJgk4iPszY9wb+2iowtKpgkGPTKc6taauPkycvpLNr/6vKBoq3aywigVIGCWh
 e7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=68uKnOyDBcH3pu6SlFzLY9SmEB6t5nEYzTsNrY5zRz4=;
 b=gyyz1Cx3Qr6eY36v7PSfGfM6sWmFduuya3YfBV3cqFYxEZnl/1TZ/R/fXfLAbv2ATz
 TsfJAtfCwfu4lgK8Z1a1P8xLLFCPzoZpEKRdjYXojNw0tsfTP2/9wUqV6a3zyPHHcby1
 ihOQulsNAuYA2pYrMJMTc/pz80ryjfSJHiUbbTm2KSxFipAOTgM7TsKEhNPZHxh/cOPO
 Q2QAkAH7bEPUmw0s2/v6uggezroC45Fn8hCYZihvHzbC9DYAaYAvWbCu0854RGZkf16H
 pSBK+VnvKljQ2xB8GJJo8QcA2sb6FsiXA9ap2O0CkeZBMER95UqKLLMDCt9kBZl6eToS
 8AkQ==
X-Gm-Message-State: APjAAAWE7d8/dcVoMi59hGdOoeN5f5RbzLp7mbGq9N5a08OTv8u3WNKC
 anzK63Kq1ey9CF47YamZBwI8aoO+O/k=
X-Google-Smtp-Source: APXvYqzRHSiTN0x6fNAhljbhIFOJIw7pI8cI1awYfm8BUBLaMMZibL/+eqQewKOa9ntq/rZXfXCv1g==
X-Received: by 2002:a17:902:8208:: with SMTP id
 x8mr4406431pln.232.1572500221180; 
 Wed, 30 Oct 2019 22:37:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:37:00 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 8/8] fsi: aspeed: Use defines for port reset
Date: Thu, 31 Oct 2019 16:06:25 +1030
Message-Id: <20191031053625.422-9-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191031053625.422-1-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
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
 drivers/fsi/fsi-master-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 686380414fba..595350800406 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -256,8 +256,8 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 		/* Check MAEB (0x70) ? */
 
 		/* Then clear errors in master */
-		ret = opb_writel(aspeed, ctrl_base + 0xd0,
-				cpu_to_be32(0x20000000));
+		ret = opb_writel(aspeed, ctrl_base + FSI_MRESP0,
+				cpu_to_be32(FSI_MRESP_RST_ALL_MASTER));
 		if (ret) {
 			/* TODO: log? return different code? */
 			return ret;
-- 
2.24.0.rc1

