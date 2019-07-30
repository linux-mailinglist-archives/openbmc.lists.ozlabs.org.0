Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509F7B455
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 22:26:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yp4H5cTYzDqXT
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 06:26:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="m7gLwU4U"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yp3W56gyzDqFS
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 06:25:57 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id c3so7284804pfa.13
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 13:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q3lV9/lntGkFJKqJr/CBxqCNvJG2HDOqnHxWNMAi1zA=;
 b=m7gLwU4UWt/pBAdb5vIQayCSI+voH7gaqChHo+2ONKTg53VE7QExpiVmSwRAkZMzah
 kt5OXuK9kCCK3ptVgtuAF8Z0iKFexVC6ty7v6KYzFs1trn4y6iaTuH3af3H7y52SsjpM
 Uc1zYvYqBc0etX61Pjr/OyB1cvn3uximNWRlm7DCznov5YsyNSSLxY8cL/PW5EuTvSkj
 U1fHsQH1cK4Ni0cvD7iMPNYPMOKmWMtajFLtefTdbJAoinrnC+nxbY4WHaHNp8vk0x2/
 1YDdrhqlAQR9JZXGX4pPnUQ1X9zmgue5BkHntmU8Tv4h/VHM1gROjgtXoHDv54C0euUh
 bX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q3lV9/lntGkFJKqJr/CBxqCNvJG2HDOqnHxWNMAi1zA=;
 b=QMcCRlRjvH1tqB21tdwHamMvZbD59+WflZSn8nPS5ZjTrkrbFS2vVAY3TTvGCmMfVR
 ZviiqWYuVQGCy65bUO4c47PwhfqyASMNlZGK8rpwkyboGUaDbGL8SVW7wqtXm2JDcCz9
 tuG8L114Iq/IL2Hb3e+nvhpiZACH7aBHhbQksMSwdpmFlZBlmAoXzUF3tzBBLKonvrga
 HPn4eO4+hFOSjSKfZUNpt8GE+RjwyP44iF/8loS3L88dLpJKYWA8qmv9D6IfDDBt1jgl
 A98nBJbl7iaU/sPAxAXQOVcXQQ4gdZMAg698c0YopWjiJqnZClBm5vlf8Vi38nw2qFX2
 Ng8w==
X-Gm-Message-State: APjAAAWhilZ7cvYy9EhVgquBSp0afzh6rgvJOcvvDmNg41KwMZN4pX+Y
 6ZCm3ybMXBAR+xOYIP66jopjSsTcQmIXRHogtvFvdQ==
X-Google-Smtp-Source: APXvYqzFsWCGOqAjnMivVJm75yMEYo4qYOmt/VvCoMlE0R1+3rsjxLJAqGasrZ9sALDlFASVoj93yakQISwFJWT/3zM=
X-Received: by 2002:a17:90a:2228:: with SMTP id
 c37mr120453647pje.9.1564518351787; 
 Tue, 30 Jul 2019 13:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
 <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
 <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
 <CAO=notxtHNyi9hJTQ5H5LT9BR_6a6yO+e5fdr92-R+jBy0hCUQ@mail.gmail.com>
 <CAO=notxDqf44vz=N_gobOQyTBPeAHOudLNRkidK4ACtJOZsdNw@mail.gmail.com>
 <d308a92c-ed00-fc3b-56c4-a0de84a6b561@linux.intel.com>
 <CAO=notzWP8yVRrzT6R8zcJt7tbKpqEsaQCZd0RpmsOp24fiQAA@mail.gmail.com>
In-Reply-To: <CAO=notzWP8yVRrzT6R8zcJt7tbKpqEsaQCZd0RpmsOp24fiQAA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Jul 2019 13:25:40 -0700
Message-ID: <CAO=notx5-=U89k30TfSyeFZNQ-M-gY2Tq1AeG4sbCJRM5hjXBA@mail.gmail.com>
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

On Tue, Jul 30, 2019 at 1:03 PM Patrick Venture <venture@google.com> wrote:
>
> On Tue, Jul 30, 2019 at 12:01 PM James Feist
> <james.feist@linux.intel.com> wrote:
> >
> > On 7/30/19 11:41 AM, Patrick Venture wrote:
> > > On Mon, Jul 29, 2019 at 1:05 PM Patrick Venture <venture@google.com> wrote:
> > >>
> > >> On Mon, Jul 29, 2019 at 12:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
> > >>>
> > >>> On 7/26/19 4:45 PM, Patrick Venture wrote:
> > >>>> On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
> > >>>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> I was curious if you had any thoughts on what is missing here -- I
> > >>>>> wrote a basic json file:
> > >>>>>
> > >>>>> razorback.json:
> > >>>>> {
> > >>>>>      "Exposes": [
> > >>>>>          {
> > >>>>>              "Address": "$address",
> > >>>>>              "Bus": "$bus",
> > >>>>>              "Name": "Razorback",
> > >>>>>              "Type": "EEPROM"
> > >>>>>          },
> > >>>>>          {
> > >>>>>              "Address": "0x4c",
> > >>>>>              "Bus": "$bus",
> > >>>>>              "Name": "Razorback Temp Sensor",
> > >>>>>              "Type": "TMP421"
> > >>>>>          }
> > >>>>>      ],
> > >>>>>      "Name": "Razorback Board",
> > >>>>>      "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
> > >>>>> '.*Razorback'})",
> > >>>
> > >>> I'd recommend taking out the wildcard if you can if you don't expect
> > >>> there to be multiple models of this board.  We've gotten trapped a
> > >>> little in the past with next-gen boards sporting a similar product name
> > >>> (think 2019_Razorback vs 2020_Razorback) and configs getting applied
> > >>> that shouldn't have.
> > >>
> > >> Thanks.
> > >>
> > >>>
> > >>>>>      "Type": "Board",
> > >>>>>      "xyz.openbmc_project.Inventory.Decorator.Asset": {
> > >>>>>          "Manufacturer": "$PRODUCT_MANUFACTURER",
> > >>>>>          "Model": "$PRODUCT_PRODUCT_NAME",
> > >>>>>          "PartNumber": "$PRODUCT_PART_NUMBER",
> > >>>>>          "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
> > >>>>>      }
> > >>>>> }
> > >>>>>
> > >>>>> And it finds it:
> > >>>>> Service xyz.openbmc_project.EntityManager:
> > >>>>> `-/xyz
> > >>>>>    `-/xyz/openbmc_project
> > >>>>>      |-/xyz/openbmc_project/EntityManager
> > >>>>>      `-/xyz/openbmc_project/inventory
> > >>>>>        `-/xyz/openbmc_project/inventory/system
> > >>>>>          `-/xyz/openbmc_project/inventory/system/board
> > >>>>>            `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
> > >>>>>              |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
> > >>>>>              `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> > >>>>>
> > >>>>> Service xyz.openbmc_project.FruDevice:
> > >>>>> `-/xyz
> > >>>>>    `-/xyz/openbmc_project
> > >>>>>      `-/xyz/openbmc_project/FruDevice
> > >>>>>        `-/xyz/openbmc_project/FruDevice/_0
> > >>>>>
> > >>>>> I don't know why it's named _0, but I can debug that late
> > >>> The logic for that name is right here:
> > >>> https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L549
> > >>>
> > >>> I'm guessing either the board section product name field or the product
> > >>> section product name field is blank.  In that, we should probably check
> > >>> for empty string and move on to the next one.
> > >>
> > >> Thanks.  I'll take a look there and write up a patch to fix it.
> > >
> > > Dug into it and found that it is finding two of those FRUs on my
> > > platform, as it should, and it installs one with _0 then the other
> > > just overwrites it also with _0.
> > >
> > > I'll look into whether it's feasible to add a global list inside
> > > FruDevice so it can just add a number to the end or something.
> >
> > This should be doing it:
> > https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L596
> >
> >
> > My guess looking at this is that the for loop needs to be changed to
> > loop through until it doesn't find the same product name. If you
> > restarted the loop when index was incremented it would fix your issue I
> > think.
>
> Thanks, I am debugging it now and should have a patch for review before long.

Ok, so what's happening is it's finding the name, but it's an empty
entry, so I'm adding a check to see if the result is found and
empty(), accordingly.  Before, it was ok then adding the empty entry,
and then later it finds the entry and add _0 as the appending onto
empty.

So, now if it's empty from board (or not found) it'll try the product
name, and if that's empty (or not found) it'll name it unknown.

Patch going up once my testing is done.

>
> >
> > >
> > >>
> > >>>
> > >>>>>
> > >>>>> So I introspect on it:
> > >>>>> busctl introspect --no-pager xyz.openbmc_project.EntityManager
> > >>>>> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> > >>>>> NAME                                     TYPE      SIGNATURE
> > >>>>> RESULT/VALUE            FLAGS
> > >>>>> org.freedesktop.DBus.Introspectable      interface -         -
> > >>>>>                -
> > >>>>> .Introspect                              method    -         s
> > >>>>>                -
> > >>>>> org.freedesktop.DBus.Peer                interface -         -
> > >>>>>                -
> > >>>>> .GetMachineId                            method    -         s
> > >>>>>                -
> > >>>>> .Ping                                    method    -         -
> > >>>>>                -
> > >>>>> org.freedesktop.DBus.Properties          interface -         -
> > >>>>>                -
> > >>>>> .Get                                     method    ss        v
> > >>>>>                -
> > >>>>> .GetAll                                  method    s         a{sv}
> > >>>>>                -
> > >>>>> .Set                                     method    ssv       -
> > >>>>>                -
> > >>>>> .PropertiesChanged                       signal    sa{sv}as  -
> > >>>>>                -
> > >>>>> xyz.openbmc_project.Configuration.TMP421 interface -         -
> > >>>>>                -
> > >>>>> .Address                                 property  t         76
> > >>>>>                emits-change
> > >>>>> .Bus                                     property  t         17
> > >>>>>                emits-change
> > >>>>> .Name                                    property  s
> > >>>>> "Razorback Temp Sensor" emits-change
> > >>>>> .Type                                    property  s         "TMP421"
> > >>>>>                emits-change
> > >>>>>
> > >>>>> and all that looks correct, and now there's an i2c device at 17-004c,
> > >>>>> but no hwmon path, and:
> > >>>>>
> > >>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
> > >>>>> entity manager
> > >>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
> > >>>>> entity manager
> > >>>>> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
> > >>>>> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
> > >>>>> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
> > >>>>> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
> > >>>>> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
> > >>>>> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
> > >>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
> > >>>>> entity manager
> > >>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
> > >>>>> entity manager
> > >>>>> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
> > >>>>> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
> > >>>>> entity manager
> > >>>>> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
> > >>>>> Jul 25 00:27:27 machine cpusensor
> > >>>> [2666]: Error communicating to entity manager
> > >>>>> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
> > >>>>>
> > >>>>> Service xyz.openbmc_project.HwmonTempSensor:
> > >>>>> Only root object discovered.
> > >>>>>
> > >>>>> Any thoughts on the disconnect?  Have you seen anything like this?
> > >>>>
> > >>>> I had a hunch the driver was missing:
> > >>>>
> > >>>> tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
> > >>>> CONFIG_SENSORS_TMP421 is not set
> > >>>>
> > >>>> ... ok, so that makes sense then! :D  Will try fixing that first!
> > >>>>
> > >>>
> > >>> That would do it.
> > >>>
> > >>>>>
> > >>>>> Patrick
