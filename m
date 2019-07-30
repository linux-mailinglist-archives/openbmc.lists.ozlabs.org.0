Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0FC7B404
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 22:07:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yndp0KH2zDqGT
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 06:07:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dvjnl7Rq"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ynZ304HkzDqWk
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 06:03:54 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id n9so24391850pgc.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59RAC+OezqIZbWNsc+LYoVz9Qd4gw9HwzxRIMLPzUOA=;
 b=dvjnl7Rq41I8yu4LaSBl/ZF4WO9PNrCoOCXG+cCXlQqoFad8aKJ8mgWczUK8TqIRxg
 RQDcLafspXt0B83ZuVB0M7Plq3aiG2/JnVOt6s8BTbYGvpTsSy6ZpS9DLb+lXl0Gx8Va
 UYj7OUfoOcs5W0CEyMQ2fX2F5q9eJSijALn5+mJ8H1nDjwtNM4Y+wo7IhjEMJ/0Z5fKI
 J9fUDolRTkA6QRkSx7Nb4B+hpMAtWUuZTPv0mhqc6XfGpgIeucpb/hFSkA2GCg+2XILv
 UkyXdynxAaioKpHKIbhUwkqIGO1N/YbvIXtSyyw1ldw6gE7WhDgJqJwNR8QCvpcy5tHR
 Zunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59RAC+OezqIZbWNsc+LYoVz9Qd4gw9HwzxRIMLPzUOA=;
 b=Iamef9TJTvSsThOv//2cbjnxGg/tpn7053x5vp0pzq8OBw6ycGNebdLJoLw50vAfYD
 b1j4FF0cLE/4z1qK1WbyX13LFf22DWvEpYlYI9/RLZfQdMzmWcj9qTqnOLYpobD1DBxL
 mgIT+hyONzceTOw7slPzK1e4IeS700QTvwdy3ST8iXHVC8XYszYFYP42FRY/GcaR7G7V
 8h8lo+VEb/6kpbZrfS42dIzO7CqBwvVguK4cwjF5NDem8wVr3lt5C9MOdZErp8RbLmpJ
 uVEEciTsCb6VrZiz4def8kGPrOZLNHDOJnDARe5LNBo0NIAxNOEhQb/MScam10ITnO13
 ZcUg==
X-Gm-Message-State: APjAAAUBwk10WZtmT0EhG2CpJe+NBdQrklPi4BIyFt64itp/ayf1Kgu7
 Bt6ANLha2R+qFeIQ5rKfiJPIwSfKXTH9k/8K+Wg7kQ==
X-Google-Smtp-Source: APXvYqzDlYra+375y9chkDEB4jhwNqPigDwR/fqBVYPSKAejx4UjL8eNbMp3G9QQ4k3rCB4kOdRkdd6yI0U6SA6mrpc=
X-Received: by 2002:a62:e515:: with SMTP id n21mr44105864pff.186.1564517029844; 
 Tue, 30 Jul 2019 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
 <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
 <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
 <CAO=notxtHNyi9hJTQ5H5LT9BR_6a6yO+e5fdr92-R+jBy0hCUQ@mail.gmail.com>
 <CAO=notxDqf44vz=N_gobOQyTBPeAHOudLNRkidK4ACtJOZsdNw@mail.gmail.com>
 <d308a92c-ed00-fc3b-56c4-a0de84a6b561@linux.intel.com>
In-Reply-To: <d308a92c-ed00-fc3b-56c4-a0de84a6b561@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Jul 2019 13:03:38 -0700
Message-ID: <CAO=notzWP8yVRrzT6R8zcJt7tbKpqEsaQCZd0RpmsOp24fiQAA@mail.gmail.com>
Subject: Re: entity-manager experiments
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 12:01 PM James Feist
<james.feist@linux.intel.com> wrote:
>
> On 7/30/19 11:41 AM, Patrick Venture wrote:
> > On Mon, Jul 29, 2019 at 1:05 PM Patrick Venture <venture@google.com> wrote:
> >>
> >> On Mon, Jul 29, 2019 at 12:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
> >>>
> >>> On 7/26/19 4:45 PM, Patrick Venture wrote:
> >>>> On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> I was curious if you had any thoughts on what is missing here -- I
> >>>>> wrote a basic json file:
> >>>>>
> >>>>> razorback.json:
> >>>>> {
> >>>>>      "Exposes": [
> >>>>>          {
> >>>>>              "Address": "$address",
> >>>>>              "Bus": "$bus",
> >>>>>              "Name": "Razorback",
> >>>>>              "Type": "EEPROM"
> >>>>>          },
> >>>>>          {
> >>>>>              "Address": "0x4c",
> >>>>>              "Bus": "$bus",
> >>>>>              "Name": "Razorback Temp Sensor",
> >>>>>              "Type": "TMP421"
> >>>>>          }
> >>>>>      ],
> >>>>>      "Name": "Razorback Board",
> >>>>>      "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
> >>>>> '.*Razorback'})",
> >>>
> >>> I'd recommend taking out the wildcard if you can if you don't expect
> >>> there to be multiple models of this board.  We've gotten trapped a
> >>> little in the past with next-gen boards sporting a similar product name
> >>> (think 2019_Razorback vs 2020_Razorback) and configs getting applied
> >>> that shouldn't have.
> >>
> >> Thanks.
> >>
> >>>
> >>>>>      "Type": "Board",
> >>>>>      "xyz.openbmc_project.Inventory.Decorator.Asset": {
> >>>>>          "Manufacturer": "$PRODUCT_MANUFACTURER",
> >>>>>          "Model": "$PRODUCT_PRODUCT_NAME",
> >>>>>          "PartNumber": "$PRODUCT_PART_NUMBER",
> >>>>>          "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
> >>>>>      }
> >>>>> }
> >>>>>
> >>>>> And it finds it:
> >>>>> Service xyz.openbmc_project.EntityManager:
> >>>>> `-/xyz
> >>>>>    `-/xyz/openbmc_project
> >>>>>      |-/xyz/openbmc_project/EntityManager
> >>>>>      `-/xyz/openbmc_project/inventory
> >>>>>        `-/xyz/openbmc_project/inventory/system
> >>>>>          `-/xyz/openbmc_project/inventory/system/board
> >>>>>            `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
> >>>>>              |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
> >>>>>              `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> >>>>>
> >>>>> Service xyz.openbmc_project.FruDevice:
> >>>>> `-/xyz
> >>>>>    `-/xyz/openbmc_project
> >>>>>      `-/xyz/openbmc_project/FruDevice
> >>>>>        `-/xyz/openbmc_project/FruDevice/_0
> >>>>>
> >>>>> I don't know why it's named _0, but I can debug that late
> >>> The logic for that name is right here:
> >>> https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L549
> >>>
> >>> I'm guessing either the board section product name field or the product
> >>> section product name field is blank.  In that, we should probably check
> >>> for empty string and move on to the next one.
> >>
> >> Thanks.  I'll take a look there and write up a patch to fix it.
> >
> > Dug into it and found that it is finding two of those FRUs on my
> > platform, as it should, and it installs one with _0 then the other
> > just overwrites it also with _0.
> >
> > I'll look into whether it's feasible to add a global list inside
> > FruDevice so it can just add a number to the end or something.
>
> This should be doing it:
> https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L596
>
>
> My guess looking at this is that the for loop needs to be changed to
> loop through until it doesn't find the same product name. If you
> restarted the loop when index was incremented it would fix your issue I
> think.

Thanks, I am debugging it now and should have a patch for review before long.

>
> >
> >>
> >>>
> >>>>>
> >>>>> So I introspect on it:
> >>>>> busctl introspect --no-pager xyz.openbmc_project.EntityManager
> >>>>> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> >>>>> NAME                                     TYPE      SIGNATURE
> >>>>> RESULT/VALUE            FLAGS
> >>>>> org.freedesktop.DBus.Introspectable      interface -         -
> >>>>>                -
> >>>>> .Introspect                              method    -         s
> >>>>>                -
> >>>>> org.freedesktop.DBus.Peer                interface -         -
> >>>>>                -
> >>>>> .GetMachineId                            method    -         s
> >>>>>                -
> >>>>> .Ping                                    method    -         -
> >>>>>                -
> >>>>> org.freedesktop.DBus.Properties          interface -         -
> >>>>>                -
> >>>>> .Get                                     method    ss        v
> >>>>>                -
> >>>>> .GetAll                                  method    s         a{sv}
> >>>>>                -
> >>>>> .Set                                     method    ssv       -
> >>>>>                -
> >>>>> .PropertiesChanged                       signal    sa{sv}as  -
> >>>>>                -
> >>>>> xyz.openbmc_project.Configuration.TMP421 interface -         -
> >>>>>                -
> >>>>> .Address                                 property  t         76
> >>>>>                emits-change
> >>>>> .Bus                                     property  t         17
> >>>>>                emits-change
> >>>>> .Name                                    property  s
> >>>>> "Razorback Temp Sensor" emits-change
> >>>>> .Type                                    property  s         "TMP421"
> >>>>>                emits-change
> >>>>>
> >>>>> and all that looks correct, and now there's an i2c device at 17-004c,
> >>>>> but no hwmon path, and:
> >>>>>
> >>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
> >>>>> entity manager
> >>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
> >>>>> entity manager
> >>>>> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
> >>>>> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
> >>>>> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
> >>>>> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
> >>>>> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
> >>>>> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
> >>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
> >>>>> entity manager
> >>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
> >>>>> entity manager
> >>>>> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
> >>>>> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
> >>>>> entity manager
> >>>>> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
> >>>>> Jul 25 00:27:27 machine cpusensor
> >>>> [2666]: Error communicating to entity manager
> >>>>> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
> >>>>>
> >>>>> Service xyz.openbmc_project.HwmonTempSensor:
> >>>>> Only root object discovered.
> >>>>>
> >>>>> Any thoughts on the disconnect?  Have you seen anything like this?
> >>>>
> >>>> I had a hunch the driver was missing:
> >>>>
> >>>> tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
> >>>> CONFIG_SENSORS_TMP421 is not set
> >>>>
> >>>> ... ok, so that makes sense then! :D  Will try fixing that first!
> >>>>
> >>>
> >>> That would do it.
> >>>
> >>>>>
> >>>>> Patrick
