Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F220A344
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 18:46:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t5WH0Y5TzDqlf
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 02:46:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t5Tc1TD9zDqlf
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 02:44:51 +1000 (AEST)
IronPort-SDR: wB5WXXNZd3BBQavNXoFa5jre9jphOwiPWhkXy6y9lW3Uj+XnnY15S1IX4FvpQnxuhsHg6zFHMW
 oJkPSnylzguA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146466440"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="146466440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 09:44:27 -0700
IronPort-SDR: E8vBj6Du8v8zDOxn1PTZJ97IIHo4BqZwimhu7eKtlZfRVr+uegcBlSu/d+ILthR5EDARd0h1GS
 uPl8esJIteYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="312049176"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.212.108.224])
 ([10.212.108.224])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2020 09:44:27 -0700
Subject: Re: Redfish EventService Implementation
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
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
 <6d97d36c-b78f-44eb-f808-2ae82184925c@linux.intel.com>
 <6c562e1bc3fa8873a67d6ceb398734d11de7d2e9.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <bcc2f70b-3c17-916b-8316-c3b356c211c2@linux.intel.com>
Date: Thu, 25 Jun 2020 09:44:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <6c562e1bc3fa8873a67d6ceb398734d11de7d2e9.camel@fuzziesquirrel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/25/2020 8:49 AM, Brad Bishop wrote:
> On Wed, 2020-06-24 at 09:24 -0700, James Feist wrote:
>> This thread is quite long and hard to follow for someone not involved,
>> it'd be good to document the proposed changes.
> 
> You are right of course that this thread has become hard to follow.  I
> think careful selection of reply context really would have helped.
> 
> FWIW I have asked the team here at IBM to hash out designs to some level
> of consensus here on the list before making design submissions to gerrit
> because IMO reviews of half baked designs in gerrit are even harder to
> follow than email threads like this one 🙂
> 

That's good. Was just hoping that the 'final design' wasn't this email, 
as it would be difficult to see we matched a design.
