Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B877540
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 01:41:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wQbK3b9BzDqRt
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 09:41:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ys1r2XXn"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wQZj6fKwzDqRH
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jul 2019 09:41:14 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id f5so16637134pgu.5
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 16:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=dtkZW5nkYk9BP9qO8rWO44uI/Nu7+56ZY/cbnUiF25w=;
 b=Ys1r2XXnqdCxjPebrb9dzF/N7DMACGWS8pNhDo8mu3Xb0mijSnHkQZsuBmimpC9EMs
 iUVEU8QJ3LPySc883Umfq9VLd1nZTkEfM5k+U/Q9fHWLGjl50NXWaFo7o4AY9lNQSdnw
 gPeqML/uFkG1woBY2xDnIhapgPi7qziZ5fI9gBono3DkP8T8swYAaMqTUfAWChWEl40c
 pjbto3MVMcSymMABmTtQ7EMBAnKkZvsn0IcwyFhdGbV7UjlpktWvuV3w71xDG7s8q7pV
 Ju6k/wQHMulWuGZa0p4DCwBH6ULJ3cu6YHdEnol+5KICXg6GN1fRWdQY+E1SEbd4QCu5
 Un0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dtkZW5nkYk9BP9qO8rWO44uI/Nu7+56ZY/cbnUiF25w=;
 b=DrxwlQsliz39IrjkA5Z/VeqaSXyQMdivPEEAxaXjXrscLOHBev+ZI9mcvN9eCHPyTX
 pAbxh6UFc0YOlprpIasBmtB7IoOVrqtg99YGCFRXmyKjxidJPaUiZCqMP29xk8YmyR5k
 6U15Gg9QA83X3QXWY/EVUUUlj8i4iCWUigEJKCeaOZUIMkMnEvoKHAjpWjqSPFG4M1l/
 qyZeh61HIVH8mhiNwd5vz80BeZkcG5XBh8QwLBPC6PWf90R6oLOHSuPeWLOR2JjrDLjd
 hSwQYHOLvNyT5oquHFdLndvOy5MQvzQE3cNsuRjwEGluuPYBDT+fFJDENAvr5tkjcXaH
 gBLg==
X-Gm-Message-State: APjAAAWOBCephizUzyOmI0czqwkUeTupyfUrNP/Oo1f1I60wVEtE8oKO
 /m5i1dSI4uUbDhcxB0ahu7vuH2N1KnEj5KAsmj2/Bg==
X-Google-Smtp-Source: APXvYqzTpWQz1gHdutcRmxdpv2tZqXgi83FObp+ES8GcoNiNE+GwAs1bU3OMyISTZtKXAoRKdYc6qxF6J0XFNAI4s78=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr24750493pfi.136.1564184470547; 
 Fri, 26 Jul 2019 16:41:10 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 26 Jul 2019 16:40:58 -0700
Message-ID: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
Subject: entity-manager experiments
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

Hi,

I was curious if you had any thoughts on what is missing here -- I
wrote a basic json file:

razorback.json:
{
    "Exposes": [
        {
            "Address": "$address",
            "Bus": "$bus",
            "Name": "Razorback",
            "Type": "EEPROM"
        },
        {
            "Address": "0x4c",
            "Bus": "$bus",
            "Name": "Razorback Temp Sensor",
            "Type": "TMP421"
        }
    ],
    "Name": "Razorback Board",
    "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
'.*Razorback'})",
    "Type": "Board",
    "xyz.openbmc_project.Inventory.Decorator.Asset": {
        "Manufacturer": "$PRODUCT_MANUFACTURER",
        "Model": "$PRODUCT_PRODUCT_NAME",
        "PartNumber": "$PRODUCT_PART_NUMBER",
        "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
    }
}

And it finds it:
Service xyz.openbmc_project.EntityManager:
`-/xyz
  `-/xyz/openbmc_project
    |-/xyz/openbmc_project/EntityManager
    `-/xyz/openbmc_project/inventory
      `-/xyz/openbmc_project/inventory/system
        `-/xyz/openbmc_project/inventory/system/board
          `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
            |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
            `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor

Service xyz.openbmc_project.FruDevice:
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/FruDevice
      `-/xyz/openbmc_project/FruDevice/_0

I don't know why it's named _0, but I can debug that later.

So I introspect on it:
busctl introspect --no-pager xyz.openbmc_project.EntityManager
/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
NAME                                     TYPE      SIGNATURE
RESULT/VALUE            FLAGS
org.freedesktop.DBus.Introspectable      interface -         -
              -
.Introspect                              method    -         s
              -
org.freedesktop.DBus.Peer                interface -         -
              -
.GetMachineId                            method    -         s
              -
.Ping                                    method    -         -
              -
org.freedesktop.DBus.Properties          interface -         -
              -
.Get                                     method    ss        v
              -
.GetAll                                  method    s         a{sv}
              -
.Set                                     method    ssv       -
              -
.PropertiesChanged                       signal    sa{sv}as  -
              -
xyz.openbmc_project.Configuration.TMP421 interface -         -
              -
.Address                                 property  t         76
              emits-change
.Bus                                     property  t         17
              emits-change
.Name                                    property  s
"Razorback Temp Sensor" emits-change
.Type                                    property  s         "TMP421"
              emits-change

and all that looks correct, and now there's an i2c device at 17-004c,
but no hwmon path, and:

Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
entity manager
Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
entity manager
Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
entity manager
Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
entity manager
Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
entity manager
Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
Jul 25 00:27:27 machine cpusensor[2666]: Error communicating to entity manager
Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration

Service xyz.openbmc_project.HwmonTempSensor:
Only root object discovered.

Any thoughts on the disconnect?  Have you seen anything like this?

Patrick
