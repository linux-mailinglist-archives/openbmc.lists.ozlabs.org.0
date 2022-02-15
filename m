Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113BD4B751A
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 21:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JytKH4Wfdz3cCM
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 07:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O/wDzP0d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=zbigniew.lukwinski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O/wDzP0d; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JytJt1kjMz3bPT
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 07:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644957646; x=1676493646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bY9BmFKod1HOc7dwnMoN+m1ulD283ZboMBxETmlB4sw=;
 b=O/wDzP0dOr9ois//rV2YWTgpkRW1Lyzvlp3p4HhYcLWH0/nE0BOE9nPT
 opn65fCcEuBRh2rY6vjZ1oXC2aFgEVNr+n2j+0kSlEKvUUqvOdIiVMQBq
 lcvE4Trnr7K7sGJfCEiDuBO/xXqd6IPTwD+5Wuh2P/tcXLmJjdQ/3jsHG
 65vcpnngCjVl0y5yVmwyJotJNmQ5Up9VzEh21HvYkvuJy+2DroA5ge9VD
 DR/rB3n6nI+V6cdaABXnU4TMpkniPi5+UeQU4LyWyRAcxo8iW10uxTZZ5
 9mEG5enXO8HsCKIQmmWQOXBaag6GVyf1ovPUkYzBbWouFz7mgCRkmgv9w A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="248045591"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="248045591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 12:39:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="544491508"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 15 Feb 2022 12:39:41 -0800
Received: from [10.252.43.27] (joudin-MOBL.ger.corp.intel.com [10.252.43.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0B99958010C;
 Tue, 15 Feb 2022 12:39:39 -0800 (PST)
Message-ID: <54fa7998-223c-f8fe-2fb5-124822a0b06f@linux.intel.com>
Date: Tue, 15 Feb 2022 21:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Propose a new application for reading DIMM SPD directly
Content-Language: en-US
To: Michael Shen <gpgpgp@google.com>, Benjamin Fair <benjaminfair@google.com>
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
 <YgQuzD9AkrqstygH@heinlein>
 <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
 <CAD1rtg8vM-2PckG1Cct7m5tyFJ-axvKQ_ky2z=rzV4O9mZjoWA@mail.gmail.com>
 <5892de79-ea79-8922-d809-1dd5622a84ad@linux.intel.com>
 <CADKL2t7Jrn5LqTu8Yy9CbCaH2VHHe_Ub=gPaH78Hx2-ZHj2g1w@mail.gmail.com>
 <CAD1rtg8Ja4_XMu3O4KBrhJv4kRwezEPYi4J1698uW1_4ff=TiQ@mail.gmail.com>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <CAD1rtg8Ja4_XMu3O4KBrhJv4kRwezEPYi4J1698uW1_4ff=TiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Ed Tanous <edtanous@google.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/15/2022 2:50 AM, Michael Shen wrote:
>> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
>> temperature. Are you assuming here this feature is enabled in BMC FW?
> CPU can still monitor the DIMM temp by reading the MR4 register and
> trigger the DIMM throttling if needed. So I think the CLTT will not be
> affected.
> If CPU needs something more than MR4 register provided, BMC can assist
> it in another separate daemon like Benjamin mentioned.

Got it.

> On Tue, Feb 15, 2022 at 6:17 AM Benjamin Fair <benjaminfair@google.com> wrote:
>> On Fri, 11 Feb 2022 at 13:21, Zbigniew, Lukwinski
>> <zbigniew.lukwinski@linux.intel.com> wrote:
>>> On 2/11/2022 1:40 AM, Michael Shen wrote:
>>>> On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
>>>>> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>>> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
>>>>>>> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>>>>> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
>>>>>>>>> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>>>>>>> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
>>>>>>>>> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
>>>>>>>>>   From my understanding, BIOS only needs to read SPD during the POST stage.
>>>>>>>>> For the rest of time, BIOS will hand over the SPD bus to BMC.
>>>>>>>> That seems like it might work.  You'll have to deal with the time when the BIOS
>>>>>>>> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
>>>>>>>> be fed to the BMC as an input GPIO so that you can differentiate between "we
>>>>>>>> don't own the mux" and "all the devices are NAKing us".
>>>>>>> This seems like a nitty gritty design detail that's best handled in
>>>>>>> code when we review it.  I think the important bit here is that there
>>>>>>> are paths where this could work without a significant design issue.
>>>>>> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
>>>>>> and/or code, except that we'd want to document the GPIO line like we do all
>>>>>> others.  I was trying to hint that "if I were involved in this hardware design,
>>>>>> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
>>>>>> just fine and it'll be your problem to debug it when it doesn't.
>>>>> Understood.
>>>> Thanks for all your suggestions. I will keep them in mind during implementation.
>>> What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM
>>> temperature. Are you assuming here this feature is enabled in BMC FW?
>> BMC could assist with CLTT, but since this is CPU-specific it would
>> belong in a separate daemon. That daemon could get the relevant
>> temperatures over D-Bus using the standard sensor interface, so I
>> don't think it should affect the design for this component.
>>
>>> Are you going to support DCPMM as well? If so, there is another problem
>>> since switching MUX to BMC you brakes NVDIMM related FW/SW running on
>>> Host OS.
>> There are no plans currently for supporting NVDIMMs, just DDR5 at
>> first as Michael mentioned, and possibly other DDR versions in the
>> future.

I see. So the app will just read SPD non-volatile content and provide it 
for user, e.g. over DBus, right?

Are you going to access DIMM periodically? It seems that it shall be 
enough to access DIMMs once per ac cycle/dc cycle. And just return SPD 
ownership to the CPU for the rest of time.

>>>>>>>> You should take a look at what is already existing in fru-device (part of
>>>>>>>> entity-manager repository).  This is already doing this for IPMI-format EEPROM
>>>>>>>> data.  We should be able to replicate/enhance this code, in the same repository,
>>>>>>>> to handle SPD format.
>>>>>>> I am not sure if it's a good idea to put it into the entity-manager
>>>>>>> repo. As you said EM
>>>>>>> is designed for IPMI-format EEPROM. Adding another parser into that
>>>>>>> repo may violate
>>>>>>> EM's design.
>>>>>> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
>>>>>> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
>>>>>> design but just the current state of implementation.
>>>>> So long as it can function properly in its current design, i have no
>>>>> problem with FruDevice adding more parsing types.  In fact, there's
>>>>> already patchsets out to add Linkedins proprietary fru type to
>>>>> FruDevice, so in terms of design, Patricks request seems reasonable.
>>>> Got it. Then I will push the code to EM.
