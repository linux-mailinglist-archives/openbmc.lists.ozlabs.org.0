Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C71125497
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 22:26:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dSjx3f59zDql5
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 08:26:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dShz0WF1zDqkf
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 08:25:22 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBILLLsF061876; Wed, 18 Dec 2019 16:25:19 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyuy3r2u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 16:25:19 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBILMnek028438;
 Wed, 18 Dec 2019 21:25:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 2wvqc6rvfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 21:25:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBILPHuE52560344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 21:25:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD2328059;
 Wed, 18 Dec 2019 21:25:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BE4428058;
 Wed, 18 Dec 2019 21:25:17 +0000 (GMT)
Received: from wrightj-ThinkPad-W520.rchland.ibm.com (unknown [9.10.101.53])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 21:25:17 +0000 (GMT)
From: Jim Wright <wrightj@linux.vnet.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 0/2] hwmon: Add UCD90320 power sequencer chip
Date: Wed, 18 Dec 2019 15:24:44 -0600
Message-Id: <20191218212446.22676-1-wrightj@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_07:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=659 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180163
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
Cc: Jim Wright <wrightj@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for TI UCD90320 power sequencer chip.

Changes since v1:
 - Rebased patch to 5.4
 - Added upstream review tags

Jim Wright (2):
  dt-bindings: hwmon/pmbus: Add ti, ucd90320 power sequencer
  hwmon: Add support for UCD90320 Power Sequencer

 .../bindings/hwmon/pmbus/ti,ucd90320.yaml     | 45 +++++++++++++++++++
 Documentation/hwmon/ucd9000.rst               | 12 ++++-
 drivers/hwmon/pmbus/Kconfig                   |  6 +--
 drivers/hwmon/pmbus/ucd9000.c                 | 39 +++++++++++-----
 4 files changed, 85 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ucd90320.yaml

-- 
2.17.1

