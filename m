Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 415702EB173
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:33:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9KNW2cBQzDqgw
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:33:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=W5Yul2gB; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9KLj2rXhzDqgq
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:32:13 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id a12so36936343wrv.8
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wn6yzS2leb46KZ2+Q1rY4wX7fVMACxcEWzX3eyMsDag=;
 b=W5Yul2gBx7fKUdYpMRQjjvsTS4QFOtuTOOR5ejFGGGK8yQdpIIqB71xHvmUwiZL/NG
 7r5TOwHiGgLzBqo4HDTOpKx+g2obl0b5PhNSvTVrTRVwvB4Snik08iGFD4n6Fvviev5Z
 GLgLv3yExN43+YWI5GN67mdC4v331CaNYAgEYVhMbZPGbk+1ygOFPOTAv87vgPh+fOSe
 lGE0dSGa1dm0yWVHUQiOpEfMqoBI5IO7rkDmexC+1F8slyyn3nLXAaM8kasYmGOFI78o
 /G/5Vwz3SWWZZLKzVOnYMPXKJ3EvcGxZWWuMm4KrBBjoqi2Oc72RnkJpBu4TwHOh6+pY
 WCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wn6yzS2leb46KZ2+Q1rY4wX7fVMACxcEWzX3eyMsDag=;
 b=tMiORVB8t/szgeA0XyEGOIhUkvRUC3hneTYBDmi4FSJKC9DjHvEj9B3y5JpNCgcyef
 iqYxLIbezPr5HCP1IU4n4ycjNkWiChBl+glmNmKFRiJzQ4p3l0tZ9eupRpR6CwlX1SzE
 oH34VnS9beipuNjnyFgPDpfOH+PdYHsAaPDgrh3Upzf3d6ZQ9ZADBHXJWJCqRN47wS4x
 Vx9/acuyAUZMpkY/4HycVvjTf63sVghlfMLelH2Oh+WE6mEjIpYFBGF2XlxPmRUXobfG
 /Jw1wI2ofhdRSgm/M6s3j6ZdvvifchJkoEDbZJF6OLlKsDX79jn1SsjOmxN2hzQ3qRtj
 OsCQ==
X-Gm-Message-State: AOAM530kwHRRtIMyV08THv8TsG2iLympcNNyxaqV3ARkDPlG6fcBjv8N
 IVyWo/OKPyf4vNOVnicsLcsk/tQyzE3U3ksAL25O3g==
X-Google-Smtp-Source: ABdhPJxMuQkUwSWs0r31cCuro+IvZ/1oeEQPgl1NqN+ea/1T8vJ2DwF4aTeCqkLiyvpw7tRGStAlHSII6g0R1OQRgk0=
X-Received: by 2002:adf:e443:: with SMTP id t3mr622156wrm.366.1609867928386;
 Tue, 05 Jan 2021 09:32:08 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
In-Reply-To: <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 5 Jan 2021 09:31:57 -0800
Message-ID: <CAH2-KxAWDnWwE-D-p8FYHzoZFxa=UGSVQgc0VqfJ7G01coLg3A@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
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
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 4, 2021 at 12:55 PM Vijay Khemka <vijaykhemkalinux@gmail.com> wrote:
>
>
>
> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>>
>> Hi,
>>
>> Just putting on the list what was decided after some lengthy discussions
>> on discord.
>>
>> I need a median of some sensor values, where this median sensor has
>> threshold interfaces
>> whose values must be defined in entity-manager.  Since exprtk
>> expressions are not allowed in
>> entity-manager, I cannot just port the PVS's JSON config into an
>> entity-manager config.
>>
> I missed this discussion but why can't we simply use virtual sensor as
> expertk provides median function and we have threshold support for
> each virtual sensor. Please help, if I am missing anything.

We had a lengthy discussion on discord the other day (hooray for
having chat history), and previously on your design review for this
feature.  Those two places are probably the best way to get caught up.

>
>>
>> Instead, I will make a new entity-manager config that will have the
>> component sensors
>> along  with the thresholds to use, with a subtype of median, vaguely
>> something like:
>>
>> {
>>
>> Type: "VirtualSensor"
>>
>> Name: "MySensorName"
>>
>> Subtype: "Median"
>>
>> Sensors: [ "Sensor1", "Sensor2", .... ]
>>
>> ThresholdsWithHysteresis [ ]
>>
>> minInput: 0
>>
>> maxInput: 100
>>
>> }
>>
>>
>> The minInput/maxInput are needed so we don't use garbage sensor readings
>> in the median
>> algorithm.  PVS will look for this config to be provided on D-Bus by
>> entity-manager, and if
>> it's there it will calculate the median (in C++, not exprtk) and use it
>> as the virtual sensor value.
>>
>> Thanks,
>> Matt
>>
