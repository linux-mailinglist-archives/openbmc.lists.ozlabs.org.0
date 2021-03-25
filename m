Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CC349C39
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 23:29:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F60CK2pJLz2yhf
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 09:29:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UxMfpxdT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UxMfpxdT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F60C50qPgz302m
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 09:29:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PM3xM4182041
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Vn9xWlZPB/p5aJO/G7KFhwQfXHPrjnWCC886XKadNSg=;
 b=UxMfpxdTdo4aJoWJcKgbCLLCwEE4OOsZzm8PnNlJrbr2T1FeKgf5hNeNxKgjEonhBTOg
 n2zFCwe2Md5ict3iQ+svfgW9zkJEtOZsq2CowI6dNV77X993VeDd4qrWCM6fCCUhOEgr
 NgxilzwSOMqFA+GkP1c9lSHBpApWec9pyCYfldtaHwa4mYCqKPUaP6ipKtsPH1Llmvz+
 PP+zTRyewVOdlKgXUjmSik16pNT12BZzkp6JDB+gQAkGKaIRGbCSBqCx/w0OwhXySfka
 OIeBqlDLREFNAjXYvQ1b6a/oxqxGYLnXMqX0zcd9qKgbq4Kzqtvrf9ch55Il0OT2SnKR yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37h28u9crf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:29:17 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PM4URG184115
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 18:29:17 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37h28u9crb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 18:29:17 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PMReK1012724;
 Thu, 25 Mar 2021 22:29:16 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 37h1530xv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 22:29:16 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PMTELF29753640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 22:29:14 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAA8B6E054;
 Thu, 25 Mar 2021 22:29:14 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB5C6E04E;
 Thu, 25 Mar 2021 22:29:14 +0000 (GMT)
Received: from [9.211.35.131] (unknown [9.211.35.131])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 22:29:14 +0000 (GMT)
Subject: Re: IPMI SEL Parsing
To: Matt Spinler <mspinler@linux.ibm.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
Date: Thu, 25 Mar 2021 15:29:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LNB6V5L0veP9F0xmhzaAFawx1uU5WH-m
X-Proofpoint-ORIG-GUID: zhlPDSfX_AQPCB81fTMD1Pprf7SKsqQ8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_08:2021-03-25,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103250161
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

On 3/25/2021 15:16, Matt Spinler wrote:
> 
> 
> On 3/25/2021 7:49 AM, rgrs wrote:
>> Hi All, "ipmitool sel list" always shows the records as "Undetermined 
>> system hardware failure". Logging/entry doesn't have the proper 
>> association. How do I add association for log entries and respective 
>> FRUs? Which package creates Logging/entry Hi All,
>>
>> "ipmitool sel list" always shows the records as "Undetermined system 
>> hardware failure".
>> Logging/entry doesn't have the proper association. How do I add 
>> association for log entries and respective FRUs?
>>
>> Which package creates Logging/entry object on sensor events? I don't 
>> see any call to SelAdd in phosphor-hwmon.
> 
> What are the SELs for - threshold alarms, or some other sort of failures?
> 
>>
>> Thanks,
>> Raj
> 

My assumption is that not everyone in the OpenBMC community has
extensive use with IPMI, thus this just to share information.
Sorry to those who already know this information and have been
using it for years.

This is share background as to the history or background of the
IPMI SEL; probably more information than you need.  But I would
rather share 10% too much than be short by 0.1%.

 From Intelligent Platform Management Interface Specification Second 
Generation v2.0
Document Revision 1.1 October 1, 2013

31. System Event Log (SEL) Commands:

The System Event Log is a non-volatile repository for system events and 
certain system configuration information. The device that fields the 
commands to access the SEL is referred to as the System Event Log Device 
or SEL Device.

Event Message information is normally written into the SEL after being 
received by the Event Receiver functionality in the Event Receiver Device.

The SEL Device commands are structured in such a way that the SEL Device 
could actually be separated from the Event Receiver Device. In which 
case it would be the responsibility of the Event Receiver Device to send 
the appropriate ‘Add SEL Entry’ message directly to the SEL Device, or 
to pass the equivalent request through an intermediary.

SEL Entries have a unique ‘Record ID’ field. This field is used for 
retrieving log entries from the SEL. SEL reading can be done in a 
‘random access’ manner. That is, SEL Entries can be read in any order 
assuming that the Record ID is known.

SEL Record IDs 0000h and FFFFh are reserved for functional use and are 
not legal ID values. Record IDs are handles. They are not required to be 
sequential or consecutive. Applications should not assume that SEL 
Record IDs will follow any particular numeric ordering.

SEL Records are kept as an ordered list. That is, appending and deleting 
individual entries does not change the access order of entries that 
precede or follow the point of addition or deletion.

-- 
Bruce
