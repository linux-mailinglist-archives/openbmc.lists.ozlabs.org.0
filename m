Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE13296B5
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 08:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqTtv1xthz3cJR
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 18:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F7lB+Ais;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=dz4list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F7lB+Ais; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqTtb74JJz3cGk
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 18:54:46 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id k66so1633938wmf.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Mar 2021 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=N0cF8UtoQ5OwfOxcxkZ3I0zZoe6kGrfsUopNPNUJou8=;
 b=F7lB+AisH4uvFxz1vtBzv0h3lgH2umX8m/tylI9qwIC0ya/+2Snsi1Y23YiwMcIgyI
 JidTyYe4lHLsNylzArLyjz02FF5MidKVLt05IF+p8FF8gaKGjUW5pCirnYl6DS2BNVHH
 JLXjNSXp/pPQhpGa92JdcyDXcKKRgJ34mStrOSjdBrYebI4/AcXhql6zZBfDK7fgn3/e
 bDNf+RbuJvFL7giOP05kOywdtlMB7m49MOTWfFYVpS/qbkaT7hbN2O8RD14gNNjh1wlD
 xQcWGEdpXi7HzgJlRmu/IcppmskYpz0jh+GLw34iDyLVFHEpMk4lx2EHa57eALzAsnH+
 S5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=N0cF8UtoQ5OwfOxcxkZ3I0zZoe6kGrfsUopNPNUJou8=;
 b=BagAYxpEYwSefNPneIYkTNjD43JkgxEObU03fel9PYopyAE+FqgLV7fgQuhesV+CAv
 u9DA9pkE0iI1mWCF2c0Akpvnndz0B4wuxyr03lmPlt+scNnfeur+EfPCIHvf3IffnVht
 TeToQ4XuPBQ6TxSoC3kQeijApRKyP2CjR7l3nQuzA4i3o2y0N60vmQIN9SoIH100+z1+
 zX4qFDJyqgtSU5RMK0ALX6iicFjzgRdnXQbDZ9pVKNpRR8nzBJ3s/riSFA78R5ZHYSAj
 kmxhqEkxJ8g15q3zbvYG95Z9BmTsxYK8PwC8d+SxC5qr+Rl4lHpxHiVV8N6qC6fzm5ps
 VuPg==
X-Gm-Message-State: AOAM532+ETxxfiTu1adEpAieROZROQort/rqjVziHCPy7hs3vfD3Dzky
 Sh6RGkVIAcIA8zULvVKVa/YCPqlKnOQwKsrmL9fJosybhpQ=
X-Google-Smtp-Source: ABdhPJxp+1AerwSWVT29B79gJB9EtX3WBu+FqfB/wAVsyy+LiclmXXLx/KZF9gIlNypbaI+Z2QGpAYj80fVJOQLhdaM=
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr2636222wmj.73.1614671678025; 
 Mon, 01 Mar 2021 23:54:38 -0800 (PST)
MIME-Version: 1.0
References: <mailman.1404.1614626722.7079.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.1404.1614626722.7079.openbmc@lists.ozlabs.org>
From: Dan Zhang <dz4list@gmail.com>
Date: Mon, 1 Mar 2021 23:54:27 -0800
Message-ID: <CAJxKyLcnj=Op-+LLfjCQmX-MFCsk8duud1_Tk0RWjXAzUiKNAA@mail.gmail.com>
Subject: RE: (Aspeed2600) Booting with a SPL loading U-boot fitImage
To: openbmc@lists.ozlabs.org, klaus@linux.vnet.ibm.com
Content-Type: multipart/alternative; boundary="000000000000cc304405bc890b74"
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

--000000000000cc304405bc890b74
Content-Type: text/plain; charset="UTF-8"

I think within A FIT image, the u-boot binary is not located at your entry
point 0x81000000,
it is behind the fit header, somewhere. This means the entry_point and
load_addr is not the same as spl_boot.c defined.
spl_image->entry_point = CONFIG_ASPEED_UBOOT_DRAM_BASE;
spl_image->load_addr = CONFIG_ASPEED_UBOOT_DRAM_BASE;
Also, the u-boot code itself before relocation is position aware (
SYS_TEXT_BASE must be set to 0x81000000, as your second try works). This
means the entry_point shall be the same as SYS_TEXT_BASE.

In fb/OpenBMC, verified boot implementation, use mkimage option:
  -p => place external data at a static position,
thus we specify the somewhere to a static offset , then you can set the
entry_point = load_addr + offset.

Another solution may be consider letting the SPL do what "bootm
<entry_point>" do, which I guess (I did not look into this yet) shall be
what "CONFIG_SPL_LOAD_FIT" do.

BRs
Dan

On Mon, Mar 1, 2021 at 11:26 AM <openbmc-request@lists.ozlabs.org> wrote:

> Send openbmc mailing list submissions to
>         openbmc@lists.ozlabs.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.ozlabs.org/listinfo/openbmc
> or, via email, send a message with subject or body 'help' to
>         openbmc-request@lists.ozlabs.org
>
> You can reach the person managing the list at
>         openbmc-owner@lists.ozlabs.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
> Today's Topics:
>
>    1. Re: [PATCH] ARM: dts: nuvoton: Fix flash layout (Tomer Maimon)
>    2. Re: any in-progress Redfish TelemetryService enhancements?
>       (Brad Bishop)
>    3. (Aspeed2600) Booting with a SPL loading U-boot fitImage
>       (Klaus Heinrich Kiwi)
>
>
>
> ---------- Forwarded message ----------
> From: Tomer Maimon <tmaimon77@gmail.com>
> To: Anton Kachalov <gmouse@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <
> avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick
> Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Rob Herring <
> robh+dt@kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
> devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <
> linux-kernel@vger.kernel.org>
> Bcc:
> Date: Mon, 1 Mar 2021 15:36:58 +0200
> Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
> Hi Anton,
>
> The reason the u-boot Env is at 0x100000 address is that some
> costumers have:
> one copy of Bootblock and U-boot at 0x0 - 0x80000
> second copy of Bootblock and U-boot at 0x80000 - 0x100000.
>
> we have two options;
> 1. Modify the OpenBMC device tree flash layout u-boot Env address to
> 0x100000.
> 2. Add a patch to OpnBMC platform that using openbmc flash layout to
> modify CONFIG_ENV_OFFSET in the u-boot.
>
> Thanks,
>
> Tomer
>
>
> On Fri, 26 Feb 2021 at 22:10, Anton Kachalov <gmouse@google.com> wrote:
>
>> Hello, Tomer.
>>
>> Seems like Nuvoton's u-boot expects the uboot-env at different address
>> comparing to openbmc-flash-layout.dtsi:
>>
>>
>> https://github.com/Nuvoton-Israel/u-boot/blob/npcm7xx-v2019.01/include/configs/poleg.h#L30
>>
>> Vs.
>>
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/openbmc-flash-layout.dtsi#n13
>>
>> The change is more about making partitions naming the same as expected by
>> OpenBMC.
>>
>> On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>
>>> Hi Benjamin and Anton,
>>>
>>> Sorry for the late reply,
>>>
>>> The EVB FIU0-CS0 partitioning is used for testing the EVB and this is
>>> why it is different than the OpenBMC flash layout.
>>>
>>>
>>>
>>> Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to
>>> modify the flash partition to OpenBMC use.
>>>
>>> On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com>
>>> wrote:
>>>
>>>> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
>>>> >
>>>> > From: "Anton D. Kachalov" <gmouse@google.com>
>>>> >
>>>> > This change satisfy OpenBMC requirements for flash layout.
>>>> >
>>>> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>>>> > ---
>>>> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28
>>>> +++++++----------------
>>>> >  1 file changed, 8 insertions(+), 20 deletions(-)
>>>> >
>>>> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>>> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>>> > index bd1eb6ee380f..741c1fee8552 100644
>>>> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>>> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>>> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
>>>> >                                 reg = <0x0080000 0x80000>;
>>>> >                                 read-only;
>>>> >                                 };
>>>> > -                       envparam@100000 {
>>>> > -                               label = "env-param";
>>>> > +                       ubootenv@100000 {
>>>> > +                               label = "u-boot-env";
>>>> >                                 reg = <0x0100000 0x40000>;
>>>> >                                 read-only;
>>>> >                                 };
>>>> > @@ -195,25 +195,13 @@ kernel@200000 {
>>>> >                                 label = "kernel";
>>>> >                                 reg = <0x0200000 0x400000>;
>>>> >                                 };
>>>> > -                       rootfs@600000 {
>>>> > -                               label = "rootfs";
>>>> > -                               reg = <0x0600000 0x700000>;
>>>> > +                       rofs@780000 {
>>>> > +                               label = "rofs";
>>>> > +                               reg = <0x0780000 0x1680000>;
>>>> >                                 };
>>>> > -                       spare1@D00000 {
>>>> > -                               label = "spare1";
>>>> > -                               reg = <0x0D00000 0x200000>;
>>>> > -                               };
>>>> > -                       spare2@0F00000 {
>>>> > -                               label = "spare2";
>>>> > -                               reg = <0x0F00000 0x200000>;
>>>> > -                               };
>>>> > -                       spare3@1100000 {
>>>> > -                               label = "spare3";
>>>> > -                               reg = <0x1100000 0x200000>;
>>>> > -                               };
>>>> > -                       spare4@1300000 {
>>>> > -                               label = "spare4";
>>>> > -                               reg = <0x1300000 0x0>;
>>>> > +                       rwfs@1e00000 {
>>>> > +                               label = "rwfs";
>>>> > +                               reg = <0x1e00000 0x200000>;
>>>> >                         };
>>>>
>>>> I recommend just including the openbmc-flash-layout.dtsi file here
>>>> instead since that contains the common flash layout for most OpenBMC
>>>> systems.
>>>>
>>>> Good solution,
>>> Do you mean nuvoton-openbmc-flash-layout?
>>>
>>>> >                 };
>>>> >         };
>>>> > --
>>>> > 2.30.0.478.g8a0d178c01-goog
>>>> >
>>>>
>>>
>>> Thanks,
>>>
>>> Tomer
>>>
>>
>
>
> ---------- Forwarded message ----------
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> To: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
> Cc: openbmc@lists.ozlabs.org
> Bcc:
> Date: Mon, 1 Mar 2021 10:05:52 -0500
> Subject: Re: any in-progress Redfish TelemetryService enhancements?
> On Wed, Feb 24, 2021 at 01:09:56PM +0100, Wludzik, Jozef wrote:
> >Hi, "Append" is on the list of to dos and should be ready till summer
> >(might be ready).
>
> That's great!  Any chance you could you provide any hints on how you
> expect it to be implemented - I'm not sure if I can wait that long to
> get started.  I would like to make sure that if I start working on it,
> it will have your approval from a high level view.  If you have not
> given it any thought, no problem - I'll come up with a proposal and
> report back here.
>
>
>
>
> ---------- Forwarded message ----------
> From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Andrew
> Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
> Cc:
> Bcc:
> Date: Mon, 1 Mar 2021 16:25:03 -0300
> Subject: (Aspeed2600) Booting with a SPL loading U-boot fitImage
> Has anyone been able to successfully bring-up U-boot proper as a fitImage
> from the SPL, when using U-boot from the 2019.4 Aspeed SDK?
>
> The current configuration for Rainier (ast2600_openbmc_spl_emmc_defconfig)
> has, among other things, CONFIG_SPL_LOAD_FIT=y which at the end of the
> build process should produce a spl/u-boot-spl.bin file (which is really the
> concatenation of u-boot-spl-nodtb.bin + u-boot-spl.dtb) and a u-boot.img
> file, which is a FIT image created with 'mkimage -f auto -A arm -T firmware
> -C none -O u-boot -a 0x10000 -e 0 -n "U-Boot 2019.04"" for evb_ast2600a1
> board" -E  -d u-boot-nodtb.bin u-boot.img'
>
> I tried loading this pair using qemu-system-arm (Aspeed 6.0 branch from
> Cedric Legoater), the SPL loads but fails to load the U-boot fit Image
> apparently:
>
> ----
> $ dd of=mmc-image.img if=/dev/zero bs=1M count=128
> $ dd of=mmc-image.img if=../uboot-build/spl/u-boot-spl.bin conv=notrunc
>    54454 bytes (54 kB, 53 KiB) copied
> $ dd of=mmc-image.img if=../uboot-build/u-boot.img conv=notrunc bs=1K
> seek=64
>    429640 bytes (430 kB, 420 KiB) copied
> $ xzdec tmp/deploy/images/rainier/obmc-phosphor-image-rainier.wic.xz | dd
> of=mmc-image.img conv=notrunc bs=1M seek=2
> $ truncate --size 16G mmc-image.img
> $ qemu-system-arm -M rainier-bmc -nographic -drive
> file=mmc-image.img,if=sd,format=raw,id=sd0,index=2 -nodefaults -serial
> mon:stdio
> <..snip..>
> aspeed_sdhci_probe: CLK 200000000
> ofnode_read_u32: bus-width: x (4)
> ofnode_read_u32: sdhci-drive-type: x (1)
> clock is disabled (0Hz)
> clock is enabled (400000Hz)
> clock is enabled (25000000Hz)
> blk_find_device: if_type=6, devnum=0: emmc_slot0@100.blk, 6, 0
> Jumping to U-Boot
> SPL malloc() used 0xf4 bytes (0 KB)
> loaded - jumping to U-Boot...
> image entry point: 0x81000000
> -----
>
> At this point it just sits there with no progress..
>
> Another interesting point here is that if I use a legacy uboot image (the
> concatenation of u-boot-nodtb.bin + u-boot.dtb), I can bring-up u-boot
> proper and it will work just fine, even if the same defconfig has '#
> CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set'
>
> ----
> clock is enabled (25000000Hz)
> blk_find_device: if_type=6, devnum=0: emmc_slot0@100.blk, 6, 0
> Jumping to U-Boot
> SPL malloc() used 0xf4 bytes (0 KB)
> loaded - jumping to U-Boot...
> image entry point: 0x81000000
>
>
> U-Boot 2019.04 (Feb 27 2021 - 15:21:29 +0000)
>
> SOC: AST2600-A1
> eSPI Mode: SIO:Enable : SuperIO-2e
> Eth: MAC0: RMII/NCSI, MAC1: RMII/NCSI, MAC2: RMII/NCSI, MAC3: RMII/NCSI
> Model: Rainier
> DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:64 MiB), ECC
> off
> MMC:   emmc_slot0@100: 0
> Loading Environment from MMC... OK
> In:    serial@1e784000
> Out:   serial@1e784000
> Err:   serial@1e784000
> Model: Rainier
> Net:   No MDIO found.
> ftgmac100_probe - NCSI detected
> ----
>
> That probably explains why we have been able to boot the rainier OpenBMC
> image (even if u-boot is configured to use SPL + U-Boot FIT, the
> kernel-fitimage.bbclass creates a "new" u-boot image by concatenating the
> aforementioned binaries).
>
> I tried a few different settings for the .config and also tried debugging
> the SPL, but it's a very constrained environment and at this point I'm a
> bit out of ideas.
>
> So has anyone been able to make this work?
>
>
>
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>
>

--000000000000cc304405bc890b74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think within A FIT image, the u-boot binary is not =
located at your entry point 0x81000000, <br></div><div>it is behind the fit=
 header, somewhere. This means the entry_point and load_addr is not the sam=
e as spl_boot.c defined. <br><div style=3D"color:rgb(212,212,212);backgroun=
d-color:rgb(30,30,30);font-family:Menlo,Monaco,&quot;Courier New&quot;,mono=
space;font-weight:normal;font-size:12px;line-height:18px;white-space:pre"><=
div><span style=3D"color:rgb(212,212,212)">        </span><span style=3D"co=
lor:rgb(156,220,254)">spl_image</span><span style=3D"color:rgb(212,212,212)=
">-&gt;</span><span style=3D"color:rgb(156,220,254)">entry_point</span><spa=
n style=3D"color:rgb(212,212,212)"> =3D CONFIG_ASPEED_UBOOT_DRAM_BASE;</spa=
n></div><div><span style=3D"color:rgb(212,212,212)">        </span><span st=
yle=3D"color:rgb(156,220,254)">spl_image</span><span style=3D"color:rgb(212=
,212,212)">-&gt;</span><span style=3D"color:rgb(156,220,254)">load_addr</sp=
an><span style=3D"color:rgb(212,212,212)"> =3D CONFIG_ASPEED_UBOOT_DRAM_BAS=
E;</span></div></div></div><div>Also, the u-boot code itself before relocat=
ion is position aware ( SYS_TEXT_BASE must be set to 0x81000000, as your se=
cond try works). This means the entry_point shall be the same as SYS_TEXT_B=
ASE.</div><div><br></div><div>In fb/OpenBMC, verified boot implementation, =
use mkimage option: <br></div><div>=C2=A0 -p =3D&gt; place external data at=
 a static position,</div><div>thus we specify the somewhere to a static off=
set , then you can set the entry_point =3D load_addr + offset.</div><div><b=
r></div><div>Another solution may be consider letting the SPL do what &quot=
;bootm &lt;entry_point&gt;&quot; do, which I guess (I did not look into thi=
s yet) shall be what &quot;CONFIG_SPL_LOAD_FIT&quot; do. <br></div><div><br=
></div><div>BRs</div><div>Dan =C2=A0 <br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 1, 2021 at 11:26 AM &l=
t;<a href=3D"mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists=
.ozlabs.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Send openbmc mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openbmc@lists.ozlabs.org" tar=
get=3D"_blank">openbmc@lists.ozlabs.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.ozlabs.org/listinfo/op=
enbmc" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/listin=
fo/openbmc</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openbmc-request@lists.ozlabs.=
org" target=3D"_blank">openbmc-request@lists.ozlabs.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openbmc-owner@lists.ozlabs.or=
g" target=3D"_blank">openbmc-owner@lists.ozlabs.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of openbmc digest...&quot;<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. Re: [PATCH] ARM: dts: nuvoton: Fix flash layout (Tomer Maim=
on)<br>
=C2=A0 =C2=A02. Re: any in-progress Redfish TelemetryService enhancements?<=
br>
=C2=A0 =C2=A0 =C2=A0 (Brad Bishop)<br>
=C2=A0 =C2=A03. (Aspeed2600) Booting with a SPL loading U-boot fitImage<br>
=C2=A0 =C2=A0 =C2=A0 (Klaus Heinrich Kiwi)<br>
<br><br><br>---------- Forwarded message ----------<br>From:=C2=A0Tomer Mai=
mon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@=
gmail.com</a>&gt;<br>To:=C2=A0Anton Kachalov &lt;<a href=3D"mailto:gmouse@g=
oogle.com" target=3D"_blank">gmouse@google.com</a>&gt;<br>Cc:=C2=A0Benjamin=
 Fair &lt;<a href=3D"mailto:benjaminfair@google.com" target=3D"_blank">benj=
aminfair@google.com</a>&gt;, Avi Fishman &lt;<a href=3D"mailto:avifishman70=
@gmail.com" target=3D"_blank">avifishman70@gmail.com</a>&gt;, Tali Perry &l=
t;<a href=3D"mailto:tali.perry1@gmail.com" target=3D"_blank">tali.perry1@gm=
ail.com</a>&gt;, Patrick Venture &lt;<a href=3D"mailto:venture@google.com" =
target=3D"_blank">venture@google.com</a>&gt;, Nancy Yuen &lt;<a href=3D"mai=
lto:yuenn@google.com" target=3D"_blank">yuenn@google.com</a>&gt;, Rob Herri=
ng &lt;<a href=3D"mailto:robh%2Bdt@kernel.org" target=3D"_blank">robh+dt@ke=
rnel.org</a>&gt;, OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozla=
bs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;, devicetree &lt;=
<a href=3D"mailto:devicetree@vger.kernel.org" target=3D"_blank">devicetree@=
vger.kernel.org</a>&gt;, Linux Kernel Mailing List &lt;<a href=3D"mailto:li=
nux-kernel@vger.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org<=
/a>&gt;<br>Bcc:=C2=A0<br>Date:=C2=A0Mon, 1 Mar 2021 15:36:58 +0200<br>Subje=
ct:=C2=A0Re: [PATCH] ARM: dts: nuvoton: Fix flash layout<br><div dir=3D"ltr=
">Hi Anton,<div><br></div><div>The reason the u-boot Env is at 0x100000 add=
ress is that some costumers=C2=A0have:</div><div>one copy of Bootblock and =
U-boot at 0x0 - 0x80000</div><div>second copy of Bootblock and U-boot at 0x=
80000 - 0x100000.</div><div><br></div><div>we have two options;</div><div>1=
. Modify the OpenBMC device tree flash layout u-boot Env address to 0x10000=
0.<br></div><div>2. Add a patch to OpnBMC platform that using openbmc flash=
 layout to modify=C2=A0<span style=3D"box-sizing:border-box;font-family:SFM=
ono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:=
12px;white-space:pre-wrap">CONFIG_ENV_OFFSET </span><span style=3D"box-sizi=
ng:border-box;white-space:pre-wrap"><font face=3D"arial, sans-serif">in the=
 u-boot.</font></span></div><div><span style=3D"box-sizing:border-box;white=
-space:pre-wrap"><font face=3D"arial, sans-serif"><br></font></span></div><=
div><span style=3D"box-sizing:border-box;white-space:pre-wrap"><font face=
=3D"arial, sans-serif">Thanks,</font></span></div><div><span style=3D"box-s=
izing:border-box;white-space:pre-wrap"><font face=3D"arial, sans-serif"><br=
></font></span></div><div><span style=3D"box-sizing:border-box;white-space:=
pre-wrap"><font face=3D"arial, sans-serif">Tomer</font></span></div><div><s=
pan style=3D"box-sizing:border-box;white-space:pre-wrap"><font face=3D"aria=
l, sans-serif"><br></font></span></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 26 Feb 2021 at 22:10, Anton =
Kachalov &lt;<a href=3D"mailto:gmouse@google.com" target=3D"_blank">gmouse@=
google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hello, Tomer.<br></div><div di=
r=3D"ltr"><div><br></div><div>Seems like Nuvoton&#39;s=C2=A0u-boot expects =
the uboot-env at different address comparing to openbmc-flash-layout.dtsi:<=
/div><div><br></div><div><a href=3D"https://github.com/Nuvoton-Israel/u-boo=
t/blob/npcm7xx-v2019.01/include/configs/poleg.h#L30" target=3D"_blank">http=
s://github.com/Nuvoton-Israel/u-boot/blob/npcm7xx-v2019.01/include/configs/=
poleg.h#L30</a><br></div><div><br></div><div>Vs.</div><div><br></div><div><=
a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/arch/arm/boot/dts/openbmc-flash-layout.dtsi#n13" target=3D"_blank">h=
ttps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch=
/arm/boot/dts/openbmc-flash-layout.dtsi#n13</a><br></div><div><br></div><di=
v>The change is more about making partitions naming the same as expected by=
 OpenBMC.</div><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, 21 Feb 2021 at 17:40, Tomer Maimon &lt;<a=
 href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tmaimon77@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Benjamin and Anton,<div><br></div>=
<div>Sorry for the late reply,</div><div><br></div><div><p class=3D"MsoNorm=
al" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif">The =
EVB FIU0-CS0
partitioning=C2=A0is used for testing=C2=A0the EVB and this is why it is
different=C2=A0than the OpenBMC flash layout.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Are you using the NPCM7XX EVB for
OpenBMC? if yes we can consider to modify the flash partition to OpenBMC us=
e.</font></p></div><div><br></div></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 18 Feb 2021 at 19:11, Benjamin Fair &=
lt;<a href=3D"mailto:benjaminfair@google.com" target=3D"_blank">benjaminfai=
r@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 18 Feb 2021 at 04:42, &lt;<a href=3D"mailto:gmouse@goog=
le.com" target=3D"_blank">gmouse@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: &quot;Anton D. Kachalov&quot; &lt;<a href=3D"mailto:gmouse@googl=
e.com" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt;<br>
&gt; This change satisfy OpenBMC requirements for flash layout.<br>
&gt;<br>
&gt; Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:gmouse@google.c=
om" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------=
------<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot=
/dts/nuvoton-npcm750-evb.dts<br>
&gt; index bd1eb6ee380f..741c1fee8552 100644<br>
&gt; --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
&gt; +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
&gt; @@ -182,8 +182,8 @@ bbuboot2@80000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0080000 0x800=
00&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-only;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0envparam@100000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;env-param&quot;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ubootenv@100000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;u-boot-env&quot;;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0100000 0x400=
00&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-only;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; @@ -195,25 +195,13 @@ kernel@200000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;kernel&quot=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0200000 0x400=
000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rootfs@600000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rootfs&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0600000 0x700000&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rofs@780000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rofs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0780000 0x1680000&g=
t;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare1@D00000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare1&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0D00000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare2@0F00000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare2&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0F00000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare3@1100000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare3&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1100000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare4@1300000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare4&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1300000 0x0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rwfs@1e00000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rwfs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e00000 0x200000&gt=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
I recommend just including the openbmc-flash-layout.dtsi file here<br>
instead since that contains the common flash layout for most OpenBMC<br>
systems.<br>
<br></blockquote><div>Good=C2=A0<font face=3D"arial, sans-serif">solution</=
font>,=C2=A0</div><div>Do you mean nuvoton-openbmc-flash-layout?</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; --<br>
&gt; 2.30.0.478.g8a0d178c01-goog<br>
&gt;<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>T=
omer=C2=A0</div></div></div>
</blockquote></div></div>
</blockquote></div>
<br><br><br>---------- Forwarded message ----------<br>From:=C2=A0Brad Bish=
op &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" target=3D"_blank">bra=
dleyb@fuzziesquirrel.com</a>&gt;<br>To:=C2=A0&quot;Wludzik, Jozef&quot; &lt=
;<a href=3D"mailto:jozef.wludzik@linux.intel.com" target=3D"_blank">jozef.w=
ludzik@linux.intel.com</a>&gt;<br>Cc:=C2=A0<a href=3D"mailto:openbmc@lists.=
ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>Bcc:=C2=A0<br=
>Date:=C2=A0Mon, 1 Mar 2021 10:05:52 -0500<br>Subject:=C2=A0Re: any in-prog=
ress Redfish TelemetryService enhancements?<br>On Wed, Feb 24, 2021 at 01:0=
9:56PM +0100, Wludzik, Jozef wrote:<br>
&gt;Hi, &quot;Append&quot; is on the list of to dos and should be ready til=
l summer<br>
&gt;(might be ready). <br>
<br>
That&#39;s great!=C2=A0 Any chance you could you provide any hints on how y=
ou <br>
expect it to be implemented - I&#39;m not sure if I can wait that long to <=
br>
get started.=C2=A0 I would like to make sure that if I start working on it,=
 <br>
it will have your approval from a high level view.=C2=A0 If you have not <b=
r>
given it any thought, no problem - I&#39;ll come up with a proposal and <br=
>
report back here.<br>
<br>
<br><br><br>---------- Forwarded message ----------<br>From:=C2=A0Klaus Hei=
nrich Kiwi &lt;<a href=3D"mailto:klaus@linux.vnet.ibm.com" target=3D"_blank=
">klaus@linux.vnet.ibm.com</a>&gt;<br>To:=C2=A0<a href=3D"mailto:openbmc@li=
sts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>, Joel Stanle=
y &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a=
>&gt;, Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_bla=
nk">andrew@aj.id.au</a>&gt;, Ryan Chen &lt;<a href=3D"mailto:ryan_chen@aspe=
edtech.com" target=3D"_blank">ryan_chen@aspeedtech.com</a>&gt;<br>Cc:=C2=A0=
<br>Bcc:=C2=A0<br>Date:=C2=A0Mon, 1 Mar 2021 16:25:03 -0300<br>Subject:=C2=
=A0(Aspeed2600) Booting with a SPL loading U-boot fitImage<br>Has anyone be=
en able to successfully bring-up U-boot proper as a fitImage from the SPL, =
when using U-boot from the 2019.4 Aspeed SDK?<br>
<br>
The current configuration for Rainier (ast2600_openbmc_spl_emmc_defconfig) =
has, among other things, CONFIG_SPL_LOAD_FIT=3Dy which at the end of the bu=
ild process should produce a spl/u-boot-spl.bin file (which is really the c=
oncatenation of u-boot-spl-nodtb.bin + u-boot-spl.dtb) and a u-boot.img fil=
e, which is a FIT image created with &#39;mkimage -f auto -A arm -T firmwar=
e -C none -O u-boot -a 0x10000 -e 0 -n &quot;U-Boot 2019.04&quot;&quot; for=
 evb_ast2600a1 board&quot; -E=C2=A0 -d u-boot-nodtb.bin u-boot.img&#39;<br>
<br>
I tried loading this pair using qemu-system-arm (Aspeed 6.0 branch from Ced=
ric Legoater), the SPL loads but fails to load the U-boot fit Image apparen=
tly:<br>
<br>
----<br>
$ dd of=3Dmmc-image.img if=3D/dev/zero bs=3D1M count=3D128<br>
$ dd of=3Dmmc-image.img if=3D../uboot-build/spl/u-boot-spl.bin conv=3Dnotru=
nc<br>
=C2=A0 =C2=A054454 bytes (54 kB, 53 KiB) copied<br>
$ dd of=3Dmmc-image.img if=3D../uboot-build/u-boot.img conv=3Dnotrunc bs=3D=
1K seek=3D64<br>
=C2=A0 =C2=A0429640 bytes (430 kB, 420 KiB) copied<br>
$ xzdec tmp/deploy/images/rainier/obmc-phosphor-image-rainier.wic.xz | dd o=
f=3Dmmc-image.img conv=3Dnotrunc bs=3D1M seek=3D2<br>
$ truncate --size 16G mmc-image.img<br>
$ qemu-system-arm -M rainier-bmc -nographic -drive file=3Dmmc-image.img,if=
=3Dsd,format=3Draw,id=3Dsd0,index=3D2 -nodefaults -serial mon:stdio<br>
&lt;..snip..&gt;<br>
aspeed_sdhci_probe: CLK 200000000<br>
ofnode_read_u32: bus-width: x (4)<br>
ofnode_read_u32: sdhci-drive-type: x (1)<br>
clock is disabled (0Hz)<br>
clock is enabled (400000Hz)<br>
clock is enabled (25000000Hz)<br>
blk_find_device: if_type=3D6, devnum=3D0: emmc_slot0@100.blk, 6, 0<br>
Jumping to U-Boot<br>
SPL malloc() used 0xf4 bytes (0 KB)<br>
loaded - jumping to U-Boot...<br>
image entry point: 0x81000000<br>
-----<br>
<br>
At this point it just sits there with no progress..<br>
<br>
Another interesting point here is that if I use a legacy uboot image (the c=
oncatenation of u-boot-nodtb.bin + u-boot.dtb), I can bring-up u-boot prope=
r and it will work just fine, even if the same defconfig has &#39;# CONFIG_=
SPL_LEGACY_IMAGE_SUPPORT is not set&#39;<br>
<br>
----<br>
clock is enabled (25000000Hz)<br>
blk_find_device: if_type=3D6, devnum=3D0: emmc_slot0@100.blk, 6, 0<br>
Jumping to U-Boot<br>
SPL malloc() used 0xf4 bytes (0 KB)<br>
loaded - jumping to U-Boot...<br>
image entry point: 0x81000000<br>
<br>
<br>
U-Boot 2019.04 (Feb 27 2021 - 15:21:29 +0000)<br>
<br>
SOC: AST2600-A1<br>
eSPI Mode: SIO:Enable : SuperIO-2e<br>
Eth: MAC0: RMII/NCSI, MAC1: RMII/NCSI, MAC2: RMII/NCSI, MAC3: RMII/NCSI<br>
Model: Rainier<br>
DRAM:=C2=A0 already initialized, 1008 MiB (capacity:1024 MiB, VGA:64 MiB), =
ECC off<br>
MMC:=C2=A0 =C2=A0emmc_slot0@100: 0<br>
Loading Environment from MMC... OK<br>
In:=C2=A0 =C2=A0 serial@1e784000<br>
Out:=C2=A0 =C2=A0serial@1e784000<br>
Err:=C2=A0 =C2=A0serial@1e784000<br>
Model: Rainier<br>
Net:=C2=A0 =C2=A0No MDIO found.<br>
ftgmac100_probe - NCSI detected<br>
----<br>
<br>
That probably explains why we have been able to boot the rainier OpenBMC im=
age (even if u-boot is configured to use SPL + U-Boot FIT, the kernel-fitim=
age.bbclass creates a &quot;new&quot; u-boot image by concatenating the afo=
rementioned binaries).<br>
<br>
I tried a few different settings for the .config and also tried debugging t=
he SPL, but it&#39;s a very constrained environment and at this point I&#39=
;m a bit out of ideas.<br>
<br>
So has anyone been able to make this work?<br>
<br>
<br>
<br>
<br>
-- <br>
Klaus Heinrich Kiwi &lt;<a href=3D"mailto:klaus@linux.vnet.ibm.com" target=
=3D"_blank">klaus@linux.vnet.ibm.com</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000cc304405bc890b74--
