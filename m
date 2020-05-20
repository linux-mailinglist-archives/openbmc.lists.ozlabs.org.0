Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CDF1DBA62
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 18:57:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RzSy1g2GzDqTY
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 02:57:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RzS74c4gzDqMd
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 02:56:54 +1000 (AEST)
IronPort-SDR: tVTDNbbZP5BeKQrtKr+FXBGkBdLEqYzM4uWbVA5wi4k2suKVv1emctqd5JfCLKb922KcGvdBXd
 g6ARgGxN2tMg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:56:51 -0700
IronPort-SDR: QdW4SMSUtnsP4EqZr3NZ8/s2m5NO5xD4ufweyOPpW/FV1GsgZRsVWPMIsVA7GfUh+F0HUq6XLN
 CYonugstGLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085284"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.214.40])
 ([10.212.214.40])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:56:51 -0700
Subject: Re: Processing PLDM FRU information with entity manager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <6bd3254af95cbd8ae44151f62114acca9d221962.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8e62ac67-8415-d5ef-a034-a306ae2a18c6@linux.intel.com>
Date: Wed, 20 May 2020 09:56:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6bd3254af95cbd8ae44151f62114acca9d221962.camel@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/20/2020 9:28 AM, Brad Bishop wrote:
> On Tue, 2020-05-19 at 09:10 +0530, Deepak Kodihalli wrote:
> 
> Hi Deepak
> 
>> I see there is provision for persistence, but it looks like
>> applying the persisted information works only if "D-Bus probes"
>> succeed.

There is a PowerState parameter that tells when it can be detected that 
can be used. PowerState="On" things only get removed if detected once 
power is back online.

> 
> This prompted me to take a closer look - as far as I can tell
> system.json is for debugging purposes only.  Maybe James could confirm.

No, the modifiable things are persisted there. Such as thresholds.

> 
> Given this we should probably have an application layer other than
> entity-manager layer be responsible for maintaining the PLDM FRU
> objects on the DBus at the correct time.
> 
>> the BMC will no longer have the raw PLDM FRU information on D-Bus
> 
> I think we have to fix this.  It doesn't feel right that the PLDM FRU
> DBus objects come and go off the bus as the system is powered on/off.
> 
>> How are hierarchical relationships between FRUs supposed to be
>> represented? Is that based on D-Bus pathnames? Or making use of
>> something like the D-Bus Associations interface? Any thoughts on how
>> representing such parent-child relation can be achieved via entity
>> manager configs?
> 
> I'm also hoping James or Richard will let us know what their thoughts
> are for doing this.

I need a better example. FRUs are independent things, so there is no 
hierarchy. Are you talking about Chassis level things? Those are just 
handled by having the right type.

> 
> -brad
> 
