Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0629CD07
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 02:39:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWSl641xzDqJf
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 12:39:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=hurricos@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GqBU7Y7A; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLVpK1tvWzDqCF
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 12:09:08 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 32so2872796otm.3
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fH9wa7jE+/84vmgbT6fY2OnBB7d3DKRWPWcip4DBgI0=;
 b=GqBU7Y7Ag+n8ieFcDfQf5JXkLkIrjPvtOh44N0dowMLRubvT2+wwb0vun28JL+6ruK
 bsx736/v9SIdn6Z4dfZ78kvn/zkCjXN49BKSvFx0L/E8ZQ3zlE4NoX8PmbpDdNPx1xS2
 T/OJq279Ff9p3uzIgwBWHr7HjX2jw9FAZWAxO3vRyF1cck83+3oUSFbNOlvo4WZ0Ribs
 gVS1MApPlNnXRHPhFdpqFMfR11k4bA1YhKXUSQiobiPTJR7G0vFqMVs4aZHLXofYrIW/
 nvfnBAzPtNYwyoi5ujeGKDOTYLi0vQBsMJx2AWyjIHeycblFZBjs9eoOQNvSGHJrOuNN
 K7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fH9wa7jE+/84vmgbT6fY2OnBB7d3DKRWPWcip4DBgI0=;
 b=kfFMEsSHcYEcm14FKSSe4UtqifBOTL7VauOF3sRzM6OWGSK5cGWVIXVj0RrMrrEbXM
 Vk4GPVfp1cmxGw2+QqtFkZkI8/DGZiz03tymLCd+Qe8VYvlvmfpEjPSqz8ZHUI5YbK9j
 Gza+59r6zVP+PVzbE3g4ulPL1FsrQXIJC4OY7a0KX0HaRHfKlo+frBNU7LV0wXAqsQql
 PRdrQ+WC1gQnsNSooHmqXh+1MasNav7Z86ghQqI4kXjzP95aeEIFJiTN65B0fspasqdq
 KkmvzJSqEQ7g/7f2xUzPPzudeowCY/M8HBa55FuijoNrIvKw21WV51Uy7tmN+VNeKn/L
 GGag==
X-Gm-Message-State: AOAM530HkSHBDNgP2l/tKynhUxxb3AFkbnrDdyZhtgPk0fnm+tkFrqeN
 ciDqCQ1UBnPBmPgsa85HlJVU1R2edB2HShEe4R5YXsmju3k=
X-Google-Smtp-Source: ABdhPJyAN0XV/roJVw/GYq23oB562mkwsB2uXxYAHu8kDfW/dIuz8GCdnVHt/CuXe1Ar+2ce3SqaovMM2XORlIOGd08=
X-Received: by 2002:a05:6830:30ac:: with SMTP id
 g12mr3459744ots.162.1603847344413; 
 Tue, 27 Oct 2020 18:09:04 -0700 (PDT)
MIME-Version: 1.0
From: Martin Kennedy <hurricos@gmail.com>
Date: Tue, 27 Oct 2020 21:08:53 -0400
Message-ID: <CANA18UzcV-ufR1aCwOUNC8XEfLo7dCCNyqVgWV0dcimCZHVjkQ@mail.gmail.com>
Subject: Re: Nuvoton WPCM450 Support
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:30:19 +1100
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

Hi there,

I'm an owner of a few SuperMicro X8DTT-Fs and want to chime in about
porting the WPCM450.

I've looked across the rear of the X8DTT-F's board for flash storage,
as I had a sense that storage would be the main blocker for OpenBMC. I
thought I had confirmed the only flash to be MX25L3205D (which is
limited to 16Mb or 32Mb), but there appears to be a 16-pin MXIC NOR
flash part on the bottom of the board (purple dot:
https://images-na.ssl-images-amazon.com/images/I/91icJZ0iL2L._AC_SL1500_.jpg;
green dot: https://sps24.eu/eng_pl_New-server-motherboard-Acer-Gateway-GW2000h-GW170HQ-F1-GW170hd-F1-X8DTT-HIBQF-4543_2.jpg)

The bad news: OpenBMC probably won't fit.

A quick `grep -r -e FLASH_SIZE` through
https://github.com/openbmc/openbmc suggests OpenBMC relies on 32768KB
or more. I went to go find out how much flash my WPCM450 was attached
to, which I expect to be usually how much it is attached to given only
two vendors (AMI and ATEN) provide IPMI firmware for it as far as I
know.

Because I did not want to bother unscrewing my blade board from its
chassis, I downloaded the IPMI firmware update for it from here:
https://www.thomas-krenn.com/en/download.html?product=7943

After unzipping the archive, the IPMI firmware file X8DTT303.ima is
16MB, so at least on my X8DTT-F, the NOR flash for the WPCM450 is
likely to be 16MB. Based on a binwalk -E of the firmware file, only
about half of the storage is actually used, which suggests there
probably aren't any BMC implementations of the WPCM450 with more than
16MB of NOR attached, unless I'm quite mistaken and the BMC keeps two
copies of the firmware on 32MB of NOR flash (again, I haven't pulled
my board out to check and don't intend to do so unless I have a reason
to start hacking).

If the flash is only 16MB, OpenBMC will simply not fit, as mentioned
back in 2016 by someone working on a (long-since discontinued) OpenWrt
port of OpenBMC:
https://lists.ozlabs.org/pipermail/openbmc/2016-August/004402.html

The good news: we have many resources.

I thought it would be great if we could find out what GPL resources
were found the only other source of discussion on the WPCM450 on this
mailing list: https://lists.ozlabs.org/pipermail/openbmc/2020-May/021893.html
-- after seeing that, I went and looked, and found GPL sources:
https://www.thomas-krenn.com/en/wiki/GPL_Notes_for_IPMI_Firmware_Images.
The linked ftp://ftp.supermicro.nl/GPL/AMI/ is down, but
ftp://ftp.supermicro.org.cn/ seems to work. The tarball under GPL/AMI/
indicates the WPCM450 uses an ARM926EJS ARM9 core, which has support
by OpenWrt on mainline Linux -- a triumph!
https://openwrt.org/docs/techref/instructionset/arm_arm926ej-s?s[]=arm926ejs
-- but again, that's not useful for OpenBMC which has different
storage requirements.

Someone has tried to build the firmware from source here:
https://github.com/devicenull/supermicro_ipmi_firmware (the X9 series
also uses WPCM450, though I believe this is the ATEN version of the
firmware being built, not the AMI one).

A binwalk of the firmware for my X8DTT's IPMI solution shows it is
running "Linux-2.6.24-ami" with "U-Boot 1.1.4 (Apr 29 2014 -
17:54:14)" (downloaded, again, from
https://www.thomas-krenn.com/en/download.html?product=7943).

My two cents:

Perhaps OpenBMC can be stripped down to fit on 16MB? I don't see much
discussion on this in the mailing list, so I doubt it.

Perhaps OpenBMC could be loaded upon each boot over tftpboot? The
Hynix HY5PS1G1631C is 128MB of DDR2, so there's enough storage for an
initramfs-based system. This introduces vulnerability concerns, but
would trivialize updates.

Perhaps most of its services could be reimplemented on top of OpenWrt
in an OpenWrt port of OpenBMC?
https://github.com/ya-mouse/openbmc-target was the one example I saw.
I doubt I will be able to have any impact on this, and I doubt it will
happen given the state of that example. However, OpenWrt does offer a
viable development platform.

Please note that I am a novice and have exactly zero experience
porting OpenBMC; I just learned about it today. I have some background
porting Atheros MIPS-based boards to OpenWrt. I do wish I could put
OpenBMC on my hardware, but it seems like OpenBMC has moved on past
the 16MB line. I also wish OpenBMC's services could be implemented on
top of OpenWrt, but I highly doubt this will be feasible.

I do, however, have a Pomona 24-pin clip to back up and reflash the
16-pin NOR if I end up going down that route.

Here are some other folks interested in the chip (as mentioned, none
have made progress porting it to OpenBMC):

https://michael.stapelberg.ch/posts/2014-01-27-supermicro_ipmi_openvpn/
(Root shell, note that the SuperMicro X9SCL-F also uses the WPCM450)

https://github.com/Keno/bmcnonsense

https://github.com/openbmc/openbmc/issues/3438

Here's some more documentation:

http://download.viglen.co.uk/files/High_Performance_Computing/PreviousGenerationHW/HX425Hi/Manual/viglen_embedded_BMC_IPMI.pdf

That's all I have. I'm not planning on quitting my dayjob to port
this, but I'd be interested in at least attempting it. I do seriously
worry that it will be impossible to integrate into OpenBMC due to the
storage constraint I suspect is common among WPCM450 implementations.
Perhaps there's a way to get around it if at least one of the USB
ports are routed through the BMC?

- Martin
