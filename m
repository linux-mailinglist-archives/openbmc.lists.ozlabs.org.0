Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF43BFA38
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 14:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLFwD703nz3bmL
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 22:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=rX48V70v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=rX48V70v; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLFtl4ZtWz2ymZ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 22:27:59 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3C5AB49E0E;
 Thu,  8 Jul 2021 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1625747275; x=1627561676; bh=sydz3Wzh06v4Eeyvteb8BKe1aO3dkHHmVlB
 nZAgf59I=; b=rX48V70vvH7obTYJ25Y6gLAXN8NgPH4D81fWvlgRgKCMWwHhpNo
 xuVtOwkmjmodzzs9scTvwBl9OJV2ySJPZvKhHQ5ILqhEO6NeockGMBcx2cJf6HD4
 RCrwjeWx+R+xVBrre7MuWq1n86NZPR/O+AXdduXPv/3Hw7jBvbmCKqDo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPFvq68vkG93; Thu,  8 Jul 2021 15:27:55 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 277CD49F56;
 Thu,  8 Jul 2021 15:18:27 +0300 (MSK)
Received: from fedora.mshome.net (10.199.0.196) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Jul
 2021 15:18:25 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 3/3] net/ncsi: add dummy response handler for Intel boards
Date: Thu, 8 Jul 2021 15:27:54 +0300
Message-ID: <20210708122754.555846-4-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708122754.555846-1-i.mikhaylov@yadro.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.196]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the dummy response handler for Intel boards to prevent incorrect
handling of OEM commands.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 net/ncsi/ncsi-rsp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 04bc50be5c01..d48374894817 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -699,12 +699,19 @@ static int ncsi_rsp_handler_oem_bcm(struct ncsi_request *nr)
 	return 0;
 }
 
+/* Response handler for Intel card */
+static int ncsi_rsp_handler_oem_intel(struct ncsi_request *nr)
+{
+	return 0;
+}
+
 static struct ncsi_rsp_oem_handler {
 	unsigned int	mfr_id;
 	int		(*handler)(struct ncsi_request *nr);
 } ncsi_rsp_oem_handlers[] = {
 	{ NCSI_OEM_MFR_MLX_ID, ncsi_rsp_handler_oem_mlx },
-	{ NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm }
+	{ NCSI_OEM_MFR_BCM_ID, ncsi_rsp_handler_oem_bcm },
+	{ NCSI_OEM_MFR_INTEL_ID, ncsi_rsp_handler_oem_intel }
 };
 
 /* Response handler for OEM command */
-- 
2.31.1

