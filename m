Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C6573B67
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 18:41:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljjzt1JR7z3c52
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 02:40:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jqSzL3j2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=wltu@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jqSzL3j2;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjjzN1s3Cz3c2G
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 02:40:30 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id r186so3735020pgr.2
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hMy5MAoZe1aD3gMegYJgi+uAMsCTtfVzHg6OpxFzEvg=;
        b=jqSzL3j2vyAPDBvp8QS4Qj3KX8EUuz2FJBMpas+997y6TZA4JKnJga5QZDFWv7+mxp
         xAwrc2Ht8rOvmov2s9v8N2QZ6L6FOefXaKr7xcXPPfLiSa2YtVmuWdugsuEF8bN0TJW2
         We2st+l3zFTbkk8gcd5SceUpK4uRdMpUiIUA+mF6SCcCLUptyu7/3kjIA9pJbu+jnXsH
         H5xsxFrzB2sk/lbK67GDSo484D0AkIS/ZHfQK+LdMbctp9RFa3J2ymn0ZvSjK4uXsHyn
         Mo88k1ARQQ8dtFBND/4lhBxPBtyaLqBbJnLu3LpHhWHCZgffZTfTogsJMo7e70p8IWtt
         qUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hMy5MAoZe1aD3gMegYJgi+uAMsCTtfVzHg6OpxFzEvg=;
        b=Fgx8NJCKu0RF7HUEZY7QxBTzSo0PLNL481ZJi4AOvmaNxiE7GiFFJlBJWQ49VC2PN+
         JE5ez1xB0y8293l1hlM9X5jBo8lpJEKLe85xP5GdPC0x+uE14DVfq7cHlcdgVA59jcMm
         dd7odut4W6N1owtva/y7FR8ijh42ZgiI+o37oGSSFHXacx2U3FY/ytmUGtjhaAwT2jzI
         UfxePuHAyMiknUBrIBKtgbmbD+k6ZBcEt7uvJjvPDg9u0MHJxIWeGJrfJTje6Nn7FLCy
         PsmL1YSpGCDRTeX7jAsddVUS3oMJUwCWtj0L9CZqi8NL/7xquLI/9ftCLCCwxCF9OHeN
         dU4A==
X-Gm-Message-State: AJIora/NT6L/qW54oxIjXr9IE/VZMxaTKxMN4SKiCq8WpZ1Yk55oZNT3
	ffRxCD1k/azh96f5Td1JFoRterGDAoi9VFkwB6+PeA==
X-Google-Smtp-Source: AGRyM1sGlut5gW0U0GrIOx/IIN1lkWmJq5d+IdITx9iVcziey0I+n+5nOCxmKBwJCLe6NL0e+OCj8TNO3kvzXWOZJ6w=
X-Received: by 2002:a65:6893:0:b0:412:a990:c06a with SMTP id
 e19-20020a656893000000b00412a990c06amr3535602pgt.126.1657730427585; Wed, 13
 Jul 2022 09:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB5514B0E05D21D8F96A11EDB2DC899@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514B0E05D21D8F96A11EDB2DC899@DM6PR08MB5514.namprd08.prod.outlook.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 13 Jul 2022 09:40:16 -0700
Message-ID: <CAHwn2X=5L2uSgYBnbpC-trK1Tw-+chnwXd19WBiSd_9-vbwe=Q@mail.gmail.com>
Subject: Re: [phosphor-ipmi-flash]: Question about in-band update of BMC firmware
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Content-Type: multipart/alternative; boundary="00000000000046109205e3b2716e"
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
Cc: "chris6906@gmail.com" <chris6906@gmail.com>, Brandon Kim <brandonkim@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000046109205e3b2716e
Content-Type: text/plain; charset="UTF-8"

Hi Chris,

I think you were able to set it up correctly. Can you check if you can
read/write to the flash memory on the BMC 0x98000000? I am also wondering
if that address is correct  or not. Like if that address is mapped to the
BMC's memory. I have hit an issue where the image transferred does not
match because the BIOS didn't set that up properly. I am unsure how to set
that up.

Willy Tu

On Wed, Jul 13, 2022 at 1:15 AM Chris Chen (TPI) <Chris.Chen3@flex.com>
wrote:

> Hi Brandon and William,
>
>
>
> As you know, I have already built the "burn_my_bmc" on my Host (Eagle
> Stream with Aspeed 2600). I for now tried to use it to do the in-band
> update of BMC firmware, the debug messages of the "burn_my_bmc" look good
> and I also got "bmc-image" and "bmc.sig" file in the "/run/initramfs" and
> "/tmp" directory respectively via LPC data transfer mechanism on the BMC.
> However, one thing is strange which is the content of the "bmcimage" and
> "bmc.sig" file are all 0xff. I think this should not be the normal case,
> perhaps I made a mistake. Following are my steps/changes on the Host-side
> and BMC-side, could you please take a look at it, is there anything wrong?
> Or do you have any suggestions for enabling the feature? Thanks.
>
>
>
> *Host-side*
>
> =====
>
>    - The e820 map of the Host system (just choose one area randomly,
>    should I need to reserve a specific area for this??)
>    ####
>    archer@archer-ArcherCityM:mtd.all$ sudo dmesg | grep e820
>
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff]
> usable
>
> [    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff]
> usable
>
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff]
> reserved                   *<-- choose this area.*
>
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006d8effff]
> usable
>
> [    0.000000] BIOS-e820: [mem 0x000000006d8f0000-0x000000006f9effff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x000000006f9f0000-0x00000000702effff] ACPI
> data
>
> [    0.000000] BIOS-e820: [mem 0x00000000702f0000-0x0000000072c2ffff] ACPI
> NVS
>
> [    0.000000] BIOS-e820: [mem 0x0000000072c30000-0x00000000777fefff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x00000000777ff000-0x00000000777fffff]
> usable
>
> [    0.000000] BIOS-e820: [mem 0x0000000077800000-0x000000008fffffff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff]
> reserved
>
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047fffffff]
> usable
>
> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable ==> usable
>
> [    0.000000] e820: update [mem 0x624a8018-0x624b0057] usable ==> usable
>
> [    0.000022] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
>
> [    0.000027] e820: remove [mem 0x000a0000-0x000fffff] usable
>
> [    0.003943] e820: update [mem 0x80000000-0xffffffff] usable ==> reserved
>
> [    0.017281] e820: update [mem 0x69d87000-0x69d87fff] usable ==> reserved
>
> [    0.017300] e820: update [mem 0x686c6000-0x686c6fff] usable ==> reserved
>
> [    5.045333] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
>
> [    5.045336] e820: reserve RAM buffer [mem 0x624a8018-0x63ffffff]
>
> [    5.045338] e820: reserve RAM buffer [mem 0x686c6000-0x6bffffff]
>
> [    5.045340] e820: reserve RAM buffer [mem 0x69d87000-0x6bffffff]
>
> [    5.045341] e820: reserve RAM buffer [mem 0x6d8f0000-0x6fffffff]
>
> [    5.045342] e820: reserve RAM buffer [mem 0x77800000-0x77ffffff]
>
> [   33.565052] systemd[1]: Mounting Mount unit for e820-bios, revision 9...
>
> [   33.702641] systemd[1]: Mounted Mount unit for e820-bios, revision 9.
> ####
>
>    - The executed command and its result.
>    ####
>    archer@archer-ArcherCityM:mtd.all$ time sudo burn_my_bmc \
>                                                                --command
>    update \
>
>                                                             --interface
> ipmilpc
>                                                             --image
> ./image-bmc \
>                                                             --sig
> ./image-bmc.sig \
>                                                             --type image \
>                                                             --address
> 0x000a0000 \
>                                                             --length
> 0x10000
>
> Sending over the firmware image.
>
> sending writeMeta
>
> writemeta sent
>
> Progress: 100.00%
>
> Sending over the hash file.
>
> sending writeMeta
>
> writemeta sent
>
> Progress: 100.00%
>
> Opening the verification file
>
> Committing to /flash/verify to trigger service
>
> Calling stat on /flash/verify session to check status
>
> success
>
> succeeded
>
> Opening the update file
>
> Committing to /flash/update to trigger service
>
> Calling stat on /flash/update session to check status
>
> success
>
> succeeded
>
>
>
> real 0m17.616s
>
> user 0m0.046s
>
> sys 0m0.147s
>
> ####
>
> =====
>
>
>
> *BMC-side*
>
> =====
>
>    - Code changes
>
>
>    - Add to install "phosphor-ipmi-flash" and "phosphor-ipmi-blobs" these
>       two packages in packagegroup recipe.
>
> ####
> SUMMARY:${PN}-system = "Flex Ltd System"
>
> RDEPENDS:${PN}-system = " \
>
>         *phosphor-ipmi-blobs \*
>
> *        phosphor-ipmi-flash \*
>
>         "
>
> ####
>
>    - Add "phosphor-impi-flash_%.bbapend" recipe with these lines(Bold).
>
> ####
> *SRCREV = "c277935e6fe0cdcf8aefc45b53d11bd6ca20f964"*
>
>
>
> *PACKAGECONFIG:append = " static-bmc"*
>
> *PACKAGECONFIG:append = " aspeed-lpc"*
>
> *PACKAGECONFIG:append = " reboot-update"*
>
> *IPMI_FLASH_BMC_ADDRESS = "0x98000000"*
>
> ####
>
>    - Remove ",-Dupdate-type=none" in the phosphor-ipmi-flash_git.bb
>       recipe as below, because the "Enabled Firmware Update Features" and
>       "config-static-bmc-reboot.json" are not be included. This seems the
>       "update-type" would always pass "none" to "phosphor-impi-flash" package
>       without this change, but I'm not sure??
>
> ####
> *PACKAGECONFIG[static-bmc] = "-Dupdate-type=static-layout"*
> ####
>
>    - Add these lines(Bold). in Kernel dts file
>
> ####
>
> reserved-memory {
>
> #address-cells = <1>;
>
> #size-cells = <1>;
>
> ranges;
>
>
>
> video_engine_memory: video {
>
> size = <0x04000000>;
>
> alignment = <0x01000000>;
>
> compatible = "shared-dma-pool";
>
> reusable;
>
> };
>
>
>
> */* LPC FW cycle bridge region requires natural alignment */*
>
> * flash_memory: region@98000000 {*
>
> * no-map;*
>
> * reg = <0x98000000 0x04000000>; /* 64M */*
>
> * };*
>
> };
>
> *&lpc_ctrl {*
>
> * status = "okay";*
>
> * memory-region = <&flash_memory>;*
>
> *};*
>
> ####
>
>    - BMC console
>
>
>    - Manually modify "config-static-bmc-reboot.json" to skip
>       "preparation", "verification", and "update" actions because I want to make
>       sure image file transfer is okay first.
>       ####
>       root@hudsonbay-obmc:~# cat
>       /usr/share/phosphor-ipmi-flash/config-static-bmc-reboot.json
>
> [{
>
>         "blob": "/flash/image",
>
>         "handler": {
>
>                 "type": "file",
>
>                 "path": "/run/initramfs/bmc-image"
>
>         },
>
>         "actions": {
>
>                 "preparation": {
>
>                         "type": "skip"
>
>                 },
>
>                 "verification": {
>
>                         "type": "skip"
>
>                 },
>
>                 "update": {
>
>                         "type": "skip"
>
>                 }
>
>         }
>
> }]
> ####
>
>    - Create "/run/initramfs" directory manually.
>       ####
>       root@hudsonbay-obmc:~# mkdir /run/initramfs
>
> ####
>
>    - Result after executing burn_my_bmc command. (the content of
>       bmc-image and bmc.sig are all 0xff)
>       ####
>
> root@hudsonbay-obmc:~# ls -al /run/initramfs/bmc-image
> -rw-r--r--    1 root     root      67108864 Jan  1 01:47
> /run/initramfs/bmc-image
>
> root@hudsonbay-obmc:~# hexdump -C /run/initramfs/bmc-image
>
> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>  |................|
>
> *
>
> 04000000
>
> root@hudsonbay-obmc:~# ls -al /tmp/bmc.sig
>
> -rw-r--r--    1 root     root           128 Jan  1 01:47 /tmp/bmc.sig
>
> root@hudsonbay-obmc:~# hexdump -C /tmp/bmc.sig
>
> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
>  |................|
>
> *
>
> 00000080
> ####
>
> =====
>
>
>
> Regards,
>
> Chris Chen
> Legal Disclaimer :
> The information contained in this message may be privileged and
> confidential.
> It is intended to be read only by the individual or entity to whom it is
> addressed
> or by their designee. If the reader of this message is not the intended
> recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of
> this message!
>

--00000000000046109205e3b2716e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Chris,<div><br></div><div>I think you were able to=
 set it up correctly. Can you check if you can read/write to the flash memo=
ry on the BMC=C2=A00x98000000? I am also wondering if that address is corre=
ct=C2=A0 or not. Like if that address is mapped to the BMC&#39;s memory. I =
have hit an issue where the image transferred=C2=A0does not match because t=
he BIOS didn&#39;t set that up properly. I am unsure how to set that up.</d=
iv><div><br></div><div>Willy Tu</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 13, 2022 at 1:15 AM Chris =
Chen (TPI) &lt;<a href=3D"mailto:Chris.Chen3@flex.com">Chris.Chen3@flex.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-6808203018834586040WordSection1">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black">Hi Brandon and William,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black">As you know, I have already built the &quot;burn_my_bmc=
&quot; on my Host (Eagle Stream with Aspeed 2600). I for now tried to use i=
t to do the in-band update of BMC firmware,
 the debug messages of the &quot;burn_my_bmc&quot; look good and I also got=
 &quot;bmc-image&quot; and &quot;bmc.sig&quot; file in the &quot;/run/initr=
amfs&quot; and &quot;/tmp&quot; directory respectively via LPC data transfe=
r mechanism on the BMC. However, one thing is strange which is the content =
of the
 &quot;bmcimage&quot; and &quot;bmc.sig&quot; file are all 0xff. I think th=
is should not be the normal case, perhaps I made a mistake. Following are m=
y steps/changes on the Host-side and BMC-side, could you please take a look=
 at it, is there anything wrong? Or do you have any
 suggestions for enabling the feature? Thanks. <u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;font-family:Arial,s=
ans-serif;color:black">Host-side</span></b><span style=3D"font-size:12pt;fo=
nt-family:Arial,sans-serif;color:black"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black">=3D=3D=3D=3D=3D<u></u><u></u></span></p>
</div>
<div>
<ul type=3D"disc">
<li class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"color:bla=
ck;margin-bottom:0in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif">The=C2=A0e820 m=
ap of the Host system (just choose one area randomly, should I need to rese=
rve a specific area for this??)<br>
####<br>
archer@archer-ArcherCityM:mtd.all$ sudo dmesg | grep e820 <u></u><u></u></s=
pan></li></ul>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dff=
f] usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009eff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009fff=
f] usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000ffff=
f] reserved=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<b>&lt;-- choose this area.</b><u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x000000006d8efff=
f] usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000006d8f0000-0x000000006f9efff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000006f9f0000-0x00000000702efff=
f] ACPI data<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000702f0000-0x0000000072c2fff=
f] ACPI NVS<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000072c30000-0x00000000777feff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000777ff000-0x00000000777ffff=
f] usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000077800000-0x000000008ffffff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010ff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000fffffff=
f] reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047ffffff=
f] usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=
=3D&gt; usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000000] e820: update [mem 0x624a8018-0x624b0057] usable =3D=
=3D&gt; usable<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000022] e820: update [mem 0x00000000-0x00000fff] usable =3D=
=3D&gt; reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.000027] e820: remove [mem 0x000a0000-0x000fffff] usable<u></=
u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.003943] e820: update [mem 0x80000000-0xffffffff] usable =3D=
=3D&gt; reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.017281] e820: update [mem 0x69d87000-0x69d87fff] usable =3D=
=3D&gt; reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A00.017300] e820: update [mem 0x686c6000-0x686c6fff] usable =3D=
=3D&gt; reserved<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045333] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045336] e820: reserve RAM buffer [mem 0x624a8018-0x63ffffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045338] e820: reserve RAM buffer [mem 0x686c6000-0x6bffffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045340] e820: reserve RAM buffer [mem 0x69d87000-0x6bffffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045341] e820: reserve RAM buffer [mem 0x6d8f0000-0x6fffffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 =C2=A05.045342] e820: reserve RAM buffer [mem 0x77800000-0x77ffffff]=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 33.565052] systemd[1]: Mounting Mount unit for e820-bios, revision 9=
...<u></u><u></u></span></p>
</div>
<p class=3D"gmail-m_-6808203018834586040elementtoproof" style=3D"margin-rig=
ht:0in;margin-bottom:0in;margin-left:0.5in">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black">[ =
=C2=A0 33.702641] systemd[1]: Mounted Mount unit for e820-bios, revision 9.=
<br>
####<u></u><u></u></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif">The executed co=
mmand and its result.<br>
####<br>
archer@archer-ArcherCityM:mtd.all$ time sudo burn_my_bmc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --command up=
date \<u></u><u></u></span></li></ul>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --interface ipmilpc<span style=3D"backgr=
ound:white">=C2=A0<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --ima=
ge ./image-bmc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sig ./imag=
e-bmc.sig \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --type image=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --address 0x=
000a0000 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --length 0x1=
0000<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Sending over the firmware i=
mage.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">sending writeMeta<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">writemeta sent<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Progress: 100.00%<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Sending over the hash file.=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">sending writeMeta<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">writemeta sent<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Progress: 100.00%<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Opening the verification fi=
le<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Committing to /flash/verify=
 to trigger service<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Calling stat on /flash/veri=
fy session to check status<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">success<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">succeeded<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Opening the update file<u><=
/u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Committing to /flash/update=
 to trigger service<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">Calling stat on /flash/upda=
te session to check status<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">success<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">succeeded<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black"><u></u>=C2=A0<u></u></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">real=E2=80=82=E2=80=820m17.=
616s<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">user=E2=80=82=E2=80=820m0.0=
46s<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">sys=E2=80=82=E2=80=82=E2=80=
=820m0.147s<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:0.5in"><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black">####<u></u><u></u></span></=
p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black;background:white">=3D=3D=3D=3D=3D</span><span style=3D"f=
ont-size:12pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;font-family:Arial,s=
ans-serif;color:black;background:white">BMC-side</span></b><span style=3D"f=
ont-size:12pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black;background:white">=3D=3D=3D=3D=3D
<u></u><u></u></span></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Code changes<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Add to install &quot;phosphor-ipmi-flash&quot; and &quot;phosphor-ipmi-bl=
obs&quot; these two packages in packagegroup recipe.<u></u><u></u></span></=
li></ul>
</ul>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><br>
SUMMARY:${PN}-system =3D &quot;Flex Ltd System&quot; <u></u><u></u></span><=
/span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">RDEPENDS:${P=
N}-system =3D &quot; \<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0
<b>phosphor-ipmi-blobs \</b><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 phosphor-ipmi-flash \</span></b><span style=3D"font-si=
ze:12pt;font-family:Arial,sans-serif;color:black;background:white"><u></u><=
u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><u></u><u></u></span></span></p>
</div>
<div>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Add &quot;phosphor-impi-flash_%.bbapend&quot; recipe with these lines(Bol=
d).<u></u><u></u></span></li></ul>
</ul>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><br>
<b>SRCREV =3D &quot;c277935e6fe0cdcf8aefc45b53d11bd6ca20f964&quot;</b> <u><=
/u><u></u></span></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white"><u></u>=C2=
=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">PACKAGECO=
NFIG:append =3D &quot; static-bmc&quot;</span></b><span style=3D"font-size:=
12pt;font-family:Arial,sans-serif;color:black;background:white"><u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">PACKAGECO=
NFIG:append =3D &quot; aspeed-lpc&quot;</span></b><span style=3D"font-size:=
12pt;font-family:Arial,sans-serif;color:black;background:white"><u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">PACKAGECO=
NFIG:append =3D &quot; reboot-update&quot;</span></b><span style=3D"font-si=
ze:12pt;font-family:Arial,sans-serif;color:black;background:white"><u></u><=
u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">IPMI_FLAS=
H_BMC_ADDRESS =3D &quot;0x98000000&quot;</span></b><span style=3D"font-size=
:12pt;font-family:Arial,sans-serif;color:black;background:white"><u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><u></u><u></u></span></span></p>
</div>
<div>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Remove &quot;,-Dupdate-type=3Dnone&quot; in the <a href=3D"http://phospho=
r-ipmi-flash_git.bb" target=3D"_blank">phosphor-ipmi-flash_git.bb</a> recip=
e as below, because the &quot;Enabled Firmware Update Features&quot; and &q=
uot;config-static-bmc-reboot.json&quot; are not be included.
 This seems the &quot;update-type&quot; would always pass &quot;none&quot; =
to &quot;phosphor-impi-flash&quot; package without this change, but I&#39;m=
 not sure??<u></u><u></u></span></li></ul>
</ul>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><br>
<b>PACKAGECONFIG[static-bmc] =3D &quot;-Dupdate-type=3Dstatic-layout&quot;<=
/b><br>
</span>####<span style=3D"background:white"><u></u><u></u></span></span></p=
>
<div>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Add these lines(Bold). in Kernel dts file<u></u><u></u></span></li></ul>
</ul>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><u></u><u></u></span></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">reserved-mem=
ory {
<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#address-cells =3D &lt;1=
&gt;;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82#size-cells =3D &lt;1&gt=
;;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82ranges;<u></u><u></u></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white"><u></u>=C2=
=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82video_engine_memory: vid=
eo {<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82size =3D &lt;0x04000000&gt;;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82alignment =3D &lt;0x01000000&gt;;<u></u><u></u></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82compatible =3D &quot;shared-dma-pool&quot;;<u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82reusable;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};<u></u><u></u></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white"><u></u>=C2=
=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82<b>/* LPC FW cycle bridg=
e region requires natural alignment */</b><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82flash_memory: region@=
98000000 {</span></b><span style=3D"font-size:12pt;font-family:Arial,sans-s=
erif;color:black;background:white"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82no-map;</span></b><span style=3D"font-size:12pt;fon=
t-family:Arial,sans-serif;color:black;background:white"><u></u><u></u></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=
=80=82=E2=80=82=E2=80=82reg =3D &lt;0x98000000 0x04000000&gt;; /* 64M */</s=
pan></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:bl=
ack;background:white"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82};</span></b><span st=
yle=3D"font-size:12pt;font-family:Arial,sans-serif;color:black;background:w=
hite"><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">};<br>
<br>
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">&amp;lpc_=
ctrl {</span></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif=
;color:black;background:white"><u></u><u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82status =3D &quot;okay&quot;;</=
span></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:b=
lack;background:white"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82memory-region =3D &lt;&amp;fla=
sh_memory&gt;;</span></b><span style=3D"font-size:12pt;font-family:Arial,sa=
ns-serif;color:black;background:white"><u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><b><span style=3D"font-siz=
e:12pt;font-family:Arial,sans-serif;color:black;background:white">};</span>=
</b><span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:black;=
background:white"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">####<span style=3D"background=
:white"><u></u><u></u></span></span></p>
</div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">BMC console<u></u><u></u></span></li></ul>
<ul style=3D"margin-top:0in" type=3D"disc">
<ul style=3D"margin-top:0in" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Manually modify &quot;config-static-bmc-reboot.json&quot; to skip &quot;p=
reparation&quot;, &quot;verification&quot;, and &quot;update&quot; actions =
because I want to make sure image file transfer is okay first.<br>
</span><span style=3D"font-size:12pt;font-family:Arial,sans-serif">####<spa=
n style=3D"background:white"><br>
root@hudsonbay-obmc:~# cat /usr/share/phosphor-ipmi-flash/config-static-bmc=
-reboot.json
<u></u><u></u></span></span></li></ul>
</ul>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">[{<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;blob&quot;: &quot;/flash/image&quot;,<u></u><u></u>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;handler&quot;: {<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;file&=
quot;,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;/run/=
initramfs/bmc-image&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 },<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;actions&quot;: {<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;preparation&quot;: {<u>=
</u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;type&quot;: &quot;skip&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;verification&quot;: {<u=
></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;type&quot;: &quot;skip&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;update&quot;: {<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;type&quot;: &quot;skip&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">}]<br>
</span><span style=3D"font-size:12pt;font-family:Arial,sans-serif;color:bla=
ck">####<span style=3D"background:white"><u></u><u></u></span></span></p>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Create &quot;/run/initramfs&quot; directory manually.<br>
</span><span style=3D"font-size:12pt;font-family:Arial,sans-serif">###<span=
 style=3D"background:white">#<br>
root@hudsonbay-obmc:~# mkdir /run/initramfs<u></u><u></u></span></span></li=
></ul>
</ul>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black">###<span style=3D"background:=
white">#<u></u><u></u></span></span></p>
</div>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black">
<span style=3D"font-size:12pt;font-family:Arial,sans-serif;background:white=
">Result after executing burn_my_bmc command. (the content of bmc-image and=
 bmc.sig are all 0xff)<br>
</span><span style=3D"font-size:12pt;font-family:Arial,sans-serif">###<span=
 style=3D"background:white">#<u></u><u></u></span></span></li></ul>
</ul>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">root@hudsonb=
ay-obmc:~# ls -al /run/initramfs/bmc-image<br>
-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A067108=
864 Jan =C2=A01 01:47 /run/initramfs/bmc-image<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">root@hudsonb=
ay-obmc:~# hexdump -C /run/initramfs/bmc-image
<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">00000000 =C2=
=A0ff ff ff ff ff ff ff ff =C2=A0ff ff ff ff ff ff ff ff =C2=A0|...........=
.....|<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">*<u></u><u><=
/u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">04000000<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">root@hudsonb=
ay-obmc:~# ls -al /tmp/bmc.sig
<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">-rw-r--r-- =
=C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
28 Jan =C2=A01 01:47 /tmp/bmc.sig<u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">root@hudsonb=
ay-obmc:~# hexdump -C /tmp/bmc.sig
<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">00000000 =C2=
=A0ff ff ff ff ff ff ff ff =C2=A0ff ff ff ff ff ff ff ff =C2=A0|...........=
.....|<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">*<u></u><u><=
/u></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1in"><span style=3D"font-size:1=
2pt;font-family:Arial,sans-serif;color:black;background:white">00000080<br>
####<u></u><u></u></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black;background:white">=3D=3D=3D=3D=3D</span><span style=3D"f=
ont-size:12pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black">Regards,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12pt;font-family:Arial,sans=
-serif;color:black">Chris Chen<u></u><u></u></span></p>
</div>
</div>

<div>
Legal Disclaimer :<br>
The information contained in this message may be privileged and confidentia=
l. <br>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <br>
or by their designee. If the reader of this message is not the intended rec=
ipient, <br>
you are on notice that any distribution of this message, in any form, <br>
is strictly prohibited. If you have received this message in error, <br>
please immediately notify the sender and delete or destroy any copy of this=
 message!<br>
</div></div>

</blockquote></div>

--00000000000046109205e3b2716e--
