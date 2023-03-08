Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE656B1622
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 00:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX7Hf5Xwvz3cK5
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 10:07:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dzxhrdmE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=hamid.amirrad2002@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dzxhrdmE;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX3776MhHz3c99
	for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2023 06:59:29 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id a25so70592957edb.0
        for <openbmc@lists.ozlabs.org>; Wed, 08 Mar 2023 11:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678305562;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8Rq0qpjkS4b6O6PQRXgBZrgeQGHD7vc9/1gpY6ETu4Q=;
        b=dzxhrdmEOhgj6qPwqzjh6iUPIlJyv0frUb4SKflOYyBfh/O/grt+sMiapGdjAlYRXz
         luPCCXKtrhpZt/AOa6vUj7xgV8tVnjbbHOeZXKFtVHecvh740/eO1131wQHwXG6/OJxR
         YPmxgTH2TxzZ1AbCzXsez3Z6NtatjCV50rN+XGHU71ThfaYGprJvXFXl7LMUlmmS7+57
         PlWo/kzuDFUBDbrSjiWcqWPlN0GbddUBdg5uLgnUrrKyQQovUYBpoGGBT+wmjfJSA9VM
         MfFgVsM7uv0DL10/m13fRIhJk27VtopnSwTM9XbOoOS14iyV2S64/wa3jjqzQFODf352
         oIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678305562;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Rq0qpjkS4b6O6PQRXgBZrgeQGHD7vc9/1gpY6ETu4Q=;
        b=aK2Jr02tQ9KOoWQZP3v05P4GRZXnd7cOWTOWGnZIdk2577kCnW6Q4AAij515ZaAbMB
         VzS3iWcxZD57LYyu2wSx+ubnoiMpjcYN9+RyY+WG5LzDAJ4gN11cnl60riH7M5eG2kaw
         8H126sEMIxHaXDHYv0YlcGt1unVFlQ9L8yBq3FoCMWdM7N0XqiByAvEVp+QcAtWFIA85
         OAgJk+GeWeiCus2pbfXx2K5i2J2bju22BhfjzEueUhF4aEc4QZ63KTxMK0YJJLGZKf/j
         FnZrGSxF8F6hqRczMqsASHvYfepAEn+FYEx5QBdGI9iDdsADbjbSN8staQgrlTE/q4V/
         iWQg==
X-Gm-Message-State: AO0yUKVsNtHKIYhcML9BnpqNWO/pVshgfcJgIQ5uWlPYi6ArDT8OIbee
	81oLUN6bwrnoA8gyTKj+AJVKZ79kPg+m1OyHRZ76zHMi
X-Google-Smtp-Source: AK7set8BNVbwlh3cu3g29SU78fNN5GhsRASd2Wx/aKXCOoeZqphdsq9xKmnV+xTEBYm2hgvlZVJu4wYXDHK/ZUyKtOQ=
X-Received: by 2002:a50:d5d6:0:b0:4af:70a5:5609 with SMTP id
 g22-20020a50d5d6000000b004af70a55609mr10424259edj.1.1678305562160; Wed, 08
 Mar 2023 11:59:22 -0800 (PST)
MIME-Version: 1.0
From: Alex Ba <hamid.amirrad2002@gmail.com>
Date: Wed, 8 Mar 2023 14:59:11 -0500
Message-ID: <CAJU63odeBJaumZ96rH_=5D=adqGCLJO-GiJTmmCZmcuGSTegnw@mail.gmail.com>
Subject: Openbmc not detecting sd card
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000db712e05f668f655"
X-Mailman-Approved-At: Thu, 09 Mar 2023 10:05:45 +1100
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

--000000000000db712e05f668f655
Content-Type: text/plain; charset="UTF-8"

Hi,

I compiled the latest code from the git for evb-ast2500 and loaded the
image onto the board. The borad has an external micro sd that I am trying
to access it for storage purposes.
OpenBmc does not seem to detect it. Below is output of some of the commands
that could help with the issue. Can someone please help me with this? Do I
need to enable something when compiling or do I need to add a driver when
compiling? Is there any step that i should follow to discover the sd card?

Thanks,

*root@BMC:~# uname -a*
Linux BMC 6.0.8-1b16243 #1 Thu Nov 17 03:10:16 UTC 2022 armv6l GNU/Linux


*root@BMC:~# cat /etc/os-release*
ID=openbmc-phosphor
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="None"
VERSION_ID=none
VERSION_CODENAME="${DISTRO_CODENAME}"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
None"
BUILD_ID="20221122151436"
OPENBMC_TARGET_MACHINE="evb-ast2500"
EXTENDED_VERSION="None"

*root@BMC:~# df -T*
Filesystem           Type       1K-blocks      Used Available Use% Mounted
on
dev                  devtmpfs      489096         0    489096   0% /dev
tmpfs                tmpfs         506524     12400    494124   2% /run
/dev/mtdblock4       squashfs       17664     17664         0 100%
/run/initramfs/ro
/dev/mtdblock5       jffs2           4096      1256      2840  31%
/run/initramfs/rw
cow                  overlay         4096      1256      2840  31% /
tmpfs                tmpfs         506524         8    506516   0% /dev/shm
tmpfs                tmpfs         506528         0    506528   0% /tmp
tmpfs                tmpfs         506524         8    506516   0%
/var/volatile

*root@BMC:~# fdisk -l*
root@BMC:~#

*root@BMC:~# blkid*
/dev/mtdblock4: TYPE="squashfs"

--000000000000db712e05f668f655
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-size:12.8px" dir=3D"auto"><br><div sty=
le=3D"height:88px"></div><div style=3D"width:380.19px;margin:16px 0px"><div=
><div dir=3D"ltr"><div style=3D"font-family:calibri,arial,helvetica,sans-se=
rif;font-size:12pt;background-color:rgb(255,255,255)">Hi,</div><div style=
=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;backgroun=
d-color:rgb(255,255,255)"><br></div><div style=3D"font-family:calibri,arial=
,helvetica,sans-serif;font-size:12pt;background-color:rgb(255,255,255)">I c=
ompiled the latest code from the git for evb-ast2500 and loaded the image o=
nto the board. The borad has an external micro sd that I am trying to acces=
s it for storage purposes.</div><div style=3D"font-family:calibri,arial,hel=
vetica,sans-serif;font-size:12pt;background-color:rgb(255,255,255)">OpenBmc=
 does not seem to detect it. Below is output of some of the commands that c=
ould help with the issue. Can someone please help me with this? Do I need t=
o enable something when compiling or do I need to add a driver when compili=
ng? Is there any step that i should follow to discover the sd card?</div><d=
iv style=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;b=
ackground-color:rgb(255,255,255)"><br></div><div style=3D"font-family:calib=
ri,arial,helvetica,sans-serif;font-size:12pt;background-color:rgb(255,255,2=
55)">Thanks,</div><div style=3D"font-family:calibri,arial,helvetica,sans-se=
rif;font-size:12pt;background-color:rgb(255,255,255)"><br></div><div style=
=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;backgroun=
d-color:rgb(255,255,255)"><b>root@BMC:~# uname -a</b><div>Linux BMC 6.0.8-1=
b16243 #1 Thu Nov 17 03:10:16 UTC 2022 armv6l GNU/Linux</div><br></div><div=
 style=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;bac=
kground-color:rgb(255,255,255)"><br></div><div style=3D"font-family:calibri=
,arial,helvetica,sans-serif;font-size:12pt;background-color:rgb(255,255,255=
)"><b>root@BMC:~# cat /etc/os-release</b><div>ID=3Dopenbmc-phosphor</div><d=
iv>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro=
)&quot;</div><div>VERSION=3D&quot;None&quot;</div><div>VERSION_ID=3Dnone</d=
iv><div>VERSION_CODENAME=3D&quot;${DISTRO_CODENAME}&quot;</div><div>PRETTY_=
NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) N=
one&quot;</div><div>BUILD_ID=3D&quot;20221122151436&quot;</div><div>OPENBMC=
_TARGET_MACHINE=3D&quot;evb-ast2500&quot;</div>EXTENDED_VERSION=3D&quot;Non=
e&quot;<br></div><div style=3D"font-family:calibri,arial,helvetica,sans-ser=
if;font-size:12pt;background-color:rgb(255,255,255)"><br></div><div style=
=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;backgroun=
d-color:rgb(255,255,255)"><b>root@BMC:~# df -T</b><div>Filesystem =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Type =C2=A0 =C2=A0 =C2=A0 1K-blocks =C2=A0 =C2=
=A0 =C2=A0Used Available Use% Mounted on</div><div>dev =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devtmpfs =C2=A0 =C2=A0 =C2=A04890=
96 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0489096 =C2=A0 0% /dev</div><d=
iv>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 506524 =C2=A0 =C2=A0 12400 =C2=A0 =C2=A0494124 =C2=
=A0 2% /run</div><div>/dev/mtdblock4 =C2=A0 =C2=A0 =C2=A0 squashfs =C2=A0 =
=C2=A0 =C2=A0 17664 =C2=A0 =C2=A0 17664 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 100% =
/run/initramfs/ro</div><div>/dev/mtdblock5 =C2=A0 =C2=A0 =C2=A0 jffs2 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4096 =C2=A0 =C2=A0 =C2=A01256 =C2=A0 =C2=A0=
 =C2=A02840 =C2=A031% /run/initramfs/rw</div><div>cow =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overlay =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4096 =C2=A0 =C2=A0 =C2=A01256 =C2=A0 =C2=A0 =C2=A02840 =C2=A031% /</div=
><div>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 506524 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 =C2=A0 =C2=
=A0506516 =C2=A0 0% /dev/shm</div><div>tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0 =C2=A0 506528 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0506528 =C2=A0 0% /tmp</div>tmpfs =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 506524 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 =C2=A0 =C2=A0506516 =C2=A0 0% =
/var/volatile<br></div><div style=3D"font-family:calibri,arial,helvetica,sa=
ns-serif;font-size:12pt;background-color:rgb(255,255,255)"><br></div><div s=
tyle=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;backg=
round-color:rgb(255,255,255)"><b>root@BMC:~# fdisk -l</b><div>root@BMC:~#</=
div></div><div style=3D"font-family:calibri,arial,helvetica,sans-serif;font=
-size:12pt;background-color:rgb(255,255,255)"><br></div><div style=3D"font-=
family:calibri,arial,helvetica,sans-serif;font-size:12pt;background-color:r=
gb(255,255,255)"><b>root@BMC:~# blkid</b><br>/dev/mtdblock4: TYPE=3D&quot;s=
quashfs&quot;<br></div><div style=3D"font-family:calibri,arial,helvetica,sa=
ns-serif;font-size:12pt;background-color:rgb(255,255,255)"><br></div><div s=
tyle=3D"font-family:calibri,arial,helvetica,sans-serif;font-size:12pt;backg=
round-color:rgb(255,255,255)"><br></div></div></div></div><div style=3D"hei=
ght:0px"></div></div><br></div>

--000000000000db712e05f668f655--
