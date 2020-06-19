Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E0201DED
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 00:17:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pY8R5flbzDrB4
	for <lists+openbmc@lfdr.de>; Sat, 20 Jun 2020 08:17:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pY7j1f6zzDrS4
 for <openbmc@lists.ozlabs.org>; Sat, 20 Jun 2020 08:17:03 +1000 (AEST)
IronPort-SDR: UH2vIWd590uzIr1dQCRte9CD+RvU70HTWe+ihqnD3eexC2nnu4XSvJ2HJA3zVwxjln4y8q0RrM
 QxiYu7D4QN9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="141415355"
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="141415355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 15:17:00 -0700
IronPort-SDR: pJHt37ss9rw2NvbPJrTY7AC5G+UYpPdjsLq0afc07yxmAWHCYTqLRvhgcYUwKZ2H28yDQ7Rv/z
 tGbwQ8hAyOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,256,1589266800"; d="scan'208";a="310306216"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.142.240])
 ([10.212.142.240])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2020 15:17:00 -0700
Subject: Re: "Initial commit" with entire git history - possible?
To: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <43a3c7b0-df25-b4a7-13e7-3d944f892420@linux.intel.com>
Date: Fri, 19 Jun 2020 15:16:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/19/2020 2:10 AM, Adrian Ambrożewicz wrote:
> Hello,
> 
> We're developing solution which will soon end as new openbmc-hosted 
> repository.
> 
> It would be nice to keep previous commit history intact when moving to 
> upstream. Is it possible with our gerrit-based integration?

Maintainers should have push access to move code over, although it'd be 
nice if code could be developed and reviewed in the open if possible.

> 
> Regards,
> Adrian
