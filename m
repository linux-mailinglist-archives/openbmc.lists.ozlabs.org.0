Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84368F7A
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 16:14:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nQX42ZMgzDqSC
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 00:14:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kntdLgcU"; 
 dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nQVX1S2JzDqKP
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 00:13:23 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id ay6so8357949plb.9
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 07:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=kK5YdZ+t4gv2xmiqq/K4Yk0i5vBSD0CFvhX++exutpI=;
 b=kntdLgcU97PD36KFr9yvHbwY2O2taV1US4lOeer2RrfSzRfLmjcyMFgP+kB6P55ODw
 A9M9J1ingpCtjjGq2LK4RcUUJJYvh63/3yGf1mKNS4BbLIIAYkagN/wtfMAKBx7WgodD
 8Bfb33rdlyOymYBGgcsQr6SxDBKuAh+p5B7Bnw/OfZFBBwgpIRXNoh0DTNkOaawJ/lVB
 ANHU1+uNEdOjw203jU2U5MrL9jCZ9vKSSQ2y1D1zG4wgfNqRuMmP/qCc8zo0MZEaEZ5p
 xno0+3JWgh+1Zsfa02R752AOvVby7n3RJsetDYCUNPeXUM+EKd7HWa5Xpgn7i7+LY9K3
 DzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=kK5YdZ+t4gv2xmiqq/K4Yk0i5vBSD0CFvhX++exutpI=;
 b=QV0iGhWDolF2hRO9IK/+7CeV9ff1p3oXfUxFDo8HUQloaEjWF/vyjRpUc4xXIe+7IE
 +Xl7JhY5jywlXQjdjsEStWpY5bo6ygbgCKoRQ5N8wXrLznY4IavHzviZf5MKxu1XLs90
 ABlYs1g+lFymIfXoneqR+RdmkGuQcHPbkKkqH4EW0Sj/9AnfUOF+PSk4G85aO8+N7yTw
 mgBQlXCBEvg8bd1pZnwJUuq6hXoAfTuLTOmyGG0Pspt9c564dDYy+feEUw+yuvXMgi7b
 PXNZ7FsCfjjx1Xq2l7se3ZcIdEzfLRXyLMw1SKAwqkuFMH7W4pgE7cNuYmUUOVJOGHlO
 NIew==
X-Gm-Message-State: APjAAAXxgM7c3n3c/28ELk8TKFBOqHHR+Dp/3/1NwH65v95M93ZfXf8c
 /BOFtNXudGwrJzAMZO3Mig3JhnqNLbbaQxAxhpIn8w==
X-Google-Smtp-Source: APXvYqx964ksToBlydHnYwoSZ60n0kivEkHaiNb1X57yO9Ia/4Fn6RnixCcbHj9yeHXZlCzMCkRwvhpfQ3upyVhUYJ4=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr28486262plp.47.1563199999442; 
 Mon, 15 Jul 2019 07:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyXP_Cdrn_9GMgw+OvPYM7Ge9r_BbMiqgSJqS5EdrsumA@mail.gmail.com>
 <HK0PR03MB51239C4DDC3359F3AAC7F4EEDFF10@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB51239C4DDC3359F3AAC7F4EEDFF10@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Jul 2019 07:13:08 -0700
Message-ID: <CAO=notwWzEZ5ew-iT-pJTLSaJ0GLXopWfsJKx-jNokHjMU3Phw@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Aspeed LPC Tested
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Fair <benjaminfair@google.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 9, 2019 at 2:54 AM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hi Patrick,

Please always include the mailing list when reaching out for help for
a few reasons: 1) I'm not always around and others can help, 2) in the
future someone may have the same problem and find this discussion.
Thanks.

>
> I have few questions about Configuration B( nuvoton LPC)
>
> How do you know what value the MAPPED_ADDRESS should be?
> EXTRA_OECONF_append_b =3D " MAPPED_ADDRESS=3D0xc0008000"

Benjamin, how is this address chosen for nuvoton?  I know with the
aspeed-lpc driver it's the region specified in the device-tree, s.t.
the BMC kernel won't map anything into it (keep it free).

>
> These parameters are the input of running an application , but why can yo=
u just assign a address and length before allocating?
> --address 0xfedc1000
> --length 0x1000

The values passed here are where you've locked off space for this
purpose via your bios memory map configuration (or your kernel
configuration).  To say, keep this free.  IIRC.

>
>
> Thanks
>
> B.R.
> Medad
> -----Original Message-----
> From: openbmc <openbmc-bounces+george.hung=3Dquantatw.com@lists.ozlabs.or=
g> On Behalf Of Patrick Venture
> Sent: Thursday, June 27, 2019 3:55 AM
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Adriana Kobylak <anoo@us=
.ibm.com>
> Subject: phosphor-ipmi-flash: Aspeed LPC Tested
>
> The following three out-of-band data mechanisms are tested and supported =
by phosphor-ipmi-flash:
>  aspeed-p2a-ctl (PCI-to-AHB)
>  aspeed-lpc-ctl
>  nuvoton LPC
>
> Tested configurations:
>
> All the configurations have the cleanup blob enabled via the default PACK=
AGECONFIG in the recipe.
>
> Configuration A:
> This uses a static layout image, the lpc bridge, and aspeed.  Because it'=
s using the static layout, we enable the reboot-update*
>
> EXTRA_OECONF_append_a =3D " --enable-static-layout"
> EXTRA_OECONF_append_a =3D " --enable-lpc-bridge"
> EXTRA_OECONF_append_a =3D " --enable-aspeed-lpc"
> EXTRA_OECONF_append_a =3D " --enable-reboot-update"
> EXTRA_OECONF_append_a =3D " MAPPED_ADDRESS=3D0x98000000"
>
> The MAPPED_ADDRESS above is the region for lpc_ctrl in the device-tree.
>
> Host-tool command**:
> /tmp/phosphor_ipmi_flash_tool  \
>   --command update \
>   --interface ipmilpc \
>   --image image-bmc \
>   --sig image-bmc.sig \
>   --type static \
>   --address 0xfedc1000 \
>   --length 0x1000
> Sending over the firmware image.
> sending writeMeta
> writemeta sent
> Sending over the hash file.
> sending writeMeta
> writemeta sent
> Opening the verification file
> Committing to /flash/verify to trigger service Calling stat on /flash/ver=
ify session to check status other running success Returned success succeede=
d Opening the update file Committing to /flash/update to trigger service Ca=
lling stat on /flash/update session to check status running Opening the cle=
anup blob Exception received: blob exception received: Received IPMI_CC: bu=
sy
>
> Configuration B:
> This uses a static layout image, the lpc bridge, and nuvoton.  Because it=
's using the static layout, we enable the reboot-update*
>
> EXTRA_OECONF_append_b =3D " --enable-static-layout"
> EXTRA_OECONF_append_b =3D " --enable-lpc-bridge"
> EXTRA_OECONF_append_b =3D " --enable-nuvoton-lpc"
> EXTRA_OECONF_append_b =3D " --enable-reboot-update"
> EXTRA_OECONF_append_b =3D " MAPPED_ADDRESS=3D0xc0008000"
>
> Host-tool command**:
>
> /tmp/phosphor_ipmi_flash_tool  \
>   --command update \
>   --interface ipmilpc \
>   --image image-bmc \
>   --sig image-bmc.sig \
>   --type static \
>   --address 0xfedc1000 \
>   --length 0x1000
> Sending over the firmware image.
> sending writeMeta
> writemeta sent
> Sending over the hash file.
> sending writeMeta
> writemeta sent
> Opening the verification file
> Committing to /flash/verify to trigger service Calling stat on /flash/ver=
ify session to check status other running success Returned success succeede=
d Opening the update file Committing to /flash/update to trigger service Ca=
lling stat on /flash/update session to check status running Opening the cle=
anup blob Exception received: blob exception received: Received IPMI_CC: bu=
sy
>
> Configuration C:
> This uses a static layout image, the pci bridge, and aspeed.  Because it'=
s using the static layout, we enable the reboot-update*
>
> EXTRA_OECONF_append_c =3D " --enable-static-layout"
> EXTRA_OECONF_append_c =3D " --enable-pci-bridge"
> EXTRA_OECONF_append_c =3D " --enable-aspeed-p2a"
> EXTRA_OECONF_append_c =3D " --enable-reboot-update"
> EXTRA_OECONF_append_c =3D " MAPPED_ADDRESS=3D0x47FF0000"
>
> /tmp/phosphor_ipmi_flash_tool  \
>   --command update \
>   --interface ipmipci \
>   --image image-bmc \
>   --sig image-bmc.sig \
>   --type static
> Sending over the firmware image.
> sending writeMeta
> writemeta sent
> Sending over the hash file.
> sending writeMeta
> writemeta sent
> Opening the verification file
> Committing to /flash/verify to trigger service Calling stat on /flash/ver=
ify session to check status other running success Returned success succeede=
d Opening the update file Committing to /flash/update to trigger service Ca=
lling stat on /flash/update session to check status running Opening the cle=
anup blob Exception received: blob exception received: Received IPMI_CC: bu=
sy
>
> *I'm going to move this to a PACKAGECONFIG.
> **Compiled to run in our environment and not the default autotools method=
.
>
> I haven't tested the ipmibt interface in awhile, but I will give it a run=
 later.  I'm looking at extending the design to support sending down the ho=
st BIOS image.
>
> Patrick
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
