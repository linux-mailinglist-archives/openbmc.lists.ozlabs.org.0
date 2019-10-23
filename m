Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A2E1208
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 08:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygJk4dX4zDqGm
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 17:22:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdLduAtc"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygFG5nzTzDqN6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 17:19:14 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id f14so11482360pgi.9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xDCxW0VYYk+Kbtt+cUSnysiSu+a12fdC76WGW7qwSU=;
 b=NdLduAtc8nYBSuJB9Nmj4SfggPWS0FUDwGOBeyC7B3gyND+r1iP3M1pTzoqnGhdsI6
 hqjJCRQbzkHVvoNQ/3mXShAgykdfVhL3hxNxP2hjC0X3B+HtHOxDOeFtS3QjKQFy5jh6
 ZPakSRy1RBf0pS3ISlQBsWbbrrTRlr/T//EG2CS+ruaGeoOORCtHUMm10D81P+gIATMw
 LEKfBHz1v+Qlg05RWmn7hH+p5V31d5emOeMAis3Dn+k1xEQsqNSfvTQrVP1s9lcX15S4
 vL43tChVUNFAUNhlxYWrXzk/zf7Zq8dNgxHwKrbfGCE0oKdcaXEGPijbwhpOOUtT5o2G
 dYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8xDCxW0VYYk+Kbtt+cUSnysiSu+a12fdC76WGW7qwSU=;
 b=cyy1TOIB7ac+LEu2TsRlDVyBcxZpY4p1lAa8FI6Fq0+eEDMxLrnqOlyjXelMIetlHi
 PxcCNbSIhosmCbthYti0erWoj0OzizfGBoP92H1dnPs5R043Gs//I7vSramdKDUoDAKY
 OvNA4q79pOoWAk1bMY8DWFIVTHXppmTKOfZtAX0BbrtizogwJLeYM7Sf/VzzW0e2/s1b
 uJeyO2uL8ivoFy33b77ZHJu3fzaNq332dhF/sIGDl9tT7hjCHN7ahkNWHxX529SMbw2h
 dA0tYdMadDXYad9fSgyQEoNX/bVwk8uAKg6GF42aNjo3TePRlhUW/DWXiD3L9KegO46h
 GsTA==
X-Gm-Message-State: APjAAAUR1/pJHir1zv17Spr4ypVxrx0O2SwnGpsDWnTarFKE4+0E6A+t
 3+WKE1XKpni4eA1mB44AtmVufiZJehM=
X-Google-Smtp-Source: APXvYqyvA3YWz+FHKAmJ0mx2ETrsmcZNRMCRyqdusqZ1GWNiQOULn31Aujrf8BHcIOjbRuJqzLjKrw==
X-Received: by 2002:a63:ad0d:: with SMTP id g13mr7880345pgf.407.1571811551582; 
 Tue, 22 Oct 2019 23:19:11 -0700 (PDT)
Received: from voyager.au.ibm.com (bh02i525f01.au.ibm.com. [202.81.18.30])
 by smtp.gmail.com with ESMTPSA id 4sm6364598pfz.185.2019.10.22.23.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 23:19:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/4] fsi: aspeed: Give read longer before timeout
Date: Wed, 23 Oct 2019 17:18:46 +1100
Message-Id: <20191023061849.16926-3-joel@jms.id.au>
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

Accessing some devices under the cfam would timeout (-ETIMEOUT/110).
This shouldn't happen in normal operation, so extend the timeout to be
longer.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 60d302871db3..18f6012f19a8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -220,7 +220,7 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 			   (reg & OPB0_XFER_ACK_EN) != 0,
-			   0, 100);
+			   0, 10000);
 
 	status = readl(base + OPB0_STATUS);
 
-- 
2.23.0

