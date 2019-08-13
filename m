Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 898298BEA4
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 18:32:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467JCn5wXDzDqXm
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 02:32:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467JC475ZYzDqNF
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 02:31:44 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 09:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="183917398"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 09:31:41 -0700
Subject: Re: Adding BuildDate field to entity-manager output
To: Patrick Venture <venture@google.com>,
 James Feist <james.feist@linux.intel.com>
References: <CAO=notxCMZBE7+osFBTmTjg_zyC=BLZ3QZhxsnUrKXwE2JqChA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <d1e0c76c-a38d-6a3d-f78a-508b7014ccd6@intel.com>
Date: Tue, 13 Aug 2019 09:31:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notxCMZBE7+osFBTmTjg_zyC=BLZ3QZhxsnUrKXwE2JqChA@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/13/19 9:09 AM, Patrick Venture wrote:
> So, with entity-manager you can specify and interface, some properties
> and how the values should be presented.  For the BuildDate field
> however, the output from FruDevice for that interface doesn't match
> the Asset interface's date property format.
> 
> I merged patch into phosphor-host-ipmid that makes it support parsing
> multiple formats, however, that dbus interface defines the format "by
> description."
> 
> I was curious if it would be worth trying to reinterpret the value
> when publishing it to that dbus interface?  Converting from "%a %b %e
> %H:%M:%S %Y" to "%Y-%m-%d - %H:%M:%S"
> 
> Honestly, I'd be perfectly fine just adding it as-is to the Asset
> interface description since phosphor-host-ipmid knows how to parse it
> (pending: https://gerrit.openbmc-project.xyz/24384).
> 
> Thoughts?
> 
> Patrick
> 

In theory Entity-manager is just forwarding those fields directly
through from FruDevice.  It's not surprising they're incorrect;  I don't
believe there are any uses of them by the external interfaces.  IPMI
just reads the raw FRU bytes, and Redfish doesn't expose the manufacture
date at all.

What I suspect is that we just need to make this line conform to the
right format string.
https://github.com/openbmc/entity-manager/blob/b8293c016074d19d8579c8ef0e1bfee6dff46ab0/src/FruDevice.cpp#L738

And everything else should "just work"
