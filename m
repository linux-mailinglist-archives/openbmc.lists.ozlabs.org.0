Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B02D63EA
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 18:47:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLvz2RvFzDqsX
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 04:47:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NNeXbce8; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLWf1C59zDr1Q
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 04:29:33 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x2so5421817ybt.11
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mtu3e1OUyoo9nQWW7CMnLCevXld6YVJ26DaceR0w+4c=;
 b=NNeXbce8D+XgBBnP4fQUkQq+UKX/rAoUp6jFL6G9YhJCJtliAu9W3QQMb0+tjwL+ek
 bWFTrN14Nbdb54vTpe0YUJFwl2OBs+AhMr3hNK3w9dU6RZnC76odbfJLv/lFv/R21H77
 s2ItWYAMf6EEXanRvJ1YBx+eHkF1QzAxkNG93z2z9AJSBvMR5xm1iGy+Rq3wgAXZFqJ1
 bS+jV4EzwmP9HSF2MM9tzIWMjHBNgGehDni4LTmmRYt3CEFa1vcwgwR4bBRn4G1gQSy6
 bEj9xbcnOIiiX6SrTz5MW5spZ8Ag8oNNW+3c39mxK8A5QGTiLzlExeUYFIwjzUuK9e5E
 B0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mtu3e1OUyoo9nQWW7CMnLCevXld6YVJ26DaceR0w+4c=;
 b=J2fOqPLf2+9kXTf9DN+71bXSEJqCLlo+4SH7tG1zlAdHHQIemw6bBUcCUi9qyCabdm
 O73+RSC98kXFgnBoQ9jsZ7Srq92DOaCXgfOTXACy2FeV0xpfRURi5xNa80rxFgPjFs3U
 FJjNurD2PLwARqdSlSnGT+uRYJsud72Fqg0MtuRseSPDAqIlfosfCmAP/V+nMKbPEkN6
 cr1+R6aOOlfJQfbcwFrDt7UhoWDYPWummG1/wSYcSLxtYheEg91VgH6/q6TmXrmnpkoP
 QUmxdZlkRWhl0wPso/xDbpDTHuFhvRMx+3ZTHbs7j3iue7YKQ9HmPDF/n8b0hVmY+ofQ
 In7g==
X-Gm-Message-State: AOAM532IIJ8W1fdTxuRSm6wVOxSW9ztm1/+lFajhp0HIS7FnXFmCRRI1
 JWGgVGQIaRFe5umecvl0javT1RAlCYHNKkDcdhxeiA==
X-Google-Smtp-Source: ABdhPJwXeuJhACXGHWlkhk2/RY3eM1ZgpuRWGIxLeNi4B3HF7ECAwdOj818tqV+Ts3U6ZaiG1nNs3J6U+5yPjuKxqDw=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr12060787ybn.340.1607621368663; 
 Thu, 10 Dec 2020 09:29:28 -0800 (PST)
MIME-Version: 1.0
References: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
In-Reply-To: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 10 Dec 2020 09:29:17 -0800
Message-ID: <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
Subject: Re: Proposal for operations on isolated hardware units using Redfish
 logging
To: dhruvaraj S <dhruvaraj@gmail.com>
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

On Thu, Dec 10, 2020 at 7:49 AM dhruvaraj S <dhruvaraj@gmail.com> wrote:
>
> Hi,
> Please find the option for operations on isolated hardware units using
> Redfisg logging
>
>
> Hardware Isolation
> On systems with multiple processor units and other redundant vital resour=
ces,
> the system downtime can be prevented by isolating the faulty hardware uni=
ts.
> Most of the actions required to isolate the parts will be dependent on
> the architecture and
> executed in the host. But the BMC needs to support a few steps like
> provide a method to users to query the units in isolation, clearing
> isolation, isolating a
> suspected part, or isolating when the host is down due to a fault in a
> critical unit.
> Since a user interface is needed for the above actions proposing a method=
 to use
> Redfish log service to carry out these actions.

Right off the bat, LogServices seems like a strange choice for this.
In your requirements, you're taking actions on the unit itself, not
logging the actions that occurred, so I'm struggling to see the design
choice here.  Can you elaborate why LogService, something intended to
be for historical logging, would be appropriate for a design that
needs to accept user action?

>
> Requirements
> When user requests, isolate a hardware unit.
> Getting the list of all isolated resources.
> Remove the isolation of a hardware unit.
> Remove all existing isolation
>
> Isolating a hardware unit:
> redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware
> {
>   "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware",
>   "@odata.type": "#LogService.v1_2_0.LogService",
>   "Actions": {
>     "#LogService.CollectDiagnosticData": {
>       "target":
> "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Actions/LogServi=
ce.CollectDiagnosticData"

What is this action intended to do?

>     }
>   },
>   "Description": "Isolated Hardware",
>   "Entries": {
>     "@odata.id":
> "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries"
>   },
>   "Id": "IsolatedHardware",
>   "Name": "Isolated Hardware LogService",
>   "OverWritePolicy": "WrapsWhenFull"
>
> Listing isolated hardware units.
> redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware >> =
Entries
> {
>   "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware/E=
ntries",
>   "@odata.type": "#LogEntryCollection.LogEntryCollection",
>   "Description": "Collection of Isolated Hardware Components",
>   "Members": [
>     {
>       "@odata.id":
> "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries/1",
>       "@odata.type": "#LogEntry.v1_7_0.LogEntry",
>       "Created": "2020-10-15T10:30:08+00:00",
>       "EntryType": "Event",
>       "Id": "1",
>       "Resolved": "false",

LogEntry doesn't have a "Resolved" field that I can see.

>       "Name": "Processor 1",
>       "links":  {
>                  "OriginOfCondition": {
>                         "@odata.id":
> "/redfish/v1/Systems/system/Processors/cpu1"
>                     },
>       "Severity": "Critical",
>        "SensorType" : "Processor",

SensorType doesn't really make sense in this case, as you're not
reporting errors from a sensor, but from a resource.

>
>  "AdditionalDataURI":
> =E2=80=9C/redfish/v1/Systems/system/LogServices/EventLog/attachement/111"
>  =E2=80=9CAddionalDataSizeBytes": "1024"
>
>   }
>   ],
>   "Members@odata.count": 1,
>   "Name": "Isolated Hardware Entries"
>
> Users will be able to delete any entry or all the entries, but if an
> isolated unit is serviced then that unit will be back in service, in
> such cases the "Resolved" property in the entries will be marked as
> "true"
> "AdditionalDataURI" : This is a link to the error log associated with
> this isolation action.
> --------------
> Dhruvaraj S


I suspect overall you need to separate this into two different
resources.  One for logging things that have happened in the past,
under log service, and one for interacting directly with the system in
its current state.  The second one would likely take the form of being
able to set the Status property to something like "Disabled",
"UnavailableOffline", or something similar on your Processor
resources.
