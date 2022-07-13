Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9C573B7C
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 18:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljk5r5KPNz3c38
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 02:46:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CgpUpqBx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CgpUpqBx;
	dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljk5S6LfFz3c2T
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 02:45:47 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id v6so9020476qkh.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 09:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BWegQeYWGRevYKTKQ38Yatx8hnO32VATdYVrvo/Eq0s=;
        b=CgpUpqBx6/eLvUWZdic42+Hwqfc2vMBoF0P2NHB5daB1kc/mXrVnItt9pB7rPXECNc
         IWRIMVosizrkj82efLUCgmuMm1lE0o5/YHzmzNMJcYZDDjQQpGX0AJ6y1Mx2xyvJ0v+g
         eVM7bf87AUnU/L6dmTE7USnOfbduqYBqmL6rDVixN8mE+CL1ORB2mMs+01L5cyknnonF
         I4XxH59TY9iXl8BRJmOMnZSWluLmu3tNKAMXxwF8fsGOCMqfNGxETd0sCCm93i4ENTSp
         3Oa+w9HL0G7OdHev+EGUsI7WKkCkbkyKnxhZOkUMGn5+hvTZCpfFK91NW8HrSf5AeQLV
         AEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BWegQeYWGRevYKTKQ38Yatx8hnO32VATdYVrvo/Eq0s=;
        b=okFYM99B71ap2e5l1CQ//RSjVzXVCY9Uk/5e8lsete3oyhlEfkkkY+grMRMbGdbgnD
         +tifjdWGw2urgtP5/j6K6hrUn5lHUFtZ7y3v4NUtZjJvEfI1PAGPJRdEfrCxvQ0x9T7J
         MA5DYYFVPjDvG4JfhUGWqXO6508r+J8gk1oDYQT2L2jU6M6c6lTXTQWa4vR+EHHjIE8f
         SunbCoTqnZ4UabsnH9g1jmfs6ZvRoDO06x9+pTpttUsEHiScXQJRGvP+qfkL3w/KOkwN
         NfREMD8kcAMGjcsy0iKddH3LlPwqahXEkl+HOMRoidw3/rLv964UY6ThvnKjOHWq7jT5
         4p8A==
X-Gm-Message-State: AJIora+JJTE1ts4987YmzmlQ7ILty+78PERRfcoTzXb8JMInm3V9637M
	4/PgMgekcm335vMbORsAv0J6XfZE76vlycCrcgcO6w==
X-Google-Smtp-Source: AGRyM1vya+7Yr501DbjiHzRYK3TKN7d3FcdotjWT9DTGrZ3uaoA69b8UZMCFUydzAtP1JjCriXdJ6o8GACH9AMFPWGo=
X-Received: by 2002:a05:620a:254c:b0:6b4:85f3:8eec with SMTP id
 s12-20020a05620a254c00b006b485f38eecmr3030727qko.317.1657730744259; Wed, 13
 Jul 2022 09:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514B0E05D21D8F96A11EDB2DC899@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CAHwn2X=5L2uSgYBnbpC-trK1Tw-+chnwXd19WBiSd_9-vbwe=Q@mail.gmail.com>
In-Reply-To: <CAHwn2X=5L2uSgYBnbpC-trK1Tw-+chnwXd19WBiSd_9-vbwe=Q@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 13 Jul 2022 09:45:33 -0700
Message-ID: <CALGRKGM5o1S2G+qcd-Npmp3N+ESLAzhxb7rUFb8cwwgkfN8Tng@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: Question about in-band update of BMC firmware
To: Willy Tu <wltu@google.com>
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
Cc: "chris6906@gmail.com" <chris6906@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Chris Chen \(TPI\)" <Chris.Chen3@flex.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chris,

The region you choose on both the BMC and the BIOS IS important as the
BMC and the BIOS usually has a dedicated address for such a shared
MMIO. I am not a BIOS expert so I had to ask the BIOS team for the
address that is dedicated for LPC / eSPI (if you plan on using LPC /
eSPI) and had to refer to the BMC's datasheet for the region (I
believe it's defaulted to the Nuvoton region currently). As Willy
pointed out, my guess is that a manual write to the memory won't work
for you.

Which BMC are you using if you don't mind me asking? Nuvoton vs. Aspeed?

Thanks,
Brandon

On Wed, Jul 13, 2022 at 9:40 AM Willy Tu <wltu@google.com> wrote:
>
> Hi Chris,
>
> I think you were able to set it up correctly. Can you check if you can re=
ad/write to the flash memory on the BMC 0x98000000? I am also wondering if =
that address is correct  or not. Like if that address is mapped to the BMC'=
s memory. I have hit an issue where the image transferred does not match be=
cause the BIOS didn't set that up properly. I am unsure how to set that up.
>
> Willy Tu
>
> On Wed, Jul 13, 2022 at 1:15 AM Chris Chen (TPI) <Chris.Chen3@flex.com> w=
rote:
>>
>> Hi Brandon and William,
>>
>>
>>
>> As you know, I have already built the "burn_my_bmc" on my Host (Eagle St=
ream with Aspeed 2600). I for now tried to use it to do the in-band update =
of BMC firmware, the debug messages of the "burn_my_bmc" look good and I al=
so got "bmc-image" and "bmc.sig" file in the "/run/initramfs" and "/tmp" di=
rectory respectively via LPC data transfer mechanism on the BMC. However, o=
ne thing is strange which is the content of the "bmcimage" and "bmc.sig" fi=
le are all 0xff. I think this should not be the normal case, perhaps I made=
 a mistake. Following are my steps/changes on the Host-side and BMC-side, c=
ould you please take a look at it, is there anything wrong? Or do you have =
any suggestions for enabling the feature? Thanks.
>>
>>
>>
>> Host-side
>>
>> =3D=3D=3D=3D=3D
>>
>> The e820 map of the Host system (just choose one area randomly, should I=
 need to reserve a specific area for this??)
>> ####
>> archer@archer-ArcherCityM:mtd.all$ sudo dmesg | grep e820
>>
>> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] us=
able
>>
>> [    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] us=
able
>>
>> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] re=
served                   <-- choose this area.
>>
>> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006d8effff] us=
able
>>
>> [    0.000000] BIOS-e820: [mem 0x000000006d8f0000-0x000000006f9effff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x000000006f9f0000-0x00000000702effff] AC=
PI data
>>
>> [    0.000000] BIOS-e820: [mem 0x00000000702f0000-0x0000000072c2ffff] AC=
PI NVS
>>
>> [    0.000000] BIOS-e820: [mem 0x0000000072c30000-0x00000000777fefff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x00000000777ff000-0x00000000777fffff] us=
able
>>
>> [    0.000000] BIOS-e820: [mem 0x0000000077800000-0x000000008fffffff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] re=
served
>>
>> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047fffffff] us=
able
>>
>> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=3D> u=
sable
>>
>> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=3D> u=
sable
>>
>> [    0.000022] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> r=
eserved
>>
>> [    0.000027] e820: remove [mem 0x000a0000-0x000fffff] usable
>>
>> [    0.003943] e820: update [mem 0x80000000-0xffffffff] usable =3D=3D> r=
eserved
>>
>> [    0.017281] e820: update [mem 0x69d87000-0x69d87fff] usable =3D=3D> r=
eserved
>>
>> [    0.017300] e820: update [mem 0x686c6000-0x686c6fff] usable =3D=3D> r=
eserved
>>
>> [    5.045333] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
>>
>> [    5.045336] e820: reserve RAM buffer [mem 0x624a8018-0x63ffffff]
>>
>> [    5.045338] e820: reserve RAM buffer [mem 0x686c6000-0x6bffffff]
>>
>> [    5.045340] e820: reserve RAM buffer [mem 0x69d87000-0x6bffffff]
>>
>> [    5.045341] e820: reserve RAM buffer [mem 0x6d8f0000-0x6fffffff]
>>
>> [    5.045342] e820: reserve RAM buffer [mem 0x77800000-0x77ffffff]
>>
>> [   33.565052] systemd[1]: Mounting Mount unit for e820-bios, revision 9=
...
>>
>> [   33.702641] systemd[1]: Mounted Mount unit for e820-bios, revision 9.
>> ####
>>
>> The executed command and its result.
>> ####
>> archer@archer-ArcherCityM:mtd.all$ time sudo burn_my_bmc \
>>                                                             --command up=
date \
>>
>>                                                             --interface =
ipmilpc
>>                                                             --image ./im=
age-bmc \
>>                                                             --sig ./imag=
e-bmc.sig \
>>                                                             --type image=
 \
>>                                                             --address 0x=
000a0000 \
>>                                                             --length 0x1=
0000
>>
>> Sending over the firmware image.
>>
>> sending writeMeta
>>
>> writemeta sent
>>
>> Progress: 100.00%
>>
>> Sending over the hash file.
>>
>> sending writeMeta
>>
>> writemeta sent
>>
>> Progress: 100.00%
>>
>> Opening the verification file
>>
>> Committing to /flash/verify to trigger service
>>
>> Calling stat on /flash/verify session to check status
>>
>> success
>>
>> succeeded
>>
>> Opening the update file
>>
>> Committing to /flash/update to trigger service
>>
>> Calling stat on /flash/update session to check status
>>
>> success
>>
>> succeeded
>>
>>
>>
>> real=E2=80=82=E2=80=820m17.616s
>>
>> user=E2=80=82=E2=80=820m0.046s
>>
>> sys=E2=80=82=E2=80=82=E2=80=820m0.147s
>>
>> ####
>>
>> =3D=3D=3D=3D=3D
>>
>>
>>
>> BMC-side
>>
>> =3D=3D=3D=3D=3D
>>
>> Code changes
>>
>> Add to install "phosphor-ipmi-flash" and "phosphor-ipmi-blobs" these two=
 packages in packagegroup recipe.
>>
>> ####
>> SUMMARY:${PN}-system =3D "Flex Ltd System"
>>
>> RDEPENDS:${PN}-system =3D " \
>>
>>         phosphor-ipmi-blobs \
>>
>>         phosphor-ipmi-flash \
>>
>>         "
>>
>> ####
>>
>> Add "phosphor-impi-flash_%.bbapend" recipe with these lines(Bold).
>>
>> ####
>> SRCREV =3D "c277935e6fe0cdcf8aefc45b53d11bd6ca20f964"
>>
>>
>>
>> PACKAGECONFIG:append =3D " static-bmc"
>>
>> PACKAGECONFIG:append =3D " aspeed-lpc"
>>
>> PACKAGECONFIG:append =3D " reboot-update"
>>
>> IPMI_FLASH_BMC_ADDRESS =3D "0x98000000"
>>
>> ####
>>
>> Remove ",-Dupdate-type=3Dnone" in the phosphor-ipmi-flash_git.bb recipe =
as below, because the "Enabled Firmware Update Features" and "config-static=
-bmc-reboot.json" are not be included. This seems the "update-type" would a=
lways pass "none" to "phosphor-impi-flash" package without this change, but=
 I'm not sure??
>>
>> ####
>> PACKAGECONFIG[static-bmc] =3D "-Dupdate-type=3Dstatic-layout"
>> ####
>>
>> Add these lines(Bold). in Kernel dts file
>>
>> ####
>>
>> reserved-memory {
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#address-=
cells =3D <1>;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#size-cel=
ls =3D <1>;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ranges;
>>
>>
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82video_eng=
ine_memory: video {
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82size =3D <0x04000000>;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82alignment =3D <0x01000000>;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82compatible =3D "shared-dma-pool";
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82reusable;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};
>>
>>
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82/* LPC FW=
 cycle bridge region requires natural alignment */
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82flash_mem=
ory: region@98000000 {
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82no-map;
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82reg =3D <0x98000000 0x04000000>; /* 64M=
 */
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};
>>
>> };
>>
>> &lpc_ctrl {
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82status =3D "okay";
>>
>> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82memory-region =3D =
<&flash_memory>;
>>
>> };
>>
>> ####
>>
>> BMC console
>>
>> Manually modify "config-static-bmc-reboot.json" to skip "preparation", "=
verification", and "update" actions because I want to make sure image file =
transfer is okay first.
>> ####
>> root@hudsonbay-obmc:~# cat /usr/share/phosphor-ipmi-flash/config-static-=
bmc-reboot.json
>>
>> [{
>>
>>         "blob": "/flash/image",
>>
>>         "handler": {
>>
>>                 "type": "file",
>>
>>                 "path": "/run/initramfs/bmc-image"
>>
>>         },
>>
>>         "actions": {
>>
>>                 "preparation": {
>>
>>                         "type": "skip"
>>
>>                 },
>>
>>                 "verification": {
>>
>>                         "type": "skip"
>>
>>                 },
>>
>>                 "update": {
>>
>>                         "type": "skip"
>>
>>                 }
>>
>>         }
>>
>> }]
>> ####
>>
>> Create "/run/initramfs" directory manually.
>> ####
>> root@hudsonbay-obmc:~# mkdir /run/initramfs
>>
>> ####
>>
>> Result after executing burn_my_bmc command. (the content of bmc-image an=
d bmc.sig are all 0xff)
>> ####
>>
>> root@hudsonbay-obmc:~# ls -al /run/initramfs/bmc-image
>> -rw-r--r--    1 root     root      67108864 Jan  1 01:47 /run/initramfs/=
bmc-image
>>
>> root@hudsonbay-obmc:~# hexdump -C /run/initramfs/bmc-image
>>
>> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |...........=
.....|
>>
>> *
>>
>> 04000000
>>
>> root@hudsonbay-obmc:~# ls -al /tmp/bmc.sig
>>
>> -rw-r--r--    1 root     root           128 Jan  1 01:47 /tmp/bmc.sig
>>
>> root@hudsonbay-obmc:~# hexdump -C /tmp/bmc.sig
>>
>> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |...........=
.....|
>>
>> *
>>
>> 00000080
>> ####
>>
>> =3D=3D=3D=3D=3D
>>
>>
>>
>> Regards,
>>
>> Chris Chen
>>
>> Legal Disclaimer :
>> The information contained in this message may be privileged and confiden=
tial.
>> It is intended to be read only by the individual or entity to whom it is=
 addressed
>> or by their designee. If the reader of this message is not the intended =
recipient,
>> you are on notice that any distribution of this message, in any form,
>> is strictly prohibited. If you have received this message in error,
>> please immediately notify the sender and delete or destroy any copy of t=
his message!
