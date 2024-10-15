Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9899FB80
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 00:41:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSpx55LQrz3cR1
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 09:41:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728957523;
	cv=none; b=iuQ7n6LbWgnNVz+178nWW1hssadzWPUJRM1JmzYxawGL5AWL5LfkToSWTdznaG+m20ZqEWs8KkBpVWaVAKN/ft1Xe+hcG/7+83llRos+r3G+wjtwv0SRbZLL0eqJFH/9DxjNWDY0SIpLOnF+Q8SvP7dYbGbeplDH6dYHk1YvU1uRdFnOCtM8RZdsunJJy4EzZ6srZHriREe8uQJC93M9f1rKRVwS1xC1zdYFXJ7OSWWfl5InjeLC0CZe0WwLSJXJBeD0VbNPWLcfxpMpyibXk41GLDiEi26MlLQp4MAfoATdKGiVNwlCxRTMS0X2XHCB98lm3F9QYW78F6Tr5r6H6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728957523; c=relaxed/relaxed;
	bh=vhG7EBo5jHzNmtTPHumpTWglA1WohKGxsS7zfymcdDw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XQqOZRhehrHwsm7v94KenztQApt9+yFBYT3pu1AEQNEBDt8aGOakWfImsfT4+LwezjAx1OFH3Zt4zMvmJsE5JBjXWdliXCRUw6Qrhj4XINgRg5lECcg1pDPf0V03noHQk2VntzazOz5PlXBCl4L9uxp/QZmvZmluDIzbqA1MDZOU8xejI7qqR9/53oU/PRYrG1dxwLLGAfjaoCvJ0POqDOqzcyepk167Z5bOd/5yv2vSAlzIxGWrpWbDCCCu60I36oNAqWH9ryD6i4WC2qY8hp/aVZI1AEJX30zRk8Gn3kgtLOtRcNIFWVu9QgBdOq9jmUpr7BNObqzOOINAkllhcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=thunder.leizhen@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=thunder.leizhen@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 965 seconds by postgrey-1.37 at boromir; Tue, 15 Oct 2024 12:58:41 AEDT
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSHM540v3z3c00
	for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2024 12:58:38 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XSGxV33VbzfdCN;
	Tue, 15 Oct 2024 09:39:58 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id CFB4C1400D5;
	Tue, 15 Oct 2024 09:42:24 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Oct 2024 09:42:24 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] media: nuvoton: Fix an error check in npcm_video_ece_init()
Date: Tue, 15 Oct 2024 09:40:53 +0800
Message-ID: <20241015014053.669-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf100006.china.huawei.com (7.185.36.228)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 16 Oct 2024 09:41:27 +1100
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When function of_find_device_by_node() fails, it returns NULL instead of
an error code. So the corresponding error check logic should be modified
to check whether the return value is NULL and set the error code to be
returned as -ENODEV.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 60fbb91400355c2..db454c9d2641f8f 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1667,9 +1667,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		dev_info(dev, "Support HEXTILE pixel format\n");
 
 		ece_pdev = of_find_device_by_node(ece_node);
-		if (IS_ERR(ece_pdev)) {
+		if (!ece_pdev) {
 			dev_err(dev, "Failed to find ECE device\n");
-			return PTR_ERR(ece_pdev);
+			return -ENODEV;
 		}
 		of_node_put(ece_node);
 
-- 
2.34.1

