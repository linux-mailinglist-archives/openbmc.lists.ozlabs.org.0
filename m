Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD8516484
	for <lists+openbmc@lfdr.de>; Sun,  1 May 2022 15:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Krmrk5r2gz2yZc
	for <lists+openbmc@lfdr.de>; Sun,  1 May 2022 23:13:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hUDvmvcF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=zhangjian.3032@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=hUDvmvcF; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KrmrK581fz2xxn
 for <openbmc@lists.ozlabs.org>; Sun,  1 May 2022 23:13:35 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id x33so21376313lfu.1
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2022 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NnatgKS24CPvdS/N3DAZ5yjXROI4m7GIpe0wI3Xjb9s=;
 b=hUDvmvcFFBZBm9O6PcJZTEdvl5TZERuymNwC4/L7vomBL9grKrsrhO1mvyc1LPXNsd
 2U5mXKi2OBFh0TZtjSpE/hWviYUnbzLMwYfDRlCYSQY6X3DSCxzBBi6jRpWdjsyIIhal
 RVtM2RVNen1q8bb00oqndXgk2dpagmX11gKeW7xs967zLCIdLWHl85nVC+JG+If5bdJ0
 XCid7d52vvb3Wxur9EUMpRGZJ8n8jrZ2AbAqFXAFt1M8TbLoa5JZBcGP8HeeNQOCcV5i
 rLiG+6VVZFlyCyQjAIDzCcVLGaWX81JmSWUpwjDj2tFFgesTNYPncwekOQgBe3zCG5NK
 uy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=NnatgKS24CPvdS/N3DAZ5yjXROI4m7GIpe0wI3Xjb9s=;
 b=YE2cGeoGQpS/NtV0FdA2lHqRKUG28vEpdS4453fTFjiVoOWb0iQxLciwdIs4gSRe75
 RMPoL6JskeNf1qz+It8ANuEZvTdMDAo0vvbx9NHkCAbc0DsW/J9oy2be5vhsX21AgQEX
 XCl/l2vYgGEw21t9eKGwVEbDJc9ipsR62po+Y9U/FOA6/cc0qguF8N8yeC7aUcQJeBPL
 GRIuKE1cjEkMOX0M940A/+DvrZNV1KmfJB1X81jK26T57bBW/Yzo5LQzp1PU4d8bh+KW
 sSzByJ1IklacF+V61lRpM6iG+lu8kLYT4oh7sK/z4SaqE90D2U5aI89/xuKm0cY9Fp46
 sC8g==
X-Gm-Message-State: AOAM5327fWjH+uo7sT5HuBSoDpu6J3U2F3LWBXeDkNj4sIyQN1rO4lVz
 yD38vzBYfDls7oa7MQbmmuBOXI9yJ3C4HtyDFelYMNa/v4yfHsKO
X-Google-Smtp-Source: ABdhPJygXfzA/mN5yOV3O5mnjI5tcKdjVVBCoPq13yDuiM/7TU2SjzR3IN1b1P68ZdGVvjduo0G9mXVBHmttFTjP0uk=
X-Received: by 2002:a05:6512:2a92:b0:472:5c09:c1a8 with SMTP id
 dt18-20020a0565122a9200b004725c09c1a8mr4211627lfb.265.1651410806961; Sun, 01
 May 2022 06:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <CA+J-oUsqt4fcSiHtmA5W6RcPn2rnAoM6Att48FX_Up4EvrYncw@mail.gmail.com>
 <434692c9-e7af-0454-f09a-025a7e052eb8@kaod.org>
 <CA+J-oUsT+uGBU+bt7PL_XA52fj4m2gVrHHsc7wrHHLH4W7JH7w@mail.gmail.com>
 <E70F085F-C729-449B-83DA-81536AF58ED8@bytedance.com>
 <59304a28-b6ec-af68-8bbb-8a0de40135a9@kaod.org>
In-Reply-To: <59304a28-b6ec-af68-8bbb-8a0de40135a9@kaod.org>
From: =?UTF-8?B?5YGl5byg?= <zhangjian.3032@bytedance.com>
Date: Sun, 1 May 2022 21:13:15 +0800
Message-ID: <CA+J-oUvoyzyyfp7buDNF2Jibd=HGs=wb4QBhUxgTQe7+v68seA@mail.gmail.com>
Subject: Re: [External] ` NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0
 timed out ` error in qemu
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Add a wiki to record this issue and for your reference.

https://github.com/zhangjian3032/qemu/wiki/NETDEV-WATCHDOG:-eth0-(ftgmac100=
):-transmit-queue-0-timed-ou--error-in-qemu,-cause-net-device-start-fail


On Fri, Apr 29, 2022 at 1:48 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/28/22 15:55, =E5=81=A5=E5=BC=A0 wrote:
> > Hi C;
> >
> > That=E2=80=99s awesome , It's okay to use bridge,
> >
> >
> > Here is my command line, 2 devices are good.
> >
> > ./qemu/build/install/bin/qemu-system-arm -M g220a-bmc -nographic -drive=
 file=3Dimage-bmc,format=3Draw,if=3Dmtd -net nic,netdev=3Dnet0, -netdev bri=
dge,id=3Dnet0,helper=3D./qemu/build/install/libexec/qemu-bridge-helper,br=
=3Dvirbr0, -net nic,netdev=3Dnet1, -netdev bridge,id=3Dnet1,helper=3D./qemu=
/build/install/libexec/qemu-bridge-helper,br=3Dvirbr0
>
> Perfect !
>
> Something I would really like to work is the usb-net device.
>
> Thanks,
>
> C.
>
> >> -net nic,macaddr=3D....,netdev=3Dnet0 \
> >> -netdev bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=
=3Dvirbr0
> >
> >
> >
> >> 2022=E5=B9=B44=E6=9C=8828=E6=97=A5 19:31=EF=BC=8C=E5=BC=A0=E5=81=A5 <z=
hangjian.3032@bytedance.com <mailto:zhangjian.3032@bytedance.com>> =E5=86=
=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> From: "C=C3=A9dric Le Goater"<clg@kaod.org <mailto:clg@kaod.org>>
> >> Date: Thu, Apr 28, 2022, 19:23
> >> Subject: [External] Re: ` NETDEV WATCHDOG: eth0 (ftgmac100): transmit =
queue 0 timed out ` error in qemu
> >> To: "=E5=BC=A0=E5=81=A5"<zhangjian.3032@bytedance.com <mailto:zhangjia=
n.3032@bytedance.com>>, "Joel Stanley"<joel@jms.id.au <mailto:joel@jms.id.a=
u>>
> >> Hello C;
> >>
> >> [ Adding Joel who has some experience on NCSI vs. QEMU ]
> >>
> >> On 4/28/22 12:29, =E5=BC=A0=E5=81=A5 wrote:
> >> > Hi C;
> >> > Excuse me to ask you a qemu question.
> >>
> >> It would help if you provided the QEMU command line. Not all NICs are
> >> connected to the QEMU machine.
> >>
> >> It's my command line
> >> qemu-system-arm -M g220a-bmc -nographic -drive file=3Dimage-bmc,format=
=3Draw,if=3Dmtd -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev user,id=
=3Dnetdev1,hostfwd=3Dudp::5623-:623, -net nic,model=3Dftgmac100,netdev=3Dne=
tdev2 -netdev user,id=3Dnetdev2,hostfwd=3D:127.0.0.1:4222-:22,hostfwd=3D:12=
7.0.0.1:3443-:443,hostfwd=3Dudp::3623-:623
> >>
> >> > According to my development needs, I need to reconfigure the network=
 configuration every time I start.
> >> >
> >> > The order is
> >> >
> >> > 1. Power on.
> >> > 2. systemd-networkd start
> >> > 3. update network config
> >> > 4. systemctl reload systemd-networkd
> >> >
> >> > It looks fine after booting for a long time. I manually execution st=
ep 3 and 4.>
> >> > But I hit an issue in qemu when I make step 3/4 in Start-up process(=
use a systemd script)
> >> >
> >> > There is always an error log like below .
> >> > [ 155.772381] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed=
 out!
> >>
> >> That could be the issue. QEMU doesn't really model NCSI. There is
> >> only a simple responder in slirp.
> >>
> >> Also at startup, OpenBMC does a few things that could load the CPU
> >> which would slow down very much the overall machine.
> >>
> >>
> >> > [ 159.132481] ------------[ cut here ]------------
> >> > [ 159.133035] WARNING: CPU: 0 PID: 207 at net/sched/sch_generic.c:47=
7 dev_watchdog+0x2a8/0x2c4
> >> > [ 159.133543] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 ti=
med out
> >> > [ 159.134143] CPU: 0 PID: 207 Comm: dropbearkey Not tainted 5.15.34-=
0626498-dirty-006ed35 #1
> >> > [ 159.134748] Hardware name: Generic DT based system
> >> > [ 159.135241] Backtrace:
> >> > [ 159.135637] [<807fbe0c>] (dump_backtrace) from [<807fc004>] (show_=
stack+0x20/0x24)
> >> > [ 159.136240] r7:00000009 r6:000001dd r5:806b0850 r4:80a06be8
> >> > [ 159.136587] [<807fbfe4>] (show_stack) from [<808063e4>] (dump_stac=
k+0x28/0x30)
> >> > [ 159.136983] [<808063bc>] (dump_stack) from [<80115fe4>] (__warn+0x=
e4/0x150)
> >> > [ 159.137359] r5:806b0850 r4:80a75280
> >> >
> >> > Before this error log I reload systemd-networkd, will cause network =
device start fail.
> >> > But this error don't appear on physical machines.
> >>
> >> They are faster and they have a real NCSI backend.
> >>
> >> > Thus , I add a dirty delay `sleep 20`, reload after timeout. It will=
 be fine.
> >>
> >> ok. It looks like a load issue then.
> >>
> >> > Do you know how to fix `NETDEV WATCHDOG: eth0 (ftgmac100): transmit =
queue 0 timed out` in qemu?
> >> > or
> >> > Can BMC know if it boots from a qemu virtual machine or a physical m=
achine?
> >>
> >> not really and it is not the goal. we try to tune things from outside,
> >> in QEMU.
> >>
> >> okay, i think so.
> >>
> >> > Network start fail log:
> >> > Jan 01 00:01:28 g220a systemd[1]: Starting Network Configuration...
> >> > Jan 01 00:01:54 g220a systemd-networkd[360]: bond1: netdev ready
> >> > Jan 01 00:01:55 g220a systemd-networkd[360]: lo: Link UP
> >> > Jan 01 00:01:55 g220a systemd-networkd[360]: lo: Gained carrier
> >> > Jan 01 00:01:56 g220a systemd-networkd[360]: Enumeration completed
> >> > Jan 01 00:01:57 g220a systemd[1]: Started Network Configuration.
> >> > Jan 01 00:02:00 g220a systemd-networkd[360]: eth1: Link UP
> >> > Jan 01 00:02:01 g220a systemd-networkd[360]: eth1: Gained carrier
> >> > Jan 01 00:02:01 g220a systemd-networkd[360]: eth0: Link UP
> >> > Jan 01 00:02:01 g220a systemd-networkd[360]: eth0: Gained carrier
> >> > Jan 01 00:02:02 g220a systemd-networkd[360]: bond1: Link UP
> >> > Jan 01 00:02:02 g220a systemd-networkd[360]: bond1: Gained carrier
> >> > Jan 01 00:02:04 g220a systemd-networkd[360]: bond1: DHCPv4 address 1=
0.0.2.15/24 , gateway 10.0.2.2 acquired from 10.0.2.2
> >>
> >> Ah. this is bonding two devices. I never tried that. Joel, have you ?
> >>
> >> > Jan 01 00:02:04 g220a systemd-networkd[360]: bond1: Gained IPv6LL
> >> > Apr 28 10:24:11 g220a systemd-networkd[360]: eth1: Reconfiguring wit=
h /etc/systemd/network/00-bmc-eth1.network.
> >> > Apr 28 10:24:11 g220a systemd-networkd[360]: eth0: Reconfiguring wit=
h /etc/systemd/network/00-bmc-eth0.network.
> >> > Apr 28 10:24:13 g220a systemd-networkd[360]: eth1: Link DOWN
> >> > Apr 28 10:24:13 g220a systemd-networkd[360]: eth1: Lost carrier
> >> > Apr 28 10:24:13 g220a systemd-networkd[360]: eth0: Link DOWN
> >> > Apr 28 10:24:13 g220a systemd-networkd[360]: eth0: Lost carrier
> >> > Apr 28 10:24:38 g220a systemd-networkd[360]: eth1: Failed to sync li=
nk information: Connection timed out
> >> > Apr 28 10:24:38 g220a systemd-networkd[360]: eth1: Failed
> >> > Apr 28 10:24:39 g220a systemd-networkd[360]: eth0: Failed to sync li=
nk information: Connection timed out
> >> > Apr 28 10:24:39 g220a systemd-networkd[360]: eth0: Failed
> >> >
> >> > Then, start manually, also fail.
> >> > ip link set eth0 up
> >> > [ 308.820798] ftgmac100 1e660000.ethernet eth0: NCSI: No channel fou=
nd to configure!
> >> > ip: SIOCSIFFLAGS: No such device
> >>
> >>
> >> Just to eliminate the cause, have you tried with a libvirt bridge ?
> >>
> >> -net nic,macaddr=3D....,netdev=3Dnet0 \
> >> -netdev bridge,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=
=3Dvirbr0
> >>
> >> nop, i'll have a try
> >>
> >> Thanks,
> >>
> >> C.
> >
>
