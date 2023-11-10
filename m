Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBEC7E75D2
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 01:18:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bIxkmDzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRKDD5yrDz3cTb
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 11:18:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bIxkmDzU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRKBb6zJBz3byP
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 11:16:55 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1804F424A;
	Thu,  9 Nov 2023 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1699575409;
	bh=42tWH826VKvAT2dauQS9K4LZyI+0lbMQltPjRpw73o8=;
	h=From:To:Cc:Subject:Date:From;
	b=bIxkmDzUaXMI2A2rEuqcYhys26EuWJuJQ3GtT3AuEICckqOIxi4yifocOD8rpFAHt
	 322CaXNQuamA3JT9BaHJe8qx+MUpddKMOG0uGX517hObk8FvktFXoVXgl1CcwF6D40
	 zd7rfIfdFC6UgUpS14JvlIsh/Mn9avDkKXTs2WDY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.5 0/2] watchdog: aspeed: Add aspeed,reset-mask property
Date: Thu,  9 Nov 2023 16:16:35 -0800
Message-ID: <20231110001634.6638-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series is a backport of a couple patches (now merged upstream,
review discussion here: [1]) adding support for controlling what
Aspeed SOC peripherals get resets by the watchdog timer.


Thanks,
Zev

[1] https://lore.kernel.org/lkml/20230922104231.1434-4-zev@bewilderbeest.net/

Zev Weiss (2):
  dt-bindings: watchdog: aspeed-wdt: Add aspeed,reset-mask property
  watchdog: aspeed: Add support for aspeed,reset-mask DT property

 .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
 drivers/watchdog/aspeed_wdt.c                 | 11 +++
 include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h

-- 
2.42.0

