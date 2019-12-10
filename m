Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF80119C55
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 23:28:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XZTp5mSBzDqRD
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 09:28:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dn0QhYwj"; 
 dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XZR02k80zDqZy
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 09:26:17 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id j22so11388461oij.9
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 14:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+FW2VaGuZcvE9W4agqxw9ZCFpKuFFwUbuM2SKBhyLuc=;
 b=Dn0QhYwjDulCJ3KX7gu/taSw25qLLnYt8wzy42Fn2ckRk8OptBm/RJ4JAk+HvKF4x4
 PS3Var9OChd588VJDl+o4egPFCv4I0dcp1IQCY5ZcAEaZ4XVYGmWvtg02dAQ2WmztfzU
 mJEhW5G2toUtaB/d5B5Xx7IFJ8rEhwv9M2z6tZzw7J1JTMD+XzsnHDo6Q8lhd4YdC+jH
 U8r2af8mqjd1+OLLGP8ulhSeZGguTNMw/wiyhqsUYdeF2jgui3Z+I9LIaRvXclOPEn8c
 qhKt8rl3onPxdqKC8pqhQA8K6kzuTT9wpbzlIuvVHrolZe53tYru5UKovgGk503QKxxD
 8X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+FW2VaGuZcvE9W4agqxw9ZCFpKuFFwUbuM2SKBhyLuc=;
 b=lDmCsOwUsZ33hAz4iBB1CFqYpIllk1/r77y9fo5tsrOdFmO1oP4ph+fEQGDH7ZDO3m
 LSMrx0QiZT9kpJO9wox0ZzmiIk5pzGuiipdVk6a9jq4b/Jo043JfjOym+fi2rfoSRgO0
 tlPDBWF/7nFh17+ttgUf2vq/2KGTIX4fn95MwNDJ9ZRbu874ubdJ80ruHkGnsmGpHxXy
 5G/wT5trfmRD/INhIPp9GQJrr5+vQ00Qybw0b/u9Gu2IWsK3oofMbGh1fgJb5NWePptv
 mKApDho/6DE8gSE2kpcmOcp2WBGdatAnD0oBJHOSfQbxVadBjgwu7toFWp0O+KIwtwkH
 QBKw==
X-Gm-Message-State: APjAAAVe2cy+el829qW38PAMmRiRjvcPDv3gJIoa85r9xyXMw9OOkkKX
 9VSDByPktTlvkA8Wwx8ABHV61iH0Gc/BKRew/bc=
X-Google-Smtp-Source: APXvYqw0WJStxofyqql5Vv4d4S4vm1R+E7KW09g5NQeYKZyy7EzT3SdzfNyoLXbWBHsR5Swe8EPyCPwT2wIW3uQAoVA=
X-Received: by 2002:aca:ec45:: with SMTP id k66mr259650oih.179.1576016774062; 
 Tue, 10 Dec 2019 14:26:14 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmNsry0bq-5eTD5qo0LDq_zWag9s8kGqMq4yGxzpxXCeA@mail.gmail.com>
 <CAGMNF6Wc_1pxReDXYQvOQO1Oy5K+Ejn+G+j9F-ei4Vpg4nQ5XQ@mail.gmail.com>
 <CAARXrtmYBVQCb320kNxKyo3Sp1i7sZ5-kMi1efHVDOD2cXvuGw@mail.gmail.com>
In-Reply-To: <CAARXrtmYBVQCb320kNxKyo3Sp1i7sZ5-kMi1efHVDOD2cXvuGw@mail.gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Tue, 10 Dec 2019 16:25:39 -0600
Message-ID: <CAK_vbW3N=HFKLxXN0KcMLVJdaZvw9w_w0awG7CEYq-Xoyouk+Q@mail.gmail.com>
Subject: Re: Updates and future changes on phosphor-power
To: Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Matt Spinler <mspinler@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 9, 2019 at 9:25 PM Lei YU <mine260309@gmail.com> wrote:
>
> On Tue, Dec 10, 2019 at 5:10 AM Kun Yi <kunyi@google.com> wrote:
> >
> > Hello Lei,
> >
> > We have some interest to help contribute to the phosphor-power utils.
> >
>
> Great!
>
> >
> > Will phosphor-power provide PMBus fault status bits monitoring?
>
> Yes, it already does monitor PMBus fault, see [power_supply.cpp#L134][1]
>
Yes, the current power supply monitoring application does provide for
status bit monitoring. The generic ones are at the top level of the
tree:
STATUS_WORD fault bits:
 https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bc=
cc8ee92ddbc89/pmbus.hpp#L45
STATUS_VOUT fault bits:
 https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bc=
cc8ee92ddbc89/pmbus.hpp#L84
STATUS_TEMPERATURE fault bits:
 https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6b1c2bc=
cc8ee92ddbc89/pmbus.hpp#L94

There are some potential conflicts though with whether one really
wants to be monitoring certain faults, such as the fan or temperature
faults. There is also no universal definition for STATUS_MFR:
STATUS_MFR: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000=
372e6b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L351
If one looks at "PMBus Power System Mgt Protocol Specification =E2=80=93 Pa=
rt
II", the details to STATUS_MFR_SPECIFIC list every bit as
"Manufacturer Defined", so any attempt to further analyze the fault
based on those bits would be specific to the power supply being used.

Some of that, along with the input history collection it is currently
doing, should probably be configurable. That along with some other
things lead to a proposal for creating a new application that would be
driven via a JSON file, etc.:
https://github.com/openbmc/docs/blob/master/designs/psu-monitoring.md

I have some code in progress towards implementing the new power supply
monitoring application, trying to drive towards a more configurable
approach.

>
> > How is it co-operating with phosphor-hwmon or dbus-sensors when reading=
 sensor data from the same PSU device over the same i2c bus?
>
> As far as I know, it does not co-operates with phosphor-hwmon (and I
> am not familiar with dbus-sensors). @Matt Spinler correct me if I am
> wrong.
> Instead, it sends the error log to logging service with the inventory
> path when the error is found. See [power_supply.cpp#L309][2]
> And when the error is gone, it resolves the error by setting the
> `Resolved` property of the log. See [power_supply.cpp#L282]
>
I am not aware of any direct interaction that the power supply monitor
has with phosphor-hwmon or dbus-sensors. There is however some
telemetry data that potentially gets collected via the phosphor-hwmon
application. That is pushing up data such as the input voltage, input
power, etc. I am not very familiar with dbus-sensors, but I am
assuming it serves a similar telemetry purpose.

> There is a [fault-monitor][4] in phosphor-led-manager that monitors
> the error logs in logging service, and assert/deassert the related
> fault LED group.
> So the fault LED will be turned on when an error occurs, and turned
> off when the error is resolved or cleared.
>
That fault LED interaction is somehow tied to associations.
Example associations.json:
https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-witherspoon/re=
cipes-phosphor/inventory/phosphor-inventory-manager/associations.json

> [1]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6=
b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L134
> [2]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6=
b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L309
> [3]: https://github.com/openbmc/phosphor-power/blob/1d103428e50ec000372e6=
b1c2bccc8ee92ddbc89/power-supply/power_supply.cpp#L282
> [4]: https://github.com/openbmc/phosphor-led-manager/tree/master/fault-mo=
nitor

These references, along with the ones I included inline are hopefully helpf=
ul.
