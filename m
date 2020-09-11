Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CC1266849
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 20:36:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp4Gq42dbzDqpR
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 04:36:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp4G10pfzzDqWN
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 04:36:04 +1000 (AEST)
IronPort-SDR: 9Pv6vOV+TSs0ORenp/Kiu7qkh21OI7irdbxrbi1iRFkR1f8mjQa5uFGEsPzJZ+Nm5QSvo2xZ6+
 L82h2TjX5EPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="220387283"
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; d="scan'208";a="220387283"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 11:35:59 -0700
IronPort-SDR: smh0Ui8daiobx8F+BlF9hnGk0Hd1U7a5Fx7OwAOohJd+caHKlRKW+eN+WWvRyPg8tbEmMNP3f4
 J5/7LQivJtVw==
X-IronPort-AV: E=Sophos;i="5.76,416,1592895600"; d="scan'208";a="285730232"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.251.142.98])
 ([10.251.142.98])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 11:35:59 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: An i2c issue found in intel-bmc/openbmc
To: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <CAGm54UGcLzLxucRpTZ+TUwNj_dtZ0YWTLwu1QA9owovNjL6xhg@mail.gmail.com>
Message-ID: <9e0173ce-0d87-f8c1-e1c4-072412608b90@linux.intel.com>
Date: Fri, 11 Sep 2020 11:35:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UGcLzLxucRpTZ+TUwNj_dtZ0YWTLwu1QA9owovNjL6xhg@mail.gmail.com>
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
Cc: "Li, Yong B" <yong.b.li@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Yulei,

On 9/8/2020 5:07 AM, 郁雷 wrote:
> This email is to introduce an issue related to i2c found on
> intel-bmc/openbmc[1].
> 
> I am working on a machine that is based on intel-bmc/openbmc, and it
> has a pca9555 GPIO expander on i2c-8.
> 
> The dts looks like below:
> 
>    &i2c8 {
>      status = "okay";
>      pca0:pca9555@24 {
>        compatible = "nxp,pca9555";
>        reg = <0x24>;
>        #address-cells = <1>;
>        #size-cells = <0>;
>        gpio-controller;
>        #gpio-cells = <2>;
>      }
>    }
> 
> If you have a similar setup, you may see the kernel gives below error:
> 
>      [    2.561952] pca953x 8-0024: failed writing register
>      [    2.567061] pca953x: probe of 8-0024 failed with error -110
> 
> It turns out that the patch
> 0075-Refine-initialization-flow-in-I2C-driver.patch[2] caused the
> issue. And if I revert the patch, the issue is gone.

Checked that the patch was wrong. Yong found that aspeed_i2c_init should
be called before calling i2c_add_adapter so the patch should be like this:

+             ret = aspeed_i2c_init(bus, pdev);
+             if (ret < 0)
+                            goto out_free_dma_buf;
+

                ret = i2c_add_adapter(&bus->adap);
                if (ret < 0)
                               goto out_free_dma_buf;

I'll fix the patch. Thanks Yulei and Yong for sharing your findings.

Thanks,
Jae

> A github issue is created at
> https://github.com/Intel-BMC/openbmc/issues/48, hopefully Intel could
> fix this issue :)
> 
> [1]: https://github.com/Intel-BMC/openbmc
> [2]: https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0075-Refine-initialization-flow-in-I2C-driver.patch
> 
