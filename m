Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80320CD27
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 10:08:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wKqr40b6zDqNF
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 18:08:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wKqB3KWBzDqHn
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 18:07:50 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05T7xsMB009562; Mon, 29 Jun 2020 04:07:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ycd3r8xd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 04:07:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05T85EBZ020172;
 Mon, 29 Jun 2020 08:07:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr89yjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 08:07:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05T87hLS59572392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 08:07:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 263DE11C04C;
 Mon, 29 Jun 2020 08:07:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B00E11C054;
 Mon, 29 Jun 2020 08:07:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.212.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Jun 2020 08:07:42 +0000 (GMT)
Subject: Re: Redfish EventService Implementation
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
 <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
 <6fc4c66e-4a0a-1c59-3f77-a6fcff29b97e@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <ee2b81be-0aff-022f-e5a7-9f0f874c1f20@linux.vnet.ibm.com>
Date: Mon, 29 Jun 2020 13:37:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6fc4c66e-4a0a-1c59-3f77-a6fcff29b97e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_07:2020-06-26,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 cotscore=-2147483648 malwarescore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290053
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


On 6/26/20 12:25 AM, Bills, Jason M wrote:
>
>
> On 6/25/2020 10:26 AM, Brad Bishop wrote:
>> One idea floating around to address these is inventing a journal
>> metadata scheme that is management interface agnostic.  I understand the
>> motivation behind that - it is much simpler for an application to slide
>> a single journal entry into the journal with all the metadata needed to
>> generate events, than it is for an application to snoop multiple signals
>> off dbus and pull events out of that.
>>
>> But I wonder if inventing a management interface agnostic scheme for
>> adding events to the journal is really just inventing a new data model
>> for how we represent things in a server - e.g. are we just working
>> around our dbus data model?  Maybe we should fix it instead, so that it
>> isn't so difficult for applications to use it?  With that said I don't
>> know how to do this and I could use more concrete details on which areas
>> of the data model make it hard to consume signals.  Does anyone have any
>> ideas or examples?
>>
>
> On this, I think we may want to separate logging vs. eventing both in 
> this feature discussion and in the tools we want to use.
>
> When we were talking about logging, I think the journal made sense 
> since it is designed for logging and has benefits around that usage.  
> However, I agree that it doesn't seem like the right tool for sending 
> and receiving events and signals and that D-Bus sounds like the right 
> tool for that.
>
> I think I'm still a little confused at the scope.  My understanding 
> was that this initial design for EventService was only for monitoring 
> event messages and not resources in general. It seems like it may not 
> make sense to try to use the same tools and approach for both message 
> monitoring and resource monitoring? Do we need to treat them 
> separately for now to simplify the discussion?
Jason, When you say event messages? What do you mean, Do you mean to say 
"/redfish/v1/Systems/system/Logservices/eventlog"?

If yes then this should also go as Resource Event, When ever any log 
entry gets created under System Log 
(/redfish/v1/Systems/system/Logservices/eventlog/entries), BMC would 
notify to the Redfish client saying that "ResourceCreated" with the URL 
of the Resource.

After receiving this event Redfish client will do a GET request on the 
URL(retrieved as part of event) to get the content of the log.

This will become generic infra for all types of events.

I would be coming up with few design approaches and downside with each 
approach to take it to conclusion.

Ratan

