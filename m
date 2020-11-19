Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C32B9DF3
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 00:10:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccb4q57gszDqsR
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 10:10:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb3m5YMlzDqnZ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 10:09:38 +1100 (AEDT)
IronPort-SDR: OOc/OZvDLd7ZvIktRsYijwHqNwlgRLGb8iz4ltQj8mSUuS6ZBuTm7KyeQIMHKKzmiPA61NtU6v
 C077KHMZpV0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="150648567"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="150648567"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 15:09:35 -0800
IronPort-SDR: i28x18QHmKiIAGYHLCj9rpkNnWAP2407okhpnvUo9EjcacHmT2c+kCl5vMz1GPfHVeYnFtU3H0
 UO2POel9aUrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="534959769"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 19 Nov 2020 15:09:34 -0800
Received: from [10.251.21.62] (jmbills-MOBL.amr.corp.intel.com [10.251.21.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 32E8F580409;
 Thu, 19 Nov 2020 15:09:34 -0800 (PST)
Subject: Re: [Announce] OpenBMC Discord Community
To: Patrick Williams <patrick@stwcx.xyz>
References: <20201112145740.GB4495@heinlein>
 <5cf1d3c7-d871-103f-f518-9a88a5d0edd4@linux.intel.com>
 <20201119221032.GB1261035@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <ceb778ef-9cdf-75a3-81af-de1e97e3d43b@linux.intel.com>
Date: Thu, 19 Nov 2020 15:09:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201119221032.GB1261035@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/19/2020 2:10 PM, Patrick Williams wrote:
> On Thu, Nov 19, 2020 at 12:51:05PM -0800, Bills, Jason M wrote:
>> On 11/12/2020 6:57 AM, Patrick Williams wrote:
>> However, I hit a situation today that was unexpected.  At its prompting,
>> I installed the desktop app and got connected there instead of through
>> the browser.  From there, I noticed that the app allows voice chatting
>> that appears to be always enabled, but my microphone was muted, so I
>> didn't think anything of it.
>>
>> I booted my system today and Discord started up and connected on its own
>> which I expected.  However, I was halfway through an internal meeting
>> when I realized that the microphone had defaulted to unmuted.  I don't
>> know if it was broadcasting.
>>
>> Looking through the settings, I don't see a way to disable audio by
>> default or an easy way to switch it on and off.  While looking for the
>> audio settings, I also found settings for screen capturing but no clear
>> way to disable it.
>>
>> Does anyone have recommendations on how to configure Discord to allow
>> the communication features we want but disable any background sharing or
>> broadcasting?  Maybe using only the browser would disable some of the
>> sharing features I see in the app?
> 
> Hi Jason,
> 
> I don't recall seeing you in any of the voice channels so I don't think
> anything was broadcast.  A few suggestions:
> 
>     - Make sure you are not joined to one of the Voice Channels, unless
>       you are explicitly wanting to.  The Voice Channels are the only
>       place where voice/video are shared.
Thanks for confirming!
> 
>     - Configure Voice Input Mode to 'Push to Talk' instead of 'Voice
>       Activity'.
>          - Settings -> Voice and Video -> Input Mode (Push to Talk).
>          - This will ensure you are not able to broadcast unless pressing
>            your push-to-talk key binding.  I have mine set to Right-Alt.
Thanks! I'll make this change.
> 
