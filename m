Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B509D860043
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 19:01:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dt7FCtBU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggtc4dp3z3dXF
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 05:01:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dt7FCtBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tggr86VSCz3ccV
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 04:59:04 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-512cc3ea7a5so44284e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624740; x=1709229540; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH0T15OnUfP1zKLKNNl5grEVTc9u2KY09oUHUCmXOXI=;
        b=Dt7FCtBUGAB51eZeDZuCkTlZwxh6cgNQt03do/bktc6imieYfo0xpchJUhWSKXTAvZ
         shJ9mHzVvUYoBOE9ew6S+D1PEJr1k46M4lyQgi6jWe7jT8b9L2Evki/JICXFpdjd4Fqv
         KgVnIW3pNzYIzxAMU7Xj8gKdM5nEj2vfSeDuJo30Brm3v//gtX8VmLSGpG7p+ePlqsBS
         luLH5wJHi8KIZVbTU/zoDDlezt/g2BNZOTLE1rJZcUGs7kaJ2hBMVI1dAkOQ9wNRmN14
         4T6BUpy12VLxdI6YyF6UoU/VY9FYbOaAhy0vlr3+/WVYiDdRIm58OFptW5aOd4lsNLcL
         M9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624740; x=1709229540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uH0T15OnUfP1zKLKNNl5grEVTc9u2KY09oUHUCmXOXI=;
        b=uOQkjS1WEKqFP4zZSzx/LfvSe3pBNw4TC66Vxlb6d5rbe8rowRxw+75nmkHFa+Rsal
         WyKAPEy+Ir5grdFK9F9OkU7lTNVX7KjDymaItm/J8CsDI/oPR25M5ecDYMW+ewxZj4k9
         n/ZkmPmqLD4libxNQigtH4TDnGvAxFFVpEaSsTo6GCzwxo/tD4X7XXTmw54d2vJ+p8EY
         kp3ITnCv2cD6S7DjeKgMxqvxCZgtn5zUi4LWePgBSzzhDQ3b3GulI9+HJEvXlt/mhnzM
         0zFQvrw5BCUULmkppRbs8GduEKF7U5F6cI4e2hnUF29lGTzxCh2281fD4sl6n+OdaGxk
         m4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUx3aBbWWoV0I54DXhDDzEfgtcnR2YeaAqTuS4wQzn0walqkzvbfQNKTGiDL+KK8Rg7KAVD3WtY/osxb8wyDseyW/+nEzcfx9w=
X-Gm-Message-State: AOJu0YymaWJuNaf6+f9dqS7JkOcz5KR0A0Jc6VdQAA+Ipg/hRtfYTgtE
	ns+V/3DOLYZSsmn/5Hm3kKJ0PNcuN/8gLLhw7P+HDubzt5MLw57G
X-Google-Smtp-Source: AGHT+IHIkOef23Pm0dSclQaK6P87y6AMWfJ1jDRoVN7DxBBYhgDQybIibJWUwprz4AO8ax14LoWKKg==
X-Received: by 2002:a05:6512:3e14:b0:512:b932:7913 with SMTP id i20-20020a0565123e1400b00512b9327913mr8296418lfv.41.1708624739902;
        Thu, 22 Feb 2024 09:58:59 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2-20020ac25f42000000b00512b92ad710sm1461552lfz.168.2024.02.22.09.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:58:59 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 2/4] net: pcs: xpcs: Drop redundant workqueue.h include directive
Date: Thu, 22 Feb 2024 20:58:21 +0300
Message-ID: <20240222175843.26919-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222175843.26919-1-fancer.lancer@gmail.com>
References: <20240222175843.26919-1-fancer.lancer@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is nothing CM workqueue-related in the driver. So the respective
include directive can be dropped.

While at it add an empty line delimiter between the generic and local path
include directives to visually separate them.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/pcs/pcs-xpcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index dc7c374da495..7f8c63922a4b 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -10,7 +10,7 @@
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/mdio.h>
 #include <linux/phylink.h>
-#include <linux/workqueue.h>
+
 #include "pcs-xpcs.h"
 
 #define phylink_pcs_to_xpcs(pl_pcs) \
-- 
2.43.0

