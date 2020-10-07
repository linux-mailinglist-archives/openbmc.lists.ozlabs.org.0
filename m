Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D0285D1D
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 12:46:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5rc85BHXzDqMw
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 21:46:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=velankanigroup.com
 (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=jdhanasekar@velankanigroup.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=velankanigroup.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=velankanigroup-com.20150623.gappssmtp.com
 header.i=@velankanigroup-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=E8WMIiLe; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5rb04BLhzDqLJ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 21:45:27 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id d24so1715573lfa.8
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=velankanigroup-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=0W5AJ2cTlxnXu5ut6MiIt6BE+++IGTyP4AWZnkvyp0w=;
 b=E8WMIiLe6QHSO4cnJFjtl557VqIACMt3HhObJzvaciZ9ds59qqKrsGmX6IpNM03YWh
 Rxn2bLEowiPskcz8YLxT32P/eOCZHPxE/bU3NU+p9/QKZ3SYQMSL9DgWOBx25SZq5mjZ
 WSrQ9eaUdnZFaKPMujq42ogQq3KNrcygxGuMuQGz+iXPxGRsPLX2MaL8VjeBWjc8YULf
 csyStbcNcq2ARiyRFuBksDTMp8tTv8geRnUm9Lm973gt9A0PX+orFX4KSu/RODkftBTB
 LX02hj+olYgkgldcYsCl7biTbV5ms47YAzpkMhI49yIUUpTQ3pO3dJY21DUbRw4YLoWb
 CGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0W5AJ2cTlxnXu5ut6MiIt6BE+++IGTyP4AWZnkvyp0w=;
 b=rHGVJRx/ZkjRohWSp5HWXjtOufspWMjvo4BD+OhVw0mIQq6cH9Ckju1UgZV6NsTC39
 GKhM6i+tJ5pOn8b4vcBFZVuOAczF8nH2r/sTdIlm/TIXPTfThjmH/Wz8xPDgyz++9ecZ
 821oRrPnCEFqIw8DuU+Tv2np5QSgEhbznMoc725zS2qMDcdGG2jG3sXjU4cG5zQMo+pf
 /Zm9pN3G5LLxtzV+CFhQlyMtmGDdGZ1I6kKzihzcZTFqCwDW3C46ly76HUcj5tN8MJkx
 Mg/JjGxk0IGEwoISmevRmbNvHMcoUh9i8Wt6NEAUl2CXgQamPzNKCDpX5x27FXn1ciQO
 eQjg==
X-Gm-Message-State: AOAM530SZz//pBvrO0L9e6dA2rI6l8xDih+XIgLkv1Iey+nvpTCmdyBy
 JTlat0Q+bSuhnwppvOd9hPpqtWcevkItpS6hN1iPkS92TKuwvEg5
X-Google-Smtp-Source: ABdhPJy83iIEyU+ZjPnafZqZRXiWpvok/GPFQCOKqSsbJt5i2aS5CLQLl+H46Bzoo5cGqP3u9JsbjZErVhoAwjuxOoI=
X-Received: by 2002:ac2:418c:: with SMTP id z12mr802121lfh.231.1602067522656; 
 Wed, 07 Oct 2020 03:45:22 -0700 (PDT)
MIME-Version: 1.0
From: J Dhanasekar <jdhanasekar@velankanigroup.com>
Date: Wed, 7 Oct 2020 16:14:46 +0530
Message-ID: <CAOW9pY0o7R4YSYX1WrOUQx-BJ0SG0BLs+NBCoHtgDOndXf4+Aw@mail.gmail.com>
Subject: build error in AMD Ethanolx
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000098305405b1126906"
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

--00000000000098305405b1126906
Content-Type: text/plain; charset="UTF-8"

Hi openBMC,

I am working to build BMC for AMD Ethanolx platform,

After running  *bitbake u-boot-aspeed* and *bitbake obmc-phosphor-image*,
I am getting below error,

ERROR: obmc-phosphor-initramfs-1.0-r0 do_rootfs: The postinstall intercept
hook 'update_gio_module_cache' failed, details in
/home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs
ERROR: Logfile of failure stored in:
/home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do_rootfs.14182
ERROR: Task
(/home/user/dhanasekar/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initramfs.bb:do_rootfs)
failed with exit code '1'

Please help me to fix the error,

Thanks,
Dhanasekar,

--00000000000098305405b1126906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"verdana, sans-serif">Hi openBMC,</font>=
</div><div><font face=3D"verdana, sans-serif"><br></font></div><div><font f=
ace=3D"verdana, sans-serif">I am working to build BMC for AMD Ethanolx plat=
form,=C2=A0</font></div><div><font face=3D"verdana, sans-serif"><br></font>=
</div><div><font face=3D"verdana, sans-serif">After running=C2=A0 <b>bitbak=
e u-boot-aspeed</b> and <b>bitbake obmc-phosphor-image</b>,</font></div><di=
v><font face=3D"verdana, sans-serif">I am getting below error,</font></div>=
<div><font face=3D"verdana, sans-serif"><br></font></div><font face=3D"verd=
ana, sans-serif"><font color=3D"#ff0000">ERROR: obmc-phosphor-initramfs-1.0=
-r0 do_rootfs: The postinstall intercept hook &#39;update_gio_module_cache&=
#39; failed, details in /home/user/dhanasekar/BMC/AMD/openbmc/build/tmp/wor=
k/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-initramfs/1.0-r0/temp/log.do=
_rootfs<br>ERROR: Logfile of failure stored in: /home/user/dhanasekar/BMC/A=
MD/openbmc/build/tmp/work/ethanolx-openbmc-linux-gnueabi/obmc-phosphor-init=
ramfs/1.0-r0/temp/log.do_rootfs.14182<br>ERROR: Task (/home/user/dhanasekar=
/BMC/AMD/openbmc/meta-phosphor/recipes-phosphor/images/obmc-phosphor-initra=
mfs.bb:do_rootfs) failed with exit code &#39;1&#39;</font><br></font><div><=
font face=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verda=
na, sans-serif">Please help me to fix the error,</font></div><div><font fac=
e=3D"verdana, sans-serif"><br></font></div><div><font face=3D"verdana, sans=
-serif">Thanks,</font></div><div>Dhanasekar,</div></div>

--00000000000098305405b1126906--
