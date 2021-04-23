Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F33694FF
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 16:43:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRcVY713Nz3bTL
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 00:43:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pINgBvxH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pINgBvxH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcVK58zkz2yR6
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 00:43:37 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NEZAXS015780; Fri, 23 Apr 2021 10:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=pgloV6i57pI2Zsj5GzGsSCb9XaAAXQ2i4i6vk8lGkaM=;
 b=pINgBvxHHDom3xvmJ+uTcgHNYP/eFsXEJ+gj82nrJA4oNvNDqIP5Gq4Ectr8hn8BGmVT
 10HcGL6LKvgDjqtF4Mwr+5ciiuGO9m3NTG7uz//08GxJrptpLtZ8XFomlqgGEIz8FubY
 mhitPp3OkVhZMFRCUDmKEgC7AyoR2Eeh/sJ8IyEPRTKoTGJIY/NGy8es1QFjBUDASsPa
 aLU2fx2YjfgHyPcOjVc/Sp7bMRwEOo1Ep1F5C1NjIhrzErxcZ5Ls+ZJtz5OESp9T4/xw
 B5QJQ44jO480koSwUiqJO6q6XjFDHCeFtfyOjdTK/l9YqWd242CzCJpBFav0mk/qiRiT WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ywt8q7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 10:43:31 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13NEZmge020224;
 Fri, 23 Apr 2021 10:43:31 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383ywt8q7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 10:43:31 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NEYARt020631;
 Fri, 23 Apr 2021 14:43:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 37yqab5sf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 14:43:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NEhTG831719750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 14:43:29 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80C736A047;
 Fri, 23 Apr 2021 14:43:29 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB7436A057;
 Fri, 23 Apr 2021 14:43:26 +0000 (GMT)
Received: from [9.206.158.16] (unknown [9.206.158.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 14:43:26 +0000 (GMT)
Subject: Re: Redfish Firmware Update: Host server actions required; PSU, BIOS,
 etc
To: "Giles, Joshua" <Joshua.Giles@dell.com>, Ed Tanous <edtanous@google.com>
References: <DM6PR19MB35615E928676F78225B4385595459@DM6PR19MB3561.namprd19.prod.outlook.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <bf864cd3-bea6-3e1c-e3f5-084b4831387a@linux.vnet.ibm.com>
Date: Fri, 23 Apr 2021 08:43:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <DM6PR19MB35615E928676F78225B4385595459@DM6PR19MB3561.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LCf8pAYMo_NXu5xtbGnUW1pdp1b5Pj7N
X-Proofpoint-ORIG-GUID: 3QD366avaBfV48NSFOiL2k7N4rmzfLNb
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_07:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230095
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>, "Rao,
 Balaji B" <Balaji.B.Rao@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/23/2021 8:23 AM, Giles, Joshua wrote:
> Hello All,
> 
> Is there a plan/proposal for Redfish Firmware Updates (UpdateService/SimpleUpdate) that require host server actions?
> 
> For example, some vendor(s) may require the host be booted/rebooted in order to complete?

"ApplyTime" is how we determine when the update will be applied.
https://github.com/openbmc/phosphor-dbus-interfaces/blob/32304979b404c24e32f195d08c667e65b9b34695/xyz/openbmc_project/Software/ApplyTime.interface.yaml#L12

https://github.com/openbmc/docs/blob/f58df4f13cfcc67ef901cd3979ef7dd47da59dab/REDFISH-cheatsheet.md#firmware-applytime

That should all be supported today.
https://github.com/openbmc/bmcweb/blob/8d1b46d7f8d39db2ba048f9e9007106ca3a28c9b/redfish-core/lib/update_service.hpp#L576
