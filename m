Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC55E40D4
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:05:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zmBf5KrdzDqm6
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:05:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vZdO+ber"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zm8h0ybKzDqg9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:04:03 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id v19so403341pfm.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 18:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+gkZCMr02Gj6aQ8ieUEjo3h5iMWxRu21G6weOdR30Y=;
 b=vZdO+berPnWzNYOfi0n0iZcP3rmiFpKPDg0Tx/7vGz/5KjEKG5L+osGGun8AVKpGnP
 APbSmeeBoHeoJ8Vd/cLsrJymlEKQfNiifJg1uq9KBsf34Zc4a7/0N1l5xvRdSdhIi/2m
 6CeA09bEp3hbUabpLgo7ISE52GHErAiTcghZ8qrHymwt1KTgqxXhgJYCJ0CYf7BBMX+M
 zHp0+wUuGsQocf4vT5q5pLx204e9kxqnBxdjWicafg3PunJdR8vArrRdgvOIFZf/wJl9
 ymv5fJOUUai+FY7eW4xqcTuocGeaxbiIZpSH3ZO0ZWJfuJ+TTifUWbey/o+YIce51zYX
 n3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F+gkZCMr02Gj6aQ8ieUEjo3h5iMWxRu21G6weOdR30Y=;
 b=fiubnsrxJyIEf0gM3LT/0MtaqZNJgUnLuYxVMMYwjc1W3TbVhmd/l9lp+c+ZY74EFO
 wTmxLoX91Meh/XvJ3GwlHzrdf7HUKepwz/ygk87hK7PyPaDXfeP3pk23tYsb9Ceo1TFz
 h4EZUCaREx0cUHjswhewiLMSdrWaSJkG1K0Vf3IUz43A2aUy3B65c9ZdxwHCAjS5PPJ2
 +88so7hONVW7ZWH6KitPmJMjsXVelmtWI+DIiiM+jCq2bSSpdpmHCWThuaHErDnSEGe7
 NTbs7CHd8gUK+sH73z9TF82h2kofoTVeO/60meo+uwwDuzj189hL+ECqxNmDy0++N1rl
 Bcwg==
X-Gm-Message-State: APjAAAWzS8kBtGNgLDGBP7QLniWQUon0YsdxOwX9fdV0bt8frZfEJMf8
 kay6LTQes3S1CcVKQ/okFCc=
X-Google-Smtp-Source: APXvYqxziExWp6TyNmrcu+FPwGgXDAvV9/vsEmqLfUAoMCvrEFKQsVG8LC9o2mL4wpKaQ7KGx88Vjw==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr1030593pfa.70.1571965441865;
 Thu, 24 Oct 2019 18:04:01 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id l22sm231786pgj.4.2019.10.24.18.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 18:04:01 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jeremy Kerr <jk@ozlabs.org>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.3 1/7] fsi: aspeed: busy loop in the write case
Date: Fri, 25 Oct 2019 12:03:45 +1100
Message-Id: <20191025010351.30298-2-joel@jms.id.au>
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

We busy loop in the read case, make the write case the same. Note that
this may cause issues when doing a break, which takes a long time.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 3524b3dfe549..59537cab4f68 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -204,7 +204,7 @@ static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
 
 	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
 				(reg & OPB0_XFER_ACK_EN) != 0,
-				1, 10000);
+				0, 10000);
 
 	status = readl(base + OPB0_STATUS);
 
-- 
2.23.0

