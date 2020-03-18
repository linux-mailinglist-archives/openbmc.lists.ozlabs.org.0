Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB8189FB1
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 16:33:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jDZN4MYbzDqv6
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 02:33:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jDPt75HLzDqTF
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 02:25:36 +1100 (AEDT)
IronPort-SDR: PaFBrCJhLz0NOsaZNsjntJs0SNvPxNBZdC/OMyHa+yY8OdMIPtGAj/w4VwsZBRisMaXK3DPNiH
 e3t3Ga4TL8Yg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 08:25:35 -0700
IronPort-SDR: 9wqfMV48BBRgeZoa24SxkBI9R0nusz1ehTenJRxbFcqxPDk989iJx3Y3r9iaQyZAl8V2rUVeib
 C8DQt/b32pdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="355736932"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.252.44.201])
 ([10.252.44.201])
 by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2020 08:25:33 -0700
Subject: Re: openbmc-specific dynamic security scanner
To: openbmc@lists.ozlabs.org
References: <d2bdd336-88ee-19f7-9215-2c0ede78e3bb@linux.ibm.com>
 <9bb74bdc-bb09-0206-1431-04979e664235@preossec.com>
 <0a426b00-2afa-754e-d3be-bc7b4d44c3d6@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <b2515c7f-94c9-6ec4-6e2b-694fa1b97199@linux.intel.com>
Date: Wed, 18 Mar 2020 16:25:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0a426b00-2afa-754e-d3be-bc7b4d44c3d6@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 17-Mar-20 20:57, Joseph Reynolds wrote:
>> CHIPSEC is a firmware security-centric tool from Intel. It has existing
>> security checks that OpenBMC could use. Main downside -- IMO -- is that
>> it only works on Intel hardware, no support for
>> AMD/ARM/RISC-V/POWER/etc. GPL Python codebase with a bit of asm.
>>
>> https://github.com/chipsec/chipsec
>
> I've been advised before to use CHIPSEC, but my use case is OpenPOWER, 
> and I want this work to be accessible to everyone.
> I would be okay if someone else to incorporate the checks I want check 
> into CHIPSEC, but I don't think I could use the results.

But the BMC itself is ARM (I've just glanced at the IBM OpenBMC recipes, 
looks like it's ol' good ASPEED), right? If so, looks like there's some 
work being done in CHIPSEC for enabling that [1]. Also, AFAIU those 
architecture-specific pieces are not necessarily required, they're just 
there as helpers to read memory, ports, etc. If all you need is to run a 
bunch of commands, I guess just writing a module in Python would do.

A simple script may be okay initially, but I guess over time it will 
grow and people will want to have modularity, fancy logging, whatnot - 
and there using an established framework like CHIPSEC could be a save of 
time and effort. And it being an open source project would only help 
others reuse it, which is one of your goals here. I personally haven't 
used CHIPSEC much so far, but I think the idea behind was to make it a 
generic framework for namely this sort of checks, so at the first glance 
it looks like a perfect location, if only the one that'd require some 
initial assistance from the project maintainers to make sure you can run 
it on ARM - but then again, you'll anyway need to do some foundational 
work in the "script" approach anyway.

regards,
Alexander

[1] https://github.com/chipsec/chipsec/issues/461

