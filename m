Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365E413D9F
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 00:36:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDbqy6xqhz2yLV
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 08:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bePUw6im;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=bePUw6im; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDbqY1Plmz2xY4
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 08:35:52 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id u15so1101132wru.6
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=D3CLd+5jLHclWinINRIK43SXjNMNkT0Fi76xP2HuflM=;
 b=bePUw6imQt40aQmAVtxGDrrNUSnf5QsL9+2+UcSPGK4tZGPBJQiJne2qSMBSKtqbKh
 yiUxTyaOgFDIiAvyChHbmljtT0PbLiGa9AzuIU64r4eKgnaMJ2j0vLJ3dDXuN8JZYEnD
 BIyEi/YsihPmpnlna7j5cMomG7rhCnXIUf6Epuq+TLRYtFjuM1Me7KYo4aeIBia2uXvY
 F3gFldORSLyI8cKE3D7xf0INVNfLs10HaoEVHgRCqCI4HNjpeYkRDTQE2xXGdIt79Qhh
 YRr/vG/3lXsTgp8w6IbzR3T3DJ0OJcZfODWDw5ftDwa1zz9ctxU2sSEo77srwNJORoM9
 5NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D3CLd+5jLHclWinINRIK43SXjNMNkT0Fi76xP2HuflM=;
 b=8IT1lwkMV1G+8sylGgTnWck+GoSEVzMua7Ee2CmcBz1bfFTiZQarglGGy+yCbupD9h
 Bu9f4wJy6SCE2kLdlxRaXkT2yIk/0+g50xX47GsV3Y1f60f2lNN5kyBYtHWKZYOl6+zr
 KsDiGQ3BL78CEQqM9UogAufknKDakyet0bu/XFgBS7+jmvnT7BK+z4EfEdqaLujeUbMa
 GrCVXGcKbzEhGraRdyXNXjKjh472LI51A94mbdVQFQ753joA2C5nE1mNTYVmVX9MTe4K
 EeVYy8v99c8QeqaRSnJX68S2K09iCCMVmStyq7FNvE8W0TFEQ64VWgIb5S3j/diebOsP
 MkSQ==
X-Gm-Message-State: AOAM5328VJwfDLgAGX0sdCUrHtntS7GnwkxoVtI02j1wndQHi7SlxNiK
 xtsiEFKlkkFmeWiSuXy+oZLAhI2/IWh30awhIf1/NGeSijkvRhc1
X-Google-Smtp-Source: ABdhPJy+LCyCSxJCP5+l66+A6Z3zcFt0WYVkfc2FSlJe93qLV7u/eis/AVSnMWagPQ/XWXARB7rMgCeCWfKBiaPkVuc=
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr6921726wmb.139.1632263744101; 
 Tue, 21 Sep 2021 15:35:44 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Tue, 21 Sep 2021 15:35:33 -0700
Message-ID: <CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg37E5EG42EJg@mail.gmail.com>
Subject: New test for patches in openbmc/openbmc
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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

A few new features have been merged into CI that will now disallow
.patch files within most meta layers.  This is due to a significant
number of them popping up in both reviews and in the repo itself,
despite having documented rules to the contrary.  The hope here is to
better codify our rules, and give very quick response to submitters
about the right procedure so we can encourage getting patches in
faster, and keep machines buildable against master.  As the patches
state, meta-phosphor is still allowed to contain patch files as an
escape hatch, if the community decides it's required.

The patchsets in question are here:
https://gerrit.openbmc-project.xyz/q/repotest

And add some ability for us to make more of these expectations for
meta layers codified in the future.

The script itself is here:
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run-repotest.sh
and is runnable on any tree prior to submitting to CI.  We currently
have the following patches in meta layers.

meta-amd/meta-ethanolx/recipes-x86/chassis/x86-power-control/0001-Amd-power-control-modifications-for-EthanolX.patch
meta-ampere/meta-common/recipes-devtools/mtd/mtd-utils/0001-flashcp-support-offset-option.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0001-aspeed-scu-Switch-PWM-pin-to-GPIO-input-mode.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0002-aspeed-Disable-internal-PD-resistors-for-GPIOs.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0003-aspeed-support-passing-system-reset-status-to-kernel.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0004-aspeed-add-gpio-support.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0005-aspeed-Enable-SPI-master-mode.patch
meta-ampere/meta-jade/recipes-bsp/u-boot/u-boot-aspeed/0006-aspeed-support-Mt.Jade-platform-init.patch
meta-aspeed/recipes-bsp/u-boot/files/default-gcc.patch
meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0001-bytedance-g220a-Enable-ipmb.patch
meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0003-misc-aspeed-Add-Aspeed-UART-routing-control-driver.patch
meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0004-ARM-dts-aspeed-Add-uart-routing-node.patch
meta-bytedance/meta-g220a/recipes-kernel/linux/linux-aspeed/0005-ARM-dts-aspeed-Enable-g220a-uart-route.patch
meta-bytedance/meta-g220a/recipes-phosphor/ipmi/phosphor-node-manager-proxy/0001-Remove-Total_Power-sensor.patch
meta-facebook/meta-bletchley/recipes-bsp/u-boot/u-boot-aspeed-sdk/0001-u-boot-ast2600-57600-baudrate-for-bletchley.patch
meta-facebook/meta-tiogapass/recipes-bsp/u-boot/u-boot-aspeed/0001-configs-ast-common-use-57600-baud-rate-to-match-Tiog.patch
meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-Mux-for-yosemitev2.patch
meta-facebook/meta-yosemitev2/recipes-bsp/u-boot/u-boot-aspeed/0002-spl-host-console-handle.patch
meta-google/dynamic-layers/nuvoton-layer/recipes-bsp/images/npcm7xx-igps/0001-Set-FIU0_DRD_CFG-and-FIU_Clk_divider-for-gbmc-hoth.patch
meta-google/recipes-extended/libconfig/files/0001-conf2struct-Use-the-right-perl.patch
meta-google/recipes-extended/libconfig/files/0001-makefile-Add-missing-LDFLAGS.patch
meta-google/recipes-phosphor/initrdscripts/obmc-phosphor-initfs/rwfs-clean-dev.patch
meta-ingrasys/meta-zaius/recipes-bsp/u-boot/u-boot-aspeed/0001-board-aspeed-Add-reset_phy-for-Zaius.patch
meta-nuvoton/recipes-bsp/images/npcm7xx-igps/0001-Adjust-paths-for-use-with-Bitbake.patch
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0001-Add-system-reset-status-support.patch
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0002-config-ast-common-set-fieldmode-to-true.patch
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0003-aspeed-add-gpio-support.patch
meta-yadro/meta-nicole/recipes-bsp/u-boot/files/0004-aspeed-add-bmc-position-support.patch
meta-yadro/meta-nicole/recipes-kernel/linux/linux-aspeed/0001-Add-NCSI-channel-selector.patch
meta-yadro/meta-nicole/recipes-phosphor/host/op-proc-control/0001-Stop-and-send-SRESET-for-one-thread-only.patch
meta-yadro/recipes-phosphor/dbus/phosphor-dbus-interfaces/0001-Add-boot-initiator-mailbox-interface.patch
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0001-Add-support-for-persistent-only-settings.patch
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0002-Add-support-for-boot-initiator-mailbox.patch
meta-yadro/recipes-phosphor/ipmi/phosphor-ipmi-host/0003-Fix-version-parsing-update-AUX-revision-info.patch

If you are a maintainer of these meta layers, please work to get these
patches submitted to the correct repositories using their prefered
review (email for linux/u-boot, gerrit for phosphor repos).

Thanks,

-Ed
