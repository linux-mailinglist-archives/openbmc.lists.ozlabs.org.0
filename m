Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D037D2889DC
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 15:31:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C789X46ZYzDqZp
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 00:31:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=velankanigroup.com
 (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=jdhanasekar@velankanigroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=velankanigroup.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=velankanigroup-com.20150623.gappssmtp.com
 header.i=@velankanigroup-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ycFMUpm1; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C787f1HkgzDqZp
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 00:29:48 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id d24so10690106lfa.8
 for <openbmc@lists.ozlabs.org>; Fri, 09 Oct 2020 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=velankanigroup-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rZKIBIy/Q3DCzw1a7mI62Gqk2KPq2nuYr13nVafvAA=;
 b=ycFMUpm1wSESK40FE9MY+G9SOTi0R5iuIZbBEkFkG/4vA/jyvQfQvBdW6NecTnBGB1
 Hp4xV/sia3nJfVaB8vMrvoh4kwcMiqR0OGX+KA/Asn7vHFbq5Oyp2PvuM9rXXz0YXHJk
 LRhiYXjFtL4rDKF0CAJCh4erQJlsBrTNemF8131Jr1BGmkqIOk3veLNjrITlBQKJCR+7
 yrU+7veg3U+qmRiVLauD+ZKKZBsVK/AywYYSkwLbwyJ6hmRWCh5B6akDuyo4zxEW1RyX
 27OsppWMgDZAAmq0ykjakX8Hq9OJuZ98TdIbBEggFCNd+0sMtsrg90V4ZLVKgowFV5m7
 O9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rZKIBIy/Q3DCzw1a7mI62Gqk2KPq2nuYr13nVafvAA=;
 b=NFc80n9SbP7U65Iv9/IRcKynYasJ7x8WdKhf31DvNmLGmj12ORBOcfRsB2IO4mslcm
 sjuzNNwZqxvWNViGFsSO9m2dzwkvMV9HbvtANPn64y9zSMBENQ2Xc+nPbwZigMAD5mIe
 N2a/f+6IRjLOQng53ABSRP6ftIuwO8D/PTOOcC6Fa+nWn2VzRKAghVkv4g8E508vgdLW
 GdTjLZmTxPzpBU0bEd9bMZKuafEJBF3KcRuCZijJ7wx1IHs2s0CjYb8vHpN8jPtZwQA/
 S6OABEas0avFg3DVPW3+YdJ+SmxvIFMC8HYIhwpUMlWE2kD3o3RQZsLTlODER4PEJn/k
 CCbQ==
X-Gm-Message-State: AOAM533vVw0r1CA03qBVhdCESmA5MA4bSTuUWmbsZ5smQzjGOrhGGY2q
 rg7WvGKv1rC6bXyZuMthQYWEofV63HNKzfdJs6LXGw==
X-Google-Smtp-Source: ABdhPJymTPh2IDxUV4ReArLm/MLdZQg52apyb+TyOrxFNMqIJeuzfPzzJVtkWL6CyW1x1OJHE1Gm9XgCcm64T9fn3hA=
X-Received: by 2002:ac2:4105:: with SMTP id b5mr4550747lfi.282.1602250182345; 
 Fri, 09 Oct 2020 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
 <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
 <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
 <CAOW9pY1YuXbA=nq+4U5ZLLjqELxZv-6ytxPYTFh1e96wD7faRA@mail.gmail.com>
 <CAOW9pY1JUmJj9vJ1XJVGjYfyyeQn85o7=7kxmpRsRLv0WdpUeQ@mail.gmail.com>
 <SN1PR12MB25422E6E38D7E09D0C35793596080@SN1PR12MB2542.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB25422E6E38D7E09D0C35793596080@SN1PR12MB2542.namprd12.prod.outlook.com>
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
Date: Fri, 9 Oct 2020 18:59:05 +0530
Message-ID: <CAOW9pY1WMKjq4V55szP8A56MMZY2QotswnuEibK3sVt8SdjvCw@mail.gmail.com>
Subject: Re: build error in AMD Ethanolx
To: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
Content-Type: multipart/related; boundary="000000000000f66d6405b13cf097"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ramakrishnan Kumaraswamy <ramakrishnan@bydesignindia.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f66d6405b13cf097
Content-Type: multipart/alternative; boundary="000000000000f66d6205b13cf096"

--000000000000f66d6205b13cf096
Content-Type: text/plain; charset="UTF-8"

Hi Supreeth,

Nice to hear from you.
Thanks for the info.

-Dhanasekar

On Fri, Oct 9, 2020 at 6:20 PM Venkatesh, Supreeth <
Supreeth.Venkatesh@amd.com> wrote:

> [AMD Public Use]
>
>
>
> Hi Dhanasekar,
>
>
>
> Thanks for helping out.
>
> We will make DT for Daytona CRB available latest by early next month  or
> end of this month.
>
>
>
> Thanks,
>
> *Supreeth Venkatesh*
>
> System Manageability Architect  |*  AMD*
> Server Software
>
>
>
> *From:* J Dhanasekar <jdhanasekar@velankanigroup.com>
> *Sent:* Friday, October 9, 2020 12:14 AM
> *To:* Venkatesh, Supreeth <Supreeth.Venkatesh@amd.com>
> *Cc:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Ramakrishnan
> Kumaraswamy <ramakrishnan@bydesignindia.net>
> *Subject:* Re: build error in AMD Ethanolx
>
>
>
> [CAUTION: External Email]
>
> Hi Supreeth,
>
>
>
> If  the DTSs file for Daytona CRB is available, I will work parallel to
> enable openBMC for Daytona CRB.
>
>
>
>
>
> Thanks,
>
> Dhanasekar
>
>
>
> On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar <
> jdhanasekar@velankanigroup.com> wrote:
>
> Supreeth,
>
>
>
> Thanks for the info.
>
> Will OpenBMC on Daytona available end of this year?.
>
>
>
> Thanks,
>
> Dhanasekar
>
>
>
> On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh <
> supreeth.venkatesh@amd.com> wrote:
>
> On 10/8/20 1:02 AM, J Dhanasekar wrote:
> > [CAUTION: External Email]
> > Hi Supreeth,
> >
> > I was able to build the AMD Ethanolx source successfully. I have
> executed your mentioned commands only,
> >
> > *. setup ethanolx
> > bitbake obmc-phosphor-image  *
> >
> > I built the code in normal user privilege, not root user.
> > Thanks for your support.
> Thanks for letting me know.
> >
> > Do you have a linux DTS  for BMC of DaytonaCRB ?.
> Unfortunately, we are not supporting Daytona CRB yet, but we are working
> towards enabling OpenBMC on Daytona soon. Stay tuned.
>
> >
> > -Dhanasekar
> >
> > On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov <rnouse@google.com
> <mailto:rnouse@google.com>> wrote:
> >
> >     Hey,
> >
> >     would you mind to find the *log.do_rootfs* file for
> obmc-phosphor-initramfs under build/tmp/work. This task has failed.
> >
> >     For instance, on qemuarm target the path looks like this (for
> obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):
> >
> >
>  build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_rootfs
> >
> >     On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh <
> supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>> wrote:
> >
> >         On 10/7/20 10:11 AM, J Dhanasekar wrote:
> >         > [CAUTION: External Email]
> >         > Hi Supreeth,
> >         >
> >         > Thanks for the reply,
> >         >
> >         > I have attached the complete error log. Please view it.
> >         >
> >         > I have removed the build folder and created a new one twice.
> Still I am seeing the same error.
> >         This may be environment issue in your setup.
> >         I am not seeing this error in my environment with the latest
> master.
> >
> >         . setup ethanolx
> >         bitbake bitbake obmc-phosphor-image
> >
> >
> >         "WARNING: Host distribution "ubuntu-18.04" has not been
> validated with this version of the build system; you may possibly
> experience unexpected failures. It is recommended that you use a tested
> distribution.
> >         NOTE: Resolving any missing task queue dependencies
> >
> >         Build Configuration:
> >         BB_VERSION           = "1.47.0"
> >         BUILD_SYS            = "x86_64-linux"
> >         NATIVELSBSTRING      = "ubuntu-18.04"
> >         TARGET_SYS           = "arm-openbmc-linux-gnueabi"
> >         MACHINE              = "ethanolx"
> >         DISTRO               = "openbmc-phosphor"
> >         DISTRO_VERSION       = "0.1.0"
> >         TUNE_FEATURES        = "arm thumb arm1176jzs"
> >         TARGET_FPU           = "soft"
> >         meta
> >         meta-oe
> >         meta-networking
> >         meta-perl
> >         meta-python
> >         meta-phosphor
> >         meta-aspeed
> >         meta-amd
> >         meta-ethanolx        =
> "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""
> >
> >         ....
> >         ....
> >         ....
> >
> >         NOTE: Running task 4241 of 4243
> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_image_complete)
> >         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete:
> Started
> >         NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete:
> Succeeded
> >         NOTE: Running task 4242 of 4243
> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_populate_lic_deploy)
> >         NOTE: recipe obmc-phosphor-image-1.0-r0: task
> do_populate_lic_deploy: Started
> >         NOTE: recipe obmc-phosphor-image-1.0-r0: task
> do_populate_lic_deploy: Succeeded
> >         NOTE: Running noexec task 4243 of 4243
> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
> do_build)
> >         NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn't need
> to be rerun and all succeeded."
> >         >
> >         > Thanks,
> >         > Dhanasekar
> >         >
> >         > On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh <
> supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com> <mailto:
> supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>>> wrote:
> >         >
> >         >     On 10/7/20 5:44 AM, J Dhanasekar wrote:
> >         >     > [CAUTION: External Email]
> >         >     > Hi openBMC,
> >         >     Hi Dhanasekar
> >         >
> >         >     >
> >         >     > I am working to build BMC for AMD Ethanolx platform,
> >         >     Nice to hear.
> >         >     >
> >         >     > After running  *bitbake u-boot-aspeed* and *bitbake
> obmc-phosphor-image*,
> >         >     > I am getting below error,
> >         >     >
> >         >     > ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The
> postinstall intercept hook 'update_gio_module_cache' failed, details in
> /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
> >         >     > ERROR: Logfile of failure stored in:
> /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
> >         >     > ERROR: Task
> (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs)
> failed with exit code '1'
> >         >     >
> >         >     Can you send me the complete build logs?
> >         >
> >         >     > Please help me to fix the error,
> >         >     rm the build folder and retry once.
> >         >     I will build it once today as well and confirm. It may not
> been tested with latest upstream changes.
> >         >
> >         >     >
> >         >     > Thanks,
> >         >     > Dhanasekar,
> >         >
> >
>
>

--000000000000f66d6205b13cf096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Supreeth,<div><br></div><div>Nice=C2=A0to hear from you=
.=C2=A0</div><div>Thanks for the info.=C2=A0</div><div><br></div><div>-Dhan=
asekar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Oct 9, 2020 at 6:20 PM Venkatesh, Supreeth &lt;<a href=
=3D"mailto:Supreeth.Venkatesh@amd.com">Supreeth.Venkatesh@amd.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-4805178235532057237WordSection1">
<p class=3D"gmail-m_-4805178235532057237msipheader251902e5" style=3D"margin=
:0in"><span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(=
49,113,0)">[AMD Public Use]</span><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi Dhanasekar,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks for helping out.<u></u><u></u></p>
<p class=3D"MsoNormal">We will make DT for Daytona CRB available latest by =
early next month =C2=A0or end of this month.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif;color:black">Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:Arial,s=
ans-serif;color:black">Supreeth Venkatesh</span></b><span style=3D"font-siz=
e:10pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Arial,sans-=
serif;color:black">System Manageability Architect=C2=A0=C2=A0|<b>=C2=A0=C2=
=A0AMD</b><br>
Server Software<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Arial,sans-serif;color:bl=
ack"><img width=3D"150" height=3D"35" style=3D"width: 1.5625in; height: 0.3=
645in;" id=3D"gmail-m_-4805178235532057237Picture_x0020_11" src=3D"cid:1750=
d8c10564cff311"></span><span style=3D"font-family:Arial,sans-serif;color:bl=
ack"><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> J Dhanasekar &lt;<a href=3D"mailto:jdha=
nasekar@velankanigroup.com" target=3D"_blank">jdhanasekar@velankanigroup.co=
m</a>&gt; <br>
<b>Sent:</b> Friday, October 9, 2020 12:14 AM<br>
<b>To:</b> Venkatesh, Supreeth &lt;<a href=3D"mailto:Supreeth.Venkatesh@amd=
.com" target=3D"_blank">Supreeth.Venkatesh@amd.com</a>&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;; Ramakrishnan Kumaraswa=
my &lt;<a href=3D"mailto:ramakrishnan@bydesignindia.net" target=3D"_blank">=
ramakrishnan@bydesignindia.net</a>&gt;<br>
<b>Subject:</b> Re: build error in AMD Ethanolx<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">[CAUTION: External Email] <u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Supreeth, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">If=C2=A0 the DTSs file for Daytona CRB is available,=
 I will work parallel to enable openBMC for Daytona CRB.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Dhanasekar<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Oct 8, 2020 at 7:51 PM J Dhanasekar &lt;<a h=
ref=3D"mailto:jdhanasekar@velankanigroup.com" target=3D"_blank">jdhanasekar=
@velankanigroup.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<p class=3D"MsoNormal">Supreeth, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for the info.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Will OpenBMC on Daytona=C2=A0available=C2=A0end of t=
his year?.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Dhanasekar<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh &l=
t;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.=
venkatesh@amd.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<p class=3D"MsoNormal">On 10/8/20 1:02 AM, J Dhanasekar wrote:<br>
&gt; [CAUTION: External Email]<br>
&gt; Hi Supreeth,<br>
&gt; <br>
&gt; I was able to build the AMD Ethanolx source successfully. I have execu=
ted your mentioned commands only,<br>
&gt; <br>
&gt; *. setup ethanolx<br>
&gt; bitbake obmc-phosphor-image=C2=A0=C2=A0*<br>
&gt; <br>
&gt; I built the code in normal=C2=A0user privilege, not root user.=C2=A0<b=
r>
&gt; Thanks for your support.<br>
Thanks for letting me know.<br>
&gt; <br>
&gt; Do you have a linux DTS=C2=A0 for BMC of DaytonaCRB ?.<br>
Unfortunately, we are not supporting Daytona CRB yet, but we are working to=
wards enabling OpenBMC on Daytona soon. Stay tuned.<br>
<br>
&gt; <br>
&gt; -Dhanasekar<br>
&gt; <br>
&gt; On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov &lt;<a href=3D"mailto:r=
nouse@google.com" target=3D"_blank">rnouse@google.com</a> &lt;mailto:<a hre=
f=3D"mailto:rnouse@google.com" target=3D"_blank">rnouse@google.com</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hey,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0would you mind to find the=C2=A0*log.do_rootfs* fil=
e for obmc-phosphor-initramfs under build/tmp/work. This task has failed.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For instance, on qemuarm target the path looks like=
 this (for obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-p=
hosphor-image/1.0-r0/temp/log.do_rootfs<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh &lt=
;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.v=
enkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.co=
m" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 10/7/20 10:11 AM, J Dhanasekar wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [CAUTION: External Email]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Supreeth,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for the reply,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have attached the complete err=
or log. Please view it.=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have removed the build folder =
and created a new one twice. Still I am seeing the same error.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This may be environment issue in your=
 setup.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I am not seeing this error in my envi=
ronment with the latest master.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. setup ethanolx<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake bitbake obmc-phosphor-image<b=
r>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;WARNING: Host distribution &quo=
t;ubuntu-18.04&quot; has not been validated with this version of the build =
system; you may possibly experience unexpected failures. It is recommended =
that you use a tested distribution.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Resolving any missing task queu=
e dependencies<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build Configuration:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;1.47.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =
=3D &quot;ubuntu-18.04&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;arm-openbmc-linux-gnueabi&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;ethanolx&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;openbmc-phosphor&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;0.1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;arm thumb arm1176jzs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;soft&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-networking=C2=A0 =C2=A0 =C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-python=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-phosphor=C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-aspeed=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-amd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta-ethanolx=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64&quot;&quot;<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running task 4241 of 4243 (/hom=
e/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc=
-phosphor-image.bb:do_image_complete)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_image_complete: Started<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_image_complete: Succeeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running task 4242 of 4243 (/hom=
e/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc=
-phosphor-image.bb:do_populate_lic_deploy)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_populate_lic_deploy: Started<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: recipe obmc-phosphor-image-1.0-=
r0: task do_populate_lic_deploy: Succeeded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Running noexec task 4243 of 424=
3 (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/imag=
es/obmc-phosphor-image.bb:do_build)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Tasks Summary: Attempted 4243 t=
asks of which 2 didn&#39;t need to be rerun and all succeeded.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Dhanasekar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Wed, Oct 7, 2020 at 8:08 PM S=
upreeth Venkatesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com" target=
=3D"_blank">supreeth.venkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:sup=
reeth.venkatesh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a>&g=
t; &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blan=
k">supreeth.venkatesh@amd.com</a>
 &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_blank"=
>supreeth.venkatesh@amd.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 10/7/20 5:=
44 AM, J Dhanasekar wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; [CAUTION=
: External Email]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi openB=
MC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Dhanasekar=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am wor=
king to build BMC for AMD Ethanolx platform,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Nice to hear.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; After ru=
nning=C2=A0 *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am get=
ting below error,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: o=
bmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept hook &#3=
9;update_gio_module_cache&#39; failed, details in /home/user/dhanasekar/BMC=
/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-in=
itramfs/1.0-r0/temp/log.do_rootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: L=
ogfile of failure stored in: /home/user/dhanasekar/BMC/AMD/openbmc/build/tm=
p/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/l=
og.do_rootfs.14182<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: T=
ask (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/i=
mages/obmc-phosphor-initramfs.bb:do_rootfs) failed with exit code &#39;1&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Can you send =
me the complete build logs?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please h=
elp me to fix the error,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0rm the build =
folder and retry once.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I will build =
it once today as well and confirm. It may not been tested with latest upstr=
eam changes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Dhanasek=
ar,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <u></u><u></u></p>
</blockquote>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000f66d6205b13cf096--

--000000000000f66d6405b13cf097
Content-Type: image/png; name="image001.png"
Content-Disposition: inline; filename="image001.png"
Content-Transfer-Encoding: base64
Content-ID: <1750d8c10564cff311>
X-Attachment-Id: 1750d8c10564cff311

iVBORw0KGgoAAAANSUhEUgAAAJYAAAAjCAYAAAB2BvMkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA0xpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2
MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6Njg2Njg2MTAwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Njg2Njg2MEYwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiPiA8
eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9w
OmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMxYiIgc3RSZWY6ZG9jdW1lbnRJRD0i
YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMx
YiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0
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
PP9xuG0AAAAASUVORK5CYII=
--000000000000f66d6405b13cf097--
