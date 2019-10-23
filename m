Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36917E2214
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 19:50:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yybF6cpPzDqS4
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 04:50:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yyZZ12KYzDqQf
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 04:50:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 10:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="372952155"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 23 Oct 2019 10:50:10 -0700
Subject: Re: PSU Sensors - Associations
To: Patrick Venture <venture@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Peter Lundgren <peterlundgren@google.com>, Josh Lehan <krellan@google.com>
References: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <657c3cf2-b6c8-6c02-1397-e09963ebb267@linux.intel.com>
Date: Wed, 23 Oct 2019 10:50:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notw-fwpSrWUssLY_WE07bQCy+38-Dp__B4TrnhL7Yzdnxg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/23/19 10:37 AM, Patrick Venture wrote:
> So, I flipped the association interface addition and the property
> initialization to match other sensors, and then it started working.  I
> was curious if you had any suggestions on how to find the matching
> sensor given the paths, for instance:
> 
> busctl get-property xyz.openbmc_project.PSUSensor
> /xyz/openbmc_project/sensors/temperature/alt2_Temperature
> xyz.openbmc_project.Association.Definitions Associations
> a(sss) 1 "chassis" "all_sensors"
> "/xyz/openbmc_project/inventory/system/board/Altie"
> 
> busctl tree --no-pager xyz.openbmc_project.EntityManager|grep Altie
>            |-/xyz/openbmc_project/inventory/system/board/Altie
>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_0
>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_1
>            | |-/xyz/openbmc_project/inventory/system/board/Altie/al_temp_2
>            | `-/xyz/openbmc_project/inventory/system/board/Altie/alt1
> 
> No alt2 -- so how do I know this?  I can walk every subordinate object
> to find the name match, but I was curious if you had a faster idea?

So for the associations you should generally not look at the definition, 
the definition is primarily for the mapper. You should be looking in the 
mapper for the association that matches the sensor name that you care 
about and it should point back to the configuration. If there are not 
associations for each of the sub-sensors, there should be.

> 
> Thanks,
> Patrick
> 
