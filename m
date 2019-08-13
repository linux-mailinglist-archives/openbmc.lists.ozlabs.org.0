Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68D8BDF5
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:06:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Hd9050SzDqXr
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:06:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467HcR6Ls5zDqXS
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:05:26 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 09:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="260165418"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 13 Aug 2019 09:05:24 -0700
Subject: Re: FruDevice - next device name matching
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
References: <CAO=noty9ksKUrPEvtgJGCmW0P01MBPGV72chtABF=vTyBCyuhg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d1536050-9b41-b84d-451e-ff75cd144811@linux.intel.com>
Date: Tue, 13 Aug 2019 09:05:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=noty9ksKUrPEvtgJGCmW0P01MBPGV72chtABF=vTyBCyuhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/13/19 9:03 AM, Patrick Venture wrote:
> I wanted to verify this was the expected behavior:
> 
>        |-/xyz/openbmc_project/FruDevice/Card
>        |-/xyz/openbmc_project/FruDevice/Card_0
>        |-/xyz/openbmc_project/FruDevice/Card_01
>        |-/xyz/openbmc_project/FruDevice/Card_012
>        |-/xyz/openbmc_project/FruDevice/Card_0123
> 
> It's fine if that is, albeit in the case where we have 11 cards,
> that's going to be problematic.  My theory is, it's meant to increment
> the last number part of the name.  This can be done by a regex parsing
> of the name string and then pulling out the number, incrementing and
> tracking the highest number hit.
> 
> https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L869
> 
> If that's what it should be doing, then I can submit a patch after
> some testing, I just wanted to verify.

The path name just needs to be different, that patch would be great imo.

Thanks

James

> 
> Patrick
> 
