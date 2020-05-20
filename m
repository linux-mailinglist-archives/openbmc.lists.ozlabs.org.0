Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3791DBBDD
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 19:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S0Z85YQZzDqJm
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 03:47:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S0YN61qczDqJX
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 03:46:32 +1000 (AEST)
IronPort-SDR: HVyJXXljLuh6Fye/0QeXb7DDjuYcj6wunr4WMeUjYr+lVaKoLOrs4w9yGcG7KJurn6eskK5V+T
 m2M3zw5RV1VA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 10:46:29 -0700
IronPort-SDR: UIcqwSuIU/bphU1oaDbBr5r0E8lFbxxZMob6vd7mt3fNwz4AD0RqDtZRL0a16nN/GvWUS3BI4D
 e5GwT2DIsZlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412102791"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.214.40])
 ([10.212.214.40])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 10:46:28 -0700
Subject: Re: Processing PLDM FRU information with entity manager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <6bd3254af95cbd8ae44151f62114acca9d221962.camel@fuzziesquirrel.com>
 <8e62ac67-8415-d5ef-a034-a306ae2a18c6@linux.intel.com>
 <d3bcea4e6ba97439a3c529cc8607186f10b00ebd.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <064203ec-1917-b916-d2aa-4763ee8a6a89@linux.intel.com>
Date: Wed, 20 May 2020 10:46:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d3bcea4e6ba97439a3c529cc8607186f10b00ebd.camel@fuzziesquirrel.com>
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

On 5/20/2020 10:35 AM, Brad Bishop wrote:
> On Wed, 2020-05-20 at 09:56 -0700, James Feist wrote:
> 
>> I need a better example. FRUs are independent things, so there is no
>> hierarchy.
> 
> A drive plugs into a riser which plugs into the motherboard.  Isn't
> that a hierarchy?
> 

For a FRU, no. FRUs are independent items. For inventory, yes. Assuming 
you mean inventory then? If so, then the paths do not have any hierarchy 
today. I assume it might be possible by creating an i2c device tree of 
sorts and mapping back what bus is which item.
