Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221490766
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 20:02:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469B3v1q5TzDqkj
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 04:02:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SlUo3VHd"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4699wd0m1nzDqPl
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 03:56:00 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z3so2746427pln.6
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 10:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBm2tnFqkUZuTh8gEseWhID+16WPMO1QNp0zDD+vtFc=;
 b=SlUo3VHdAhGFqtYXMFFFEXS5Yzd6/v0mQL9/R/Z95zPkFVsoneHgyN3D0y/PL+sbPT
 /oynNieARSIRgwdWYFDxJSemvPUYCNoRQhtbhY8oyCTQqykW037zNkqJ4PNWCzg3jLoJ
 nBuU6gBaKubNdqvra4SNfcw6ogiPfORqECvtfZAdDlrzhKfhO9wUibjk+Xv4iqeuBo3P
 klEIkLYAVQsAWJBVE12JvLRqQarifAsWW5FcJkLc3ApyTbxRL+xtgy2sp6FUNhHMSRZq
 1/EGMzSLs673VIyCx7Bb2qHwbvhH9fVkFfOuU9aHLFX2y1d52AKq/88QJDwBSgmB10Zq
 73KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBm2tnFqkUZuTh8gEseWhID+16WPMO1QNp0zDD+vtFc=;
 b=fp9RQ8MdSEbKJRo7zbgFNSwh9GidfLQTPiOllCYWOykR8FsigImvPpbSGywmnoFvFe
 cdNDg5URFYwlLl2pUDhCjiZv/5c8O0OoWFlLhJhcSR3vmXK95Wjze+2uC215DgfQAu6f
 ma7NXqCeEBMVhKThpu+CogGJfF9SqV5HIAwmx8KK6MQwjV9L/vA+OBQfJGhMV2zN7ns2
 Sv+l+g/tVqaIKii0RTHyUVM1jdCuyRyDSZ3225XSCVcta1i+x77HDLf5rO4A/AOMqP2E
 6OaG/UQYDqe/YIU9E9lGN6BOxIOOdnx1XO4gNTDbWZCPGJLOjeklZLdoEAFz7upJ06VC
 rbFA==
X-Gm-Message-State: APjAAAXd1poKuiB1+Y71SQTQufgpQD54STetkGKA3hojwLjA3XL4zoWW
 iiS4++haBP27Ac9yAdaunk0NTHdXCrNE32IYHgR4wA==
X-Google-Smtp-Source: APXvYqwlUoWIr99vs4cVP++31gSDs979mu5qCoUybWyLqn92VTUNfkOTrYI3I5mqw7RCDZ8XNP8FFYNDMv5R7roL0dM=
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr10391648plr.179.1565978158133; 
 Fri, 16 Aug 2019 10:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
In-Reply-To: <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 16 Aug 2019 10:55:47 -0700
Message-ID: <CAO=notyjqi2m5LRDqRjSkTpYBmu5m_wr4JQnBeU8Vifg9_zLzw@mail.gmail.com>
Subject: Re: [External] Re: ipmitool FRU write question
To: Harry Sung1 <hsung1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
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
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 16, 2019 at 10:47 AM Harry Sung1 <hsung1@lenovo.com> wrote:
>
>
> > On 8/15/19 6:49 AM, Harry Sung1 wrote:
> > > Hi Team,
> > >
> > >
> > >
> > > Current phosphor-host-ipmid does not support fru write command, but
> > > ipmi-fru-parser supports it.
> > >
> > > We found this fru write command only update the data to dbus
> > > inventory, but doesn't sync the data back to the EEPROM.
> > >
> > > Does ipmi-fru-parser has any plans to implement it? I think it is more
> > > make sense to sync the data to EEPROM when we do fru write.
> >
> > The alternative FRU daemon from entity manager, FruDevice, supports writing
> > the FRU directly.
> > https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp
> >
> > Happy to see this capability added to ipmi-fru-parser, but you might be able to
> > model it off FruDevice.  If you want to use FruDevice as-is, you will need the
> > alternative FruWrite command sets from here.
> >
> > https://github.com/openbmc/intel-ipmi-oem/blob/159547cdfbf1992737dcecb
> > cb3888af7795f930b/src/storagecommands.cpp#L316
> >
> > As written, those commands change the behavior a bit, and double buffers the
> > FRU write commands.  When the last Fru write is sent, the data is flushed
> > through the FRU parser to ensure that it's valid, and the user isn't doing
> > anything nefarious (like changing a product name or serial
> > number) before it writes the EEPROM in one chunk, as quickly as it can to
> > reduce the possibility of a half written EEPROM.
>
> Hi Ed,
>
> Thanks for your kindly reply! I have surveyed the entity-manager before.
> But I encountered an issue when I using phosphor-inventory-manager and entity-manager at the same time.
> Both of them have same method "Notify" under same interface " xyz.openbmc_project.Inventory.Manager ", but different signature.

https://gerrit.openbmc-project.xyz/c/openbmc/ipmi-fru-parser/+/22022

This patch addresses part of it.

>
> phosphor-inventory-manager:
> NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FLAGS
> xyz.openbmc_project.Inventory.Manager interface -             -             -
> .Notify                               method    a{oa{sa{sv}}} -             -
>
> entity-manager
> NAME                                  TYPE    SIGNATURE   RESULT/VALUE   FLAGS
> xyz.openbmc_project.Inventory.Manager interface -         -            -
> .Notify                               method    a{sa{sv}} -            -
>
> So when some services call the 'Notify' method failed because of getting wrong service.
> Ex: https://github.com/openbmc/ipmi-fru-parser/blob/master/writefrudata.cpp#L206
> Have you ever seen this issue before?

I've addressed part of this issue in phosphor-host-ipmid, now it no
longer assumes the FRU's owner.
See patches related to:

https://github.com/openbmc/phosphor-host-ipmid/commit/45e93cbae0aa0d0f5385d40f5685b23e18f95351
https://github.com/openbmc/phosphor-host-ipmid/commit/c26cc717a4eef18fffc1ca891bb6a6015740bf9f

>
> Should I use intel-dbus-interfaces if I want to use Frudevice (entity-manager) and write FRU command(intel-ipmi-oem)?
> Or it is compatible with original dbus-interface?

You use both.

>
> Thanks,
> Harry
