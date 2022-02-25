Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E094C48BA
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 16:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4tpm39ncz3bTr
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 02:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D7UBQnIH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D7UBQnIH; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4tpM6Vt0z30Dv
 for <openbmc@lists.ozlabs.org>; Sat, 26 Feb 2022 02:23:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645802620; x=1677338620;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z/5M7QiXuofQ+KJbba92sRiTgp55YDyOlLX+xNeQKl8=;
 b=D7UBQnIHWU0RmmPg8j41ugbVbasNDbCojFaAOzQFcJYIpPk++XMazRyP
 AMOBuksaNGlit5DEQjPacvfxJpoxE6gKvoyjsfMPy8z0DcMPsmU9gWVq0
 k8rbZxUJQeSDxQFFMn1r6ZYQrba7VKkidjVtaFyaT3R0RDMmpZwSpQW44
 OlhGhKa9+u9OOsem/Q/i3fTq4Kwkc9SKq6v27l32sG8e4rViYqbatwqXA
 F5DAj40OtTvuZSG6fAprKifOKWd9oOr5vrpjTfr0Nty3yC0b0lrHDFGem
 Pyer155NtZy/UnOpGdlpqATJ9rq3Tk9J/7dsRmyNkUKYP+ZK8DsaX71Hx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236021697"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="236021697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="607789654"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 07:22:35 -0800
Received: from [10.251.8.175] (jmbills-MOBL.amr.corp.intel.com [10.251.8.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A49EE5808DB;
 Fri, 25 Feb 2022 07:22:34 -0800 (PST)
Message-ID: <d00832b5-e5af-5818-2634-a05bbb22852c@linux.intel.com>
Date: Fri, 25 Feb 2022 08:22:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
 <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
 <7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>
 <CACPK8XdsoL9_aTJL2KV9KD-djtiLRsJnHqWzL6gTWOMKRkjKOw@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CACPK8XdsoL9_aTJL2KV9KD-djtiLRsJnHqWzL6gTWOMKRkjKOw@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/24/2022 9:49 PM, Joel Stanley wrote:
> On Thu, 24 Feb 2022 at 21:03, Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
>>
>>>
>>> Jason, you should send the patch to the upstream lists (use
>>> get_maintainers.pl) for review.
>> Sorry for the delay.  I found the right lists with get_maintainers.pl.
>> Should I send these patches to the upstream lists as they are, or do
>> they need to be tweaked?
> 
> You've got some review comments from Andrew and Zev that you should
> address. I suggest replying to them, and adding the pinctrl list on
> cc. Then when you post v2 you can send them to the upstream lists.
> 
> If you'd prefer to just send a v2 to the upstream lists to restart the
> discussion you could do that too. Your call.
Thanks! Unless I missed something, I didn't see any specific feedback 
that would require a v2, yet.

It sounded like Andrew was theorizing a better implementation and was 
going think on it some more.  So, would it be better to wait for a 
cleaner implementation of this before we send it upstream?

Thanks,
-Jason


> 
> Cheers,
> 
> Joel
