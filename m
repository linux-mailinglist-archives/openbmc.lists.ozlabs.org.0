Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1A520C6E
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 05:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky3vt6L3pz3c7R
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 13:50:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky3vZ0vPQz30FR;
 Tue, 10 May 2022 13:49:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24A3a11t015463;
 Tue, 10 May 2022 11:36:01 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 May
 2022 11:49:14 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>, <clg@kaod.org>
Subject: [PATCH v2 0/1] spi: aspeed: Update SPI clock frequency configuration
Date: Tue, 10 May 2022 11:49:07 +0800
Message-ID: <20220510034908.1855049-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24A3a11t015463
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

This patch series aims to update SPI clock frequency
configuration rule and add SPI clock frequency
calculation method for different ASPEED platforms.

This patch is based on [1] and the patch series [2](v7).
[1]: https://github.com/legoater/linux/commits/openbmc-5.15
[2]: https://patchwork.kernel.org/project/spi-devel-general/list/?series=639867

v2: Merge aspeed_spi_hclk_masks[] into aspeed_spi_hclk_divs[].

Chin-Ting Kuo (1):
  spi: aspeed: Update SPI clock frequency config rule

 drivers/spi/spi-aspeed-smc.c | 167 ++++++++++++++++++++++++++++++-----
 1 file changed, 145 insertions(+), 22 deletions(-)

-- 
2.25.1

