Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A974E134A0B
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 19:03:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tHCx5mSCzDqSM
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 05:03:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tHCG5m9lzDqQ6
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 05:02:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 10:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="271894152"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2020 10:02:29 -0800
Subject: Re: Configuring device with I2C mux
To: Alex Qiu <xqiu@google.com>
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
 <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
 <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
 <CAA_a9xKG_qk5sBUZY6T5xH+XG_HQwLXVf2Jy0GXX0Ob+6R1rig@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <27eb67c0-c758-5b46-bb49-9eceec25bc4f@linux.intel.com>
Date: Wed, 8 Jan 2020 10:02:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAA_a9xKG_qk5sBUZY6T5xH+XG_HQwLXVf2Jy0GXX0Ob+6R1rig@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/8/20 9:54 AM, Alex Qiu wrote:
> Hi James,
> 
> Yes, we have multiple devices sitting behind the mux, and they're 
> onboard devices instead of standalone FRUs. The parent bus is described 
> as the FRU for each PCIe card.
> 
> After naming the mux channels, can these names be used somehow to config 
> I2C devices? For example, {"Bus": "$bus", "ChannelNames": 
> ["C0", "C1", "C2", "C3"]} for the mux, and {"Bus": "$bus.C1"} for 
> devices behind the mux on channel 1.

This syntax doesn't exist today.. On all our systems things behind the 
mux are again detectable, so we haven't hit this problem. Right now the 
template replacement is purely based on the found device on d-bus. So 
$bus is the bus property from the xyz.openbmc_project.FruDevice 
interface, there's no way to trace that to a mux channel, as it's just a 
d-bus property.

The code you're looking for is here: 
https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Utils.cpp#L144 


Along with the channel identification logic here: 
https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Overlay.cpp#L112

You could probably add some special syntax to make this work. Luckily 
this is the one part of entity-manager that is unit-tested, so that 
should help you 
https://github.com/openbmc/entity-manager/blob/master/test/test_entity-manager.cpp


-James




