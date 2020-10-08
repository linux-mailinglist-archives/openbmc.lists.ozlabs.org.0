Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D2286E63
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 08:03:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6LHb2blwzDqTZ
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 17:03:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=velankanigroup.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=jdhanasekar@velankanigroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=velankanigroup.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=velankanigroup-com.20150623.gappssmtp.com
 header.i=@velankanigroup-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NXmYxytz; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6LGk6ZpMzDqRn
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 17:03:05 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id f21so4437644ljh.7
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=velankanigroup-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDXL+cw4z25dNr6Y6MssVbq3cl9hR/ew5xbGUN2whHw=;
 b=NXmYxytztxoYJn9xZDenbzqxgaaQjEV6HSNoW6/73ZD47v2p4gT3JV76wIX1zzJfP+
 Icv31afxfZiikjdGvwO+coEMV1Vcz1JbWWcITL9z8pFcXqIeUftxKgneiO+m4g3Ou5yn
 lsxagi2kY+vGFBS3+VrRNTMKfNj9wvSYIbWzskLSV1tzevQBvl0nnuqeGUysGYuVz/ns
 GD4jYG6wDsmEEHfeZVJb0N/ZuKLrildJ/15zPRAYp0YXDxzGvy6lG1hfV8DVduliJW64
 vBIXjWIf5cTlSF6z5pLUalURp62eVQJPnKiRQWnpIdCo2K3WcOeI2nWXCgr1Xo8dZuIp
 j81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDXL+cw4z25dNr6Y6MssVbq3cl9hR/ew5xbGUN2whHw=;
 b=cJz4733WZpRX7eCqWzY46t2v47ZzniwhBbnsxlYkuavY7X9+pRh/GEnXBdl//qG8j8
 ruM4D6raEschzV4sIuEUq26PGbSdj8z7+lD0Nf0fNTJu8FwUX9JUoKRpoBfsY4TF3RvG
 A7EyYSHlKtrteFFEqWrQYr7b28nASUiXTPM1ofrwcoY4D4jNmob662W7MqXmOFAuUDj/
 RwVJ0HD+2WmlOFiPaQGVJ04pWJA78PSxhms4SnGMNLIqKXtNYppjpw+QgEwReLeQK6TP
 2LO3p434K3BJtjoYU2yJPmA3lXYnnI8/9iaQnrEsgcKd9YjZ2C/8011zDyCy8prg9ELY
 JpQQ==
X-Gm-Message-State: AOAM53275UBUvRM70sBw60Bpu4LZTmROCJ83bPDxHdt6yR1O9WFmoRpp
 cO+VWCFQ56vmbhkAAAJak2sAyvFS8hPaengcHwTXKA==
X-Google-Smtp-Source: ABdhPJxXzfumSU2kINg6NwQvegXQXfN8a31M8H5PQdpFDNML9zcZpGj/wPBUH2+XSeugoCdGSJLTTlzcOBBr1iKjk+U=
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr2416434ljn.402.1602136977038; 
 Wed, 07 Oct 2020 23:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
 <c4ef651d-3589-1580-41dd-17959d00df11@amd.com>
 <CAOW9pY1hj4sDp_n2Uk87VEPicaoVZn5QuJcsCK_pS7o9ochb4w@mail.gmail.com>
 <ecc852ee-04ff-c27e-3fe0-fdeda6cb7f34@amd.com>
 <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
In-Reply-To: <CADVsX8-q58tiaPdthofa4rRgcQ6rS3qc9tEQXuzMgG6TpnbnCg@mail.gmail.com>
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
Date: Thu, 8 Oct 2020 11:32:21 +0530
Message-ID: <CAOW9pY0YcQK3+68te6B=YEjzRFxvxtXYoewKGUWd3Jh6rgjKDg@mail.gmail.com>
Subject: Re: build error in AMD Ethanolx
To: Anton Kachalov <rnouse@google.com>
Content-Type: multipart/alternative; boundary="00000000000065f99705b12295e1"
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
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000065f99705b12295e1
Content-Type: text/plain; charset="UTF-8"

Hi Supreeth,

I was able to build the AMD Ethanolx source successfully. I have executed
your mentioned commands only,


*. setup ethanolxbitbake obmc-phosphor-image  *

I built the code in normal user privilege, not root user.
Thanks for your support.

Do you have a linux DTS  for BMC of DaytonaCRB ?.

-Dhanasekar

On Thu, Oct 8, 2020 at 12:21 AM Anton Kachalov <rnouse@google.com> wrote:

> Hey,
>
> would you mind to find the *log.do_rootfs* file for
> obmc-phosphor-initramfs under build/tmp/work. This task has failed.
>
> For instance, on qemuarm target the path looks like this (for
> obmc-phosphor-*image* instead of obmc-phosphor-*initramfs*):
>
>
> build/tmp/work/qemuarm-openbmc-linux-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_rootfs
>
> On Wed, 7 Oct 2020 at 20:35, Supreeth Venkatesh <
> supreeth.venkatesh@amd.com> wrote:
>
>> On 10/7/20 10:11 AM, J Dhanasekar wrote:
>> > [CAUTION: External Email]
>> > Hi Supreeth,
>> >
>> > Thanks for the reply,
>> >
>> > I have attached the complete error log. Please view it.
>> >
>> > I have removed the build folder and created a new one twice. Still I am
>> seeing the same error.
>> This may be environment issue in your setup.
>> I am not seeing this error in my environment with the latest master.
>>
>> . setup ethanolx
>> bitbake bitbake obmc-phosphor-image
>>
>>
>> "WARNING: Host distribution "ubuntu-18.04" has not been validated with
>> this version of the build system; you may possibly experience unexpected
>> failures. It is recommended that you use a tested distribution.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           = "1.47.0"
>> BUILD_SYS            = "x86_64-linux"
>> NATIVELSBSTRING      = "ubuntu-18.04"
>> TARGET_SYS           = "arm-openbmc-linux-gnueabi"
>> MACHINE              = "ethanolx"
>> DISTRO               = "openbmc-phosphor"
>> DISTRO_VERSION       = "0.1.0"
>> TUNE_FEATURES        = "arm thumb arm1176jzs"
>> TARGET_FPU           = "soft"
>> meta
>> meta-oe
>> meta-networking
>> meta-perl
>> meta-python
>> meta-phosphor
>> meta-aspeed
>> meta-amd
>> meta-ethanolx        = "master:c3d88e4d9fcc08e1aae7cc9d0337c0261e996c64""
>>
>> ....
>> ....
>> ....
>>
>> NOTE: Running task 4241 of 4243
>> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
>> do_image_complete)
>> NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Started
>> NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Succeeded
>> NOTE: Running task 4242 of 4243
>> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
>> do_populate_lic_deploy)
>> NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy:
>> Started
>> NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy:
>> Succeeded
>> NOTE: Running noexec task 4243 of 4243
>> (/home/supvenka/work/openbmc_upstream/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:
>> do_build)
>> NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn't need to be
>> rerun and all succeeded."
>> >
>> > Thanks,
>> > Dhanasekar
>> >
>> > On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh <
>> supreeth.venkatesh@amd.com <mailto:supreeth.venkatesh@amd.com>> wrote:
>> >
>> >     On 10/7/20 5:44 AM, J Dhanasekar wrote:
>> >     > [CAUTION: External Email]
>> >     > Hi openBMC,
>> >     Hi Dhanasekar
>> >
>> >     >
>> >     > I am working to build BMC for AMD Ethanolx platform,
>> >     Nice to hear.
>> >     >
>> >     > After running  *bitbake u-boot-aspeed* and *bitbake
>> obmc-phosphor-image*,
>> >     > I am getting below error,
>> >     >
>> >     > ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall
>> intercept hook 'update_gio_module_cache' failed, details in
>> /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
>> >     > ERROR: Logfile of failure stored in:
>> /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
>> >     > ERROR: Task
>> (/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs)
>> failed with exit code '1'
>> >     >
>> >     Can you send me the complete build logs?
>> >
>> >     > Please help me to fix the error,
>> >     rm the build folder and retry once.
>> >     I will build it once today as well and confirm. It may not been
>> tested with latest upstream changes.
>> >
>> >     >
>> >     > Thanks,
>> >     > Dhanasekar,
>> >
>>
>

--00000000000065f99705b12295e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"verdana, sans-serif">Hi Supreeth,</font><div=
><font face=3D"verdana, sans-serif"><br></font></div><div><font face=3D"ver=
dana, sans-serif">I was able to build the AMD Ethanolx source successfully.=
 I have executed your mentioned commands only,</font></div><div><font face=
=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verdana, sans-=
serif"><b>. setup ethanolx<br>bitbake obmc-phosphor-image=C2=A0=C2=A0</b><b=
r></font></div><div><font face=3D"verdana, sans-serif"><br></font></div><di=
v><font face=3D"verdana, sans-serif">I built the code in normal=C2=A0user p=
rivilege, not root user.=C2=A0</font></div><div><font face=3D"verdana, sans=
-serif">Thanks for your support.</font></div><div><font face=3D"verdana, sa=
ns-serif"><br></font></div><div><font face=3D"verdana, sans-serif">Do you h=
ave a linux DTS=C2=A0 for BMC of DaytonaCRB ?.</font></div><div><font face=
=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verdana, sans-=
serif">-Dhanasekar</font></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Oct 8, 2020 at 12:21 AM Anton Kachal=
ov &lt;<a href=3D"mailto:rnouse@google.com">rnouse@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">Hey,<div><br></div><div>would you mind to find the=C2=A0<b>log.do_rootfs=
</b> file for obmc-phosphor-initramfs under build/tmp/work. This task has f=
ailed.</div><div><br></div><div>For instance, on qemuarm target the path lo=
oks like this (for obmc-phosphor-<b>image</b> instead of obmc-phosphor-<b>i=
nitramfs</b>):</div><div><br></div><div>build/tmp/work/qemuarm-openbmc-linu=
x-gnueabi/obmc-phosphor-image/1.0-r0/temp/log.do_rootfs<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 7 =
Oct 2020 at 20:35, Supreeth Venkatesh &lt;<a href=3D"mailto:supreeth.venkat=
esh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/7/20 10:11 A=
M, J Dhanasekar wrote:<br>
&gt; [CAUTION: External Email]<br>
&gt; Hi Supreeth,<br>
&gt; <br>
&gt; Thanks for the reply,<br>
&gt; <br>
&gt; I have attached the complete error log. Please view it.=C2=A0<br>
&gt; <br>
&gt; I have removed the build folder and created a new one twice. Still I a=
m seeing the same error.<br>
This may be environment issue in your setup.<br>
I am not seeing this error in my environment with the latest master.<br>
<br>
. setup ethanolx<br>
bitbake bitbake obmc-phosphor-image<br>
<br>
<br>
&quot;WARNING: Host distribution &quot;ubuntu-18.04&quot; has not been vali=
dated with this version of the build system; you may possibly experience un=
expected failures. It is recommended that you use a tested distribution.<br=
>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.47.0&quot;<b=
r>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;ubuntu-18.04&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-openbmc-li=
nux-gnueabi&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ethanolx&=
quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;open=
bmc-phosphor&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;0.1.0&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm thumb arm1176jzs&quo=
t;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;soft&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-networking=C2=A0 =C2=A0 =C2=A0 <br>
meta-perl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-phosphor=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-aspeed=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-amd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-ethanolx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:c3d88e4d9fcc08e1a=
ae7cc9d0337c0261e996c64&quot;&quot;<br>
<br>
....<br>
....<br>
....<br>
<br>
NOTE: Running task 4241 of 4243 (/home/supvenka/work/openbmc_upstream/meta-=
phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_image_complete)<=
br>
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Started<br=
>
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_image_complete: Succeeded<=
br>
NOTE: Running task 4242 of 4243 (/home/supvenka/work/openbmc_upstream/meta-=
phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_populate_lic_dep=
loy)<br>
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Start=
ed<br>
NOTE: recipe obmc-phosphor-image-1.0-r0: task do_populate_lic_deploy: Succe=
eded<br>
NOTE: Running noexec task 4243 of 4243 (/home/supvenka/work/openbmc_upstrea=
m/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb:do_build)<br=
>
NOTE: Tasks Summary: Attempted 4243 tasks of which 2 didn&#39;t need to be =
rerun and all succeeded.&quot;<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Dhanasekar<br>
&gt; <br>
&gt; On Wed, Oct 7, 2020 at 8:08 PM Supreeth Venkatesh &lt;<a href=3D"mailt=
o:supreeth.venkatesh@amd.com" target=3D"_blank">supreeth.venkatesh@amd.com<=
/a> &lt;mailto:<a href=3D"mailto:supreeth.venkatesh@amd.com" target=3D"_bla=
nk">supreeth.venkatesh@amd.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 10/7/20 5:44 AM, J Dhanasekar wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [CAUTION: External Email]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi openBMC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Dhanasekar<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am working to build BMC for AMD Ethanolx pla=
tform,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Nice to hear.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; After running=C2=A0 *bitbake u-boot-aspeed* an=
d *bitbake obmc-phosphor-image*,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am getting below error,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootf=
s: The postinstall intercept hook &#39;update_gio_module_cache&#39; failed,=
 details in /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-o=
penbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: Logfile of failure stored in: /home/use=
r/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/=
obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ERROR: Task (/home/user/dhanasekar/BMC/AMD/ope=
nbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_ro=
otfs) failed with exit code &#39;1&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Can you send me the complete build logs?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please help me to fix the error,<br>
&gt;=C2=A0 =C2=A0 =C2=A0rm the build folder and retry once.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I will build it once today as well and confirm. It =
may not been tested with latest upstream changes.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Dhanasekar,<br>
&gt; <br>
</blockquote></div>
</blockquote></div>

--00000000000065f99705b12295e1--
