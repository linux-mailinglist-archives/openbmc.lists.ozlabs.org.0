Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAAE577E40
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:04:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbcG5XfKz3c23
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:03:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=X5H7gnPj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=wangmin_phy@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=X5H7gnPj;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhP4q0rcYz2xmL;
	Mon, 11 Jul 2022 22:55:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kYhfT
	TXFSNJd4PzWfDHhsdkZ92TcmmF06NJjVM9JBEU=; b=X5H7gnPjbIYNsWT8BuV/J
	+LNAY4Fdj94fVlmm2F02uT7x0n+urkwZpN1PnmvwyvQTuAKmU297e/8HsYqPRSXG
	ru+81ox0WmH7/4lMAYaWrcSsp2J7KFBm4C3AT6hFEdQ/cGiWSR4fPOaRhhI+r+Gv
	2UhWJI0ypS1zDLNokUKJh0=
Received: from localhost.localdomain (unknown [120.55.36.104])
	by smtp8 (Coremail) with SMTP id NORpCgCHj3NFFsxifBzKHg--.10313S2;
	Mon, 11 Jul 2022 20:23:34 +0800 (CST)
From: wangmin_phy@126.com
To: openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH 0/1] *** Add device tree for Phytium's BMC ***
Date: Mon, 11 Jul 2022 20:23:32 +0800
Message-Id: <20220711122333.385730-1-wangmin_phy@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgCHj3NFFsxifBzKHg--.10313S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx_HUUUUUU
X-Originating-IP: [120.55.36.104]
X-CM-SenderInfo: 5zdqwzhlqb1xb16rjloofrz/1tbiuQY7pVpD92tUFwAAsn
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: liuyongpeng@phytium.com.cn, shuyiqi@phytium.com.cn, wangmin@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Min Wang <wangmin@phytium.com.cn>

*** BLURB HERE ***

Min Wang (1):
  ARM: dts: aspeed: Add device tree for Phytium's BMC

 arch/arm/boot/dts/Makefile                    |   3 +-
 .../boot/dts/aspeed-bmc-phytium-pomelo.dts    | 302 ++++++++++++++++++
 2 files changed, 304 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts

-- 
2.27.0

