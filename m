Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC3B62D174
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:11:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCQ1g0Gsvz3cNL
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 14:11:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HsDOy79y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HsDOy79y;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCQ151p9Fz3cH0
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 14:11:20 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id p16so372020wmc.3
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 19:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kMQUR/P9zmZ63ObtODPpvJ3Y83wVIMyl1Du63a5jEE=;
        b=HsDOy79y+YSdSCn02joPyKravBwxl44TXsgmTfyTk/obSmUlnFbxqqS7YOaATacrQd
         7Q0qZN2uuT1z6vQiNCr+yZW5/I8ExPXqNvd/9MNM0DkYSGgGucRr/nrXq1p6wiGSS7xn
         lsFPf8z23lLbx7LG4dNummPwF5BWTyeEpgfVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kMQUR/P9zmZ63ObtODPpvJ3Y83wVIMyl1Du63a5jEE=;
        b=Lmb3ptsqbwTdxLm5ySTn5dc3v3+NuZ3RplcZL0wYGzpq+sh+sjPYs0Jbxy0l2adYhs
         7zrxkwoMV1nawM4J1aY9ELkonGnk54EIoHWPPjA+jlZbqYy0b+me19s4dDlPV2Ur5Ogn
         4cmtQqDZftFJLTr31MZ8rTRAY9WEExYgzqQjHiYVBLrF7baTslUndCdNLbvm87ofnSMj
         Eth1K1sJOnTYozawDbuFlFNnmFOoTdZfoyolC3y7/1lQmIpSXHThslYxX3jGnHQDtiBr
         n1jd4ORGKJX6IrA+tTrRR9NR94vJpt/WdL4luKxhpIqFIepzPUlfxinBHoIKclBiCU74
         xieA==
X-Gm-Message-State: ANoB5pnOz8CYARR3ojAEM8lTs/HMH9mzoNy1vfunOat2Xpuk0DcnfRNG
	PiFMREJU9yORwpFPXtx0hYM0D1uMDZfmJdC6AnM=
X-Google-Smtp-Source: AA0mqf7HVEUauCNTqyP/TMdslEOW5FYkpAFlFfpUo538+gHqtuJcJwbWyOs5QHKGtsbtdoUqYw4sqL3WUkVw0zzqd90=
X-Received: by 2002:a05:600c:4f83:b0:3cf:8b32:a52 with SMTP id
 n3-20020a05600c4f8300b003cf8b320a52mr3946275wmq.72.1668654677080; Wed, 16 Nov
 2022 19:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20221031024442.2490881-1-quan@os.amperecomputing.com> <c42b8b25-1f58-9edb-37d5-37739d529360@os.amperecomputing.com>
In-Reply-To: <c42b8b25-1f58-9edb-37d5-37739d529360@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2022 03:11:05 +0000
Message-ID: <CACPK8Xf3ZqBnafy4+39M_Xzto4nsMazaNXThFzhjszuu4kvG7g@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Add Ampere's Altra SMPro child drivers
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: Open Source Submission <patches@amperecomputing.com>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Nov 2022 at 03:56, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Dear Joel,
>
> As this patch set was all accepted in linux-next tree, May you help to
> pick them to your openbmc/linux dev-6.0 branch?

Done. Great work, well done.

Cheers,

Joel

>
> The list of commits is as below (as some was picked in v9 and the remain
> was picked in v10):
>
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=072b9545e5cf470eea01f8e59c3dbd4b81181a2e
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=026d99699101db523f444d0fc3dddb75fef42594
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=4a4a4e9ebaa3ce903a3cdf8bb173eeaf87828cea
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=763dc90e9a4332f82ad43c866c6878742b15d4ab
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=2202e8df80936fa0d92d49cc7db1562e7772308e
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=c157f6e8ea2e61ab72f85567f37faa4711c291d7
> +
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=37618918f6c7219e1bfb86e4c3fe7834092643d0
>
> Thank you for the help.
> - Quan
>
>
> On 31/10/2022 09:44, Quan Nguyen wrote:
> > The SMpro co-processor on Ampere Altra processor family is to monitor
> > and report various data included hwmon-related info, RAS errors, and
> > other miscellaneous information. The SMPro MFD driver initializes the
> > register map and instantiates all sub-devices. All the specifics will
> > be handled in the child drivers.
> >
> > As some patches in previous version were picked, this patchset includes
> > the remain patches which are Ampere SMpro errmon, SMPRO misc and dt
> > bindings document for SMPro MFD driver. The errmon driver supports
> > monitoring and reporting RAS-related errors. The misc driver supports
> > reporting boot progress and other miscellaneous information.
> >
> > Discussion for v9:
> > https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/
> >
> > v10:
> >    + Revise and fix document format                             [Bagas]
> >    + Update commit message: s/This commit adds/Add/             [Bagas]
> >    + Use
> >      Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> >                                                                  [Greg]
> >    + Drop Documentation/misc-devices/smpro-[errmon|misc].rst     [Greg]
> >
> > v9:
> >    + Fix issue when building htmldocs                           [Bagas]
> >    + Insert 'break;' to avoid fall-through          [kernel test robot]
> >    + Update SPDX license                                         [Greg]
> >    + Fix messy goto                                              [Greg]
> >    + Use ATTRIBUTE_GROUPS()                                      [Greg]
> >    + Use dev_groups instead of sysfs_create_group() to avoid
> >    user space racing issue                                       [Greg]
> >    + Fix ugly static struct define                               [Greg]
> >    + Rename smpro-mfd.c to smpro-core.c                     [Lee Jones]
> >    + Fix include files in alphabetical order                [Lee Jones]
> >    + Add defines to avoid using magic numbers               [Lee Jones]
> >    + Return -EINVAL if device does not match                [Lee Jones]
> >    + Remove unnecessary comment                             [Lee Jones]
> >    + Remove unnecessary channel info for VRD and DIMM event      [Quan]
> >    + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
> >    + Add minor refactor code                                     [Quan]
> >
> > v8:
> >    + Insert 'break;' to avoid fall-through          [kernel test robot]
> >    + Avoid uninitialized variable use               [kernel test robot]
> >    + Remove unused #*_cells                                 [Krzysztof]
> >    + Switch to use sysfs_emit()                                  [Greg]
> >    + Sysfs to return single value only                           [Greg]
> >    + Fix KernelVerion field in Documentation/ABI/testing doc     [Greg]
> >    + Change errors_* sysfs to error_*                            [Quan]
> >    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
> >    overflow status of each type of HW errors                     [Quan]
> >    + Update wording in Kconfig for smpro-errmon and smpro-misc   [Quan]
> >    + Masks reserved bit when read 10-bit power value             [Quan]
> >    + Add some minor refactor                                     [Quan]
> >
> > v7:
> >    + Add docs to Documentation/ABI/testing                       [Greg]
> >    + Re-order patches to avoid compile dependency           [Lee Jones]
> >    + Remove regmap_acquire/release_lock()                        [Quan]
> >    + Install regmap bus->read/write() to handle multiple types of bus
> >      access                                                      [Quan]
> >    + Replace i2c block read by regmap_noinc_read()               [Quan]
> >    + Fix wrong return type of *show/store()         [kernel test robot]
> >    + Update GPL version                                          [Quan]
> >    + Add some others minor code refactor                         [Quan]
> >
> > v6:
> >    + Introduced smpro-errmon, smpro-misc as smpro-mfd sub-device [Quan]
> >
> > v5:
> >    + Introduced the smpro-mfd driver and drop the use of
> >    simple-mfd-i2c driver to avoid DT node with no resource in child
> >    device DT nodes [Rob]
> >    + Removed the use of reg DT property in child driver [Quan]
> >    + Validated ManufactureID when probing smpro-mfd drivers [Quan]
> >    + As child devices are instantiated by SMPro MFD driver, drop the
> >    ManufacturerID checking in child driver, ie: smpro-hwmon [Quan]
> >    + Revised commit messages [Quan]
> >
> > v4:
> >    + Revised commit message [Quan]
> >    + Fixed build issue found by kernel test robot [Guenter]
> >    + Returned regmap_read() error code [Guenter]
> >
> > v3:
> >    + Supported list of compatible string [Rob]
> >    + Introduced reg property in DT to specify reg offset [Rob]
> >    + Updated description and other minor changes in yaml file [Rob]
> >    + Handled negative temperature value [Guenter]
> >    + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
> >    + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
> >    + Removed smpro_write() function [Guenter]
> >    + Added minor refactor changes [Quan]
> >
> > v2:
> >    + Used 'struct of_device_id's .data attribute [Lee Jones]
> >    + Removed "virtual" sensors [Guenter]
> >    + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
> >    + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
> >    + Clarified "highest" meaning in documentation [Guenter]
> >    + Corrected return error code when host is turn off [Guenter]
> >    + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
> >    + Removed license info as SPDX-License-Identifier existed [Guenter]
> >    + Added is_visible() support [Guenter]
> >    + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
> >    + Made is_valid_id() return boolean [Guenter]
> >    + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
> >    + Removed unnecessary error message when dev register fail [Guenter]
> >    + Removed Socket TDP sensor [Quan]
> >    + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
> >    + Included sensor type and channel in labels [Quan]
> >    + Refactorized code to fix checkpatch.pl --strict complaint [Quan]
> >
> > Quan Nguyen (3):
> >    dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
> >    misc: smpro-errmon: Add Ampere's SMpro error monitor driver
> >    misc: smpro-misc: Add Ampere's Altra SMpro misc driver
> >
> >   .../sysfs-bus-platform-devices-ampere-smpro   | 312 +++++++++++
> >   .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
> >   drivers/misc/Kconfig                          |  22 +
> >   drivers/misc/Makefile                         |   2 +
> >   drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
> >   drivers/misc/smpro-misc.c                     | 145 +++++
> >   6 files changed, 1052 insertions(+)
> >   create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> >   create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
> >   create mode 100644 drivers/misc/smpro-errmon.c
> >   create mode 100644 drivers/misc/smpro-misc.c
> >
