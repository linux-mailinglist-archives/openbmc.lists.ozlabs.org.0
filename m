Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F59207906
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 18:25:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sT5D6YsgzDqk7
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 02:25:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sT496Y3fzDqZB
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 02:24:08 +1000 (AEST)
IronPort-SDR: Jf0fZe41N809QEQKIQCYo7WrqCfysLMot1nip5zU5cz8Uur+P4v+ks3ldS+qZeEwL/GC1+dDuq
 d1U/qSYSn8Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="209674314"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; d="scan'208";a="209674314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 09:24:04 -0700
IronPort-SDR: XT1qa5fmHn0Hw9ZyQlKV5DTAK0fDYEM0f3wRcDvBnKBYTdFTKTgZvsZCeAPhIJn+vdPGmI30sN
 T3SXpXoFklrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; d="scan'208";a="319497452"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.213.181.61])
 ([10.213.181.61])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2020 09:24:04 -0700
Subject: Re: Redfish EventService Implementation
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
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
From: James Feist <james.feist@linux.intel.com>
Message-ID: <6d97d36c-b78f-44eb-f808-2ae82184925c@linux.intel.com>
Date: Wed, 24 Jun 2020 09:24:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20ab2d6a-00d8-edc6-a18a-c98d93c6cb3c@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I have got an update from the DMTF that persistence is not required to 
> be implemented for the 
> events(https://redfish.dmtf.org/schemas/v1/Event.v1_5_0.json),
> which implies we don't need to log the events in Journal.
> 
> More info(https://github.com/DMTF/Redfish/issues/3646)
> 
> Now updating the proposal where redfish client subscribed for Resource 
> Type based events
> 1) Client would subscribe for the Redfish Resource(eg:ManagerAccount) to 
> receive events like Account add/delete/modify
>       Hence need for mapping from (RedfishResource to Dbus Resource)
> 
> 2) Have the mapping info from Redfish resources to DBUS Resources (Some 
> JSon file may have this mapping)

This assumes the mapping is static, which on many systems it isn't, 
right? I think this needs to be developed to see what it would be like.

> 
> 2) Have the reverse mapping from DBUS Resources to Redfish Resources
>       * This is needed to send the Redfish event if there is any changes 
> in the corresponding D-bus resources.
>         eg BMC state change/network change etc.
> 
> 3) bmcweb would monitor the DBUS events

Which events specifically? It seems like it would be monitoring lots of 
events in this proposal. Some examples could be useful.

> 
> 4) Get the Redfish Path from the Mapping(2) and send the Redfish event
> 
> 5) Bmcweb would buffer N number of events that can be configurable by 
> redfish client. Buffer would get cleaned up in case of bmcweb restart or 
> BMC reset.
> 

Can you please push a patch to the event service design doc with the 
change to the design you'd like? Some examples in the design would help 
with understanding the proposal. This thread is quite long and hard to 
follow for someone not involved, it'd be good to document the proposed 
changes.

https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md

