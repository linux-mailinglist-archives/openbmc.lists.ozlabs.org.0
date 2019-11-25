Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2610949F
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 21:21:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MJMy4p8LzDqcv
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 07:21:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MJML1ZfWzDqYP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 07:21:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 12:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="211138635"
Received: from unknown (HELO [10.241.241.143]) ([10.241.241.143])
 by orsmga003.jf.intel.com with ESMTP; 25 Nov 2019 12:20:57 -0800
Subject: Re: i2c error for ME port
To: James Feist <james.feist@linux.intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
 <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <69833bb8-89b6-2b06-818a-c8d16ce19ca5@linux.intel.com>
Date: Mon, 25 Nov 2019 12:20:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
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

Hi Vijay,

On 11/25/2019 11:41 AM, James Feist wrote:
> On 11/25/19 11:39 AM, Vijay Khemka wrote:
>> Hi James/Jason,
> 
> + Jae, any ideas?
> 
> 
>>
>> I am seeing following i2c error on i2c bus connected to ME. It is one 
>> time output whenever server is powered on or reboot. Please suggest 
>> you can think of anything here.
>>
>> Regards
>>
>> -Vijay
>>
>> [ 7358.450768] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
>> processed read.
>>
>> [ 7358.465565] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
>> processed read.
>>
>> [ 7358.480358] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
>> processed read.
>>
>> [ 7358.499663] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
>> processed read.
>>
>> [ 7358.514873] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
>> processed read.
>>
>> [ 7358.591790] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
>> expected 0x80000084, but was 0x00000084

Looks like you set the second slave address for i2c4 bus. It indicates
'address 2' match event but current driver doesn't handle this event.

Can you share your i2c4 bus node setting in device tree?

Cheers,

Jae
