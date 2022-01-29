Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A804A2A98
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 01:28:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlwDH6zSQz3bcc
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 11:28:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QqvP9wrS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QqvP9wrS; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlwCs3Gbkz30NP
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 11:28:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643416105; x=1674952105;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=O3e88k+TUtZZdNgn2ovgc8cCWRvOeRpnnjH7Rg+pyfE=;
 b=QqvP9wrS8Ffqvw6hNcfcmZZX2yUv/29OT40eSkOHX1GSw7rG9L8a2/2l
 D1mz/tVRArt6zWv+fnd+RlmkV3KPoUMEWSngJ4f7F54o0mrmtFLDxdk5K
 Jhio/fg4JbsvIbEnVAVvqOpUvsOoHPeqlIuNgeHhW4Vd0F4EueEkPAxaB
 r4tSimq26CQf84k4L6vCyMCbkqFhD3dt5FVLkHHOmvKN+dGB5tohx29qE
 GuAHY+kejZXXAS0YMwtEgOMNduIwfC71GhJ/c5zM+3r8k57vHi6cAsIyN
 XJsXQFRgfpSe1bfXBeAYEJMR2s8rimlmyRNEhfSxG917HPtOpJ95hvJXP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="244821974"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="244821974"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 16:27:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; d="scan'208";a="478453788"
Received: from tsduncan-ubuntu.jf.intel.com (HELO [10.7.169.85])
 ([10.7.169.85])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 16:27:21 -0800
Subject: Re: TOF Nominations
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC List <openbmc@lists.ozlabs.org>
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
From: Terry Duncan <terry.s.duncan@linux.intel.com>
Message-ID: <9758e5b1-b600-edc8-659c-25a93dbcfb44@linux.intel.com>
Date: Fri, 28 Jan 2022 16:27:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YeH5uCwUQ02RrGok@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 1/14/22 2:31 PM, Patrick Williams wrote:
> On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
>> On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
>   
>>> * Jan 30th:	Nominations (self or peer) for TOF seats must be sent to the mailing
>>>              list.

I would like to nominate Jason Bills for the TOF. He is well known in 
the LF community and an active contributor to the OpenBMC community. He 
has a long list of submissions[1] going back to October 2018. He is 
active on the mailing lists and the discord channel. He is maintainer of 
five OpenBMC repositories including x86-power-control, 
phosphor-sel-logger, host-error-monitor, libpeci and peci-pcie. Jason 
actively reviews code submissions on these repositories and others [2]. 
Jason will a great asset to the OpenBMC TOF.

[1] 
https://gerrit.openbmc-project.xyz/q/owner:jason.m.bills%2540linux.intel.com,275

[2] 
https://gerrit.openbmc-project.xyz/q/reviewedby:jason.m.bills%2540linux.intel.com


