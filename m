Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038724FD17
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 13:58:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZrHw5Ny9zDqQl
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 21:58:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tomjose@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XHqLTdjU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZrH60GSHzDqDd
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 21:58:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OBhrG8162757; Mon, 24 Aug 2020 07:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XPXXMsG2V0v9nDjGUeLtaZNM9CE99t4zMAnLMhB2cwU=;
 b=XHqLTdjUGV3N4580AcQgVsWKDd+2QA0IKsPkRAWjZtlHj4V9CuOBqjwWWDVHkxSajX5K
 SDKcedX1++i8wq6+Y9F8NKiTUnQeAR3l98qzT6lucOlY8au2A4f4RHYvwEbhL1Enrv69
 X6Tl2IF0XTTTH6iTKugCCaAUeZdHNISg1bucli1uocYswNNIS+9yjF65DBuNeLwmrFRI
 45uT6SRUAHF96LFWAKENs4FF1age4HQhT7ZmrsaM4A5BtPV/JTl4hECIoYBoSrfj3J9L
 VlESwq+nbZn4hCezWyWgeps3/G7vMN30bzBFvD7pequFioIEKD8SMXD23oY/5GYwGXkK nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334cxagc6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 07:58:03 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07OBjKsD166648;
 Mon, 24 Aug 2020 07:58:03 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334cxagc5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 07:58:02 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07OBvZXb002776;
 Mon, 24 Aug 2020 11:58:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 332ujktagt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 11:58:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07OBvwwf27984200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 11:57:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE0A1AE059;
 Mon, 24 Aug 2020 11:57:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA348AE058;
 Mon, 24 Aug 2020 11:57:57 +0000 (GMT)
Received: from [9.85.125.77] (unknown [9.85.125.77])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Aug 2020 11:57:57 +0000 (GMT)
Subject: Re: IPMI implementation of Get Device ID command
To: "Mauery, Vernon" <vernon.mauery@intel.com>,
 Patrick Williams <patrick@stwcx.xyz>, benjaminfair@google.com
References: <ff39e855-d5b6-a789-bcbb-3b87bf786bd1@linux.vnet.ibm.com>
 <20200814231020.GA16853@mauery.jf.intel.com>
From: TOM JOSEPH <tomjose@linux.vnet.ibm.com>
Message-ID: <4cde2763-88b0-447b-1aba-5bb884fae251@linux.vnet.ibm.com>
Date: Mon, 24 Aug 2020 17:27:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814231020.GA16853@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_08:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240092
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Thanks for the response on this. Every company seems to have a different 
version scheme and the parsing might not fit into upstream 
implementation of the Get Device ID command.

My proposal is to add major and minor version to the dev_id.json and 
this can be populated in the meta-xxx layer (something like this 
https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend). 
If the format of the VERSION_ID does not match the master tag format, 
then major and minor version will be picked from the dev_id.json. With 
this approach every company can share the upstream implementation of the 
command. Thoughts?

Regards,
Tom

On 15-08-2020 04:41, Mauery, Vernon wrote:
> On 14-Aug-2020 11:04 PM, TOM JOSEPH wrote:
>> Hello,
>>
>> We have an implementation of this command 
>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L571 
>> . The current version of the code derives the major and minor 
>> firmware revision from the VERSION_ID field, and the auxiliary 
>> firmware revision is picked from dev_id.json. The auxiliary firmware 
>> revision is populated at build time 
>> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/ipmi/phosphor-ipmi-config.bbappend.
>>
>> The implementation of the code is obsolete, as it was based on an 
>> earlier format. The current format of VERSION_ID for example is, 
>> 2.9.0-dev-609-g56f86d23c. There is already a WIP patch to fix this 
>> for the master tag format 
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893. 
>> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/33893> 
>>
>>
>> IBM tagging format is different from the tag format of master builds. 
>> One choice is to have the major and minor version added to the 
>> dev_id.json and if the format of VERSION_ID does not match the master 
>> tag format,  pick from the json.
>>
>> How are other companies converting their arbitrary tag formats to 
>> IPMI firmware revision fields? Does every company maintain their own 
>> downstream implementation of this command?
>>
> We have a two-hash version scheme (one for openbmc, the other for the 
> downstream meta-intel layer) that looks something like 
> wht-0.2-3-gab3500-38384ac. We override the Get Device ID command
> https://github.com/openbmc/intel-ipmi-oem/blob/master/src/appcommands.cpp#L200 
>
> to expose part of both of those hashes in the aux bytes. But to get 
> the full version string, we use redfish.
>
>> Is a common code possible for converting arbitrary tag formats to 
>> IPMI firmware revision fields?
>
> Not that I am aware of. I think this leads to lots of string parsing.
>
> --Vernon
