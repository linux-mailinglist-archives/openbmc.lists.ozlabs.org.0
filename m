Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6522F6C6
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 19:37:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFn752bJJzDsN0
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 03:37:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFn5m4Jf7zF0PV
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 03:35:54 +1000 (AEST)
IronPort-SDR: rrKBzB+qdo7J5sw4EB3+pD3wpl1S2zg+4Fhw7hEw7NtR7De+w3w/1zAk5At2mtGQg57C61Q37Y
 9JN0b6xjIBPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="131145974"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="131145974"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 10:35:51 -0700
IronPort-SDR: pHiZt6P9r9K94u7uDNPQttklXcKZPEsft3GNLYjoUIaBmjnbxYH0EdXXxTXny6yr/mDXxU4Drx
 lTvPtBHuZWsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="394054728"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.107.127])
 ([10.209.107.127])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2020 10:35:50 -0700
Subject: Re: Reg Backplane Inventory Support in Open BMC
To: suresh v <suresh.11v@gmail.com>, openbmc@lists.ozlabs.org
References: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0f1b14e8-744f-29cb-ff19-470107161192@linux.intel.com>
Date: Mon, 27 Jul 2020 10:35:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/24/2020 10:28 AM, suresh v wrote:
> Hi,
> 
> I'm Suresh looking for frame work support of backplane inventory via 
> side band I2C from base board management controller in Open BMC. If 
> there are any support in case, can you please give me some pointers to 
> start of looking at it?

We created this: 
https://github.com/openbmc/s2600wf-misc/tree/master/hsbp-manager

Its very specific to the HSBP we were using, but you might be a helpful 
reference, or you might be able to extend it. If it seems useful let me 
know and I can move it into a common repo.

-James

> 
> Thanks,
> Suresh
