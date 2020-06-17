Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B121FD151
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 17:53:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n8jt49k0zDr02
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 01:53:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n8hz72qVzDqpM
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 01:52:34 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HFc0tH053775; Wed, 17 Jun 2020 11:52:28 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q6hw06a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 11:52:26 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05HFndOZ001835;
 Wed, 17 Jun 2020 15:52:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 31q8rybpvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 15:52:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05HFqLlO18743696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jun 2020 15:52:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 845946A047;
 Wed, 17 Jun 2020 15:52:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3312B6A04D;
 Wed, 17 Jun 2020 15:52:21 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.160.48.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jun 2020 15:52:20 +0000 (GMT)
Subject: Re: Patch for telemetry design
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8428bc15cb234328a6148d47eb2581c6@intel.com>
 <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
 <4a96dba004a84736b45771afbc68d35d@intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <938febf8-0456-8193-9d31-28ebf5c6c649@linux.vnet.ibm.com>
Date: Wed, 17 Jun 2020 10:52:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4a96dba004a84736b45771afbc68d35d@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_06:2020-06-17,
 2020-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 cotscore=-2147483648 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006170118
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


Hi Piotr,
    Thanks for the updates here.

On 6/17/20 6:08 AM, Matuszczak, Piotr wrote:
> Hi Justin,
> 
>> I've taken a read through the design proposal as more of a client of the telemetry data. I like this proposal quite a bit as it is pretty clear. I had a couple of >questions and given the broad level, I wasn't sure if gerrit was the right place for them.
> 
> In fact, this patch is covering few changes that we've made to D-Bus API during the development and integration.
> 
>> On Timestamps, are the timestamps done per metric(sensor reading) or per report. This wasn't clear to me from the design proposal, and also it was hard to >tell where the timestamp was being set.
> 
> Timestamps are gathered for both, metrics and report. Timestamp for metric is the timestamp of D-Bus senor update, while timestamp of the report is for the report update. It corresponds with the Redfish Metric Report resource, where both, individual metrics and the whole report have their update timestamps.

This is good news! On the metric Timestamps, is the timestamp set at the 
time of reading (HWMON/otherapps) or is it set by the new Monitoring 
Service.
> 
>>From the performance tests section, is there a limit on the number of sensors per report, seemingly it is 10, or was this done to simplify the performance >testing?
> 
> It was done because of limited sensors support on the test platform.
> 
>> The other general question I had was around the amount of data being transmitted. For instance, if you're getting reports on every sensor in the system >(100s) the report(s) could be huge at scale. Would there be an option of considering compressed data like BEJSON? Or is this feedback that should go to the >DMTF?
> 
> First of all, the max number of supported reports will be limited to around 50 due to limited BMC resources. As for the using compressed data, if we would like to compress data for the IPC (D-Bus) it is possible for us to implement any format we like as long as we document it in the design. As for the using compressed format for the Redfish Metric report it will require acceptance from the DMTF, because it will require changes in the schema.
> You were referring to using BSON on D-Bus or in Redfish Metric Report schema?

Thanks for the information on the max number of reports and how the test 
was conducted. In terms of the BSON, I was referring to using it with 
the Redfish Metric Report Schema.

> 
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
> 
> -----Original Message-----
> From: openbmc <openbmc-bounces+piotr.matuszczak=intel.com@lists.ozlabs.org> On Behalf Of Justin Thaler
> Sent: Tuesday, June 16, 2020 8:05 PM
> To: openbmc@lists.ozlabs.org
> Subject: Re: Patch for telemetry design
> 
> Hi Piotr,
> 	I've taken a read through the design proposal as more of a client of the telemetry data. I like this proposal quite a bit as it is pretty clear. I had a couple of questions and given the broad level, I wasn't sure if gerrit was the right place for them.
> 
> On Timestamps, are the timestamps done per metric(sensor reading) or per report. This wasn't clear to me from the design proposal, and also it was hard to tell where the timestamp was being set.
> 
>   From the performance tests section, is there a limit on the number of sensors per report, seemingly it is 10, or was this done to simplify the performance testing?
> 
> The other general question I had was around the amount of data being transmitted. For instance, if you're getting reports on every sensor in the system (100s) the report(s) could be huge at scale. Would there be an option of considering compressed data like BEJSON? Or is this feedback that should go to the DMTF?
> 
> Thanks,
> Justin Thaler
> IBM RAS Engineer
> 
> On 6/16/20 4:31 AM, Matuszczak, Piotr wrote:
>> Hi,
>>
>> I've uploaded patch for telemetry service design some time ago. I would like to ask you for review.
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31690
>>
>>
>> Piotr Matuszczak
>> ---------------------------------------------------------------------
>> Intel Technology Poland sp. z o.o.
>> ul. Slowackiego 173, 80-298 Gdansk
>> KRS 101882
>> NIP 957-07-52-316
>>

Thanks,
Justin Thaler
