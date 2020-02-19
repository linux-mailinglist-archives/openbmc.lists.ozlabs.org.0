Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 584EE164D9C
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 19:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N5mc2d5SzDqQG
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 05:27:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N5Db68QhzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 05:03:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2020 10:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; d="scan'208";a="254177061"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 19 Feb 2020 10:03:06 -0800
Subject: Re: Redfish message registries, plus translation
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <a30efe6c-83b2-8f25-5cd6-7a70ab1113f9@linux.ibm.com>
 <2c599df0-6de4-485c-b5aa-bff816348a09@www.fastmail.com>
 <d0d215d3-708e-34b7-ba6e-047016b3fd38@linux.ibm.com>
 <e86e411c-c071-03be-6813-3ec16b38513b@linux.intel.com>
 <6f376642-4054-0d2c-74a5-638cb55e72da@linux.intel.com>
 <48d37f26-a1fd-b2cc-d97d-152b4a548b20@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <858c68be-8cbd-3224-12f2-de572dd525ce@linux.intel.com>
Date: Wed, 19 Feb 2020 10:03:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <48d37f26-a1fd-b2cc-d97d-152b4a548b20@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 2/19/20 9:07 AM, Joseph Reynolds wrote:
> On 2/18/20 4:02 PM, James Feist wrote:
>> On 2/18/20 11:25 AM, Bills, Jason M wrote:
>>>
>>>
>>> On 2/17/2020 5:53 PM, Joseph Reynolds wrote:
>>>> On 2/16/20 5:37 PM, Andrew Jeffery wrote:
>>>>>
>>>>> On Sat, 15 Feb 2020, at 06:27, Matt Spinler wrote:
>>>>>> Hi James,
>>>>>>
>>>>>> It's looking like in our future we will have to provide:
>>>>>>
>>>>>> 1) Redfish logs using multiple message registries that probably 
>>>>>> can't be
>>>>>>      hardcoded into hpp files and checked in.
>>>>>>      - For example, a registry for our host firmware and 
>>>>>> hypervisor errors,
>>>>>>        as our BMC handles displaying logs for them, that we would 
>>>>>> pick up
>>>>>>        during our build process.
>>>>>> and
>>>>>>
>>>>>> 2) Message registry text in multiple languages
>>>>>>
>>>>>> Those being my goals, I have a few questions:
>>>>>>
>>>>>> In general, is the multi-language strategy to just provide a 
>>>>>> standalone
>>>>>> registry array for each language which the code then selects based 
>>>>>> on the
>>>>>> Language property?
>>>>>>
>>>>>> To support both of the above, would you be open to having 
>>>>>> functionality
>>>>>> added
>>>>>> to read in registries from data files, including based on 
>>>>>> language? Or,
>>>>>> would you
>>>>>> have any other ideas for how to support these items?
>>>>> Bit of a drive-by question, but shouldn't we be using GNU 
>>>>> gettext[1] to
>>>>> handle translation?
>>>>
>>>> Matt's proposal is for BMCWeb to have two languages:
>>>>
>>>> 1. The implementation language.  When BMCWeb writes internal log 
>>>> entries, these will be in English.  The BMCWeb developers will use 
>>>> these to understand what is going on,  and the BMC admin may be able 
>>>> to read the, but they are not for BMC users.
>>>> We can certainly use gettext to internationalize this. But it is not 
>>>> what Matt is asking about.
>>>>
>>>> 2. The languages used for Redfish messages.  These message are added 
>>>> to the HTTP response body.  These are meant to be read by any BMC 
>>>> REST API user.  For example, messages from the Redfish "Base" 
>>>> message registry Base.1.7.0.json within DSP8011.  BMCWeb has a 
>>>> hard-coded version of a subset of these messages, for example, the 
>>>> AccountModified message in 
>>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/src/error_messages.cpp 
>>>>
>>>> These messages are defined in English and meant to be translated. 
>>>> That's what Matt is asking about.
>>>>
>>>>
>>>> Here's my drive-by response.
>>>>
>>>> The current implementation is locked into English-only. BMCWeb code 
>>>> sends messages like this:
>>>> 1. #include 
>>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/include/error_messages.hpp 
>>>>
>>>> 2. Write code like: propertyValueModified(res, "myProperty", 
>>>> myModifiedValue);
>>>> This calls the function in error_messages.cpp which is hard-coded 
>>>> English.
>>>>
>>>> Having hard-coded function calls and hard-coded implementations 
>>>> helps with BMCWeb's goal for performance and startup times.
>>>> https://github.com/openbmc/bmcweb/blob/master/DEVELOPING.md
>>>>
>>>> However, IMHO, the development process to add new Redfish messages 
>>>> to BMCWeb is cumbersome.  It should be as easy as copying Redfish's 
>>>> new JSON file.
>>> To ease this, there is a script in bmcweb that is designed to parse 
>>> the JSON message registries into the header file.  I just ran it and 
>>> it has a couple minor bugs that were introduced when we changed the 
>>> format to fix build warnings.  I'll push a fix.
>>>
>>> One possible solution would be to adapt this script to run 
>>> automatically at build time.  Then any JSON message registry files 
>>> that get added either to bmcweb or as an append could be 
>>> transparently converted to the header file.
>>
>> An added benefit of this is that it could verify JSON is in legal 
>> format before it makes it to the BMC.
> 
> Agreed.  As an alternative, we could enhance the BMCWeb build to 
> validate the JSON message registry files that are destined for use by 
> BMCWeb.  That would catch most errors, but be weaker than converting 
> them to header files: it leaves a window where those files could be 
> modified after they are packaged into the image and before they are read 
> into bmcweb.

Also if someone uses a bbappend and patches in their own files after the 
build completes (or using a different recipe entirely), they won't be 
validated.

> 
>>
>>>
>>>>
>>>> IMHO, the easiest way to to support multiple languages (including 
>>>> English) is to keep the prototypes in error_messages.hpp so all the 
>>>> existing uses will continue to work.  Then change the implementation 
>>>> to select a message from a JSON file based on the hard-coded message 
>>>> name (example: AccountNotModified) and language (en-us, zh-cn, or 
>>>> whatever).
>>
>>
>> Is there any reason to have this update-able at runtime? Regardless to 
>> limit the possibility of errors I'd like to avoid constant pulling 
>> from JSON. I'd rather see the JSON being pulled at application start, 
>> so we take any impact (timing or bugs/crashes) early. However I'm not 
>> sure I know of a use-case to have this be done at runtime.
> 
> I did not mean for the JSON files to be modifiable at runtime; I see no 
> use case for that.  I imagined that BMCWeb would read any given JSON 
> file exactly once and stay in bmcweb heap storage until the server 
> terminates.  The simplest design is to read all of the JSON files from 
> its message registry directory: all messages files (Base, Oem.Redfish, 
> etc.) and all language versions (en-us, cn-zh, etc.). If the registry 
> gets large because of many messages multiplied by many translated 
> versions and memory consumption is a concern, then we can consider 
> just-in-time reading JSON files for that language. (But let's not go 
> there now.)
> 
> To be clear: I am also not advocating for the JSON message translation 
> files to be updatable by any BMC interface.  As far as I am concerned, 
> they can be baked into the image.  Doing it this way, the messages can 
> be updated by a firmware update.

Great, I was just wondering if there was some use case I missed.

> 
> - Joseph
> 
>>
>>>>
>>>> All of the usual issues come up with approach:
>>>> - Will BMCWeb pre-load or load-on-demand the JSON file would be 
>>>> pre-loaded.  It certainly will not be loaded for every message.
>>>> - Fallbacks.  For example, if the ja-jp message files does not have 
>>>> the AccountNotModified message, format the en-us message instead.
>>>> - Need a default message.  For example, if BMCWeb tries to sent the 
>>>> message "NotARealMessage" which is not defined in any message file, 
>>>> it might be useful to send the raw data instead.
>>> bmcweb currently provides the given MessageId with a blank Message 
>>> field if it cannot be found in a registry.
>>>
>>>> - We use the Redfish "Base" message registry, and I think we also 
>>>> use an OpenBMC Oem message registry as well.  So BMCWeb will have to 
>>>> load multiple message registries per language.
>>>>
>>>> More:
>>>> - Will a initial set of supported languages be baked into the 
>>>> firmware image (on the BMC's file system) in English or some other 
>>>> languages?
>>>> - Can the BMC admin add and remove supported languages (by adding or 
>>>> deleting JSON message registry files)?
>>>> - Will there be REST APIs for that?
>>>> - Supported by the Redfish spec?
>>>>
>>>> So what the the requirements?
>>>>
>>>> - Joseph
>>>>
>>>> You can see one open source project's work here: 
>>>> http://userguide.icu-project.org/formatparse/messages
>>>>
>>>>>
>>>>> [1] https://www.gnu.org/software/gettext/
>>>>>
>>>>> Andrew
>>>>
> 
