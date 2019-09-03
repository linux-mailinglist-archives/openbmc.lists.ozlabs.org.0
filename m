Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994CA7688
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 23:51:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NLJD0yGfzDqlB
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 07:51:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NLHg5CctzDqKb
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 07:51:10 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 14:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,464,1559545200"; d="scan'208";a="187401550"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga006.jf.intel.com with ESMTP; 03 Sep 2019 14:51:07 -0700
Subject: Re: AST2500 I2C Controller got stuck in SRXD state
To: Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <7af0671b-524c-02a7-fc6c-60360b06f0db@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fc49fd92-856a-456e-6be3-2ddcee16aa82@linux.intel.com>
Date: Tue, 3 Sep 2019 14:51:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7af0671b-524c-02a7-fc6c-60360b06f0db@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/3/2019 2:45 PM, Tao Ren wrote:
> Hi,
> 
> I found the issue on Minipack (AST2500) BMC i2c-0: it's multi-master environment with BMC and Bridged-IC.
> 
> The BMC I2C controller got stuck in SLAVE_RX_DONE state because STOP condition is not detected during one BIC-to-BMC transfer.
> Because of this, all the subsequent I2C master transactions would fail with timeout.
> Here is BMC I2C state reported in I2CD14 Command/Status register:
> 
> - I2CD14[22:19] = 0100b  /* transfer state machine: SLAVE_RX_DONE */
> - I2CD14[18] = 1 /* sampled SCL line: high/idle */
> - I2CD14[17] = 1 /* sampled SDA line: high/idle */
> - I2CD14[16] = 0 /* bus is idle */
> 
> I'm suspecting it's caused by some flaws in BIC firmware, but can we do something in BMC side to recover the bus?
> For example:
> 
> 1) As Jae mentioned earlier, enable slave inactive timeout interrupt and reset bus when the interrupt is delivered?
> 
> 2) Check I2CD14[22:19] in aspeed_i2c_recover_bus() function and reset bus if needed?
> 

Hi Tao,

I made the slave inactive timeout support. Will submit it soon.

Cheers,
Jae

> 
> Thanks,
> 
> Tao
> 
