Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85079859
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 22:07:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y9hG3cPqzDqPw
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 06:07:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KRM7/SVN"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y9g12YZLzDq9G
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 06:06:04 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id w10so28796744pgj.7
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaF+u1gO3fDpzXtU/L8N2YiSooemWRIAKIQQT+0qMX4=;
 b=KRM7/SVNIYIfyDJJEl4PjAWMEPTu1I4M1us7GaT8X9+gw/xfXfUMNpd4hyoIjTKoi0
 sKMIZIvGh+5evjqXpagmtbMtqwfseh9hKWY0EupQGHTh0GE2qAZdShnk+8E9/baWX9gt
 +Vj31ARzaZzG4zRda95kz+Eulvcesjtm/tE82nDO48r3BD+hmC1Ouk1vIOoHZvqiZHco
 1b8BmgkltF7DRgZhJT8OQwpHntJ/i/WMUWDVhLBM+FdHi854Yww9jlSIKT3Mew7+5ZI/
 wJooNgHjQt/uMYzTKcqUxNYP9qP55F5RQfz+2iiG9jDxSQ98TDC+WUxPbuyakh3ZD45v
 7U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaF+u1gO3fDpzXtU/L8N2YiSooemWRIAKIQQT+0qMX4=;
 b=pFj1dL0ODFqV7bF4kOWrjeHIEWN3EhljiLnudKsZncI1RNDuVf88yOkndQYCOCPnS+
 +FiILeDe5dy0rbdDFgOlU4h6nU3kXpJFbRRGhnC/tG5adH1B5UA3ccAFWl6aqKIezwS2
 Knfuo+LF4TuiRpTYnPqaRXjBMo4aG0Zgj1wejdvGAjXad6rf4AbXlA8IFdk1EiYGRi9p
 ZBLl/8pnfUcpOOocrQDcL2Xdw163EViQsLvc6mpI3o17qV+il5nrA6fajaOXUkBaAtZc
 hP6YLLa4TvQFc5/JNngcyn2yD1g2uE//lo7zOGNF0bNOppAZ8r0G1YEFH+sIy/KSdnMI
 rqKw==
X-Gm-Message-State: APjAAAXqOrac73EhWMCtg4tIUCy488kDDWwnbw9f0oMpRoHqR3/YZpcA
 WqpAp+EqGk+MbpH/Th5uHUELsDClsOY8X2w1f3dKhQ==
X-Google-Smtp-Source: APXvYqxY1o4LrdPsYDOaRJAFHB4LxdsqHhC3PIzQxJsDeQVXijnprNIAnAE3hYv0wVzI1GKb5hHVDnJ1N8xY1MZZ4Ms=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr38183991pfi.136.1564430760666; 
 Mon, 29 Jul 2019 13:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
 <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
 <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
In-Reply-To: <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 29 Jul 2019 13:05:49 -0700
Message-ID: <CAO=notxtHNyi9hJTQ5H5LT9BR_6a6yO+e5fdr92-R+jBy0hCUQ@mail.gmail.com>
Subject: Re: entity-manager experiments
To: Ed Tanous <ed.tanous@intel.com>
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

On Mon, Jul 29, 2019 at 12:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 7/26/19 4:45 PM, Patrick Venture wrote:
> > On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
> >>
> >> Hi,
> >>
> >> I was curious if you had any thoughts on what is missing here -- I
> >> wrote a basic json file:
> >>
> >> razorback.json:
> >> {
> >>     "Exposes": [
> >>         {
> >>             "Address": "$address",
> >>             "Bus": "$bus",
> >>             "Name": "Razorback",
> >>             "Type": "EEPROM"
> >>         },
> >>         {
> >>             "Address": "0x4c",
> >>             "Bus": "$bus",
> >>             "Name": "Razorback Temp Sensor",
> >>             "Type": "TMP421"
> >>         }
> >>     ],
> >>     "Name": "Razorback Board",
> >>     "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
> >> '.*Razorback'})",
>
> I'd recommend taking out the wildcard if you can if you don't expect
> there to be multiple models of this board.  We've gotten trapped a
> little in the past with next-gen boards sporting a similar product name
> (think 2019_Razorback vs 2020_Razorback) and configs getting applied
> that shouldn't have.

Thanks.

>
> >>     "Type": "Board",
> >>     "xyz.openbmc_project.Inventory.Decorator.Asset": {
> >>         "Manufacturer": "$PRODUCT_MANUFACTURER",
> >>         "Model": "$PRODUCT_PRODUCT_NAME",
> >>         "PartNumber": "$PRODUCT_PART_NUMBER",
> >>         "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
> >>     }
> >> }
> >>
> >> And it finds it:
> >> Service xyz.openbmc_project.EntityManager:
> >> `-/xyz
> >>   `-/xyz/openbmc_project
> >>     |-/xyz/openbmc_project/EntityManager
> >>     `-/xyz/openbmc_project/inventory
> >>       `-/xyz/openbmc_project/inventory/system
> >>         `-/xyz/openbmc_project/inventory/system/board
> >>           `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
> >>             |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
> >>             `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> >>
> >> Service xyz.openbmc_project.FruDevice:
> >> `-/xyz
> >>   `-/xyz/openbmc_project
> >>     `-/xyz/openbmc_project/FruDevice
> >>       `-/xyz/openbmc_project/FruDevice/_0
> >>
> >> I don't know why it's named _0, but I can debug that late
> The logic for that name is right here:
> https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L549
>
> I'm guessing either the board section product name field or the product
> section product name field is blank.  In that, we should probably check
> for empty string and move on to the next one.

Thanks.  I'll take a look there and write up a patch to fix it.

>
> >>
> >> So I introspect on it:
> >> busctl introspect --no-pager xyz.openbmc_project.EntityManager
> >> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> >> NAME                                     TYPE      SIGNATURE
> >> RESULT/VALUE            FLAGS
> >> org.freedesktop.DBus.Introspectable      interface -         -
> >>               -
> >> .Introspect                              method    -         s
> >>               -
> >> org.freedesktop.DBus.Peer                interface -         -
> >>               -
> >> .GetMachineId                            method    -         s
> >>               -
> >> .Ping                                    method    -         -
> >>               -
> >> org.freedesktop.DBus.Properties          interface -         -
> >>               -
> >> .Get                                     method    ss        v
> >>               -
> >> .GetAll                                  method    s         a{sv}
> >>               -
> >> .Set                                     method    ssv       -
> >>               -
> >> .PropertiesChanged                       signal    sa{sv}as  -
> >>               -
> >> xyz.openbmc_project.Configuration.TMP421 interface -         -
> >>               -
> >> .Address                                 property  t         76
> >>               emits-change
> >> .Bus                                     property  t         17
> >>               emits-change
> >> .Name                                    property  s
> >> "Razorback Temp Sensor" emits-change
> >> .Type                                    property  s         "TMP421"
> >>               emits-change
> >>
> >> and all that looks correct, and now there's an i2c device at 17-004c,
> >> but no hwmon path, and:
> >>
> >> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
> >> entity manager
> >> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
> >> entity manager
> >> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
> >> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
> >> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
> >> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
> >> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
> >> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
> >> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
> >> entity manager
> >> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
> >> entity manager
> >> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
> >> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
> >> entity manager
> >> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
> >> Jul 25 00:27:27 machine cpusensor
> > [2666]: Error communicating to entity manager
> >> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
> >>
> >> Service xyz.openbmc_project.HwmonTempSensor:
> >> Only root object discovered.
> >>
> >> Any thoughts on the disconnect?  Have you seen anything like this?
> >
> > I had a hunch the driver was missing:
> >
> > tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
> > CONFIG_SENSORS_TMP421 is not set
> >
> > ... ok, so that makes sense then! :D  Will try fixing that first!
> >
>
> That would do it.
>
> >>
> >> Patrick
