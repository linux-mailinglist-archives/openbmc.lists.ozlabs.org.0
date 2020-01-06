Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC61318E8
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 20:53:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s5m215dbzDqGv
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 06:53:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s5kz6m0VzDqG0
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 06:52:27 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006JqKUD022738; Mon, 6 Jan 2020 14:52:23 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb924nkye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 14:52:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006Jo8rZ020925;
 Mon, 6 Jan 2020 19:52:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2xajb6a2cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 19:52:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006JqKLj41746778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 19:52:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BB2A124053;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 148E1124052;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 19:52:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 0/3] hwmon: (pmbus/ibm-cffps) New debugfs
 entries, VMON, and LED fix
Date: Mon,  6 Jan 2020 13:52:16 -0600
Message-Id: <1578340339-15125-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_06:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=626 priorityscore=1501 suspectscore=1 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060165
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

Add a few features to the IBM PSU driver. Fix the LED behavior that I recently
changed due to misunderstanding some user requirements.

These were just accepted by Guenter to linux-next.

Eddie James (3):
  hwmon: (pmbus/ibm-cffps) Add new manufacturer debugfs entries
  hwmon: (pmbus/ibm-cffps) Add the VMON property for version 2
  hwmon: (pmbus/ibm-cffps) Fix the LED behavior when turned off

 drivers/hwmon/pmbus/ibm-cffps.c | 89 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 10 deletions(-)

-- 
1.8.3.1

