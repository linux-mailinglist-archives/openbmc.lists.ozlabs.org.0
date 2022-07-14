Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41850575254
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 17:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkK0t0xBzz3c6H
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 01:58:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BwShvXz9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BwShvXz9;
	dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkK0Q6r7cz3bqx
	for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 01:58:29 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id j27so1761018qtv.4
        for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKjSDaASOp/RchctZuK5AN5Im+GhBKuH+/4alnGxDhY=;
        b=BwShvXz9mQa49o9/lZLTY/H2UFWczTi9Y+lEo4tAELLZn5yP2dJ30/PeMVJh9lOVfF
         VzFsv5mOruu+D+Aa9bSBXJYCz71TReguCJPKjOzx5qngCD1gd2LIp+8wd/SYwU4S9KhC
         OE2Orc03RCAoIbjoOITXk2z2CMt0gdjkUCEg2ttVLn78HeQAvwlSZTWrzabRV9TUUk1C
         alwH540WMO4Lh+x99HQVfF2l5GqXC9HJ7l+61WEFpGq5+bwBdynnFDCjGFYwiwIGMaZe
         Zyeg5/HHnSNedCcGAgKhlTTo9QZzRUfaTaEQdpYMvZPdreSoJtDj/ArmmFd8e4CRcgPK
         Cd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKjSDaASOp/RchctZuK5AN5Im+GhBKuH+/4alnGxDhY=;
        b=PkPNTJ3sUicg76YJmgkHYJ0ZWAgLatdobLxQKeKrVlhNflN5YMzJeYXKXD9+zbE1+2
         DYt/REjkhImEEbcBOtwkyLRmhs4OAtTc0E2agFxxeHS4kxAUfvRi6dgfaBqLyoP7G8NM
         Q50jjbD8VuwJg/U1MYPPxCVDJcCFkjBY0D0PaAi5J99m+v7PEJ0OKVp1ztzMUvfh8fmp
         sge4ZuT+LhDrOA4WN4IJHEMxcGeVaCMfU8ccAzyqXR+l820VcRQU9U2O/Z0x4rPFEpmt
         zMk/if1cRpKpkS/ET7Kv9FgriIYFTFZ84Rg0+M6hCv0C9qLum0hbXxax9cA3R3OhVFp8
         kqxg==
X-Gm-Message-State: AJIora+u0tIFkPf2CoytuaZ7CBrPK9Jkgvzmzs7W4JvedfSoVaCulCLT
	/13NR4ZbQllujCrgfIdXQaodq3LNjS03K+bnMqyxyg==
X-Google-Smtp-Source: AGRyM1u4gVc/4ygCT0Wg7Irs4dvSl/ULuZNafRw+xECmfFg+HjX77ybD55h+fZPa7GNtoOC5Cj2z4Kv3GeykeHv869E=
X-Received: by 2002:ac8:7f10:0:b0:31e:a262:25bf with SMTP id
 f16-20020ac87f10000000b0031ea26225bfmr8768972qtk.590.1657814303248; Thu, 14
 Jul 2022 08:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514B0E05D21D8F96A11EDB2DC899@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CAHwn2X=5L2uSgYBnbpC-trK1Tw-+chnwXd19WBiSd_9-vbwe=Q@mail.gmail.com>
 <CALGRKGM5o1S2G+qcd-Npmp3N+ESLAzhxb7rUFb8cwwgkfN8Tng@mail.gmail.com> <DM6PR08MB5514BE54A6F41DF8F621DFDEDC889@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514BE54A6F41DF8F621DFDEDC889@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Thu, 14 Jul 2022 08:58:12 -0700
Message-ID: <CALGRKGMe7cNLxTrf0On1b2cFFLWWxR5sdexJj8t8pJ=eMf0fWA@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: Question about in-band update of BMC firmware
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
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
Cc: "chris6906@gmail.com" <chris6906@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, William Kennington <wak@google.com>, Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chris,

I'm unfortunately not familiar with the BIOS side of things - but I
just know that we worked with the BIOS engineers to "reserve" some
space at an arbitrary location for this MMIO and enable some flag to
mark this as a shared location. To check if it works, I would
encourage you use a mem write to the memory from the BIOS to the
shared region to verify the change can be read back from the BIOS +
BMC. To do this manually, you may also have to look through the
Intel's PCH documentation regarding eSPI or LPC - and set the
registers up using setpci commands (this should be done automatically
by the burn_my_bmc tool).

Looking through our internal codebase, we have not tested with Aspeed
LPC in a very long time so it's also possible that there were some
regression introduced, if you were able to successfully do a manual
write to this shared region.

Thanks,
Brandon

On Thu, Jul 14, 2022 at 4:39 AM Chris Chen (TPI) <Chris.Chen3@flex.com> wro=
te:
>
> Hi Brandon and Willy,
>
> The host platform I'm using is Intel eagle stream with Aspeed 2600-A1.
>
> I am able to read/write to the dram memory on the BMC 0x98000000. Here is=
 my result.
> =3D=3D=3D=3D=3D
> root@hudsonbay-obmc:~# devmem 0x98000000 32
> 0xFFFFFFFF
> root@hudsonbay-obmc:~# devmem 0x98000000 32 0x55AA66BB
> root@hudsonbay-obmc:~#
> root@hudsonbay-obmc:~# devmem 0x98000000 32
> 0x55AA66BB
> =3D=3D=3D=3D=3D
>
> In addition, I found the "bmc-image" and "bmc.sig" files are with part of=
 0x55AA66BB after I finished the upper commands. It looks like that LPC/eSP=
I MMIO is not working in my case as you mentioned. So I am thinking is it p=
ossible that you could share how to set BIOS with me?
>
> Thank you.
>
> Regards,
> Chris Chen
>
> ________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B47=E6=9C=8814=E6=97=A5 =
=E4=B8=8A=E5=8D=88 12:45
> =E6=94=B6=E4=BB=B6=E8=80=85: Willy Tu <wltu@google.com>
> =E5=89=AF=E6=9C=AC: Chris Chen (TPI) <Chris.Chen3@flex.com>; William Kenn=
ington <wak@google.com>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org=
>; chris6906@gmail.com <chris6906@gmail.com>
> =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: Question about in-band upd=
ate of BMC firmware
>
> Hi Chris,
>
> The region you choose on both the BMC and the BIOS IS important as the
> BMC and the BIOS usually has a dedicated address for such a shared
> MMIO. I am not a BIOS expert so I had to ask the BIOS team for the
> address that is dedicated for LPC / eSPI (if you plan on using LPC /
> eSPI) and had to refer to the BMC's datasheet for the region (I
> believe it's defaulted to the Nuvoton region currently). As Willy
> pointed out, my guess is that a manual write to the memory won't work
> for you.
>
> Which BMC are you using if you don't mind me asking? Nuvoton vs. Aspeed?
>
> Thanks,
> Brandon
>
> On Wed, Jul 13, 2022 at 9:40 AM Willy Tu <wltu@google.com> wrote:
> >
> > Hi Chris,
> >
> > I think you were able to set it up correctly. Can you check if you can =
read/write to the flash memory on the BMC 0x98000000? I am also wondering i=
f that address is correct  or not. Like if that address is mapped to the BM=
C's memory. I have hit an issue where the image transferred does not match =
because the BIOS didn't set that up properly. I am unsure how to set that u=
p.
> >
> > Willy Tu
> >
> > On Wed, Jul 13, 2022 at 1:15 AM Chris Chen (TPI) <Chris.Chen3@flex.com>=
 wrote:
> >>
> >> Hi Brandon and William,
> >>
> >>
> >>
> >> As you know, I have already built the "burn_my_bmc" on my Host (Eagle =
Stream with Aspeed 2600). I for now tried to use it to do the in-band updat=
e of BMC firmware, the debug messages of the "burn_my_bmc" look good and I =
also got "bmc-image" and "bmc.sig" file in the "/run/initramfs" and "/tmp" =
directory respectively via LPC data transfer mechanism on the BMC. However,=
 one thing is strange which is the content of the "bmcimage" and "bmc.sig" =
file are all 0xff. I think this should not be the normal case, perhaps I ma=
de a mistake. Following are my steps/changes on the Host-side and BMC-side,=
 could you please take a look at it, is there anything wrong? Or do you hav=
e any suggestions for enabling the feature? Thanks.
> >>
> >>
> >>
> >> Host-side
> >>
> >> =3D=3D=3D=3D=3D
> >>
> >> The e820 map of the Host system (just choose one area randomly, should=
 I need to reserve a specific area for this??)
> >> ####
> >> archer@archer-ArcherCityM:mtd.all$ sudo dmesg | grep e820
> >>
> >> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] =
usable
> >>
> >> [    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] =
usable
> >>
> >> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] =
reserved                   <-- choose this area.
> >>
> >> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006d8effff] =
usable
> >>
> >> [    0.000000] BIOS-e820: [mem 0x000000006d8f0000-0x000000006f9effff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x000000006f9f0000-0x00000000702effff] =
ACPI data
> >>
> >> [    0.000000] BIOS-e820: [mem 0x00000000702f0000-0x0000000072c2ffff] =
ACPI NVS
> >>
> >> [    0.000000] BIOS-e820: [mem 0x0000000072c30000-0x00000000777fefff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x00000000777ff000-0x00000000777fffff] =
usable
> >>
> >> [    0.000000] BIOS-e820: [mem 0x0000000077800000-0x000000008fffffff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] =
reserved
> >>
> >> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047fffffff] =
usable
> >>
> >> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=3D>=
 usable
> >>
> >> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=3D>=
 usable
> >>
> >> [    0.000022] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D>=
 reserved
> >>
> >> [    0.000027] e820: remove [mem 0x000a0000-0x000fffff] usable
> >>
> >> [    0.003943] e820: update [mem 0x80000000-0xffffffff] usable =3D=3D>=
 reserved
> >>
> >> [    0.017281] e820: update [mem 0x69d87000-0x69d87fff] usable =3D=3D>=
 reserved
> >>
> >> [    0.017300] e820: update [mem 0x686c6000-0x686c6fff] usable =3D=3D>=
 reserved
> >>
> >> [    5.045333] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
> >>
> >> [    5.045336] e820: reserve RAM buffer [mem 0x624a8018-0x63ffffff]
> >>
> >> [    5.045338] e820: reserve RAM buffer [mem 0x686c6000-0x6bffffff]
> >>
> >> [    5.045340] e820: reserve RAM buffer [mem 0x69d87000-0x6bffffff]
> >>
> >> [    5.045341] e820: reserve RAM buffer [mem 0x6d8f0000-0x6fffffff]
> >>
> >> [    5.045342] e820: reserve RAM buffer [mem 0x77800000-0x77ffffff]
> >>
> >> [   33.565052] systemd[1]: Mounting Mount unit for e820-bios, revision=
 9...
> >>
> >> [   33.702641] systemd[1]: Mounted Mount unit for e820-bios, revision =
9.
> >> ####
> >>
> >> The executed command and its result.
> >> ####
> >> archer@archer-ArcherCityM:mtd.all$ time sudo burn_my_bmc \
> >>                                                             --command =
update \
> >>
> >>                                                             --interfac=
e ipmilpc
> >>                                                             --image ./=
image-bmc \
> >>                                                             --sig ./im=
age-bmc.sig \
> >>                                                             --type ima=
ge \
> >>                                                             --address =
0x000a0000 \
> >>                                                             --length 0=
x10000
> >>
> >> Sending over the firmware image.
> >>
> >> sending writeMeta
> >>
> >> writemeta sent
> >>
> >> Progress: 100.00%
> >>
> >> Sending over the hash file.
> >>
> >> sending writeMeta
> >>
> >> writemeta sent
> >>
> >> Progress: 100.00%
> >>
> >> Opening the verification file
> >>
> >> Committing to /flash/verify to trigger service
> >>
> >> Calling stat on /flash/verify session to check status
> >>
> >> success
> >>
> >> succeeded
> >>
> >> Opening the update file
> >>
> >> Committing to /flash/update to trigger service
> >>
> >> Calling stat on /flash/update session to check status
> >>
> >> success
> >>
> >> succeeded
> >>
> >>
> >>
> >> real=E2=80=82=E2=80=820m17.616s
> >>
> >> user=E2=80=82=E2=80=820m0.046s
> >>
> >> sys=E2=80=82=E2=80=82=E2=80=820m0.147s
> >>
> >> ####
> >>
> >> =3D=3D=3D=3D=3D
> >>
> >>
> >>
> >> BMC-side
> >>
> >> =3D=3D=3D=3D=3D
> >>
> >> Code changes
> >>
> >> Add to install "phosphor-ipmi-flash" and "phosphor-ipmi-blobs" these t=
wo packages in packagegroup recipe.
> >>
> >> ####
> >> SUMMARY:${PN}-system =3D "Flex Ltd System"
> >>
> >> RDEPENDS:${PN}-system =3D " \
> >>
> >>         phosphor-ipmi-blobs \
> >>
> >>         phosphor-ipmi-flash \
> >>
> >>         "
> >>
> >> ####
> >>
> >> Add "phosphor-impi-flash_%.bbapend" recipe with these lines(Bold).
> >>
> >> ####
> >> SRCREV =3D "c277935e6fe0cdcf8aefc45b53d11bd6ca20f964"
> >>
> >>
> >>
> >> PACKAGECONFIG:append =3D " static-bmc"
> >>
> >> PACKAGECONFIG:append =3D " aspeed-lpc"
> >>
> >> PACKAGECONFIG:append =3D " reboot-update"
> >>
> >> IPMI_FLASH_BMC_ADDRESS =3D "0x98000000"
> >>
> >> ####
> >>
> >> Remove ",-Dupdate-type=3Dnone" in the phosphor-ipmi-flash_git.bb recip=
e as below, because the "Enabled Firmware Update Features" and "config-stat=
ic-bmc-reboot.json" are not be included. This seems the "update-type" would=
 always pass "none" to "phosphor-impi-flash" package without this change, b=
ut I'm not sure??
> >>
> >> ####
> >> PACKAGECONFIG[static-bmc] =3D "-Dupdate-type=3Dstatic-layout"
> >> ####
> >>
> >> Add these lines(Bold). in Kernel dts file
> >>
> >> ####
> >>
> >> reserved-memory {
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#addres=
s-cells =3D <1>;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#size-c=
ells =3D <1>;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ranges;
> >>
> >>
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82video_e=
ngine_memory: video {
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82size =3D <0x04000000>;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82alignment =3D <0x01000000>;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82compatible =3D "shared-dma-pool";
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82reusable;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};
> >>
> >>
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82/* LPC =
FW cycle bridge region requires natural alignment */
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82flash_m=
emory: region@98000000 {
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82no-map;
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82reg =3D <0x98000000 0x04000000>; /* =
64M */
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};
> >>
> >> };
> >>
> >> &lpc_ctrl {
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82status =3D "okay=
";
> >>
> >> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82memory-region =
=3D <&flash_memory>;
> >>
> >> };
> >>
> >> ####
> >>
> >> BMC console
> >>
> >> Manually modify "config-static-bmc-reboot.json" to skip "preparation",=
 "verification", and "update" actions because I want to make sure image fil=
e transfer is okay first.
> >> ####
> >> root@hudsonbay-obmc:~# cat /usr/share/phosphor-ipmi-flash/config-stati=
c-bmc-reboot.json
> >>
> >> [{
> >>
> >>         "blob": "/flash/image",
> >>
> >>         "handler": {
> >>
> >>                 "type": "file",
> >>
> >>                 "path": "/run/initramfs/bmc-image"
> >>
> >>         },
> >>
> >>         "actions": {
> >>
> >>                 "preparation": {
> >>
> >>                         "type": "skip"
> >>
> >>                 },
> >>
> >>                 "verification": {
> >>
> >>                         "type": "skip"
> >>
> >>                 },
> >>
> >>                 "update": {
> >>
> >>                         "type": "skip"
> >>
> >>                 }
> >>
> >>         }
> >>
> >> }]
> >> ####
> >>
> >> Create "/run/initramfs" directory manually.
> >> ####
> >> root@hudsonbay-obmc:~# mkdir /run/initramfs
> >>
> >> ####
> >>
> >> Result after executing burn_my_bmc command. (the content of bmc-image =
and bmc.sig are all 0xff)
> >> ####
> >>
> >> root@hudsonbay-obmc:~# ls -al /run/initramfs/bmc-image
> >> -rw-r--r--    1 root     root      67108864 Jan  1 01:47 /run/initramf=
s/bmc-image
> >>
> >> root@hudsonbay-obmc:~# hexdump -C /run/initramfs/bmc-image
> >>
> >> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |.........=
.......|
> >>
> >> *
> >>
> >> 04000000
> >>
> >> root@hudsonbay-obmc:~# ls -al /tmp/bmc.sig
> >>
> >> -rw-r--r--    1 root     root           128 Jan  1 01:47 /tmp/bmc.sig
> >>
> >> root@hudsonbay-obmc:~# hexdump -C /tmp/bmc.sig
> >>
> >> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |.........=
.......|
> >>
> >> *
> >>
> >> 00000080
> >> ####
> >>
> >> =3D=3D=3D=3D=3D
> >>
> >>
> >>
> >> Regards,
> >>
> >> Chris Chen
> >>
> >> Legal Disclaimer :
> >> The information contained in this message may be privileged and confid=
ential.
> >> It is intended to be read only by the individual or entity to whom it =
is addressed
> >> or by their designee. If the reader of this message is not the intende=
d recipient,
> >> you are on notice that any distribution of this message, in any form,
> >> is strictly prohibited. If you have received this message in error,
> >> please immediately notify the sender and delete or destroy any copy of=
 this message!
