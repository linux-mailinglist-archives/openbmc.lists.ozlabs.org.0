Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9C88349
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 21:30:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464wMN1FXFzDrD2
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 05:30:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ci2p9dJH"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464wLc2b9TzDqyH
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 05:30:15 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id i18so46325794pgl.11
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fg5BPq/sRnWEmyx921gjn9++eYgRp6HsvogWYdjC9Gg=;
 b=ci2p9dJH0rMWtOY+NXKHgPSsZQe8B2CThK6yV+kk9oHPpoIJ+Xoa2gpAL664V+jS96
 r4pfH6IA7CYWI0gnxPfTt2cb2/6+4egTvY//zTXvv2YGxN/yUFYfNC29SzIwzkiOLjsr
 R76To8tYWVYHdHNr8I/EwdwFhvSAcvreogywU3SaAqN/dE4RLG2r3LiWb3UfHpN4Xb2d
 GThtzhLO2PiDf1u8+Tg1cHb77ujbKc5pBgfO8odQrMBgcKoYHhHiX+Nlf7+Wq+MEwWOv
 fuTPfcBa5VwtxlAk8Z1NOExuU930mLpLEo7PbW7NYdDUKot+mLkmgMKA3ajjNvuQFGl5
 8tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fg5BPq/sRnWEmyx921gjn9++eYgRp6HsvogWYdjC9Gg=;
 b=hxYKhx/Piif5jExMmlJufap9Q1cuChkLvQM8IDruIQkfBgeA9DTceIK3B1AaOyeCcL
 xJNT5p0eY9/1gJDq7j/7Qkx3YH9lOgKL1u4IwmU3b4i5zTqAwkBy1WtV3BXhr3++zM6A
 dMTfH23ONUTvIZO3MoPq+nk55Al6lgoCOZhLX7Gr3oJhl4YN2c0bV2swlDN9YKeLJYOg
 ZTfGTvtul8+kq6NzCkaX06wEJmzJav0FmujWtHLlcfYUeQchMcZN48ZI1YvSUFCWTTIF
 4WQbXkiDcBgzSnGrCz1UNbeB3hyIeSUSbVVl436wLdb+M22X0HUKLnUZEeKf6u4QrcMK
 pa0Q==
X-Gm-Message-State: APjAAAUROoo9rOtn0WJNmhHmSHo8XFpmX97nH3I50BtI6rSVVnzV8Ekj
 4zv5DxWgfy3SRnqFwS7ySIPZVHqLGPJ3SBsKfJGppLzVoNg=
X-Google-Smtp-Source: APXvYqzpH58alz2Un2Oo+cfo/tPw9XD2ooPDdtV4uw+L5JVQQDhZshj1uYdsyV6lXT6b1/FvlZXgNW+F9JwivWT5jTI=
X-Received: by 2002:a63:2784:: with SMTP id n126mr18242110pgn.92.1565379011693; 
 Fri, 09 Aug 2019 12:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notycFS1Zhjjt_n5J+mQwLTToZYwW-SM-FKQ-aaeSs4hMUw@mail.gmail.com>
 <56c9b48b-da29-8ec3-dc16-0e37072c2eb7@linux.intel.com>
 <CAO=notzfd57brCmkUZyegCC9RkwxY1zp9GSXEMt8GGWctX8PhA@mail.gmail.com>
 <6c111451-8e2c-42ef-2a36-77f040879f2f@linux.intel.com>
 <CAO=notxsMejO5T1Qg88PuPKBG6LPeTifjWbVuxAS11qUF7DMhg@mail.gmail.com>
 <CAO=notxRQuDT+AZxWV-fOz=dhv15MZJ3RZkcpgD1i_fx9U-XcQ@mail.gmail.com>
 <CAO=noty5B5PVrzmfXox7snF-Y6U29D_MiJ9LM-gjJDjfiXwrZg@mail.gmail.com>
 <CAO=notzeg9ZYEEMJ43G7AcJ2Ot2n13or-9_zyFFOxCH2Ua6k1g@mail.gmail.com>
In-Reply-To: <CAO=notzeg9ZYEEMJ43G7AcJ2Ot2n13or-9_zyFFOxCH2Ua6k1g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 9 Aug 2019 12:30:00 -0700
Message-ID: <CAO=notz7q6nG3-b7OD1yxfoibCYa8mtJPXRShp-LTn9JDMwguQ@mail.gmail.com>
Subject: Re: entity-manager unexpected handling of template parameters
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 12:24 PM Patrick Venture <venture@google.com> wrote:
>
> On Fri, Aug 9, 2019 at 12:20 PM Patrick Venture <venture@google.com> wrote:
> >
> > On Fri, Aug 9, 2019 at 11:57 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Fri, Aug 9, 2019 at 11:50 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > On Fri, Aug 9, 2019 at 11:45 AM James Feist <james.feist@linux.intel.com> wrote:
> > > > >
> > > > > On 8/9/19 11:33 AM, Patrick Venture wrote:
> > > > > > On Fri, Aug 9, 2019 at 11:22 AM James Feist <james.feist@linux.intel.com> wrote:
> > > > > >>
> > > > > >> On 8/9/19 9:53 AM, Patrick Venture wrote:
> > > > > >>> Given the following:
> > > > > >>>
> > > > > >>> busctl introspect --no-pager xyz.openbmc_project.FruDevice
> > > > > >>> /xyz/openbmc_project/FruDevice/Altie
> > > > > >>> NAME                                TYPE      SIGNATURE RESULT/VALUE
> > > > > >>>               FLAGS
> > > > > >>> org.freedesktop.DBus.Introspectable interface -         -
> > > > > >>>               -
> > > > > >>> .Introspect                         method    -         s
> > > > > >>>               -
> > > > > >>> org.freedesktop.DBus.Peer           interface -         -
> > > > > >>>               -
> > > > > >>> .GetMachineId                       method    -         s
> > > > > >>>               -
> > > > > >>> .Ping                               method    -         -
> > > > > >>>               -
> > > > > >>> org.freedesktop.DBus.Properties     interface -         -
> > > > > >>>               -
> > > > > >>> .Get                                method    ss        v
> > > > > >>>               -
> > > > > >>> .GetAll                             method    s         a{sv}
> > > > > >>>               -
> > > > > >>> .Set                                method    ssv       -
> > > > > >>>               -
> > > > > >>> .PropertiesChanged                  signal    sa{sv}as  -
> > > > > >>>               -
> > > > > >>> xyz.openbmc_project.FruDevice       interface -         -
> > > > > >>>               -
> > > > > >>> .ADDRESS                            property  u         82
> > > > > >>>               emits-change
> > > > > >>> .BOARD_LANGUAGE_CODE                property  s         "25"
> > > > > >>>               emits-change
> > > > > >>> .BOARD_MANUFACTURER                 property  s         "Inventec"
> > > > > >>>               emits-change
> > > > > >>> .BOARD_MANUFACTURE_DATE             property  s         "Thu Jul 11
> > > > > >>> 17:09:00 2019" emits-change
> > > > > >>> .BOARD_PART_NUMBER                  property  s         "1051867-01"
> > > > > >>>               emits-change
> > > > > >>> .BOARD_PRODUCT_NAME                 property  s         "Altie"
> > > > > >>>               emits-change
> > > > > >>> .BOARD_SERIAL_NUMBER                property  s
> > > > > >>> "ALTIVT192700026"          emits-change
> > > > > >>> .BUS                                property  u         1
> > > > > >>>               emits-change
> > > > > >>> .Common_Format_Version              property  s         "1"
> > > > > >>>               emits-change
> > > > > >>>
> > > > > >>> I expected entity-manager with this profile to populate dbus properly:
> > > > > >>> configurations/altie.json
> > > > > >>> {
> > > > > >>>       "Name" : "Altie",
> > > > > >>>       "Probe" : "xyz.openbmc_project.FruDevice({'BOARD_PRODUCT_NAME': 'Altie'})",
> > > > > >>>       "Type": "Board",
> > > > > >>>       "xyz.openbmc_project.Inventory.Decorator.Asset": {
> > > > > >>>           "Manufacturer": "$BOARD_MANUFACTURER",
> > > > > >>>           "Model": "$BOARD_PRODUCT_NAME",
> > > > > >>>           "PartNumber": "$BOARD_PART_NUMBER",
> > > > > >>>           "SerialNumber": "$BOARD_SERIAL_NUMBER"
> > > > > >>>       }
> > > > > >>> }
> > > > > >>>
> > > > > >>> Instead:
> > > > > >>> root@semitruck:~# busctl introspect --no-pager
> > > > > >>> xyz.openbmc_project.EntityManager
> > > > > >>> /xyz/openbmc_project/inventory/system/board/Altie
> > > > > >>> NAME                                          TYPE      SIGNATURE
> > > > > >>> RESULT/VALUE                             FLAGS
> > > > > >>> org.freedesktop.DBus.Introspectable           interface -         -
> > > > > >>>                                       -
> > > > > >>> .Introspect                                   method    -         s
> > > > > >>>                                       -
> > > > > >>> org.freedesktop.DBus.Peer                     interface -         -
> > > > > >>>                                       -
> > > > > >>> .GetMachineId                                 method    -         s
> > > > > >>>                                       -
> > > > > >>> .Ping                                         method    -         -
> > > > > >>>                                       -
> > > > > >>> org.freedesktop.DBus.Properties               interface -         -
> > > > > >>>                                       -
> > > > > >>> .Get                                          method    ss        v
> > > > > >>>                                       -
> > > > > >>> .GetAll                                       method    s
> > > > > >>> a{sv}                                    -
> > > > > >>> .Set                                          method    ssv       -
> > > > > >>>                                       -
> > > > > >>> .PropertiesChanged                            signal    sa{sv}as  -
> > > > > >>>                                       -
> > > > > >>> xyz.openbmc_project.AddObject                 interface -         -
> > > > > >>>                                       -
> > > > > >>> .AddObject                                    method    a{sv}     -
> > > > > >>>                                       -
> > > > > >>> xyz.openbmc_project.Inventory.Decorator.Asset interface -         -
> > > > > >>>                                       -
> > > > > >>> .Manufacturer                                 property  s
> > > > > >>> "$BOARD_MANUFACTURER"                    emits-change
> > > > > >>> .Model                                        property  s
> > > > > >>> "$BOARD_PRODUCT_NAME"                    emits-change
> > > > > >>> .PartNumber                                   property  s
> > > > > >>> "$BOARD_PART_NUMBER"                     emits-change
> > > > > >>> .SerialNumber                                 property  s
> > > > > >>> "$BOARD_SERIAL_NUMBER"                   emits-change
> > > > > >>> xyz.openbmc_project.Inventory.Item.Board      interface -         -
> > > > > >>>                                       -
> > > > > >>> .Name                                         property  s
> > > > > >>> "Altie"                                  emits-change
> > > > > >>> .Probe                                        property  s
> > > > > >>> "xyz.openbmc_project.FruDevice({\'BOA... emits-change
> > > > > >>> .Type                                         property  s
> > > > > >>> "Board"                                  emits-change
> > > > > >>>
> > > > > >>> I must be doing something obvious and silly.  Please advise.
> > > > > >>
> > > > > >> Entity-manager caches the result and only updates if etc/os-release
> > > > > >> changes. There is a version file in /var/configuration/version, if you
> > > > > >> delete this it'll rescan fresh. It looks right to me.. so I imagine this
> > > > > >> is what is happening.
> > > > > >
> > > > > > I deleted the /var/configuration/version file and rebooted the BMC.
> > > > > > it didn't pick it up -- I decided a rescan was too subtle :)
> > > > > >
> > > > > > Any other ideas?  I've started digging into entity-manager further.
> > > > >
> > > > > Sorry I don't see anything obvious... it should all be happening in this
> > > > > function
> > > > > https://github.com/openbmc/entity-manager/blob/b295e1d8385544f12a436ef63153d373ff8de625/src/EntityManager.cpp#L1130
> > > > >
> > > > >
> > > > > Specifically it should be making it to here:
> > > > >
> > > > > https://github.com/openbmc/entity-manager/blob/b295e1d8385544f12a436ef63153d373ff8de625/src/EntityManager.cpp#L1291
> > > >
> > > > Thanks, that's where I'm now looking --
> > >
> > > I deleted everything from /var/configuration/ rebooted, and added some
> > > debug to dig into the specific template replacement:
> > >
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: strPtr value:
> > > '$BOARD_MANUFACTURER'
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: templateName:
> > > $BOARD_MANUFACTURER, find: true
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: keyPair.value(): "Inventec"
> > >
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: strPtr value:
> > > '$BOARD_PRODUCT_NAME'
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: templateName:
> > > $BOARD_PRODUCT_NAME, find: true
> > > Aug 09 18:51:47 semitruck entity-manager[2700]: keyPair.value(): "Altie"
> >
> > So the visitor is finding and applying the value to the template, but
> > that change isn't propagating up.  It works for the card that's found
> > afterwards...  The only real difference is, the other profile also
> > Exposes, whereas this one doesn't.  Is there a step that's skipped if
> > there isn't an "Exposes" key?
>
> Looks like this part is skipped:
> https://github.com/openbmc/entity-manager/blob/b295e1d8385544f12a436ef63153d373ff8de625/src/EntityManager.cpp#L1618
>
> _systemConfiguration[recordName] = record;
> logDeviceAdded(record);
> foundDeviceIdx++;

I think foundDeviceIdx is the culprit because it isnt' always
incremented.  So, I've moved that before the contnue.

>
> Hm.
>
> >
> > >
> > >
> > >
> > > >
> > > > >
> > > > > foundDevice should be your fru.... and should be populated here:
> > > > >
> > > > > https://github.com/openbmc/entity-manager/blob/b295e1d8385544f12a436ef63153d373ff8de625/src/EntityManager.cpp#L425
> > > >
> > > > I did not think to look here, thanks!
> > > >
> > > > >
> > > > > Hope that helps
> > > > >
> > > > > -James
> > > > >
> > > > >
> > > > >
> > > > > >
> > > > > >>
> > > > > >> -James
> > > > > >>>
> > > > > >>> Thanks,
> > > > > >>> Patrick
> > > > > >>>
