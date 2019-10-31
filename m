Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14961EAA73
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:46:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473Z7Z5y4kzDqTL
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:46:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WcsI52fv"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Ywp5yYqzF3vg
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:36:58 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id p26so3451644pfq.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRf0tZr8vfxeKL2GeF02XnKiDtV8AkS7wbZpj+YrffE=;
 b=WcsI52fv64zUX2xpD4Q2aRUmM1pQG3GWo3jxkap5lQSaT3fJqNHCm+g0a8KTHf1/RK
 4RoOS5LxIWPaWGhakCNd7/IcK3DcCOFqIckZdcL/NybpWbYP3lBlC2wOoFUeFEJo/Jz4
 yrrtPG5rIsljFPDxCHhTR8acRf+jG7XmTP65ZUbUFZAVrySlyy0nOfue6JjxaJHfqmwj
 QNb6QfJMXGkvRROYwetWIh5bElXrMov42Il/9ew6nWbNskSVcgMpvb8bETdkV9IdJrcg
 Oo8y6pEgxMmuoxEOcElloGXrxQ7VxWKcEc4xbv3kRjVeN4xxno96b0doaCtx9ox2nlqA
 QH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cRf0tZr8vfxeKL2GeF02XnKiDtV8AkS7wbZpj+YrffE=;
 b=Out0c7zDTdrcQma7L8SJjQjr4z4yeFn1H17zs8aJlEz+9INGcAWuf0r+AjIA4JmpIj
 6ylSV/lqXPUNTmwhzTSnD6Y81yC6BCvb1xA5C/xx+P1elNTqOUAO9JansHxU2vVLZ9zs
 dGz+StwwqnyAtUban2QmyoLx2HhCyjpI1O9EkDcVGPIyNUArmiDujbd5pYLXFUhUvYlT
 yDwi14AYNGAeFze4sxC1k7V7byLybJ1yYZUanR8OFL21w+tNjP1wXZTRZLM47oRISofO
 JSfG1TKdmoNJB5Y3BxGfSvpzC+yo9zKCxGEEI60DWg3htaBP6BbrzQSDPacpebLsqzlx
 5iGw==
X-Gm-Message-State: APjAAAXUCABVmUkbB9IjzGszlA0X3mug0RW8ykTD8OkQmLNU5cMqzD1K
 N6fs7WJ7OnzLydpQylrrQqvW/4xut3o=
X-Google-Smtp-Source: APXvYqwT6N+UKNPgtzw0tJR+Cu/9r99v7gBKzZMkDTbanxW+imTvkd23GhMTsl2H6PR6OIr4L7hPIw==
X-Received: by 2002:aa7:9f0e:: with SMTP id g14mr4183795pfr.202.1572500215489; 
 Wed, 30 Oct 2019 22:36:55 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l72sm5337829pjb.18.2019.10.30.22.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 22:36:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 v2 6/8] fsi: aspeed: Fix link enable
Date: Thu, 31 Oct 2019 16:06:23 +1030
Message-Id: <20191031053625.422-7-joel@jms.id.au>
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

Link enable was saving the value of the write to result, which was
not checked. It should either have been ignoring the result of the
write, or erroring out if it failed. This chose to error out.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 8f757eaa6a55..ee760e84c576 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -344,7 +344,9 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	reg = cpu_to_be32(0x80000000 >> bit);
 
-	result = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
+	ret = opb_writel(aspeed, ctrl_base + FSI_MSENP0 + (4 * idx), reg);
+	if (ret)
+		return ret;
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-- 
2.24.0.rc1

