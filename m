Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7C1E695D
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 20:32:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XxB86nLKzDqVr
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 04:32:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xx9V1Qn3zDqV5
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 04:31:25 +1000 (AEST)
IronPort-SDR: TK04oPm9OiOy8MnGLghd9hcypGpibyf9encyjGRaQvnTxlz9rhmJ+s4ZCqlqyoYZBNLXDabxEm
 ENBXjlr+iBpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 11:31:18 -0700
IronPort-SDR: Gjb/adRuKLQAHfQTRnuweDAv72kni1XcrZ2eIip2BQdAEJrtl6/8XpT/AIR5ZbQpFy0OixXipU
 aRdyZoteAD2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="443057302"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.103.71])
 ([10.209.103.71])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2020 11:31:17 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Patrick Williams <patrick@stwcx.xyz>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
 <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
 <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <6f19c866-6fb5-49f8-da25-7d218f6267ad@linux.intel.com>
Date: Thu, 28 May 2020 11:31:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/28/2020 11:05 AM, Patrick Williams wrote:
> On Thu, May 28, 2020 at 10:12:19PM +0530, Thomaiyar, Richard Marian wrote:
>>
>> On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
>>> On 28/05/20 5:33 pm, Patrick Williams wrote:
> 
>> Why do we need to have 2 different interfaces to represent the same
>> information for FRU-to-inventory transformational (say ProductName). This
>> will make inventory manager to be updated for every FRU producer?. Many of
>> the properties are common, and we can form a common interface for that, and
>> rest can be maintained in it's specific interface. I understand that current
>> FRU to Entity-manager interface seems to be private, but we must make a
>> common interface to represent like Product Name, PartNumer, Serial Number
>> etc. (instead of maintaining it in different interface saying IPMI / PLDM
>> Source, with different types). How about?
> 
> Yes, I am in favor of common interfaces for this where ever possible.
> 
> Is there someone that knows the existing FruDevice implementation well
> enough that can be included in this work to propose common interfaces
> where it is appropriate?

Yes, I wrote it. I can review the changes, however if you read the ipmi 
fru spec, which is what fru device is based of, there are many optional 
fields based on the type of the fru. You'd probably at a minimum need an 
interface per region supported as phosphor-dbus-interfaces does not 
allow optional fields. I'm not sure how you'd deal with custom fields 
either. You'd probably need everything as a superset of the fru spec, 
and have blanks where its not populated.

https://www.intel.com/content/dam/www/public/us/en/documents/specification-updates/ipmi-platform-mgt-fru-info-storage-def-v1-0-rev-1-3-spec-update.pdf


