Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488ABA3343
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 10:56:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KYHw5p3tzDqxd
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 18:56:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="R76PAH1H"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="H5iKtlaz"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KYHB2L87zDqxL
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:56:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 21AF922083;
 Fri, 30 Aug 2019 04:56:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 04:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N+/xHfrW3aULX
 QCqVybged8XEa4ya5xZpQyzoYwgBTM=; b=R76PAH1H/iOqVCzosNZ0Fovw3S32a
 okmNERZlIdtujAwr6tLc/HAzJk2f6I66/zr/8TY4EojPCgmDXZ9UNeCR43XSB5c/
 mHHS54XCqK+uD2ms/qeTlmpEMtK68luY7CvvwnSMc7EAw7A6jG7uQ9nVvK+6Zb2L
 iBsvLN+JfzoeomrrILPVNLyzOOh3vLqL8RPUmmuln9V2OW1zfsBQdieiwlwdGYdy
 G26MkyCUl7HaeYBUL3OQ5MzoJF/bV+bVO3ClStw0j+L5CFtCihnIOsmud4bQCbPy
 JurEYY5cUcuf6LKb2qSRoiYwHLB8oWOCRVzqdQB8Tkt0Bp6rrAoJ3QyqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N+/xHfrW3aULXQCqVybged8XEa4ya5xZpQyzoYwgBTM=; b=H5iKtlaz
 Mvzyh9emvEBjZpLTEKW7MBvp5ibNp6RquC3pPy/dcM0MSTOIDUKBmpNmOXcXI60b
 eqJuI+r9spmW/FTp+t95G9uES9g04EPrXBOTGDwWnUNHSogmVwiftuM5c136y98B
 gYSFTw76euPKOwXHGZESK2R03iMtYxTr+tdoNGN1gUAne4cEpMCws6lB4kD0XdvF
 CsWPfii9MoM72iWIgTcSX8FN1pCarERK7I3AQt2Ypi1bYVaeYiFSsxqYstIgiuLD
 dBtKhhqRY8zo3ct96+se0i6UyaqkAcKz+91jOGLUio2t/AFqpVN2SBw75lbTn+7x
 5OdYa9HciQ/RSA==
X-ME-Sender: <xms:ouRoXcJBNeBXLPVXd-Dxb21Wl5GCTfvE5G08cegHUxYsrJ-75VVg9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeigedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgv
 ficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfkphepvddtfe
 drheejrddvudehrddujeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ouRoXeNnfUzlnqm4rj_z9282uGgrGKPPqpI6q9ORV3ihFFhz-9ppCA>
 <xmx:ouRoXdPioKYuxmXro9rYxK7-5908-a-WJDkHmjWkyHp119zIESy87Q>
 <xmx:ouRoXeLY_Az5fC4MTGtfLCT0Hj3vM3GXJGhPJ6SLMxQ4-Ws3Ff2KkQ>
 <xmx:o-RoXeajf12M3r_EeERXUsb92egLNoLZJoHb79wWKQpL1GUvwJDGVg>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 97D118005C;
 Fri, 30 Aug 2019 04:56:00 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 1/5] mmc: sdhci-of-aspeed: Fix return value
 check in aspeed_sdc_probe()
Date: Fri, 30 Aug 2019 18:26:28 +0930
Message-Id: <20190830085632.12928-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190830085632.12928-1-andrew@aj.id.au>
References: <20190830085632.12928-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ulf Hansson <ulf.hansson@linaro.org>,
 Wei Yongjun <weiyongjun1@huawei.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function of_platform_device_create() returns
NULL pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
(cherry picked from commit 7b7de08a14b59d45cc4720bfb21732063ccfc8f6)
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 8bb095ca2fa9..d5acb5afc50f 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -261,9 +261,9 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		struct platform_device *cpdev;
 
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
-		if (IS_ERR(cpdev)) {
+		if (!cpdev) {
 			of_node_put(child);
-			ret = PTR_ERR(cpdev);
+			ret = -ENODEV;
 			goto err_clk;
 		}
 	}
-- 
2.20.1

