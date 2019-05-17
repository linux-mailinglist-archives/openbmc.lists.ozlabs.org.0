Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F2321AFA
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 17:52:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455CTc1QDJzDqSS
	for <lists+openbmc@lfdr.de>; Sat, 18 May 2019 01:52:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="InuDqFYt"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455CSk4Kg9zDqTx
 for <openbmc@lists.ozlabs.org>; Sat, 18 May 2019 01:51:18 +1000 (AEST)
Received: by mail-it1-x12e.google.com with SMTP id u186so12783200ith.0
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUZ+IEl+CgRkWOcJm3aIIjcRsCECWTY3UOYzjv5ZaxU=;
 b=InuDqFYtnbqvSaAINepl3kMmlQmkK6Kgzn7TunqIC/Sbt3nauyG+2juhP4bWOMj7Uh
 wkRU/1rwtwmUlLHoUWh/VE0SyA/Z6icCjm76QKVJJ1JX73dLuH3+XUEFNyFXUwqAFi/D
 cZ0KvKoL4BGFGqIyZ3iiu0VX3MmArAtOEY8v96xc8r2G4zahn0kXB5ZjvoUltEzAjvxF
 rdKkVe1lBg+2efRZ+dYPvfdFc3N98z05kDpxSNRRRZN9G3HTuH7YGOofL/pPs8+Ph97C
 VGHbKA8KGem4Fol+h9+snFCb7GqArIFllVrqlWrDSRP2fKMPtUDa+GHSBU32ZzCtsH8b
 pr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUZ+IEl+CgRkWOcJm3aIIjcRsCECWTY3UOYzjv5ZaxU=;
 b=UpQhT2UpqN9MVhCueXYkufohI7JPrJQMRZzgqi4TatDU/MCjFAm6SWRoKc6IhMDc7G
 WjEaCmEECHWSTG0fkDaSnGatQmJbJXwNsqXWj59qJjcP6etQCOc9smKGJblHpnVAscVr
 399QeV7uw6bfk1buABykwe39gX5S5tm3grEB8FO/9eZOD1Mcnmkk9Sya8VA7i4UOU9tn
 kzkLmwLPD5JueE/tlN0btZ31obn0Zsnt4GtHh6k/Gu6szAaZ57XARDEyhQMjDI262exf
 XVHqDruWylXYVZX+zb2xaZwWTFEiWkrYy2GVMSfeoLGyniYybrGfR8fyahzkD4bxRjTL
 OpXA==
X-Gm-Message-State: APjAAAX/Vywf7t56WN9wuqDFxIqkW4PSbIOFmRJQvDIT6F8INSTyG9yL
 c4JAtj7rVGuma2CYOshdMw6o6UPQeRWQ61yiLOwJMw==
X-Google-Smtp-Source: APXvYqyEH4yGz9B/dC7vtLKukSMbau0gj6K/ukHBXbMAN23kNTGMTR0CCSSuj8dE72zKijuKGtXHy8PRNp5CtU9ylOc=
X-Received: by 2002:a24:27c6:: with SMTP id g189mr3173803ita.114.1558108274573; 
 Fri, 17 May 2019 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGMNF6VHifnF8qC61HN2bboY8duArOuQ1FvK3mP1gA6Xbazcow@mail.gmail.com>
 <a28747c1-a6c5-65c9-87da-d8df0ce0b14e@linux.vnet.ibm.com>
 <BL0PR2101MB093237A6F0A48C7212BD1FE0C80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <83b3990a-19c0-a0af-a28a-cedf8401bffb@linux.vnet.ibm.com>
 <BL0PR2101MB0932823408EE75DB889F3C3DC80B0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <c6ac62c1-48b4-0df8-fbff-8172275ef8b1@linux.vnet.ibm.com>
In-Reply-To: <c6ac62c1-48b4-0df8-fbff-8172275ef8b1@linux.vnet.ibm.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 17 May 2019 08:50:47 -0700
Message-ID: <CAGMNF6XyH-VGRh18acGUbJniJ_YLW-3dz6sFJTvKbO7ZraJcZA@mail.gmail.com>
Subject: Re: BMC health metrics (again!)
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000003ad48b0589175a9a"
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
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003ad48b0589175a9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd also like to be in the metric workgroup. Neeraj, I can see the first
and second point you listed aligns with my goals in the original proposal
very well.

On Fri, May 17, 2019 at 12:28 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:

> IMO, we could start fresh here. The initial thought was an year+ ago.
>
> !! Vishwa !!
> On 5/17/19 12:53 PM, Neeraj Ladkani wrote:
>
> Sure thing. Is there an design document that exist for this feature ?
>
> I can volunteer to drive this work group if we have quorum.
>
> Neeraj
>
> Get Outlook for Android <https://aka.ms/ghei36>
>
> ------------------------------
> *From:* vishwa <vishwa@linux.vnet.ibm.com> <vishwa@linux.vnet.ibm.com>
> *Sent:* Friday, May 17, 2019 12:17:51 AM
> *To:* Neeraj Ladkani; Kun Yi; OpenBMC Maillist
> *Subject:* Re: BMC health metrics (again!)
>
>
> Neeraj,
>
> Thanks for the inputs. It's nice to see us having a similar thought.
>
> AFAIK, we don't have any work-group that is driving =E2=80=9CPlatform tel=
emetry
> and health monitoring=E2=80=9D. Also, do we want to see this as 2 differe=
nt
> entities ?. In the past, there were thoughts about using websockets to
> channel some of the thermal parameters as telemetry data. But then it was
> not implemented.
>
> We can discuss here I think.
>
> !! Vishwa !!
> On 5/17/19 12:00 PM, Neeraj Ladkani wrote:
>
> At cloud scale, telemetry and health monitoring is very critical. We
> should define a framework that allows platform owners to add their own
> telemetry hooks. Telemetry service should be designed to make this data
> accessible and store in resilient way (like blackbox during plane crash).
>
>
>
> Is there any workgroup that drives this feature =E2=80=9CPlatform telemet=
ry and
> health monitoring=E2=80=9D ?
>
>
>
> Wishlist
>
>
>
> BMC telemetry :
>
>    1. Linux subsystem
>       1. Uptime
>       2. CPU Load average
>       3. Memory info
>       4. Storage usage ( RW )
>       5. Dmesg
>       6. Syslog
>       7. FDs of critical processes
>       8. Alignment traps
>       9. WDT excursions
>    2. IPMI subsystem
>       1. Request and Response logging par interface with timestamps (
>       KCS, LAN, USB)
>       2. Request and Response of IPMB
>
>                                                                i.      Re=
quest
> , Response, No of Retries
>
>    1. Misc
>
>
>    1. Critical Temperature Excursions
>
>                                                                i.      Mi=
nimum
> Reading of Sensor
>
>                                                              ii.      Max
> Reading of a sensor
>
>                                                            iii.      Coun=
t
> of state transition
>
>                                                            iv.      Retry
> Count
>
>    1. Count of assertions/deassertions of GPIO and ability to capture the
>    state
>    2. timestamp of last assertion/deassertion of GPIO
>
>
>
> Thanks
>
> ~Neeraj
>
>
>
> *From:* openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>
> <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> *On Behalf Of *
> vishwa
> *Sent:* Wednesday, May 8, 2019 1:11 AM
> *To:* Kun Yi <kunyi@google.com> <kunyi@google.com>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org> <openbmc@lists.ozlabs.org>
> *Subject:* Re: BMC health metrics (again!)
>
>
>
> Hello Kun,
>
> Thanks for initiating it. I liked the /proc parsing. On the IPMI thing, i=
s
> it only targeted to IPMI -or- a generic BMC-Host communication kink ?
>
> Some of the things in my wish-list are:
>
> 1/. Flash wear and tear detection and the threshold to be a config option
> 2/. Any SoC specific health checks ( If that is exposed )
> 3/. Mechanism to detect spurious interrupts on any HW link
> 4/. Some kind of check to see if there will be any I2C lock to a given en=
d
> device
> 5/. Ability to detect errors on HW links
>
> On the watchdog(8) area, I was just thinking these:
>
> How about having some kind of BMC_health D-Bus properties -or- a compile
> time feed, whose values can be fed into a configuration file than watchdo=
g
> using the default /etc/watchdog.conf always. If the properties are coming
> from a D-Bus, then we could either append to /etc/watchdog.conf -or- trea=
t
> those values only as the config file that can be given to watchdog.
> The systemd service files to be setup accordingly.
>
>
> We have seen instances where we get an error that is indicating no
> resources available. Those could be file descriptors / socket descriptors
> etc. A way to plug this into watchdog as part of test binary that checks
> for this ? We could hook a repair-binary to take the action.
>
>
> Another thing that I was looking at hooking into watchdog is the test to
> see the file system usage as defined by the policy.
> Policy could mention the file system mounts and also the threshold.
>
> For example, /tmp , /root etc.. We could again hook a repair binary to do
> some cleanup if needed
>
> If we see the list is growing with these custom requirements, then
> probably does not make sense to pollute the watchdog(2) but
> have these consumed into the app instead ?
>
> !! Vishwa !!
>
> On 4/9/19 9:55 PM, Kun Yi wrote:
>
> Hello there,
>
>
>
> This topic has been brought up several times on the mailing list and
> offline, but in general seems we as a community didn't reach a consensus =
on
> what things would be the most valuable to monitor, and how to monitor the=
m.
> While it seems a general purposed monitoring infrastructure for OpenBMC i=
s
> a hard problem, I have some simple ideas that I hope can provide immediat=
e
> and direct benefits.
>
>
>
> 1. Monitoring host IPMI link reliability (host side)
>
>
>
> The essentials I want are "IPMI commands sent" and "IPMI commands
> succeeded" counts over time. More metrics like response time would
> be helpful as well. The issue to address here: when some IPMI sensor
> readings are flaky, it would be really helpful to tell from IPMI command
> stats to determine whether it is a hardware issue, or IPMI issue. Moreove=
r,
> it would be a very useful regression test metric for rolling out new BMC
> software.
>
>
>
> Looking at the host IPMI side, there is some metrics exposed
> through /proc/ipmi/0/si_stats if ipmi_si driver is used, but I haven't du=
g
> into whether it contains information mapping to the interrupts. Time to
> read the source code I guess.
>
>
>
> Another idea would be to instrument caller libraries like the interfaces
> in ipmitool, though I feel that approach is harder due to fragmentation o=
f
> IPMI libraries.
>
>
>
> 2. Read and expose core BMC performance metrics from procfs
>
>
>
> This is straightforward: have a smallish daemon (or bmc-state-manager)
> read,parse, and process procfs and put values on D-Bus. Core metrics I'm
> interested in getting through this way: load average, memory, disk
> used/available, net stats... The values can then simply be exported as IP=
MI
> sensors or Redfish resource properties.
>
>
>
> A nice byproduct of this effort would be a procfs parsing library. Since
> different platforms would probably have different monitoring requirements
> and procfs output format has no standard, I'm thinking the user would jus=
t
> provide a configuration file containing list of (procfs path, property
> regex, D-Bus property name), and the compile-time generated code to provi=
de
> an object for each property.
>
>
>
> All of this is merely thoughts and nothing concrete. With that said, it
> would be really great if you could provide some feedback such as "I want
> this, but I really need that feature", or let me know it's all implemente=
d
> already :)
>
>
>
> If this seems valuable, after gathering more feedback of feature
> requirements, I'm going to turn them into design docs and upload for revi=
ew.
>
>
>
> --
>
> Regards,
>
> Kun
>
>

--=20
Regards,
Kun

--0000000000003ad48b0589175a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d also like to be in the metric workgroup. Neeraj, I=
 can see the first and second point you listed aligns with my goals in the =
original proposal very well.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 17, 2019 at 12:28 AM vishwa &lt;<=
a href=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.ibm.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>IMO, we could start fresh here. The initial thought was an year+
      ago.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class=3D"gmail-m_1275227641964777196moz-cite-prefix">On 5/17/19 12=
:53 PM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"auto" style=3D"direction:ltr;margin:0px;padding:0px;font-=
family:sans-serif;font-size:11pt;color:black">
        Sure thing. Is there an design document that exist for this
        feature ? <br>
        <br>
      </div>
      <div dir=3D"auto" style=3D"direction:ltr;margin:0px;padding:0px;font-=
family:sans-serif;font-size:11pt;color:black">
        I can volunteer to drive this work group if we have quorum.<br>
        <br>
      </div>
      <div dir=3D"auto" style=3D"direction:ltr;margin:0px;padding:0px;font-=
family:sans-serif;font-size:11pt;color:black">
        Neeraj <br>
        <br>
      </div>
      <div dir=3D"auto" style=3D"direction:ltr;margin:0px;padding:0px;font-=
family:sans-serif;font-size:11pt;color:black">
        <span id=3D"gmail-m_1275227641964777196OutlookSignature">
          <div dir=3D"auto" style=3D"direction:ltr;margin:0px;padding:0px;f=
ont-family:sans-serif;font-size:11pt;color:black">
            Get <a href=3D"https://aka.ms/ghei36" target=3D"_blank">Outlook
              for Android</a></div>
        </span><br>
      </div>
      <hr style=3D"display:inline-block;width:98%">
      <div id=3D"gmail-m_1275227641964777196divRplyFwdMsg" dir=3D"ltr"><fon=
t style=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><=
b>From:</b> vishwa
          <a class=3D"gmail-m_1275227641964777196moz-txt-link-rfc2396E" hre=
f=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">&lt;vishwa@linux.v=
net.ibm.com&gt;</a><br>
          <b>Sent:</b> Friday, May 17, 2019 12:17:51 AM<br>
          <b>To:</b> Neeraj Ladkani; Kun Yi; OpenBMC Maillist<br>
          <b>Subject:</b> Re: BMC health metrics (again!)</font>
        <div>=C2=A0</div>
      </div>
      <div>
        <p>Neeraj,</p>
        <p>Thanks for the inputs. It&#39;s nice to see us having a similar
          thought.</p>
        <p>AFAIK, we don&#39;t have any work-group that is driving <span st=
yle=3D"color:windowtext">
            =E2=80=9CPlatform telemetry and health monitoring=E2=80=9D. Als=
o, do we want
            to see this as 2 different entities ?. In the past, there
            were thoughts about using websockets to channel some of the
            thermal parameters as telemetry data. But then it was not
            implemented.</span></p>
        <p><span style=3D"color:windowtext">We can discuss here I think.</s=
pan></p>
        <p><span style=3D"color:windowtext">!! Vishwa !!<br>
          </span></p>
        <div class=3D"gmail-m_1275227641964777196moz-cite-prefix">On 5/17/1=
9 12:00 PM, Neeraj Ladkani
          wrote:<br>
        </div>
        <blockquote type=3D"cite">
         =20
         =20
          <div class=3D"gmail-m_1275227641964777196WordSection1">
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">At clou=
d
                scale, telemetry and health monitoring is very critical.
                We should define a framework that allows platform owners
                to add their own telemetry hooks. Telemetry service
                should be designed to make this data accessible and
                store in resilient way (like blackbox during plane
                crash). =C2=A0<u></u><u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">Is ther=
e
                any workgroup that drives this feature =E2=80=9CPlatform
                telemetry and health monitoring=E2=80=9D ?
                <u></u><u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">Wishlis=
t<u></u><u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">BMC
                telemetry : <u></u><u></u></span></p>
            <ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph" sty=
le=3D"color:windowtext;margin-left:0in">
                Linux subsystem<u></u><u></u></li>
              <ol style=3D"margin-top:0in" start=3D"1" type=3D"a">
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Uptime<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  CPU Load average<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Memory info<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Storage usage ( RW ) =C2=A0<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Dmesg<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Syslog <u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  FDs of critical processes <u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Alignment traps <u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  WDT excursions <u></u><u></u></li>
              </ol>
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph" sty=
le=3D"color:windowtext;margin-left:0in">
                IPMI subsystem<u></u><u></u></li>
              <ol style=3D"margin-top:0in" start=3D"1" type=3D"a">
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Request and Response logging par interface with
                  timestamps ( KCS, LAN, USB)<u></u><u></u></li>
                <li class=3D"gmail-m_1275227641964777196MsoListParagraph" s=
tyle=3D"color:windowtext;margin-left:0in">
                  Request and Response of IPMB<u></u><u></u></li>
              </ol>
            </ol>
            <p class=3D"gmail-m_1275227641964777196MsoListParagraph" style=
=3D"margin-left:1.5in">
              <span style=3D"color:windowtext"><span><span style=3D"font:7p=
t &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
                  </span>i.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
                </span></span><span style=3D"color:windowtext">Request , Re=
sponse, No of
                Retries<u></u><u></u></span></p>
            <ol style=3D"margin-top:0in" start=3D"3" type=3D"1">
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph" sty=
le=3D"color:windowtext;margin-left:0in">
                Misc<u></u><u></u></li>
            </ol>
            <ol style=3D"margin-top:0in" start=3D"1" type=3D"a">
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph" sty=
le=3D"color:windowtext">Critical
                Temperature Excursions
                <u></u><u></u></li>
            </ol>
            <p class=3D"gmail-m_1275227641964777196MsoListParagraph" style=
=3D"margin-left:1.5in">
              <span style=3D"color:windowtext"><span><span style=3D"font:7p=
t &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
                  </span>i.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
                </span></span><span style=3D"color:windowtext">Minimum Read=
ing of Sensor<u></u><u></u></span></p>
            <p class=3D"gmail-m_1275227641964777196MsoListParagraph" style=
=3D"margin-left:1.5in">
              <span style=3D"color:windowtext"><span><span style=3D"font:7p=
t &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
                  </span>ii.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
                </span></span><span style=3D"color:windowtext">Max Reading =
of a sensor<u></u><u></u></span></p>
            <p class=3D"gmail-m_1275227641964777196MsoListParagraph" style=
=3D"margin-left:1.5in">
              <span style=3D"color:windowtext"><span><span style=3D"font:7p=
t &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
                  </span>iii.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
                </span></span><span style=3D"color:windowtext">Count of sta=
te transition<u></u><u></u></span></p>
            <p class=3D"gmail-m_1275227641964777196MsoListParagraph" style=
=3D"margin-left:1.5in">
              <span style=3D"color:windowtext"><span><span style=3D"font:7p=
t &quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
                  </span>iv.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>
                </span></span><span style=3D"color:windowtext">Retry Count<=
u></u><u></u></span></p>
            <ol style=3D"margin-top:0in" start=3D"2" type=3D"a">
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph">Cou=
nt of assertions/deassertions of GPIO and
                ability to capture the state<u></u><u></u></li>
              <li class=3D"gmail-m_1275227641964777196MsoListParagraph">tim=
estamp of last assertion/deassertion of GPIO<u></u><u></u></li>
            </ol>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks<=
u></u><u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext">~Neeraj=
<u></u><u></u></span></p>
            <p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=
=C2=A0<u></u></span></p>
            <div>
              <div style=3D"border-right:none;border-bottom:none;border-lef=
t:none;border-top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
                <p class=3D"MsoNormal"><b><span style=3D"color:windowtext">=
From:</span></b><span style=3D"color:windowtext"> openbmc
                    <a class=3D"gmail-m_1275227641964777196moz-txt-link-rfc=
2396E" href=3D"mailto:openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.o=
rg" target=3D"_blank">
&lt;openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org&gt;</a> <b>On
                      Behalf Of </b>vishwa<br>
                    <b>Sent:</b> Wednesday, May 8, 2019 1:11 AM<br>
                    <b>To:</b> Kun Yi <a class=3D"gmail-m_12752276419647771=
96moz-txt-link-rfc2396E" href=3D"mailto:kunyi@google.com" target=3D"_blank"=
>
                      &lt;kunyi@google.com&gt;</a>; OpenBMC Maillist <a cla=
ss=3D"gmail-m_1275227641964777196moz-txt-link-rfc2396E" href=3D"mailto:open=
bmc@lists.ozlabs.org" target=3D"_blank">
                      &lt;openbmc@lists.ozlabs.org&gt;</a><br>
                    <b>Subject:</b> Re: BMC health metrics (again!)<u></u><=
u></u></span></p>
              </div>
            </div>
            <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
            <p>Hello Kun,<u></u><u></u></p>
            <p>Thanks for initiating it. I liked the /proc parsing. On
              the IPMI thing, is it only targeted to IPMI -or- a generic
              BMC-Host communication kink ?<u></u><u></u></p>
            <p>Some of the things in my wish-list are:<u></u><u></u></p>
            <p>1/. Flash wear and tear detection and the threshold to be
              a config option<br>
              2/. Any SoC specific health checks ( If that is exposed )<br>
              3/. Mechanism to detect spurious interrupts on any HW link<br=
>
              4/. Some kind of check to see if there will be any I2C
              lock to a given end device<br>
              5/. Ability to detect errors on HW links<u></u><u></u></p>
            <p>On the watchdog(8) area, I was just thinking these:<u></u><u=
></u></p>
            <p>How about having some kind of BMC_health D-Bus properties
              -or- a compile time feed, whose values can be fed into a
              configuration file than watchdog using the default
              /etc/watchdog.conf always. If the properties are coming
              from a D-Bus, then we could either append to
              /etc/watchdog.conf -or- treat those values only as the
              config file that can be given to watchdog.<br>
              The systemd service files to be setup accordingly.<u></u><u><=
/u></p>
            <p><br>
              We have seen instances where we get an error that is
              indicating no resources available. Those could be file
              descriptors / socket descriptors etc. A way to plug this
              into watchdog as part of test binary that checks for this
              ? We could hook a repair-binary to take the action.<u></u><u>=
</u></p>
            <p><br>
              Another thing that I was looking at hooking into watchdog
              is the test to see the file system usage as defined by the
              policy.<br>
              Policy could mention the file system mounts and also the
              threshold.<br>
              <br>
              For example, /tmp , /root etc.. We could again hook a
              repair binary to do some cleanup if needed<br>
              <br>
              If we see the list is growing with these custom
              requirements, then probably does not make sense to pollute
              the watchdog(2) but<br>
              have these consumed into the app instead ?<u></u><u></u></p>
            <p>!! Vishwa !!<u></u><u></u></p>
            <div>
              <p class=3D"MsoNormal">On 4/9/19 9:55 PM, Kun Yi wrote:<u></u=
><u></u></p>
            </div>
            <blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
              <div>
                <div>
                  <div>
                    <div>
                      <p class=3D"MsoNormal">Hello there,<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">This topic has been brought
                        up several times on the mailing list and
                        offline, but in general seems we as a community
                        didn&#39;t reach a consensus on what things would b=
e
                        the most valuable to monitor, and how to monitor
                        them. While it seems a general purposed
                        monitoring infrastructure for OpenBMC is a hard
                        problem, I have some simple ideas that I hope
                        can provide immediate and direct benefits.<u></u><u=
></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">1. Monitoring host IPMI link
                        reliability (host side)<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">The essentials I want are
                        &quot;IPMI commands sent&quot; and &quot;IPMI comma=
nds
                        succeeded&quot; counts over time. More metrics like
                        response time would be=C2=A0helpful as well. The
                        issue to address here: when some IPMI sensor
                        readings are flaky, it would be really helpful
                        to tell from IPMI command stats to determine
                        whether it is a hardware issue, or IPMI issue.
                        Moreover, it would be a very useful regression
                        test metric for rolling out new BMC software.<u></u=
><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">Looking at the host IPMI
                        side, there is some metrics exposed
                        through=C2=A0/proc/ipmi/0/si_stats if ipmi_si drive=
r
                        is used, but I haven&#39;t dug into whether it
                        contains information mapping to the interrupts.
                        Time to read the source code I guess.<u></u><u></u>=
</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">Another idea would be to
                        instrument caller libraries like the interfaces
                        in ipmitool, though I feel that approach is
                        harder due to fragmentation of IPMI libraries.<u></=
u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">2. Read and expose core BMC
                        performance metrics from procfs<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">This is straightforward: have
                        a smallish daemon (or bmc-state-manager)
                        read,parse, and process procfs and put values on
                        D-Bus. Core metrics I&#39;m interested in getting
                        through this way: load average, memory, disk
                        used/available, net stats... The values can then
                        simply be exported as IPMI sensors or Redfish
                        resource properties.<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">A nice byproduct of this
                        effort would be a procfs parsing library. Since
                        different platforms would probably have
                        different monitoring requirements and procfs
                        output format has no standard, I&#39;m thinking the
                        user would just provide a configuration file
                        containing list of (procfs path, property regex,
                        D-Bus property name), and the
                        compile-time=C2=A0generated code to provide an obje=
ct
                        for each property.=C2=A0<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">All of this is merely
                        thoughts and nothing concrete. With that said,
                        it would be really great if you could provide
                        some feedback such as &quot;I want this, but I real=
ly
                        need that feature&quot;, or let me know it&#39;s al=
l
                        implemented already :)<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">If this seems valuable, after
                        gathering more feedback of feature requirements,
                        I&#39;m going to turn them into design docs and
                        upload for review.<u></u><u></u></p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
                    </div>
                    <p class=3D"MsoNormal">-- <u></u><u></u></p>
                    <div>
                      <div>
                        <p class=3D"MsoNormal">Regards, <u></u><u></u></p>
                        <div>
                          <p class=3D"MsoNormal">Kun<u></u><u></u></p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--0000000000003ad48b0589175a9a--
