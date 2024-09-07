Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF5970094
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2024 09:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X14Z27095z3cM4
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2024 17:32:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725694357;
	cv=none; b=j80dL6klXk7LEIlcQDb2odzb/wHeAJ+hOEHXRjr7dCq9BjXg8qfJgU1QnuB/GJryIiE19PjGXOD34EE3D6Y7dmS9zfolDp4UL/7h1DYUkQRB6a/pG5o+j8fnHliwKbeYg89HaMvGDIwbRoV9LDk5cbwiRZT8pbUnXtA4MYwSRFBKNPYa+48sgBokfItBwqND2zstKSY2SIHy3dylyGiv+SwNhAAmlAZwjlWApC+9BCp8jT33TvTyuxjGo6WT6QNz9wYApL/QKWf5lwQA7/DMcrLPdZRlMMKmrzhEomz75CoAlvf/kGdoR2EKjzIgKcw0OZFE2ghEjIN2RIiybgBCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725694357; c=relaxed/relaxed;
	bh=rX81KQHUGSEqEz2QKyT6FzHMJ4cGxuCMFPTkegHxuyY=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Type; b=HLfIEJlQq7HgZlZiBzZv9ZqYxYSrxWAZPZrGGtgg5sRjyuKOmCjlq4QuuU6AvE4rRCcZEiXrw91DVqfZY6OrVFeQdsqUGis/hRIBRvquN758ZvsA9H1PcgAkuXic4RX3KU2NtFM9SPSn7TTvgsrApZZJ78/FfyaOvViAxV1s9wFToxaxaIJts0AwIKfSOjEsxmqgmTqzwhS3WS+/lERk8JNq3HnVHp1um9EP1Lbmm9ZrS8YDCeoc4l+VpNGGE51w+XrX2uPhJJsUlN0rmOu83p9p65/ebWe53rq8aYjQhiCvImFdQK8Gw0lYTZ66ggZ5J4WE07ArY09qh5/xZ64Lfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=KSf9TGV6; dkim-atps=neutral; spf=pass (client-ip=80.12.242.20; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=KSf9TGV6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.20; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1870 seconds by postgrey-1.37 at boromir; Sat, 07 Sep 2024 17:32:35 AEST
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X14Yv28j2z2xJJ
	for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2024 17:32:34 +1000 (AEST)
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mpQXsPTZ8Ne0ImpQYsxdp4; Sat, 07 Sep 2024 09:00:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725692417;
	bh=rX81KQHUGSEqEz2QKyT6FzHMJ4cGxuCMFPTkegHxuyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KSf9TGV69Sur6qViQeAfUSY3LTR3tH7pAHSL7Qa5xvsuvuj0CHN/DmkXDVnmDnJo5
	 jOK5OO3iRLaw8e6FFoRxvQvUCIZws3dCr8BLaO2m6o4K+E+DoVVwlePo4xy+DFwCZ5
	 dslVcbiiV81rD+fY9bJr28wkJj7a9HVfeiApuGl5mQXHhr1bXtQxvbURwHu4FfO7CS
	 6hmJHrubc6zYMPNhcZZ7gwZh6ezlvgXlJvhjgqi+PN34iNJaI75vLUSE71/hNkGvfz
	 f1MmZagPwYTPkPiFkPG8TPN6BNff+Ahu6T1NuwLCt+sJw2JgpMO/xiUSTJN7wL4oDy
	 qEwvhMdrlQAGQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Sep 2024 09:00:17 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH] =?UTF-8?q?peci:=20npcm:=20Constify=20struct=20peci=5Fcont?= =?UTF-8?q?roller=5Fops=E2=80=8B?=
Date: Sat,  7 Sep 2024 09:00:04 +0200
Message-ID: <3c7d455745c2265c19ed02f026dfc9610271d3c2.1725692376.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

'struct peci_controller_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   8003	    784	     48	   8835	   2283	drivers/peci/controller/peci-npcm.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   8003	    776	     48	   8827	   227b	drivers/peci/controller/peci-npcm.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/peci/controller/peci-npcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
index ec613d35c796..fa91be58f6f3 100644
--- a/drivers/peci/controller/peci-npcm.c
+++ b/drivers/peci/controller/peci-npcm.c
@@ -224,7 +224,7 @@ static const struct regmap_config npcm_peci_regmap_config = {
 	.fast_io = true,
 };
 
-static struct peci_controller_ops npcm_ops = {
+static const struct peci_controller_ops npcm_ops = {
 	.xfer = npcm_peci_xfer,
 };
 
-- 
2.46.0

