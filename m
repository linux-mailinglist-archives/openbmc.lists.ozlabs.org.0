Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1FB1B65D5
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 23:01:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497V8K4yP4zDr0p
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 07:01:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497V7D0DY5zDqx5
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 07:00:06 +1000 (AEST)
IronPort-SDR: p6CJ0fIbrZangK1IEKsjhibIyMmBYk9cKm2eQS7Nbbd5yeNKgEOwnOkxa1ng1D7EEnDRiR5YSZ
 /ycdBgQ4s+kQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 14:00:03 -0700
IronPort-SDR: kcBmLu6UwPBZZBLbYqSwfADh6ot8jFPEZllduh8JZO11GZfczXMV3XydaPjO6XYuS2ZiiW4bGL
 dKhmMGAqgNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,309,1583222400"; d="scan'208";a="244995295"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.4.111])
 ([10.209.4.111])
 by orsmga007.jf.intel.com with ESMTP; 23 Apr 2020 14:00:03 -0700
Subject: Re: Access Intel ME IPMB from BMC
To: Vijay Khemka <vijaykhemka@fb.com>, Oskar Senft <osk@google.com>
References: <CABoTLcSOQYY+gk=7Q2w6Ny02L15yM19vTPmJxDfZVst6FV5r+Q@mail.gmail.com>
 <70D0A47B-9C5B-418C-BC1F-7379493C60AA@fb.com>
 <CABoTLcTa-7Fnu9rodg9PrbeZ9wYM7vYPHZK2meEZLx2XW+ZE1Q@mail.gmail.com>
 <B3FB3174-1794-4A57-B850-61F0D8200339@fb.com>
 <CABoTLcStCvQ2fAVudN6q7bexNjuT1_NcEFwjMOR0yePWZ+d=Dg@mail.gmail.com>
 <CABoTLcSriF37EgG9dtwZGfPm-arBG66hsnn380nxYXP4cY1W4w@mail.gmail.com>
 <403834AD-B194-44E8-8904-21610A30D727@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <aa5912c6-de60-f965-368f-1864a521c4d8@linux.intel.com>
Date: Thu, 23 Apr 2020 14:00:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <403834AD-B194-44E8-8904-21610A30D727@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/23/2020 11:59 AM, Vijay Khemka wrote:
> As i2c slave mqueue driver is not upstreamed and with already having 
> same functionality in ipmb-dev driver which is already in uostream 
> kernel, I don’t see any reason to use i2c slave mqueue driver. I highly 
> incourage people to use ipmb-dev driver with latest ipmbbridge. If there 
> are any issues, please let us know.

One issue we ran into is having MCTP and IPMB on the same bus. IPMB 
driver can't handle MCTP traffic, where the mqueue could handle both. 
Kernel also doesn't allow multiple slave addresses on one bus. Haven't 
found a good solution to this one yet.

> 
> Regards
> 
> -Vijay
> 

