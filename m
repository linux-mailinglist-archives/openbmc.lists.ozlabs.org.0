Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D0205A17
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 20:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rvKG2n5jzDqVn
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 04:03:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rvJX3jh3zDqVn
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 04:02:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NHXMCo051290; Tue, 23 Jun 2020 14:02:48 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uk64xbdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 14:02:48 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NHk7NO026402;
 Tue, 23 Jun 2020 18:02:47 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 31uk4f9e3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jun 2020 18:02:47 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05NI2in011403750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jun 2020 18:02:44 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB9613605D;
 Tue, 23 Jun 2020 18:02:46 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FD9A13604F;
 Tue, 23 Jun 2020 18:02:45 +0000 (GMT)
Received: from [9.80.216.198] (unknown [9.80.216.198])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jun 2020 18:02:45 +0000 (GMT)
Subject: Re: Message registries continuation
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
 <bf459022-2ff9-e596-6c7d-25717a0efe43@linux.ibm.com>
 <5d7fba06-b5fd-2fce-d05e-7f2b99069a2e@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <c24ff8ab-a12f-5137-368c-0dfd9bccc15b@linux.ibm.com>
Date: Tue, 23 Jun 2020 13:02:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5d7fba06-b5fd-2fce-d05e-7f2b99069a2e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_11:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006120000
 definitions=main-2006230123
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 6/22/2020 4:16 PM, James Feist wrote:
> On 6/22/2020 1:46 PM, Matt Spinler wrote:
>> Hi James,
>>
>> Something I forgot below - when building up our event logs, I have 
>> about a dozen fields (mostly OEM)
>> that I have to get from the OpenBMC event log's corresponding PEL 
>> (IBM's enterprise log format).
>>
>> PELs aren't on D-Bus for a few reasons, such as they can be several 
>> KB in size and consist of several
>> dozen discrete fields, so that rules out bmcweb getting them that way.
>
> Would doing something like having the fields in the journal with a 
> link to a file work? See this design for more info: 
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md
>

I forgot to mention that this would use the existing D-Bus based event 
log code, and just add new fields
to those responses.  At  this point, I don't think I can use the journal 
because I need to ensure the lifetime
of the errors matches that of the event logs on D-Bus and the PELs 
themselves.

>>
>> I do have a shared library that has the PEL APIs I need (PELs 
>> themselves are in files). Is it OK if I
>> just link in that library as needed when a USE_PELs or whatever 
>> option is set?
>> Alternatively, I could also dlopen it I suppose.
>
> There's another thread over here 
> https://lists.ozlabs.org/pipermail/openbmc/2020-June/022082.html 
> happening right now discussing types of logging. As we already have 2 
> forms of logging supported, I'm a little hesitant to the idea of a 
> third without at least some formal direction of what we want logging 
> to look like as a project. More so as we add advanced features on top 
> of logging, it makes it more difficult to support different methods.
>

This would just be an enhancement to the 2nd form that exists today, the 
D-Bus based one, but yea, I can
wait and see how that thread shakes out.


>>
>> Just trying to avoid a surprise during review.
>>
>> Thanks
>>
>

