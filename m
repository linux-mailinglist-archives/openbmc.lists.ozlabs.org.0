Return-Path: <openbmc+bounces-1150-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A92D102DF
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 01:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqCnk5txWz2ykV;
	Mon, 12 Jan 2026 11:25:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768177514;
	cv=none; b=h/NDeIu6+0ZJxCAaVvIXfkJ43Km3IvXIHHhlJSUALOK2Y8OgBsi4Qb9orX3Qp0AZl8m38AdZOc3niULzuW13isCqlEgRDauwpft8kZ35eCUVtPSwvqMLt0tIX2xb58eD7k7R0surKmh6f2QpowFRz1s34YBYyBYcDjVKHLJXquiX+HDyV6z4gNyhUGgZREiR0HZ+aekBeP5J7FwFUpTzUpfikXHlhSCfjYqJ67N973usWOXsLqvUnzRE0A50ZD93M4OE9uZJhO3WF+Ep1K7nRCHl/zrLzq8wlJnvezNAOJA6jRMuoO16gzHJKr/4bY1nskSpX/AhMUyUp7y+HolGow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768177514; c=relaxed/relaxed;
	bh=cIFjH3rgcg1ZslwMJ+jck6P8coNp2KAIM2m4/CqML0Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFeBn35UxIL4YmTaqxG86mJFMpknREUHR/3D4SHEd4QAvEHUbY2z7HPlMvXG68LYh4lpSsfgRzE9sR6YU9Yfzdi+/5HhL1OK43idADy1uAN1HfTxkF6b1ZdMOhwtFSQLRMZ6EOr32/bL8vh73CgB/N3jTLnIluC5Cb43ZQYLx1GXk2GqoArhCuy5NGJkwgbJE//AUB3sWvW8OZ0lXr7YFU5+82kwAAixGIeZ22oHK2faFgMgGmzIojkXWn3tN2e6HH/Lne+gUlcYFKia9LBHJXDQ4az36HR7KWdJ54e7ICD2LklZbkoZaeTMUUDzPAMDtQNOmx8aBKb2Fi1k1TyHEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jhPPqKXk; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jhPPqKXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqCnj569Fz2yjq
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 11:25:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768177510;
	bh=cIFjH3rgcg1ZslwMJ+jck6P8coNp2KAIM2m4/CqML0Q=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=jhPPqKXkHFXv8a6trSe3sXTYtFCo0oA6p0yu29O/dbTeFZ5e0wz0RzC+gior+XubS
	 YlpfrlFMpMyxMB0/uZTekZoTx7Ouly7itLJ41YAdEhUhX52MuLmVnN4F9YAWiei3R6
	 sBH6dCuBFUW42DO9eRkpyF2RQzVOX/vd8qoQsFNxKC7BAXiocSQme0McvXFWt/Zijv
	 u657I8dRwtZ/47ugWqqf8CMOY4qoby0+hZngMX7KB4xcoL8MqA3w91EKhu5CHU6yqt
	 agCQwD7toLfF139BNO/Ix3tvV9xO4QkY4j/GUVspSgr5udU4ZipCyxRSb600tPJBer
	 DgoiUSghbLJYQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 77BE5648B5;
	Mon, 12 Jan 2026 08:25:10 +0800 (AWST)
Message-ID: <c0bffe81fc734045909a98f8e820a62896ade172.camel@codeconstruct.com.au>
Subject: Re: Support for Asus IPMI Card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 12 Jan 2026 10:55:09 +1030
In-Reply-To: <CAJ13v3T_jymYQyvrf0AtB_H-zjc0aU5GduhsywWkpS8p1nFR6g@mail.gmail.com>
References: 
	<CAJ13v3T_jymYQyvrf0AtB_H-zjc0aU5GduhsywWkpS8p1nFR6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Anirudh,

Nice work here!

On Thu, 2026-01-08 at 21:46 -0600, Anirudh Srinivasan wrote:
> Hello all,
>=20
> I recently got this ASUS IPMI Card [1], which is a PCIe x1 card with
> an AST2600 on it. It provides VGA output for the host it's plugged
> into and has a NIC for IPMI access. Since this is just an Aspeed on a
> pcie card, it's probably lacking some of the additional bus
> connections between the BMC and CPU that you'd find on a normal server
> motherboard.
>=20
> The card has few=C2=A0 headers which can be plugged into the host to
> provide more functionality
>=20
> 1. USB 2.0 connector to the internal motherboard header that provides
> Keyboard/Mouse and virtual media
> 2. GPIO Pins for ATX Power Control,
> 3. Indicator LEDs
> 4. SPI for host bios flashing that talks to the motherboard via the
> TPM SPI header on motherboard
> 5. PSU SMBUS connector
> 6. Proprietary ASUS BMC connector present in few motherboards
> 7. 4 pin FAN connectors
> 8. Temperature sensor connectors
>=20
> I also found a UART header on the card, and I'm able to get serial
> console access to the Aspeed chip.
>=20
> I've been trying to write a device tree for this card and get an
> OpenBMC image running on it. I have been basing this off DTs extracted
> from a fw update for this card available on Asus's website [2]. This
> firmware image is bootable in qemu. This seems to use kernel 5.4 and
> u-boot 2019.04. The DTs extracted from this firmware are here (uboot
> DT [3] linux DT [4]). These DTs have something weird in them. Even
> though the card only has one NIC on it (mac2), but mac3 also seems to
> be enabled in 100M mode. Is the 2nd mac related to the USB/rndis
> interface the BMC provides?

I'd be surprised. 100M mode might indicate an NC-SI configuration.

>=20
> Anyway, I got a build of OpenBMC up and running after a lot of trial
> and error. I didn't have the hace enabled in the u-boot device tree,
> so u-boot kept failing at the fitImage sha verification stage.
>=20

So this was fixed by enabling the HACE in the devicetree?

>  I also
> ended up wiping the u-boot data partition that stores the ethernet MAC
> address for the NIC, so I had to manually add that in to u-boot (is
> this how the ethernet MAC is programmed or is it read from the chip?).

It varies. Storing the MAC address in the u-boot environment isn't
uncommon.

>=20
> I have USB Keyboard/Mouse and Video at 1024x768 working (albeit the
> screen refreshes slowly sometimes) in my OpenBMC build. In my DT, I
> have video_engine enabled. Do I need to enable gfx also? Is that
> referring to video output from the aspeed (which we don't care about)
> or the host?
>=20

GFX is the video output from the BMC itself.

>  I have the heartbeat LED working, figuring out the rest
> of the LEDs and power control should be simple I guess. I was able to
> figure out some of the GPIO IDs by tracing writes to the aspeed_gpio
> device in qemu.

Nice.

>=20
> I tried to use virtual media to mount an image but nbd_client seems to
> crash with the following error message irrespective of how small of a
> file I upload.
>=20
> Jan 06 04:05:29 ipmi-card nbd_client[726]: Exported device is too big
> for me. Get 64-bit machine :-(
> Jan 06 04:05:29 ipmi-card nbd_client[726]: Exiting.
> Jan 06 04:05:29 ipmi-card bmcweb[284]: [vm_websocket.hpp:155] Couldn't
> read from VM port: End of file [asio.misc:2 at
> /usr/include/boost/asio/detail/descriptor_read_op.hpp:122:5 in
> function 'static void
> boost::asio::detail::descriptor_read_op<MutableBufferSequence,
> Handler, IoExecutor>::do_complete(void*,
> boost::asio::detail::operation*, const boost::system::error_code&,
> std::size_t)']
>=20
> I wanted to know if there are any additional devices I could try
> enabling in the device tree to get more functionality on the card. I
> understand that some functionality won't be possible because this is
> just a PCIe card and doesn't have additional connections to the host
> CPU that a normal BMC would have. I see mentions of LPC, IBT, KCS in
> the device tree, but am not really sure if any of these apply in this
> case.

What motherboard are you plugging the card into? The card's user manual
suggests there are alternative firmwares for ASUS motherboards that
integrate with the card (section 2.3). If you have both (an ASUS
motherboard and appropriate host firmware) then it may be sensible to
enable some of these devices.

>=20
> On the vendor firmware, an additional pcie device (other than the VGA
> controller) appears on the host the card is plugged into
>=20
> 09:01.0 IPMI Interface: ASPEED Technology, Inc. Device 2402 (rev 01)
> (prog-if 01 [KCS])
> =C2=A0=C2=A0=C2=A0 Subsystem: ASPEED Technology, Inc. Device 2402
> =C2=A0=C2=A0=C2=A0 Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGAS=
noop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
> =C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmed=
ium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
> =C2=A0=C2=A0=C2=A0 IOMMU group: 13
> =C2=A0=C2=A0=C2=A0 Region 0: Memory at fc000000 (32-bit, non-prefetchable=
) [size=3D1M]
> =C2=A0=C2=A0=C2=A0 Region 1: Memory at fc100000 (32-bit, non-prefetchable=
) [size=3D256K]
> =C2=A0=C2=A0=C2=A0 Capabilities: [40] Power Management version 3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: PMEClk- DSI- D1+ D2+ Au=
xCurrent=3D375mA
> PME(D0+,D1+,D2+,D3hot+,D3cold+)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: D0 NoSoftRst- PME-Enab=
le- DSel=3D0 DScale=3D0 PME-
> =C2=A0=C2=A0=C2=A0 Capabilities: [50] MSI: Enable- Count=3D1/32 Maskable-=
 64bit+
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Address: 0000000000000000=C2=
=A0 Data: 0000
> =C2=A0=C2=A0=C2=A0 Kernel modules: ipmi_si
>=20
> However, on 2 systems I've tried, the ipmi_smi module fails to probe
> for this device.
>=20
> [=C2=A0=C2=A0 13.118009] IPMI message handler: version 39.2
> [=C2=A0=C2=A0 13.122585] ipmi device interface
> [=C2=A0=C2=A0 13.133364] ipmi_si: IPMI System Interface driver
> [=C2=A0=C2=A0 13.133407] ipmi_si 0000:09:01.0: probing via PCI
> [=C2=A0=C2=A0 13.133452] ipmi_si 0000:09:01.0: enabling device (0000 -> 0=
002)
> [=C2=A0=C2=A0 13.133506] ipmi_si 0000:09:01.0: Could not setup I/O space
> [=C2=A0=C2=A0 13.133508] ipmi_si 0000:09:01.0: [mem 0xfc000000-0xfc0fffff=
]
> regsize 1 spacing 1 irq 0
> [=C2=A0=C2=A0 13.133512] ipmi_si: Adding PCI-specified kcs state machine
> [=C2=A0=C2=A0 13.133531] ipmi_si: Trying PCI-specified kcs state machine =
at mem
> address 0xfc000000, slave address 0x0, irq 0
> [=C2=A0=C2=A0 13.133572] ipmi_si 0000:09:01.0: Interface detection failed

Possibly this is a result of not enabling the devices discussed above
(along with the necessary PCIe bridge settings).

>=20
> Some searching online [5] shows that this functionality might only
> work for certain Asus motherboards with a BIOS that specifically
> supports this functionality.=C2=A0 The vendor DT has a special
> bmc_dev@1e7e0000 of type "aspeed,ast2600-bmc-device". This doesn't
> seem to be supported upstream.
>  I see it in Aspeed's kernel fork on
> github [6]. I am guessing this is what provides the pcie ipmi device.

One of the important bits there is enabling
SCU_PCIE_CONF_BMC_DEV_EN_E2L, which exposes the LPC peripherals such as
KCS and UARTs over PCIe. I expect that will help with the ipmi_si
errors above.

Note that these can also be enabled on the VGA device though there's
probably a question of whether the pieces are in place on the host-side
to support that.

Andrew

