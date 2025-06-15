Return-Path: <openbmc+bounces-229-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB3ADA4A4
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:23:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jv2Zdyz3bb2;
	Mon, 16 Jun 2025 09:21:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960222;
	cv=none; b=CmVwBrmd6/WG31i/hQ1Khr026noOWZpPMstLksYc98D2Dt/U9PUylvRctEQa4paYJuS1InVOYq+5JfiA1etaLvgLdRaDItAwg0uVajMW5GJhFUZS4z1jII98MLEBRTi/00M6bWx9msOY4CHujHA3mUC885DiMh6LtIu6MgBneF3KUyXE6FUCuxjSQqme8qf3+h/kgM6usDiIhF7iGCEW7YOzK6rBbOV2URhclX7fgx1I9XSkbfs0Zj5e7rRkmL64L4GRwYNRP9IKlG7Vc9ryNt0ssbjHCJ92Sc2VdOJvl1deP9ytuEsPX3xKqUdK/ie3n4musO7eV9qK+pKosy0mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960222; c=relaxed/relaxed;
	bh=y/AUNQnm7BznYAVMzOtTQX8NgYTNjyMXwi3FRym/v80=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dYIlVUFFako7kdkGF5rbni3klNIMsfxJDSGqqSMOfluBZ2ckfelb/9WKKWP10NdboRaj+gUHivv76Ly4Nxutl3xdLjeapMRMiLWk4qPSDIJimtdQHdOck6Z0WqfeT7MJb9I6hVXqLk/b5WswNU0c3Z64XZI/6i5u59lOEaUrHfFor2P4eoEbRMk/sYoV5R8w0sO/OuFwIlCCqog2a5olfVUKkzoWsWrFknIuhPwATcBLUz0BpJvy9uBZhukCmoGzKOIs4jAO9SPhH8wS2/r/RaOl2uHscSOBen+BW0SzuF/GdMVDzAS1FLzGw65W+s1PR8rAAhEYy2K7UTBZBDE0AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 317 seconds by postgrey-1.37 at boromir; Sun, 15 Jun 2025 14:03:40 AEST
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfd85Hs0z30Pg;
	Sun, 15 Jun 2025 14:03:40 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:03 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:03 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/8] Aspeed SDHCI driver workaround and auto tune
Date: Sun, 15 Jun 2025 11:57:55 +0800
Message-ID: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The purpose of this patch series is to workaround that the
Aspeed SDHCI software reset can't be cleared issue, and to add runtime
tuning and sdr50 support. The runtime tuning is to improve the
compatibility of the sdhci driver with different MMC cards.

Cool Lee (8):
  mmc: sdhci-of-aspeed: Fix sdhci software reset can't be cleared issue.
  mmc: sdhci-of-aspeed: Add runtime tuning
  mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register missing after top
    reset
  mmc: sdhci-of-aspeed: Get max clockk by using default api
  mmc: sdhci-of-aspeed: Fix null pointer
  mmc: sdhci-of-aspeed: Add output timing phase tuning
  mmc: sdhci-of-aspeed: Remove timing phase
  mmc: sdhci-of-aspeed: Add sdr50 support

 drivers/mmc/host/sdhci-of-aspeed.c | 370 ++++++++++++++---------------
 1 file changed, 183 insertions(+), 187 deletions(-)

--
2.34.1

