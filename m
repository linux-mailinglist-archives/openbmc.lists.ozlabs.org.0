Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A853B5042
	for <lists+openbmc@lfdr.de>; Sat, 26 Jun 2021 23:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GC6Gr2vmDz3c1H
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 07:20:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=esswhwC5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=esswhwC5; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GC6Dr36BHz3081
 for <openbmc@lists.ozlabs.org>; Sun, 27 Jun 2021 07:18:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B915E41374;
 Sat, 26 Jun 2021 21:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1624742327; x=1626556728; bh=NjUXmDvODIG4mmn9yCdR8yIIkg4JaCGdQlL
 QdiV7Hss=; b=esswhwC56BD6DQI4RYH3I+lq2CKEXvwCALxr/AjgYRf7faZDUaS
 wox7jKIvr0Ahw+HoDNMyHO0RZzt5VdHlyOdyTLMsz4hKO95miFIfN/59fQy//+qf
 8NwEIip8P4gWIBbSyCqcKx9Dgv7bo5gtTo/v8ur73C1tApj1TCqGo4k4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dySZJUevoas; Sun, 27 Jun 2021 00:18:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A0452413B4;
 Sun, 27 Jun 2021 00:18:47 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.6) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 00:18:47 +0300
From: Igor Kononenko <i.kononenko@yadro.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 4/6] fms: Support the DVD/BD images size over 2.1Gb
Date: Sun, 27 Jun 2021 00:18:17 +0300
Message-ID: <20210626211820.107310-5-i.kononenko@yadro.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210626211820.107310-1-i.kononenko@yadro.com>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.6]
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
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 Igor Kononenko <i.kononenko@yadro.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds the ability to use the FMS image size greater than 2.1Gb.  This
limitation is due to the maximum number of available frames on the
CD-ROM media.

An incoming implementation of additional media formats (DVD-ROM, BD-ROM)
should support both formats' possible capacity.

End-user-impact: Now, the FMS able to use a medium-image backend  file,
                 which size is more significant than 2.1Gb

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
---
 drivers/usb/gadget/function/storage_common.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
index b883b8b7b05b..468f7622b11d 100644
--- a/drivers/usb/gadget/function/storage_common.c
+++ b/drivers/usb/gadget/function/storage_common.c
@@ -242,15 +242,8 @@ int fsg_lun_open(struct fsg_lun *curlun, const char *filename)
 
 	num_sectors = size >> blkbits; /* File size in logic-block-size blocks */
 	min_sectors = 1;
-	if (curlun->cdrom) {
+	if (curlun->cdrom)
 		min_sectors = 300;	/* Smallest track is 300 frames */
-		if (num_sectors >= 256*60*75) {
-			num_sectors = 256*60*75 - 1;
-			LINFO(curlun, "file too big: %s\n", filename);
-			LINFO(curlun, "using only first %d blocks\n",
-					(int) num_sectors);
-		}
-	}
 	if (num_sectors < min_sectors) {
 		LINFO(curlun, "file too small: %s\n", filename);
 		rc = -ETOOSMALL;
-- 
2.32.0

