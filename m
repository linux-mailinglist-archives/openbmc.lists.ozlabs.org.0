Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 112EB625214
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 05:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7lPH6mMzz3cKr
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 15:01:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FsMeTvbC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FsMeTvbC;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7lKg5wVjz3cC5
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 14:57:59 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BAC86216;
	Thu, 10 Nov 2022 19:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668139074;
	bh=nB2BB1vZMl94/IR136wWGbb6FNzsmP2Ql8lon44MW1g=;
	h=From:To:Cc:Subject:Date:From;
	b=FsMeTvbCPffXoBTcYNlK/4pxrFMe+kuTJolO1ZhywpHGEK0qTe00vwI9HI7CAYAXR
	 M4k5IP70zVY9EZqWOqYy3YScJCStRtppIh9PdYHsZxiGmWdZJCJ95MGHAkE5294ghX
	 6gOQ5tmPKZPq5ftkL6SD7p07d3UxWn1tKs1eVw+I=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 0/7] Delta AHE-50DC OpenBMC kernel support
Date: Thu, 10 Nov 2022 19:57:40 -0800
Message-Id: <20221111035747.31663-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
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

Hi Joel,

This series contains the patches necessary to provide support for the
Delta AHE-50DC Open19 power shelf in the OpenBMC kernel.  Patch 1 is
already in mainline and is included simply to avoid a small merge
conflict; patches 2-4 are in Mark Brown's for-next regulator tree,
patch 5 is a small bugfix that's already in mainline, and patches 6 &
7 are now in your bmc.git repo's for-next tree.


Thanks,
Zev

Guenter Roeck (1):
  Revert "hwmon: (pmbus) Add regulator supply into macro"

Matti Vaittinen (1):
  regulator: Add devm helpers for get and enable

Zev Weiss (5):
  regulator: devres: Add devm_regulator_bulk_get_exclusive()
  regulator: Add regulator-output binding
  regulator: userspace-consumer: Handle regulator-output DT nodes
  dt-bindings: arm: aspeed: document Delta AHE-50DC BMC
  ARM: dts: aspeed: Add Delta AHE-50DC BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 .../bindings/regulator/regulator-output.yaml  |  39 ++
 arch/arm/boot/dts/Makefile                    |   1 +
 .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 418 ++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                   |   1 -
 drivers/regulator/core.c                      |  42 +-
 drivers/regulator/devres.c                    | 230 +++++++++-
 drivers/regulator/internal.h                  |   2 +
 drivers/regulator/userspace-consumer.c        |  60 ++-
 include/linux/regulator/consumer.h            |  29 ++
 include/linux/regulator/userspace-consumer.h  |   1 +
 11 files changed, 780 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts

-- 
2.38.1

