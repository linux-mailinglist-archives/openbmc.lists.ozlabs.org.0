Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 737782F4372
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 06:01:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFwJv3J7CzDqx2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 16:01:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFwHr1G90zDqnk
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 16:00:35 +1100 (AEDT)
IronPort-SDR: YZ4ypmb7LqbPliOQOzyPdr2OQ9bKyoR+tXSCtAtkf0VI8EL92NvWwmEMBU6SgfNId4aHzDL2f9
 3DUwXhkdPXuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165238653"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="165238653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 21:00:30 -0800
IronPort-SDR: FP48N47+RcJ93LXxcc73nswg3Ox45QuNXrlE07+BRSfJHMtHxSimnctnOpiCE8/ySgtMEVFCsD
 XvrhVYWcY8mA==
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="353316381"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.215.187.50])
 ([10.215.187.50])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 21:00:28 -0800
Subject: Re: Call for volunteers
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <3c7a3bfc-dcc6-2295-c327-8ba2c7e91e47@linux.intel.com>
Date: Wed, 13 Jan 2021 10:30:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

I will volunteer.

Regards,

Richard

On 1/12/2021 3:39 AM, Brad Bishop wrote:
> Hello OpenBMC-ers!
>
> Your TSC has been aware of the problem of fragmentation in our project 
> for some
> time.  Fragmentation is a loose term - for the purposes of this note 
> consider
> it to be any time contributor efforts in the community are duplicated 
> without
> thought given to maintenance and/or compatibility.
>
> To begin to address this issue the TSC is looking for volunteers to 
> serve on a
> "repository review forum" to which the TSC will initially delegate its
> authority in the areas of:
> - new repository creation
> - placement of contributed new function into existing repositories
>
> The TSC fully expects the scope of this forum to quickly grow into the 
> role of
> a traditional TSC providing frequent, technical oversight to project
> contributors.  The current TSC will continue to serve the project in 
> terms of
> governance, advocacy and industry exposure - and likely get a rename 
> (OpenBMC
> Board? or OpenBMC Steering Committee?) in the process.
>
> The new forum would meet periodically or at the demand of other forum 
> members
> to:
> - raise the forums combined awareness of new function under development
>   (information exchange)
> - build a consensus within the forum on where the function should exist
> - inform the function contributor and the rest of the community of the 
> decision
>
> A successful forum would be a forum that can simultaneously encourage the
> contribution of new and innovative solutions to existing problems without
> introducing complexity to the project as a whole.
>
> A successful forum member will have previously demonstrated a breadth of
> understanding of the upstream OpenBMC codebase through:
> - frequent participation in peer review, the mailing list, IRC, and 
> Discord.
> - submission of high quality designs and code to upstream OpenBMC
>   (github.com/openbmc)
> - a history of working with and guiding less experienced OpenBMC 
> developers
>   in a timely manner, enabling them to come up to speed quickly.
>
> If you are interested in serving the project in this manner, please 
> reply to
> submit yourself as a candidate.
>
> -brad, on the behalf of the OpenBMC TSC
