Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759C5128CD
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 03:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdLm2nhlz3bhQ
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 11:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DPXv6L82;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DPXv6L82; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpdK05d26z3bdB
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 11:27:32 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EFB171B3;
 Wed, 27 Apr 2022 18:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651109250;
 bh=A1Z73Wico87e026F2N4Y7a2Kb+H2CHDRz2kb7e46jU4=;
 h=From:To:Cc:Subject:Date:From;
 b=DPXv6L82Dify6oPeSv02IxzMqu3IqbenHRyjyVcaV8L/a1rJktzBHDxbX1V+D42yw
 bkTvGM5X57skuUnxpVeE8H8C0AtQiKOmzHNrRTUITsuw1bYQXiwhublcc59H+FyFNc
 J98XX6PXdFNtdMRh8h2As4wApB9RN7RoRlCUuDsI=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v5 0/2] hwmon: (nct6775) Add i2c driver
Date: Wed, 27 Apr 2022 18:27:05 -0700
Message-Id: <20220428012707.24921-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series contains the remaining two outstanding patches adding i2c
support to the nct6775 hwmon driver.

Changes since v4 [0]:
 - Added missing type $ref to nuvoton,tsi-channel-mask property in DT
   binding [Krzysztof, Rob's bot]
 - Added 'F:' line for nuvoton,nct6775.yaml DT binding file to
   MAINTAINERS

The first patch adds a DT binding for the Nuvoton Super I/O chips
supported by the nct6775 driver; the second adds an i2c hwmon driver
wrapped around the new nct6775-core module.

(Since the preparatory work for this that comprised the bulk of the
previous iterations of the series is now in Guenter's hwmon-next tree
this is a somewhat abridged cover letter; see [0] for additional
background info if needed.)

[0] https://lore.kernel.org/linux-hwmon/20220427010154.29749-1-zev@bewilderbeest.net/

Zev Weiss (2):
  dt-bindings: hwmon: Add nuvoton,nct6775
  hwmon: (nct6775) Add i2c driver

 .../bindings/hwmon/nuvoton,nct6775.yaml       |  57 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  17 ++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct6775-i2c.c                   | 195 ++++++++++++++++++
 5 files changed, 277 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 create mode 100644 drivers/hwmon/nct6775-i2c.c

-- 
2.36.0

