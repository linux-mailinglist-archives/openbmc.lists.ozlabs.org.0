Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FA1C32F0
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 08:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FtK84dyXzDqWT
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 16:30:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FtJM40MVzDqCX
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 16:30:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04461nMV020478; Mon, 4 May 2020 02:30:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s1svaswb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 02:30:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0446Kk0V071071;
 Mon, 4 May 2020 02:30:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s1svasvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 02:30:01 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0446TO8L009987;
 Mon, 4 May 2020 06:30:00 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30s0g5m440-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 06:29:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0446TvDq54067208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 06:29:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF2484C04A;
 Mon,  4 May 2020 06:29:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F374C046;
 Mon,  4 May 2020 06:29:56 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.232.237])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 06:29:55 +0000 (GMT)
Subject: Re: OpenBMC 2.8 Release
To: Andrew Jeffery <andrew@aj.id.au>, Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Kurt Taylor <kurt.r.taylor@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, Joel Stanley <joel@jms.id.au>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
 <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
Date: Mon, 4 May 2020 11:59:55 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_02:2020-05-01,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040048
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

On 04/05/20 10:43 am, Andrew Jeffery wrote:
> 
> 
> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>>> just add it directly here:
>>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
>> Added:
>>   * Yocto refresh to "Dunfell" version 3.1
>>   * Redfish support for: full certificate management, complete LDAP
>> management, full sensor support, event service schema, task schema
>>   * Move to Redfish Specification 1.9.0
>>   * Redfish support for 2019.4 Schemas
>>   * GUI enhancements: LDAP, certificate management
>>
>> And removed "`Redfish configuration backup and restore function`".
>> James, Jason are you okay with the Redfish list above? Should we add
>> something about Storage & Drives? Anything else?
>>
>> Should we add something about the Kernel? "Move to 5.4"?
>>
>> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM
>> Support" and "Partial MCTP Support".
> 
> Certainly MCTP support is still "Partial". Slowly progressing with help from
> Intel.

Same goes for PLDM. There's definitely more PLDM specs and commands 
implemented in libpldm since the 2.7 release though.

> Andrew
> 

