Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD158E96
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 01:35:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zbqc4XcmzDqfr
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 09:35:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zbq03H4szDqfk
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 09:35:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 16:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="337742518"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga005.jf.intel.com with ESMTP; 27 Jun 2019 16:35:04 -0700
Subject: Re: [RFC v2 dev-5.1 4/5] i2c: aspeed: add buffer mode transfer support
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Cedric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
References: <20190625205109.27672-1-jae.hyun.yoo@linux.intel.com>
 <20190625205109.27672-5-jae.hyun.yoo@linux.intel.com>
 <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9c862188-8360-fa39-f21d-9c6d51e1d831@linux.intel.com>
Date: Thu, 27 Jun 2019 16:35:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5cc696ba-7fa7-c7cb-0ba6-81df3015e974@fb.com>
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

On 6/27/2019 4:24 PM, Tao Ren wrote:
> On 6/25/19 1:51 PM, Jae Hyun Yoo wrote:
>> Byte mode currently this driver uses makes lots of interrupt call
>> which isn't good for performance and it makes the driver very
>> timing sensitive. To improve performance of the driver, this commit
>> adds buffer mode transfer support which uses I2C SRAM buffer
>> instead of using a single byte buffer.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Tested-by: Tao Ren <taoren@fb.com>
> 
> Applied patch serial 1-4 to openbmc kernel 5.1.15 and booted up Facebook CMM AST2500 BMC: I2C component looks normal to me.

Hi Tao,

Thanks a lot for sharing the test result.

Regards,
Jae

> 
> Cheers,
> 
> Tao
> 
