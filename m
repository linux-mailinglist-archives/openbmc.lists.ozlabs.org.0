Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D72763CF
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 00:34:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxXzz2BfzzDqcV
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 08:34:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=apple.com (client-ip=17.171.2.72;
 helo=ma1-aaemail-dr-lapp03.apple.com; envelope-from=cyang999@apple.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=apple.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=apple.com header.i=@apple.com header.a=rsa-sha256
 header.s=20180706 header.b=wlOIUP4z; dkim-atps=neutral
X-Greylist: delayed 17884 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Sep 2020 08:34:13 AEST
Received: from ma1-aaemail-dr-lapp03.apple.com
 (ma1-aaemail-dr-lapp03.apple.com [17.171.2.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxXz92PpYzDqWG
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:34:12 +1000 (AEST)
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 08NHNQDT014382
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 10:36:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : content-type :
 mime-version : subject : message-id : date : to; s=20180706;
 bh=yBPl6L4AvgBdhCqJKSPUBfIoWQ6dgZUKDZvkgpunMDY=;
 b=wlOIUP4zdsqSP5f98/SQkXHirRe+LbJXn1dPRjhLIulCSQY882xYZhbc9W/YS+ZEDW1U
 +xghPr13U5sUYe55liPGzsilz9fwq5cBhZSHwftyqZh7ye8OfkbPTN+mJeDE5o9VEntV
 Oe0IBH+yUkvSn5SAPYzIUxEEA1BvJ5FwXkoZMrbrNZ8S3CzrTPi5qEHD6duAXQVliOKy
 WXyq3AwAMkemVzCqTWLj/0Y3M3McJ96D+fzqxRg8GkohT2D5TSMkvl/TGNpul0KPEOC5
 flhO0om3UBnLmmjC2PL85kA2yc4U56ExzTcGfyCFRn9iovMGgsmiGL9dbqlQ4CJBt4Ia nA== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 33ngyux6gk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 10:36:05 -0700
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) with ESMTPS id <0QH4005KTGW4DRF0@rn-mailsvcp-mta-lapp03.rno.apple.com>
 for openbmc@lists.ozlabs.org; Wed, 23 Sep 2020 10:36:04 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) id <0QH400V00GE13900@rn-mailsvcp-mmp-lapp02.rno.apple.com> for
 openbmc@lists.ozlabs.org; Wed, 23 Sep 2020 10:36:04 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 7f756ecb4ebb78a0f8c33d43d0fca5a4
X-Va-E-CD: 37e0ec64c89d9dd4a93c888602c865cc
X-Va-R-CD: 9a5a7dcc7aa34fd5b98e10bb67547cea
X-Va-CD: 0
X-Va-ID: ddea5364-7f49-441c-8750-e840c057410c
X-V-A: 
X-V-T-CD: 7f756ecb4ebb78a0f8c33d43d0fca5a4
X-V-E-CD: 37e0ec64c89d9dd4a93c888602c865cc
X-V-R-CD: 9a5a7dcc7aa34fd5b98e10bb67547cea
X-V-CD: 0
X-V-ID: 114c58c3-4fa3-4b38-b7f4-26514cb87445
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_13:2020-09-23,
 2020-09-23 signatures=0
Received: from [17.234.36.26] by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.6.20200729 64bit (built Jul 29
 2020)) with ESMTPSA id <0QH40048TGW32Z10@rn-mailsvcp-mmp-lapp02.rno.apple.com>
 for openbmc@lists.ozlabs.org; Wed, 23 Sep 2020 10:36:04 -0700 (PDT)
From: Cheng Yang <cyang999@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_2804A531-9D19-4F8E-AB33-FDC9FF52DAE9"
MIME-version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Difficulty booting on Raspberry Pi 4.
Message-id: <CDC90A55-957D-47BB-9B42-4283BB6706AF@apple.com>
Date: Wed, 23 Sep 2020 10:36:03 -0700
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_13:2020-09-23,
 2020-09-23 signatures=0
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


--Apple-Mail=_2804A531-9D19-4F8E-AB33-FDC9FF52DAE9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,  I=E2=80=99m openbmc noob here.

I follow the instruction of =
https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/README.md =
<https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/README.md=
>

After 2.5 hours everything built, (I used either x86 ubuntu 18.04 or =
20.04 same result)
However after I copied to the image to micro SD, raspberry Pi 4 won=E2=80=99=
t boot.
No video output, no serial output at all.  (The board works fine with =
ubuntu 18.04.)

Any tip/cheat sheet to get openbmc running on Raspberry Pi 4?

The steps I did, anything I missed? Is the recipe correct?
git clone the openbmc code.
source poky/oe-init-build-env rpi-build  <=3D=3D  yes I did this.
Add this layer to bblayers.conf and the dependencies above  <=3D=3D yes =
I added /var/openbmc/openbmc/meta-raspberrypi (where I=E2=80=99m using =
/var/openbmc as the source code dir.)
Set MACHINE in local.conf to one of the supported boards  <=3D=3D I =
added MACHINE ??=3D =E2=80=9Craspberrypi4=E2=80=9D (replacing the =
original qemu line)
bitbake core-image-base  <=3D=3D  went through, only 5 warnings, no =
error, everything successful.
Use bmaptool to copy the generated .wic.bz2 file to the SD card  <=3D=3D =
with =E2=80=9Csudo ~/bmap-tools/bmaptool copy =
core-image-base-raspberrypi4.wic.bz2 /dev/sdc1=E2=80=9D no error copied =
successfully.
Boot your RPI  <=3D=3D  nothing happen, no VGA, can=E2=80=99t be =
ping=E2=80=99ed, no console serial output either (no uboot messages).

Any tip/pointer will be greatly appreciated.

Cheng=

--Apple-Mail=_2804A531-9D19-4F8E-AB33-FDC9FF52DAE9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi, =
&nbsp;I=E2=80=99m openbmc noob here.<div class=3D""><br =
class=3D""></div><div class=3D"">I follow the instruction of <a =
href=3D"https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi/RE=
ADME.md" =
class=3D"">https://github.com/openbmc/openbmc/blob/master/meta-raspberrypi=
/README.md</a></div><div class=3D""><br class=3D""></div><div =
class=3D"">After 2.5 hours everything built, (I used either x86 ubuntu =
18.04 or 20.04 same result)</div><div class=3D"">However after I copied =
to the image to micro SD, raspberry Pi 4 won=E2=80=99t boot.</div><div =
class=3D"">No video output, no serial output at all. &nbsp;(The board =
works fine with ubuntu 18.04.)</div><div class=3D""><br =
class=3D""></div><div class=3D"">Any tip/cheat sheet to get openbmc =
running on Raspberry Pi 4?</div><div class=3D""><br class=3D""></div><div =
class=3D"">The steps I did, anything I missed? Is the recipe =
correct?</div><div class=3D""><ol class=3D"" style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);"><li class=3D""><span class=3D"">git =
clone the openbmc code.</span></li><li class=3D""><span class=3D"">source =
poky/oe-init-build-env rpi-build &nbsp;&lt;=3D=3D &nbsp;yes I did =
this.</span></li><li class=3D""><font color=3D"#000000" class=3D"">Add =
this layer to bblayers.conf and the dependencies above &nbsp;&lt;=3D=3D =
yes I added&nbsp;/var/openbmc/openbmc/meta-raspberrypi (where I=E2=80=99m =
using /var/openbmc as the source code dir.)</font></li><li =
class=3D""><font color=3D"#000000" class=3D"">Set MACHINE in local.conf =
to one of the supported boards &nbsp;&lt;=3D=3D I added MACHINE =
??=3D&nbsp;=E2=80=9Craspberrypi4=E2=80=9D&nbsp;(replacing the original =
qemu line)</font></li><li class=3D""><span class=3D"">bitbake =
core-image-base &nbsp;&lt;=3D=3D &nbsp;went through, only 5 warnings, no =
error, everything successful.</span></li><li class=3D""><font =
color=3D"#000000" class=3D"">Use bmaptool to copy the generated .wic.bz2 =
file to the SD card &nbsp;&lt;=3D=3D with&nbsp;=E2=80=9Csudo =
~/bmap-tools/bmaptool copy core-image-base-raspberrypi4.wic.bz2 =
/dev/sdc1=E2=80=9D no error copied successfully.</font></li><li =
class=3D""><font color=3D"#000000" class=3D"">Boot your RPI &nbsp;&lt;=3D=3D=
 &nbsp;nothing happen, no VGA, can=E2=80=99t be ping=E2=80=99ed, no =
console serial output either (no uboot messages).</font></li></ol><div =
class=3D""><font color=3D"#000000" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0);" class=3D""><br class=3D""></span></font></div><div =
class=3D""><font color=3D"#000000" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0);" class=3D"">Any tip/pointer will be greatly =
appreciated.</span></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span></font></div><div class=3D""><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">Cheng</span></font></div></div></body></html>=

--Apple-Mail=_2804A531-9D19-4F8E-AB33-FDC9FF52DAE9--
