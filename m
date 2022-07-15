Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228B576487
	for <lists+openbmc@lfdr.de>; Fri, 15 Jul 2022 17:37:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkwTB3K1Gz3c75
	for <lists+openbmc@lfdr.de>; Sat, 16 Jul 2022 01:37:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pw2c5yRl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pw2c5yRl;
	dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkwSn28Zdz3c1c
	for <openbmc@lists.ozlabs.org>; Sat, 16 Jul 2022 01:36:40 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id g9so3932559qvq.7
        for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2022 08:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3GudFec2PSI8NRqfjVFj/f6oYNQQh2mVFhP32pW0rB4=;
        b=pw2c5yRlAt5DDhZ/mGksBIn9XGB9SjctqCDmvoh9KMlG+Zff1HwVy5yTB9jYkVV468
         7YG/cifwq440B+1o3ct5Gp+JFzrgH53UJSbK+9Ed3T+7c+P2/n3mpu3tccHWQWvzfp0r
         YpckE3mQLBpWh0E7iRvK6e5v+OU8Zdd9auJXnkkNovieBz3QnxVeRwmXamL0AxmNpEKZ
         SmZiWSWo4mdQSUx/Ib7aZ4QalbeatA+rT9Q2x6dPmu6MA/iD9vtttJ9lWs9u4aFoBuPZ
         dBckD+W4rHRAxSOq/ZGABmn0rblgkDFnkGt9i2fRH6tJ3hQRaGg32qjsYKk3YQDNPzQg
         Jd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3GudFec2PSI8NRqfjVFj/f6oYNQQh2mVFhP32pW0rB4=;
        b=RZztxWn2TWHjlLXSRMnxsqjE+uPwu8X31dRRE1ood6uW6/8dQokfSNrsbYGyc9Ieni
         BT/a9t262SUIWjHenib1CEsLN9Hn5J0gmoo8Z+vovXz9iKme9qheWy4QJ/OHuHmHwtzi
         ku7NuFUp+nilIhqEEBiLHH9auwxPsiLIh1DZ7bvXPppqcQce/VM+GjOw0dkIU8HC+UNE
         uSbrYAtn4JwulHaeYpeGpgVEjmPOwY14tbCIShzzC+Xsup2U57GqDIMsN7ZH2Rrnf7Pf
         BluC4SNJmXuWBsDWO7wTjIymhZ02lQmxSGLWC445oeKr2+R+n2oWNHieV7h36q1xJWrX
         odAw==
X-Gm-Message-State: AJIora+epLo6fAZepOLCb63fX4kY22LytqFqWGJE9nq1i2KQRrcGUDws
	c3lIM8e0Kefgveuutfy3hcnCTwFikQaVZnDrfuEnTA==
X-Google-Smtp-Source: AGRyM1uBYFtM6BPRgzZg+QfThjZi9whDHXLeNPqP5ctVLupHFlPMERm+3uldowhisn2EHBEw/QzlpwbKIWf+EtwYVA8=
X-Received: by 2002:ad4:57ae:0:b0:473:8181:b484 with SMTP id
 g14-20020ad457ae000000b004738181b484mr12481309qvx.82.1657899395006; Fri, 15
 Jul 2022 08:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514B0E05D21D8F96A11EDB2DC899@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CAHwn2X=5L2uSgYBnbpC-trK1Tw-+chnwXd19WBiSd_9-vbwe=Q@mail.gmail.com>
 <CALGRKGM5o1S2G+qcd-Npmp3N+ESLAzhxb7rUFb8cwwgkfN8Tng@mail.gmail.com>
 <DM6PR08MB5514BE54A6F41DF8F621DFDEDC889@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGMe7cNLxTrf0On1b2cFFLWWxR5sdexJj8t8pJ=eMf0fWA@mail.gmail.com> <DM6PR08MB5514B0979322C3C07F8A3A9BDC8B9@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514B0979322C3C07F8A3A9BDC8B9@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Brandon Kim <brandonkim@google.com>
Date: Fri, 15 Jul 2022 08:36:24 -0700
Message-ID: <CALGRKGMmurcQO-1Q3Va=Bu6KGX_oYpJwB2RWU708kU4oQqEa2A@mail.gmail.com>
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

The network connection is actually referring to the BMC to host
in-band network so no network port on the motherboard is necessary as
long as there is a suitable network connection between the 2.

Thanks,
Brandon

On Thu, Jul 14, 2022 at 11:25 PM Chris Chen (TPI) <Chris.Chen3@flex.com> wr=
ote:
>
> Hi Brandon,
>
> Understood. Thank you for the information.
>
> Just one more question would like to confirm with you, the README.md in t=
he phosphor-ipmi-flash repo mentioned using net data transfer mechanism, th=
is is not an in-band update, it is through the network connection, that mea=
ns I can't use it if there is no network port on the motherboard, am I corr=
ect?
>
> Regards,
> Chris Chen
>
> -----Original Message-----
> From: Brandon Kim <brandonkim@google.com>
> Sent: Thursday, July 14, 2022 11:58 PM
> To: Chris Chen (TPI) <Chris.Chen3@flex.com>
> Cc: Willy Tu <wltu@google.com>; William Kennington <wak@google.com>; open=
bmc@lists.ozlabs.org; chris6906@gmail.com
> Subject: Re: [phosphor-ipmi-flash]: Question about in-band update of BMC =
firmware
>
> Hi Chris,
>
> I'm unfortunately not familiar with the BIOS side of things - but I just =
know that we worked with the BIOS engineers to "reserve" some space at an a=
rbitrary location for this MMIO and enable some flag to mark this as a shar=
ed location. To check if it works, I would encourage you use a mem write to=
 the memory from the BIOS to the shared region to verify the change can be =
read back from the BIOS + BMC. To do this manually, you may also have to lo=
ok through the Intel's PCH documentation regarding eSPI or LPC - and set th=
e registers up using setpci commands (this should be done automatically by =
the burn_my_bmc tool).
>
> Looking through our internal codebase, we have not tested with Aspeed LPC=
 in a very long time so it's also possible that there were some regression =
introduced, if you were able to successfully do a manual write to this shar=
ed region.
>
> Thanks,
> Brandon
>
> On Thu, Jul 14, 2022 at 4:39 AM Chris Chen (TPI) <Chris.Chen3@flex.com> w=
rote:
> >
> > Hi Brandon and Willy,
> >
> > The host platform I'm using is Intel eagle stream with Aspeed 2600-A1.
> >
> > I am able to read/write to the dram memory on the BMC 0x98000000. Here =
is my result.
> > =3D=3D=3D=3D=3D
> > root@hudsonbay-obmc:~# devmem 0x98000000 32 0xFFFFFFFF
> > root@hudsonbay-obmc:~# devmem 0x98000000 32 0x55AA66BB
> > root@hudsonbay-obmc:~# root@hudsonbay-obmc:~# devmem 0x98000000 32
> > 0x55AA66BB =3D=3D=3D=3D=3D
> >
> > In addition, I found the "bmc-image" and "bmc.sig" files are with part =
of 0x55AA66BB after I finished the upper commands. It looks like that LPC/e=
SPI MMIO is not working in my case as you mentioned. So I am thinking is it=
 possible that you could share how to set BIOS with me?
> >
> > Thank you.
> >
> > Regards,
> > Chris Chen
> >
> > ________________________________
> > =E5=AF=84=E4=BB=B6=E8=80=85: Brandon Kim <brandonkim@google.com>
> > =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2022=E5=B9=B47=E6=9C=8814=E6=97=
=A5 =E4=B8=8A=E5=8D=88 12:45
> > =E6=94=B6=E4=BB=B6=E8=80=85: Willy Tu <wltu@google.com>
> > =E5=89=AF=E6=9C=AC: Chris Chen (TPI) <Chris.Chen3@flex.com>; William Ke=
nnington
> > <wak@google.com>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>;
> > chris6906@gmail.com <chris6906@gmail.com>
> > =E4=B8=BB=E6=97=A8: Re: [phosphor-ipmi-flash]: Question about in-band u=
pdate of BMC
> > firmware
> >
> > Hi Chris,
> >
> > The region you choose on both the BMC and the BIOS IS important as the
> > BMC and the BIOS usually has a dedicated address for such a shared
> > MMIO. I am not a BIOS expert so I had to ask the BIOS team for the
> > address that is dedicated for LPC / eSPI (if you plan on using LPC /
> > eSPI) and had to refer to the BMC's datasheet for the region (I
> > believe it's defaulted to the Nuvoton region currently). As Willy
> > pointed out, my guess is that a manual write to the memory won't work
> > for you.
> >
> > Which BMC are you using if you don't mind me asking? Nuvoton vs. Aspeed=
?
> >
> > Thanks,
> > Brandon
> >
> > On Wed, Jul 13, 2022 at 9:40 AM Willy Tu <wltu@google.com> wrote:
> > >
> > > Hi Chris,
> > >
> > > I think you were able to set it up correctly. Can you check if you ca=
n read/write to the flash memory on the BMC 0x98000000? I am also wondering=
 if that address is correct  or not. Like if that address is mapped to the =
BMC's memory. I have hit an issue where the image transferred does not matc=
h because the BIOS didn't set that up properly. I am unsure how to set that=
 up.
> > >
> > > Willy Tu
> > >
> > > On Wed, Jul 13, 2022 at 1:15 AM Chris Chen (TPI) <Chris.Chen3@flex.co=
m> wrote:
> > >>
> > >> Hi Brandon and William,
> > >>
> > >>
> > >>
> > >> As you know, I have already built the "burn_my_bmc" on my Host (Eagl=
e Stream with Aspeed 2600). I for now tried to use it to do the in-band upd=
ate of BMC firmware, the debug messages of the "burn_my_bmc" look good and =
I also got "bmc-image" and "bmc.sig" file in the "/run/initramfs" and "/tmp=
" directory respectively via LPC data transfer mechanism on the BMC. Howeve=
r, one thing is strange which is the content of the "bmcimage" and "bmc.sig=
" file are all 0xff. I think this should not be the normal case, perhaps I =
made a mistake. Following are my steps/changes on the Host-side and BMC-sid=
e, could you please take a look at it, is there anything wrong? Or do you h=
ave any suggestions for enabling the feature? Thanks.
> > >>
> > >>
> > >>
> > >> Host-side
> > >>
> > >> =3D=3D=3D=3D=3D
> > >>
> > >> The e820 map of the Host system (just choose one area randomly,
> > >> should I need to reserve a specific area for this??) ####
> > >> archer@archer-ArcherCityM:mtd.all$ sudo dmesg | grep e820
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff=
] usable
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff=
] usable
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff=
] reserved                   <-- choose this area.
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006d8effff=
] usable
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x000000006d8f0000-0x000000006f9effff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x000000006f9f0000-0x00000000702effff=
] ACPI data
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x00000000702f0000-0x0000000072c2ffff=
] ACPI NVS
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x0000000072c30000-0x00000000777fefff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x00000000777ff000-0x00000000777fffff=
] usable
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x0000000077800000-0x000000008fffffff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff=
] reserved
> > >>
> > >> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047fffffff=
] usable
> > >>
> > >> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=
=3D> usable
> > >>
> > >> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=
=3D> usable
> > >>
> > >> [    0.000022] e820: update [mem 0x00000000-0x00000fff] usable =3D=
=3D> reserved
> > >>
> > >> [    0.000027] e820: remove [mem 0x000a0000-0x000fffff] usable
> > >>
> > >> [    0.003943] e820: update [mem 0x80000000-0xffffffff] usable =3D=
=3D> reserved
> > >>
> > >> [    0.017281] e820: update [mem 0x69d87000-0x69d87fff] usable =3D=
=3D> reserved
> > >>
> > >> [    0.017300] e820: update [mem 0x686c6000-0x686c6fff] usable =3D=
=3D> reserved
> > >>
> > >> [    5.045333] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
> > >>
> > >> [    5.045336] e820: reserve RAM buffer [mem 0x624a8018-0x63ffffff]
> > >>
> > >> [    5.045338] e820: reserve RAM buffer [mem 0x686c6000-0x6bffffff]
> > >>
> > >> [    5.045340] e820: reserve RAM buffer [mem 0x69d87000-0x6bffffff]
> > >>
> > >> [    5.045341] e820: reserve RAM buffer [mem 0x6d8f0000-0x6fffffff]
> > >>
> > >> [    5.045342] e820: reserve RAM buffer [mem 0x77800000-0x77ffffff]
> > >>
> > >> [   33.565052] systemd[1]: Mounting Mount unit for e820-bios, revisi=
on 9...
> > >>
> > >> [   33.702641] systemd[1]: Mounted Mount unit for e820-bios, revisio=
n 9.
> > >> ####
> > >>
> > >> The executed command and its result.
> > >> ####
> > >> archer@archer-ArcherCityM:mtd.all$ time sudo burn_my_bmc \
> > >>
> > >> --command update \
> > >>
> > >>                                                             --interf=
ace ipmilpc
> > >>                                                             --image =
./image-bmc \
> > >>                                                             --sig ./=
image-bmc.sig \
> > >>                                                             --type i=
mage \
> > >>                                                             --addres=
s 0x000a0000 \
> > >>
> > >> --length 0x10000
> > >>
> > >> Sending over the firmware image.
> > >>
> > >> sending writeMeta
> > >>
> > >> writemeta sent
> > >>
> > >> Progress: 100.00%
> > >>
> > >> Sending over the hash file.
> > >>
> > >> sending writeMeta
> > >>
> > >> writemeta sent
> > >>
> > >> Progress: 100.00%
> > >>
> > >> Opening the verification file
> > >>
> > >> Committing to /flash/verify to trigger service
> > >>
> > >> Calling stat on /flash/verify session to check status
> > >>
> > >> success
> > >>
> > >> succeeded
> > >>
> > >> Opening the update file
> > >>
> > >> Committing to /flash/update to trigger service
> > >>
> > >> Calling stat on /flash/update session to check status
> > >>
> > >> success
> > >>
> > >> succeeded
> > >>
> > >>
> > >>
> > >> real=E2=80=82=E2=80=820m17.616s
> > >>
> > >> user=E2=80=82=E2=80=820m0.046s
> > >>
> > >> sys=E2=80=82=E2=80=82=E2=80=820m0.147s
> > >>
> > >> ####
> > >>
> > >> =3D=3D=3D=3D=3D
> > >>
> > >>
> > >>
> > >> BMC-side
> > >>
> > >> =3D=3D=3D=3D=3D
> > >>
> > >> Code changes
> > >>
> > >> Add to install "phosphor-ipmi-flash" and "phosphor-ipmi-blobs" these=
 two packages in packagegroup recipe.
> > >>
> > >> ####
> > >> SUMMARY:${PN}-system =3D "Flex Ltd System"
> > >>
> > >> RDEPENDS:${PN}-system =3D " \
> > >>
> > >>         phosphor-ipmi-blobs \
> > >>
> > >>         phosphor-ipmi-flash \
> > >>
> > >>         "
> > >>
> > >> ####
> > >>
> > >> Add "phosphor-impi-flash_%.bbapend" recipe with these lines(Bold).
> > >>
> > >> ####
> > >> SRCREV =3D "c277935e6fe0cdcf8aefc45b53d11bd6ca20f964"
> > >>
> > >>
> > >>
> > >> PACKAGECONFIG:append =3D " static-bmc"
> > >>
> > >> PACKAGECONFIG:append =3D " aspeed-lpc"
> > >>
> > >> PACKAGECONFIG:append =3D " reboot-update"
> > >>
> > >> IPMI_FLASH_BMC_ADDRESS =3D "0x98000000"
> > >>
> > >> ####
> > >>
> > >> Remove ",-Dupdate-type=3Dnone" in the phosphor-ipmi-flash_git.bb rec=
ipe as below, because the "Enabled Firmware Update Features" and "config-st=
atic-bmc-reboot.json" are not be included. This seems the "update-type" wou=
ld always pass "none" to "phosphor-impi-flash" package without this change,=
 but I'm not sure??
> > >>
> > >> ####
> > >> PACKAGECONFIG[static-bmc] =3D "-Dupdate-type=3Dstatic-layout"
> > >> ####
> > >>
> > >> Add these lines(Bold). in Kernel dts file
> > >>
> > >> ####
> > >>
> > >> reserved-memory {
> > >>
> > >> #address-cells =3D <1>;
> > >>
> > >> #size-cells =3D <1>;
> > >>
> > >> ranges;
> > >>
> > >>
> > >>
> > >> video_engine_memory: video {
> > >>
> > >> size =3D <0x04000000>;
> > >>
> > >> alignment =3D <0x01000000>;
> > >>
> > >> compatible =3D "shared-dma-pool";
> > >>
> > >> reusable;
> > >>
> > >> };
> > >>
> > >>
> > >>
> > >> /* LPC FW cycle bridge region requires natural alignment */
> > >>
> > >> flash_memory: region@98000000 {
> > >>
> > >> no-map;
> > >>
> > >> reg =3D <0x98000000 0x04000000>; /* 64M */
> > >>
> > >> };
> > >>
> > >> };
> > >>
> > >> &lpc_ctrl {
> > >>
> > >> status =3D "okay";
> > >>
> > >> memory-region =3D <&flash_memory>;
> > >>
> > >> };
> > >>
> > >> ####
> > >>
> > >> BMC console
> > >>
> > >> Manually modify "config-static-bmc-reboot.json" to skip "preparation=
", "verification", and "update" actions because I want to make sure image f=
ile transfer is okay first.
> > >> ####
> > >> root@hudsonbay-obmc:~# cat
> > >> /usr/share/phosphor-ipmi-flash/config-static-bmc-reboot.json
> > >>
> > >> [{
> > >>
> > >>         "blob": "/flash/image",
> > >>
> > >>         "handler": {
> > >>
> > >>                 "type": "file",
> > >>
> > >>                 "path": "/run/initramfs/bmc-image"
> > >>
> > >>         },
> > >>
> > >>         "actions": {
> > >>
> > >>                 "preparation": {
> > >>
> > >>                         "type": "skip"
> > >>
> > >>                 },
> > >>
> > >>                 "verification": {
> > >>
> > >>                         "type": "skip"
> > >>
> > >>                 },
> > >>
> > >>                 "update": {
> > >>
> > >>                         "type": "skip"
> > >>
> > >>                 }
> > >>
> > >>         }
> > >>
> > >> }]
> > >> ####
> > >>
> > >> Create "/run/initramfs" directory manually.
> > >> ####
> > >> root@hudsonbay-obmc:~# mkdir /run/initramfs
> > >>
> > >> ####
> > >>
> > >> Result after executing burn_my_bmc command. (the content of
> > >> bmc-image and bmc.sig are all 0xff) ####
> > >>
> > >> root@hudsonbay-obmc:~# ls -al /run/initramfs/bmc-image
> > >> -rw-r--r--    1 root     root      67108864 Jan  1 01:47 /run/initra=
mfs/bmc-image
> > >>
> > >> root@hudsonbay-obmc:~# hexdump -C /run/initramfs/bmc-image
> > >>
> > >> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > >> |................|
> > >>
> > >> *
> > >>
> > >> 04000000
> > >>
> > >> root@hudsonbay-obmc:~# ls -al /tmp/bmc.sig
> > >>
> > >> -rw-r--r--    1 root     root           128 Jan  1 01:47 /tmp/bmc.si=
g
> > >>
> > >> root@hudsonbay-obmc:~# hexdump -C /tmp/bmc.sig
> > >>
> > >> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > >> |................|
> > >>
> > >> *
> > >>
> > >> 00000080
> > >> ####
> > >>
> > >> =3D=3D=3D=3D=3D
> > >>
> > >>
> > >>
> > >> Regards,
> > >>
> > >> Chris Chen
> > >>
> > >> Legal Disclaimer :
> > >> The information contained in this message may be privileged and conf=
idential.
> > >> It is intended to be read only by the individual or entity to whom
> > >> it is addressed or by their designee. If the reader of this message
> > >> is not the intended recipient, you are on notice that any
> > >> distribution of this message, in any form, is strictly prohibited.
> > >> If you have received this message in error, please immediately notif=
y the sender and delete or destroy any copy of this message!
