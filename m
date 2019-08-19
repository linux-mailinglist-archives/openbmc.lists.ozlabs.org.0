Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943F950A1
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 00:19:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C7dV3FpZzDqfk
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 08:19:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vcCpHoAE"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C7ct67m3zDqdr
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 08:19:10 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id f19so1229444plr.3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 15:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZZKtORGdMt8KjEqDN9W5ddgDj7ccnMbPTqVxBcxvG5I=;
 b=vcCpHoAEdvdn0wuiaRN1hwE8yMTV7zNv7ZEczW9c5ZR2zL7MqcFkLbESKBNQI8R2C0
 PSpycgM6oevRXtBcHcpfVP4KK90rTaztJZivjTmXf/Z0E8vH7j6u3OXcgB/Rs0ZDRNKb
 ltzRrQxZRsKg5a67zX2BHZEbeTWAVbm1IWLbiWAaU+gMjW9s/oIazHXps7Om9CdStdEW
 YvYD1TbEc7IVoenp9P81rGm3YeAHGBcSMMJYVEF7GiBGZ3AJ4yH52/Uo29j6GHtCDevy
 tMubxQfzaUoOGShIOUrMP4/B50Km5m/NXy5y7CkI1qH66hOipF8WIIvindtTVb0AYmRQ
 QFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZZKtORGdMt8KjEqDN9W5ddgDj7ccnMbPTqVxBcxvG5I=;
 b=tqOiC9qHjmVGj387nm4Jb/n57H4a5fXZc39yvd432H2R9bswyxFOTXlxd3kAc0pOAG
 fJ7R2jnSQlmm8K8D0He+3l5NfsZkDFcssp20xEDduRNyYpRtjoMkQt39WyQ2i/XObdiL
 2j13/i3P6W6b5IU+E9gH9Vxof4Rut6kZf13wthzp9Fqitsn+cjZHKhEzLBJjaWtVa+Bu
 h1+F19n+KeaczAdeiIUO79QGoFRs4gGUUaPj7JhHpmcg133Zos87cWQNfhAEVVccDrQ1
 iE/6H8wlAH3jRvEtqndvr1mTJZGtU2vjzr31Kf7L8DURzClOGtKiD4ISPq9bTgyqkb/E
 K3zA==
X-Gm-Message-State: APjAAAVOITuidWd1XCdMxdwem20uNFAS9omYumvXk2+2cpsd7zbp1dUo
 cWm4PQWO1OfvIEVk/kgnA8USS0SLwW+6B7b2crx1sw==
X-Google-Smtp-Source: APXvYqwOwwSXdBhJJmZYjqNYkK0Unlr0CkXWAU/vbmJHfXBGfLX8Ohk75pSvaRvesYowxvSFUt/949YGAEUEXn43BWw=
X-Received: by 2002:a17:902:e311:: with SMTP id
 cg17mr23943232plb.183.1566253146176; 
 Mon, 19 Aug 2019 15:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
 <CAO=notyjqi2m5LRDqRjSkTpYBmu5m_wr4JQnBeU8Vifg9_zLzw@mail.gmail.com>
 <4ACC3BDB-7E8D-4A4E-BBA7-A7B281A705C2@fb.com>
In-Reply-To: <4ACC3BDB-7E8D-4A4E-BBA7-A7B281A705C2@fb.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 19 Aug 2019 15:18:55 -0700
Message-ID: <CAO=noty_n2a5nHzL7O-hDRAuuhw8Mx8CXmTc-_0izpAzMCS_EQ@mail.gmail.com>
Subject: Re: [External] Re: ipmitool FRU write question
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Harry Sung1 <hsung1@lenovo.com>, Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 2:55 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 8/16/19, 11:02 AM, "openbmc on behalf of Patrick Venture" <op=
enbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of venture@go=
ogle.com> wrote:
>
>     On Fri, Aug 16, 2019 at 10:47 AM Harry Sung1 <hsung1@lenovo.com> wrot=
e:
>     >
>     >
>     > > On 8/15/19 6:49 AM, Harry Sung1 wrote:
>     > > > Hi Team,
>     > > >
>     > > >
>     > > >
>     > > > Current phosphor-host-ipmid does not support fru write command,=
 but
>     > > > ipmi-fru-parser supports it.
>     > > >
>     > > > We found this fru write command only update the data to dbus
>     > > > inventory, but doesn't sync the data back to the EEPROM.
>     > > >
>     > > > Does ipmi-fru-parser has any plans to implement it? I think it =
is more
>     > > > make sense to sync the data to EEPROM when we do fru write.
>     > >
>     > > The alternative FRU daemon from entity manager, FruDevice, suppor=
ts writing
>     > > the FRU directly.
>     > > https://github.com/openbmc/entity-manager/blob/master/src/FruDevi=
ce.cpp
>     > >
>     > > Happy to see this capability added to ipmi-fru-parser, but you mi=
ght be able to
>     > > model it off FruDevice.  If you want to use FruDevice as-is, you =
will need the
>     > > alternative FruWrite command sets from here.
>     > >
>     > > https://github.com/openbmc/intel-ipmi-oem/blob/159547cdfbf1992737=
dcecb
>     > > cb3888af7795f930b/src/storagecommands.cpp#L316
>     > >
>     > > As written, those commands change the behavior a bit, and double =
buffers the
>     > > FRU write commands.  When the last Fru write is sent, the data is=
 flushed
>     > > through the FRU parser to ensure that it's valid, and the user is=
n't doing
>     > > anything nefarious (like changing a product name or serial
>     > > number) before it writes the EEPROM in one chunk, as quickly as i=
t can to
>     > > reduce the possibility of a half written EEPROM.
>     >
>     > Hi Ed,
>     >
>     > Thanks for your kindly reply! I have surveyed the entity-manager be=
fore.
>     > But I encountered an issue when I using phosphor-inventory-manager =
and entity-manager at the same time.
>     > Both of them have same method "Notify" under same interface " xyz.o=
penbmc_project.Inventory.Manager ", but different signature.
>
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc=
-2Dproject.xyz_c_openbmc_ipmi-2Dfru-2Dparser_-2B_22022&d=3DDwIBaQ&c=3D5VD0R=
TtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DS9tC9=
Xf2NSLTyHJCFTl6oIO42LpdhrtnwXbH0VssCkI&s=3DP80VTof0T9asp-kQ4qr9mcEY1Y3mKTfV=
j-bztx5-3_o&e=3D
>
>     This patch addresses part of it.
>
>     >
>     > phosphor-inventory-manager:
>     > NAME                                  TYPE    SIGNATURE   RESULT/VA=
LUE   FLAGS
>     > xyz.openbmc_project.Inventory.Manager interface -             -    =
         -
>     > .Notify                               method    a{oa{sa{sv}}} -    =
         -
>     >
>     > entity-manager
>     > NAME                                  TYPE    SIGNATURE   RESULT/VA=
LUE   FLAGS
>     > xyz.openbmc_project.Inventory.Manager interface -         -        =
    -
>     > .Notify                               method    a{sa{sv}} -        =
    -
>     >
>     > So when some services call the 'Notify' method failed because of ge=
tting wrong service.
>     > Ex: https://github.com/openbmc/ipmi-fru-parser/blob/master/writefru=
data.cpp#L206
>     > Have you ever seen this issue before?
>
>     I've addressed part of this issue in phosphor-host-ipmid, now it no
>     longer assumes the FRU's owner.
>     See patches related to:
>
>     https://github.com/openbmc/phosphor-host-ipmid/commit/45e93cbae0aa0d0=
f5385d40f5685b23e18f95351
>     https://github.com/openbmc/phosphor-host-ipmid/commit/c26cc717a4eef18=
fffc1ca891bb6a6015740bf9f
>
>     >
>     > Should I use intel-dbus-interfaces if I want to use Frudevice (enti=
ty-manager) and write FRU command(intel-ipmi-oem)?
>     > Or it is compatible with original dbus-interface?
>
>     You use both.
> Patrick, I am not using intel-dbus-interfaces, only using dbus-sensors. W=
hat is the use of intel-dbus-interfaces?

I don't use both.  I only use phosphor-dbus-interfaces.  I was just
indicating they weren't going to interfere with each other because the
intel-dbus-interfaces isn't used in the same way as
phosphor-dbus-interfaces.

>
>     >
>     > Thanks,
>     > Harry
>
>
