Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BB805093
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:38:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ze86+rHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxpF0PJ4z3d89
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:38:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ze86+rHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxld64Txz3c8r
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:12 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ca0d14976aso18976211fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772566; x=1702377366; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU0vmmGkk5jZZzl83+7pZTLNraC38rsdaXbaqMF+jj8=;
        b=Ze86+rHLa/0EeI1LzXK8B5b+GihuYmSNb7Lsfc58TMK8bmevgH344Y+xWmaHVikMnn
         pSm+cWx2Ei62Ntnh9hMktdWiLXIJNkaRHigklxGvxaOpdATFbBR6PFQHJXWZDouE3b0L
         rAUe5588RWpvCtzeOpWay543GVArXYm9X7cv9OjkuWC2RBzaeyy3CMCY5CArZv5C0V5s
         IO5qU3Wtuj+tot6L8/OKLEJzLAlR8Z1AEiNj9zQXP+qRQ+7/s+K/5GFLDebu7/TL6AgQ
         5/wiqLc3aF/qr5UzugfRjESMJ5xGGk2CBeRotzivopXY9psYV0HtCK8whJVpTl+FNy35
         GcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772566; x=1702377366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU0vmmGkk5jZZzl83+7pZTLNraC38rsdaXbaqMF+jj8=;
        b=MKjJWlyvvFnRoj4MMlmPFOJkj5VJw4ODS0e/6/pjcRFemJhJzZexRYn4NQ8lK5KbnL
         VtF+Qs6rpXwp65oUafA5H/aclnh7HWVdZhcKI3700S0Dd9QNxIhsF9AFBF7Qtz0B3tiK
         vxEGM3rvvl/59U61u7hV3cblbTWa4JEI/O16mvoeFakiAWIXiucoKZLmqEkL0x0OwiAr
         NyFzO0nUQjvxCDBAvOmWy7Nber19vpM6xusRYZzyYMnuYZPMCxh5i57Z12CXskXVDNUy
         AUPkRW5GZW3Yd43exuTyQHDAXmttZY4JDWUFN4Zvmehqbf5v9/p08xqVCtMSReiJl2l8
         E6Ow==
X-Gm-Message-State: AOJu0Yz8GuD9hIDNOSGiPCbdyUU2i5vNnBHitUwhnvPNYFPXfgmxXRSz
	P0lSwI1CPfDkLihxM8bA8+c=
X-Google-Smtp-Source: AGHT+IEyzagyInlkk1nPyBZ4FwyLEwY/Eu+fMNUrVKFjMERCNTvfyTC7suwpCzoymVY+rBHcqsbPYg==
X-Received: by 2002:a2e:9a94:0:b0:2ca:fa5:83ef with SMTP id p20-20020a2e9a94000000b002ca0fa583efmr844131lji.6.1701772565635;
        Tue, 05 Dec 2023 02:36:05 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id u8-20020a2e9f08000000b002c9f1436d86sm1029551ljk.92.2023.12.05.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:05 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 02/16] net: pcs: xpcs: Drop redundant workqueue.h include directive
Date: Tue,  5 Dec 2023 13:35:23 +0300
Message-ID: <20231205103559.9605-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is nothing CM workqueue-related in the driver. So the respective
include directive can be dropped.

While at it add an empty line delimiter between the generic and local path
include directives.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
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
2.42.1

