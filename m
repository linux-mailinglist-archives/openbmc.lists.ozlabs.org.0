Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEC77CAB1
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 19:39:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zLJT2h87zDqnF
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 03:39:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U3lcRuhR"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zLHp2g15zDqlc
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 03:38:29 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id i70so21656157pgd.4
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I26krBQQ/PgBJcDCCCm/mxiroqHL/Uid6zbhRZBDgIw=;
 b=U3lcRuhR71R94Mi6S7ZZ3HinzAnCIXY7m7mp77+4G4xSIbVA34909AbMk+HOUfGAWL
 LP/mr60BQnis5wm3euMO8PBuoBCyqnaEcwkyPbxWyAcU1vQX4gC+0GGZpM0qmJ2rxk77
 gE+2gu+7NrSXuTO7lOBi0fM4rmFilVvNNDGUmxA567qWXafmOzm2jBKtdN7dfifrw30D
 bdzqLJ/GDA05EKvYlDP4Ab30ftP07syaME1imoka/TN43ZUH8YrluX8nhYk3svIp/a4v
 64EXV2+7fjvR9MqF1qNuA0fTN7KY9xUAVO/bWxa5po8ONPodULfzXQvAbqXkOkdApvH4
 e+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I26krBQQ/PgBJcDCCCm/mxiroqHL/Uid6zbhRZBDgIw=;
 b=mb1eCweTSs8Xx1Dd5eTCB97RQfUpRuqRWDHRUDfKrxgqYp1bPK1on3ZO+yO569mHqk
 sntC1/wcLXPCpzIBcAheDpbW81/g4GJ/cjHTPQe/A1ItUqcyUurwGf94680qNLw6s++p
 11NX4mj0tEm6wM56S9JIP24wOzbG4dMw7SMUkpOB/R+a6ZhKImru0JEhx+kCQR7iD5jc
 YWyKBc0uz4vUUvm2s9z2weW5bv+6K2vsY2HOhtoZkdAp1BuFK7AkMxkAgjnKcw/QF7kM
 6mNablMPFwk5rJv3irqwV0YdGhgc9rWixkHlB5Ml8bWYv/+Tar9ZPYCdNeSsFtdU3nmW
 sfsg==
X-Gm-Message-State: APjAAAUzz5xTsYVUVi6V0EKl6go/OWW7Bc5olCZyHK2QKPNQhM4cOylU
 P2W3tLt5jOd8vB/OlPYVCz6ftoLhpsi5Hr2iv3pa+A==
X-Google-Smtp-Source: APXvYqzwQ1xJeQ3PkG6czrh/kxP+PtfET02/TMXyEG0XgmuaQJ6zdRsCQ9Vus430LrtgZ5hwzFiHXWfgCgIXd79K274=
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr4181770pje.115.1564594705114; 
 Wed, 31 Jul 2019 10:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyvYn5-VTKys86NVzXXturPh=Q-5DFsR_ZvGeoJs=P0PQ@mail.gmail.com>
 <401cb4b9-4f2b-0722-af80-106cf538fe37@linux.intel.com>
In-Reply-To: <401cb4b9-4f2b-0722-af80-106cf538fe37@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 31 Jul 2019 10:38:13 -0700
Message-ID: <CAO=notyjq3Q5EypPOtEPtWu8aWgtdHoL5Hufe5a=7kutohCLGw@mail.gmail.com>
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

On Wed, Jul 31, 2019 at 9:34 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 7/29/19 10:55 AM, Patrick Venture wrote:
> > Hi;
> >
> > Sorry to flood with questions, but I'm hoping I won't be the only
> > person asking and in the future, other machines starting to use
> > entity-manager will find these useful.
> >
> > I've added the following configuration:
> >
> > cat configurations/semitruck.json
> > {
> >      "Exposes": [
> >          {
> >              "Address": "0x50",
> >              "Bus": 14,
> >              "Name": "Aberdeen",
> >              "Type": "24C64"
> >          },
> >          {
> >              "Address": "0x50",
> >              "Bus": 15,
> >              "Name": "Energia",
> >              "Type": "24C64"
> >          }
> >      ],
> >      "Name": "Aberdeen Baseboard",
> >      "Probe" : "TRUE",
> >      "Type": "Board"
> > }
> >
> > And I see:
> > i2c i2c-14: new_device: Instantiated device 24c64 at 0x50
> > i2c i2c-15: new_device: Instantiated device 24c64 at 0x50
> >
> > And I see:
> > Service xyz.openbmc_project.EntityManager:
> > `-/xyz
> >    `-/xyz/openbmc_project
> >      |-/xyz/openbmc_project/EntityManager
> >      `-/xyz/openbmc_project/inventory
> >        `-/xyz/openbmc_project/inventory/system
> >          `-/xyz/openbmc_project/inventory/system/board
> >            |-/xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> >
> > busctl introspect xyz.openbmc_project.EntityManager
> > /xyz/openbmc_project/inventory/system/board/Aberdeen_Baseboard
> > --no-pager
> > NAME                                     TYPE      SIGNATURE
> > RESULT/VALUE         FLAGS
> > org.freedesktop.DBus.Introspectable      interface -         -
> >             -
> > .Introspect                              method    -         s
> >             -
> > org.freedesktop.DBus.Peer                interface -         -
> >             -
> > .GetMachineId                            method    -         s
> >             -
> > .Ping                                    method    -         -
> >             -
> > org.freedesktop.DBus.Properties          interface -         -
> >             -
> > .Get                                     method    ss        v
> >             -
> > .GetAll                                  method    s         a{sv}
> >             -
> > .Set                                     method    ssv       -
> >             -
> > .PropertiesChanged                       signal    sa{sv}as  -
> >             -
> > xyz.openbmc_project.AddObject            interface -         -
> >             -
> > .AddObject                               method    a{sv}     -
> >             -
> > xyz.openbmc_project.Inventory.Item.Board interface -         -
> >             -
> > .Name                                    property  s         "Aberdeen
> > Baseboard" emits-change
> > .Probe                                   property  s         "TRUE"
> >             emits-change
> > .Type                                    property  s         "Board"
> >             emits-change
> >
> > For the two eeproms listed, neither are currently supported by
> > FruDevice.  It's my understanding that entity-manager "exposes"
> > things, and I see it adding the eeproms successfully -- but then
> > doesn't populate them to dbus.  It populates a configuration space for
> > the sensors, so I expected the same for eeproms.
>
> FruDevice != Entity manager. They were kept completely separate, so the
> fru device doesn't know anything about the Entity Manager. The Entity
> Manager simply looks for any interface in it's probe statement to add
> devices. In theory you could create a probe that looked like
> xyz.openbmc_project.Sensor.Value('Value':'20').

> Entity manager is adding sysfs devices, and some happen to be eeproms.

Interesting.

>
> >
> > Am I missing something, or?
> >
> > Thanks,
> > Patrick
> >
