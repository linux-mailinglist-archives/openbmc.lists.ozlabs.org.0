Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D479445AA53
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 18:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzBPS4qJHz2yp9
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 04:45:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=ODRWsUa3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ODRWsUa3; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzBP22FHGz2xXm
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 04:45:10 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6259C43C92;
 Tue, 23 Nov 2021 17:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1637689503; x=
 1639503904; bh=GmppmzoT9vahQUcY5qoYt+DLLo6wbqzYzXvmXSazhAM=; b=O
 DRWsUa3o8oioC7W0SBmdzRkfDmUQijNNOMWNNHO5SB6a9tZKNzNp1L9OSDo4F03U
 yYCcrltIXz62701FxNRXbdHWhuVfCn5lj/I1m+m6I3Gys2GorslhZCaRcxf9T4x/
 KuEB5JiwgtyPTMoRgPS6D7XFitUThV1YTxncgyq1ZY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrUqdEr7tmnq; Tue, 23 Nov 2021 20:45:03 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2F8964149A;
 Tue, 23 Nov 2021 20:45:02 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 23
 Nov 2021 20:45:02 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] add kconfig for secondary env
 partition
Date: Tue, 23 Nov 2021 20:44:46 +0300
Message-ID: <20211123174446.26011-1-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Backport SYS_REDUNDAND_ENVIRONMENT and ENV_OFFSET_REDUND options from
upstream.
Fix indent for ENV_OFFSET and ENV_SIZE

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 env/Kconfig | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/env/Kconfig b/env/Kconfig
index c41478e362..07e161194a 100755
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -656,15 +656,28 @@ config TPL_ENV_IS_IN_FLASH
 endif
 
 config ENV_OFFSET
-        hex "Environment offset"
-        depends on ENV_IS_IN_EEPROM || ENV_IS_IN_MMC || ENV_IS_IN_NAND || \
-                    ENV_IS_IN_SPI_FLASH
-        help
-          Offset from the start of the device (or partition)
+	hex "Environment offset"
+	depends on ENV_IS_IN_EEPROM || ENV_IS_IN_MMC || ENV_IS_IN_NAND || ENV_IS_IN_SPI_FLASH
+	help
+	  Offset from the start of the device (or partition)
 
 config ENV_SIZE
-        hex "Environment Size"
-        help
-          Size of the environment storage area
+	hex "Environment Size"
+	help
+	  Size of the environment storage area
+
+config SYS_REDUNDAND_ENVIRONMENT
+	bool "Use secondary environment partition"
+	depends on ENV_IS_IN_EEPROM || ENV_IS_IN_MMC || ENV_IS_IN_NAND || ENV_IS_IN_SPI_FLASH
+	help
+	  Used to hold a redundant copy of the environment data. This
+	  provides a valid backup copy in case the other copy is corrupted,
+	  e.g. due to a power failure during a "saveenv" operation.
+
+config ENV_OFFSET_REDUND
+	hex "Secondary environment offset"
+	depends on SYS_REDUNDAND_ENVIRONMENT
+	help
+	  Size of the environment storage area
 
 endmenu
-- 
2.32.0

