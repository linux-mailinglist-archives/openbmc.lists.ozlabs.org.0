Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F8279CA6
	for <lists+openbmc@lfdr.de>; Sat, 26 Sep 2020 23:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzMPr6GQdzDqS7
	for <lists+openbmc@lfdr.de>; Sun, 27 Sep 2020 07:30:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=UBbiRYVC; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzMMM6tfqzDqR6
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 07:27:58 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AE0F7806F9;
 Sat, 26 Sep 2020 14:27:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net AE0F7806F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601155676;
 bh=FMA0S+KQ6xw477y6Ya9MCSBUaFQrVfMSfTLa9qLx96I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UBbiRYVC4HCqzJpxGfMium/kbBT/4yHdtsOtOIQyOYrgVtOKu7MeKcEHyUCZeHp3U
 IN1F6vKBE2hsbydwhFDs8m2iDq6aRXw170nYzkazDYCT8PEztKQZhmLbWGMezP5kMn
 o9WZ6otvmIC/lFlI86zXRPY9YlFBGkjK4e/zDpmQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] peci-cputemp: label CPU cores from zero instead of one
Date: Sat, 26 Sep 2020 16:27:34 -0500
Message-Id: <20200926212734.23836-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926212734.23836-1-zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Zero-based numbering is more consistent with all other cpu/core
numbering I'm aware of (including the PECI spec).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/hwmon/peci-cputemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
index b9fe91281d58..78e442f433a7 100644
--- a/drivers/hwmon/peci-cputemp.c
+++ b/drivers/hwmon/peci-cputemp.c
@@ -363,7 +363,7 @@ static int create_core_temp_label(struct peci_cputemp *priv, int idx)
 	if (!priv->coretemp_label[idx])
 		return -ENOMEM;
 
-	sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
+	sprintf(priv->coretemp_label[idx], "Core %d", idx);
 
 	return 0;
 }
-- 
2.28.0

