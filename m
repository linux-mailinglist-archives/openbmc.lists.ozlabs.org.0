Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 425977069C
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 19:16:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45spDP518XzDqQC
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 03:16:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spCn0JRJzDqHg
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 03:15:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MHCRJ5080523
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 13:15:45 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twh92rdp2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 13:15:45 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 22 Jul 2019 18:15:37 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 22 Jul 2019 18:15:35 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6MHFYdQ33358024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2019 17:15:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2062F52051;
 Mon, 22 Jul 2019 17:15:34 +0000 (GMT)
Received: from [9.85.88.240] (unknown [9.85.88.240])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A045E5204F;
 Mon, 22 Jul 2019 17:15:32 +0000 (GMT)
Subject: Re: Integrate collectd with OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Kun Yi <kunyi@google.com>
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
 <20190722163049.kyupys7alq6zzq6x@thinkpad>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Mon, 22 Jul 2019 22:45:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190722163049.kyupys7alq6zzq6x@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072217-4275-0000-0000-0000034F9DDB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072217-4276-0000-0000-0000385FC015
Message-Id: <018ce048-ac0c-cd69-a8c0-c36a5fcaddf6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=921 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220190
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
Cc: Gabriel Matute <gmatute@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,


On 7/22/19 10:00 PM, Brad Bishop wrote:
> On Thu, Jun 27, 2019 at 10:51:03PM -0700, Kun Yi wrote:
>> Hello there,
>>
>> In the context of reporting BMC performance metrics, my intern Gabriel
>> (cc'ed here) and I have started looking at integrating collectd as a
>> metrics collection tool on OpenBMC. We have got it running, which is
>> trivial, but the next question is how to report the data.
>>
>> We have thought about it and thinks implementing a D-Bus interface to be
>> the most flexible approach. At first, we could implement a snapshot
>> (instantaneos read) interface. It would then be fairly 
>> straightforward to
>> add them as Redfish/IPMI sensors.
>
> Just curious in what situations DBus was required?  In the design I 
> thought you had applications going right to librrd - where did that 
> fall down?
>

 From what I saw in the design template, librrd to be used to enable any 
daemon to make their data available to collectd.

The proposal here is to externally report the data collected. I 
understood it as; we going to have per plugin D-Bus APIs to report it. 
But looking at it again, I am not sure how is that achieved.

Kun, Do you have a flow schematic ?


>>
>> There are two ways to do this:
>> 1. Implement as a collectd "D-Bus" plugin [1]. Collectd supports writing
>> custom plugins which are C files calling the internal plugin APIs. Could
>> probably use sdbus to implement.
>>
>> + could potentially be upstreamed to collectd
>> - the code probably will live in a downstream fork first, and if it 
>> doesn't
>> end up upstream, maintaining could become an issue since collectd plugin
>> API is not guaranteed stable
>> - C
>>
>> 2. Implement as an interposer daemon that translates between one of the
>> formats that collectd supports (unix socket, plaintext, RRDTool..) to 
>> D-Bus
>>
>> + project could be purely OpenBMC
>> + can use sdbusplus
>> - another daemon
>>
>> Any advice on this? Currently we are leaning towards the first approach,
>> but do you agree the D-Bus plugin is general enough to be of interest to
>> the upstream collectd community?
>>
>> I can definitely reach out to the collectd group but just want to ask 
>> here
>> first :)
>>
>> [1] Collectd plugins:
>> https://collectd.org/wiki/index.php/Plugin_architecture
>> -- 
>> Regards,
>> Kun
>

