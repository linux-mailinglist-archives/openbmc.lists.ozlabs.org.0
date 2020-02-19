Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB81164B8D
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 18:08:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N41j1G3gzDqXX
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 04:08:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N40t0cCwzDqQQ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 04:07:57 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JH4LaF085836; Wed, 19 Feb 2020 12:07:55 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8uedd20j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 12:07:54 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01JH38ga008760;
 Wed, 19 Feb 2020 17:07:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2y6896xb3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 17:07:53 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01JH7pIB31654332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Feb 2020 17:07:51 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBD20136055;
 Wed, 19 Feb 2020 17:07:51 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96AD6136051;
 Wed, 19 Feb 2020 17:07:51 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Feb 2020 17:07:51 +0000 (GMT)
Subject: Re: Redfish message registries, plus translation
To: James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
 <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
 <d0d215d3-708e-34b7-ba6e-047016b3fd38@linux.ibm.com>
 <e86e411c-c071-03be-6813-3ec16b38513b@linux.intel.com>
 <6f376642-4054-0d2c-74a5-638cb55e72da@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <48d37f26-a1fd-b2cc-d97d-152b4a548b20@linux.ibm.com>
Date: Wed, 19 Feb 2020 11:07:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6f376642-4054-0d2c-74a5-638cb55e72da@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_04:2020-02-19,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002190130
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

On 2/18/20 4:02 PM, James Feist wrote:
> On 2/18/20 11:25 AM, Bills, Jason M wrote:
>>
>>
>> On 2/17/2020 5:53 PM, Joseph Reynolds wrote:
>>> On 2/16/20 5:37 PM, Andrew Jeffery wrote:
>>>>
>>>> On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
>>>>> Hi James,
>>>>>
>>>>> It's looking like in our future we will have to provide:
>>>>>
>>>>> 1) Redfish logs using multiple message registries that probably 
>>>>> can't be
>>>>>      hardcoded into hpp files and checked in.
>>>>>      - For example, a registry for our host firmware and 
>>>>> hypervisor errors,
>>>>>        as our BMC handles displaying logs for them, that we would 
>>>>> pick up
>>>>>        during our build process.
>>>>> and
>>>>>
>>>>> 2) Message registry text in multiple languages
>>>>>
>>>>> Those being my goals, I have a few questions:
>>>>>
>>>>> In general, is the multi-language strategy to just provide a 
>>>>> standalone
>>>>> registry array for each language which the code then selects based 
>>>>> on the
>>>>> Language property?
>>>>>
>>>>> To support both of the above, would you be open to having 
>>>>> functionality
>>>>> added
>>>>> to read in registries from data files, including based on 
>>>>> language? Or,
>>>>> would you
>>>>> have any other ideas for how to support these items?
>>>> Bit of a drive-by question, but shouldn't we be using GNU 
>>>> gettext[1] to
>>>> handle translation?
>>>
>>> Matt's proposal is for BMCWeb to have two languages:
>>>
>>> 1. The implementation language.  When BMCWeb writes internal log 
>>> entries, these will be in English.  The BMCWeb developers will use 
>>> these to understand what is going on,  and the BMC admin may be able 
>>> to read the, but they are not for BMC users.
>>> We can certainly use gettext to internationalize this. But it is not 
>>> what Matt is asking about.
>>>
>>> 2. The languages used for Redfish messages.  These message are added 
>>> to the HTTP response body.  These are meant to be read by any BMC 
>>> REST API user.  For example, messages from the Redfish "Base" 
>>> message registry Base.1.7.0.json within DSP8011.  BMCWeb has a 
>>> hard-coded version of a subset of these messages, for example, the 
>>> AccountModified message in 
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/src/error_messages.cpp 
>>>
>>> These messages are defined in English and meant to be translated. 
>>> That's what Matt is asking about.
>>>
>>>
>>> Here's my drive-by response.
>>>
>>> The current implementation is locked into English-only. BMCWeb code 
>>> sends messages like this:
>>> 1. #include 
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/error_messages.hpp 
>>>
>>> 2. Write code like: propertyValueModified(res, "myProperty", 
>>> myModifiedValue);
>>> This calls the function in error_messages.cpp which is hard-coded 
>>> English.
>>>
>>> Having hard-coded function calls and hard-coded implementations 
>>> helps with BMCWeb's goal for performance and startup times.
>>> https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md
>>>
>>> However, IMHO, the development process to add new Redfish messages 
>>> to BMCWeb is cumbersome.  It should be as easy as copying Redfish's 
>>> new JSON file.
>> To ease this, there is a script in bmcweb that is designed to parse 
>> the JSON message registries into the header file.  I just ran it and 
>> it has a couple minor bugs that were introduced when we changed the 
>> format to fix build warnings.  I'll push a fix.
>>
>> One possible solution would be to adapt this script to run 
>> automatically at build time.  Then any JSON message registry files 
>> that get added either to bmcweb or as an append could be 
>> transparently converted to the header file.
>
> An added benefit of this is that it could verify JSON is in legal 
> format before it makes it to the BMC.

Agreed.  As an alternative, we could enhance the BMCWeb build to 
validate the JSON message registry files that are destined for use by 
BMCWeb.  That would catch most errors, but be weaker than converting 
them to header files: it leaves a window where those files could be 
modified after they are packaged into the image and before they are read 
into bmcweb.

>
>>
>>>
>>> IMHO, the easiest way to to support multiple languages (including 
>>> English) is to keep the prototypes in error_messages.hpp so all the 
>>> existing uses will continue to work.  Then change the implementation 
>>> to select a message from a JSON file based on the hard-coded message 
>>> name (example: AccountNotModified) and language (en-us, zh-cn, or 
>>> whatever).
>
>
> Is there any reason to have this update-able at runtime? Regardless to 
> limit the possibility of errors I'd like to avoid constant pulling 
> from JSON. I'd rather see the JSON being pulled at application start, 
> so we take any impact (timing or bugs/crashes) early. However I'm not 
> sure I know of a use-case to have this be done at runtime.

I did not mean for the JSON files to be modifiable at runtime; I see no 
use case for that.  I imagined that BMCWeb would read any given JSON 
file exactly once and stay in bmcweb heap storage until the server 
terminates.  The simplest design is to read all of the JSON files from 
its message registry directory: all messages files (Base, Oem.Redfish, 
etc.) and all language versions (en-us, cn-zh, etc.). If the registry 
gets large because of many messages multiplied by many translated 
versions and memory consumption is a concern, then we can consider 
just-in-time reading JSON files for that language. (But let's not go 
there now.)

To be clear: I am also not advocating for the JSON message translation 
files to be updatable by any BMC interface.  As far as I am concerned, 
they can be baked into the image.  Doing it this way, the messages can 
be updated by a firmware update.

- Joseph

>
>>>
>>> All of the usual issues come up with approach:
>>> - Will BMCWeb pre-load or load-on-demand the JSON file would be 
>>> pre-loaded.  It certainly will not be loaded for every message.
>>> - Fallbacks.  For example, if the ja-jp message files does not have 
>>> the AccountNotModified message, format the en-us message instead.
>>> - Need a default message.  For example, if BMCWeb tries to sent the 
>>> message "NotARealMessage" which is not defined in any message file, 
>>> it might be useful to send the raw data instead.
>> bmcweb currently provides the given MessageId with a blank Message 
>> field if it cannot be found in a registry.
>>
>>> - We use the Redfish "Base" message registry, and I think we also 
>>> use an OpenBMC Oem message registry as well.  So BMCWeb will have to 
>>> load multiple message registries per language.
>>>
>>> More:
>>> - Will a initial set of supported languages be baked into the 
>>> firmware image (on the BMC's file system) in English or some other 
>>> languages?
>>> - Can the BMC admin add and remove supported languages (by adding or 
>>> deleting JSON message registry files)?
>>> - Will there be REST APIs for that?
>>> - Supported by the Redfish spec?
>>>
>>> So what the the requirements?
>>>
>>> - Joseph
>>>
>>> You can see one open source project's work here: 
>>> http://userguide.icu-project.org/formatparse/messages
>>>
>>>>
>>>> [1] https://www.gnu.org/software/gettext/
>>>>
>>>> Andrew
>>>

