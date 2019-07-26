Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1A77547
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 01:46:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wQhk5bTqzDqQ5
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 09:46:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VzS1eRUa"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wQh96MH6zDqNy
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jul 2019 09:46:01 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id i189so25210512pfg.10
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 16:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=YLM/B4ky7o3X3hQp0yzdYVZ2FXKIUnMBtbI3rF5/s44=;
 b=VzS1eRUagvGljwkFClFzny9C8SJK0AOgC9/ZV3xsRw2iR99qWePyMaE+hXpFg+ZU1/
 Cs5WHzISpOoBTCVtkr2jAiv8EbkyRVNdyc4ScLHQWIzghKKQoljfuwwOim8bcuPqebtN
 KzV6INbnfsaNe9vwWEZyrAmAFbaX3za8zvbvADVarFT1s7FogWiKqcFq7cgRLAOznwlm
 GBvjQF4zuZbGcYYMcb26fn2u5SVxusDvVNz9bLOqPvlJ7UYgg11A9UkFzyHbvZAu1H1g
 xAc+rilha2VIg6MQLdaBZRMQpMLfZ/8Dt9OVHlmlMvpnoBa2XXOFISXx9WW8vCnjQo4e
 yVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YLM/B4ky7o3X3hQp0yzdYVZ2FXKIUnMBtbI3rF5/s44=;
 b=B4HFUF6VfveVkQDz6ZiawjycirtGT4ikqEo5MaaCZqBIelYoluh37MrfFp0EdzSpdj
 nxFX15Qm+pUpEfEvubHcLbiNuxD+NB9QJD+xNOajS46eSUUa0M7ThYn91xsyUyhAE9LQ
 JRFcnQw6kMsVeHKNPYK6in8yWS6QhPebpvKIYr9ijbLwO1iaT4PWqtZoHJ0AwR9WcF6j
 YvtPzUCRVNXgtcfNWakRMCtD6uznclDolagME5JVTEXWBBGef67VrHRB/hAZxvxSK2Lo
 Arq0AR25UUQLXK6nIMEAlTAs11u4y9qo/hLXbAwindpXtIpQ+osanIt+lcysB0g98qy1
 YOwA==
X-Gm-Message-State: APjAAAWFtaqwCQS/0CwKCF28NZ/A5b39Rq8W+HpFmH6HSfd85T06ECEh
 m511LEqSBY9X6BBhyTDlnOm96RcCX9ogNKeMNjG56U0QJejnrQ==
X-Google-Smtp-Source: APXvYqygO0XVeQ3ce2ZO0kJYIAxVGAAFWoekiHbtanI2wqhIItX8yjNgnW2cqHQB8FqzwgUTKOPjNmAgWQeZTVKoqNw=
X-Received: by 2002:aa7:9f1c:: with SMTP id g28mr24530183pfr.81.1564184757908; 
 Fri, 26 Jul 2019 16:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
In-Reply-To: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Jul 2019 16:45:46 -0700
Message-ID: <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
Subject: Re: entity-manager experiments
To: James Feist <james.feist@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
>
> Hi,
>
> I was curious if you had any thoughts on what is missing here -- I
> wrote a basic json file:
>
> razorback.json:
> {
>     "Exposes": [
>         {
>             "Address": "$address",
>             "Bus": "$bus",
>             "Name": "Razorback",
>             "Type": "EEPROM"
>         },
>         {
>             "Address": "0x4c",
>             "Bus": "$bus",
>             "Name": "Razorback Temp Sensor",
>             "Type": "TMP421"
>         }
>     ],
>     "Name": "Razorback Board",
>     "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
> '.*Razorback'})",
>     "Type": "Board",
>     "xyz.openbmc_project.Inventory.Decorator.Asset": {
>         "Manufacturer": "$PRODUCT_MANUFACTURER",
>         "Model": "$PRODUCT_PRODUCT_NAME",
>         "PartNumber": "$PRODUCT_PART_NUMBER",
>         "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
>     }
> }
>
> And it finds it:
> Service xyz.openbmc_project.EntityManager:
> `-/xyz
>   `-/xyz/openbmc_project
>     |-/xyz/openbmc_project/EntityManager
>     `-/xyz/openbmc_project/inventory
>       `-/xyz/openbmc_project/inventory/system
>         `-/xyz/openbmc_project/inventory/system/board
>           `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
>             |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
>             `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
>
> Service xyz.openbmc_project.FruDevice:
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/FruDevice
>       `-/xyz/openbmc_project/FruDevice/_0
>
> I don't know why it's named _0, but I can debug that later.
>
> So I introspect on it:
> busctl introspect --no-pager xyz.openbmc_project.EntityManager
> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
> NAME                                     TYPE      SIGNATURE
> RESULT/VALUE            FLAGS
> org.freedesktop.DBus.Introspectable      interface -         -
>               -
> .Introspect                              method    -         s
>               -
> org.freedesktop.DBus.Peer                interface -         -
>               -
> .GetMachineId                            method    -         s
>               -
> .Ping                                    method    -         -
>               -
> org.freedesktop.DBus.Properties          interface -         -
>               -
> .Get                                     method    ss        v
>               -
> .GetAll                                  method    s         a{sv}
>               -
> .Set                                     method    ssv       -
>               -
> .PropertiesChanged                       signal    sa{sv}as  -
>               -
> xyz.openbmc_project.Configuration.TMP421 interface -         -
>               -
> .Address                                 property  t         76
>               emits-change
> .Bus                                     property  t         17
>               emits-change
> .Name                                    property  s
> "Razorback Temp Sensor" emits-change
> .Type                                    property  s         "TMP421"
>               emits-change
>
> and all that looks correct, and now there's an i2c device at 17-004c,
> but no hwmon path, and:
>
> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
> entity manager
> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
> entity manager
> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
> entity manager
> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
> entity manager
> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
> entity manager
> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
> Jul 25 00:27:27 machine cpusensor
[2666]: Error communicating to entity manager
> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
>
> Service xyz.openbmc_project.HwmonTempSensor:
> Only root object discovered.
>
> Any thoughts on the disconnect?  Have you seen anything like this?

I had a hunch the driver was missing:

tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
CONFIG_SENSORS_TMP421 is not set

... ok, so that makes sense then! :D  Will try fixing that first!

>
> Patrick
