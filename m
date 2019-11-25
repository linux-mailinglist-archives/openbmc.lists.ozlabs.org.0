Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6F109455
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 20:42:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MHVW5JbkzDqby
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 06:42:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MHTF5qmTzDqbs
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 06:41:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 11:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="239662368"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2019 11:41:02 -0800
Subject: Re: i2c error for ME port
To: Vijay Khemka <vijaykhemka@fb.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
References: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <fcbbbc1b-d85c-d3d5-c2b6-9798828385ae@linux.intel.com>
Date: Mon, 25 Nov 2019 11:41:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <45A2E82C-17C3-470A-9756-DBC2CDFE0356@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/25/19 11:39 AM, Vijay Khemka wrote:
> Hi James/Jason,

+ Jae, any ideas?


> 
> I am seeing following i2c error on i2c bus connected to ME. It is one 
> time output whenever server is powered on or reboot. Please suggest you 
> can think of anything here.
> 
> Regards
> 
> -Vijay
> 
> [ 7358.450768] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7358.465565] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7358.480358] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7358.499663] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7358.514873] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7358.591790] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.610955] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7358.651381] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.670515] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7358.689601] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.708712] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7358.728303] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.747422] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7358.766525] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.785590] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7358.810138] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.829301] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7358.848392] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.867479] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7358.887271] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.906383] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7358.925481] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.944558] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7358.964950] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7358.984050] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.003147] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.022223] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7359.042183] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.061325] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.080423] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.099500] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7359.121159] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.140294] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.159381] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.178452] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7359.198150] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.217286] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.236402] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.255486] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000002, but was 0x00000002
> 
> [ 7359.275289] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.294409] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.313490] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000084, but was 0x00000084
> 
> [ 7359.332585] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000001, but was 0x00000001
> 
> [ 7359.351578] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7359.366182] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.385132] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000001, but was 0x00000001
> 
> [ 7359.404090] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7359.418701] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.437650] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000001, but was 0x00000001
> 
> [ 7359.456611] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7359.471220] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> [ 7359.490170] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000001, but was 0x00000001
> 
> [ 7359.509683] aspeed-i2c-bus 1e78a140.i2c-bus: Expected ACK after 
> processed read.
> 
> [ 7359.524307] aspeed-i2c-bus 1e78a140.i2c-bus: irq handled != irq. 
> expected 0x80000004, but was 0x00000004
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:41 tiogapass psusensor[316]: *PredictiveFailure assert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
> Jan 01 02:02:42 tiogapass psusensor[316]: *PredictiveFailure deassert*
> 
