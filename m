Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87888113656
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 21:19:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Sqvb3crpzDqLW
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 07:19:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sqtb5HYPzDqRR
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 07:18:45 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 12:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="242977729"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2019 12:18:41 -0800
Subject: Re: Inserting a Redfish Aggregator
To: Richard Hanley <rhanley@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAH1kD+anPrvv4=BEt9MTvqpLNpLEDfa1ERMNQvtXAWrDmv1c2g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <49909d49-5218-e492-aa4b-8602a8baa041@linux.intel.com>
Date: Wed, 4 Dec 2019 12:18:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+anPrvv4=BEt9MTvqpLNpLEDfa1ERMNQvtXAWrDmv1c2g@mail.gmail.com>
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

On 12/3/19 7:14 PM, Richard Hanley wrote:
> Hi everyone,
> 
> 
> I’ve been thinking a bit about how to separate Redfish logic from DBus 
> in bmcweb.
> 
> 
> As a motivating example, imagine a Redfish aggregator that has some 
> chassis that is located outside of its local instance.Once the 
> aggregator finds the external chassis, it needs to add it to the chassis 
> collection.
> 
> 
> However, looking at the current implementation of the 
> ChassisCollection.(located here: 
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hpp#L246) 
> It isn’t clear to me how to add this in.
> 
> 
> The current implementation does some setup on the response payload, and 
> then makes a DBus call to look through the entity manager.The collection 

It's not entity-manager per-say, it's whatever daemon produces the 
correct interface on d-bus. Entity-manager is just one option.

> it sends as a response is entirely defined by the result from the entity 
> manager. I basically see three ways that this could be solved.
> 
> 
>  1. Move the aggregator logic down to the entity manager
>  2. Refactor the Chassis Collection to have its own data model separate
>     from the entity manager.
>  3. Create some service that works on top of the bmcweb implementation
>     of Redfish.
> 
> 
> I think this comes up to a fundamental design decision, how 
> modular/flexible should the Redfish implementation be?Right now bmcweb 
> provides a very sane default implementation, and is tied very closely to 
> the current hardware it is running on.Whereas I am envisioning a Redfish 
> implementation that is a bit more abstracted from any particular hardware.
> 

Can you describe a bit more where the data would come from? Are you 
thinking of multiple bmcs that are physically attached? Non-physically 
attached bmcs? BMCs not running OpenBmc? One idea I had in the past was 
remoting dbus from other systems in some way and creating a clone daemon 
that would show the interfaces from the other systems, although I never 
looked into it much.

> 
> It’s taken me awhile to get up to speed with Redfish, Open BMC, and 
> Google’s infrastructure; but I’m starting to get a more concrete design 
> for an aggregator.However, I’m unsure about whether this should be 
> framed as a new layer on top of the existing implementation, or as a 
> refactor of that implementation?
> 
> 
> I can see some pros and cons between the two, but I’m interested in how 
> everyone feels about this.
> 
> 
> Regards,
> 
> Richard
> 
