Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA927B4F3
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 21:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0X4W5gxGzDqMw
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 05:04:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0X3m04vzzDqD2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:03:31 +1000 (AEST)
IronPort-SDR: j5isBtd51AcXJI70MDZPm4hh0a0MtMSLFFcz2BmeA0fmuBv202bSkGPAFr68PRdYDVx4Em7mDu
 f68c0JW685eQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159386170"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="159386170"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 12:03:13 -0700
IronPort-SDR: Yj9nTpiAeG6FGnoyeeqwvPqLv4+Mg6q2e6areXdjSLIm2sYFc9oCUxS2wr525gam0OlmbmoDPD
 hRBbq0L9Mx5w==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="311896142"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.255.230.208])
 ([10.255.230.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 12:03:13 -0700
Subject: Re: [PATCH 1/2] peci: fix error-handling in peci_dev_ioctl()
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-2-zev@bewilderbeest.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d64f8001-a13e-45e5-53cc-96da50614ec7@linux.intel.com>
Date: Mon, 28 Sep 2020 12:03:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200926212734.23836-2-zev@bewilderbeest.net>
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Zev,

On 9/26/2020 2:27 PM, Zev Weiss wrote:
> peci_get_xfer_msg() returns NULL on failure, not an ERR_PTR.  Also
> avoid calling kfree() on an ERR_PTR.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>   drivers/peci/peci-dev.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/peci/peci-dev.c b/drivers/peci/peci-dev.c
> index e0fe09467a80..84e90af81ccc 100644
> --- a/drivers/peci/peci-dev.c
> +++ b/drivers/peci/peci-dev.c
> @@ -122,8 +122,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>   		}
>   
>   		xmsg = peci_get_xfer_msg(uxmsg.tx_len, uxmsg.rx_len);
> -		if (IS_ERR(xmsg)) {
> -			ret = PTR_ERR(xmsg);
> +		if (!xmsg) {
> +			ret = -ENOMEM;

Yes, it's a right fix. Thanks!

>   			break;
>   		}
>   
> @@ -162,7 +162,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>   	}
>   
>   	peci_put_xfer_msg(xmsg);
> -	kfree(msg);
> +	if (!IS_ERR(msg))
> +		kfree(msg);

Not needed. kfree itself has null pointer checking inside.

>   
>   	return (long)ret;
>   }
> 
