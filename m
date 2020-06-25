Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82D20A54B
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 20:56:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t8PL1syvzDqxM
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 04:56:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t8NV74BvzDqwp
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 04:55:37 +1000 (AEST)
IronPort-SDR: k/+K3KIxnRldaYlj1/ILOYltcweDI41PxfJoVNuAn83DbC0H1iLt0j9mf4Oh7Cg6E73VbhA5+u
 rHpFNhyf6kSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="125279035"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="125279035"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:55:33 -0700
IronPort-SDR: xtGQOaN6v8sYEnCSRn6xjWXu0FAnvxtJmwSYBPHOfaOi7i2KgLsUty3jbcd96MxwTlH120knVQ
 AfNgEuDXuwAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="385553547"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2020 11:55:33 -0700
Received: from [10.251.228.248] (jmbills-mobl.amr.corp.intel.com
 [10.251.228.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 29A1F5804B4
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 11:55:33 -0700 (PDT)
Subject: Re: Redfish EventService Implementation
To: openbmc@lists.ozlabs.org
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
 <20200617204516.GE4618@heinlein>
 <fde794a3-58f9-f332-fd3b-3cfcc116f239@linux.vnet.ibm.com>
 <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
 <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <6fc4c66e-4a0a-1c59-3f77-a6fcff29b97e@linux.intel.com>
Date: Thu, 25 Jun 2020 11:55:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <477bd1782b6c5f9cfea6f6340ecd207a9c01fb20.camel@fuzziesquirrel.com>
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



On 6/25/2020 10:26 AM, Brad Bishop wrote:
> One idea floating around to address these is inventing a journal
> metadata scheme that is management interface agnostic.  I understand the
> motivation behind that - it is much simpler for an application to slide
> a single journal entry into the journal with all the metadata needed to
> generate events, than it is for an application to snoop multiple signals
> off dbus and pull events out of that.
> 
> But I wonder if inventing a management interface agnostic scheme for
> adding events to the journal is really just inventing a new data model
> for how we represent things in a server - e.g. are we just working
> around our dbus data model?  Maybe we should fix it instead, so that it
> isn't so difficult for applications to use it?  With that said I don't
> know how to do this and I could use more concrete details on which areas
> of the data model make it hard to consume signals.  Does anyone have any
> ideas or examples?
> 

On this, I think we may want to separate logging vs. eventing both in 
this feature discussion and in the tools we want to use.

When we were talking about logging, I think the journal made sense since 
it is designed for logging and has benefits around that usage.  However, 
I agree that it doesn't seem like the right tool for sending and 
receiving events and signals and that D-Bus sounds like the right tool 
for that.

I think I'm still a little confused at the scope.  My understanding was 
that this initial design for EventService was only for monitoring event 
messages and not resources in general.  It seems like it may not make 
sense to try to use the same tools and approach for both message 
monitoring and resource monitoring?  Do we need to treat them separately 
for now to simplify the discussion?
