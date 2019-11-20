Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A776D103095
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 01:12:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hjmj1ytLzDqfN
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 11:12:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hjm544lBzDqWl
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:11:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 16:11:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="196674134"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 19 Nov 2019 16:11:29 -0800
Subject: Re: [PATCH linux dev-5.3] clk: ast2600: enable BCLK for PCI/PCIe bus
 always
To: Joel Stanley <joel@jms.id.au>
References: <20191119235910.31825-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XcPOwn1n=m-ie7_ywnF6zXgHXYoG_ZArd5Tt+0OUPP__w@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <90924ea9-d730-8b5a-e7ca-d894a365ee5f@linux.intel.com>
Date: Tue, 19 Nov 2019 16:11:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcPOwn1n=m-ie7_ywnF6zXgHXYoG_ZArd5Tt+0OUPP__w@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 11/19/2019 4:07 PM, Joel Stanley wrote:
> On Tue, 19 Nov 2019 at 23:59, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> BCLK for PCI/PCIe bus should be enabled always with having the
>> CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
>> initcall phase as an unused clock, and eventually it causes
>> unexpected behavior on BMC features that are connected to the host
>> through PCI/PCIe bus.
> 
> Which features do you see have unexpected behavior? We could load a
> driver instead, which would keep this clock disabled for platforms
> that don't use PCIe. If this isn't an option (eg. VGA) then we can
> include this patch.

Intel platforms don't use any driver which enables it. Intel team was
seeing host freezing issue which is relating to VGA H/W.

Cheers,

Jae
