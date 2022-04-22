Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5550C497
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 01:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlVsb3gYwz3bXq
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 09:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y9TCiT88;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y9TCiT88; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlVs86701z2yJw
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 09:26:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650669965; x=1682205965;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fcHd+ZwPMz9mOvNncL7UgE5owy97AJf2d5DvLn1hMd4=;
 b=Y9TCiT88y5Jpg6073W75C9XYMBJQv/Cq+7bFfY7f1pOwWhNfTZKJ8Kt4
 a4mMm3vpy9z9aMWN/Gk/N21Jfa6+m7TK8JFCYCvLwkTVVQscB8glqaUSM
 sigfNjqpgeDga+IArq3MNJM9lK8GzXhFaHDijfy1cYjFkCK2h7HcZQpm9
 2wXqtspGiw5ora9qwoM8/UBPwmRQqgZgdbzw41UruOf15d1p9kBynbP9U
 NpkrOvgxMmh9XwnrtI5DYsK5ekucO0IobjUuKLvpNPSalnq91MMIjCUE+
 m+vY/z/dteh5xvV1aPKNVXUbcRoE9ap+rI5kfgTKZz7V3q49SBEhRC/w7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="289939665"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="289939665"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 16:25:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="534665738"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 16:25:01 -0700
Date: Fri, 22 Apr 2022 16:24:56 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: IPMI Restriction Mode
Message-ID: <20220422232456.GA661800@mauery.jf.intel.com>
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 Amithash Prasad <amithash@fb.com>, deepak.kodihalli.83@gmail.com,
 velumani.hcl@gmail.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18-Apr-2022 04:56 PM, Kumar Thangavel wrote:
>Thanks for the response and clarification.
>
>I will clarify my question here,
>
>IPMI restriction mode support has been added for host devices which support
>IPMI.
>This restriction mode support can be enabled or disabled from the
>phosphor-settingsd configuration (.yaml) file.
>
>Please check the below link for .yaml file of phosphor-settingsd.
>
>https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>
>We wanted to add restriction mode support for other IPMI based devices
>(Debug card).
>Already phosphor-ipmi-host supports filters for all  IPMI commands which
>have ipmi::Context objects.
>So, How can we enable/disable this restriction mode support
>from phosphor-settings for other IPMI based devices(Debug card). ?

I understand that currently only the host channel is using the 
restriction mode. You want to add it for other channels. This has 
already been done in the intel-ipmi-oem repo, if you want to take a look 
at that. It allows a fine-grained mechanism for command filtering, based 
on the channel and the restriction mode (although currently, I think the 
restriction mode still only applies to the host channel).

My point is that it is pretty easy to come up with a custom filter 
mechanism that should suit you. There is even an option to disable the 
built-in filter so you can supply your own.

--Vernon

>
>
>
>On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery <vernon.mauery@linux.intel.com>
>wrote:
>
>> On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
>> >Hi All,
>> >
>> >        IPMI Restriction mode support has been added for host machines
>> >which support IPMI.
>> >
>> >
>> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>> >
>> >        How IPMI restriction mode support can be added for other than host
>> >devices (IPMI based devices). Ex Debug card.  ?
>>
>> I am not exactly sure what you are asking for here. When you say other
>> devices, are you asking about restricting commands based on what channel
>> they come in on?
>>
>> This is possible. A filter can filter on any criteria that is available
>> with the ipmi::Context object and the command. It can even extract
>> command data and take action there. I only say this if you are
>> interested in writing a new filter of your own.
>>
>> But if you want to see a filter that is already implemented that
>> restricts commands based on BMC state and incoming channel, you can look
>> at the filtering done in the intel-ipmi-oem repo.
>>
>> If my guess at what you meant was wrong, please clarify and I will try
>> again.
>>
>> --Vernon
>>
>> >        Could you please provide any suggestions or any docs ?
>> >
>> >Thanks,
>> >Kumar.
>>
