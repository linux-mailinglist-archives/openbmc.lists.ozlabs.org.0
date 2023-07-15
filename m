Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D367D754799
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 11:02:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bet5w3vM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R32Qw5c3Rz3c9r
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 19:02:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bet5w3vM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=dhruvaraj@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R32QK6gnQz3bmv
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 19:01:28 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so8257408a12.0
        for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689411680; x=1692003680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wEpp32A/pu40NPVxlPA7CZPE4Q7Fwea/g1G61TCvBsE=;
        b=Bet5w3vM2tb5WmSMamIxh0yOhn1eS5Yl8iKR6FupeqVd2JHtRDjsS05WUtRClafTLt
         a9OW17B6w8fvixEj3PXJRPXWPUohleI1pf8LFvYF5lxLO8f3RbnVN6UxEcDSLjbozD/y
         bjRauBrkTUjFSc8KOwRTWtmOlXNW5vx/LLmJNqnGrZKI3xhIAR84oUU3Y6smAAFi98fc
         7RgGC4gnS9DOSIX55baG78/Z9uxauBOzaPUdOLsm3n+D0oNVrhdqIK72raGivo5koj1N
         MDVBhxzoYAfbtZEnbZTB1Z9lYZcI3gAiWfh+BWTcQhn5/8OS64xGAO0/ZloVcIYg4/LH
         lwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689411680; x=1692003680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEpp32A/pu40NPVxlPA7CZPE4Q7Fwea/g1G61TCvBsE=;
        b=fvhxINnWhlFGOXci5EhjUkxjgFncKFTix8dd0ClBF3keZ1M74bvcZaKUogbwYdmf8/
         ekQoNcAFa6hm/T5zMswvrUq3m26umxar1ksLup1zBNW/PXyctBDJwX9qHsicxJAgveEZ
         RMBird9LU5NzibsIwUyQAePXS85uFBBaQPzMd0ruTjPkjNDAHhep73MandgtEnUzSTs8
         LEriB25uHqeCrzeoCmcQ4BHR4mruvgrs98cvHlJFugckqxjWd3XFaZ1cR2DJFaXAcF4P
         6SwYbGr7IjlKK3AQjsFXZvB3jhB+jFyndj3/cLZq9iiTZosvb8AavDV31/uElT24YNxu
         wgrg==
X-Gm-Message-State: ABy/qLbtGN9oTnhj/IJP30mFuIKzeI1WkF2Wnkwq5dx32AUexgIARP7D
	oC1ZObJxE+uA5C75WPlrtfQdr8MahK1O5RsZQhVOUB5dHg4=
X-Google-Smtp-Source: APBJJlHdVsoieH9S2lALbhhJdg3a8Hk1houL/XS3nJ9tfi39j0dwTI1oSrI3h3898M8id55vRRTjxMpcWuiQAqCljJI=
X-Received: by 2002:a17:906:158:b0:994:1880:dc32 with SMTP id
 24-20020a170906015800b009941880dc32mr5585347ejh.17.1689411679703; Sat, 15 Jul
 2023 02:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com> <7d5f86f9-f39a-829f-fd64-62d244c04ef4@linux.intel.com>
In-Reply-To: <7d5f86f9-f39a-829f-fd64-62d244c04ef4@linux.intel.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Sat, 15 Jul 2023 14:31:07 +0530
Message-ID: <CAK7WosjqQU3uL3uof8gcnfQFn0N5AjMNaww-P3mAc-hLQWsB9w@mail.gmail.com>
Subject: Re: [RFC] BMC RAS Feature
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please find a few comments on using phosphor-debug-collector for this

Phosphor-debug-collector employs a set of scripts for BMC dump
collections, which can be customised per processor architecture.
Architecture-specific dump collections are appended to dump-extensions
and activated exclusively on systems that support them, identified by
their corresponding feature code.

Data Format: The data is packaged as a basic tarball or a custom
package according to host specifications.

Event Triggering: The phosphor-debug-collector responds to specific
events to initialize dump creation. A core monitor observes a
designated directory, generating a BMC dump containing the core file
upon event detection. On IBM systems, an attention handler awaits
notifications from processors or the host to trigger dump creation via
phosphor-debug-collector.

Layered Design: The phosphor-debug-collector operates as a
processor-specific collector within the proposed layered architecture,
initiated by a platform-specific monitoring service like the
host-error-monitor. The created dumps are exposed via D-Bus, which can
then be served by bmcweb via Redfish.

Phosphor-debug-collector allows for extensions to accommodate
processor-specific parameters. This is achieved by adjusting the dump
collection scripts in line with the particular processor requirements.

The phosphor-debug-collector interacts with specific applications
during the dump collection process. For example, on IBM systems, it
invokes an IBM-specific application via the dump collection script to
retrieve the dump from the host processor.

On Sat, 15 Jul 2023 at 03:37, Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
> Sorry for missing this earlier.  Here are some of my thoughts.
>
> On 3/20/2023 11:14 PM, Supreeth Venkatesh wrote:
> >
> > #### Requirements
> >
> > 1. Collecting RAS/Crashdump shall be processor specific. Hence the use
> >     of virtual APIs to allow override for processor specific way of
> >     collecting the data.
> > 2. Crash data format shall be stored in common platform error record
> >     (CPER) format as per UEFI specification
> >     [https://uefi.org/specs/UEFI/2.10/].
>
> Do we have to define a single output format? Could it be made to be
> flexible with the format of the collected crash data?
>
> > 3. Configuration parameters of the service shall be standard with scope
> >     for processor specific extensions.
> >
> > #### Proposed Design
> >
> > When one or more processors register a fatal error condition , then an
> > interrupt is generated to the host processor.
> >
> > The host processor in the failed state asserts the signal to indicate to
> > the BMC that a fatal hang has occurred. [APML_ALERT# in case of AMD
> > processor family]
> >
> > BMC RAS application listens on the event [APML_ALERT# in case of AMD
> > processor family ].
>
> The host-error-monitor application provides support for listening for
> events and taking action such as logging or triggering a crashdump that
> may meet this requirement.
>
>
> One thought may be to break this up into various layers to allow for
> flexibility and standardization. For example:
> 1. Redfish -> provided by bmcweb which pulls from
> 2. D-Bus -> provided by a new service which looks for data stored by
> 3. processor-specific collector -> provided by separate services as
> needed and triggered by
> 4. platform-specific monitoring service -> provided by
> host-error-monitor or other service as needed.
>
> Ideally, we could make 2 a generic service.
>
> >
> > Upon detection of FATAL error event , BMC will check the status register
> > of the host processor [implementation defined method] to see
> >
> > if the assertion is due to the fatal error.
> >
> > Upon fatal error , BMC will attempt to harvest crash data from all
> > processors. [via the APML interface (mailbox) in case of AMD processor
> > family].
> >
> > BMC will generate a single raw crashdump record and saves it in
> > non-volatile location /var/lib/bmc-ras.
> >
>


-- 
--------------
Dhruvaraj S
