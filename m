Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 773AA331A7B
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:56:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYc53lwSz3cQH
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:56:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvmvzN75;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZvmvzN75; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYv64zHz30RD
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:26 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128Mc4DI080209; Mon, 8 Mar 2021 17:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OizCEhlJADZ7k7BN0suUoIBsC6pWlbVYXPvwv0OHcT4=;
 b=ZvmvzN750wTNMnLcGG7an8iexkubRqwexzPWYitmi5/qvp0ANQpmXkUukBQJQPDTNQmO
 FEjgY8lLnlnUEx20Y6+QQExI7CBIoFH3gGheyNIK8VoWQrpZ30YLibEKlaWJqWJzXaxj
 wwAti7M09o4IRPqQYQaxNn03NTfR1FKL+HIFbl7n2JMuGkX2V0bMS48G7UbfNxInNV+f
 6croaz0zsgApxur442zab3UXqxYUGzTpKeHgHqywyIP5zuLD1U02R4vCTPnbzR32De9m
 hrfWQCTidFvGY1U1/eQJaJ0e+EFpp7XIagzxB3i3pcd6sN/MJs4LilsOvkRF5Ls+oBAH xQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37577ggg6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MptcM016217;
 Mon, 8 Mar 2021 22:54:21 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3741c9pfuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsKIQ14156176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C02AC605D;
 Mon,  8 Mar 2021 22:54:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A76BC6057;
 Mon,  8 Mar 2021 22:54:20 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 00/35] Rainier and Everest system updates
Date: Mon,  8 Mar 2021 16:53:44 -0600
Message-Id: <20210308225419.46530-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080118
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

This lengthy series updates device trees and drivers for the AST2600
systems Rainier and Everest.

Patches 1-12 update the Rainier device tree. These changes are well
tested.
Patches 13-15 provide some eMMC improvements.
Patch 16 fixes an observed problem on the Tacoma system.
Patches 17-24 update the Everest device tree. These changes are
somewhat tested in simulation and minimally tested on hardware.
Patch 25 adds device trees for the second version of the Rainier
BMC board.
Patches 26-35 are device driver fixes and improvments. Some have
already been accepted in linux-next.

Alpana Kumari (3):
  ARM: dts: aspeed: rainier: Add presence GPIOs
  ARM: dts: aspeed: everest: GPIOs support
  ARM: dts: aspeed: rainier: Support pass 2 planar

Andrew Jeffery (8):
  dt: bindings: mmc: Add phase control properties for the Aspeed SDHCI
  mmc: sdhci: aspeed: Expose data sample phase delay tuning
  ARM: dts: aspeed: tacoma: Add data sample phase delay for eMMC
  i2c: Allow throttling of transfers to client devices
  pmbus: (ucd9000) Throttle SMBus transfers to avoid poor behaviour
  pmbus: (core) Add a one-shot retry in pmbus_set_page()
  pmbus: (max31785) Add a local pmbus_set_page() implementation
  pmbus: (max31785) Retry enabling fans after writing MFR_FAN_CONFIG

Brandon Wyman (2):
  ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
  ARM: dts: aspeed: everest: Add power supply i2c devices

Dylan Hung (1):
  ftgmac100: Restart MAC HW once

Eddie James (7):
  ARM: dts: aspeed: rainier: Add additional processor CFAMs
  ARM: dts: aspeed: rainier 4U: Fix fan configuration
  ARM: dts: aspeed: tacoma: Remove CFAM reset GPIO
  ARM: dts: Aspeed: Everest: Add FSI CFAMs and re-number engines
  ARM: dts: Aspeed: Everest: Add RTC
  hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY platform data flag
  hwmon: (pmbus/ibm-cffps) Set the PMBUS_NO_CAPABILITY flag

Jim Wright (1):
  ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Joel Stanley (2):
  ARM: dts: aspeed: rainier: Mark controllers as restricted
  fsi: scom: Handle FSI2PIB timeout

Matthew Barth (3):
  ARM: dts: aspeed: rainier: Set MAX31785 config
  ARM: dts: Aspeed: Everest: Add max31785 fan controller device
  ARM: dts: Aspeed: Everest: Add pca9552 fan presence

Milton Miller (1):
  net/ncsi: Avoid channel_monitor hrtimer deadlock

PriyangaRamasamy (1):
  ARM: dts: aspeed: Everest: Add I2C components

Vishwanatha Subbanna (6):
  ARM: dts: aspeed: rainier: Add Operator Panel LEDs
  ARM: dts: aspeed: rainier: Add directly controlled LEDs
  ARM: dts: aspeed: rainier: Add leds that are off PCA9552
  ARM: dts: aspeed: rainier: Add leds that are off pic16f882
  ARM: dts: aspeed: rainier: Add leds on optional DASD cards
  ARM: dts: aspeed: rainier: Add leds that are on optional PCI cable
    cards

 .../devicetree/bindings/mmc/aspeed,sdhci.yaml |    8 +
 arch/arm/boot/dts/Makefile                    |    2 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  | 1756 +++++++++++-
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts |  198 ++
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |   14 +
 .../boot/dts/aspeed-bmc-ibm-rainier-v2.dts    |  198 ++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 2411 +++++++++++++++--
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |    3 +-
 drivers/fsi/fsi-scom.c                        |   18 +
 drivers/hwmon/pmbus/ibm-cffps.c               |    2 +-
 drivers/hwmon/pmbus/max31785.c                |   55 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   39 +-
 drivers/hwmon/pmbus/ucd9000.c                 |    4 +
 drivers/i2c/i2c-core-base.c                   |    8 +-
 drivers/i2c/i2c-core-smbus.c                  |  169 +-
 drivers/i2c/i2c-core.h                        |   21 +
 drivers/mmc/host/sdhci-of-aspeed.c            |   65 +-
 drivers/net/ethernet/faraday/ftgmac100.c      |    1 +
 include/linux/i2c.h                           |    5 +
 include/linux/pmbus.h                         |    9 +
 net/ncsi/ncsi-manage.c                        |   18 +-
 21 files changed, 4662 insertions(+), 342 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-v2.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-v2.dts

-- 
2.27.0

