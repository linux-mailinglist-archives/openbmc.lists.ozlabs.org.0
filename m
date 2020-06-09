Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979E1F3079
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 03:00:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gsHM6ZTqzDqRr
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 11:00:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gsFg1P6xzDqRh
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 10:59:01 +1000 (AEST)
IronPort-SDR: MaUEzIV7ITv/SMBZHHb+iIj8TE3N8smlGCL3BINamJ/Nc24WSCv5ITlhEemf/dCTbtrOZol8o+
 Z9vVRr2Js5WA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 17:58:57 -0700
IronPort-SDR: 3h5Bi6iujSeweZSpq9mwDLHmyrbO0YgDVdSQhAgNFHY9r2t79dkxjU+aZeRL56kJc1hJBsNnsL
 uSlq9FiMcmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="379588096"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.254.12.164])
 ([10.254.12.164])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2020 17:58:57 -0700
Subject: Re: Redfish EventService Implementation
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 RAJESWARAN THILLAIGOVINDAN <rajeswaran.thillaigovindan@gmail.com>,
 openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
Date: Mon, 8 Jun 2020 17:58:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/8/2020 2:08 PM, Brad Bishop wrote:
> On Sat, 2020-02-01 at 02:23 +0530, RAJESWARAN THILLAIGOVINDAN wrote:
>> Hi,
>>
>> I am going through the bmcweb code for implementing Redfish
>> EventService based on the design document
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749. This design
>> is hooked to the journal based Redfish Event Logging.
> 
> Would anyone else be willing to opine on whether or not they think
> journal based event schemes are what we want going forward for OpenBMC?
> 
> My feeling is that they are not - as an alternative IPC mechanism don't
> we end up re-implementing things that DBus already does?  Doesn't it
> require us to raise the same event twice everywhere (Once with DBus, and
> once in the journal)?  What does journal based eventing do that DBus
> signals don't do?

We don't host log events on DBus at all, so there is no duplicate. The 
journal gives built in persistence and rotating of logs for large number 
of events. I know when this came up the last time one of the big issues 
was supporting thousands of logs wouldn't work well on DBus.


> 
> Please poke holes.
> 
> thx - brad
> 
