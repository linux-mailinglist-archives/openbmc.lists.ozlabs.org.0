Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A58141FC144
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 23:58:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mhsQ4xgwzDqq5
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 07:58:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mhrj2fJ3zDq6B
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 07:57:39 +1000 (AEST)
IronPort-SDR: o0q4Dumq2HhPC4YhnzHseRk7tcwbouIg6LZNSZizcyTki6ZHPJK6kmzNNEAV5+71HiLk2EhUXx
 jvzgwOeSGAIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 14:57:37 -0700
IronPort-SDR: Z/UdPBMBUm9EdmsLxd3MPqdiND/paa1PVy0GP56P8znoPTN6pSQldcHqVSnN1XVtpVX8sskM/J
 Puybf5Tjq5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; d="scan'208";a="273303212"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.49.202])
 ([10.209.49.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 14:57:36 -0700
Subject: Re: Message registries continuation
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
 <025d2742-58e9-1c22-a5cd-0003e6beedc2@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <5f86c597-050e-a038-be3f-d9acc9e19fd0@linux.intel.com>
Date: Tue, 16 Jun 2020 14:57:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <025d2742-58e9-1c22-a5cd-0003e6beedc2@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/16/2020 2:30 PM, Matt Spinler wrote:
> 
> 
> On 6/16/2020 3:39 PM, James Feist wrote:
>> On 6/16/2020 12:47 PM, Matt Spinler wrote:
>> There's 3 registries, fwiw: 
>> https://github.com/openbmc/bmcweb/tree/master/redfish-core/include/registries 
>>
>>
> 
> Do you want these 3 to remain as header files, or be read from the JSON 
> as well?  The base one I can get
> as JSON already, and I guess I could write a script to convert the other 
> 2 if necessary.

Consistency is always better, but I'd put it under nice to have if you 
have limited time. Task you can also get in JSON from 
https://redfish.dmtf.org/registries/. Personally I'd think having 
multiple examples would help in the development more than anything.


