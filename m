Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E4725B73
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 12:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbjyf1DS2z3dwF
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 20:20:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=b4TLOcB3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=b4TLOcB3;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbjx23yCLz3bkm
	for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2023 20:18:46 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BABEB162;
	Wed,  7 Jun 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1686133121;
	bh=0TfKAE2mXeDg/EY6rDRVQQvsbIYkCkGyx5BPV2spMFs=;
	h=From:To:Cc:Subject:Date:From;
	b=b4TLOcB37/0nxLpzUUE8WBcCVlpZz09Tysqn0Nd/sY2Q9uLtyvayxJcam+YOjN4AC
	 zccDOktu7kTn3jpE9vkl86sjvHQNeiZDoyIJTcLfPGqxkuGHGOly3HWGI2lOUbqZiE
	 P1JrwuCJs3BRrqSsrF6wgJQIdGht5B+XwXB+PfVk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/2] Nuvoton NCT7362 driver & dt-binding
Date: Wed,  7 Jun 2023 03:18:28 -0700
Message-ID: <20230607101827.8544-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This patch series adds support for the Nuvoton NCT7362 fan/GPIO
controller.  The chip provides 16 pins that can be individually
configured for PWM, tach, or GPIO functionality, and is controlled via
an I2C interface.

There is a sibling NCT7360 chip covered by the same datasheet that's
very similar but only provides 8 fan/tach/gpio pins instead of 16; it
could be supported fairly easily with minor adjustments to the same
driver, but since I don't have an instance of it to test against I've
only implemented support for the NCT7362.

The first patch adds a DT binding, and the second adds a hwmon driver
with optional GPIO support enabled via CONFIG_SENSORS_NCT7362_GPIO.

Thanks,
Zev


Zev Weiss (2):
  dt-bindings: hwmon: Add Nuvoton NCT7362Y binding
  hwmon: (nct7362) Add nct7362 driver

 .../bindings/hwmon/nuvoton,nct7362.yaml       | 123 ++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  18 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/nct7362.c                       | 697 ++++++++++++++++++
 5 files changed, 846 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
 create mode 100644 drivers/hwmon/nct7362.c

-- 
2.40.0.5.gf6e3b97ba6d2.dirty

