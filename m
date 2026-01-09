Return-Path: <openbmc+bounces-1120-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3248D07129
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 05:11:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnSxv3Cfjz2xpl;
	Fri, 09 Jan 2026 15:11:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767930478;
	cv=none; b=jgzk0+zOk5mtcQFS0czeE9cuQilh+MvAyAvt1GCFkcvGXXzp5CaMdRW+vEB/+bvzQaJRY/uVAG+uOmBYR+rpybMX8Zg4TcYCWBmamJv34lTbFyrXf8NLDYu5MIQ5GSERL9UnJPtJl47UYqW9TsCXFfQe6OSlqO7/trHwZdbs3vjghWgn9SiA20DR3GJRZwybJOau69k4g/cQePLrhuJam7DfJ+U4jsdbMpjIhSFXQLsCqf4uUv0aDM5uIx++xTtRqpKuv6qM+nC2ts5w+wDlBIxNqL6JIjk8r0ajNwQDcQt+jd3GPzrK4g8o5LSTRo0qD6XTqm8XLfdET+pvAWpGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767930478; c=relaxed/relaxed;
	bh=M7Y+PlWcGeLOSwY4Zp7LYifmy8uew3xeT3rbaUu8uyo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RaEnVLWjlAN/V20TNDMKuysMXe86UItmq/9Q0uM6BEVJ360BR6AWXlUt/C9K206NB/4v2hcfqLCZx1XPmkvRmztLkFyjjdB7sNxh52M31HvUbPiYktn1UtT57h/veNRAK/xpjb0hC9Z2UJXCijA54x2WrX43cbJ7yG+R8tiyjvX99HjALfLu+PQH+UTa5Jy+4wrFD66ahYm2Hw8aX6XvEcgdFHs4Ljw4Lsl5Bdz9Ps1dscPKsIHfBqQJbH9ATIG1wp9ClQB1Hvyqy+JKXaFIcMTacL9tlzSpEgJKa9inRRTlvr8vUyqa5d6KQZL6g2qs8m2Mg0fWk+lyb4d0rSuX4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ct/h2mpT; dkim-atps=neutral; spf=pass (client-ip=74.125.82.43; helo=mail-dl1-f43.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ct/h2mpT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.82.43; helo=mail-dl1-f43.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnSR10fz0z2xGF
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 14:47:56 +1100 (AEDT)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-11f42e97229so3922377c88.0
        for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 19:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767930414; x=1768535214; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M7Y+PlWcGeLOSwY4Zp7LYifmy8uew3xeT3rbaUu8uyo=;
        b=Ct/h2mpTKQqXtn2l/aN+8h5QXCUF2O0cMeBt3fexJvNvsH2XgInu3tz9/U7msZbKdu
         DnthFV/L/exdmq895M1oj+IF/mKJEPt9dLjAJuc4pK6cOgJtdSLij/CG0+pLAb3exvqi
         rEswfnxKKAt1p5rRroDnREOSDkWVAGyGRrsEyLvZjPn64UZLiBMqJAS7sIIntpe72pp7
         fQMy5hNNgi/2MN3YqpbiivSp0RzJhzdhD2Gcxdz4VCs/5ao+JGx6viLD4Ws1BaUm9C+C
         jli/yIanC5oejNlGPaVJoYIMPhgVxpDaasSIVwwqqDsK1PBQ7r1yoOBazEFuzJcaWMp+
         +LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767930414; x=1768535214;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7Y+PlWcGeLOSwY4Zp7LYifmy8uew3xeT3rbaUu8uyo=;
        b=ZPgt+8pwgFDLjbmYE2ckGOkDLy2TnpRWOjbL5GBZjtzYUHaTlAxtJchBVvzuOq/Yt2
         DuIO0K7uodvXRrKTxCeGsC44yFitPYyByaprvb6ETe2ahnP/qiqD5M1eYdRgH3AMpyGh
         2Df7x+NIpp/yJdUTk7DIoNolYA4FYO+qTHOfPlE66F5CnUq/2lxtJlTrPaQZm5sffYHN
         1heWMK5m+J2U298X2IbmAXgnYedDPZUL2hjvFbYMAWmh7R4sFcitHD/0tdQfnJKp/IHp
         o8sY83nnIMBsOPjGY6C3hSEaYBuAFKO2RPSkz+Gv/xvP3eu6u3YJpmUA1djZ1WzywN47
         YgAw==
X-Gm-Message-State: AOJu0YwxvsWIuJwZdFFzIuDdpZAdjsBI9CarCwp0z5NbVYY54hAJ8h/2
	iQJnxleX8MhiOaToWDt/1oTZWTLZFeZXehViF9j5ZO11dJxlCSCTUS/iqEO6ZLIH97wVlssYpi+
	ZBx1hAFStwWvjmjpcmgiFQGTgKp9O4xK3AuWK
X-Gm-Gg: AY/fxX4RCBQh2MQf5bMNXPhAVNEf2BA6rIf1dUNjaXoASc+Tj5dkjMswctOFbxR0t/7
	k076CrxSXspQ4MGFcIGli0b1y8MeFVMrjMvr7+tTFQZ/OYnSmuoIivyw0bBoPYtFyxemcJbwFBU
	hTbTlsWlSSuB153Xyyt6czD8le0kO7UK0nH6lPHJLNmgNhxKfv4OdLcaRG6+lyb3Md7KU4xAHZW
	z5reRAAtBO3yNHj5nKg12Owe/vrwdVHMYPoCoBtZs2DfGYTW2yq/tXsEh+2XKZi8QwFu6s8wOcA
	BLIPJC9pgo8eEzxnK9A=
X-Google-Smtp-Source: AGHT+IGuJXXf7bpLzvyngu+61LbO9dTyNOetefuMzndfsbts5jSGOPv3EfUMFNF+KjcqsmY675SqbjiCAxlLdoZNsek=
X-Received: by 2002:a05:7022:1e15:b0:119:e569:f276 with SMTP id
 a92af1059eb24-121f8b45197mr5867612c88.31.1767930413486; Thu, 08 Jan 2026
 19:46:53 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Thu, 8 Jan 2026 21:46:42 -0600
X-Gm-Features: AQt7F2rJMeeASBlXAqdtxciabPNoR-89Lnn_sK5I1EZTcKoGGoHoaZzH7wetup4
Message-ID: <CAJ13v3T_jymYQyvrf0AtB_H-zjc0aU5GduhsywWkpS8p1nFR6g@mail.gmail.com>
Subject: Support for Asus IPMI Card
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello all,

I recently got this ASUS IPMI Card [1], which is a PCIe x1 card with
an AST2600 on it. It provides VGA output for the host it's plugged
into and has a NIC for IPMI access. Since this is just an Aspeed on a
pcie card, it's probably lacking some of the additional bus
connections between the BMC and CPU that you'd find on a normal server
motherboard.

The card has few  headers which can be plugged into the host to
provide more functionality

1. USB 2.0 connector to the internal motherboard header that provides
Keyboard/Mouse and virtual media
2. GPIO Pins for ATX Power Control,
3. Indicator LEDs
4. SPI for host bios flashing that talks to the motherboard via the
TPM SPI header on motherboard
5. PSU SMBUS connector
6. Proprietary ASUS BMC connector present in few motherboards
7. 4 pin FAN connectors
8. Temperature sensor connectors

I also found a UART header on the card, and I'm able to get serial
console access to the Aspeed chip.

I've been trying to write a device tree for this card and get an
OpenBMC image running on it. I have been basing this off DTs extracted
from a fw update for this card available on Asus's website [2]. This
firmware image is bootable in qemu. This seems to use kernel 5.4 and
u-boot 2019.04. The DTs extracted from this firmware are here (uboot
DT [3] linux DT [4]). These DTs have something weird in them. Even
though the card only has one NIC on it (mac2), but mac3 also seems to
be enabled in 100M mode. Is the 2nd mac related to the USB/rndis
interface the BMC provides?

Anyway, I got a build of OpenBMC up and running after a lot of trial
and error. I didn't have the hace enabled in the u-boot device tree,
so u-boot kept failing at the fitImage sha verification stage. I also
ended up wiping the u-boot data partition that stores the ethernet MAC
address for the NIC, so I had to manually add that in to u-boot (is
this how the ethernet MAC is programmed or is it read from the chip?).

I have USB Keyboard/Mouse and Video at 1024x768 working (albeit the
screen refreshes slowly sometimes) in my OpenBMC build. In my DT, I
have video_engine enabled. Do I need to enable gfx also? Is that
referring to video output from the aspeed (which we don't care about)
or the host? I have the heartbeat LED working, figuring out the rest
of the LEDs and power control should be simple I guess. I was able to
figure out some of the GPIO IDs by tracing writes to the aspeed_gpio
device in qemu.

I tried to use virtual media to mount an image but nbd_client seems to
crash with the following error message irrespective of how small of a
file I upload.

Jan 06 04:05:29 ipmi-card nbd_client[726]: Exported device is too big
for me. Get 64-bit machine :-(
Jan 06 04:05:29 ipmi-card nbd_client[726]: Exiting.
Jan 06 04:05:29 ipmi-card bmcweb[284]: [vm_websocket.hpp:155] Couldn't
read from VM port: End of file [asio.misc:2 at
/usr/include/boost/asio/detail/descriptor_read_op.hpp:122:5 in
function 'static void
boost::asio::detail::descriptor_read_op<MutableBufferSequence,
Handler, IoExecutor>::do_complete(void*,
boost::asio::detail::operation*, const boost::system::error_code&,
std::size_t)']

I wanted to know if there are any additional devices I could try
enabling in the device tree to get more functionality on the card. I
understand that some functionality won't be possible because this is
just a PCIe card and doesn't have additional connections to the host
CPU that a normal BMC would have. I see mentions of LPC, IBT, KCS in
the device tree, but am not really sure if any of these apply in this
case.

On the vendor firmware, an additional pcie device (other than the VGA
controller) appears on the host the card is plugged into

09:01.0 IPMI Interface: ASPEED Technology, Inc. Device 2402 (rev 01)
(prog-if 01 [KCS])
    Subsystem: ASPEED Technology, Inc. Device 2402
    Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    IOMMU group: 13
    Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=1M]
    Region 1: Memory at fc100000 (32-bit, non-prefetchable) [size=256K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/32 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Kernel modules: ipmi_si

However, on 2 systems I've tried, the ipmi_smi module fails to probe
for this device.

[   13.118009] IPMI message handler: version 39.2
[   13.122585] ipmi device interface
[   13.133364] ipmi_si: IPMI System Interface driver
[   13.133407] ipmi_si 0000:09:01.0: probing via PCI
[   13.133452] ipmi_si 0000:09:01.0: enabling device (0000 -> 0002)
[   13.133506] ipmi_si 0000:09:01.0: Could not setup I/O space
[   13.133508] ipmi_si 0000:09:01.0: [mem 0xfc000000-0xfc0fffff]
regsize 1 spacing 1 irq 0
[   13.133512] ipmi_si: Adding PCI-specified kcs state machine
[   13.133531] ipmi_si: Trying PCI-specified kcs state machine at mem
address 0xfc000000, slave address 0x0, irq 0
[   13.133572] ipmi_si 0000:09:01.0: Interface detection failed

Some searching online [5] shows that this functionality might only
work for certain Asus motherboards with a BIOS that specifically
supports this functionality.  The vendor DT has a special
bmc_dev@1e7e0000 of type "aspeed,ast2600-bmc-device". This doesn't
seem to be supported upstream. I see it in Aspeed's kernel fork on
github [6]. I am guessing this is what provides the pcie ipmi device.
Is there a reason support for this wasn't upstreamed? Would it be
worth trying to port this driver over to my openbmc build and see what
happens (or would I need some userspace component on openbmc, making
this exercise pointless). Also, would it be possible to get it working
on any motherboard, or are those comments online about needing a
custom BIOS true?

I have linked the linux [7], u-boot [8] and openbmc [9] trees I'm
using below. It you think I should post these in some other manner,
let me know.


[1]  https://www.asus.com/us/supportonly/ipmi%20expansion%20card/helpdesk_manual/
[2]  https://www.asus.com/us/supportonly/ipmi%20expansion%20card/helpdesk_bios/
[3]  https://gist.github.com/Genius1237/0b81fcbc8c25a8b516e63e466e8522b1
[4]  https://gist.github.com/Genius1237/df935a97f650aa17882599e6cce49d2b
[5] https://forums.servethehome.com/index.php?threads/asus-ipmi-expansion-card.35440/post-454240
[6] https://github.com/AspeedTech-BMC/linux/blob/0364b2fdf854b9f3c23752d2d499747f342f42e4/drivers/soc/aspeed/aspeed-bmc-dev.c#L552
[7] https://github.com/Genius1237/linux/commit/02802090509cf0499956a812ddebdaa77e16c176
[8] https://github.com/Genius1237/u-boot/commit/1b1b7daa85f6c998e5f404296b3da43077a2758e
[9] https://github.com/openbmc/openbmc/compare/master...Genius1237:openbmc:asus-ipmi-card

--
Regards
Anirudh Srinivasan

