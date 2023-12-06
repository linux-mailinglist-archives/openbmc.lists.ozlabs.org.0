Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BE806527
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 03:39:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=dWEZfMYr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlM6v6NPxz3clw
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 13:39:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=dWEZfMYr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlM5J3sYYz2xgp
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 13:37:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9D345B10;
	Tue,  5 Dec 2023 18:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1701830273;
	bh=8cnRJ3qD54g6wIahc0SjLaqepjQHU8iTWXNn1CGElJM=;
	h=From:To:Cc:Subject:Date:From;
	b=dWEZfMYrWIi22dDWehkEDVQ4NsSFWR3LEC6EvPGqZKaovwONb0laO9gjkvNluKYhX
	 qqvmO+C5G0w2ipsO0RtHNuGiPzSXU01sJdeHGEMzrI50u9TGOyPz8FSnXBM6VmyQTh
	 EV+miGJy8iY4G53Rj8KfrnkMwUB5EMYRmY6SADjk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.5 0/4] Add device trees for ASrock E3C256D4I & SPC621D8HM3
Date: Tue,  5 Dec 2023 18:37:36 -0800
Message-ID: <20231206023742.5242-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.0
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
Cc: openbmc@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

These patches add support for the BMCs on the ASRock e3c256d4i and
spc621d8hm3 boards.  All four patches are currently in the 'for-next'
branch of Joel's bmc.git tree.  I used the '-x' flag when
cherry-picking them onto the dev-6.5 branch, but since they're not yet
actually merged into the mainline kernel I suppose it's possible the
upstream commit hashes might still change, so feel free to drop those
tags as preferred.

[Mistakenly didn't CC the list on first send, apologies for the
duplication Joel & Andrew.]


Thanks,
Zev

Zev Weiss (4):
  dt-bindings: arm: aspeed: document ASRock SPC621D8HM3
  ARM: dts: aspeed: Add ASRock SPC621D8HM3 BMC
  dt-bindings: arm: aspeed: document ASRock E3C256D4I
  ARM: dts: aspeed: Add ASRock E3C256D4I BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../aspeed/aspeed-bmc-asrock-e3c256d4i.dts    | 316 +++++++++++++++++
 .../aspeed/aspeed-bmc-asrock-spc621d8hm3.dts  | 318 ++++++++++++++++++
 4 files changed, 638 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts

-- 
2.43.0

