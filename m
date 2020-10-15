Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27128F0CB
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 13:16:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBmtv5msFzDqR1
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 22:16:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RifAiT6m; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBmjw44qdzDqPw
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 22:08:29 +1100 (AEDT)
Received: by mail-vs1-xe2c.google.com with SMTP id v23so1246787vsp.6
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8prrR4RdTojqSAC4w0YmZjNIz4Fi3hrfb/OhRHsagf4=;
 b=RifAiT6m4WqQg1QZKcK0lwp+JRbhcwhN9KXCnwpZWcSv4umXXtxhWOuTt6bMFk0ufR
 7qtKZ+Qg5aJkpTuHI1W4D3LDKsYk5EQGcaJo6Mn2BZwqV/OuVaLMsdp4IZ6IlMqWtptj
 I71pVJLPzsuraHzcimnjhzvVlwlzMTioumi4JhnQri8s/7v9M6SP1lIeLTht2lA0KdXy
 igNsWhVOXd+pmCUj7cBa/S95Jt9aHGubzVaSWeupTVb2YUE68rwOipMzJJ4L9wTDctE/
 GRTnrdpzzc3/B2FxFxr5NMs4T38XjNDgWgzAo9rivnmQchTMXbc/qj4t+aKISrBBvPaK
 Xm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8prrR4RdTojqSAC4w0YmZjNIz4Fi3hrfb/OhRHsagf4=;
 b=N5S51mmUbhh+vBKEmqhNiMVlnJ2w+aH32Lb/GYKIvwPen1htybQDVO0nuZ96+Y03rf
 UV7YXEDjctFu1grq8iheVpfSw+ZAhIRF5zbRw4IOcAF7rnIGSfbYJjAhXF1LxQxavcAN
 9e4psKw7hltDeKVQQLV7n0L+Jf295FDuan16Ly4zT9sYJr25dbz9iVFpYY7AS4xJ20FJ
 O6CF2Rs3BSJarJhUWudMfr3PInnqGficphFjP5T2k+qt7DUHTe4NOQIIUsK5HaHLUimk
 FfktfvAAlDPfaYez35DgrxRa1bSgNDkOsKb6baMJSWUvjaLZnduW5SeaEEH8YeAM2MtD
 NMew==
X-Gm-Message-State: AOAM532Dp86zrXKZ5rQ+8qMs+jSdFaZl2E/nI7YS7yZs+0EcQ0CL0DCQ
 9jgE8xiMbF8iQEnT7IoyBIG/Yn+tp5VQLsuq1Gk=
X-Google-Smtp-Source: ABdhPJzyUpXxip0rM+vNi/uQ3Irfmt/Uud6G7LaYfKn4o6jsd+QG0dbiYys3yKAF7nUiI7hZ5qCL28OvKXZBQTPbH6s=
X-Received: by 2002:a67:6444:: with SMTP id y65mr2027792vsb.43.1602760104261; 
 Thu, 15 Oct 2020 04:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
In-Reply-To: <65961456-D5F6-41CC-AD10-93E716386953@nvidia.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 15 Oct 2020 16:38:13 +0530
Message-ID: <CAM=TmwWc4aCsa_UZiwKByor32f6=1OmofKuY6XjuMa7RpC_9xQ@mail.gmail.com>
Subject: Re: Kernel panic when net booting OpenBMC
To: Nirenjan Krishnan <nkrishnan@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000acbbc005b1b3aa66"
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

--000000000000acbbc005b1b3aa66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nirenjan,

On Thu, Oct 15, 2020 at 5:13 AM Nirenjan Krishnan <nkrishnan@nvidia.com>
wrote:

> Hi,
>
> I=E2=80=99m trying to netboot an OpenBMC image on a custom target board t=
hat we
> are building. The board boots fine when we boot from flash, but when
> booting from the network, I run into the following kernel panic:
>
> [    1.195106] /dev/root: Can't open blockdev
> [    1.195425] VFS: Cannot open root device "nfs" or unknown-block(0,255)=
:
> error -6
> [    1.195736] Please append a correct "root=3D" boot option; here are th=
e
> available partitions:
> [    1.196391] 1f00           32768 mtdblock0
> [    1.196438]  (driver?)
> [    1.196769] 1f01             384 mtdblock1
> [    1.196775]  (driver?)
> [    1.197074] 1f02             128 mtdblock2
> [    1.197079]  (driver?)
> [    1.197357] 1f03            4352 mtdblock3
> [    1.197362]  (driver?)
> [    1.197647] 1f04           23808 mtdblock4
> [    1.197652]  (driver?)
> [    1.197949] 1f05            4096 mtdblock5
> [    1.197955]  (driver?)
> [    1.198246] 1f06           32768 mtdblock6
> [    1.198252]  (driver?)
> [    1.198713] Kernel panic - not syncing: VFS: Unable to mount root fs o=
n
> unknown-block(0,255)
> [    1.199310] CPU: 0 PID: 1 Comm: swapper Not tainted
> 5.8.0-671550e-dirty-3ae2c18 #1
> [    1.199860] Hardware name: Generic DT based system
> [    1.200228] Backtrace:
> [    1.200671] [<80106f1c>] (dump_backtrace) from [<80107170>]
> (show_stack+0x20/0x24)
> [    1.201155]  r7:00008000 r6:808ec4b4 r5:00000000 r4:808fe258
> [    1.201512] [<80107150>] (show_stack) from [<807a5414>]
> (dump_stack+0x28/0x30)
> [    1.201882] [<807a53ec>] (dump_stack) from [<80116160>]
> (panic+0xf8/0x320)
> [    1.202229]  r5:00000000 r4:80b84290
> [    1.202499] [<80116068>] (panic) from [<80a01aa0>]
> (mount_block_root+0x2e4/0x398)
> [    1.202881]  r3:80b03008 r2:00000000 r1:8e4a1ec4 r0:808ec4b4
> [    1.203168]  r7:00008000
> [    1.203316] [<80a017bc>] (mount_block_root) from [<80a01bcc>]
> (mount_root+0x78/0x94)
> [    1.203718]  r10:8098cf04 r9:80a2983c r8:80a2985c r7:00000008
> r6:8e4966e0 r5:80a29875
> [    1.204102]  r4:000000ff
> [    1.204242] [<80a01b54>] (mount_root) from [<80a01d24>]
> (prepare_namespace+0x13c/0x194)
> [    1.204640]  r5:80a29875 r4:80b84028
> [    1.204840] [<80a01be8>] (prepare_namespace) from [<80a0154c>]
> (kernel_init_freeable+0x1b0/0x1f8)
> [    1.205282]  r5:80b84000 r4:00000096
> [    1.205495] [<80a0139c>] (kernel_init_freeable) from [<807bedc4>]
> (kernel_init+0x18/0x120)
> [    1.205913]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
> r6:00000000 r5:807bedac
> [    1.206305]  r4:00000000
> [    1.206454] [<807bedac>] (kernel_init) from [<80100128>]
> (ret_from_fork+0x14/0x2c)
> [    1.206898] Exception stack(0x8e4a1fb0 to 0x8e4a1ff8)
> [    1.207303] 1fa0:                                     00000000 0000000=
0
> 00000000 00000000
> [    1.207831] 1fc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0
> 00000000 00000000
> [    1.208353] 1fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
> [    1.208739]  r5:807bedac r4:00000000
> [    1.209505] ---[ end Kernel panic - not syncing: VFS: Unable to mount
> root fs on unknown-block(0,255) ]---
>
> I enabled CONFIG_NETWORK_FILESYSTEMS, CONFIG_NFS_FS and CONFIG_ROOT_NFS i=
n
> the kernel configuration, rebuilt the kernel and verified that the flash
> boot works fine.
>
> These are the commands that I ran to netboot
>
> ast# tftp 83000000 uImage
> ast# tftp 84000000 aspeed.dtb
> ast# setenv serverip 10.x.x.x
> ast# setenv bootargs root=3D/dev/nfs rw
> nfsroot=3D${serverip}:/data/nfs/test,nolock,tcp console=3DttyS4,115200n8
> mem.devmem=3D1 ip=3D${ipaddr}:${serverip}:${serverip}:255.0.0.0::eth0
> nfsrootdebug
> ast# bootm 83000000 - 84000000
>
> I also used the fitImage directly instead of a separate uImage and DTB,
> and ran into the same error. I tried enabling CPIO image builds by adding
> the following line in local.conf:
>
> IMAGE_FSTYPES +=3D "cpio.${INITRAMFS_CTYPE}.u-boot"
>

It seems like the rootfs can't be found. The fitImage based approach
usually works well for me. Can you elaborate what you did with the fitImage
based approach? I typically do this (on an AST2500) :

1) Add IMAGE_FSTYPES +=3D "cpio.${INITRAMFS_CTYPE}.u-boot" to the conf
2) Copy fitImage and obmc-phosphor-image-<platform>.cpio.lzma.u-boot to the
tftp server.
3) Setup the tftp server and the BMC network
4) tftp 0x83000000 fitImage
5) tftp 0x93000000 initrd (in step 2 I had named the cpio image as initrd
on the tftp server). At this stage 'iminfo' should show what images have
been loaded.
6) bootm 0x83000000 0x93000000

If you want to instead boot from NFS, then I see Yu Lei has some
suggestions/questions for you.

Regards,
Deepak


> However, if I use the generated CPIO image directly as the initramfs, the=
n
> all I see is "Starting kernel ..." and no further output from the system.
>
> Could you please suggest how I could go about debugging this? I've
> followed all the netboot suggestions from these threads on this mailing
> list:\
> - https://lists.ozlabs.org/pipermail/openbmc/2018-June/012054.html
> - https://lists.ozlabs.org/pipermail/openbmc/2015-October/000010.html
>
> Thanks and regards
> Nirenjan Krishnan
>
>

--000000000000acbbc005b1b3aa66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Nirenjan,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 15, 2020 at 5:13 AM Niren=
jan Krishnan &lt;<a href=3D"mailto:nkrishnan@nvidia.com" target=3D"_blank">=
nkrishnan@nvidia.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
I=E2=80=99m trying to netboot an OpenBMC image on a custom target board tha=
t we are building. The board boots fine when we boot from flash, but when b=
ooting from the network, I run into the following kernel panic:<br>
<br>
[=C2=A0 =C2=A0 1.195106] /dev/root: Can&#39;t open blockdev<br>
[=C2=A0 =C2=A0 1.195425] VFS: Cannot open root device &quot;nfs&quot; or un=
known-block(0,255): error -6<br>
[=C2=A0 =C2=A0 1.195736] Please append a correct &quot;root=3D&quot; boot o=
ption; here are the available partitions:<br>
[=C2=A0 =C2=A0 1.196391] 1f00=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032768=
 mtdblock0<br>
[=C2=A0 =C2=A0 1.196438]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.196769] 1f01=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0384 mtdblock1<br>
[=C2=A0 =C2=A0 1.196775]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.197074] 1f02=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0128 mtdblock2<br>
[=C2=A0 =C2=A0 1.197079]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.197357] 1f03=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4352=
 mtdblock3<br>
[=C2=A0 =C2=A0 1.197362]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.197647] 1f04=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A023808=
 mtdblock4<br>
[=C2=A0 =C2=A0 1.197652]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.197949] 1f05=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096=
 mtdblock5<br>
[=C2=A0 =C2=A0 1.197955]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.198246] 1f06=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032768=
 mtdblock6<br>
[=C2=A0 =C2=A0 1.198252]=C2=A0 (driver?)<br>
[=C2=A0 =C2=A0 1.198713] Kernel panic - not syncing: VFS: Unable to mount r=
oot fs on unknown-block(0,255)<br>
[=C2=A0 =C2=A0 1.199310] CPU: 0 PID: 1 Comm: swapper Not tainted 5.8.0-6715=
50e-dirty-3ae2c18 #1<br>
[=C2=A0 =C2=A0 1.199860] Hardware name: Generic DT based system<br>
[=C2=A0 =C2=A0 1.200228] Backtrace:<br>
[=C2=A0 =C2=A0 1.200671] [&lt;80106f1c&gt;] (dump_backtrace) from [&lt;8010=
7170&gt;] (show_stack+0x20/0x24)<br>
[=C2=A0 =C2=A0 1.201155]=C2=A0 r7:00008000 r6:808ec4b4 r5:00000000 r4:808fe=
258<br>
[=C2=A0 =C2=A0 1.201512] [&lt;80107150&gt;] (show_stack) from [&lt;807a5414=
&gt;] (dump_stack+0x28/0x30)<br>
[=C2=A0 =C2=A0 1.201882] [&lt;807a53ec&gt;] (dump_stack) from [&lt;80116160=
&gt;] (panic+0xf8/0x320)<br>
[=C2=A0 =C2=A0 1.202229]=C2=A0 r5:00000000 r4:80b84290<br>
[=C2=A0 =C2=A0 1.202499] [&lt;80116068&gt;] (panic) from [&lt;80a01aa0&gt;]=
 (mount_block_root+0x2e4/0x398)<br>
[=C2=A0 =C2=A0 1.202881]=C2=A0 r3:80b03008 r2:00000000 r1:8e4a1ec4 r0:808ec=
4b4<br>
[=C2=A0 =C2=A0 1.203168]=C2=A0 r7:00008000<br>
[=C2=A0 =C2=A0 1.203316] [&lt;80a017bc&gt;] (mount_block_root) from [&lt;80=
a01bcc&gt;] (mount_root+0x78/0x94)<br>
[=C2=A0 =C2=A0 1.203718]=C2=A0 r10:8098cf04 r9:80a2983c r8:80a2985c r7:0000=
0008 r6:8e4966e0 r5:80a29875<br>
[=C2=A0 =C2=A0 1.204102]=C2=A0 r4:000000ff<br>
[=C2=A0 =C2=A0 1.204242] [&lt;80a01b54&gt;] (mount_root) from [&lt;80a01d24=
&gt;] (prepare_namespace+0x13c/0x194)<br>
[=C2=A0 =C2=A0 1.204640]=C2=A0 r5:80a29875 r4:80b84028<br>
[=C2=A0 =C2=A0 1.204840] [&lt;80a01be8&gt;] (prepare_namespace) from [&lt;8=
0a0154c&gt;] (kernel_init_freeable+0x1b0/0x1f8)<br>
[=C2=A0 =C2=A0 1.205282]=C2=A0 r5:80b84000 r4:00000096<br>
[=C2=A0 =C2=A0 1.205495] [&lt;80a0139c&gt;] (kernel_init_freeable) from [&l=
t;807bedc4&gt;] (kernel_init+0x18/0x120)<br>
[=C2=A0 =C2=A0 1.205913]=C2=A0 r10:00000000 r9:00000000 r8:00000000 r7:0000=
0000 r6:00000000 r5:807bedac<br>
[=C2=A0 =C2=A0 1.206305]=C2=A0 r4:00000000<br>
[=C2=A0 =C2=A0 1.206454] [&lt;807bedac&gt;] (kernel_init) from [&lt;8010012=
8&gt;] (ret_from_fork+0x14/0x2c)<br>
[=C2=A0 =C2=A0 1.206898] Exception stack(0x8e4a1fb0 to 0x8e4a1ff8)<br>
[=C2=A0 =C2=A0 1.207303] 1fa0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A000000000 00000000 00000000 00000000<br>
[=C2=A0 =C2=A0 1.207831] 1fc0: 00000000 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000<br>
[=C2=A0 =C2=A0 1.208353] 1fe0: 00000000 00000000 00000000 00000000 00000013=
 00000000<br>
[=C2=A0 =C2=A0 1.208739]=C2=A0 r5:807bedac r4:00000000<br>
[=C2=A0 =C2=A0 1.209505] ---[ end Kernel panic - not syncing: VFS: Unable t=
o mount root fs on unknown-block(0,255) ]---<br>
<br>
I enabled CONFIG_NETWORK_FILESYSTEMS, CONFIG_NFS_FS and CONFIG_ROOT_NFS in =
the kernel configuration, rebuilt the kernel and verified that the flash bo=
ot works fine.<br>
<br>
These are the commands that I ran to netboot<br>
<br>
ast# tftp 83000000 uImage<br>
ast# tftp 84000000 aspeed.dtb<br>
ast# setenv serverip 10.x.x.x<br>
ast# setenv bootargs root=3D/dev/nfs rw nfsroot=3D${serverip}:/data/nfs/tes=
t,nolock,tcp console=3DttyS4,115200n8 mem.devmem=3D1 ip=3D${ipaddr}:${serve=
rip}:${serverip}:255.0.0.0::eth0 nfsrootdebug<br>
ast# bootm 83000000 - 84000000<br>
<br>
I also used the fitImage directly instead of a separate uImage and DTB, and=
 ran into the same error. I tried enabling CPIO image builds by adding the =
following line in local.conf:<br>
<br>
IMAGE_FSTYPES +=3D &quot;cpio.${INITRAMFS_CTYPE}.u-boot&quot;<br></blockquo=
te><div><br></div><div>It seems like the rootfs can&#39;t be found. The fit=
Image based approach usually works well for me. Can you elaborate what you =
did with the fitImage based approach? I typically do this (on an AST2500) :=
</div><div><br></div><div>1) Add IMAGE_FSTYPES +=3D &quot;cpio.${INITRAMFS_=
CTYPE}.u-boot&quot; to the conf</div><div>2) Copy fitImage and obmc-phospho=
r-image-&lt;platform&gt;.cpio.lzma.u-boot to the tftp server.</div><div>3) =
Setup the tftp server and the BMC network<br></div><div>4) tftp 0x83000000 =
fitImage</div><div>5) tftp 0x93000000 initrd (in step 2 I had named the cpi=
o image as initrd on the tftp server). At this stage &#39;iminfo&#39; shoul=
d show what images have been loaded.<br></div><div>6) bootm 0x83000000 0x93=
000000</div><div><br></div><div>If you want to instead boot from NFS, then =
I see Yu Lei has some suggestions/questions for you.</div><div><br></div><d=
iv>Regards,</div><div>Deepak</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
However, if I use the generated CPIO image directly as the initramfs, then =
all I see is &quot;Starting kernel ...&quot; and no further output from the=
 system.<br>
<br>
Could you please suggest how I could go about debugging this? I&#39;ve foll=
owed all the netboot suggestions from these threads on this mailing list:\<=
br>
- <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-June/012054.ht=
ml" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/pipermail=
/openbmc/2018-June/012054.html</a><br>
- <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2015-October/000010=
.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/piperm=
ail/openbmc/2015-October/000010.html</a><br>
<br>
Thanks and regards<br>
Nirenjan Krishnan<br>
<br>
</blockquote></div></div>

--000000000000acbbc005b1b3aa66--
