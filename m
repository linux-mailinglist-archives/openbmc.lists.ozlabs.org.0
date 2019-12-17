Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC82123871
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 22:10:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47crPv3KsKzDqM0
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 08:10:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47crMz6fmlzDqQm
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 08:08:31 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBHL7mD7049717; Tue, 17 Dec 2019 16:08:28 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy5xqs6us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 16:08:28 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBHL7xBL050851;
 Tue, 17 Dec 2019 16:08:28 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy5xqs6ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 16:08:28 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBHL6LMV008802;
 Tue, 17 Dec 2019 21:08:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2wvqc6qjfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 21:08:27 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBHL8QY052625866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 21:08:26 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E87AC062;
 Tue, 17 Dec 2019 21:08:26 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EBE7AC05B;
 Tue, 17 Dec 2019 21:08:24 +0000 (GMT)
Received: from [9.81.214.186] (unknown [9.81.214.186])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 21:08:23 +0000 (GMT)
Subject: =?UTF-8?Q?Re=3a_Re=ef=bc=9a_How_can_I_add_a_user_for_openbmc_and_re?=
 =?UTF-8?Q?move_the_default_root_user=3f?=
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
 <4b32b6d0-da99-62c1-52f2-c2a7d4221dec@linux.intel.com>
 <tencent_74FD2ECBC3FF44DE65AAF884C881E0C34D05@qq.com>
 <a0e57fe5-e616-a0c2-a07a-a58407bebdfd@linux.intel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <7ff949ae-3292-09cf-071b-99385232e637@linux.vnet.ibm.com>
Date: Tue, 17 Dec 2019 15:08:22 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a0e57fe5-e616-a0c2-a07a-a58407bebdfd@linux.intel.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_04:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170169
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


On 12/16/2019 7:44 AM, Thomaiyar, Richard Marian wrote:
>
> Delete interface is exposed as part of the user object itself. Sample 
> busctl command to do the delete of an user under phosphor-user-manager
>
> busctl call xyz.openbmc_project.User.Manager 
> /xyz/openbmc_project/user/<username> xyz.openbmc_project.Object.Delete 
> Delete
>
>

I am missing something here.. This does not work for me. I didn't think 
we allowed removing the root user, which is why it is disabled on the 
WebUI? If we do allow deleting the root user, should this be allowed 
from the WebUI?

When sshed as root:
busctl call xyz.openbmc_project.User.Manager 
/xyz/openbmc_project/user/root xyz.openbmc_project.Object.Delete Delete
Call failed: The operation failed internally.

In the journal I see
Dec 17 20:57:56 w37 phosphor-user-manager[220]: userdel: user root is 
currently used by process 1
Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
internally.
Dec 17 20:57:56 w37 phosphor-user-manager[220]: User delete failed
Dec 17 20:57:56 w37 phosphor-user-manager[220]: The operation failed 
internally.


When sshed as an "Administrator" role account,  with the same call:
Call failed: Access denied

NOTE: As an "Administrator" role I can't delete a user using "busctl 
call" only from the Redfish/WebUI, am I able to.

Thanks!
Gunnar
