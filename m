Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AB88DFB9
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 23:27:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4682j32mM8zDqxZ
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 07:27:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lmuUZt3l"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4682hT08QQzDqgH
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 07:26:32 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id t14so164217plr.11
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWUPtbAhAHB04iH6g1M537ynkfGe0dF2Q92n8tldQgs=;
 b=lmuUZt3lcHXTQZ3m05ULMxRtvZXAvfJ5ZAFNsM4A1aQuV0NkQQHkViHNhpo0gMytTw
 +inNFrTgpmL/psXRfjHb46ew+9Z3sRwmEmB8gTB0El733nADwPMQbXeptTPo3oPaMr+S
 ET+7iiIGWegyTZzjDcdbKWzh1yEezcyXvOOgtC2Q07vSBFJConn5zolVDkIjUse2agiX
 dyA2jNqpnrZ18XntWldvuPVGaUrryB8SQU9CnqqYu7MMo2WD3WMwNs4dRPASCBTA4Aqt
 yJiecDt5KJ8TrsUji7kKY2mICNGztnYSk3ECPW4CjqQbaK4sgJJPHNSswBuyfQ04oE/h
 6AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWUPtbAhAHB04iH6g1M537ynkfGe0dF2Q92n8tldQgs=;
 b=d7T14FQcQaglz3c9+2HwlKKTBnpZMolYCEUWlft1j0lEl5D/bTmZOF0n3RbGRlnoZh
 sewEqknVwI1gfnX8KgAi/qTDOuDiEKL9hQsSVNj+DjCWd5GBuqBVkR2rZpe4/H2WHjmd
 dqUxXfuHPDJRzXDWtbbGbF/7zBP85hN83MZlTzhxJpjZPrZcAGWR/FLf9yUZq2nk7vyf
 1eNX08Nq1zmKrrqtbawdnuwI9RhZVW31j9EL+AT9LpGRhP+jP+WkdXhcx7HAu7dqQet8
 7zKG12Sj6svzdERaf+SMscwve14yIe6fnG551IhdoSbyY7DRLnqX2bKCeNJ4oIuwxnTz
 T21w==
X-Gm-Message-State: APjAAAUmYydZRK4+/b7zpBtcyCzfUmTZ0CDqAjwTlBrDiSrocqPe5v4t
 xHfAGoUVEhiFAmxel9I2hdheUenuJf/fEoPH2DOGlg==
X-Google-Smtp-Source: APXvYqzjFjsssQV/7SQ0yqcM/LA/Od/OUMv1+FbHsdmHFcRdzVuGtW8U0qo2pBvRXh8REB5ravIMsOWY43gfXH60k2E=
X-Received: by 2002:a17:902:9897:: with SMTP id
 s23mr1302862plp.47.1565817988559; 
 Wed, 14 Aug 2019 14:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwDmu0Xz4usK1aZQg39V3vT9ZBOt7L7zDp8zRN+5dMcvw@mail.gmail.com>
 <990303f2-4434-f098-1f2c-af3bd4ffa075@linux.intel.com>
In-Reply-To: <990303f2-4434-f098-1f2c-af3bd4ffa075@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Aug 2019 14:26:17 -0700
Message-ID: <CAO=notzwkY5+fcnfqiO-D6KSqQMagUcjtvXjoKcxnPBAw9D6NQ@mail.gmail.com>
Subject: Re: mixing phosphor-dbus-interfaces and intel-dbus-interfaces
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

On Wed, Aug 14, 2019 at 2:17 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 8/14/19 2:09 PM, Patrick Venture wrote:
> > I was curious how you guys mixed your dbus-interfaces repos.  it looks
> > like at least in dbus-sensors that you approach the use of them
> > differently.  So there's no incompatibility -- for instance, between
> > the two sensor value interfaces?
> >
>
> sdbusplus asio doesn't require any yaml files, it lets you create the
> interface on the fly.
>
> Examples are here:
> https://github.com/openbmc/sdbusplus/blob/4212292bcf136d04b38ba5116aa568b0fa312798/example/asio-example.cpp#L206
>
> So to create the sensor interface one just calls:
>
>   auto server = sdbusplus::asio::object_server(conn);
>    std::shared_ptr<sdbusplus::asio::dbus_interface> iface =
>       server.add_interface("/xyz/openbmc_project/Sensor/Value",
>                             "xyz.openbmc_project.SomeType.SensorName");
>
> Then if you want a double you call.
>
> double value = 3;
>
> iface->register_property("Value", value);
>
> and it adds it to the vtable.
>
> Then just call iface->initialize();
>
>
> So for adc sensor it gets created on the fly here:
> https://github.com/openbmc/dbus-sensors/blob/7fa475d3f27ec6c37503ff7ec0496acc2215da29/src/ADCSensor.cpp#L57
>
>
> and the double is added here:
>
>
> https://github.com/openbmc/dbus-sensors/blob/7fa475d3f27ec6c37503ff7ec0496acc2215da29/include/sensor.hpp#L62
>

Thanks! That's what I saw -- that you weren't leveraging the generated
objects in the libphosphor-dbus-interfaces, basically.  Neat.

In a mixed environment, one just has to check if the variant is
int64_t or double when reading - no big deal.

Fun times.

>
> -James
>
>
> > Patrick
> >
