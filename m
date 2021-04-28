Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182736DFA1
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 21:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVppf1LCdz2yys
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 05:38:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VI102ZSU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VI102ZSU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVppP0P9Fz2yZL
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 05:38:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SJX97M135489; Wed, 28 Apr 2021 15:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QEo/S0GBVjScPzCPWg6wvDUgEAPGkLxkzIvQPUtL2s8=;
 b=VI102ZSU0ztx7/TBR6jNmbCo07SnNDX0mS3Yn5YkGwc3zG1AnCrc+X/pDBdKp9OT+Cf9
 So080+LD7LHklmT4I0k0KNuKYD81uthMuh323gZPjLyOjeBXZ9R8vhTJxw2N8+VoMZE5
 0glNZNvhrztdGVQuq2UehH4R0IhIcv0xNV1xscUucwwtJMzY4Fhg/oqmEOKgjF/Osb38
 6FLwLs9iin2KZD++lnz3h4HpcmKQtgfpRzU6wfZjrDZRp0CpsqGipBuE2roB70pjzylI
 4jCO75ZPVJDd1uvb85vKlohX4BEs2+r+g9D4PLNiM4TKla7IUTMxEAT4hlkWjQrJ6C4g aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387byb3bms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 15:38:32 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SJX9Nd135441;
 Wed, 28 Apr 2021 15:38:32 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387byb3bm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 15:38:31 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SJc2Gt007158;
 Wed, 28 Apr 2021 19:38:30 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 384ay9f2jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 19:38:30 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SJcUw828115316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 19:38:30 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D5C56A04D;
 Wed, 28 Apr 2021 19:38:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1846C6A047;
 Wed, 28 Apr 2021 19:38:27 +0000 (GMT)
Received: from [9.206.162.87] (unknown [9.206.162.87])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 19:38:27 +0000 (GMT)
Subject: Re: Move Inventory.Item.Board from Redfish Chassis to Redfish Assembly
To: Ed Tanous <edtanous@google.com>
References: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
 <CAH2-KxD1kB25nYADKzJ9rCb0+fu1mWKiQ_KMQ9nRvvi7ids_4w@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <d181d1f7-7e9a-2f2e-edaa-3bdafef1277e@linux.vnet.ibm.com>
Date: Wed, 28 Apr 2021 13:38:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <CAH2-KxD1kB25nYADKzJ9rCb0+fu1mWKiQ_KMQ9nRvvi7ids_4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TxFYf0qc0dzC4fFHSzE_mT_5adI88JXv
X-Proofpoint-GUID: ZulZ50PBeEQRbwqIdrGuoXPIHOLS-mBn
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_13:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280125
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Derick <derick.montague@gmail.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/28/2021 10:46 AM, Ed Tanous wrote:
> On Wed, Apr 28, 2021 at 9:18 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>>
>>   From some discussion on Discord a few weeks ago. A newer way of
>> thinking in Redfish is for a simple rack server to just have one Redfish
>> Chassis and things like boards modeled as Redfish Assemblies under the
>> Chassis.[1][2] Today we look for inventory item chassis and inventory
>> item board[3] to populate the Chassis collection.[4] I propose we move
>> the "Inventory.Item.Board" from Redfish Chassis to Redfish Assembly.
>> Does this break anyone?
> 
> This will definitely break people, given that sensors can be attached
> to boards today, and (unless I'm mistaken) Assemblies don't have their
> own sensors.  Is there a solution to the sensor issue baked into this
> proposal?

Looking at the documentation on the sensor associations[1],
the bmcweb code, and association code[2] (e.g. [3]) sensors all look to 
be associated with an inventory item chassis today for Redfish Chassis 
<-> sensors. If there are sensors associated to boards with the 
"chassis" association ("all_sensors" is the reverse association), they 
would need to be moved to an inventory item chassis. I don't see any 
though unless I missed something.

[1]https://github.com/openbmc/docs/blob/919a7b6816a5f16aa72d298e81e0756d95d5031e/architecture/sensor-architecture.md#association-type-1-linking-a-chassis-to-all-sensors-within-the-chassis

[2]https://github.com/search?q=org%3Aopenbmc+all_sensors&type=code

[3]https://github.com/openbmc/openbmc/blob/c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64/meta-quanta/meta-gbs/recipes-phosphor/inventory/phosphor-inventory-manager/associations.json#L389
