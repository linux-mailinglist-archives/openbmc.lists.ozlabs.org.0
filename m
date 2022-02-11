Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768AE4B2F4F
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 22:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwRRS74Jxz3cBN
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 08:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d45w42qh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=zbigniew.lukwinski@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d45w42qh; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwRR36408z2xYQ
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 08:22:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644614560; x=1676150560;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vSvxfEc0uwKKWXaPKahX3508c8Re0Ko3BUVnpebqrX8=;
 b=d45w42qhEOm3ZcZuZOyX8LnbmzH3AS3EXulQjznTiX9jPGC8e4BCte6o
 n2hGyObzmBXql9qhAZ9nb2boW9zb+zcfmY7vsAguuo9MrzkME/ZTISc5O
 5QE+YR9N5WhE6notl9IXcY4m3kFGew6fP6N7wWgwv2EY/Z8Q5l8+OoBd/
 LJ0QhOyYKAwWB/6VKFApB9IkVbVjQ5FG76ehlxgLmL7WMRkZrC7cJmgHs
 TMpx3nuje3joPAjTaJReQgLV2eyxLtsUzEt/OOJAo4d8dRZNGGMGeRNzL
 iBEHDdGqQeDm+8Z7oJQ8m6NifU3yV5ZEA712VNVOk74EvIWpl6wP+HDOe w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="247403753"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="247403753"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 13:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="602483295"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 11 Feb 2022 13:21:29 -0800
Received: from [10.252.41.232] (zlukwins-mobl.ger.corp.intel.com
 [10.252.41.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 541C7580C25;
 Fri, 11 Feb 2022 13:21:28 -0800 (PST)
Message-ID: <5892de79-ea79-8922-d809-1dd5622a84ad@linux.intel.com>
Date: Fri, 11 Feb 2022 22:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Propose a new application for reading DIMM SPD directly
Content-Language: en-US
To: Michael Shen <gpgpgp@google.com>, Ed Tanous <edtanous@google.com>
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
 <YgQuzD9AkrqstygH@heinlein>
 <CAH2-KxA6MhNXUs+KXAjHTcJe1gWyGwfL+OUQBuCfQnPMSX7GZQ@mail.gmail.com>
 <CAD1rtg8vM-2PckG1Cct7m5tyFJ-axvKQ_ky2z=rzV4O9mZjoWA@mail.gmail.com>
From: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
In-Reply-To: <CAD1rtg8vM-2PckG1Cct7m5tyFJ-axvKQ_ky2z=rzV4O9mZjoWA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/11/2022 1:40 AM, Michael Shen wrote:
> On Thu, Feb 10, 2022 at 6:45 AM Ed Tanous <edtanous@google.com> wrote:
>> On Wed, Feb 9, 2022 at 1:14 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>> On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
>>>> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>> On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
>>>>>> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>>>> On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
>>>>>> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) bus.
>>>>>>  From my understanding, BIOS only needs to read SPD during the POST stage.
>>>>>> For the rest of time, BIOS will hand over the SPD bus to BMC.
>>>>> That seems like it might work.  You'll have to deal with the time when the BIOS
>>>>> has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to also
>>>>> be fed to the BMC as an input GPIO so that you can differentiate between "we
>>>>> don't own the mux" and "all the devices are NAKing us".
>>>> This seems like a nitty gritty design detail that's best handled in
>>>> code when we review it.  I think the important bit here is that there
>>>> are paths where this could work without a significant design issue.
>>> Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ design
>>> and/or code, except that we'd want to document the GPIO line like we do all
>>> others.  I was trying to hint that "if I were involved in this hardware design,
>>> I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the time
>>> just fine and it'll be your problem to debug it when it doesn't.
>> Understood.
> Thanks for all your suggestions. I will keep them in mind during implementation.

What about CLTT? Switching MUX to the BMC makes CPU not able to get DIMM 
temperature. Are you assuming here this feature is enabled in BMC FW?

Are you going to support DCPMM as well? If so, there is another problem 
since switching MUX to BMC you brakes NVDIMM related FW/SW running on 
Host OS.

>>>>> You should take a look at what is already existing in fru-device (part of
>>>>> entity-manager repository).  This is already doing this for IPMI-format EEPROM
>>>>> data.  We should be able to replicate/enhance this code, in the same repository,
>>>>> to handle SPD format.
>>>> I am not sure if it's a good idea to put it into the entity-manager
>>>> repo. As you said EM
>>>> is designed for IPMI-format EEPROM. Adding another parser into that
>>>> repo may violate
>>>> EM's design.
>>> I'm not sure why it would be an issue.  Hopefully one of the maintainers of that
>>> repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is a
>>> design but just the current state of implementation.
>> So long as it can function properly in its current design, i have no
>> problem with FruDevice adding more parsing types.  In fact, there's
>> already patchsets out to add Linkedins proprietary fru type to
>> FruDevice, so in terms of design, Patricks request seems reasonable.
> Got it. Then I will push the code to EM.
