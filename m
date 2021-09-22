Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DBD41446B
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 11:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDslH22Rdz2ynG
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 19:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=iPzc5f4B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=iPzc5f4B; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDskq0SGmz2yHg
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 19:02:42 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EB5AF426BC;
 Wed, 22 Sep 2021 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-transfer-encoding:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1632301356; x=1634115757; bh=U5N
 VGwybn2FtU69og3+nKtkLLSv0MzuCjHipvIsRrug=; b=iPzc5f4BVtJsksotIiE
 PVLmJiSp0b+oOKJzoFqByq67DkUo3ofwqwqZMm6MCcO/+JKnEEvcx74+S1vxjzVP
 cd3kaMXWGXpq5/lgrxemTBZ7VvdBdQjlRYdZU/Tdt9I3sKIG34t/dLMri//Lf+KP
 l2gkscGpyj7/Q4S9ZVp0+Jm0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkHVMhOgYsPM; Wed, 22 Sep 2021 12:02:36 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 37F3B404AD;
 Wed, 22 Sep 2021 12:02:36 +0300 (MSK)
Received: from [10.199.0.205] (10.199.0.205) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 22
 Sep 2021 12:02:35 +0300
Subject: Re: New test for patches in openbmc/openbmc
To: Ed Tanous <edtanous@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
References: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <67dbec1b-8598-8814-e85e-848b2eb123cf@yadro.com>
Date: Wed, 22 Sep 2021 12:02:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.199.0.205]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Hi Ed!

Most patches you listed (at least those for YADRO) are
platform specific and no repository will accept them for
a general audience.

No vendor, I'm confident, is willing to spend endless time
persuading maintainers to include vendor-specific or
platform-specific patches into their repositories.

For instance, 
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-boot-initiator-mailbox.patch
is there because our customers demand this feature and we failed
proving to openbmc maintainers that this is a needed feature
and not a "security threat" or something. We honestly tried for months.

On the other hand, 
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-position-support.patch
is strictly hardware-specific and is not needed as is for other
vendors or platforms, and we don't have time to make it a
generic solution. If we ever do have that time, we will surely
push the developed generic solution to the appropriate
repository.

What you propose now will force vendors to move farther away
from upstream and create their own forks of openbmc where
they will not even try to upstream their changes and will just drift
farther and farther away.

Is that what you really pursue or did I get your idea wrong?
So far it looks to me like a destructive decision.

WBR, Alexander.

22.09.2021 01:35, Ed Tanous пишет:
> A few new features have been merged into CI that will now disallow
> .patch files within most meta layers.  This is due to a significant
> number of them popping up in both reviews and in the repo itself,
> despite having documented rules to the contrary.  The hope here is to
> better codify our rules, and give very quick response to submitters
> about the right procedure so we can encourage getting patches in
> faster, and keep machines buildable against master.  As the patches
> state, meta-phosphor is still allowed to contain patch files as an
> escape hatch, if the community decides it's required.
>
> The patchsets in question are here:
> https://gerrit.openbmc-project.xyz/q/repotest
>
> And add some ability for us to make more of these expectations for
> meta layers codified in the future.
>
> The script itself is here:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-repotest.sh
> and is runnable on any tree prior to submitting to CI.  We currently
> have the following patches in meta layers.
>
> meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-power-control-modifications-for-EthanolX.patch
> meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-support-offset-option.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-Switch-PWM-pin-to-GPIO-input-mode.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disable-internal-PD-resistors-for-GPIOs.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-gpio-support.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enable-SPI-master-mode.patch
> meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-support-Mt.Jade-platform-init.patch
> meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedance-g220a-Enable-ipmb.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-aspeed-Add-Aspeed-UART-routing-control-driver.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts-aspeed-Add-uart-routing-node.patch
> meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts-aspeed-Enable-g220a-uart-route.patch
> meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-proxy/0001-Remove-Total_Power-sensor.patch
> meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u-boot-ast2600-57600-baudrate-for-bletchley.patch
> meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-configs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-Mux-for-yosemitev2.patch
> meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-host-console-handle.patch
> meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
> meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-right-perl.patch
> meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-LDFLAGS.patch
> meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-clean-dev.patch
> meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-reset_phy-for-Zaius.patch
> meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-with-Bitbake.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-status-support.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-set-fieldmode-to-true.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-support.patch
> meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-position-support.patch
> meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-channel-selector.patch
> meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-and-send-SRESET-for-one-thread-only.patch
> meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-initiator-mailbox-interface.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for-persistent-only-settings.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-boot-initiator-mailbox.patch
> meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-parsing-update-AUX-revision-info.patch
>
> If you are a maintainer of these meta layers, please work to get these
> patches submitted to the correct repositories using their prefered
> review (email for linux/u-boot, gerrit for phosphor repos).
>
> Thanks,
>
> -Ed
