Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B13837C2
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 19:16:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4631WD1tVCzDqt0
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 03:16:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4631Vc0nLfzDqpC
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 03:15:34 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 10:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="258096082"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 06 Aug 2019 10:15:30 -0700
Subject: Re: Supporting eeproms from device-tree in FruDevice
To: Patrick Venture <venture@google.com>
References: <CAO=notzvf3R-fQVEqOjV=W0_P27FgmV4zCWbpkSV3pw0-h9=Kw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <73945f1c-3652-c75c-bc0a-cab9a58515b5@linux.intel.com>
Date: Tue, 6 Aug 2019 10:15:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzvf3R-fQVEqOjV=W0_P27FgmV4zCWbpkSV3pw0-h9=Kw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/5/19 5:31 PM, Patrick Venture wrote:
> I'm nearly done adapting FruDevice to handle FRUs that have drivers
> ready, and raw i2c FRUs.  Before I push the code for review, I wanted
> to get early feedback on the design change.  I wanted to keep it small
> and surgical.
> 
> Basically, for each bus, before it scans for FRUs raw, it searches for
> eeprom files for that bus.  And validates, and adds those devices.
> Those addresses go into a skip list, and another list (used elsewhere
> for writes).  The normal get frus code is then run but it'll skip the
> addresses already handled.  Elsewhere, the code that handles writes to
> the FRUs will check to see if the bus/address is in the list of
> "driver handled" ones, and if so it'll call to write via the eeprom
> file instead of the raw i2c commands.
> 
> Basically, the new code wouldn't interfere with normal operations, but
> just extend it to leverage a driver when it's available.

Sounds great to me.

-James


> 
> Patrick
> 
