Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2B295A36
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 10:25:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH0mY45HgzDqFJ
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 19:25:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pUcs/PAa; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH0ld2JwmzDqF5
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 19:24:40 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id w21so680677pfc.7
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 01:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Lh8lxM32QkEkuIveTpx/rUTPXEtJ4GmKMPsE6jyzgDI=;
 b=pUcs/PAaUqTvG3oRHVAmgg+r3E3HQHyXwUVfBVIMoOxJ/6zlOwRe9j+Ni3JOvcHM/b
 IYqHWsvERhZwjoG3w/HLc6dBP4L3c9uBFwYPKX4Ro5+ejWz15dnYv34ClIdXy/s+DUdt
 RgouhQNTsuobA0yH3pa7CFfgbvk3zHu/2J4cOCC1qALS5h+SucXnIugnY5eUxIAJHaYD
 MM9Vu4UrVrOKREuROQTAwViuNeMDWoi7xeEPsatlZdB4l3y9a2fkZBctUzsfea0HxTAZ
 ZUGrDdM+Qtew17ZUVds1Sy7CJBbG3hH4Kbxqoz2EeigVdjIWCdJnwkrkosc+tMPYtwmS
 APNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Lh8lxM32QkEkuIveTpx/rUTPXEtJ4GmKMPsE6jyzgDI=;
 b=r5RDpFB4zo37A6d0s5EOXiMsg8s85oSD6mdPX+Gyz7o0PQ0OkWpKhbo0AC7MapXT1e
 /Od6WVIhuBK/U+2eIMdkY+uCrf36sQA1P+YxsKS2sfrBs0FZlNFxcM8WKRYTr3mBmEL6
 z+mDIkP75B54EXKNKf0oQPCHdtak3u6WN90Xb0Ebx2tiIopMGh7U8YzUJglUD0ePjVLW
 2yQwnVJgsWdB4tItwg2GXuSboVynWAcWJ/rT4o0dpJoIs3a9DrR2eyqymG+D1lgGxUrZ
 +lozka1b5T9kwcKixOJQnAtcyd7WgaDki3I5wEyDxTD3WIefThgQQeRBe+QbJkbIBWAi
 ItcA==
X-Gm-Message-State: AOAM532JjSDhXMgIbwR/N/th84PznHZkmkyaNCA2w4aJyKtlNJ41+F2B
 tVJOX/BKaImu05PqdBtLNImTEQg5HzSi9Ec/40YAAUGDMq4=
X-Google-Smtp-Source: ABdhPJyGHaAAH7cORf5nqWcPkTHP3uON845FUWdxGJ4VGvqEyuPKCjz+0XLb/htGmd9gY0BdjyZ1EIVzmm2RxAxWo2s=
X-Received: by 2002:a63:e354:: with SMTP id o20mr1378871pgj.317.1603355077238; 
 Thu, 22 Oct 2020 01:24:37 -0700 (PDT)
MIME-Version: 1.0
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 22 Oct 2020 13:54:27 +0530
Message-ID: <CAD+gp9CHnvDk+sU05DhMpuOshST-cAx2LoU+kZJjjEHeKzztMA@mail.gmail.com>
Subject: openbmc:Error while running bitbake for raspberrypi-3
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000d3e42005b23e3192"
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

--000000000000d3e42005b23e3192
Content-Type: text/plain; charset="UTF-8"

Hi Team,

I am getting errors while running the bitbake for raspberrypi-3.
Following are the steps I have followed to run the bitbake:

   1. Clonned the latest code from the master branch for openbmc repo.
   2.TEMPLATECONF=meta-phosphor/conf . openbmc-env
   2. open the conf/local.conf file in the editor and update to add the
   raspberrypi3-64
   -MACHINE ??= "qemuarm"
   +MACHINE ??= "raspberrypi3-64"

4.open the conf/bblayers.conf file in the editor and add the following line
/home/basha/openbmc/meta-phosphor \

   - /home/basha/openbmc/meta-raspberrypi \


   1. bitbake obmc-phosphor-image

After the bitbake I am getting following errors:

|     /home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/files/
| DEBUG: Executing shell function do_kernel_metadata
| ERROR: Feature 'phosphor-gpio-keys' not found, this will cause
configuration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories
that may be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/home/basha/openbmc/build/tmp/work/raspberrypi3_64-openbmc-linux/linux-raspberrypi/1_5.4.69+gitAUTOINC+5d52d9eea9_31d364af25-r0/temp/run.do_kernel_metadata.118535'
failed with exit code 1:
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_5.4.bb:do_kernel_metadata)
failed with exit code '1'
Waiting for 4 running tasks to finish:


Also I have referred to the following issue "#2434
<https://github.com/openbmc/openbmc/issues/2434>" and added
KERNEL_FEATURES_remove = "phosphor-gpio-keys" to the local.conf file and
recompiled using the above steps again.
I did not get the above errors but the rpi-sdimg file was not generated in
the following path.

"build/tmp/deploy/images/raspberrypi3-64/obmc-phosphor-image-raspberrypi3-64-2020XXXXXXXXXX.rootfs.rpi-sdimg"

Please let me know if there are any additional steps to be followed to run
bitbake for raspberrypi-3 in order to generate the rpi-sdimg file.

Thanks & Regards,
Khader B Shaik

--000000000000d3e42005b23e3192
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"box-sizing:border-box;margin-bottom:16px;color=
:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;;font-size:14px;margin-top:0px">Hi Team,</p><p style=3D"box-s=
izing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font=
-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Ari=
al,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font=
-size:14px">I am getting errors while running the bitbake for raspberrypi-3=
.<br style=3D"box-sizing:border-box">Following are the steps I have followe=
d to run the bitbake:</p><ol style=3D"box-sizing:border-box;padding-left:2e=
m;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-=
system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&=
quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px"><li=
 style=3D"box-sizing:border-box">Clonned the latest code from the master br=
anch for openbmc repo.<br style=3D"box-sizing:border-box">2.TEMPLATECONF=3D=
meta-phosphor/conf . openbmc-env</li><li style=3D"box-sizing:border-box;mar=
gin-top:0.25em">open the conf/local.conf file in the editor and update to a=
dd the raspberrypi3-64<br style=3D"box-sizing:border-box">-MACHINE ??=3D &q=
uot;qemuarm&quot;<br style=3D"box-sizing:border-box">+MACHINE ??=3D &quot;r=
aspberrypi3-64&quot;</li></ol><p style=3D"box-sizing:border-box;margin-top:=
0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkM=
acSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">4.open the conf/=
bblayers.conf file in the editor and add the following line<br style=3D"box=
-sizing:border-box">/home/basha/openbmc/meta-phosphor \</p><ul style=3D"box=
-sizing:border-box;padding-left:2em;margin-top:0px;margin-bottom:16px;color=
:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&=
quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;;font-size:14px"><li style=3D"box-sizing:border-box">/home/ba=
sha/openbmc/meta-raspberrypi \</li></ul><ol start=3D"5" style=3D"box-sizing=
:border-box;padding-left:2em;margin-top:0px;margin-bottom:16px;color:rgb(36=
,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,H=
elvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;;font-size:14px"><li style=3D"box-sizing:border-box">bitbake obmc-ph=
osphor-image</li></ol><p style=3D"box-sizing:border-box;margin-top:0px;marg=
in-bottom:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystem=
Font,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">After the bitbake I am g=
etting following errors:</p><pre style=3D"box-sizing:border-box;font-family=
:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-s=
ize:11.9px;margin-top:0px;margin-bottom:16px;padding:16px;overflow:auto;lin=
e-height:1.45;border-radius:6px;color:rgb(36,41,46)"><code style=3D"box-siz=
ing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&qu=
ot;,Menlo,monospace;padding:0px;margin:0px;background:initial;border-radius=
:6px;word-break:normal;border:0px;display:inline;overflow:visible;line-heig=
ht:inherit">|     /home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux=
/files/
| DEBUG: Executing shell function do_kernel_metadata
| ERROR: Feature &#39;phosphor-gpio-keys&#39; not found, this will cause co=
nfiguration failures.
| ERROR: Check the SRC_URI for meta-data repositories or directories that m=
ay be missing
| ERROR: Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of &#39;/home/basha/openbmc/build/tmp/work/raspberrypi3_=
64-openbmc-linux/linux-raspberrypi/1_5.4.69+gitAUTOINC+5d52d9eea9_31d364af2=
5-r0/temp/run.do_kernel_metadata.118535&#39; failed with exit code 1:
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/basha/openbmc/meta-raspberrypi/recipes-kernel/linux/linu=
x-raspberrypi_5.4.bb:do_kernel_metadata) failed with exit code &#39;1&#39;
Waiting for 4 running tasks to finish:

</code></pre><p style=3D"box-sizing:border-box;margin-top:0px;margin-bottom=
:16px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;;font-size:14px">Also I have referred to the follo=
wing issue &quot;<a class=3D"gmail-issue-link gmail-js-issue-link" href=3D"=
https://github.com/openbmc/openbmc/issues/2434" style=3D"box-sizing:border-=
box;background-color:initial;text-decoration-line:none">#2434</a>&quot; and=
 added KERNEL_FEATURES_remove =3D &quot;phosphor-gpio-keys&quot; to the loc=
al.conf file and recompiled using the above steps again.<br style=3D"box-si=
zing:border-box">I did not get the above errors but the rpi-sdimg file was =
not generated in the following path.</p><p style=3D"box-sizing:border-box;m=
argin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-sys=
tem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quo=
t;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">&quot;=
build/tmp/deploy/images/raspberrypi3-64/obmc-phosphor-image-raspberrypi3-64=
-2020XXXXXXXXXX.rootfs.rpi-sdimg&quot;</p><p style=3D"box-sizing:border-box=
;margin-top:0px;margin-bottom:16px;color:rgb(36,41,46);font-family:-apple-s=
ystem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">Plea=
se let me know if there are any additional steps to be followed to run bitb=
ake for raspberrypi-3 in order to generate the rpi-sdimg file.</p><p style=
=3D"box-sizing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41=
,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helv=
etica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;;font-size:14px">Thanks &amp; Regards,<br style=3D"box-sizing:border-bo=
x">Khader B Shaik</p></div>

--000000000000d3e42005b23e3192--
