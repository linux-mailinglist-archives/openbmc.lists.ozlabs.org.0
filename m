Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8FD5637D
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:39:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZg81pBKzDqQm
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:39:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pMKkbVCJ"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZfb6mLJzDqKV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 17:39:19 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id w25so394545ioc.8
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 00:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTjxIK0c0opa7xhTId2uhU0GdbUNPkRH+9v/jF/i98o=;
 b=pMKkbVCJmygcBFvgkWiQ4N/ir4tTnAv2VujocG+K0m65zpR77uLoPFHU16GHkFB1DV
 NCX8NpIpgR5RLC+/YoM0ESBKaNdhHSRkmZh6rmf+az2OjAGWMZRxBPd7fmL/1SJL02+x
 vArpVKvcorKAXq6DfqsZ0EZUfZ2XDR5kAkfvZbZ0NanNlPqxFb0y4wTbASOum5xHaF2a
 AMI6lu8oufsteU6UTampI/nCeLipIgFvnvd1mclXRv24c8IdIkxoHcmjD8Jlj86M5avy
 ei79XPoL5ArxBnCO0EKy+BTfTK4cskqvsh3VLkNrPK3NGpzIdDPkD0oJ4hVnyzgUjvRM
 /thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTjxIK0c0opa7xhTId2uhU0GdbUNPkRH+9v/jF/i98o=;
 b=PEyqqLY1tjGMeXe0YZjEXJVnlIgUKqmDIeYH4HyQo5COrRq0xdQ0P4ZnM4yRX2bIhB
 pK9u9cnOHFxZcrrH8Z2lsrSXo1ahnh8a23nI6FBT311UPChiwYO1+dfRcJUuInUXTjUa
 B8y+OGJukRcsa+fe7CG0kB1ssAiuObKPUvwhhu6mqf3iUpc54kXPlpIdfpsQl09esS8y
 ObJPX3EgU7fJghRBxEY+p1aFOO9ucXo4R7LiLTSjYlQAhABrZSMM+kmsdHOxigSVZA2N
 SiIQ7anS/i8pDAVNAOqF+rIPvlDp+4mpEbFMgt/UMHVhSvlbRHwAlNugihdRkrVSB04M
 0Nwg==
X-Gm-Message-State: APjAAAVvCLlKFRdielbFJpZhSVjdv1+sOnOWz83Q98X6AEoSF38pH7nK
 t/7LQdu/7Etjp7KbfO3Zh5gdlEk4iDCO2vm7wtEFiPCVlIc=
X-Google-Smtp-Source: APXvYqy9R/Sx5gaLZt6fbZ/PKwbuq0ScxsvxEapE8lRLMu01mRF1+bYCI26tqsM5jZx36wCnUoCGyP1eB1ISxX5DWa0=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr3227221jai.39.1561534756078; 
 Wed, 26 Jun 2019 00:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190614071643.18607-1-mine260309@gmail.com>
 <b75c57a9f3ac3c6e91c470d69dcd2ab6a4f6ee03.camel@ozlabs.org>
In-Reply-To: <b75c57a9f3ac3c6e91c470d69dcd2ab6a4f6ee03.camel@ozlabs.org>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Jun 2019 15:39:04 +0800
Message-ID: <CAARXrtmqkYeHiE9rr4uYL_b3YtK=-hsnmR3DJtdy1_ZVLKWtUQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1] fsi: core: Fix NULL dereference issue
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2019 at 9:33 AM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Lei,
>
> > The failure case in fsi_slave_init() is wrong and could cause NULL
> > dereference issue.
> > E.g. on FP5280G2 machine, it could get failure in
> > fsi_slave_set_smode(),
> > and when it does fsi rescan, kernel crashes due to:
> >
> >     Unable to handle kernel NULL pointer dereference at virtual
> > address 00000060
> >
> > The fix is to make it not calling kfree() but just goto err_free.
> >
> > However, in err_free, it calls put_device() to free the device, it
> > still
> > cause issue during fsi rescan, that the device is used after freed.
> >
> >     WARNING: CPU: 0 PID: 1433 at lib/refcount.c:190
> > refcount_sub_and_test_checked+0x94/0xac
> >     refcount_t: underflow; use-after-free.
> >
> > So the put_device() is removed and "err_free" label is renamed to
> > "fail".
>
> It looks like this will leak memory (through the struct fsi_slave) that
> has been kzalloc()ed. After device_register, we need to call
> put_device() to free the struct fsi_slave, but there's no mechanism for
> that to happen if we remove it from fsi_slave_init().

The memory is "leaked" in this function, that the slave device is not freed
here. But eventually, it will be freed in fsi_slave_release() (if I understand
the code correctly), so there is no leak, eventually.

> The error paths for this function do need to be fixed, but I don't think
> this is the right approach.
>
> Do you have a backtrace of the refcount_sub_and_test_checked+0x94/0xac
> warning? This may not be the actual struct device that underflows.

Yes, below is the full trace:

kernel: ------------[ cut here ]------------
kernel: WARNING: CPU: 0 PID: 1417 at lib/refcount.c:190
refcount_sub_and_test_checked+0x94/0xac
kernel: refcount_t: underflow; use-after-free.
kernel: CPU: 0 PID: 1417 Comm: openpower-proc- Tainted: G        W
    5.1.1-60926c8a1d00a056568cb44da9e96d3ee5f6e654 #1
kernel: Hardware name: Generic DT based system
kernel: Backtrace:
kernel: [<80107ca0>] (dump_backtrace) from [<80107ed4>] (show_stack+0x20/0x24)
kernel:  r7:803629e8 r6:00000009 r5:00000000 r4:95937d14
kernel: [<80107eb4>] (show_stack) from [<8067e944>] (dump_stack+0x20/0x28)
kernel: [<8067e924>] (dump_stack) from [<80115ff8>] (__warn.part.3+0xb4/0xdc)
kernel: [<80115f44>] (__warn.part.3) from [<8011608c>]
(warn_slowpath_fmt+0x6c/0x90)
kernel:  r6:000000be r5:807ff14c r4:80a07008
kernel: [<80116024>] (warn_slowpath_fmt) from [<803629e8>]
(refcount_sub_and_test_checked+0x94/0xac)
kernel:  r3:80a4cbda r2:807ff1b8
kernel:  r7:80410c1c r6:94506710 r5:95937ddc r4:00000000
kernel: [<80362954>] (refcount_sub_and_test_checked) from [<80362a18>]
(refcount_dec_and_test_checked+0x18/0x1c)
kernel:  r5:95937ddc r4:94503c08
kernel: [<80362a00>] (refcount_dec_and_test_checked) from [<806836a8>]
(kobject_put+0x2c/0x1e8)
kernel: [<8068367c>] (kobject_put) from [<80410c44>]
(klist_children_put+0x28/0x2c)
kernel:  r6:94506710 r5:95937ddc r4:945060fc
kernel: [<80410c1c>] (klist_children_put) from [<80683130>]
(klist_next+0x8c/0xe0)
kernel: [<806830a4>] (klist_next) from [<80412548>]
(device_for_each_child+0x4c/0xa4)
kernel:  r10:00000051 r9:95937f60 r8:95075030 r7:80a07008 r6:80525804
r5:00000000
kernel:  r4:00000000 r3:db89ad67
kernel: [<804124fc>] (device_for_each_child) from [<80525910>]
(fsi_master_rescan+0x40/0x68)
kernel:  r7:959293a0 r6:95075020 r5:94503afc r4:94503a00
kernel: [<805258d0>] (fsi_master_rescan) from [<8052562c>]
(master_rescan_store+0x1c/0x28)
kernel:  r5:00000000 r4:00000001
kernel: [<80525610>] (master_rescan_store) from [<80410354>]
(dev_attr_store+0x28/0x34)
kernel:  r5:00000000 r4:80525610
kernel: [<8041032c>] (dev_attr_store) from [<802acac8>]
(sysfs_kf_write+0x48/0x54)
kernel:  r5:00000000 r4:8041032c
kernel: [<802aca80>] (sysfs_kf_write) from [<802abef8>]
(kernfs_fop_write+0x10c/0x1ec)
kernel:  r5:00000000 r4:00000000
kernel: [<802abdec>] (kernfs_fop_write) from [<80237e80>]
(__vfs_write+0x44/0x18c)
kernel:  r10:95937f60 r9:00000001 r8:00000000 r7:95937f60 r6:802abdec
r5:80a07008
kernel:  r4:95930f40
kernel: [<80237e3c>] (__vfs_write) from [<80239864>] (vfs_write+0xb0/0x194)
kernel:  r10:00000000 r9:00000000 r8:00000000 r7:95937f60 r6:0101a3d0
r5:95930f40
kernel:  r4:00000001
kernel: [<802397b4>] (vfs_write) from [<80239b10>] (ksys_write+0x70/0xe8)
kernel:  r8:00000000 r7:0101a3d0 r6:80a07008 r5:95930f40 r4:95930f40
kernel: [<80239aa0>] (ksys_write) from [<80239ba0>] (sys_write+0x18/0x1c)
kernel:  r9:95936000 r8:801011e4 r7:00000004 r6:00000003 r5:0101a3d0 r4:00000001
kernel: [<80239b88>] (sys_write) from [<80101000>] (ret_fast_syscall+0x0/0x54)
kernel: Exception stack(0x95937fa8 to 0x95937ff0)
kernel: 7fa0:                   00000001 0101a3d0 00000003 0101a3d0
00000001 00000000
kernel: 7fc0: 00000001 0101a3d0 00000003 00000004 0006ac0c 0006ac20
7e994c88 7e994a1c
kernel: 7fe0: 00000070 7e9949a8 48a884ac 48714fec
kernel: ---[ end trace 366cbd7a56b7dc9f ]---
