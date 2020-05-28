Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB951E693D
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 20:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XwzF2WYrzDqZG
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 04:22:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XwyM67lKzDqZF
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 04:21:45 +1000 (AEST)
IronPort-SDR: TysTIPuj3GeGdZQd+CSYp9WRAKRQXTHCRGISnqmJ52LkyLkFoI2EKvAIVYAmwQ1P85E0jjXpe1
 hGlVNx+Uj10g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 11:21:42 -0700
IronPort-SDR: IZOQwZ7Fc0hsW8VECdK2qup9D676urNYgGjnOvnQGIYgSlpEWosIds5kOUokWsIj8JFjt1+Lb5
 syVTRhEv5ldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; d="scan'208";a="443054205"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.103.71])
 ([10.209.103.71])
 by orsmga005.jf.intel.com with ESMTP; 28 May 2020 11:21:42 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <79485550ea680886f3455dba9972be8a6ab5eee2.camel@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <a64725bb-d748-798f-c067-9df27c8e683c@linux.intel.com>
Date: Thu, 28 May 2020 11:21:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <79485550ea680886f3455dba9972be8a6ab5eee2.camel@fuzziesquirrel.com>
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/28/2020 8:43 AM, Brad Bishop wrote:
> On Thu, 2020-05-28 at 07:03 -0500, Patrick Williams wrote:
>>
>> After thinking about it for a bit, I think this is my preference with
>> the design caveat that these are only consumed by processes which are
>> "FRU-to-Inventory" transformers.  I would suggest putting these
>> interfaces under the 'Inventory/' namespace somewhere to hopefully
>> make this clearer.
> 
>> My suggestion would be to put these new proposed PLDM interfaces under
>> `Inventory/Source/PLDM`.  Anything under `Source` becomes one of these
>> "FRU-to-Inventory" transformational interfaces.
> 
> FWIW I'm also happy with this direction.  It would be great to get a
> quick "me too" from the author of fru-device and entity-manager to avoid
> wasting time later 😉
> 

I don't have a strong opinion on the naming of the interface. That would 
be OK by me.
