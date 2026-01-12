Return-Path: <openbmc+bounces-1153-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4B7D1055F
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 03:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqGVZ6s5sz2yr4;
	Mon, 12 Jan 2026 13:27:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768184071;
	cv=none; b=LXEMGfHnvbv+w1W45DFVJQtn50zRvunEPW3SKn8Fn3BVFVb3lcRCgJRWx19WWd/0o+1V4lTmIoI2RG1hhFGeqoPCFMBHh8akgklwsPpBPHShmHb1PfFbz3kZJj9H6UPq21n1a3c0Lnm6446YwiaQruUfBY7QS9CTLFqy8SIplJc95cY/5gL6wCHdBtYuFvFugEG9Z65MOLVgTpxdhrf4S6jm9CJF2EEfouTAYuXwnulpBDhprqGZUjBc1neoPNEaaiT+zPbD1O4To5wGJTOMDeZRL7JH0JNsnIIq1rl6Jd0F9CbDN5CR9ENuDkUEAPrBnuyoxGNPBuSxlaVOwlHNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768184071; c=relaxed/relaxed;
	bh=0mfMgf+vlVnsdNU6ZakCr8fH7EsA6Lh+JpmoiFsiq88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9LOIe3oJj5AertiwhiNQkRk6eov9W7LyZg+J23VmGngpHbs12/gcWWVnRHtT4iBPm28KY8uXWvuj+25av4yvf8fAvvAsNKDihd6sm6wj3DeMqJdbCWeQrgbxCkMsBQZ9GGsRhjjq+yKeGqcxfz1eCGaG6dZU+PBoW5KMScTNC8pZZTL4UINE7Aikijquf1QHJVC7vbubscpKlzW+744ke7r7TFflXbEGFjbBlc5S+KUPVGykFvCvXXQuMf+Ni0HQvQChbv8oDgsE60EFtKLhDLXSgGnZ6qvY3H3HaGwvL1dTHcJFwyM0lPkJ7ZujWe9c8m8nwH+rUE6YJaBJzG2FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ykmqa/AM; dkim-atps=neutral; spf=pass (client-ip=74.125.82.49; helo=mail-dl1-f49.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ykmqa/AM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.82.49; helo=mail-dl1-f49.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqGCp2XvGz2ypw
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 13:14:29 +1100 (AEDT)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1205a8718afso6495103c88.0
        for <openbmc@lists.ozlabs.org>; Sun, 11 Jan 2026 18:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768184007; x=1768788807; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mfMgf+vlVnsdNU6ZakCr8fH7EsA6Lh+JpmoiFsiq88=;
        b=Ykmqa/AMvb1AD2VyN8w60qObDhq6TAhIBiSQeK6IBOuth06R6hKH86JJTblEqKIxYS
         htD0HNiOc/fLyqNHe492vm6CzN5nDYRyyRYJOqrBAKh9fnB8/S2ACvlaikIPO0gSRlTX
         z2Q49y/TbsUwmmDP9T4OWunAleI9OpP97c771XQasXTKlS9nGnuno7VtXMwE6lJ4p6S9
         sf3tunoYoHXrCOjQ+CUZC1sC8TnpAG0zKUiTSWj5eZ6uCT6KKdYrPe0tTCH4UoM+II6q
         3w/LO+0ll7sZH4cHILOZOjaYTyWqCJkIuC0eGl2D6AbwZxo3DLGFYCPPFdN2HS8YDJne
         D5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768184007; x=1768788807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0mfMgf+vlVnsdNU6ZakCr8fH7EsA6Lh+JpmoiFsiq88=;
        b=gk4hnmDTJwF8cvnBK0/yPCwjfOlLishuKrA311ukXo2i8qQpANz6kB3dkBzgLDazco
         xKRSma9aP3JBa1MxEEkFEMdymHlDtDOespRw4U7jg8eqkK8Oo7I0BmRVESjA/Z8Jdz54
         AbBCye4BL3WbqkTl90t2ZUA+CQluKq0ec9tYCh4N/LecSvI5rVbW3F61GF0TlNdhaNOU
         lsgYqgL0IcUV7sin4hOhjmrSMcrALUsAoZka7XNZzr7Y/ZWrTSvyGOGxqZhxdr6eIhIS
         srA3aIRPQI7KgiHUTsNogOanUs9svhLkx3Dn9I86D4owGLO9ZwnyQ4+zsyUweO29kEsU
         QhQA==
X-Gm-Message-State: AOJu0YxtsqsXiIgRIPnagh6H3a5uOpthdr5E97uRPCj7wxNGSl2fBs4B
	bgZ/XYO1qFk3splNHOrcn/wdBykxv9zwYJyCx1k+zYVClRbfK2gWN5HKE0P7qTltFE0mr136tNo
	Pb/8plxSqj/jO/IzBzpZbAtC6ADy5rWDbRf65j7M=
X-Gm-Gg: AY/fxX69EsmunSO/PSo0AzLHkbPZkO7d/M6oTNYVYt6cTkubYumwLq9SvCF9I/g3PKx
	Yd4i5TzK3CYF+9hWRAsw3KJZrYyqWe0XWaopn8z7fz9RQbfCAJJyg9xvgWS0wBpBDrlc5znyOTt
	RVnaZoWSRFTJCPkd/WkBUT1RO0DCsHllZujdQzEr1j1MEZ+lCO2kQBBmmcjKIhLS8R5QdY1XRpz
	jHsUosn/epX0brReS9G/LklN/ECetURv0DFGDB3zXdlzT3401Vnb2GHvzmjElesvprf1iCWrwSp
	HaWk9ztA
X-Google-Smtp-Source: AGHT+IErPvfWgjrfgVjrODs4lFd+l4+7xXSpyOL691EFbQIeJVEjjRDs3vvl5CEyI14kJ/RQwdfwCj0r9Q/aauHfQws=
X-Received: by 2002:a05:7022:620:b0:11b:a73b:2327 with SMTP id
 a92af1059eb24-121f8b7b38dmr15149879c88.30.1768184006546; Sun, 11 Jan 2026
 18:13:26 -0800 (PST)
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
References: <CAJ13v3T_jymYQyvrf0AtB_H-zjc0aU5GduhsywWkpS8p1nFR6g@mail.gmail.com>
 <c0bffe81fc734045909a98f8e820a62896ade172.camel@codeconstruct.com.au>
In-Reply-To: <c0bffe81fc734045909a98f8e820a62896ade172.camel@codeconstruct.com.au>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sun, 11 Jan 2026 20:13:14 -0600
X-Gm-Features: AZwV_QjV0hPQlvhFJSC9uP1XVQ9OJipifAGbKJY3W4ywwDBvLanvIzIlO_wk2Lg
Message-ID: <CAJ13v3SHBYCGZSkYGM0sbotw8E9d-BhA8=11e=kn1m2bLkMwnw@mail.gmail.com>
Subject: Re: Support for Asus IPMI Card
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew,

Thanks for your response.

On Sun, Jan 11, 2026 at 6:25=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> I'd be surprised. 100M mode might indicate an NC-SI configuration.

Yeah not sure what's going on here. On the vendor fw, I see a usb0 nic
on the host and the aspeed, but I don't see it on my openbmc (with
this 100M phy disabled). Maybe something worth trying to enable.

> > Anyway, I got a build of OpenBMC up and running after a lot of trial
> > and error. I didn't have the hace enabled in the u-boot device tree,
> > so u-boot kept failing at the fitImage sha verification stage.
> >
>
> So this was fixed by enabling the HACE in the devicetree?

Yes, in the u-boot DT. It's disabled by default in the .dtsi.

> >  I also
> > ended up wiping the u-boot data partition that stores the ethernet MAC
> > address for the NIC, so I had to manually add that in to u-boot (is
> > this how the ethernet MAC is programmed or is it read from the chip?).
>
> It varies. Storing the MAC address in the u-boot environment isn't
> uncommon.

I see that some other Aspeed DTs read the ethernet MAC from an EEPROM.
When I reflashed vendor fw on my card by rewriting the whole flash
chip (that should have wiped any MAC stored in u-boot), vendor u-boot
seemed to pick up the correct ethernet MAC somehow. So this
information is stored somewhere.


> What motherboard are you plugging the card into? The card's user manual
> suggests there are alternative firmwares for ASUS motherboards that
> integrate with the card (section 2.3). If you have both (an ASUS
> motherboard and appropriate host firmware) then it may be sensible to
> enable some of these devices.

I have an older Asus motherboard that doesn't have the BMC header and
isn't on their supported list. Based on their support list, only
"higher end" models seem to have this functionality.

> > On the vendor firmware, an additional pcie device (other than the VGA
> > controller) appears on the host the card is plugged into
> >
> > 09:01.0 IPMI Interface: ASPEED Technology, Inc. Device 2402 (rev 01)
> > (prog-if 01 [KCS])
> >     Subsystem: ASPEED Technology, Inc. Device 2402
> >     Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx-
> >     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort-
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >     IOMMU group: 13
> >     Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=3D1M]
> >     Region 1: Memory at fc100000 (32-bit, non-prefetchable) [size=3D256=
K]
> >     Capabilities: [40] Power Management version 3
> >         Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA
> > PME(D0+,D1+,D2+,D3hot+,D3cold+)
> >         Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
> >     Capabilities: [50] MSI: Enable- Count=3D1/32 Maskable- 64bit+
> >         Address: 0000000000000000  Data: 0000
> >     Kernel modules: ipmi_si
> >
> > However, on 2 systems I've tried, the ipmi_smi module fails to probe
> > for this device.
> >
> > [   13.118009] IPMI message handler: version 39.2
> > [   13.122585] ipmi device interface
> > [   13.133364] ipmi_si: IPMI System Interface driver
> > [   13.133407] ipmi_si 0000:09:01.0: probing via PCI
> > [   13.133452] ipmi_si 0000:09:01.0: enabling device (0000 -> 0002)
> > [   13.133506] ipmi_si 0000:09:01.0: Could not setup I/O space
> > [   13.133508] ipmi_si 0000:09:01.0: [mem 0xfc000000-0xfc0fffff]
> > regsize 1 spacing 1 irq 0
> > [   13.133512] ipmi_si: Adding PCI-specified kcs state machine
> > [   13.133531] ipmi_si: Trying PCI-specified kcs state machine at mem
> > address 0xfc000000, slave address 0x0, irq 0
> > [   13.133572] ipmi_si 0000:09:01.0: Interface detection failed
>
> Possibly this is a result of not enabling the devices discussed above
> (along with the necessary PCIe bridge settings).

I should clarify, these errors (on the host) are from the vendor fw,
not from openbmc.

> > Some searching online [5] shows that this functionality might only
> > work for certain Asus motherboards with a BIOS that specifically
> > supports this functionality.  The vendor DT has a special
> > bmc_dev@1e7e0000 of type "aspeed,ast2600-bmc-device". This doesn't
> > seem to be supported upstream.
> >  I see it in Aspeed's kernel fork on
> > github [6]. I am guessing this is what provides the pcie ipmi device.
>
> One of the important bits there is enabling
> SCU_PCIE_CONF_BMC_DEV_EN_E2L, which exposes the LPC peripherals such as
> KCS and UARTs over PCIe. I expect that will help with the ipmi_si
> errors above.
>
> Note that these can also be enabled on the VGA device though there's
> probably a question of whether the pieces are in place on the host-side
> to support that.

Since the ipmi device is failing to probe (on the host) even on the
vendor fw, I don't have hopes of getting it working easily on openbmc.
I will try your suggestions and report back if I have any luck.

If this device just requires a custom bios on the host to expose some
additional info over pcie (and doesn't require the BMC header
connection), maybe passing the card through to a VM with a custom edk2
build might make it work. But this seems like a bit of a long shot.

Regards
Anirudh Srinivasan

