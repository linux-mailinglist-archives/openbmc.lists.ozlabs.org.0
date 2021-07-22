Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3815B3D2763
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 18:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVyH10cj2z3035
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 02:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Y3VOSjlb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Y3VOSjlb; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVyGl3QmRz2xYv
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 02:15:25 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id m2so6554598wrq.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BTQEDzjfegxnMXdF67YiYNewkjmxSfEjKni95UaPHq4=;
 b=Y3VOSjlbUZbduWRuCn73kRHet/yg/grpT8jn5GPbTjHxzkkMrW/AYELr14PGXcfsmk
 DwHR2+acDpOdU8AtShPSoXExs8vwdSEqGtbhxDTDt15WfSGHA4u9v+uxFat6UH3g9ReE
 43TvRcNZ7RKBXNdzuejRW0SnmRnn5QlymrTDIFcqy5J64FKWpqP95f3/FxCF6b8OVSJu
 ZyYr6CSq+wbrfsFjnBbZXmfh50Flmcj45edtrcCMqSzZ9JqB9LiTUdWqjAOAFTVtOwrp
 eEeQNZnwovJhR+eKjccGgoNpq3qtE/xurisk1UFFHCI6dGDJW08qMpzLSVC8cyqCcuV6
 5hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BTQEDzjfegxnMXdF67YiYNewkjmxSfEjKni95UaPHq4=;
 b=JUMNFOlXCZIY3opUQ09bepPr4It4hZRNts+wpRvwaTTPNdW2C1GMOBicNOpQgiUoDP
 oEC4M+GxkIXdsN4VEM/tX0ibPgmbswyE+/4wHKCmssyqTZ4C79urWZsIb1xhwglyg/Yu
 1vkshVtNdzwgcKqtC9GA/0ifNanzntfE4yWFLHOxzIvGYzpxKSwKnO0mURkom42qCTV+
 5pmncdyYOWqn6OF49j888D7rCctq3zaP5ib6AdFNY8uXizXAsxhL0quAy/Oq4T/sp+iq
 34fi63a7EL0y2enZA1kjp4Lk+KXQzRG6BJQ7MC1jKTdIb8g1Crl/Ey2BQX/K4DLrjs9f
 SK3w==
X-Gm-Message-State: AOAM531qs2iXCE6fFGr0v//0SyXvsNYe9Moqnyk5kminNc31LOJ8KrIQ
 iUudLbWNGsYyxumE1QUvIjsoAM/Ko9QkNndn6pvvRg==
X-Google-Smtp-Source: ABdhPJxWBEMQiAJIEVasfmXrqt2dPYYDxi9hnfrNxmt4v2n7Cw2o7pCSk7/NTsTiQ1XmMXD9xODyB8qPOtqDWyjxjDI=
X-Received: by 2002:a5d:6302:: with SMTP id i2mr765574wru.366.1626970517743;
 Thu, 22 Jul 2021 09:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <e8730a3b-9cf3-7167-20f2-e7031a6c6f69@amperemail.onmicrosoft.com>
In-Reply-To: <e8730a3b-9cf3-7167-20f2-e7031a6c6f69@amperemail.onmicrosoft.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 22 Jul 2021 09:15:04 -0700
Message-ID: <CAH2-KxCypE01QyLJ+0n0muOs-4a3yB8+caFowpqVgZKm611nWA@mail.gmail.com>
Subject: Re: Add socsesor daemon to handle Ampere SoC sensors in dbus-sensors.
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 22, 2021 at 8:56 AM Thu Nguyen
<thu@amperemail.onmicrosoft.com> wrote:
>
> Dear Ed Tanous,
>
>
> As we discussed before about the Ampere CPU daemon in OpenBmc general dis=
cord channel. I'm planing to submit the some patches which will add to Ampe=
reSoC daemon source code to dbus-sensors for reviewing. This daemon will ha=
ndle Ampere Altra SoC sensors. The functions of this daemon are the same as=
 CPUSensor daemon which is handling Xeon CPU sensors.
>
> Below is what I will add.
>
>     1. Add some files to to Dbus-sensors source:
>
>         ./src/AmpereSoCMain.cpp : Match the sensors configurations in ent=
ity-manager configuration file with sensor paths in the device driver. And =
create the SoC sensor dbus objects.

At this same time, we should rename "CPU sensor" to "Intel CPU" so we
can easily differentiate.  Ideally your new daemon would also be
called "AmpereCPU" to keep the naming conventions the same.

>
>         ./src/AmpereSoC.cpp : Create the sensor handler and update sensor=
 values to the sensors dbus objects.
>
>         ./include/AmpereSoC.hpp : Declare functions and constants.
>
>         The structure and the functions of the files are similar the file=
s which create ADCSensor daemon or PSUSensors daemon...
>
>     2. Add AmpereSoC daemon which will be named as "xyz.openbmc_project.s=
ocsensor.service".
>
>         Below is dbus-sensors daemons in our system:

This list seems disconnected from AmpereSOC.  Was there something you
were looking for input on there?

>
>
>
>     3. Add dbus interface to public sensor dbus objects. The name of this=
 interface is "xyz.openbmc_project.SoCSensor".
>
>         Below is some sensors in this dbus interface.

Neat.

>
>
>
>     4. The causes of this adding are:
>         + The Ampere SoCs and their interfaces are quite complicated to u=
se the current daemons.

Considering that ampere CPUs support their own disparate OOB
interface, I suspect it's ideal that they would be separated out into
their own daemon.

>         + We can't use CPUSensor daemon which is specific for Intel Xeon.=
 We use I2C interface to access the SoC sensors which Intel Xeon using PCIE=
.

This is fine, and what I would've expected.  CPU sensor is fairly
specific to PECI today.

>         + Our SoC hwmon drivers are different with the other hwmon driver=
s in linux kernel. We are using one MDF driver name ac01-smpro, it have thr=
ee sub drivers ac01-hwmon which report the temperature, the consumed power,=
 current and voltage of components in SOC.
>         + In the near future, We append AmpereSoC daemon to monitor SoC R=
AS and SoC events as you suggested.
>
>     Please let me know if you have any comments about this plan.


I'm looking forward to the patches.  I don't see any concerns, as
everything above looks like you're following the existing interfaces.

>
>
> Thanks.
>
> Thu.
>
>
>
> CONFIDENTIALITY NOTICE: This e-mail message, including any attachments, i=
s for the sole use of the intended recipient(s) and contains information th=
at is confidential and proprietary to Ampere Computing or its subsidiaries.=
 It is to be used solely for the purpose of furthering the parties' busines=
s relationship. Any unauthorized review, copying, or distribution of this e=
mail (or any attachments thereto) is strictly prohibited. If you are not th=
e intended recipient, please contact the sender immediately and permanently=
 delete the original and any copies of this email and any attachments there=
to.
