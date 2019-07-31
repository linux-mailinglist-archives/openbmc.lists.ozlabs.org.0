Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CA97CAC9
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 19:43:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zLPx68krzDqn2
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 03:43:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D0yWqe70"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zLP70GwkzDqlc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 03:43:06 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id i70so21662477pgd.4
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VLVkdNpghK//vSRieJYLK8/74psfQQkKXpaNYS06Vbw=;
 b=D0yWqe70e/sL/Zz6Xl4DmoKv4RMIi5T+tLuA8RBaViGtsynlXINW9MoccFRyuDbUiS
 ZyiOaLOVHPY9R2LFV6GsQqzt1Lw6HQWTzDhj2bKdIWbCfx9D8J55pO681jGQe7ZVpdju
 VjrrZAyoocpEhUwvTE63k9+ejfkBGkS2zUjekugoHPsQ0XGAzf3HSkxRubQmC0nCGe0Y
 Wek+U0Vy9Yv3n/bWmQwoAralEXhwDexv3Oodohg4mCv1B+J7BWa57Ed/okq0sXlsUpge
 k/3Ik+9RDpFz+NuhRBHqu7r+5vI/TS9swFxWtvqjzqju0Ob8R6WAircz6m7VCV0Fw2Pk
 L01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VLVkdNpghK//vSRieJYLK8/74psfQQkKXpaNYS06Vbw=;
 b=RIeVOKVd7f7u022UOBrF1BrEa2U7cr+rKl23gMOpjLQuAbopFVbta8+AqFwqiR1VN1
 cEOj7Q/O+a2HPHWNOOZG7CMoZHoE7fBm8np6RQVTTR/u8XqnihG7MwtHsY95t9wel4c5
 lAYJz4th0UMowv8Yzq5bYLr7XTKGEm2kxjJrN08xtLBmYEh/PHxn4ZdohWBXr2fOwChl
 42ivtDCmX5TiGbLTV/HshLbHYED1C9WwkAOFgNHYCefTgmRpyj7qbMhasb4sItkheWbz
 QbAJhzVUjx0WnWEo5L+5SiuNsxjefGybu0r6S1+McHj6zJ0h7GdiHQWSuQFBZox/s+F8
 j6CA==
X-Gm-Message-State: APjAAAXllZQVDVF16i6jAC3iMzYrdqIMtqs8TMF8VIB8pdBnxapX1Vv+
 Z3JB952r+zecAt/Qa8oQbU4ZZjh6rYzKEcAlh+oEmR8xOXQ=
X-Google-Smtp-Source: APXvYqw0fK9+YxxrYlu6llxk1TVfZAWzZDIlFVc/eYrOfuclvV2Mn/sEYfJfCvKLB8raiCHZEVKL87eQ9lKqUcyNrYw=
X-Received: by 2002:a17:90a:bf0e:: with SMTP id
 c14mr3885826pjs.55.1564594983267; 
 Wed, 31 Jul 2019 10:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyvYn5-VTKys86NVzXXturPh=Q-5DFsR_ZvGeoJs=P0PQ@mail.gmail.com>
 <401cb4b9-4f2b-0722-af80-106cf538fe37@linux.intel.com>
 <CAO=notyjq3Q5EypPOtEPtWu8aWgtdHoL5Hufe5a=7kutohCLGw@mail.gmail.com>
In-Reply-To: <CAO=notyjq3Q5EypPOtEPtWu8aWgtdHoL5Hufe5a=7kutohCLGw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 31 Jul 2019 10:42:51 -0700
Message-ID: <CAO=notzjmE12d60EK6vzcAG3wxn=06Oai3pKQkRBLJuJNbmpRg@mail.gmail.com>
Subject: Re: entity-manager exposing eeproms
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

On Wed, Jul 31, 2019 at 10:38 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Jul 31, 2019 at 9:34 AM James Feist <james.feist@linux.intel.com> wrote:
> >
> > On 7/29/19 10:55 AM, Patrick Venture wrote:
> > > Hi;
> > >
> > > Sorry to flood with questions, but I'm hoping I won't be the only
> > > person asking and in the future, other machines starting to use
> > > entity-manager will find these useful.
> > >
> > > I've added the following configuration:
> > >
> > > cat configurations/semitruck.json
> > > {
> > >      "Exposes": [
> > >          {
> > >              "Address": "0x50",
> > >              "Bus": 14,
> > >              "Name": "Aberdeen",
> > >              "Type": "24C64"
> > >          },
> > >          {
> > >              "Address": "0x50",
> > >              "Bus": 15,
> > >              "Name": "Energia",
> > >              "Type": "24C64"
> > >          }
> > >      ],
> > >      "Name": "Aberdeen Baseboard",
> > >      "Probe" : "TRUE",
> > >      "Type": "Board"
> > > }
> > >
> > > And I see:
> > > i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> > > i2c i2c-15: new_device: Instantiated device 24c64 at 0x50
> > >
> > > And I see:
> > > Service xyz.openbmc_project.EntityManager:
> > > `-/xyz
> > >    `-/xyz/openbmc_project
> > >      |-/xyz/openbmc_project/EntityManager
> > >      `-/xyz/openbmc_project/inventory
> > >        `-/xyz/openbmc_project/inventory/system
> > >          `-/xyz/openbmc_project/inventory/system/board
> > >            |-/xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> > >
> > > busctl introspect xyz.openbmc_project.EntityManager
> > > /xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> > > --no-pager
> > > NAME                                     TYPE      SIGNATURE
> > > RESULT/VALUE         FLAGS
> > > org.freedesktop.DBus.Introspectable      interface -         -
> > >             -
> > > .Introspect                              method    -         s
> > >             -
> > > org.freedesktop.DBus.Peer                interface -         -
> > >             -
> > > .GetMachineId                            method    -         s
> > >             -
> > > .Ping                                    method    -         -
> > >             -
> > > org.freedesktop.DBus.Properties          interface -         -
> > >             -
> > > .Get                                     method    ss        v
> > >             -
> > > .GetAll                                  method    s         a{sv}
> > >             -
> > > .Set                                     method    ssv       -
> > >             -
> > > .PropertiesChanged                       signal    sa{sv}as  -
> > >             -
> > > xyz.openbmc_project.AddObject            interface -         -
> > >             -
> > > .AddObject                               method    a{sv}     -
> > >             -
> > > xyz.openbmc_project.Inventory.Item.Board interface -         -
> > >             -
> > > .Name                                    property  s         "Aberdeen
> > > Baseboard" emits-change
> > > .Probe                                   property  s         "TRUE"
> > >             emits-change
> > > .Type                                    property  s         "Board"
> > >             emits-change
> > >
> > > For the two eeproms listed, neither are currently supported by
> > > FruDevice.  It's my understanding that entity-manager "exposes"
> > > things, and I see it adding the eeproms successfully -- but then
> > > doesn't populate them to dbus.  It populates a configuration space for
> > > the sensors, so I expected the same for eeproms.
> >
> > FruDevice != Entity manager. They were kept completely separate, so the
> > fru device doesn't know anything about the Entity Manager. The Entity
> > Manager simply looks for any interface in it's probe statement to add
> > devices. In theory you could create a probe that looked like
> > xyz.openbmc_project.Sensor.Value('Value':'20').

Thanks for specifying this.  So it working for sensors is useful but
eeproms, not so much unless we want the eeprom driver loaded at
run-time, because FruDevice doesn't do that.

>
> > Entity manager is adding sysfs devices, and some happen to be eeproms.
>
> Interesting.
>
> >
> > >
> > > Am I missing something, or?
> > >
> > > Thanks,
> > > Patrick
> > >
