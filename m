Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B3163316
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 21:31:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MXYy6vrvzDqW2
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:31:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MXYB6lxMzDqVZ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 07:30:38 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IKJJNw041124; Tue, 18 Feb 2020 15:29:31 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y87e70y9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 15:29:30 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01IKPqhF024534;
 Tue, 18 Feb 2020 20:29:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 2y6896d1f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 20:29:30 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01IKTTjF49676596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 20:29:29 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D2B06E053;
 Tue, 18 Feb 2020 20:29:29 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 863536E04E;
 Tue, 18 Feb 2020 20:29:28 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.196.183])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 18 Feb 2020 20:29:28 +0000 (GMT)
Subject: Re: Redfish message registries, plus translation
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
 <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
 <d0d215d3-708e-34b7-ba6e-047016b3fd38@linux.ibm.com>
 <e86e411c-c071-03be-6813-3ec16b38513b@linux.intel.com>
 <8095B70B-D625-49C7-AE04-45D3FDDD41C5@fuzziesquirrel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7000544f-5c05-ced1-2880-1b22a6054e6a@linux.ibm.com>
Date: Tue, 18 Feb 2020 14:29:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8095B70B-D625-49C7-AE04-45D3FDDD41C5@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-18_06:2020-02-18,
 2020-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180135
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/18/20 1:37 PM, Brad Bishop wrote:
>> On Feb 18, 2020, at 2:25 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>>
>>
>> On 2/17/2020 5:53 PM, Joseph Reynolds wrote:
>>> On 2/16/20 5:37 PM, Andrew Jeffery wrote:
>>>> On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
>>>>> Hi James,
>>>>>
>>>>> It's looking like in our future we will have to provide:
>>>>>
>>>>> 1) Redfish logs using multiple message registries that probably can't be
>>>>>       hardcoded into hpp files and checked in.
>>>>>       - For example, a registry for our host firmware and hypervisor errors,
>>>>>         as our BMC handles displaying logs for them, that we would pick up
>>>>>         during our build process.
>>>>> and
>>>>>
>>>>> 2) Message registry text in multiple languages
>>>>>
>>>>> Those being my goals, I have a few questions:
>>>>>
>>>>> In general, is the multi-language strategy to just provide a standalone
>>>>> registry array for each language which the code then selects based on the
>>>>> Language property?
>>>>>
>>>>> To support both of the above, would you be open to having functionality
>>>>> added
>>>>> to read in registries from data files, including based on language? Or,
>>>>> would you
>>>>> have any other ideas for how to support these items?
>>>> Bit of a drive-by question, but shouldn't we be using GNU gettext[1] to
>>>> handle translation?
>>> Matt's proposal is for BMCWeb to have two languages:
>>> 1. The implementation language.  When BMCWeb writes internal log entries, these will be in English.  The BMCWeb developers will use these to understand what is going on,  and the BMC admin may be able to read the, but they are not for BMC users.
>>> We can certainly use gettext to internationalize this. But it is not what Matt is asking about.
>>> 2. The languages used for Redfish messages.  These message are added to the HTTP response body.  These are meant to be read by any BMC REST API user.  For example, messages from the Redfish "Base" message registry Base.1.7.0.json within DSP8011.  BMCWeb has a hard-coded version of a subset of these messages, for example, the AccountModified message in https://github.com/openbmc/bmcweb/blob/master/redfish-core/src/error_messages.cpp These messages are defined in English and meant to be translated. That's what Matt is asking about.
>>> Here's my drive-by response.
>>> The current implementation is locked into English-only.  BMCWeb code sends messages like this:
>>> 1. #include https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/error_messages.hpp 2. Write code like: propertyValueModified(res, "myProperty", myModifiedValue);
>>> This calls the function in error_messages.cpp which is hard-coded English.
>>> Having hard-coded function calls and hard-coded implementations helps with BMCWeb's goal for performance and startup times.
>>> https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md
>>> However, IMHO, the development process to add new Redfish messages to BMCWeb is cumbersome.  It should be as easy as copying Redfish's new JSON file.
>> To ease this, there is a script in bmcweb that is designed to parse the JSON message registries into the header file.
> So I’m a total bmcweb noob - but any reason why the runtime can’t just parse the json?  Why does it have to get converted to a header?

It can.  A few thoughts:

1. As I mentioned above: <quote> Having hard-coded function calls and 
hard-coded implementations helps with BMCWeb's goal for performance and 
startup times. 
https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md </quote>
Having to read message registries during startup impacts performance.  I 
guess bmcweb startup times would be a tiny bit slower.  Redfish message 
registries are currently 40Kb ... but will grow fatter over time.

2. Having to read message registries during startup time is another 
thing that can go wrong.  An error at build-time, on the BMC's file 
system, or when bmcweb reads the files may prevent BMCWeb from issuing 
meaningful Redfish messages.

3. Presumably one of the hard-coded messages registries would be the 
ultimate fallback message registry, that is, it will be used when the 
required message cannot be found in the message registry for the 
requested language.  Not having a hard-coded message registry removes 
this option.

4. If you are okay with the items above then we can consider a 
build-time BMCWeb config option to build without any built-in message 
registry and rely only on reading message registries from the BMC's file 
system at BMCWeb startup time.  Here are some thoughts:
- The BMCWeb build process could just copy the Redfish message registry 
into a directory BMCWeb reads during startup.
- We would need new code in BMCWeb to read and parse the message 
registries.  The JSON parser is already available within bmcweb.
- We would need new code in BMCWeb to issue messages from the message 
registries.


IMHO, the prospect of removing support for the built-in Redfish "Base" 
message registry seems do-able.  The potential problems and 
disadvantages outlined above seem small.  But I don't have a strong 
opinion either way.

- Joseph

