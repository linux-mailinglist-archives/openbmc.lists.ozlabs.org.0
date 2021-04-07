Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C41357832
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 01:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG0MV1fb4z3bms
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 09:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GzanO8aq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GzanO8aq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG0MG73wjz2yjM
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 09:04:10 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137MYIvu125393
 for <openbmc@lists.ozlabs.org>; Wed, 7 Apr 2021 19:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=8haG/FQhl3rLLgtF9SDoUlA4oeFUMs1PkywUF7tforc=;
 b=GzanO8aqiNHbMUJOvqbw29tMnPRYXeL9uxZgyyyo6HES2eakT0xJefU5UEjquq0kk4aN
 dWRbNCPY9vPzr2U1cVALMr6ZTiHW6nwdcIA04UseXz5lMvB9ukk4htmAmCNPQJj2CSkB
 RWbJAwgkZeCl6rMXe4l8QiHrQzT+XuGAa6i5hsd3Le64mjemZ/AV0qi1ookHm6nW4X9J
 9U8aGazgsvSWK5EHcDaho4EvK1CWqiRhuzsVJ8sBdokuflS2nrYhC0D6IkIkWOCmRK2U
 SWiPDU7MPEj8Hmffy5ovtuXR4BoGWi2YLqmOUALyyit0fbO0YYkhghjuXHYGZZo8RuoY cg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpk6tbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Apr 2021 19:04:08 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137N0bIR004825
 for <openbmc@lists.ozlabs.org>; Wed, 7 Apr 2021 23:04:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 37rvgs8uer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Apr 2021 23:04:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137N46bo26018234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 7 Apr 2021 23:04:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 225836A054
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 23:04:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CED126A051
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 23:04:05 +0000 (GMT)
Received: from demeter.local (unknown [9.160.113.194])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 23:04:05 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Need help with service-config-manager and socket activated services
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <53032e76-bee4-9f04-231e-762c0c1b8e06@linux.ibm.com>
Date: Wed, 7 Apr 2021 18:04:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qk9JEjhRMmLb6QjVZ1WdKNwhQmqd43KD
X-Proofpoint-GUID: qk9JEjhRMmLb6QjVZ1WdKNwhQmqd43KD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_11:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=613
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104070159
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

We are adding a new function to allow the BMC admin to disable the 
dropbear SSH server [issue 1763][].  This consists of a D-Bus interface 
controlled by [service-config-manager][] and an enhanced Redfish REST API.

We need help to understand how to enhance service-config-manager to work 
with socket activated services such as dropbear.  For example, to 
disable dropbear, is the correct action to perform something like this?:
   systemctl stop dropbear.socket
   systemctl disable dropbear.socket

- Joseph

[issue 1763]: https://github.com/ibm-openbmc/dev/issues/1763
[service-config-manager]: https://github.com/openbmc/service-config-manager

