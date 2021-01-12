Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD662F233E
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 01:09:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF9tD6cvfzDqfK
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 11:09:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF9sJ0wnhzDqX9
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 11:08:34 +1100 (AEDT)
IronPort-SDR: ECxnb4bOe1YcziuguuTFA3GBmECexVm4Gbs8Q1HEqtAsVRQiVRcs270Th+7qvuGxQACWy7SiCp
 ihVYmSNEFoKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="242028210"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="242028210"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 16:08:31 -0800
IronPort-SDR: QwyGQYbmiyCQBLn1MVrulPo6uZqDxqycmtldsAUiwVcOLluhjbSKfGa4B6RgDSudfPlafp3Rgf
 PTSNEGTDJPtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="399987622"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2021 16:08:31 -0800
Received: from [10.209.69.170] (jmbills-MOBL.amr.corp.intel.com
 [10.209.69.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 103D3580910
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 16:08:29 -0800 (PST)
Subject: Re: peci-pcie CI issues
To: openbmc@lists.ozlabs.org
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <0759e6524c910c8d24f1453dbbe226bc3460e588.camel@yadro.com>
 <CACWQX80E873CA2_LH7kVXHoGjuAZGUM21rxA6nsk8gMG-Ocemg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <50d6828a-3460-884e-c107-4b0fe5f1396d@linux.intel.com>
Date: Mon, 11 Jan 2021 16:08:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX80E873CA2_LH7kVXHoGjuAZGUM21rxA6nsk8gMG-Ocemg@mail.gmail.com>
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



On 12/24/2020 10:53 AM, Ed Tanous wrote:
> On Thu, Dec 24, 2020 at 10:34 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
>>
>> Well, then probably we can wait.
>> How far this could happens?
> 
> Whenever the work gets done.  Someone needs to:
> Send a patch to yocto upgrading the boost recipe.
> Wait for the meta-layer bump to run (I think Andrew runs the job once a week).
> Resolve any issues with the bump when it gets merged to OpenBMC.
> 
> There's no exact timelines on the above, but you can certainly
> accelerate it by doing step 1, after which you're probably looking at
> a couple weeks before we get it in OpenBMC.

It looks like upstream Yocto picked up boost 1.75: 
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-support/boost.

> 
>>
>> On Thu, 2020-12-24 at 10:23 -0800, Ed Tanous wrote:
>>> On Thu, Dec 24, 2020 at 10:07 AM Patrick Williams <patrick@stwcx.xyz>
>>> wrote:
>>>> We have had this issue with a number of repositories lately. The
>>>> most recent version of boost::asio does not allow -fno-rtti.  The
>>>> makefile needs to be changed to no longer force this option.
>>>
>>> Or, as another option, just wait until boost 1.75.0 lands in yocto
>>> master and subsequent openbmc bump.  It was released a couple weeks
>>> ago and fixes this issue.  We'll likely be adding the no-rtti flags
>>> back to most of the repos shortly after that.
>>>
>>>> Sent from my iPhone
>>>>
>>>>> On Dec 24, 2020, at 9:48 AM, Andrei Kartashev <
>>>>> a.kartashev@yadro.com> wrote:
>>>>>
>>>>> ﻿Hello Jason,
>>>>>
>>>>> I push several patches to peci-pcie repo, but looks like CI
>>>>> broken
>>>>> there. Could you take a look on how to fix CI?
>>>>>
>>>>> [ 90%] Building CXX object CMakeFiles/peci-
>>>>> pcie.dir/src/peci_pcie.cpp.o
>>>>> In file included from
>>>>> /usr/local/include/boost/asio/execution.hpp:19,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/system_executor.hpp:20,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/associated_executor.hpp:22,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/detail/bind_handler.hpp:20,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/detail/wrapped_handler.hpp:18,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/io_context.hpp:23,
>>>>>                  from
>>>>> /usr/local/include/boost/asio/io_service.hpp:18,
>>>>>                  from /home/jenkins-op/workspace/ci-
>>>>> repository/openbmc/peci-pcie/src/peci_pcie.cpp:22:
>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp: In
>>>>> static member function â€˜static const std::type_info&
>>>>> boost::asio::execution::detail::any_executor_base::target_type_vo
>>>>> id()â€™:
>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp:811:23:
>>>>> error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™
>>>>>   811 |     return typeid(void);
>>>>>       |                       ^
>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp: In
>>>>> static member function â€˜static const std::type_info&
>>>>> boost::asio::execution::detail::any_executor_base::target_type_ex
>>>>> ()â€™:
>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp:851:21:
>>>>> error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™
>>>>>   851 |     return typeid(Ex);
>>>>>       |                     ^
>>>>>
>>>>> --
>>>>> Best regards,
>>>>> Andrei Kartashev
>>>>>
>>>>>
>> --
>> Best regards,
>> Andrei Kartashev
>>
>>
