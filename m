Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 033621E7220
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 03:39:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y6g60SnRzDqV5
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 11:39:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=vikram.bodireddy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xtqk6zMdzDqKh
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 02:45:51 +1000 (AEST)
IronPort-SDR: BBCOZbdSwDpAqaYmIzjb8pokrYZRp3QPDSzYB3kqCu8xymTtA3xROJDEWUpcidIXwwLUe6Ryl2
 CZtiYHslGOfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 09:45:33 -0700
IronPort-SDR: hxkRM0VqJqDlmjjPnRqlpjy9xhSLKE9LwC7oa+JVBl2tcagkBo35MLOxgyXxZ0Z5KtwkAhrhk0
 mxA2ra35dxRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="414660987"
Received: from vbodired-mobl1.gar.corp.intel.com (HELO [10.213.67.156])
 ([10.213.67.156])
 by orsmga004.jf.intel.com with ESMTP; 28 May 2020 09:45:30 -0700
Subject: Re: openBMC eMMC image support
To: Adriana Kobylak <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au, andrew@aj.id.au
References: <c2d7ecb8-b0b8-c5a3-12e7-7201fbd86b1a@linux.intel.com>
 <b13a0e82-4f88-f35b-0d3f-8f7d6a91351b@linux.intel.com>
 <b8407f3ebaa1e5d24750551f4ad4f3aa@linux.vnet.ibm.com>
From: "Bodireddy, Vikram" <vikram.bodireddy@linux.intel.com>
Message-ID: <48aa2966-cca6-342c-32f3-13493cfd9399@linux.intel.com>
Date: Thu, 28 May 2020 22:15:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <b8407f3ebaa1e5d24750551f4ad4f3aa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 29 May 2020 11:35:31 +1000
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
Cc: richard.marian.thomaiyar@linux.intel.com, suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Adriana.

I will ping you on IRC. Can you please add me and Surya to all of the 
eMMC reviews.

Do we have any document on the image build changes that needed for eMMC?

On 27-05-2020 20:06, Adriana Kobylak wrote:
> Hi Vikram,
>
> On 2020-05-27 09:03, Bodireddy, Vikram wrote:
>> +Richard
>>
>> On 25-05-2020 15:29, Bodireddy, Vikram wrote:
>>> Hi Andriana,
>>>
>>> We are working on enabling OpenBMC eMMC support for Intel platforms.
>>>
>>> I see that you had started on it, and enabling it for ibm platforms.
>>>
>>> We would like to co-work with you to get to know eMMC support status 
>>> and  to contribute further to complete it.
>
> Great!
>
>>>
>>> Can you please help with the current status of OpenBMC eMMC support?
>
> For code update support, I’ll be pushing changes to gerrit for 
> phosphor-bmc-code-mgmt today/tomorrow to support eMMC.
> On the build side, there are a few WIP changes that I’ll be refreshing 
> this week as well, will tag them as ‘mmc’ on gerrit to be able to find 
> them, some previous commits have the topic ‘wic’ and ‘mmc’ already but 
> are in Abandoned or WIP, will be cleaning them up this week.
> Updates to the emmc doc: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28443
>
>>>
>>> Also can you let us know your availability this week for a sync 
>>> meeting on the same?
>
> Ping me on IRC, any time during the day CST time, or if it's later at 
> night like 8/9pm CST time we can have Joel/Andrew J join us as well.
>
>>>
>>> Thanks
>>>
>>> Vikram
>>>
