Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1F68FDC
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 16:17:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nQbT55q1zDqQj
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 00:17:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ifEPLucE"; 
 dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nQXb02GtzDqRp
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 00:15:10 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id t14so8339924plr.11
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=5/4773hU+uc3ux+iPeg3w8Qf8hDrRkHi7sgbB+8NjIM=;
 b=ifEPLucEgFZuNDhJD6Dow/SRTRF02+frg2/D2uQX1Mkg0oPptVIREIbjrxwutNQ9ni
 ZKT7IqJ0SeHNhudl+F+fER8UnPvXgmD4XfVtZxcSEE/Np4aSiLLn3XAfl0yFUaJMiia/
 FvC8ohKjBGeDhGAWXu9viHM52Z6I6NxZWnx/wSxhjvvZEnBl3uveVgxC6H5IJDNCpOIl
 61spxGOnlx17hqKa7JjebvmWaBHL4GX7hqFtiEiAZGf1dsaxEtBuRpqabw1GPqio2KwZ
 DTvUrPmRnm0v1NBDFAWYe0Ads7ZTMsiOvKzG9BfjjUYB6qhiM7j8b4D1PNT0WYhkBcsu
 iVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=5/4773hU+uc3ux+iPeg3w8Qf8hDrRkHi7sgbB+8NjIM=;
 b=Mlf+gQzmuyM3Bzy2FdFiD3TQ/5qhYiwBDMdn1uydjIUIUlKj1EPnBzRNKL/HoSwv+n
 nexP/i0PXaMBGu06krSBc3i3o9i53qAwSAfxqqOwZAovd7kYdqTofVPYJWosv+4g3OHZ
 AjoO76wFI3SSabZHvD4SZzyUihRNIf64YWXayscTzT6wPCbMyrAhgr+mahOrtQW9Qqdl
 TTyPcg3epCGj11nJSgrXiqTHOWcjDcIbCe5uNz886s/K1GScOGnj3gMnKoSC7CBtZEeH
 Dn9U+1SdW7frAIfXClDXLE+Pf5T61BJvZKPj9ZUkNe1xuJmimT8IRg/I6bFYbRSPXbF7
 Xnaw==
X-Gm-Message-State: APjAAAW4pQN0Ucvy2mzCCGqAo0hAX8TUcwMauu81T1ReOcL4POzY3gLG
 SpCDzUMQO2Gn0pxDtkYIhkZYg2oXwOBc0a3JXmmORPZ3YQI=
X-Google-Smtp-Source: APXvYqzGpvHnuouwjIoFnk/LH4rjZQeLyXWynZJVUGzNsEZMxxT2auS3Xo96edoimY5/d8AKuigZwezXBwQiieAlXZY=
X-Received: by 2002:a17:902:b944:: with SMTP id
 h4mr28047540pls.179.1563200106341; 
 Mon, 15 Jul 2019 07:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyXP_Cdrn_9GMgw+OvPYM7Ge9r_BbMiqgSJqS5EdrsumA@mail.gmail.com>
 <HK0PR03MB51239C4DDC3359F3AAC7F4EEDFF10@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <HK0PR03MB51237AB971B9227F8A003E75DFF20@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB51237AB971B9227F8A003E75DFF20@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 15 Jul 2019 07:14:55 -0700
Message-ID: <CAO=notwqCA0=3JL4=L1cbD2XZUv0KQ8NVentLoV0vp_5QSmiAg@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Aspeed LPC Tested
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

On Fri, Jul 12, 2019 at 1:32 AM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hi Patrick,
>
> I follow your instructions in Configuration B to build host tool and lib =
for BMC.
> But after I run
> ./burn_my_bmc  \
>   --command update \
>   --interface ipmilpc \
>   --image image-u-boot \
>   --sig image-u-boot.sig \
>   --type static \
>   --address 0xfedc1000 \
>   --length 0x1000
> , it will show
> /flash/image not found
> Exception received: Goal firmware or interface not supported

That's telling me that the BMC library compiled isn't configured for
this, or that something has failed at run-time on the BMC.  It's more
likely that the BMC library doesn't have all the flags set to do what
it needs configuration-wise, but that's just speculation.

Can you provide the configuration you're using?
Can you check the journalctl log to see if there are any messages from
the library?

>
> Please advise.
> Thanks a lot
>
> B.R.
> Medad
>
> -----Original Message-----
> From: CS20 CTCchien
> Sent: Tuesday, July 9, 2019 5:55 PM
> To: Patrick Venture <venture@google.com>
> Subject: RE: phosphor-ipmi-flash: Aspeed LPC Tested
>
> Hi Patrick,
>
> I have few questions about Configuration B( nuvoton LPC)
>
> How do you know what value the MAPPED_ADDRESS should be?
> EXTRA_OECONF_append_b =3D " MAPPED_ADDRESS=3D0xc0008000"
>
> These parameters are the input of running an application , but why can yo=
u just assign a address and length before allocating?
> --address 0xfedc1000
> --length 0x1000
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
