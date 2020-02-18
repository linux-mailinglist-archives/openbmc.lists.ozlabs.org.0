Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81721162BC5
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 18:11:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MS7C6yLjzDqdt
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 04:11:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MS5w2V2SzDqN7
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 04:10:10 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 09:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="253776138"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 18 Feb 2020 09:10:07 -0800
Subject: Re: Mulit-platform feature
To: Brandon Wyman <bjwyman@gmail.com>, Payne Yang <pyang4@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <1fb78d4aa9394cf092194b57427251f3@lenovo.com>
 <b3ea2d1e-e4a7-fdfe-45e5-6d5b50f3f4e3@gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <415b581c-988c-d060-9563-e192b2ef5b0b@linux.intel.com>
Date: Tue, 18 Feb 2020 09:10:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <b3ea2d1e-e4a7-fdfe-45e5-6d5b50f3f4e3@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/17/20 12:30 PM, Brandon Wyman wrote:
> Same idea, slightly different topic?
> 
> "multiple device trees" -> 
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020171.html
> 
> On 2020-01-09 02:12, Payne Yang wrote:
>>
>> Hi Team,
>>
>> Is there a plan to support mulit-platform feature on OpenBMC in future ?
>>
>> Multi-platform means 1 BMC image could support multiple platform but 
>> only single platform.

We currently do this using entity-manager configurations and component 
detection, however as mentioned it requires similar device trees. We get 
around this by having most of our designs have similar i2c topology, and 
using a limited device tree and exporting devices during runtime. I 
imagine at some point this will break and we'll need one of the 
solutions in the other email thread as well.


>>
>> Best Regards,
>>
>> Payne
>>
