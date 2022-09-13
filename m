Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CA5B656E
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 04:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRRnP1zyqz3bmc
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 12:12:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WFX4v6Q/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WFX4v6Q/;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRRmw5kQ4z2xn5
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 12:12:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663035137; x=1694571137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mo0emAiOJ18klsHjvFTruZ4gWXQXs6molcKd5bmMm9s=;
  b=WFX4v6Q/v+CTwUFS19NgmvsQgvvl5hAdC4FM+iz2oeb/MrvQpfYevaL8
   ngBXGLSlzBhvcHLYBEUPFl+vmcc9YGK1Tz/ixvX69SBPQInRduxiejz+g
   +edAj9wyD+c09DMliLfSBnH3FepSCXCzMKquDLl/WPwSkkeZOFTHfapR1
   72IWNLJjJLFr1P18zMCvt3c/kM7uW2r9y7b4Hyt15yggD+7O7P1gY4c6i
   0V9FIRGvWz1aruSgekgclEayhTh+OT0gHwTBhJJ+33oht0llQ+YITpPRS
   /yFN6hStPC8QymYQh1b5PB2Qk90Rh+C0qth8X8rMG0tkUvjrTYtvjsBRh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298018446"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="298018446"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 19:12:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="593739044"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.172.208]) ([10.249.172.208])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 19:12:09 -0700
Message-ID: <36c12486-57d4-c11d-474f-f26a7de8e59a@linux.intel.com>
Date: Tue, 13 Sep 2022 10:12:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
To: Paul Fertser <fercerpav@gmail.com>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
 <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
 <Yxrun9LRcFv2QntR@home.paul.comp>
Content-Language: en-US
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <Yxrun9LRcFv2QntR@home.paul.comp>
Content-Type: text/plain; charset=UTF-8
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2022-09-09 15:43, Paul Fertser wrote:
> Hello,
> 
> On Fri, Sep 09, 2022 at 03:34:53PM +0800, Jiaqing Zhao wrote:
>>> Can you please outline some particular use cases for this feature?
>>>
>> It enables access between host and BMC when BMC shares the network connection
>> with host using NCSI, like accessing BMC via HTTP or SSH from host. 
> 
> Why having a compile time kernel option here more appropriate than
> just running something like "/usr/bin/ncsi-netlink --package 0
> --channel 0 --index 3 --oem-payload 00000157200001" (this example uses
> another OEM command) on BMC userspace startup?
> 

Using ncsi-netlink is one way, but the package and channel id is undetermined
as it is selected at runtime. Calling the netlink command on a nonexistent
package/channel may lead to kernel panic.

Why I prefer the kernel option is that it applies the config to all ncsi
devices by default when setting up them. This reduces the effort and keeps
compatibility. Lots of things in current ncsi kernel driver can be done via
commands from userspace, but I think it is not a good idea to have a driver
resides on both kernel and userspace.
