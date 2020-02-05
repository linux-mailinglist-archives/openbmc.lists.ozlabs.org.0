Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F031534F7
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 17:06:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CRJw5ZzhzDqS2
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 03:06:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CRJB337mzDqL8
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 03:06:17 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 015Fxwm4019010
 for <openbmc@lists.ozlabs.org>; Wed, 5 Feb 2020 11:06:14 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xym4mt44e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 11:06:14 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 015G645F017449
 for <openbmc@lists.ozlabs.org>; Wed, 5 Feb 2020 16:06:13 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2xykc9f9t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 16:06:13 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 015G6C0E53215496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 5 Feb 2020 16:06:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 963AF112061
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 16:06:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79D5B112063
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 16:06:12 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 16:06:12 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Security Working Group meeting - Wednesday Feb 5
Message-ID: <6cfb1c25-14b6-ca76-b917-3bda22ff1ce1@linux.ibm.com>
Date: Wed, 5 Feb 2020 10:06:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_04:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002050123
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday Feb 5 at 10:00am PDT.

We'll discuss current development items, and anything else that comes 
up.  The current topics:

1. Moving forward with security assurance work at the OpenBMC project 
level.  ("How do we know what is most important to work on?")  Review 
steps forward.

2. BMCWeb intermediate site identity certificates.

3. BMCWeb account management privilege changes (following the latest 
Redfish spec) allow account enumeration.

4. BMCWeb address CWE-307 (unlimited password guessing) via 
rate-limiting authentication attempts.

5. Discuss progress in setting up an alternate meeting time.

Access, agenda, and notes are in the wiki:

https://github.com/openbmc/openbmc/wiki/Security-working-group

- Josep

