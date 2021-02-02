Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B931D30B4CE
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:45:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV7100sLxzDqZV
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:45:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ICHSeq0t; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV70F2RcTzDqZV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:44:25 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j84so5678131ybg.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2021 17:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26NSXCHDTnSPPDwy4wAdFxdyd0aYvKWJDtVVbCSMvTY=;
 b=ICHSeq0t8YSoDzHWkBnDeLzuHBfaLylAeFl9r6yKe8tLo74na3CicKmFhROpNiBThZ
 rtnKZvyoMNw+98LA6fA42XOQvE4gj6DNNDUeqtAg/C1DU+oDkzuFrAFwMWDBM+gY1FXa
 9QAiVcAF1CUOOJRfjHkhxzRwUtlF7mbdPoURGoS+Wo4TlfGz6i9+/tQcN5qLjCk1ORI8
 eVMs19dH3JxSqosIwjChHApI6icASxd3/59y8KQo4KjOBrRkmaeqDpHX2sjuJMOzsq49
 i3fbWOfZxl88NKjjItZTSa8EsmNoGHE03CZROa5tZ9u/c+NRpCC/SfDLx1Q6FTnZJFKB
 jE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26NSXCHDTnSPPDwy4wAdFxdyd0aYvKWJDtVVbCSMvTY=;
 b=tpOnfsnOveySbOImEXAgaAH0xA84KG/J6kweM3RE+SID0rwLzF/A/FfG99GGjL0Z1U
 A6xnO2SvqQb/HKl1McWGJ/l6WomTZ55wFcve8DRr+rkupwqhlEocKxD6pJGLCaqD2OlO
 GoveMBhREzJPiEJG3vcSpkTtED+Si4mddg2ZP57ApJ/hzwqPHQ9j1NQ5m1lWoIJgk67A
 Wo6s/O8BqCW8I40GuALZGWCR3W1FVnTee1RCeQUw9r6XkZ+olEmC5IkokiwP4PfKnlpH
 CdQjrS8kDK0vWDmesn1P4ZfMTPHi52pmjLCSaNXwF0hCGvJc3x02x/EEfa673jmvqNO8
 QNFA==
X-Gm-Message-State: AOAM530IpE+yIPo1vDS6wHIHP6l8Zacs5gvkteExdpmV2iNeskE+P+13
 4wDgHDTiqWTcFUF3KCgoYaicnmfpbHQFeUyfFT08tQ==
X-Google-Smtp-Source: ABdhPJytYqhEBMXgssNFV5gmQM2Gq9Rri6uR032NHBuxAZyS+scIkO6OfhwNuyvpnsgO5F9UlHx7m9BQ0Ogxx94gP9I=
X-Received: by 2002:a25:d0c4:: with SMTP id
 h187mr12504431ybg.209.1612230261981; 
 Mon, 01 Feb 2021 17:44:21 -0800 (PST)
MIME-Version: 1.0
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com> <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
 <YBVtvlsJJJ4faFpt@heinlein>
 <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
 <CACWQX82G3wbD-Q+RVoT1xx7eru+Y7zk5AdAQT9iQoiR=-xdfRA@mail.gmail.com>
 <20210202010829.vthivsovil7mxdhj@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210202010829.vthivsovil7mxdhj@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 1 Feb 2021 17:44:11 -0800
Message-ID: <CACWQX82k6N2fnpRf9UdN715-KLQZw8B_PaOt29W1fpZnhkH6_g@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: kunyi731@gmail.com, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 gmills@linux.ibm.com, vishwa@linux.ibm.com,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 1, 2021 at 5:08 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Feb 01, 2021 at 04:49:31PM -0800, Ed Tanous wrote:
> >Considering that bmcweb already has an LogService implementation to
> >access post codes, yeah, log service seems reasonable to represent
> >post codes
>
> Nice!  I didn't realize this.  I hope the backend is simply the Boot.Raw
> interface and doesn't require any other applications...

This is what I was hoping to look at before I posted it, so it remains
to be seen how it works.

>
> >I  don't see how you're going to fit the vector<uint64_t>
> >thing into a log entry
>
> My straw-man thinking was as an additionalDataUri attachment.

Overall, I'm not a huge fan of additionalDataUri in Redfish.  In terms
of redfish, it essentially moves from "this is structured data that
fits X schema" to, "This can be anything you want, and the client
needs to divine the schema out of thin air".  In terms of OpenBMC,
using it a lot worries me, as it seems like it's just there to bypass
the message registry requirement in the schema, and provide an
unstructured interface from an interface that's supposed to be
structured.
With that said, if this is in addition to the structured data, maybe it's ok?

>
> >the way that Redfish defines them, you're effectively limited to a
> >uint64_t for a numeric argument anyway,
>
> I'm not following this.  Redfish log entries are limited to a uint64?
> Which property in the LogEntry object are you referring to?

In a log entry, you'd normally have a message something like

Id: MyCustomPostCodeMessageInTheRegistry
Message: "PostCode 4 happened"
Args: [
   4
]

If automation were reading post codes, it would only be looking at the
ID and Args fields, not the human readable message.  The problem comes
in that the arg itself is an int type, which in nlohmann::json c++ is
a uint64_t.  Technically in the json spec, that int could be a
uint512, and you could declare a custom serializer to do it but you'd
probably run into compatibility problems with other serializers that
can't handle beyond a uint64.

As I'm typing this, there's probably cheats around this, like a hex
encoded string, which I think has a built-in redfish type, but would
be parsed by json just fine.  I'd have to look at the redfish spec to
know for sure.

>
> >arbitrary precision, so I'd be interested to see what the proposed log
> >entries look like.
>
> What is the best way to go about making a proposal?  Are additional
> details needed other than I want to stuff all the data in an
> additionalDataUri attachment?

The ideal in my mind would be to mock up a strawman LogEntry example,
and see what it looks like.  Considering redfish did add the
additionaDataUri field, I suspect I'm in the minority on not liking
it, so I'm not going to pee into the wind here, but would like to see
what the more structured options look like, and why they're not a
great fit.

>
> >I was hoping to look into exactly how the existing
> >one worked so I could give a better technical answer, but a pointer to
> >the code is as good as I can do for the moment.
> >https://github.com/openbmc/bmcweb/blob/88b3dd12851cd7bdd4b5c065ba99f40feafb775e/redfish-core/lib/log_services.hpp#L2984
> >
> >if you're hoping to get human readable post codes, and not just raw
> >values, there's probably a discussion that needs to be had about how
> >the message registry would work between systems, considering that
> >every system implements different post codes, we'd have to switch
> >registries dependent on the processor present, and there are likely
> >multiple processors in the system, possibly with different post code
> >definitions, so the needed configurability explodes a little bit.  If
> >you could avoid that, I would.
>
> Agreed - I am not looking for human readable post codes.

One thing I would like to make sure is that if people _want_ to design
human readable post codes in the future, we haven't backed ourselves
into a corner design-wise.  With that said, I think just having a
unique message id gets us what we need there, but it'd be good to just
keep it in the back of your mind.
