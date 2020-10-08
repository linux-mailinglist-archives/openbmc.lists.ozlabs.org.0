Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1362875F2
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 16:23:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6YND6Z8gzDqX0
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 01:23:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=velankanigroup.com
 (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=jdhanasekar@velankanigroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=velankanigroup.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=velankanigroup-com.20150623.gappssmtp.com
 header.i=@velankanigroup-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DbvqLqLH; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6YLc1CjczDqT9
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 01:22:14 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id b1so3307992lfp.11
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=velankanigroup-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LnWwkblnfQlh9GQK4TrQ94KC6FfREFkUEM7shGMBXdU=;
 b=DbvqLqLH/7NHo3h6pLFVkX6oe14efPd6wg0QkcBsh3Z/BqB0fUZ7fWYoSwRKI/rAMu
 BgRm+XI2FfEaWtYkLu5oQaQipQuYYApGUTrOZuqm7phbFXPiG3Wn9ppIUFmBBKoqimrG
 ise9DEmVGlVTK2+Md1tHQUC2kzA7o2tekorn8A/uJUfFFKDm8hzm61o3vKtWoiVOT8Mv
 3z/TFY349p669MRXs/WKlb0nQehqw5i9sd3ltdH+klgXXGoW1jBwxm+LFD+Gz1mYEgaY
 8UT+L6gCXIFSLLhHoQjBkdHf6KkTu2UwcFxHe2wHkCTIYSCyMtobT+s6y0G13g34XIpA
 2ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LnWwkblnfQlh9GQK4TrQ94KC6FfREFkUEM7shGMBXdU=;
 b=RkaMl4LgoXMl+b+O3FYTnZlX78vKm5naR7Etlk95RPpIYURYIYr9S/qVlm5vtRTNK8
 xloiYkKHB7t2NYIP9u7FJKQis4IVOOK4qHUkCadccWvBp6fy3DeEfJtr9i3vQw8BNBmt
 4uZEGfSSt+Zlo0G1XyOM81UpW5z3x5iGZTZCt8OlVuJadbPKwNr3hrzHrbRZ+Ku8T6z2
 RuZkWxKFaIYvY3H5qO9OdG5pnX1fN0itynb4a3DpXSHNB7dY1s4ZrWfPVdgP2y8YieA9
 W6MM502nyhIhBwDmT1amYxiJzLXc+Mm0D8ZuC1fnoESlO3Ph03Iuo0WXG5ePPeiiNxmF
 TaTw==
X-Gm-Message-State: AOAM532+H0pfHNFbPYGR2cFftS2zx6r1Xoz2di1AG9kBdSFQ2HTH02Go
 WjslYU4nMkcMRWN74pV/ot3VeyzSFLNM5LWGsjGl1w==
X-Google-Smtp-Source: ABdhPJz1XEdh0BoN1oq4DkJOodFKjswUDSqxGM5xU+ChMXI1QDxiZ6JxYFNFP5hFF8EacUbrnIqUgvmdIq3rJoODRqM=
X-Received: by 2002:a19:2355:: with SMTP id j82mr2416486lfj.36.1602166929213; 
 Thu, 08 Oct 2020 07:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
 <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
 <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
In-Reply-To: <7186ff22-3515-fe72-e2fd-dbd8022e31b9@amd.com>
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
Date: Thu, 8 Oct 2020 19:51:33 +0530
Message-ID: <CAOW9pY1YuXbA=nq+4U5ZLLjqELxZv-6ytxPYTFh1e96wD7faRA@mail.gmail.com>
Subject: Re: build error in AMD Ethanolx
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Content-Type: multipart/alternative; boundary="000000000000afe03b05b1298e5d"
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
 Anton Kachalov <rnouse@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000afe03b05b1298e5d
Content-Type: text/plain; charset="UTF-8"

Supreeth,

Thanks for the info.
Will OpenBMC on Daytona available end of this year?.

Thanks,
Dhanasekar

On Thu, Oct 8, 2020 at 7:31 PM Supreeth Venkatesh <
supreeth.venkatesh@amd.com> wrote:

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

--000000000000afe03b05b1298e5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Supreeth,<div><br></div><div>Thanks for the info.</div><di=
v>Will OpenBMC on Daytona=C2=A0available=C2=A0end of this year?.</div><div>=
<br></div><div>Thanks,</div><div>Dhanasekar</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 8, 2020 at 7:3=
1 PM Supreeth Venkatesh &lt;<a href=3D"mailto:supreeth.venkatesh@amd.com">s=
upreeth.venkatesh@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 10/8/20 1:02 AM, J Dhanasekar wrote:<br>
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
k">supreeth.venkatesh@amd.com</a> &lt;mailto:<a href=3D"mailto:supreeth.ven=
katesh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt;&gt;&gt=
; wrote:<br>
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
&gt; <br>
</blockquote></div>

--000000000000afe03b05b1298e5d--
