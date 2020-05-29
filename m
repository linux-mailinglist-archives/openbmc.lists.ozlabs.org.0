Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A01E8462
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:11:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YWLH3syHzDqfp
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 03:11:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YWK461X2zDqfS
 for <openbmc@lists.ozlabs.org>; Sat, 30 May 2020 03:09:59 +1000 (AEST)
IronPort-SDR: ypBMgnfO/VoJCXsTgcLYhcwD2d2dDa2ZRKnQ/igx3oUKFMCf0epIi1ukfvIaUGJfHAEg5xafsE
 aMaPWTWcXTYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 10:09:55 -0700
IronPort-SDR: yQ7s0Kg9BdJTccShddNITy2EtDGmHDQVpGCw2joNLcJ8qM58eT7vm+AX2K5OqgMbSbi6r0rzdP
 B1IWwNZBk70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="256564403"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.148.59])
 ([10.209.148.59])
 by orsmga007.jf.intel.com with ESMTP; 29 May 2020 10:09:54 -0700
Subject: Re: Adding usb-ctrl from intel-bmc into phosphor-misc
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, =?UTF-8?B?6YOB6Zu3?=
 <yulei.sh@bytedance.com>, openbmc@lists.ozlabs.org
References: <CAGm54UEDRmEQVQ-WaRiUa+fpxL0UUe-OZ4rwRZHVLTUJBZZb=A@mail.gmail.com>
 <555375f27645bf26067fba4cfbfc5f5f8ac8c101.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2856971c-8efc-cf48-a8c0-210bba71e92e@linux.intel.com>
Date: Fri, 29 May 2020 10:09:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <555375f27645bf26067fba4cfbfc5f5f8ac8c101.camel@fuzziesquirrel.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/28/2020 5:48 AM, Brad Bishop wrote:
> On Wed, 2020-05-27 at 11:07 +0800, 郁雷 wrote:
>> There is a script [usb-ctrl][1] hosted in intel-bmc.
>> It supports the VirtualMedia feature by insert/eject files to the host
>> as a USB mass-storage device.
>> Comparing to the existing [state_hook][2] in jsnbd, it supports
>> multiple UDCs, so it supports mount multiple files.
>>
>> In addition, I have some updates on the usb-ctrl script to make it
>> support the USB ECM device, which creates a USB ethernet device
>> between BMC and the host.
>>
>> So my proposal is to add the `usb-ctrl` script into the phosphor-misc
>> repo so that it gets reviewed and could be used by upstream.
>>
>> Any ideas?
>>
>> [1]:
>> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/fw-update/files/usb-ctrl
>> [2]:
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-connectivity/jsnbd/jsnbd/state_hook
>>
> 
> I'm the current maintainer of phosphor-misc and I am looking for help
> with that.  I would be fine with adding this script to that repository.
> It would be nice, but not required, to hear from the Intel team that
> they would pull from the new location if we do this...

Yes, we could start using it from there. Just would have to move the 
recipes to point to the right place. CCing Vernon who was the original 
author.

> 
