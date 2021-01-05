Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C42EB16C
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:32:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9KLz57PjzDqgB
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:32:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gQ/+izJO; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9KJw6dRCzDqfc
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:30:40 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id q75so295337wme.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xS3PnClZe302KjKl8khqeD+pU+KHbvjAhbYBNsGiXcY=;
 b=gQ/+izJOIuYjMbR7WnaTLO1BTFy5sWkzXfv6IN1Rmey5cEbogx5fug0BBVQdG1md3d
 986Oc3uiyQZ60wv++ZNF8tdoV0kxz/5N3VsLTrIXvkUiXPF5yn/+f4buBys+buA6wKJu
 DNkUXk+0CY1sdEWtMrGkcD00gemE/3gUSGAzSvKwhQfkeoaPrdgWpIqWlIpiDRtNesLI
 s9w5+z75CaECfC0eV5nSzS+XI7AVrXBU1xTA0EBJ66pAGxDUDeE9pmn3tV+RX/zi/E5W
 oBjvJVttlSmasX75URtpwzwPdWVwoqA44QiPsT0UEoNpTWRpVEIQ3S3srRFs8/u4F0LF
 XcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xS3PnClZe302KjKl8khqeD+pU+KHbvjAhbYBNsGiXcY=;
 b=VWWflOwjOeD6jHeq9fiqWQoDT5d9wU4J0ub/GcwLXk+83AUGRdZL+C+dpcfniF7mrH
 Apo4eBtQ4Rbl3mLwMBHfLvzQYgBrxAg7dooZ73528oxOFCd5tq2edu6gZ4D92SUv5Z34
 7lz4RZ0P4ksITCdcxYemehAQcUn/uALSeBDgN4BLyuDHgJffr61nbUm9gOLA0LHt4CAa
 l10eoyczUS/rTQSzOCMBYExVmBia8kBluGshR8xG1cFIYO3ZmNkWBh3geaFVveW7FEgU
 xk1/3+Iv4d/bGMGWh7GKDU6W87JXpSqIuCnoC02InTQuwTl6iEyj3N9PZu3loyAvJUnK
 ZKgA==
X-Gm-Message-State: AOAM530Cxvi6tzp0EDQ13Hi/pM3GDH/Fd/QyElPlRsq3fptHf4WQBrWo
 CGnVyK7mpSfvfRCUadrh2hUDOr1/vM/5pBCzpjtqpA==
X-Google-Smtp-Source: ABdhPJz2tcQSiknKox6pR140zNO7l+VkM3f2fNoVKDxkGnN/b6urKXSWGW53MAXXnyTR8qbhC7BNEVsEI4ZGMOlVoqI=
X-Received: by 2002:a1c:220a:: with SMTP id i10mr166878wmi.93.1609867834333;
 Tue, 05 Jan 2021 09:30:34 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
In-Reply-To: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 5 Jan 2021 09:30:23 -0800
Message-ID: <CAH2-KxDbY8cphQCwzoeVw-UNOYn8-FkDUsktdZicB5=yUxfrvg@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
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

On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>
> Hi,
>
> Just putting on the list what was decided after some lengthy discussions
> on discord.
>
> I need a median of some sensor values, where this median sensor has
> threshold interfaces
> whose values must be defined in entity-manager.  Since exprtk
> expressions are not allowed in
> entity-manager, I cannot just port the PVS's JSON config into an
> entity-manager config.
>
> Instead, I will make a new entity-manager config that will have the
> component sensors
> along  with the thresholds to use, with a subtype of median, vaguely
> something like:
>
> {
>
> Type: "VirtualSensor"

I'm kinda thinking we just go with Type: "MedianSensor".  Technically
there are already other "virtual" sensors that have their own primary
type, so let's be consistent with them, and just declare this as a
primary type: "Median"

>
> Name: "MySensorName"
>
> Subtype: "Median"
>
> Sensors: [ "Sensor1", "Sensor2", .... ]

Just call this "Inputs" to be consistent in naming with the PID type
and stewise type.

>
> ThresholdsWithHysteresis [ ]

Should this just forward on thresholds from the sensors themselves to
reduce the amount of configuration, and to be consistent?  I'm
assuming this could be omitted, and we could just forward on the
median sensors threshold state if we wanted to.

If we really do need it, it should be called "Thresholds" to be
consistent with the other sensors.

>
> minInput: 0
>
> maxInput: 100
>
> }
>
>
> The minInput/maxInput are needed so we don't use garbage sensor readings
> in the median
> algorithm.

Doesn't the median algorithm already give you that behavior without
having to declare a new range?  If a sensor goes out of range, it's
very unlikely to be the median, so pre-gating the sensors just seems
like extra work.  Overall, this kind of config feels like something
each sensor itself should own, as they already have more information
than the median sensor.  If the sensor knows it has "garbage" values,
it should post some form of NAN that the virtual sensor can see and
act on.

What is the behavior if all sensors go out of this range or are invalid?
How will the MinOutput and MaxOutput for the sensor be calculated?  I
would assume based on the max/min of the inputs, but it's probably
worth calling out explicitly.
Do we need to add a PowerState parameter so the thresholds don't trip
on power cycles?


>  PVS will look for this config to be provided on D-Bus by
> entity-manager, and if
> it's there it will calculate the median (in C++, not exprtk) and use it
> as the virtual sensor value.
>
> Thanks,
> Matt
>
