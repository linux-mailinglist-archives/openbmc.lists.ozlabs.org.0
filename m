Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3E26ADC6
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:40:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYVJ3468zDqSd
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:40:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MZJMafWj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYTL0DJ6zDqRh
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:39:33 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FJXUpx145802; Tue, 15 Sep 2020 15:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=KIctkxLbgtEgZd2jX7V1WTbBLGvqLtTae3SljR+f/I4=;
 b=MZJMafWjTLYRgSaJVOpIWdzwTycIN5lc0yvMZYasC3sglv+E+yAGTHj0IUWpppXEzM99
 76/hn2VmWPh0L2CaBTgW7oVAhL1VMT/Qb+ZXJ/mS70gY8i3iAwzI+mTO1D2c2wObUrlq
 ao6jgg68wfThPPImI04gM7nmlnwpghjmoTnxtBpSTZhxtWF5GcDrX0q6ZL8mrqy5rHYk
 kYrQAmBhfoxFAv2csVplLhZ6k249W7QyUmFmto/UyqC7Vlp6zXvFKn4zN24mVJvTRVaH
 417vKO/R3+M1vLrP1FjGFrEN3Dp07MYD6gHTYW+Rg0RIKjcJ6pFwfQVtnwXFr8hUqEqn xQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33k38jh3qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 15:38:28 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FJWY1M008664;
 Tue, 15 Sep 2020 19:38:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 33gny9g8kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 19:38:28 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08FJcRTg48496954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 19:38:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6605C124053;
 Tue, 15 Sep 2020 19:38:27 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28219124052;
 Tue, 15 Sep 2020 19:38:27 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Sep 2020 19:38:27 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Enhance Redfish to allow IPMI users
To: openbmc <openbmc@lists.ozlabs.org>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <ad18636c-c817-c5c6-5d17-a41d137f56d7@linux.ibm.com>
Date: Tue, 15 Sep 2020 14:38:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=635
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150152
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


I am working on a new feature so the BMC admin can use Redfish 
operations to allow or deny specific users to use the BMC's network IPMI 
interface.
The goal is to be able to configure the BMC out of the box with no users 
authorized to use the IPMI network service, and then as needed enable 
network IPMI and allow specific users to use that service.

The direction for this seems to be adding the IPMI enum to the 
ManagerAccount AccountTypes array.
https://redfishforum.com/thread/219/account-groups-property?page=1&scrollTo=1289

If we had this, the BMC admin could allow someuser to use IPMI like 
this: PATCH /redfish/v1/AccountService/Account/someuser with 
{AccountTypes: [...,IPMI,...]} and possibly also changing the password.

Would this work with OpenBMC phosphor user management?  The forum thread 
has additional considerations.  Will the IPMI maintainers please comment 
here or on the forum?

- Joseph

