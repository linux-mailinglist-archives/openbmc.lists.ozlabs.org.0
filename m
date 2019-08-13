Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 470908C2B9
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 23:04:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467QFK2FvrzDqSy
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 07:04:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467QD862cYzDqRM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 07:03:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 14:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="183992776"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 14:03:17 -0700
Subject: Re: BMC Operating Mode [Manual / Normal]
To: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <fa89fca6-8b4a-030d-7268-8a97958909f4@linux.vnet.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <de8d57a1-dbd1-2d29-741a-e265e4fc6f7b@intel.com>
Date: Tue, 13 Aug 2019 14:03:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fa89fca6-8b4a-030d-7268-8a97958909f4@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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

On 8/9/19 12:13 AM, vishwa wrote:
> Hi All,
> 
> IBM systems have a need to run BMC either in Manual or Normal Mode. What 
> it means is this:
> 
> Manual: It's mostly a lab / debug mode, where in the system would be 
> booted with recovery disabled.
> For example: If we enter Quiesce state as part of power-on, then BMC 
> remains in Quiesce state and would *not* attempt to re power-on and 
> reboot the system.
> 
> Normal: This is the default customer mode with recovery enabled in BMC.
> For example: If we enter Quiesce state as part of power-on, then an 
> attempt will automatically be done to re power-on and boot the system.

We have a very similar mechanism in our non-OpenBMC stack.  We would
likely be interested in a generic interface for it, although the details
are different, as the BMC doesn't really monitor Quiesce, but the state
of the boot through ACPI and power rails.

> 
> There are other use-cases, where BMC does a Automatic power-on after 
> coming back from an AC loss. Manual / Normal would influence this.

This is classically a separate setting called "power restore policy".  I
suspect you likely want to keep these separate as well, as the power
policy is something that a user is likely to set independent of
lab/debug/manual mode.

> 
> My current thought is to make this a settings in phosphor-settings. 
> Looking to see if others have any use-case like this.

