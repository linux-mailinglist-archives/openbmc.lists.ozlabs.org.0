Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC398C47E
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 00:51:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467SdJ2HhVzDqMv
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 08:51:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Scd75frzDqcM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 08:51:12 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 15:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="260268945"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 13 Aug 2019 15:51:09 -0700
Subject: Re: template replacement
To: Patrick Venture <venture@google.com>
References: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <2c182361-b1f6-b639-0415-52dda35150ed@linux.intel.com>
Date: Tue, 13 Aug 2019 15:51:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
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

On 8/12/19 9:10 AM, Patrick Venture wrote:
> I've run into an issue and before I submitted a patch to solve my
> specific problem, I wanted to get a sense of what was intended:
> 
> I have a field "name" that I want to set dynamically to "$bus_v2345_0_local"
> It finds the $bus match but then fails on the split.
> If I add a " " it then fails as well.
> 
> It seems to be that if a template is at the end of the field, it works
> fine, otherwise it assumes there must be some operation to perform.
> 
> Did you already have a fix in mind?

I pushed a patch to add unit tests to this function so we can work apart 
the issues we're seeing. I think this specific issue was fixed in my patch.

-James

> 
> Patrick
> 
