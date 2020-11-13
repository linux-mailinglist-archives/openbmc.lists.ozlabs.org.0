Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 572262B27A1
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 23:02:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXssS3BCQzDr9T
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 09:02:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EBnCUQVr; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXsrN6kG8zDqn1
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 09:01:56 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id o71so9751043ybc.2
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 14:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lsw5r/DgN5r66bqvIu1ta49LZTsXK5/1cr5buoAtG0Y=;
 b=EBnCUQVrsvvQZ9TvhXuLzXit47i/AnygvkHjQJ4ExxhPfxaXr8DyKEH7ZoIvBlLewy
 dBPdYe9Zev9n3NzjQLMg/wUtLRC1TSNhQiKhckK4jxiiq3ty5QnkJFBjH75cYQLPoh7a
 b3KxZtVIyQfun6pkEkVFeHiE6EeDMsvktWRIKp3/oSWUUkHA8tD/vEcKhZpN+plX2cbf
 LnawFlzr5ovUPXTyLEftUM2ua2MoY1Z7w2DnaKo4J40Mq/qQH+N9HVG7DWJHwZJ/76OE
 FYi0UqeYb2LBxGMp6wxNdR4ESnfmPNd6f4pNlJr8Jdqy9sbgKbzC4oUMXIzyxWu0IDfx
 WV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lsw5r/DgN5r66bqvIu1ta49LZTsXK5/1cr5buoAtG0Y=;
 b=JMXWDfjZk9na7Mc8GIUh0EQsilqMh/PYB9RRY8zB03dvOua9YEN76IuKlJsE8CZ6Nt
 awSf66ZJXo2eNLFcl4uEoqmm7J68MA/2T14XqXrKCFwWvRxTOIPI7MO3H2l/ufMuUE0r
 xvnMK5mNFYjeQzoHjNnrYpGiCbIkZS6bHEC53MJcX6/XIp3mTfhMPXfmACrQAyLVAZoN
 ueQ4pxoLB8Sckr9ihz0+t1zkDKDFWn3wZSY0zfRb703NDq6vjddRXiJf86bI1eML4KRc
 LZeCkjP+kJqsTvV+XAh2DlzlpRvxPWx3VWGc16vh+g1eGldaTIuVovTzuQ8nt8OER84d
 QBsA==
X-Gm-Message-State: AOAM530NVav5s4/tYVOjk3Dd7cMeAullwhE78c6z/XP65xAO/z6R+FKp
 +o6B6kEAEn4IhYmTpCvV6gc9Ce6Uik67WllmH4OrOQ==
X-Google-Smtp-Source: ABdhPJz8A8MlB459vidUXi5ExrNzQpz+vqpQDG+cNYcMOGlZjTLd7baCO/ShpHBJI60YknsZVZBx5UAySbbO2dS5YPA=
X-Received: by 2002:a25:701:: with SMTP id 1mr5313660ybh.480.1605304912234;
 Fri, 13 Nov 2020 14:01:52 -0800 (PST)
MIME-Version: 1.0
References: <MWHPR21MB15617F0E229621D95588880CABE60@MWHPR21MB1561.namprd21.prod.outlook.com>
In-Reply-To: <MWHPR21MB15617F0E229621D95588880CABE60@MWHPR21MB1561.namprd21.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 13 Nov 2020 14:01:41 -0800
Message-ID: <CACWQX80+fu+Bb+jnpV5Y_ajXaR9Qy2HzD+vCS71TnB0zj1C_uA@mail.gmail.com>
Subject: Re: Redfish Message Registry
To: Rahul Kapoor <rahulkapoor@microsoft.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 1:24 PM Rahul Kapoor <rahulkapoor@microsoft.com> wr=
ote:
>
> Hi,
>
>
>
> Looking at bmcweb=E2=80=99s message registry implementation  (openbmc_mes=
sage_registry.hpp) I understand that each registry entry is purpose defined=
 for a specific system event.

This registry is for where we need openbmc specific events, that
aren't modeled well in Redfish.

>
> I am looking for a generic registry entry (other than SELEntryAdded)  tha=
t can be used for any discrete sensor and let the message arguments specify=
 what discrete sensor it is associated with and other details. Following is=
 what I am thinking

Redfish has no concept of a "Discrete" sensor.  In general, what
would've been a discrete sensor in IPMI is modeled by a specific
Redfish property on a specific resource, so I suspect the thing you're
looking for here is the ResourceChanged event within the Resource
registry.  DSP8011_2020.3, ResourceEvent.1.0.3.json is the newest
version of this registry, which we have implemented in bmcweb here:
https://github.com/openbmc/bmcweb/blob/74eec26b6ba3b14716db87cb8a837c33bdb6=
9f62/redfish-core/include/registries/resource_event_message_registry.hpp#L8=
3

>
>
>
> MessageEntry{"DiscreteSensorAlert_1",
>
>                  {
>
>                      "Indicates that a discrete sensor "
>
>                      "has critical alert condition met."
>
>                      "Additional information in Event"
>
>                      "data 1",
>
>                      "%1 discrete sensor raised alarm.\n"
>
>                      "Error=3D%2 \nEvent Data1=3D%3",
>
>                      "Critical",
>
>                      3,
>
>                      {"string", "string", "number"},
>
>                      "Check the sensor or subsystem for errors.",
>
>                  }},
>
>     MessageEntry{"DiscreteSensorAlert_2",
>
>                  {
>
>                      "Indicates that a discrete sensor "
>
>                      "has critical alert condition met"
>
>                      "Additional information in Event"
>
>                      "data 1 and 2",
>
>                      "%1 discrete sensor raised alarm.\n"
>
>                      "Error=3D%2 \nEvent Data1=3D%3 "
>
>                     "Event Data2=3D%4",
>
>                      "Critical",
>
>                      4,
>
>                      {"string", "string",
>
>                       "number","number"},
>
>                      "Check the sensor or subsystem for errors.",
>
>                  }},
>
>
>
> Message id is of the form <ID>_<Event data fields>
>
>
>
> Let me know what you think

I think this use case is already covered by the base redfish
specification;  We should use and implement that.  What is defined
above is trying to impose IPMI (A totally different specification) on
top of Redfish.  I would be against that, and in general, openbmc
tries to abstract the various transports from each other, under the
assumption that some systems use IPMI only, some systems use Redfish
only, and some use both, and we need to support all use cases.

>
>
>
> -Rahul Kapoor
>
>
