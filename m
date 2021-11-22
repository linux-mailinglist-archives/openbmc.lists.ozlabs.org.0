Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3324589BD
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 08:21:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyJbG5qLzz2yJv
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 18:20:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AuEO/phh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AuEO/phh; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyJZs5cz1z2yJ5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Nov 2021 18:20:35 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id m192so12749741qke.2
 for <openbmc@lists.ozlabs.org>; Sun, 21 Nov 2021 23:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q6eyKATLDACMBju6fElpof08w1MPVAgIfpgCNnB/lHw=;
 b=AuEO/phhuoUKqs71SyS7jU1BvBnwqY1JqSO+wTT5TvmINlxdUDEvAWkkFlrqePuj3Q
 QucZcHdFS0C7XT9Dy2cPNkeXWhw4zcvWfnRwCp883OsMMatiXJsqKV9ggwZdLmg/XTMd
 dSncZ6M+HG+bBwn7wgErM/UyzZjvS7fLdOqu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q6eyKATLDACMBju6fElpof08w1MPVAgIfpgCNnB/lHw=;
 b=ftBE3Vt7r7mCQTpUvSWYPaZseX0BBulnWd77nI9vQTx7XlaknhYn6MqrojkzRFpzik
 0+xk31XyeG5agGTH2jYlZMbNHTnDSGpGOiQGNDsI0XZwy22JR7mClvVRr++iv4b2QU6S
 IHLp3HKMfpKa+QWVb0eI+OnLLdQbq4cB3k1P+VwFDF0QntNWYyuJLeEQ5Cng9G7P5FsQ
 HaL2m7EaMJrTL/9tEr3SeekVoBFBRwQVTnFb2GvBJ+6rBIMpqrwQBedJcZNJ4iylGQ8D
 A5HUV5nvvHGmbauGT/lJqRrVumVlAzU1tODzlo8EHmJnlQOHhp/lWj30dkrnY8CQJdiS
 nNkQ==
X-Gm-Message-State: AOAM531IuNDX+wp+KxLaiU7Nrwf/CsZev20ktJT8OiljLXa6oU6Uigsq
 +0kmNiJ2m1YQ6gDBaG6wwB+kZ302U6PevUVHvYU=
X-Google-Smtp-Source: ABdhPJyl44DP2sJBs3C+Vd6hogN9KzVPeOHf1/xWnW9KXQtZ6rA27ye38o62CWXl6Kl4nTeXX29wF5MYsRvQR4iVEBM=
X-Received: by 2002:a37:4141:: with SMTP id o62mr47528963qka.292.1637565630353; 
 Sun, 21 Nov 2021 23:20:30 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
In-Reply-To: <CAO=notybTVxHG2LVzW66vfK3232zCON2v5-p8-bpeTYGm3MMxQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Nov 2021 07:20:18 +0000
Message-ID: <CACPK8XeXG9pnv7nWwCm=1bMNVO2a0y1YGuSohuMhB4Ous9hOFw@mail.gmail.com>
Subject: Re: Using Qemu for BMC with a TAP interface
To: Patrick Venture <venture@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Foley <pefoley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 18 Nov 2021 at 20:35, Patrick Venture <venture@google.com> wrote:
>
> Hi;
>
> We're working on wiring up our Qemu BMC via a TAP configuration, and we'r=
e not seeing packets inside the Nuvoton NIC itself (a level of debugging we=
 had to enable).  We're using the npcm7xx SoC device,
>
> -nic tap,fds=3D4:5:6:7:8:9:10:11,id=3Dnet0,model=3Dnpcm7xx-emc,mac=3D58:c=
b:52:18:b8:f7
>
> For the networking parameters, where the tap fds are valid.  I was curiou=
s if any of y'all got qemu networking working for your BMC SoCs, either Asp=
eed or Nuvoton?

I've not tried using the -nic tap option with file descriptors. It's
not quite clear what you're trying to do, or what your full setup
looks like.

I did test it out just now with a manually created tap interface:

sudo ip tuntap add test0 mode tap group netdev
sudo ip link set test0 up
sudo tcpdump -i test0

And then when I fired up a qemu instance,

qemu-system-arm -nographic -M romulus-bmc -kernel arch/arm/boot/zImage
-dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb -initrd arm.cpio.xz
-nic tap,ifname=3Dtest0,id=3Dnet0

I could see packets being decoded by the tcpdump instance (my laptop
is 'voyager', qemu came up as fe80::5054:ff:fe12:3456):

$ sudo tcpdump -i test0
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on test0, link-type EN10MB (Ethernet), snapshot length 262144 byt=
es
15:10:32.683930 IP6 voyager > ip6-allrouters: ICMP6, router
solicitation, length 16
15:10:33.655994 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
_ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
15:10:37.795242 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
router solicitation, length 16
15:11:05.688413 IP6 voyager.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)?
_ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
15:11:07.499841 IP6 voyager > ip6-allrouters: ICMP6, router
solicitation, length 16
15:11:11.079030 IP6 fe80::5054:ff:fe12:3456 > ip6-allrouters: ICMP6,
router solicitation, length 16

I've cc'd C=C3=A9dric as he is the king of qemu command lines.

Cheers,

Joel






>
> Patrick
