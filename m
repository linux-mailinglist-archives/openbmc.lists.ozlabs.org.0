Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8F161EAD
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 02:54:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M3n11nH5zDqSD
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 12:54:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M3mB4Rl6zDqRq
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 12:53:29 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01I1oHr5100199; Mon, 17 Feb 2020 20:53:21 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dq6hpp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 20:53:21 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01I1omjo011077;
 Tue, 18 Feb 2020 01:53:21 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 2y689669w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 01:53:21 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01I1rKQB39256364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 01:53:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BBB2112064;
 Tue, 18 Feb 2020 01:53:20 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB071112062;
 Tue, 18 Feb 2020 01:53:19 +0000 (GMT)
Received: from demeter.local (unknown [9.85.150.250])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 18 Feb 2020 01:53:19 +0000 (GMT)
Subject: Re: Redfish message registries, plus translation
To: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 "Andrew.Jeffery" <andrew@aj.id.au>
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
 <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d0d215d3-708e-34b7-ba6e-047016b3fd38@linux.ibm.com>
Date: Mon, 17 Feb 2020 19:53:18 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_14:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180012
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

On 2/16/20 5:37 PM, Andrew Jeffery wrote:
>
> On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
>> Hi James,
>>
>> It's looking like in our future we will have to provide:
>>
>> 1) Redfish logs using multiple message registries that probably can't be
>>      hardcoded into hpp files and checked in.
>>      - For example, a registry for our host firmware and hypervisor errors,
>>        as our BMC handles displaying logs for them, that we would pick up
>>        during our build process.
>> and
>>
>> 2) Message registry text in multiple languages
>>
>> Those being my goals, I have a few questions:
>>
>> In general, is the multi-language strategy to just provide a standalone
>> registry array for each language which the code then selects based on the
>> Language property?
>>
>> To support both of the above, would you be open to having functionality
>> added
>> to read in registries from data files, including based on language? Or,
>> would you
>> have any other ideas for how to support these items?
> Bit of a drive-by question, but shouldn't we be using GNU gettext[1] to
> handle translation?

Matt's proposal is for BMCWeb to have two languages:

1. The implementation language.  When BMCWeb writes internal log 
entries, these will be in English.  The BMCWeb developers will use these 
to understand what is going on,  and the BMC admin may be able to read 
the, but they are not for BMC users.
We can certainly use gettext to internationalize this. But it is not 
what Matt is asking about.

2. The languages used for Redfish messages.  These message are added to 
the HTTP response body.  These are meant to be read by any BMC REST API 
user.  For example, messages from the Redfish "Base" message registry 
Base.1.7.0.json within DSP8011.  BMCWeb has a hard-coded version of a 
subset of these messages, for example, the AccountModified message in 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/src/error_messages.cpp
These messages are defined in English and meant to be translated. That's 
what Matt is asking about.


Here's my drive-by response.

The current implementation is locked into English-only.  BMCWeb code 
sends messages like this:
1. #include 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/error_messages.hpp
2. Write code like: propertyValueModified(res, "myProperty", 
myModifiedValue);
This calls the function in error_messages.cpp which is hard-coded English.

Having hard-coded function calls and hard-coded implementations helps 
with BMCWeb's goal for performance and startup times.
https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md

However, IMHO, the development process to add new Redfish messages to 
BMCWeb is cumbersome.  It should be as easy as copying Redfish's new 
JSON file.

IMHO, the easiest way to to support multiple languages (including 
English) is to keep the prototypes in error_messages.hpp so all the 
existing uses will continue to work.  Then change the implementation to 
select a message from a JSON file based on the hard-coded message name 
(example: AccountNotModified) and language (en-us, zh-cn, or whatever).

All of the usual issues come up with approach:
- Will BMCWeb pre-load or load-on-demand the JSON file would be 
pre-loaded.  It certainly will not be loaded for every message.
- Fallbacks.  For example, if the ja-jp message files does not have the 
AccountNotModified message, format the en-us message instead.
- Need a default message.  For example, if BMCWeb tries to sent the 
message "NotARealMessage" which is not defined in any message file, it 
might be useful to send the raw data instead.
- We use the Redfish "Base" message registry, and I think we also use an 
OpenBMC Oem message registry as well.  So BMCWeb will have to load 
multiple message registries per language.

More:
- Will a initial set of supported languages be baked into the firmware 
image (on the BMC's file system) in English or some other languages?
- Can the BMC admin add and remove supported languages (by adding or 
deleting JSON message registry files)?
- Will there be REST APIs for that?
- Supported by the Redfish spec?

So what the the requirements?

- Joseph

You can see one open source project's work here: 
http://userguide.icu-project.org/formatparse/messages

>
> [1] https://www.gnu.org/software/gettext/
>
> Andrew

