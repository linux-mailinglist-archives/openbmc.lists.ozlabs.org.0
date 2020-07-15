Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC6E2206DB
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 10:16:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B69G113pYzDqjn
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 18:16:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B69DJ5HRrzDqXr
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 18:15:12 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F83Lgx141802; Wed, 15 Jul 2020 04:15:05 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329d9hv3vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 04:15:04 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F84q5m022449;
 Wed, 15 Jul 2020 08:14:59 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 327527v6n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 08:14:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F8EvoN60882946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 08:14:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BA025204F;
 Wed, 15 Jul 2020 08:14:57 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.227.161])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7E4F152050;
 Wed, 15 Jul 2020 08:14:56 +0000 (GMT)
Subject: Re: Redfish HealthRollup/LED question
To: James Feist <james.feist@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, vishwa@linux.vnet.ibm.com
References: <56aeaf07-beb1-22ca-ab54-aa984ea82bf1@linux.vnet.ibm.com>
 <a372f939-e33f-db57-5b46-09b7f8e569ff@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <6d013fd8-04f2-4a2a-5c73-90e65895103c@linux.vnet.ibm.com>
Date: Wed, 15 Jul 2020 13:44:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a372f939-e33f-db57-5b46-09b7f8e569ff@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_05:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=668
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150063
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15/07/20 2:40 am, James Feist wrote:
> On 7/14/2020 4:44 AM, Deepak Kodihalli wrote:
>> Hi James/Gunnar,
>>
>> On IBM platforms, a fault indicator LED associated with a FRU can 
>> indicate the "Health Rollup" status of the FRU. For eg a CPU can be 
>> healthy, but something contained within (eg a core) may be broken, so 
>> the LED will be turned on. I think the Redfish HealthRollup property 
>> is conceptually similar.
>>
>> Question is - do you see a problem if we add code in bmcweb that sets 
>> the HealthRollup property for a FRU if an associated LED is turned on? 
>> I believe this is aligned with 
>> https://github.com/openbmc/docs/blob/master/designs/redfish-health-rolllup.md 
>> (no new D-Bus objects/interfaces being added, etc). On IBM platforms, 
>> a D-Bus association might exist between the FRU and the LED, and 
>> setting the HealthRollup property will be based on this. If the said 
>> association is missing on other platforms, the code will not do anything.
> 
> What changes does this require? I believe this is how the health roll up 
> functions today.

Yes, the bmcweb code around HealthRollup does look up association 
endpoints today already. What I mentioned above might need code changes 
to look at additional association types.

