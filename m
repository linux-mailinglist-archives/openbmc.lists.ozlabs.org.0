Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C33E94C8
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:43:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDc501xVz30Kh
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:43:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pS3afWO7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pS3afWO7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbj33k6z2xZm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXAFJ053403; Wed, 11 Aug 2021 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dnEaOIK3ucRqUYCzLRwopHFD5VYA+pniZrM9y/QQHYk=;
 b=pS3afWO7Y7nANDCmt5G3yCxIjKhrpe8IUnnc9QU4qqj9bmCjQIUF770EB8784XG9d1HG
 K72X9aUw0vK8r8M0ivrO7OUj/kyKdpn3p4fotNavfmAp+PfOUjpIpPi8VH7jKMEccTK1
 WjcbZUmTejUzR/1ygFU6199AKWaPgDV780hUVrxZYmNOhko88QDeBGvvl8KBw4DdMIfl
 RhaGMW4bkocJu7OHCxUyHDRUU0Zrl0bVOJHFf11jT4AebWLMHo8WMlQ1VxzOklkIR8HC
 IM67M32ZCv6R/fkDF3LiJMw67hzvLRxMc8bWLHJxFhlvBxY8lQC/ewKMl+Rx2XomfMFP lg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abvtepf2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:37 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFZ5C3013346;
 Wed, 11 Aug 2021 15:42:35 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3a9htden79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgY3546530942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29F9E6A063;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F26B86A05F;
 Wed, 11 Aug 2021 15:42:33 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 00/14] Rainier and Everest system fixes
Date: Wed, 11 Aug 2021 10:42:18 -0500
Message-Id: <20210811154232.12649-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JH_FBxaul32w0XSRA41dTKzy-1k24kvm
X-Proofpoint-ORIG-GUID: JH_FBxaul32w0XSRA41dTKzy-1k24kvm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 mlxlogscore=723 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110104
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a series of patches that fixes up Rainier and Everest systems.
Some of them are considered workarounds, and are not ready for upstream
linux. Others are simply support for older system hardware that doesn't
need to go to the mainline tree.

Andrew Geissler (1):
  fsi: run clock at 100MHz

Andrew Jeffery (6):
  i2c: Allow throttling of transfers to client devices
  pmbus: (ucd9000) Throttle SMBus transfers to avoid poor behaviour
  ucd9000: Add a throttle delay attribute in debugfs
  pmbus: (core) Add a one-shot retry in pmbus_set_page()
  pmbus: (max31785) Add a local pmbus_set_page() implementation
  pmbus: (max31785) Retry enabling fans after writing MFR_FAN_CONFIG

Eddie James (7):
  ARM: dts: aspeed: Rainier: Add fan controller properties
  ARM: dts: aspeed: Everest: Add fan controller properties
  ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
  ARM: dts: aspeed: Add Rainier 2U and 4U device trees for pass 1
    hardware
  fsi: sbefifo: Increase command timeouts to 30 seconds
  fsi: occ: Add dynamic debug to dump command and response
  fsi: sbefifo: Use interruptible mutex locking

 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  28 +++
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts |  94 ++++++++++
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    |  24 +++
 .../boot/dts/aspeed-bmc-ibm-rainier-p1.dts    |  94 ++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  42 +++++
 drivers/fsi/fsi-master-aspeed.c               |   3 +-
 drivers/fsi/fsi-occ.c                         |  44 +++++
 drivers/fsi/fsi-sbefifo.c                     |  18 +-
 drivers/hwmon/pmbus/max31785.c                |  55 ++++--
 drivers/hwmon/pmbus/pmbus_core.c              |  31 ++--
 drivers/hwmon/pmbus/ucd9000.c                 |  39 ++++
 drivers/i2c/i2c-core-base.c                   |   8 +-
 drivers/i2c/i2c-core-smbus.c                  | 169 +++++++++++++++---
 drivers/i2c/i2c-core.h                        |  21 +++
 include/linux/i2c.h                           |   5 +
 16 files changed, 618 insertions(+), 59 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts

-- 
2.27.0

