Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669B791FD
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 19:22:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y62Z4kLtzDqQC
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 03:22:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q2xRpAut"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y61w5l4bzDqNP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 03:22:12 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id g2so28372545pfq.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=At850VjJZfL/2pMedWKzOkEg4x1d0XhojXzI+8fH5Vk=;
 b=Q2xRpAut053t2ZWctIYu4sNgAQ3J2n93zTwguyw8JVLKhX8qhT6MWJD5cEvcLgMP7f
 UWDtXgluusd7yBWpadMa258cmvYK3Z4OPfMfhZHDZ9dHlprYiUVQozdYpj7bBLl3VAzG
 pQRQzFq27CyppHoC3a5gGoPd85MMHatT7K/apKVi+srPjrwmQ3KGtGfePL/IdeoUgHgN
 D/m0TklBv4swlhaJZrnWHOMIRdMQxmmjEe/CKm0l92CD23HjQ4j/wTo4UHGw5iigdlMh
 yvycaceL6NlFk9G3JcOD7e8NO/CfnN/768W+p5NUcrCu5su6XfrvTIPn7BdDT8/KtcEy
 +Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=At850VjJZfL/2pMedWKzOkEg4x1d0XhojXzI+8fH5Vk=;
 b=ORcFJVqwyqjRzOkEtFwhxhBV6UWWQSZO9UGRkc/nUKYlDTSN1TofqZd7yFSHHpIW4/
 3p69uakIDpNEz4GjpN6S939NJMleyAWqxg/SmQmjhWo2YKwK7COZOZOoUXYrWBLcebFZ
 qopsTqtwXGqykMVRa5d/MQeWSh3OxUCBgPTlFAwZ7zBexttMnifAn9GpVPptPme/pizr
 1VgguJs+7lXX/h9S8ckHwCWij4X2u4ctCWPWTk5//YUewpl2vNTP6ZE3e2VP+O/QBwOM
 zz3M4BYQiHTQpCCyzG/ZN9GCvP+l7+oU4YPbNKOayEmwyt0xFreckhoNsnILq7Eh6LHf
 +bbQ==
X-Gm-Message-State: APjAAAWV4VgwHJy/0Mb4B/gBp4Sn2untBBVAuT19bX/XOFVE94WkTnZ5
 ew7XXbMH6gRkcKdVbr4rvZFnm5RAo52JE4cMfX+8+Q==
X-Google-Smtp-Source: APXvYqxLD7DLBDyYG83y5AW71MUD06Y1ghP+W8wAQORqc++JHemaBgIpTjPheM7d+fr5NpKFZE+hMiUb0U99DSkkNic=
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr37235554pfr.81.1564420928074; 
 Mon, 29 Jul 2019 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwJd4QkJVP2qRiB56DWf+D=qs6S9cMCcfiywpOJZO03mA@mail.gmail.com>
 <b5f26e39-965d-4c64-bd51-5e83b86a12d4@linux.intel.com>
In-Reply-To: <b5f26e39-965d-4c64-bd51-5e83b86a12d4@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 10:21:56 -0700
Message-ID: <CAO=notwboY-awYHPxq4JqLoNMDfhr+xHZaPiRdO=vnFiat75KA@mail.gmail.com>
Subject: Re: Limitations of entity-manager:FruDevice
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 10:05 AM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 7/29/19 9:11 AM, Patrick Venture wrote:
> > Hi;
> >
> > I don't know much about FRUs.  However, I know that for some eeproms
> > on the device-tree for my platform, the default eeprom driver instance
> > isn't correct and I need to explicitly use 24c64.
> >
> > root@semitruck:~# echo "eeprom 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> > i2c i2c-14: new_device: Instantiated device eeprom at 0x50
> > root@semitruck:~#
> > root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> > -r--r--r--    1 root     root          4096 Jul 29 15:20 modalias
> > -r--r--r--    1 root     root          4096 Jul 29 15:20 name
> > drwxr-xr-x    2 root     root             0 Jul 29 15:20 power
> > lrwxrwxrwx    1 root     root             0 Jul 29 15:20 subsystem ->
> > ../../../../../../../bus/i2c
> > -rw-r--r--    1 root     root          4096 Jul 29 15:20 uevent
> >
> > root@semitruck:~# echo "24c64 0x50" > /sys/bus/i2c/devices/i2c-14/new_device
> > at24 14-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> > i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> > root@semitruck:~# ls -l /sys/bus/i2c/devices/14-0050/
> > drwxr-xr-x    3 root     root             0 Jul 29 15:46 14-00500
> > lrwxrwxrwx    1 root     root             0 Jul 29 15:46 driver ->
> > ../../../../../../../bus/i2c/drivers/at24
> > -rw-------    1 root     root          8192 Jul 29 15:46 eeprom
> > -r--r--r--    1 root     root          4096 Jul 29 15:46 modalias
> > -r--r--r--    1 root     root          4096 Jul 29 15:46 name
> > drwxr-xr-x    2 root     root             0 Jul 29 15:46 power
> > lrwxrwxrwx    1 root     root             0 Jul 29 15:46 subsystem ->
> > ../../../../../../../bus/i2c
> > -rw-r--r--    1 root     root          4096 Jul 29 15:46 uevent
> >
> > For entity-manager, I can add the type and it'll do the right thing.
> > However, when FruDevice runs first and populates the FRUs, it doesn't
> > seem to detect the difference in the eeproms.  I don't know enough (as
> > previously stated) to jump into fixing this, so I wanted to check if
> > this was a known limitation (presumably) and whether there was a plan
> > to fix it?
>
> FruDevice basically does a i2cdetect, i2cdump, then reads the fru data
> and sees if it looks like a fru. Do i2cdetect and i2cdump work with this
> eeprom?
>
> I know for 16 bit eeproms, that it doesn't work correctly, as in this
> thread:
> https://lists.ozlabs.org/pipermail/openbmc/2019-July/017134.html
>
> There's also a issue: https://github.com/openbmc/entity-manager/issues/1
> with a link to using device tree.
>
> I don't have any of these eeproms available to try that don't work, I
> can't comment on others attempts to get them going.

Ok, I'll take a look when I get a little further into this.  Currently
it's adding an eeprom as /_0 in the device-tree.  So, I have a hunch
it's related.

Patrick

>
> -James
>
> >
> > Patrick
> >
