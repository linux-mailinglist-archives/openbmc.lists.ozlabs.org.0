Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18C51CCB6
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 01:26:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvVFh2tXhz3bqR
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 09:26:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JpaK6KYJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JpaK6KYJ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVFK3K69z3050
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 09:26:13 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 03B2E82;
 Thu,  5 May 2022 16:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651793169;
 bh=/Xk4DKaWHUitl1juhvwHhfIvdU91KEzdlhHggT1WDy4=;
 h=From:To:Cc:Subject:Date:From;
 b=JpaK6KYJJ/EgkoQcbkRGEs7Nr3zdqZ9VL0Ibo+U5Ayu00YuiDfkbMFsjvwXmUhTOe
 6VtDNd8pCKi32gCvZYn6KOdJv70Nz6kzUkWmTfBjG+s5iPvnceWR2EKP7wCpD7+Vo+
 jiuXANOBDLN02Eu6nm+jCVKZAMXzXgcK2YgJ5p0o=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 0/2] extcon: Add extcon-regulator driver
Date: Thu,  5 May 2022 16:25:55 -0700
Message-Id: <20220505232557.10936-1-zev@bewilderbeest.net>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This is a restructured v2 of a series adding support for
regulator-supplied power output connectors.

Changes since v1 [0, 1]:
 - Dropped regulator-external-output DT property [Mark]
 - Moved DT binding to connector/regulator-connector.yaml [Krzysztof]
 - Dropped EXTERNAL_GET type and other regulator-core changes

This driver aims to support hardware where a regulator supplies a
power output connector, such as a power outlet on a DC power
distribution unit (PDU).  (The specific system I'm targeting at the
moment is the Delta AHE-50DC Open19 power shelf [2], for which I'm
working on a port of OpenBMC.)

Patch 1 adds the regulator-connector DT binding, with a single
property specifying the regulator supplying the connector's output
power, and patch 2 adds an extcon driver (extcon-regulator).  The
driver currently doesn't actually do much extcon-wise, because the
AHE-50DC hardware is quite minimal and doesn't really offer much for
it to do, but if other similar devices in the future do have
additional functionality to support (such as a presence-detection
mechanism) the driver can be extended to add that.


Thanks,
Zev

[0] https://lore.kernel.org/openbmc/20220504065041.6718-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/20220504065252.6955-1-zev@bewilderbeest.net/
[2] https://www.open19.org/marketplace/delta-16kw-power-shelf/

Zev Weiss (2):
  dt-bindings: connector: Add regulator-connector binding
  extcon: Add extcon-regulator driver

 .../ABI/testing/sysfs-driver-extcon-regulator |   8 ++
 .../connector/regulator-connector.yaml        |  38 +++++
 MAINTAINERS                                   |   8 ++
 drivers/extcon/Kconfig                        |   8 ++
 drivers/extcon/Makefile                       |   1 +
 drivers/extcon/extcon-regulator.c             | 133 ++++++++++++++++++
 6 files changed, 196 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-extcon-regulator
 create mode 100644 Documentation/devicetree/bindings/connector/regulator-connector.yaml
 create mode 100644 drivers/extcon/extcon-regulator.c

-- 
2.36.0

