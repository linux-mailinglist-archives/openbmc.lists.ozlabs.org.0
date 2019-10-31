Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8921CEAA6A
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:41:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z2J48Z1zF33L
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:41:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OALs80fl"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywf6WfwzF3Ry
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:50 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id u23so3218589pgo.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjjDzdSHuuOvh1BBN0aK2/G7j/U9tWO+ADKSsAOpE48=;
 b=OALs80flabvhMM9T7NLVwjXr4IBpWuGbGrz8xCaqdjiqekFRS9wEOBH2XoxxlCgR/7
 xb2zTg8emBbzEY2tJSz+fqoDFfxRQXyWbggLGAB21+Ft9lDQrFLSWLWPHzqUZ+MT6nru
 5zcqcR8kzJ2tv/RfBICbffBEbbPZrveLGaV3Ztwz+01p5UnLKo/0MUoeR4HMRgnr5l9e
 E2frJEWgWXfWMO/JD+gIITqpGyeSGKoJoor4HY6cslQyx5bId5vV8bP4IYhM9xh5K8pw
 Z3Mgc0wLCor4OsBkM034ZQbMt+RYOBlG8lxxvmeEcd7Kp7ZqO1G+rJSvLHaP0LSSWw/B
 5Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qjjDzdSHuuOvh1BBN0aK2/G7j/U9tWO+ADKSsAOpE48=;
 b=mpFmk8f4VwFdkLaFAAhyTs0JmwbsDAP8pYE4stxBmPN8eY0vCEhBa1pPoLV3dbrwPX
 daVR5vXQ2IlNfGsdxHfHCEYBMdjfLAND9FeN6QEugc6k0btgOPyZ7JGbuPdt1i7cqvgF
 3kKRurFk1RBA/rXFr/vayu0RaHdKP5zbvQhGmV5U0o/IiBZpiqf0pzXjGOkbqiFXw4ts
 VCjMLisUMJu65zK97oe/E+7MkNtVGqEtHxZe0knbrib3TtF60wLJtj9L+wNSjxRINaIv
 kw6NH6YmFTx4f70nbkFWjYpJ0zr+N18K/HOpwogu/IEWFNL9BH764wxQdTKFS78EmUrn
 Xvuw==
X-Gm-Message-State: APjAAAVgv+bbyrc10iLQ05nUi8kT414rXKP3uQhicFvFCGKE6d95PqJZ
 3qPTA4dEs0X4skgTMalwuMA=
X-Google-Smtp-Source: APXvYqxPO1mi3mGhKUtKJBtEv+zsDknRktPh7WX4oBrAM+urgREeT4yqzqN9xre7jyrwAOLLLCsmqA==
X-Received: by 2002:a17:90a:6584:: with SMTP id
 k4mr4568248pjj.43.1572500207367; 
 Wed, 30 Oct 2019 22:36:47 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 3/8] fsi: aspeed: Fix endian register to
 enable single byte reads
Date: Thu, 31 Oct 2019 16:06:20 +1030
Message-Id: <20191031053625.422-4-joel@jms.id.au>
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

From: Andrew Jeffery <andrew@aj.id.au>

The endian register controls where the incoming bytes end up in the data
register. Currently reading single bytes is broken, and reading half
words is causes the data to appear in both the upper and lower part of
the register.

The current value of the OPB0 read order selection register caused a
data read register value of 0xffffffff to be read for single byte
accesses over FSI. A value of 0x03 for the read order byte-access slot
correctly "swaps" the BE MSB value to the LE LSB for extraction by the
APB2OPB bridge:

    # devmem 0x1e79b05c
    0x00030B1B
    # dd if=raw bs=1 count=1 | hexdump -C
        fsi_master_read: fsi0:00:00 00000000[1]
         opb read: addr a0000000 size 1: result ffffffc0 status: 00000000 irq_status: 00010000
         opb read: addr 800000d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
         opb read: addr 800000d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
         opb read: addr 800001d0 size 4: result 00000000 status: 00000002 irq_status: 00010000
         mresp0 00000000 mstap0 00000000 mesrb0 00000000
        fsi_master_rw_result: fsi0:00:00 00000000[1] => {c0} ret 0
    1+0 records in
    1+0 records out
    00000000  c0                                                |.|
    00000001

This fixes half-word access read order selection in the same manner.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b520f5df567c..5b947c70c0f9 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -635,7 +635,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	writel(fsi_base, aspeed->base + OPB_FSI_BASE);
 
 	/* Set read data order */
-	writel(0x0011bb1b, aspeed->base + OPB0_R_ENDIAN);
+	writel(0x00030b1b, aspeed->base + OPB0_R_ENDIAN);
 
 	/* Set write data order */
 	writel(0x0011bb1b, aspeed->base + OPB0_W_ENDIAN);
-- 
2.24.0.rc1

