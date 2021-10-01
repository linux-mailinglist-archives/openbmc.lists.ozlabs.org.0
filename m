Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7241F2B6
	for <lists+openbmc@lfdr.de>; Fri,  1 Oct 2021 19:10:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLc713dl9z2yg8
	for <lists+openbmc@lfdr.de>; Sat,  2 Oct 2021 03:10:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLc6g6lyhz2yPp;
 Sat,  2 Oct 2021 03:09:47 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="311045012"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="311045012"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 10:06:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="710036628"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.134.77.171])
 ([10.134.77.171])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 10:06:48 -0700
Subject: Re: [PATCH v4 0/4] i2c: aspeed: Add buffer and DMA modes support
To: Zev Weiss <zweiss@equinix.com>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210930024448.GU17315@packtop>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <95dd9359-7dc0-00ce-2867-b35c3b4ebb2f@linux.intel.com>
Date: Fri, 1 Oct 2021 10:06:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210930024448.GU17315@packtop>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tao Ren <taoren@fb.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On 9/29/2021 7:44 PM, Zev Weiss wrote:
> On Wed, Feb 24, 2021 at 11:17:16AM PST, Jae Hyun Yoo wrote:
>> This patch series adds buffer mode and DMA mode transfer support for the
>> Aspeed I2C driver. With this change, buffer mode and DMA mode can be
>> selectively used depend on platform configuration.
>>
> 
> Any updates on these patches?  They provide a welcome performance
> improvement for some stuff I've been doing -- for the v4 series:
> 
> Tested-by: Zev Weiss <zweiss@equinix.com>

Thanks for sharing your test result.

I'm bringing this patch set back to discussion.

Thanks,
Jae
