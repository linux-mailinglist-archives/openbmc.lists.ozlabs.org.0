Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9B37ABAC
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 18:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffjk44V2Tz302g
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 02:17:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=Yj1YU1mb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Yj1YU1mb; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffjjm4HqMz2xvc
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 02:16:57 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id r5so12281792lfr.5
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BHlYNWnFlcOCfrRPSolUu8mGUMlSSKc7EFiPwzxaD0Y=;
 b=Yj1YU1mbZ8B5nr1Ug3ZRdTArmPH3N10bmHX21GTy740AwnNx+VAo2SdiUletW/d5ps
 fWAu2DwcrnNDgmrzoVl4ft+eXE8sj8iA7DjhKR35W/MH9kw0rzkx5Af9jykuAS3lzcW+
 q9DFEkfIAcOL4yM+CAhYrUIpyRDMYqFOaaqTwpQ4LES+/hYzEqYpTaZW6ffN7c6d8DoM
 1bsg9qGv1v1eVyk3Kz3uX1pJ3SMx3jXt8Q41wYyrBxWb80xGe7V9TGzWc6yNA8KU0+x7
 NxCB7Eb2KaVuxkbBBXQ5V0E3ABKOEKV6sCtmPqviDMc8dpgIaaiaKbpGXwkZyKPefPFZ
 3vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BHlYNWnFlcOCfrRPSolUu8mGUMlSSKc7EFiPwzxaD0Y=;
 b=LPFn7xJv8wmEEnePftNltCnH3ou8njfjJZ0R0etV6y7kzPf2U8KxlW4BjiVHaA2img
 ldD/xrSSzs6/k3lj9/yz+0qV07ZswbhAecp8FaPyg0YEVVHb3G7r0BymijzR4+uyK4K1
 5LwFqaGnHZtQDPwIjo+bDWNXHwtPHA/PW1TKS8mdQuurhM+UBfTMJLu+uIl6ys0uf0vC
 Q4oUL0zbc4HI5EnDh/ZAPw3PhzVtaD9wF9GpuCexK6myDjU7c9GzGkIYwCIJqep+jpih
 jCjPykLntmfVm+0neTWWQxMVxwadLBsxHpX81e0ofBWibh7puVIpqkYhvpSM6G1+toKN
 zWbA==
X-Gm-Message-State: AOAM533vvYwUUr3PIBdgkd9olLWXpfkaa/4/JvLnXjfqckpajyo3mZbW
 TIol8GGfavAaaY4Qt53oJXQlM1PnyuW0sQOMuD24HjQhMjwuag==
X-Google-Smtp-Source: ABdhPJzOtC7kFzxfktLIJqvwRmkqzcLO4bc9ZNSpYpYG1Sym//AJ3JX833Fqf8qKhRDBpItKCOvPpssPenrpU5HXxns=
X-Received: by 2002:ac2:5393:: with SMTP id g19mr21710347lfh.459.1620749811314; 
 Tue, 11 May 2021 09:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <f9127788-7f8a-59ed-e434-0f510773d2aa@linux.intel.com>
 <CACWQX83XMxm5UW1pwyqpdaqVtfvWRWMyuTbmjuZvm+7y1PXYqg@mail.gmail.com>
 <431289e9-85bc-26c6-4b14-f273415ac3c8@linux.intel.com>
In-Reply-To: <431289e9-85bc-26c6-4b14-f273415ac3c8@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 11 May 2021 09:16:40 -0700
Message-ID: <CACWQX82HPVbacRBDdybx8n3VctfPXLNYmDTzxnafKNOUknDLAA@mail.gmail.com>
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

On Tue, Apr 27, 2021 at 4:38 AM Ambrozewicz, Adrian
<adrian.ambrozewicz@linux.intel.com> wrote:
>
> W dniu 4/9/2021 o 17:27, Ed Tanous pisze:
> > On Wed, Apr 7, 2021 at 5:26 AM Ambrozewicz, Adrian
> > <adrian.ambrozewicz@linux.intel.com> wrote:
> >>
> >> Hi,
> >>
> >> Currently bmcweb exposes sensors as part of Chassis subnodes in Sensors,
> >> Power and Thermal schemas. All of them lists sensors as arrays of
> >> generic properties distinguished by Id/Name etc. On the other hand - for
> >> well-defined metrics Redfish specifies concrete schemas like
> >> ProcessorMetrics and MemoryMetrics. They define designated Redfish
> >> properties with given name and value type.
> >>
> >> I'm starting to explore ways to implement these schemas in bmcweb, while
> >> retaining interoperability with TelemetryService. This requirement
> >> implicates, that source of these properties should implement
> >> xyz.openbmc_project.Sensor.Value interface and comply with OpenBMC D-Bus
> >> sensors architecture, which enforces predefined paths and units for
> >> various types of sensors.
> >>
> >> Question of extending xyz.openbmc_project.Sensor.Value interface (so it
> >> allows for more types or nested paths, if necessary) is something  I
> >> know should be considered, but seems like more or less straightforward
> >> to address.
> >
> > I'm not following this statement.  From my perspective, this is
> > something we've already solved at a dbus level.  To attach a "sensor"
> > to a given inventory item, set up the association back to said
> > inventory item.  Today, we only connect things to Redfish "Chassis",
> > because that's currently the only node with sensors, but that's
> > certainly easy to change and there's nothing about the API that
> > prevents doing that.
> >
> That is correct. Technically we have all the pieces to integrate sensor
> with Redfish in general (Associations, standard sensor types and APIs).
> Challenge lies below.
>
> > Beyond that, because MemoryMetrics and ProcessorMetrics schemas call
> > out specific sensor names, I suspect we need to come up with a well
> > defined set of names;  If you want to populate MemoryMetrics, you
> > would expose sensors, with associations back to the dimm in question,
> > and have a sensor called, say,
> > /xyz/openbmc_project/remaining_block_percentage, and map that to the
> > RemainingSpareBlockPercentage property.
> >
> Is the path you've provided just a shortcut for full D-bus sensor path,
> or do you have something else in mind? I will assume the former.
>
> D-Bus sensor path is composed of :
> /xyz/openbmc_project/{namespace/type}/{name}. Do you propose to encode
> sensor name in such a way, that bmcweb (and IPMI,PLDM, whatever) would
> be able to identify exact meaning of the value if they need to? Bear in
> mind that we have several issues to consider here:

I missed the units in my first email.  That should've read;

xyz/openbmc_project/utilization/remaining_block_percentage

> - multiple items (eg. Processors) exposing the same data, names would
> need to be unique in that regard

This is solved by having an association back to the processor in
question.  Names would need to be unique, but not unique
per-processor, although you bring up a good point.
As I think through this more, I suspect Sensor.Value isn't a good fit
for this kind of data.  I suspect we should come up with some specific
interfaces for exposing this kind of telemetry in a standard way.

> - certain properties are singular (CPU-wide) while other are buried down
> the hierarchy (mentioned UnhaltedCycles of Core#12).

Also solved by associations.  If it's associated with a core, it's the
property for that core, if it's associated with the processor object,
it's a property of that socket.

>
> This would lead to names like:
> /xyz/openbmc_project/sensors/counter/cpu1_core12_unhaltedcycles .
>
> Don't get me wrong - this seems like quite flexible approach, however it
> lacks standardization. If I understood response form Patrick correctly -
> there is urge to avoid storing information in D-Bus path. Do you think
> that would be acceptable to introduce this logic (name-encoding) in bmcweb?

No, having read Patricks email, I agree with him.  What I proposed was
only a strawman, and hadn't been fully thought through.

>
> >>
> >> There is bigger issue I see now - mapping D-Bus sensors to concrete
> >> Redfish properties. Mapping sensors at inventory level is sorted out
> >> with use of xyz.openbmc_project.Association.Definitions interface.
> >> However - I don't see (or know of) any method to link given D-Bus sensor
> >> with it's designated place in Redfish schema.
> >
> > This is by design.  Dbus should largely have no reliance on any
> > specific protocol, and we shouldn't be building interfaces that
> > require daemons pushing data on the bus to have any knowledge of
> > Redfish, IPMI, PLDM, or protocol of next year.  This generally means
> > that some dbus->redfish transforms are not as efficient or clean as
> > they could be, but it keeps that logic quarantined into bmcweb.  I
> > suspect bmcweb will need logic to translate redfish URI + property
> > name to dbus path, and this logic will be non-trivial.
> >
> Point taken - mapping data (in whatever form it will be available)
> should be generic and domain agnostic.
>
> >> I've done some PoC implementation of ProcessorMetrics, which relies on
> >> new D-Bus interface with 'Mapping' property (eg. 'TemperatureCelsius' or
> >> 'CoreMetrics/12/UnhaltedCycles'). ProcessorMetrics node implementation
> >> queries D-Bus for all sensors associated with given CPU and populates
> >> properties if proper mapping was found.
> >
> > Do you have a pointer to it?  It'd be good to see the code you're  > thinking of.
> >
> Code itself is boilerplate D-Bus sensor service with one extra property.
> New property contains data encoded in the string, which you already
> proposed to be part of the name. Should you have need to work on some
> shared code to work out PoC in the flesh - let me know.

Text descriptions of code are a lot less useful than code I can look
at and run.  With that said, if you don't want to publish it
somewhere, no worries.

>
> > With that said, I would be against this approach.  This would require
> > clients to hardcode in, say, BlocksWritten, as a mapping, which means
> > that as we have more than just redfish, now each client needs to
> > hardcode the Redfish representation, the PLDM representation, and the
> > IPMI representation of the same data.  That seems messy.
> >
> >>
> >> Is my PoC approach described above feasible for OpenBMC? What are your
> >> thoughts? I would like to start a discussion and hear your proposals
> >> about possible alternatives.
> >>
> >> Regards,
> >> Adrian
