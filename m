Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BDD46A0
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 19:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qZjm17mbzDqcv
	for <lists+openbmc@lfdr.de>; Sat, 12 Oct 2019 04:30:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qZj21r0mzDqbY
 for <openbmc@lists.ozlabs.org>; Sat, 12 Oct 2019 04:30:07 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 10:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="207469770"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2019 10:30:03 -0700
Subject: Re: Getting DIMM size in Redfish
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtkkYGh5wGLYDEhHkG9B8QL-9ezW=n_a9R4-Wy-h4UWHig@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <c912e53f-bc5e-ca3a-f004-92784eea9d9d@intel.com>
Date: Fri, 11 Oct 2019 10:30:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtkkYGh5wGLYDEhHkG9B8QL-9ezW=n_a9R4-Wy-h4UWHig@mail.gmail.com>
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

On 10/10/19 8:01 PM, Lei YU wrote:
> This mail is to discuss how to get DIMM size in Redfish (bmcweb).
> 
> Currently, bmcweb does not report DIMM size because it's not
> implemented, and we are trying to implement this.
> 
> The DIMM interface is defined in [phosphor-dbus-interface][1], which
> does not provide any metadata.
> 
> For OpenPOWER systems, the size information is provided in `PrettyName`, e.g.
> 
>     "PrettyName": "DDR4-2666 32GiB 64-bit ECC RDIMM"

My issue with this is twofold.

1. So far as I can tell, there's no formal definition for what this
string should entail.  phosphor-dbus-interfaces lists it as "The human
readable name of the item."  Parsing this as a machine readable
parameter doesn't meet that intent.

2. I don't think that interface covers the full range of DIMM parameters
that can be set in Redfish.

> 
> It is guaranteed to be a string with 5 parts, and we could parse this
> string to get the size.

Where do you see this "guarantee"?  I'm not finding it anywhere.  Out of
curiosity, if the 5 params are guaranteed, what does it state when the
DIMM is non-ECC?

> I do not know how other systems (e.g. x86 or ARM) get the DIMM size.
> 
> During the [review][2] , Ed suggested creating an appropriate
> interface for the DIMM size.
> 
> It's a good suggestion, but it could be complicated to be implemented:

Given that this is something that all systems of all types are likely to
use, I think it's well worth taking the time to implement it in a
sustainable way.

> * The information is sent by host via inband IPMI as FRU;
> * In ipmid, the code to handle FRU is generic and part of the code is
> generated, so it could be hard to make a specific change for DIMM
> size.
> 
> So the question to the community is, how other systems get the DIMM size?
> Knowing this, we could try to design a generic method to handle the case.

On x86 there's a similar mechanism called Managed Data Region, which is
sent through one of 3(ish) transports and sends the SMBIOS table down to
the BMC.  I think the key here is that there needs to be an interface
for that daemon to publish.

> 
> Otherwise, we will have to write specific code, either in ipmid or in
> bmcweb, to get such specific values.

I think you've already found the interface proposal.  Lets work that
through so it meets everyone's needs.
