Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C22A02EB9
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 18:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgnL4Hg0z3fTp
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 04:16:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736183759;
	cv=none; b=j5CafUvbecQApFg0TgeNWSjTtZEiSrskGYTuLVxcgH33NuJA8QtkAo+pxEwzlafwR7l+BBdOAkTOy6j9CFF1h/EKnKvUdic1qxGR8ctRezmlcFhO6K3iFD5QvLuYMT7QxLLxx0ront1+i9mh1rFST+xIO01owsNVtGvX0uJ5DZTPJiqiKmJXuOTK/6Cg4h3mNUmxumVSQRP6aOS5Hf1KbJzWSIBONBXoPjSQudpuhoJFDpgBXgCBLCw7kvMWi9FE31Vsg9BOow6OteTWROHgVXG5/9zL8CgelKXPx0hxuXFvm/xzmmJSIwZX0sfY1/uarngvyDc2hj1DetqOkTXu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736183759; c=relaxed/relaxed;
	bh=vRxmj8QfveDDq0WCGBV6oy6wbJ+Ce25EOwCJV1b4D80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPe0WOsZPP6KD93pCKroLv/aUCo+EBthJm7P6Bl+UfVeHCRtAXfMqwHq7WeSkHZAuGcHFq+8dQhNvizSV6xLoQdrCT5XQEBVixYK87iizf/dy+qoQTv1vbuuG+f7wFAjhFeOFXTOA3dw6tJx1UQ+5gt6lryhVe6iL8H5xKwunHaJT+SRi6V4No0refvW5YhsGW7/rrlwHC5IIkR9zm4AnlmoWuufB/EKh86K1FAqeW7Epac8uWrKeeQYl+lkFj6Ccr8LiU68/BSoB2CDFLBnQBphxwTTkCVybmXc4Zxi99CC07zydnO+dg0fz9aXdQcNJcSpp0A6zyr/kqRcIXVTtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=paVmQkYj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=paVmQkYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRgn947jfz30YT
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 04:15:56 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50685XVS025170;
	Mon, 6 Jan 2025 17:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vRxmj8QfveDDq0WCGBV6oy6wbJ+Ce25EOwCJV1b4D
	80=; b=paVmQkYjXW0oRzTGjQLtkm9hotKmf2ch+Jryw5e+2f2LukYyIwTF8AWqW
	/mVjUj2a/XjkRpkI4CYw19DPH1sdFvGyCwUISi6soD0jhuemG4bjOrv1t3GO+Y2T
	4t+kkZbgCoBokJbU/MfNY+FF3PZge4/0W/QG/PWJA9MeeGspCZqNeCG5LrlU/zz6
	ySFfQQACwkkwpzdAmjjEZf4SieNCrg6dPmVUa/cad8mv3J4iBdd5AY4/k5IUhKmt
	OPlj2BKcwGG4JaEoCmj8NrZ+QDR+uOrcCGp9djaNFrLBnhmIjBddVGBoLFeanzVw
	jy67+fhCYq772/wXTWJCU8xkq5qIA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440bc2j80e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506FeDCE027946;
	Mon, 6 Jan 2025 17:15:40 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhjxeuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:40 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506HFd6Q30868048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 17:15:39 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 903FF58054;
	Mon,  6 Jan 2025 17:15:39 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C2D5805F;
	Mon,  6 Jan 2025 17:15:39 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 17:15:39 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v1 0/4] Add support for Intel CRPS PSU
Date: Mon,  6 Jan 2025 11:15:24 -0600
Message-ID: <20250106171530.1063148-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9OU0CMCo5dI4w8uTOFLtdc8XcnjP4sYY
X-Proofpoint-ORIG-GUID: 9OU0CMCo5dI4w8uTOFLtdc8XcnjP4sYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060145
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Ninad Palsule <ninad@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Please review the version 1 of patchset.

This patchset is already applied upstream:
https://lore.kernel.org/linux-kernel/20241217173537.192331-1-ninad@linux.ibm.com

Ninad Palsule (4):
  hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
  hwmon: (pmbus/crps) Add Intel CRPS185 power supply
  dt-bindings: hwmon: intel,crps185: Add to trivial
  ARM: dts: aspeed: system1: Use crps PSU driver

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/crps.rst                  | 97 +++++++++++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 MAINTAINERS                                   |  7 ++
 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/crps.c                    | 74 ++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
 9 files changed, 206 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/hwmon/crps.rst
 create mode 100644 drivers/hwmon/pmbus/crps.c

-- 
2.43.0

