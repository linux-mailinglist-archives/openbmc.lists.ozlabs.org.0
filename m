Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9C5180A80
	for <lists+openbmc@lfdr.de>; Tue, 10 Mar 2020 22:32:13 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cSwW025GzDqXq
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 08:32:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=obmc.developers@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C0tgC3U/; dkim-atps=neutral
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cSsh0kHDzDqQ8
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 08:29:43 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id b3so14735564otp.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Mar 2020 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7g4nXWLWliafT9r00Y4b4B+OV2eKxs2yVoJ4gUktKkQ=;
 b=C0tgC3U/yHZOsjGviGIMiBqbI8XhPAEYz6Wf8zwGC5clTOKJWJAy8JMq8SyeaQ68Fl
 U/mnUaHp89eyH4ToKzQD4U98NWesGUJD6VJ/kvDRRC+SoFJda5BIUPk+Jy9yVgT96H4d
 qpznVnqfEdErkj8rzUAbKYrOwwJCRy+HzAGGtp2koM6VepvH8R1BOY6vyyULT2lgq5Mh
 bkvy+1EOQnrn0i2HC7bQAcVS3RNOPOtcbkEen1JnuDzhBgK1IUU8y7bR3Ro9/L+/V2pz
 yEBFazMZGuFNqEPGFb+WBFuiEUi5y4enhAloaL9VQvlSh9KQdwdhyDBZ7DvrVZ8KUJa2
 v7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7g4nXWLWliafT9r00Y4b4B+OV2eKxs2yVoJ4gUktKkQ=;
 b=Z29RiMdTPBex3Aeh2Cc1tmWRmun5NWS9JOvEc/NyFbb9XyZK/QDQic6EvRn5dzbmT7
 7IRYqMDTVO7USrlXGxVV8W84Bn5k1d9uVDHdNwIBAwMQo1X2sex49ByT5kCp/HWCOu2D
 vyoVkW6brzxs6Muzv5hvZanHhFJAM18vG33hDg1ws0MHgKlHhk01oKi+slu7z31KDMnl
 a9BocedljMdJ0MHz3qqxydiFCyTkhsxJzGwtg4AJCMWjXLNI0ETJf1Jnl2PeMpuBm+0A
 PkpvStF7t/cbZ6SfUoo7unp48WL3rKyX3ZTO54OfNWZwQoj7rtP15IqxTVYxr36YD5c0
 tL2w==
X-Gm-Message-State: ANhLgQ0d07bDTL1HkcoiUUrWdmuC6JdZ/Z2qEBLHzdssnaWK0f8c+/NF
 JcQ0qRwBCExIc+DnUr7QMRg7DppztRh+k9puaqhRaWXJ
X-Google-Smtp-Source: ADFU+vvcIYYinqhNzXSXyxSg3vm8sB4he16/i6YfrVPFtgEotLxQ41IL5yPlUEMzumKAboRdSNIlGBtfUpqSAkyZsQM=
X-Received: by 2002:a9d:73c7:: with SMTP id m7mr4989120otk.69.1583875777518;
 Tue, 10 Mar 2020 14:29:37 -0700 (PDT)
MIME-Version: 1.0
From: Anony Mous <obmc.developers@gmail.com>
Date: Tue, 10 Mar 2020 14:25:49 -0700
Message-ID: <CABbLDjNCg84fVFzEWq2xg0UacMkZ86-NqmbD3maniP52JHaADQ@mail.gmail.com>
Subject: openipmi - ipmi_si driver not installing
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000165fc005a086d153"
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

--000000000000165fc005a086d153
Content-Type: text/plain; charset="UTF-8"

To whom it may concern,

I tried including the openipmi package in the image I built. The image is
for a system with an AST2500 (ARM core) BMC. I also included the necessary
configurations in the configuration file. dmesg shows the following:

[    1.037509] IPMI message handler: version 39.2
[    1.037713] ipmi device interface
[    1.037855] ipmi_si: IPMI System Interface driver
[    1.038289] ipmi_si: Unable to find any System Interface(s)
[    1.038319] ipmi_ssif: IPMI SSIF Interface driver
[    1.038569] IPMI Watchdog: driver initialized
[    1.038597] IPMI poweroff: Copyright (C) 2004 MontaVista Software - IPMI
Powerdown via sys_reboot
[    8.346526] systemd[1]: /lib/systemd/system/phosphor-ipmi-net@.socket:3:
Invalid interface name, ignoring: sys-subsystem-net-devices-%i.device

The issue I'm having is "ipmi_si: Unable to find any System interface(s)".

1. Why is that module not being loaded?
2. What is the reason for that error?
3. When I do an lsmod, it returns nothing and when I check /proc/moodules,
the file is empty. Why is this and how can I fix it?
4. Also modprobe and insmod give an error when I try loading ipmi_si
manually (seen below). The folder /lib/modules does not exist for some
reason. How would I be able to include the /lib/modules folder structure in
the openbmc image?



* insmod: ERROR: could not load module ipmi_si: No such file or directory*
*modprobe: FATAL: Module ipmi_si not found in directory /lib/modules/5.4.16*

5. Is openipmi driver required for executing ipmitool commands (i.e.
ipmitool raw <commands>) on the BMC?

Thank you for your time.

--000000000000165fc005a086d153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To whom it may concern,</div><div><br></div>I tried i=
ncluding the openipmi package in the image I built. The image is for a syst=
em with an AST2500 (ARM core) BMC. I also included the necessary configurat=
ions in the configuration file. dmesg shows the following:<br><br>[ =C2=A0 =
=C2=A01.037509] IPMI message handler: version 39.2<br>[ =C2=A0 =C2=A01.0377=
13] ipmi device interface<br>[ =C2=A0 =C2=A01.037855] ipmi_si: IPMI System =
Interface driver<br>[ =C2=A0 =C2=A01.038289] ipmi_si: Unable to find any Sy=
stem Interface(s)<br>[ =C2=A0 =C2=A01.038319] ipmi_ssif: IPMI SSIF Interfac=
e driver<br>[ =C2=A0 =C2=A01.038569] IPMI Watchdog: driver initialized<br>[=
 =C2=A0 =C2=A01.038597] IPMI poweroff: Copyright (C) 2004 MontaVista Softwa=
re - IPMI Powerdown via sys_reboot<br>[ =C2=A0 =C2=A08.346526] systemd[1]: =
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, ig=
noring: sys-subsystem-net-devices-%i.device<br><br>The issue I&#39;m having=
 is &quot;ipmi_si: Unable to find any System interface(s)&quot;. <br><br>1.=
 Why is that module not being loaded? <br>2. What is the reason for that er=
ror?<br>3. When I do an lsmod, it returns nothing and when I check /proc/mo=
odules, the file is empty. Why is this and how can I fix it?<br>4. Also mod=
probe and insmod give an error when I try loading ipmi_si manually (seen be=
low). The folder /lib/modules does not exist for some reason. How would I b=
e able to include the /lib/modules folder structure in the openbmc image?<d=
iv><br><i>	insmod: ERROR: could not load module ipmi_si: No such file or di=
rectory<br><br></i></div><div>	<i>modprobe: FATAL: Module ipmi_si not found=
 in directory /lib/modules/5.4.16</i><br></div><div><br></div><div>5. Is op=
enipmi driver required for executing ipmitool commands (i.e. ipmitool raw &=
lt;commands&gt;) on the BMC?<br></div><div><br></div><div>Thank you for you=
r time.</div></div>

--000000000000165fc005a086d153--
