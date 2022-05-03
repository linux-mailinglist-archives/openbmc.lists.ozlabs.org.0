Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5E519222
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 01:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtFv34LtBz3bdq
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 09:06:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TTTFf2rK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TTTFf2rK; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtFtc0m9Sz2xnM
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 09:05:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651619144; x=1683155144;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1anZxJ2+f3tWJ+FctnwMJ0shUhcZuPr+nIMsYZOzy38=;
 b=TTTFf2rKz/imMVnnkC+ty+rPoVJRE3cw1Cjm1QDkt0xIXhsKFZo604X6
 e4KNUsPerhvQaxqNpu2Lk26dWhXLwNxBYTPmvq4Xl7Xhpb6biqo1t1e6v
 GvijYgWhykw7soI1E0ldo9tzEltXIlE8pOmMrBCQGJco7vdL0U5hPsTV+
 rfaSSOTWEe1DKu9jQA2QCJhTibbvS4toR4xK2EzCQkQZZl2KCm+bD97QS
 WwkfzftME28Y0MMHkx9fFE2NU8pmPKLJQpZ7b2OXx5ddXi1/X04J/pxTw
 bdZ6Jo4bqRDHs3U4mANFgk8bbVZL9LUz2kmZXTGOsYJSLp48n4KCa5jB7 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="292802862"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="292802862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:04:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="692700938"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:04:38 -0700
Date: Tue, 3 May 2022 16:04:33 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: IPMI Restriction Mode
Message-ID: <20220503230433.GA884273@mauery.jf.intel.com>
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
 <20220422232456.GA661800@mauery.jf.intel.com>
 <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
 <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
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
 velumanit@hcl.com, velumani.hcl@gmail.com, deepak.kodihalli.83@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03-May-2022 07:46 PM, Kumar Thangavel wrote:
>Hi Vernon,
>
>     We may need to write our own custom filter for other channels as you
>suggested.
>     While implementing this, we need some clarifications.
>
>     1. How can we map channel Id's with settingsd restriction mode
>dbus-objects ?

Set up a restriction mode object for each channel? This is really up to 
your implementation.

>     2. The Ipmb channel has multiple devices in our system, How can we
>handle and apply this multiple Ipmb interfaces with
>settingsd restriction mode dbus-objects ?
>
>     Please refer below link for multiple Ipmb channels for our system.
>

When ipmb channel commands come in, there is also rqSA set in the 
ipmi::Context. This should be unique per device. Will this work for you?

--Vernon

>https://github.com/openbmc/openbmc/blob/master/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ipmb-channels.json
>
>      Already we have "hostIdx'' in ipmi::Context struct, which represents
>the data coming from which hosts. Even Though if we plan to use this
>"hostIdx" ,  it is still not clear how we can map this "hostIdx'' with
>settingsd restriction mode dbus-objects.
>
>   Otherwise, can we have some Schema(Rules) to follow the channel order
>for this channel and devices(settingsd dbus-objects) mapping ?
>    Ex:   First 4 or 6 channel is for host 1 - host4
>             Next channel is for  Debug card,
>             Rest of the channel is for other devices.
>
>   I think we need to maintain this order in settingsd config file and
>ipmb-channels.json config file for this channel and device mapping.
>
>  Could you please provide your suggestion on this.
>
>Thanks,
>Kumar.
>
>On Tue, Apr 26, 2022 at 9:25 PM Kumar Thangavel <
>kumarthangavel.hcl@gmail.com> wrote:
>
>> Thanks for your response and suggestions.
>>
>> --Kumar.
>>
>> On Sat, Apr 23, 2022 at 4:55 AM Vernon Mauery <
>> vernon.mauery@linux.intel.com> wrote:
>>
>>> On 18-Apr-2022 04:56 PM, Kumar Thangavel wrote:
>>> >Thanks for the response and clarification.
>>> >
>>> >I will clarify my question here,
>>> >
>>> >IPMI restriction mode support has been added for host devices which
>>> support
>>> >IPMI.
>>> >This restriction mode support can be enabled or disabled from the
>>> >phosphor-settingsd configuration (.yaml) file.
>>> >
>>> >Please check the below link for .yaml file of phosphor-settingsd.
>>> >
>>> >
>>> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>>> >
>>> >We wanted to add restriction mode support for other IPMI based devices
>>> >(Debug card).
>>> >Already phosphor-ipmi-host supports filters for all  IPMI commands which
>>> >have ipmi::Context objects.
>>> >So, How can we enable/disable this restriction mode support
>>> >from phosphor-settings for other IPMI based devices(Debug card). ?
>>>
>>> I understand that currently only the host channel is using the
>>> restriction mode. You want to add it for other channels. This has
>>> already been done in the intel-ipmi-oem repo, if you want to take a look
>>> at that. It allows a fine-grained mechanism for command filtering, based
>>> on the channel and the restriction mode (although currently, I think the
>>> restriction mode still only applies to the host channel).
>>>
>>> My point is that it is pretty easy to come up with a custom filter
>>> mechanism that should suit you. There is even an option to disable the
>>> built-in filter so you can supply your own.
>>>
>>> --Vernon
>>>
>>> >
>>> >
>>> >
>>> >On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery <
>>> vernon.mauery@linux.intel.com>
>>> >wrote:
>>> >
>>> >> On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
>>> >> >Hi All,
>>> >> >
>>> >> >        IPMI Restriction mode support has been added for host machines
>>> >> >which support IPMI.
>>> >> >
>>> >> >
>>> >>
>>> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>>> >> >
>>> >> >        How IPMI restriction mode support can be added for other than
>>> host
>>> >> >devices (IPMI based devices). Ex Debug card.  ?
>>> >>
>>> >> I am not exactly sure what you are asking for here. When you say other
>>> >> devices, are you asking about restricting commands based on what
>>> channel
>>> >> they come in on?
>>> >>
>>> >> This is possible. A filter can filter on any criteria that is available
>>> >> with the ipmi::Context object and the command. It can even extract
>>> >> command data and take action there. I only say this if you are
>>> >> interested in writing a new filter of your own.
>>> >>
>>> >> But if you want to see a filter that is already implemented that
>>> >> restricts commands based on BMC state and incoming channel, you can
>>> look
>>> >> at the filtering done in the intel-ipmi-oem repo.
>>> >>
>>> >> If my guess at what you meant was wrong, please clarify and I will try
>>> >> again.
>>> >>
>>> >> --Vernon
>>> >>
>>> >> >        Could you please provide any suggestions or any docs ?
>>> >> >
>>> >> >Thanks,
>>> >> >Kumar.
>>> >>
>>>
>>
