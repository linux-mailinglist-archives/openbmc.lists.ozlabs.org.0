Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14002D300D
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 20:16:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pzmy2CjHzDqRb
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 05:16:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pzl76pHSzDqLD
 for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2019 05:14:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 11:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,281,1566889200"; d="scan'208";a="184503626"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 10 Oct 2019 11:14:54 -0700
Subject: Re: [PATCH 0/5] i2c: aspeed: Add buffer and DMA modes support
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <b91963ee-2536-43da-0801-e41dc9ad0877@kaod.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9a5cc21a-5c8c-2fba-50c7-18e19f764021@linux.intel.com>
Date: Thu, 10 Oct 2019 11:14:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b91963ee-2536-43da-0801-e41dc9ad0877@kaod.org>
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

Hello Cédric,

> I just pushed models adding support for the pool buffer mode and DMA mode
> to the I2C controller and did some tests on these QEMU Aspeed machines :
> 
>    palmetto (AST2400) : BYTE + BUFFER
>    romulus  (AST2500) : BYTE + BUFFER + DMA (with a custom DT)
>    tacoma   (AST2600) : BYTE
> 
> Looks good on the QEMU side.

Thanks a lot for sharing the result, and for the QEMU models
implementation as well.

I'll submit ast2600 dts patch for the buffer mode support later into
OpenBMC linux tree if it gets accepted from upstream. I didn't include
that because upstream tree doesn't have I2C bus nodes yet in ast2600
dts.

Thanks,

Jae

