Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E07EE866E3
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 18:21:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464DCH54KjzDqr5
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 02:21:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464D133sS7zDqmh
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 02:12:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 09:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="165740225"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2019 09:12:34 -0700
Subject: Re: [PATCH linux dev-5.2 1/2] i2c: aspeed: Update to v3 of buffer and
 dma support
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20190808143342.27779-1-joel@jms.id.au>
 <20190808143342.27779-2-joel@jms.id.au>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <34e87c76-d95c-f506-de3a-778e2d5b81ee@linux.intel.com>
Date: Thu, 8 Aug 2019 09:12:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190808143342.27779-2-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/8/2019 7:33 AM, Joel Stanley wrote:
> This moves the aspeed i2c driver to the v3 RFC that Jae posted. This
> version has backwards compatibility with the old device tree binding,
> allowing us to disable the changes until the Qemu model has been updated
> to support buffer mode.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Hi Joel,

Thanks for applying the v3 patch set.

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Regards,
Jae
