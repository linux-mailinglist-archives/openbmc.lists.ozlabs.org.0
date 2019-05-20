Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0800425E91
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 09:13:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4583kl6tkyzDqLL
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 17:13:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=samsung.com
 (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com;
 envelope-from=m.szyprowski@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.b="T1u5t3p/"; 
 dkim-atps=neutral
X-Greylist: delayed 516 seconds by postgrey-1.36 at bilbo;
 Tue, 21 May 2019 01:30:06 AEST
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4572rt52KXzDqBY
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 01:30:04 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190520152124euoutp027fa77f6efcb4c12e3acd6f6e9de4d039~gbVV5yiaC2373423734euoutp02A
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 15:21:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190520152124euoutp027fa77f6efcb4c12e3acd6f6e9de4d039~gbVV5yiaC2373423734euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1558365684;
 bh=J1X4EmSFet1xv1ATf3YAc3lureile2lYrE0P/YhGX7g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=T1u5t3p/vPH5x7HndiEO4Lc6+hgzyEopHOEA4thww3VK7imn4XQPBm2+s3KMwxD5i
 Uvdx7yHZwL+8NALuyTSG3y4H5ltBLocsl3XGqISGUxTjWbfO+KL0qsYOPOuNTZnj/3
 rEHoRzxXW3gNv+G90k5OU5Dtd36YPZG2UmHlVPps=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190520152124eucas1p1971851798a6267dea61f3ce69999c31f~gbVVH26vB2063020630eucas1p1p;
 Mon, 20 May 2019 15:21:24 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 11.25.04325.3F5C2EC5; Mon, 20
 May 2019 16:21:23 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190520152123eucas1p1b4ea0e5743585885ba0dcbe5e6a8fd92~gbVUX8yHJ2147521475eucas1p1l;
 Mon, 20 May 2019 15:21:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190520152123eusmtrp1f6885226016ac0595cef3d27081b1944~gbVUJsNF52462924629eusmtrp1i;
 Mon, 20 May 2019 15:21:23 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-ae-5ce2c5f3d2f5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.F9.04140.2F5C2EC5; Mon, 20
 May 2019 16:21:22 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190520152122eusmtip2017c6ac5b995989fe3f57058f874c320~gbVTK5E6D0640106401eusmtip2M;
 Mon, 20 May 2019 15:21:21 +0000 (GMT)
Subject: Re: [PATCH 6/6] hwmon: (pwm-fan) Use
 devm_thermal_of_cooling_device_register
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-pm@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <a2a41672-4345-15fa-5fc1-87ca6dc575a0@samsung.com>
Date: Mon, 20 May 2019 17:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555617500-10862-7-git-send-email-linux@roeck-us.net>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMcRz2vfe9995a175d6LMoc0OyiWJ8N9aYbO/6w/jDMmUcXtXUZXeV
 QlNKtevHEqvr0C+WFsmdRFeR6JdU0o+FWuE2+mV0EUl0vYf+e57n+zx7Ps/2ZSlZLuPMBivD
 eZVSESJnbOmKhh/ta8317wLW68e9iLGTJT+y00VEry0TE23NIEVyzS4kr6tHTFoz9pCf7b8o
 ktOUJCaG97NS/M02iiSN3EOk03iFIea0p4iYCp6LyIdPnSLyLOEjTUxv0xlirI2TkKnyYURq
 avU0SZwqYrYt5rqTjBIuV9dEc5W6fgmXb4jgrlUPibiOLw0U19dTzXB3r5/l2rUFiKucjJVw
 6eUliCsr76Y5s8GV63oaJ9ltv99261E+JDiSV63zPmQblFr1gjlReCAqpfK2JBbpd2mQDQt4
 I+T8NjAaZMvKcDGC3qokkUAmEGSfK6QFYkbQcyUL/Y0Uz0wg4eHGbCRFb42MIfiYEk9bXI7Y
 Dy6MpMy5FuJBBBPPmsUWQuEqGtIe9DIWF4M9QTOmmcNS7A0Jjy2FLEvjlaBJXGqBi3AAFJqt
 DgdozjHNOWzwDuh9GGaRKbwM4u9dpgTsBK9NeXP3AO5jYWC8jRGu9oGOhFtW7AjDjeUSAS+F
 louptBCIR/C2rVQikFQEnee01s1b4Eljh9jSTGF3KDOuE+TtcLH4A2WRAdtD75iDcIQ9ZFZk
 W2UpJCfKBPcq0DXe/lf7+MVLKgPJdfOW6ebN0c2bo/vfm4/oEuTER6hDA3n1BiV/0kOtCFVH
 KAM9joSFGtDsr22Zafz6AD2cPlyHMIvkdtKgS+8CZGJFpDo6tA4BS8kXSje4DQTIpEcV0ad4
 VdhBVUQIr65DS1ha7iQ9vWDQX4YDFeH8cZ4/wav+vopYG+dYdL5sk0PJVteYInrnqO/OkkrX
 oWKtaHRBRbWz14zLwP1jm/uz3mj8fyUn+O1x+e62yXDA9bPjGd8jx0c2T+b7ZobXl0672fko
 Te8bxq/GTHkv73ZLs4mqTX6VtS+mwmn6EXZppR0eRd0537xaOVyV2bfXzj1LHNe2cbj0y4r6
 q2e/TQbLaXWQwnMNpVIr/gAknRpHsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsVy+t/xe7qfjj6KMZjx0dpi12UOi5/T+5gs
 Ns5Yz2oxY+8DZot5n2Ut5l+5xmpxdkKgxe/zf5ktZp5oZ7XY9Bgo1Lz6HLNF++utjBaXd81h
 s/jce4TR4snCM0wWz99dZrI41fKCxeLJwz42i10HGtktfm15xWix98BGFou2X8vYHMQ8rrbv
 YveYN+sEi8fOWXfZPRZsKvVYvOclk8fFj8eYPe5c28PmsXlJvcf5GQsZPXZ+b2D36NuyitFj
 /ZarLB6fN8l5XDnSyB7AF6VnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX0bP7AlvBotiK7p3r2BsYN/p1MXJySAiYSKz494Wxi5GLQ0hgKaPE8/sn
 mSASMhInpzWwQtjCEn+udbGB2EICrxklWnZogNjCAuESE193M4LYIgIPGCXObPcBGcQssJtF
 4u+zYywQDdUSr2evBCtiEzCU6HoLMYhXwE6i5eAioBoODhYBVYmuNhmQsKhAjMSJqVvYIUoE
 JU7OfAJWwingLHFjXz5ImFnATGLe5ofMELa8RPPW2VC2uMStJ/OZJjAKzULSPQtJyywkLbOQ
 tCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRmFa2Hfu5ZQdj17vgQ4wCHIxKPLwZUx7F
 CLEmlhVX5h5ilOBgVhLhNVa/HyPEm5JYWZValB9fVJqTWnyI0RTotYnMUqLJ+cCUl1cSb2hq
 aG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgdH8sO+MQwGuimuXfczW//Hh
 BQ+f6bn1M/dt2JZUNXllvvhv8UuPaorz6h9VJZw14g6JYNbSW/jt0tTvluJbrHjvljcxy77s
 vbr962aR7ekpEvslv2p0nPvZnLkhy3pX8cYv/gytbMtm//y8cfGGu6YTu5O8y08HiRkHCweu
 Nr+tYRa43byxjFOJpTgj0VCLuag4EQChB3cLQQMAAA==
X-CMS-MailID: 20190520152123eucas1p1b4ea0e5743585885ba0dcbe5e6a8fd92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190520152123eucas1p1b4ea0e5743585885ba0dcbe5e6a8fd92
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190520152123eucas1p1b4ea0e5743585885ba0dcbe5e6a8fd92
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-7-git-send-email-linux@roeck-us.net>
 <CGME20190520152123eucas1p1b4ea0e5743585885ba0dcbe5e6a8fd92@eucas1p1.samsung.com>
X-Mailman-Approved-At: Wed, 22 May 2019 17:12:17 +1000
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
Cc: Jean Delvare <jdelvare@suse.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kamil Debski <kamil@wypas.org>, Tali Perry <tali.perry1@gmail.com>,
 Eduardo Valentin <edubezval@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Zhang Rui <rui.zhang@intel.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear All,

On 2019-04-18 21:58, Guenter Roeck wrote:
> Use devm_thermal_of_cooling_device_register() to register the cooling
> device. Also use devm_add_action_or_reset() to stop the fan on device
> removal, and to disable the pwm. Introduce a local 'dev' variable in
> the probe function to make the code easier to read.
>
> As a side effect, this fixes a bug seen if pwm_fan_of_get_cooling_data()
> returned an error. In that situation, the pwm was not disabled, and
> the fan was not stopped. Using devm functions also ensures that the
> pwm is disabled and that the fan is stopped only after the hwmon device
> has been unregistered.
>
> Cc: Lukasz Majewski <l.majewski@samsung.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


I've noticed the following lockdep warning after this commit during CPU 
hotplug tests on TM2e board (ARM64 Exynos5433). It looks like a false 
positive, but it would be nice to annotate it somehow in the code to 
make lockdep happy:

--->8---

IRQ 8: no longer affine to CPU5
CPU5: shutdown
IRQ 9: no longer affine to CPU6
CPU6: shutdown

======================================================
WARNING: possible circular locking dependency detected
5.2.0-rc1+ #6093 Not tainted
------------------------------------------------------
cpuhp/7/43 is trying to acquire lock:
00000000d1a60be3 (thermal_list_lock){+.+.}, at: 
thermal_cooling_device_unregister+0x34/0x1c0

but task is already holding lock:
00000000a6a56c92 (&policy->rwsem){++++}, at: cpufreq_offline+0x68/0x228

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&policy->rwsem){++++}:
        down_write+0x48/0x98
        cpufreq_cpu_acquire+0x20/0x58
        cpufreq_update_policy+0x28/0xc0
        cpufreq_set_cur_state+0x44/0x70
        thermal_cdev_update+0x7c/0x240
        step_wise_throttle+0x4c/0x88
        handle_thermal_trip+0xc0/0x348
        thermal_zone_device_update.part.7+0x6c/0x250
        thermal_zone_device_update+0x28/0x38
        exynos_tmu_work+0x28/0x70
        process_one_work+0x298/0x6c0
        worker_thread+0x48/0x430
        kthread+0x100/0x130
        ret_from_fork+0x10/0x18

-> #2 (&cdev->lock){+.+.}:
        __mutex_lock+0x90/0x890
        mutex_lock_nested+0x1c/0x28
        thermal_zone_bind_cooling_device+0x2cc/0x3e0
        of_thermal_bind+0x9c/0xf8
        __thermal_cooling_device_register+0x1a4/0x388
        thermal_of_cooling_device_register+0xc/0x18
        __cpufreq_cooling_register+0x360/0x410
        of_cpufreq_cooling_register+0x84/0xf8
        cpufreq_online+0x414/0x720
        cpufreq_add_dev+0x78/0x88
        subsys_interface_register+0xa4/0xf8
        cpufreq_register_driver+0x140/0x1e0
        dt_cpufreq_probe+0xb0/0x130
        platform_drv_probe+0x50/0xa8
        really_probe+0x1b0/0x2a0
        driver_probe_device+0x58/0x100
        __device_attach_driver+0x90/0xc0
        bus_for_each_drv+0x70/0xc8
        __device_attach+0xdc/0x140
        device_initial_probe+0x10/0x18
        bus_probe_device+0x94/0xa0
        device_add+0x39c/0x5c8
        platform_device_add+0x110/0x248
        platform_device_register_full+0x134/0x178
        cpufreq_dt_platdev_init+0x114/0x14c
        do_one_initcall+0x84/0x430
        kernel_init_freeable+0x440/0x534
        kernel_init+0x10/0x108
        ret_from_fork+0x10/0x18

-> #1 (&tz->lock){+.+.}:
        __mutex_lock+0x90/0x890
        mutex_lock_nested+0x1c/0x28
        thermal_zone_bind_cooling_device+0x2b8/0x3e0
        of_thermal_bind+0x9c/0xf8
        __thermal_cooling_device_register+0x1a4/0x388
        thermal_of_cooling_device_register+0xc/0x18
        __cpufreq_cooling_register+0x360/0x410
        of_cpufreq_cooling_register+0x84/0xf8
        cpufreq_online+0x414/0x720
        cpufreq_add_dev+0x78/0x88
        subsys_interface_register+0xa4/0xf8
        cpufreq_register_driver+0x140/0x1e0
        dt_cpufreq_probe+0xb0/0x130
        platform_drv_probe+0x50/0xa8
        really_probe+0x1b0/0x2a0
        driver_probe_device+0x58/0x100
        __device_attach_driver+0x90/0xc0
        bus_for_each_drv+0x70/0xc8
        __device_attach+0xdc/0x140
        device_initial_probe+0x10/0x18
        bus_probe_device+0x94/0xa0
        device_add+0x39c/0x5c8
        platform_device_add+0x110/0x248
        platform_device_register_full+0x134/0x178
        cpufreq_dt_platdev_init+0x114/0x14c
        do_one_initcall+0x84/0x430
        kernel_init_freeable+0x440/0x534
        kernel_init+0x10/0x108
        ret_from_fork+0x10/0x18

-> #0 (thermal_list_lock){+.+.}:
        lock_acquire+0xdc/0x260
        __mutex_lock+0x90/0x890
        mutex_lock_nested+0x1c/0x28
        thermal_cooling_device_unregister+0x34/0x1c0
        cpufreq_cooling_unregister+0x78/0xd0
        cpufreq_offline+0x200/0x228
        cpuhp_cpufreq_offline+0xc/0x18
        cpuhp_invoke_callback+0xd0/0xcb0
        cpuhp_thread_fun+0x1e8/0x258
        smpboot_thread_fn+0x1b4/0x2d0
        kthread+0x100/0x130
        ret_from_fork+0x10/0x18

other info that might help us debug this:

Chain exists of:
   thermal_list_lock --> &cdev->lock --> &policy->rwsem

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&policy->rwsem);
                                lock(&cdev->lock);
                                lock(&policy->rwsem);
   lock(thermal_list_lock);

  *** DEADLOCK ***

3 locks held by cpuhp/7/43:
  #0: 00000000ae30cc2b (cpu_hotplug_lock.rw_sem){++++}, at: 
cpuhp_thread_fun+0x34/0x258
  #1: 00000000a0e2460a (cpuhp_state-down){+.+.}, at: 
cpuhp_thread_fun+0x178/0x258
  #2: 00000000a6a56c92 (&policy->rwsem){++++}, at: 
cpufreq_offline+0x68/0x228

stack backtrace:
CPU: 7 PID: 43 Comm: cpuhp/7 Not tainted 5.2.0-rc1+ #6093
Hardware name: Samsung TM2E board (DT)
Call trace:
  dump_backtrace+0x0/0x158
  show_stack+0x14/0x20
  dump_stack+0xc8/0x114
  print_circular_bug+0x1cc/0x2d8
  __lock_acquire+0x18f4/0x20f8
  lock_acquire+0xdc/0x260
  __mutex_lock+0x90/0x890
  mutex_lock_nested+0x1c/0x28
  thermal_cooling_device_unregister+0x34/0x1c0
  cpufreq_cooling_unregister+0x78/0xd0
  cpufreq_offline+0x200/0x228
  cpuhp_cpufreq_offline+0xc/0x18
  cpuhp_invoke_callback+0xd0/0xcb0
  cpuhp_thread_fun+0x1e8/0x258
  smpboot_thread_fn+0x1b4/0x2d0
  kthread+0x100/0x130
  ret_from_fork+0x10/0x18
IRQ 10: no longer affine to CPU7

--->8---

> ---
>   drivers/hwmon/pwm-fan.c | 73 ++++++++++++++++++++-----------------------------
>   1 file changed, 29 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 167221c7628a..0243ba70107e 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -207,33 +207,44 @@ static int pwm_fan_of_get_cooling_data(struct device *dev,
>   	return 0;
>   }
>   
> +static void pwm_fan_regulator_disable(void *data)
> +{
> +	regulator_disable(data);
> +}
> +
> +static void pwm_fan_pwm_disable(void *data)
> +{
> +	pwm_disable(data);
> +}
> +
>   static int pwm_fan_probe(struct platform_device *pdev)
>   {
>   	struct thermal_cooling_device *cdev;
> +	struct device *dev = &pdev->dev;
>   	struct pwm_fan_ctx *ctx;
>   	struct device *hwmon;
>   	int ret;
>   	struct pwm_state state = { };
>   
> -	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
>   
>   	mutex_init(&ctx->lock);
>   
> -	ctx->pwm = devm_of_pwm_get(&pdev->dev, pdev->dev.of_node, NULL);
> +	ctx->pwm = devm_of_pwm_get(dev, dev->of_node, NULL);
>   	if (IS_ERR(ctx->pwm)) {
>   		ret = PTR_ERR(ctx->pwm);
>   
>   		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get PWM: %d\n", ret);
> +			dev_err(dev, "Could not get PWM: %d\n", ret);
>   
>   		return ret;
>   	}
>   
>   	platform_set_drvdata(pdev, ctx);
>   
> -	ctx->reg_en = devm_regulator_get_optional(&pdev->dev, "fan");
> +	ctx->reg_en = devm_regulator_get_optional(dev, "fan");
>   	if (IS_ERR(ctx->reg_en)) {
>   		if (PTR_ERR(ctx->reg_en) != -ENODEV)
>   			return PTR_ERR(ctx->reg_en);
> @@ -242,10 +253,11 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   	} else {
>   		ret = regulator_enable(ctx->reg_en);
>   		if (ret) {
> -			dev_err(&pdev->dev,
> -				"Failed to enable fan supply: %d\n", ret);
> +			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
>   			return ret;
>   		}
> +		devm_add_action_or_reset(dev, pwm_fan_regulator_disable,
> +					 ctx->reg_en);
>   	}
>   
>   	ctx->pwm_value = MAX_PWM;
> @@ -257,62 +269,36 @@ static int pwm_fan_probe(struct platform_device *pdev)
>   
>   	ret = pwm_apply_state(ctx->pwm, &state);
>   	if (ret) {
> -		dev_err(&pdev->dev, "Failed to configure PWM\n");
> -		goto err_reg_disable;
> +		dev_err(dev, "Failed to configure PWM\n");
> +		return ret;
>   	}
> +	devm_add_action_or_reset(dev, pwm_fan_pwm_disable, ctx->pwm);
>   
> -	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
> +	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
>   						       ctx, pwm_fan_groups);
>   	if (IS_ERR(hwmon)) {
> -		dev_err(&pdev->dev, "Failed to register hwmon device\n");
> -		ret = PTR_ERR(hwmon);
> -		goto err_pwm_disable;
> +		dev_err(dev, "Failed to register hwmon device\n");
> +		return PTR_ERR(hwmon);
>   	}
>   
> -	ret = pwm_fan_of_get_cooling_data(&pdev->dev, ctx);
> +	ret = pwm_fan_of_get_cooling_data(dev, ctx);
>   	if (ret)
>   		return ret;
>   
>   	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
>   	if (IS_ENABLED(CONFIG_THERMAL)) {
> -		cdev = thermal_of_cooling_device_register(pdev->dev.of_node,
> -							  "pwm-fan", ctx,
> -							  &pwm_fan_cooling_ops);
> +		cdev = devm_thermal_of_cooling_device_register(dev,
> +			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
>   		if (IS_ERR(cdev)) {
> -			dev_err(&pdev->dev,
> +			dev_err(dev,
>   				"Failed to register pwm-fan as cooling device");
> -			ret = PTR_ERR(cdev);
> -			goto err_pwm_disable;
> +			return PTR_ERR(cdev);
>   		}
>   		ctx->cdev = cdev;
>   		thermal_cdev_update(cdev);
>   	}
>   
>   	return 0;
> -
> -err_pwm_disable:
> -	state.enabled = false;
> -	pwm_apply_state(ctx->pwm, &state);
> -
> -err_reg_disable:
> -	if (ctx->reg_en)
> -		regulator_disable(ctx->reg_en);
> -
> -	return ret;
> -}
> -
> -static int pwm_fan_remove(struct platform_device *pdev)
> -{
> -	struct pwm_fan_ctx *ctx = platform_get_drvdata(pdev);
> -
> -	thermal_cooling_device_unregister(ctx->cdev);
> -	if (ctx->pwm_value)
> -		pwm_disable(ctx->pwm);
> -
> -	if (ctx->reg_en)
> -		regulator_disable(ctx->reg_en);
> -
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -380,7 +366,6 @@ MODULE_DEVICE_TABLE(of, of_pwm_fan_match);
>   
>   static struct platform_driver pwm_fan_driver = {
>   	.probe		= pwm_fan_probe,
> -	.remove		= pwm_fan_remove,
>   	.driver	= {
>   		.name		= "pwm-fan",
>   		.pm		= &pwm_fan_pm,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

