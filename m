Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0950435A1FA
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH27R6MbZz2yZ3
	for <lists+openbmc@lfdr.de>; Sat, 10 Apr 2021 01:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=wQQfjeM8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=wQQfjeM8; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH27D2Kptz2xfv
 for <openbmc@lists.ozlabs.org>; Sat, 10 Apr 2021 01:27:17 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id x189so7018067ybg.5
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u9iv71vpUhXoaneorlEhNhzmUAUvyt57NgjQFCI8rGA=;
 b=wQQfjeM8sawAH0NIKuRnYFH8nGyGppn7M37pGJO/h2UXfwv8yg4T6VmXdFDGe7Fopl
 ClB2JRwQvkunlySE52PrjkaxJD50klTv1K/KRfq2ZCm29dy/LeFI+dwGVDtcPhQThbgA
 h62d4oCMD32890dCiGJA3wFvMXSSUpDExUawhppQ5wJt62FPgzfo2A3cxLXu9QIVZ3aw
 cT8dJ88oAGPNL4wjEeFbM9pe9jsrRk96lQfrWEsXg6D4Yi7eHIEGMz4upfjRHWFnRzGd
 9uheLspYQgXiHJeBnxLSXPrifity7NTJ3kAwWuws7WkXMGVG04vZ5nTpQKjRlR+S6dez
 Hw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9iv71vpUhXoaneorlEhNhzmUAUvyt57NgjQFCI8rGA=;
 b=iHoxUdf3/clhtujT4xSlmq0rUi0aTv+2QJgGYjli7PcHqxPfYxTgCmdrBpC8dd503G
 uQTTYjYtEAKElX2L1N155obgP5rmtUpCBYBTinecH8TQWpJlf9H4Zhro3yEIUOMrHTAN
 RuUFKw0RrP09Gyao2uE1OGKw5eEZ3a21ejK6Caw8SgCjYuSUlkhyu2TNKKmNOU0p5Hqk
 XnK4Hm0BX5hYH3qjkVPLdb7WHL9e0cBGnNezWnd6t1fxruh4g1iG4Jce03kYcvz2DRzq
 YtRzH+IXN0ao3vW5TIqckikbrl5fEy9IuSN2COO7wa1gA/d066m8NugOa/sDikt00JQR
 pqwA==
X-Gm-Message-State: AOAM532g8U/J1Qxr14vn1QwvW40LGrUad8uPWgrrfuin76rre3+fwROE
 87o2HoU1P7ljRMEIFj2HxmmE86EoJ6u8k7VrTS3+yw==
X-Google-Smtp-Source: ABdhPJyiPUG0uI1HUQT6i9cOmPMk+pZN4F4VyqCsJyUClGd7Rto7E9m3jzK5hhcLtS9LX8Xzd9y4AfV5sIcV90d0W1I=
X-Received: by 2002:a05:6902:1003:: with SMTP id
 w3mr16329138ybt.148.1617982034165; 
 Fri, 09 Apr 2021 08:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
In-Reply-To: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 9 Apr 2021 08:27:03 -0700
Message-ID: <CACWQX83XMxm5UW1pwyqpdaqVtfvWRWMyuTbmjuZvm+7y1PXYqg@mail.gmail.com>
Subject: Re: Mapping standard D-Bus sensors to ProcessorMetrics (and other
 specific schemas)
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 7, 2021 at 5:26 AM Ambrozewicz, Adrian
<adrian.ambrozewicz@linux.intel.com> wrote:
>
> Hi,
>
> Currently bmcweb exposes sensors as part of Chassis subnodes in Sensors,
> Power and Thermal schemas. All of them lists sensors as arrays of
> generic properties distinguished by Id/Name etc. On the other hand - for
> well-defined metrics Redfish specifies concrete schemas like
> ProcessorMetrics and MemoryMetrics. They define designated Redfish
> properties with given name and value type.
>
> I'm starting to explore ways to implement these schemas in bmcweb, while
> retaining interoperability with TelemetryService. This requirement
> implicates, that source of these properties should implement
> xyz.openbmc_project.Sensor.Value interface and comply with OpenBMC D-Bus
> sensors architecture, which enforces predefined paths and units for
> various types of sensors.
>
> Question of extending xyz.openbmc_project.Sensor.Value interface (so it
> allows for more types or nested paths, if necessary) is something  I
> know should be considered, but seems like more or less straightforward
> to address.

I'm not following this statement.  From my perspective, this is
something we've already solved at a dbus level.  To attach a "sensor"
to a given inventory item, set up the association back to said
inventory item.  Today, we only connect things to Redfish "Chassis",
because that's currently the only node with sensors, but that's
certainly easy to change and there's nothing about the API that
prevents doing that.

Beyond that, because MemoryMetrics and ProcessorMetrics schemas call
out specific sensor names, I suspect we need to come up with a well
defined set of names;  If you want to populate MemoryMetrics, you
would expose sensors, with associations back to the dimm in question,
and have a sensor called, say,
/xyz/openbmc_project/remaining_block_percentage, and map that to the
RemainingSpareBlockPercentage property.

>
> There is bigger issue I see now - mapping D-Bus sensors to concrete
> Redfish properties. Mapping sensors at inventory level is sorted out
> with use of xyz.openbmc_project.Association.Definitions interface.
> However - I don't see (or know of) any method to link given D-Bus sensor
> with it's designated place in Redfish schema.

This is by design.  Dbus should largely have no reliance on any
specific protocol, and we shouldn't be building interfaces that
require daemons pushing data on the bus to have any knowledge of
Redfish, IPMI, PLDM, or protocol of next year.  This generally means
that some dbus->redfish transforms are not as efficient or clean as
they could be, but it keeps that logic quarantined into bmcweb.  I
suspect bmcweb will need logic to translate redfish URI + property
name to dbus path, and this logic will be non-trivial.

> I've done some PoC implementation of ProcessorMetrics, which relies on
> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
> queries D-Bus for all sensors associated with given CPU and populates
> properties if proper mapping was found.

Do you have a pointer to it?  It'd be good to see the code you're thinking of.

With that said, I would be against this approach.  This would require
clients to hardcode in, say, BlocksWritten, as a mapping, which means
that as we have more than just redfish, now each client needs to
hardcode the Redfish representation, the PLDM representation, and the
IPMI representation of the same data.  That seems messy.

>
> Is my PoC approach described above feasible for OpenBMC? What are your
> thoughts? I would like to start a discussion and hear your proposals
> about possible alternatives.
>
> Regards,
> Adrian
