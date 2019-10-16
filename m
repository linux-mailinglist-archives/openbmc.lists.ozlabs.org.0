Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB4D90C7
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:25:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tWjY44ChzDqPM
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:25:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZf5NvEM"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tWZd1Q7WzDqwm
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 23:19:53 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q5so14595280pfg.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YOR7HLK5u7hItT3LoGlCZtVCQKapcp9aeW3bELjdErs=;
 b=UZf5NvEM01de2NAVa1ISCEbszBPN+UYZwr4qJ6oYoeFWa521hPjFOe6ib4z1Vr9JsQ
 bTQW4dPMIaSDZJ36L3s0W6u27WJdyQLANY5ZynxyYTz+Yq8YY+3/s2SUd4wjo/a6tgVH
 ZKUZv8t98jl36sAiUrmNUgm108h9H0ELfr/RUJOOIR4dSsD7ncF2B9MnrM+Lu42rC/N/
 IvNqfq4rXtdyjR2t2xJhOQzwjI61ncnCJuK25Kcpb/yTEODdUeNOoaQar0HwNSZlU7XF
 ldDZ6FSRHGGnnRDhFvCBFWl+FXESZJo9gN8+PVXzXyEo7Ngz4aEZDQgJnAFg7OpVY7SY
 xpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YOR7HLK5u7hItT3LoGlCZtVCQKapcp9aeW3bELjdErs=;
 b=DCIKk0th63G9Po6dpdgyJ2871vOFmBtcOHcS4VED/McppfmsE1/DohfB9m5TbBv+A9
 X7kj/RwjDPOVoviuOr0gXpD0ewC8legMfLFPRnv4YM8YJjbW+0XSoTlSGcnjKXcjgNim
 jMEcJd4nPs49yEoa+au8mSBXMOn7rfmZ05iml/X0/Tgp8BIMQTqon5425fEZsh3HLcGz
 M0NsCvkWIPeYdCbR1vaW2s6iWS6KKbacPs9ddU63JbXBPb3q09B2gpSymQSgMbc+zfXX
 XzS13UAx++EykLSzb2aOvgh4K8QV7wwTfV4s9vc7+Q1sLqJ4yL3i518uRuxcYzTe0yl9
 kChA==
X-Gm-Message-State: APjAAAX3RSxIII8HbHe4mUWIVW2WM5mN3DtW3rYy+JOkQ+MetKX8lAGL
 WRC4R+0I0zPAmqrbS51q1jyNNbLBlTQ=
X-Google-Smtp-Source: APXvYqyYcLR5BDuNYk5ADny0MJ2hmjGkyhTVMbfJHKligrjuVXyHDJlDHt8KBKPDu6iC88qG6xiejQ==
X-Received: by 2002:a17:90a:b116:: with SMTP id
 z22mr4635614pjq.82.1571228390955; 
 Wed, 16 Oct 2019 05:19:50 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id c1sm39075531pfb.135.2019.10.16.05.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 05:19:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 3/3] fsi: aspeed: Disable IPOLL
Date: Wed, 16 Oct 2019 22:49:34 +1030
Message-Id: <20191016121934.28481-4-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016121934.28481-1-joel@jms.id.au>
References: <20191016121934.28481-1-joel@jms.id.au>
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

