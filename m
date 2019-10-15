Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90928D79A2
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 17:21:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46szff6qStzDr4r
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 02:21:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h9vyVdSf"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46szcP461dzDr39
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 02:18:09 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id c3so9756574plo.2
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CrOh66nwOlObJukX3Bms/sq7CvEIoQRTHxaAPNgzbMo=;
 b=h9vyVdSftuU2m2V92qt6tC4i/C2iRBuuHZ9uTj6i295aoJG82qmm7EjUcz0r/ZfENi
 Z3vfCF4sZ0NYp6P8/KqxGpPiMyHScDO5pO3tHKdg7ND5yU1li0EoE7xgBhju4djPgR+7
 qtuRJKneohqlCI9kpbVBHLhzgIL7u6mozelv3Tt8AoIjAwbwb9mz01ZEwsUsD1/FAfvg
 4gWZqETT5CpDU7OWmKgEQg3uWxx0RiYCAaZIIYp4I/vRbtlBJfZoJZY4gCxHKGInEt97
 ay0OJFMmamm/qYByP989lkfk8ZT316y6tSPJgSaPf6NmT4xTYqTcbvIAMQkakbk0adv+
 1hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CrOh66nwOlObJukX3Bms/sq7CvEIoQRTHxaAPNgzbMo=;
 b=YpgVQ2BRcjIyBgn2JIqLrUxzMaCjGiWzQMu86/fOUpFKAWYp7J1onW8MGXfCUd42C4
 fn2GjDWPBDp63ey4Jkn+bqw0J1EjHYDyW4P9SEHp96pCDwefGm/muaTcLdXBsRxYca1T
 AFmH2zAmeSPIBVOZsJGqHlhqGUyqqgj3WdF4BeFh1DjfeFMYIx2cL76w+rDEq7Vjr/J0
 f4ZXgZSAE+g8WspX7xwvxyHPs5Q9dV8gj8/KitSiBvHmb2k63OlMP8x7mnFfuklXy2NU
 xl/aotnuh/JCczvVNU9KrQwOO0escm5OrpA9yuwpnyvLMWtt9rzpev5fp+Fy7izCQo6t
 jNnA==
X-Gm-Message-State: APjAAAUnAlTrRA9Bus/Izz23FHQZQ43vsA14kZ/xuIFixFFHL8qXy1na
 vefaysfwBrrGTJ+ME30e5XyoMpP6s8AIxKWA13FyCQ==
X-Google-Smtp-Source: APXvYqyLJvZdgM53qXQPWdsNpUR+qmV21QlJuve26TF1+wiCsvx2xG0fGyuHTLektA9fYbcfZqrycPePwS4JsdKRjuY=
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr35766709plo.47.1571152685843; 
 Tue, 15 Oct 2019 08:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
In-Reply-To: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 15 Oct 2019 08:17:54 -0700
Message-ID: <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
Subject: Re: The type of sensor value in redfish should be double or int64?
To: Carol Wang <karo33bug@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 "Tanous, Ed" <ed.tanous@intel.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 7:57 PM Carol Wang <karo33bug@gmail.com> wrote:
>
> Hi,
>
> I tried to override sensor values with redfish Patch, referring to the Vo=
ltages example of https://github.com/openbmc/bmcweb/search?q=3D413961de&typ=
e=3DCommits, but met an error "Invalid argument". Comparing the code https:=
//github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L2192 =
and the doc https://github.com/openbmc/phosphor-dbus-interfaces/blob/master=
/xyz/openbmc_project/Sensor/Value.interface.yaml#L21, the current code uses=
 double type, but the doc says the value type should be int64. It seems a s=
cale difference. Why the code uses double here?

The short answer is, code generally authored by Intel uses doubles for
the sensor values, whereas the original OpenBMC sensor models used
int64.

A while back there was a bit of a debate about this, and it looks like
we never truly resolved it.  Brad, perhaps this is a good time to?
The idea is, that with the int64 storage, we store the raw value and
we also store the scaling factor, so that one can scale the number if
they choose to.  Sort of keeping the values as they are -- instead of
operating on them before publishing them to dbus.  We do notably
however, modify values in phosphor-hwmon before publishing them as
often there are scaling factors and offsets, beyond the conversion
from mC to C.

phosphor-host-ipmid's sensor YAML requires the type to be specified
for the sensor value interface already, and does validly support both
types: int64_t and double (I tested it when I briefly had a mixed
environment).
phosphor-hwmon reports values without applying the scaling factor, but
it is aware of the scaling factor, so it could.
phosphor-pid-control works with both types correctly.

I'm not sure about the phosphor-fan stuff, but I imagine we'll find
some arithmetic we can drop where it ingests values.

This change from int64 to double is big enough though that many
configuration files would need to be adjusted, which is non-trivial.
I argue however that having code that doesn't have a common interface
or interfaces for sensors is less than ideal.  Having multiple options
for talking to sensors is fine, but in my opinion this is only true if
they implement different interfaces, or the same interface.  In this
case, we have dbus-sensors and phosphor-hwmon which both implement the
same interface, but differently: int64 vs double.

I think using doubles makes sense at the dbus level because generally
one wants that version of the value.  Therefore you end up with code
in each daemon that reads the sensor value and the scale so that it
can perform the same operation that another daemon is also going to
perform, etc.  Instead of just doing it once.

I'll climb off my debate box now and climb onto my voting box and say,
I'd like to make phosphor-hwmon report the value as double and I'm
willing to review incoming patches that address other aspects of the
codebase to bring it all together -- since they'll need to be in a
locked step-forward.

>
> Thanks!
