Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41F2D74B8
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 12:33:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CspZX2kWxzDqZL
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 22:33:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=dhruvaraj@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HVXaYcoR; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CspRZ01zSzDqPc
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 22:27:36 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id w4so6879187pgg.13
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+YjZ2FikWpA+E42T0AQMSpKqg+p8z+6TybRT9EugS+g=;
 b=HVXaYcoR8r44DwyOLQ2ljrkwG6n/cIA1lCUXcQUtMCHPephcdU5lPf9SU9oSEdyQk9
 ilqROHh+PevXolSwSwSpwYZ3Uh2yid1nknrrggC3XjoXWEFV5bRfIZZU9UbMedUYnBT2
 nL0Hn3qds0LTOle7Aw3yATvlONgLpHfu1PgoZOKVQgv+8gNfI25+eslsBvW+wMVB2AfD
 bF8v0zllVUTTGdG3AtqIQiKe4g47B4TT4Pc0IhhbyD5YDjs8wMo/npxNLq2Mtt1gRsWt
 e1AZAduY8NiDgxwIZBii9bUOUGIsUDU2mJhP8C6r08a8SrzkJy13jeNCuYHl8A3xpX1F
 VdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+YjZ2FikWpA+E42T0AQMSpKqg+p8z+6TybRT9EugS+g=;
 b=n7+zq/d+gfs+sWQ2e/HHOmIoJuJF5Sm9vfKXqcM8xPbwJ3NqMvvF35nwArvE35qDXQ
 /RbFa9nFYPbjxGH74whXyHEvAS4Kh5v+dVAdu2xgfN+A3Ja7SvJFgTvbWXwVNtua6sO7
 0CSZpNcU7xHnPfNAF1OteRYPue+nsj8dMZ/6cYVjzGbIQVBgQemwMvcKSY1thxBAFqxV
 tGKZdwdhR/Ea2fCpR1t+X+GXc2MVR7/EqNGbw22qGamuo3vnwrp0Wt6xvvIcr7nn0ARU
 v5huaRsNhol+KdqyXxYxl37Pm3BKMBy5BKyfIiwpv3WsYN7R5TbHIp3PjdcFxdTZrkPG
 DtnA==
X-Gm-Message-State: AOAM533cTTMG2VELgjhxP6IgYRqVJeRaZWFgysEpPcsc+6oFWVsaWR91
 Nz8e1Cx4UDsVTEVRt7AUqm0qYeULD80AyrCVV/E=
X-Google-Smtp-Source: ABdhPJwEssTo8xstmsgsKtndsTdramyEqzC6mb4wt/J+6r+/kffyz4eGFkKJkXIatbze0ObOgkviG+NdoSUm9ONWMA0=
X-Received: by 2002:a63:2944:: with SMTP id p65mr9784457pgp.283.1607686053164; 
 Fri, 11 Dec 2020 03:27:33 -0800 (PST)
MIME-Version: 1.0
References: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
 <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
In-Reply-To: <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
From: dhruvaraj S <dhruvaraj@gmail.com>
Date: Fri, 11 Dec 2020 16:57:22 +0530
Message-ID: <CAK7WosjKjLKu_1vvZak7kOry9aujxNdEJ7cuuFdbqPVTnUW5Mw@mail.gmail.com>
Subject: Re: Proposal for operations on isolated hardware units using Redfish
 logging
To: Ed Tanous <ed@tanous.net>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 10, 2020 at 10:59 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Dec 10, 2020 at 7:49 AM dhruvaraj S <dhruvaraj@gmail.com> wrote:
> >
> > Hi,
> > Please find the option for operations on isolated hardware units using
> > Redfisg logging
> >
> >
> > Hardware Isolation
> > On systems with multiple processor units and other redundant vital reso=
urces,
> > the system downtime can be prevented by isolating the faulty hardware u=
nits.
> > Most of the actions required to isolate the parts will be dependent on
> > the architecture and
> > executed in the host. But the BMC needs to support a few steps like
> > provide a method to users to query the units in isolation, clearing
> > isolation, isolating a
> > suspected part, or isolating when the host is down due to a fault in a
> > critical unit.
> > Since a user interface is needed for the above actions proposing a meth=
od to use
> > Redfish log service to carry out these actions.
>
> Right off the bat, LogServices seems like a strange choice for this.
> In your requirements, you're taking actions on the unit itself, not
> logging the actions that occurred, so I'm struggling to see the design
> choice here.  Can you elaborate why LogService, something intended to
> be for historical logging, would be appropriate for a design that
> needs to accept user action?

Apart from user-requested isolation of a hardware unit, usually, hardware u=
nits
get isolated due to a past action in the system. for example, if a
processor core encountered
an error while performing the activities and cannot continue in
service, that will be listed
as isolated. A method is needed to show the list of such units to the users=
.
Since log service is for showing such logs, I think log service is
suitable for that.
And after the repair, once the unit is back in service, this log
service entry will be marked
as resolved.

>
> >
> > Requirements
> > When user requests, isolate a hardware unit.
> > Getting the list of all isolated resources.
> > Remove the isolation of a hardware unit.
> > Remove all existing isolation
> >
> > Isolating a hardware unit:
> > redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware
> > {
> >   "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware=
",
> >   "@odata.type": "#LogService.v1_2_0.LogService",
> >   "Actions": {
> >     "#LogService.CollectDiagnosticData": {
> >       "target":
> > "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Actions/LogSer=
vice.CollectDiagnosticData"
>
> What is this action intended to do?
>
> >     }
> >   },
> >   "Description": "Isolated Hardware",
> >   "Entries": {
> >     "@odata.id":
> > "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries"
> >   },
> >   "Id": "IsolatedHardware",
> >   "Name": "Isolated Hardware LogService",
> >   "OverWritePolicy": "WrapsWhenFull"
> >
> > Listing isolated hardware units.
> > redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware >=
> Entries
> > {
> >   "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware=
/Entries",
> >   "@odata.type": "#LogEntryCollection.LogEntryCollection",
> >   "Description": "Collection of Isolated Hardware Components",
> >   "Members": [
> >     {
> >       "@odata.id":
> > "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries/1",
> >       "@odata.type": "#LogEntry.v1_7_0.LogEntry",
> >       "Created": "2020-10-15T10:30:08+00:00",
> >       "EntryType": "Event",
> >       "Id": "1",
> >       "Resolved": "false",
>
> LogEntry doesn't have a "Resolved" field that I can see.
>
> >       "Name": "Processor 1",
> >       "links":  {
> >                  "OriginOfCondition": {
> >                         "@odata.id":
> > "/redfish/v1/Systems/system/Processors/cpu1"
> >                     },
> >       "Severity": "Critical",
> >        "SensorType" : "Processor",
>
> SensorType doesn't really make sense in this case, as you're not
> reporting errors from a sensor, but from a resource.
>
> >
> >  "AdditionalDataURI":
> > =E2=80=9C/redfish/v1/Systems/system/LogServices/EventLog/attachement/11=
1"
> >  =E2=80=9CAddionalDataSizeBytes": "1024"
> >
> >   }
> >   ],
> >   "Members@odata.count": 1,
> >   "Name": "Isolated Hardware Entries"
> >
> > Users will be able to delete any entry or all the entries, but if an
> > isolated unit is serviced then that unit will be back in service, in
> > such cases the "Resolved" property in the entries will be marked as
> > "true"
> > "AdditionalDataURI" : This is a link to the error log associated with
> > this isolation action.
> > --------------
> > Dhruvaraj S
>
>
> I suspect overall you need to separate this into two different
> resources.  One for logging things that have happened in the past,
> under log service, and one for interacting directly with the system in
> its current state.  The second one would likely take the form of being
> able to set the Status property to something like "Disabled",
> "UnavailableOffline", or something similar on your Processor
> resources.

The log service is already being used to generate the dump, which is a
user-initiated
 action in log service, I am thinking the user-initiated isolation
also can be in the same place.
But as you suggested setting the disabled/UnavailableOffline on the
list of units also a good option,
need to look more into that.

--=20
--------------
Dhruvaraj S
