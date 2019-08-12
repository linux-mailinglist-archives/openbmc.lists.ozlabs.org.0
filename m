Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB08AB9D
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 01:58:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466t8k2cdgzDqcD
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 09:58:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466t896kZ6zDqWv
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:57:55 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 16:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,379,1559545200"; d="scan'208";a="183715681"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2019 16:57:52 -0700
Subject: Re: template replacement
To: openbmc@lists.ozlabs.org
References: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <3f980968-f67f-1529-e681-e351c597a2ff@intel.com>
Date: Mon, 12 Aug 2019 16:57:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notykGFd7Ux3k6OcsskrKTAxLa=vEiybFD3agPuqkGoYG-Q@mail.gmail.com>
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

On 8/12/19 9:10 AM, Patrick Venture wrote:
> I've run into an issue and before I submitted a patch to solve my
> specific problem, I wanted to get a sense of what was intended:
> 
> I have a field "name" that I want to set dynamically to "$bus_v2345_0_local"
> It finds the $bus match but then fails on the split.
> If I add a " " it then fails as well.
> 

Probably just a bug.  A quick scan of $bus in the configurations shows
that we've only ever used it in cases where it was the complete string
(ie "$bus") and even then, only used to populate numeric interfaces with
the bus number to be used programmatically by downstream sensors.

Some of the intent was to largely remove the bus number from the device
naming convention, as outside the system the bus topology is largely
irrelevant.  With that said, I could see how that might be desired for
some setups.


> It seems to be that if a template is at the end of the field, it works
> fine, otherwise it assumes there must be some operation to perform.
> 
> Did you already have a fix in mind?

James is out the next few days, so his answer might differ from mine
when he gets back, but I don't think we knew about this issue previously.
