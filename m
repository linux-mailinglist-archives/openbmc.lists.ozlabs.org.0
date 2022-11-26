Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D6639F23
	for <lists+openbmc@lfdr.de>; Mon, 28 Nov 2022 02:59:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL7v706Psz3dvH
	for <lists+openbmc@lfdr.de>; Mon, 28 Nov 2022 12:59:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhengyongjun3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJwgn1kvlz3cKv;
	Sat, 26 Nov 2022 13:30:26 +1100 (AEDT)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NJwfx11zxzRpXl;
	Sat, 26 Nov 2022 10:29:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 26 Nov
 2022 10:30:18 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] media: aspeed: Fix return value check in aspeed_video_debugfs_create()
Date: Sat, 26 Nov 2022 02:28:13 +0000
Message-ID: <20221126022813.57372-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Nov 2022 12:57:47 +1100
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
Cc: andrew@aj.id.au, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In case of error, the function debugfs_create_file() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
v2:
- change return error code from ERR_PTR to PTR_ERR.
 drivers/media/platform/aspeed/aspeed-video.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 20f795ccc11b..0113e6bc836f 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1780,10 +1780,12 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
 	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
 					    video,
 					    &aspeed_video_debugfs_ops);
-	if (!debugfs_entry)
+	if (IS_ERR(debugfs_entry)) {
 		aspeed_video_debugfs_remove(video);
+		return PTR_ERR(debugfs_entry);
+	}

-	return !debugfs_entry ? -EIO : 0;
+	return 0;
 }
 #else
 static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
--
2.17.1

