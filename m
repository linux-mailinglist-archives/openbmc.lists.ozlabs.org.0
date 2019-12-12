Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0C11D7B8
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 21:11:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YlLn0QRFzDr7m
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 07:11:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YlKs0WsHzDr74
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 07:10:55 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id h23so46045ljc.8
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DOwtMZG0rDpEvLq1oLj0qrOCvfXnKEvSikzOHxwjGJg=;
 b=FSa/xvt7/F8W7xW6b9ge65LjUR4mr/7NpOKPYuS+oa9crHTkPjC0GJpMX1G2A7Ugmc
 wO7O/VHnhaFVjl+0I4ojPPsYYXkG1LpmcgR0jszdg0bfb88EkD16QHUh11c7s9fxDC3k
 aCyXPDPZYDKoWEe46k2sLvlia8Quk9xEnTyknNSPZkMzg/hVLbJfVAjdzzSEFBmmsSOC
 LDaLLfLLXNJZEOgEoSg599gqEkWJgLS38gpCBsGUX9TbReaLofVMB1m1fMAuP4/0Kjwl
 98y25BR8K/3yJZ8k2ZZ81BoC6acqnvMWOvpbYhugyEvyPnG9qQXnLvUUjTnmyDpLq1Q0
 +87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOwtMZG0rDpEvLq1oLj0qrOCvfXnKEvSikzOHxwjGJg=;
 b=ixZxxavthAc0qvHqlD4bjRu/yzmJrZS+7bkV6QSovMRtNsrNMU94Z1SIxb/FpMWTL4
 kN5JFT3usdgHsNpFk5G9dhuAtMeH36+ioGBoqOW4Ddrn89UjwOsc07KC/HXcUt1uiJfk
 gTVPqSSJOCURcxI2ltUrW+46LvkMNwQVD9EeVuqQbVrsfe+7OEpwjsLaERDRjj70w60t
 zIEIIbAQpE2viB/+zcHXHqCRCRb8kDAQw7savyIRPmPmKGRuImaBOauXpqrpQHe4nhPe
 qZiHyJRrnzpmxj7BsDdXswJRdy2eZYrGWIEz8VcS+K/qFvtyYI5vEMlcxKYXzZIRZyoo
 iyxg==
X-Gm-Message-State: APjAAAXUStS+vhc5JmUfjCZepgWIqovkf8O79b2dHpVnI0w0upONPvne
 qgqF0n+H5DXwmMMX0xFYbcu4K36qGETpjrs0oL6sYw==
X-Google-Smtp-Source: APXvYqxf3OylA9gC1zOVU+kUmlbMqvtRnPTqAWZTJmliQC/Uy3ELb7Z0TyEn7ek050Qsg4JMG88GNtOhImHqqLfjCuE=
X-Received: by 2002:a05:651c:112d:: with SMTP id
 e13mr6317071ljo.99.1576180980134; 
 Thu, 12 Dec 2019 12:03:00 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
 <cb3fe45e-72b8-9910-9dda-b9127bf74fdc@linux.vnet.ibm.com>
 <DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <21b9654b-1e40-804b-a607-e156c848ad85@linux.vnet.ibm.com>
 <DM6PR21MB13887E6D80993E771E217B0BC8550@DM6PR21MB1388.namprd21.prod.outlook.com>
In-Reply-To: <DM6PR21MB13887E6D80993E771E217B0BC8550@DM6PR21MB1388.namprd21.prod.outlook.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 12 Dec 2019 12:02:48 -0800
Message-ID: <CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: Managing heterogeneous systems
To: Neeraj Ladkani <neladk@microsoft.com>
Content-Type: multipart/alternative; boundary="0000000000006c93cb0599873b97"
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
Cc: "sgundura@in.ibm.com" <sgundura@in.ibm.com>,
 "shahjsha@in.ibm.com" <shahjsha@in.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vikantan@in.ibm.com" <vikantan@in.ibm.com>,
 "kusripat@in.ibm.com" <kusripat@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006c93cb0599873b97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In our case we are working to migrate away from IPMI to Redfish.  Most of
the solutions I've been thinking about have leaned pretty heavily into that=
.

In my mind I've sliced this project up into a few different areas.

*Merging/Transforming Redfish Resources*
Let's say that there are several Redfish services.  They will have
collections of Systems, Chassis, and Managers that need to be merged.  In
the simplest uses this would be just an HTTP proxy cache with some URL
cleaning.

However, this could end up being a pretty deep merge in cases where some
resources are split across multiple management domains.  Memory errors
being on one node, but the temperature sensor being on a separate node is a
good example. Another example would be the "ContainedBy" link.  These links
might reach across different BMC boundaries, and would need to be inserted
by the primary node.

*Aggregating Services and Actions*
This is where I think the DMTF proposals for Redfish aggregation (located
here
<https://members.dmtf.org/apps/org/workgroup/redfish/document.php?document_=
id=3D91811>)
provide the most insight.  My reading of this proposal is that an
aggregation service would be used to tie actions together.  For example,
there may be individual chassis reset action embedded in the chassis
resources, and then aggregated action for a full reset.

DMTF seems to be leaving the arbiter of the aggregation up to the
implementation.  I'd imagine that some implementations would provide a
static aggregation service, while others would allow clients to create
their own dynamic aggregates.

*Discovery, Negotiation, and Error Recovery*
This is an area where I'd like to hear more about your requirements,
Vishwa.  Would you expect the BMC cluster to be hot-swappable?  Is there a
particular reason that it has to be peer to peer? What kind of error
recovery should be supported when a node fails?

At a high level, the idea that has been suggested internally is to have a
designated master node at install time.  That node would discover any other
Redfish services on the LAN, and begin aggregating them.  The master node
would keep any in memory cache of the other services, and reload resources
on demand.  If a node goes down, then there error is propagated using HTTP
return codes.  If the master node goes down, then the entire aggregate will
go down.  In theory a client could talk to individual nodes if it needed to=
.

* Authentication and Authorization*
This is an area where I think Redfish is a little hands off.  In an ideal
world ACLs could be setup without proliferating username/passwords across
nodes.  As an aside, we've been thinking about how to use Redfish without
any usernames or passwords.  By using a combination of certificates and
authorization tokens it should be possible to extend a security zone to a
small cluster of BMCs.

Regards,
Richard

On Wed, Dec 11, 2019 at 11:33 PM Neeraj Ladkani <neladk@microsoft.com>
wrote:

> Sure, how do we want to enable BMC-BMC communication? Standard
> redfish/IPMI ?
>
>
>
> Neeraj
>
>
>
>
>
> *From:* vishwa <vishwa@linux.vnet.ibm.com>
> *Sent:* Wednesday, December 11, 2019 10:59 PM
> *To:* Neeraj Ladkani <neladk@microsoft.com>
> *Cc:* openbmc@lists.ozlabs.org; sgundura@in.ibm.com; kusripat@in.ibm.com;
> shahjsha@in.ibm.com; vikantan@in.ibm.com; Richard Hanley <
> rhanley@google.com>
> *Subject:* Re: [EXTERNAL] Re: Managing heterogeneous systems
>
>
>
> On 12/10/19 3:20 PM, Neeraj Ladkani wrote:
>
> Great discussion.
>
>
>
> The problem is not physical interface as they can communicate using LAN.
> The problem is entity binding as one compute node can be connected to 1 o=
r
> more storage nodes. How can we have one view of system from operational
> perspective? Power on/off, SEL logs, telemetry?
>
>
>
>
> Correct. This is where I mentioned about "Primary BMC acting as Point Of
> Contact" for external requests.
> Depending on how we want to service the request, we could orchestrate tha=
t
> via PoC BMC or respond to external requesters on where they can get the
> data and they connect to 'em directly.
>
>
> !! Vishwa !!
>
>
>
> Some of problems :
>
>
>
>    1. Power operations : Power/resets/ need to be coordinated in all
>    nodes in a system
>    2. Telemetry : OS runs only on head node so if there are requests to
>    read telemetry, it should get telemetry ( SEL logs, Sensor Values ) fr=
om
>    all the nodes.
>    3. Firmware Update
>    4. RAS: Memory errors are logged by UEFI SMM in to head node but
>    corresponding DIMM temperature , inlet temperature are logged on secon=
dary
>    node which are not mapped.
>
>
>
>
>
> I have been exploring couple of routes
>
>
>
>    1. LUN  discovery and routing: this is similar to IPMI but I am
>    working on architecture to extend this to support multiple LUNs and ro=
ute
>    them from Head node. ( we would need LUN routing over LAN )
>    2. Redfish hierarchy for systems
>
>    "Systems": {
>
>         "@odata.id": "/redfish/v1/Systems"
>
>     },
>
>     "Chassis": {
>
>         "@odata.id": "/redfish/v1/Chassis"
>
>     },
>
>     "Managers": {
>
>         "@odata.id": "/redfish/v1/Managers"
>
>     },
>
>     "AccountService": {
>
>         "@odata.id": "/redfish/v1/AccountService"
>
>     },
>
>     "SessionService": {
>
>         "@odata.id": "/redfish/v1/SessionService"
>
>     },
>
>     "Links": {
>
>         "Sessions": {
>
>             "@odata.id": "/redfish/v1/SessionService/Sessions"
>
>         }
>
> 3.  Custom Messaging over LAN ( PubSub)
>
>
>
> I am also working on a whitepaper on same area J.  Happy to work with you
> guys if you have any ideas on how can we standardize this.
>
>
>
> Neeraj
>
>
>
> *From:* vishwa <vishwa@linux.vnet.ibm.com> <vishwa@linux.vnet.ibm.com>
> *Sent:* Tuesday, December 10, 2019 1:00 AM
> *To:* Richard Hanley <rhanley@google.com> <rhanley@google.com>; Neeraj
> Ladkani <neladk@microsoft.com> <neladk@microsoft.com>
> *Cc:* openbmc@lists.ozlabs.org; sgundura@in.ibm.com; kusripat@in.ibm.com;
> shahjsha@in.ibm.com; vikantan@in.ibm.com
> *Subject:* [EXTERNAL] Re: Managing heterogeneous systems
>
>
>
> Hi Richard / Neeraj,
>
> Thanks for bringing this up. It's one of the interesting topic for IBM.
>
> Some of the thoughts here.....
>
> When we have multiple BMCs as part of a single system, then there are 3
> main parts into it.
>
> 1/. Discovering the peer BMCs and role assignment
> 2/. Monitoring the existence of peer BMCs - heartbeat
> 3/. In the event of loosing the master, detect so using #2 and then
> reassign the role
>
> Depending on how we want to establish the roles, we could have
> Single-Master, Many-slave or Multi-Master, Multi-Slave. etc
>
> One of the team here is trying to do a POC for Multi BMC architecture and
> is still in the very beginning stage.
> The team is currently studying/evaluating the available solution -
> Corosync / Heartbeat / Pacemaker".
> Corosync works nice with the clusters, but we need to see if we can trim
> it down for BMC.
>
> If we can not use corosync for some reason, then need to see if we can us=
e
> the discovery using PLDM ( probably use the terminus IDs )
> and come up with custom rules for assigning Master-Slave roles.
>
> If we choose to have Single-Master and Many-Slave, we could have that
> Single-Master as an entity acting as a Point of Contact for external
> request and then could orchestrate with the needed BMCs internally to get
> the job done
>
> I will be happy to know if there are alternatives that suit BMC kind of a=
n
> architecture
>
> !! Vishwa !!
>
> On 12/10/19 4:32 AM, Richard Hanley wrote:
>
> Hi Neeraj,
>
>
>
> This is an open question that I've been looking into as well.
>
>
>
> For BMC to BMC communication there are a few options.
>
>    1. If you have network connectivity you can communicate using Redfish.
>    2. If you only have a PCIe connection, you'll have to use either the
>    inband connection or the side band I2C*.  PLDM and MCTP are protocols =
that
>    defined to handle this use case, although I'm not sure if the OpenBMC
>    implementations have been used in production.
>    3. There is always IPMI, which has its own pros/cons.
>
> For taking several BMCs and aggregating them into a single logical
> interface that is exposed to the outside world, there are a few things
> happening on that front.  DMTF has been working on an aggregation protoco=
l
> for Redfish.  However, it's my understanding that their proposal is more
> directed at the client level, as opposed to within a single "system".
>
>
>
> I just recently joined the community, but I've been thinking about how a
> proxy layer could merge two Redfish services together.  Since Redfish is
> fairly strongly typed and has a well defined mechanism for OEM extensions=
,
> this should be pretty generally applicable.  I am planning on having a
> white paper on the issue sometime after the holidays.
>
>
>
> Another thing to note, recently DMTF released a spec for running a binary
> Redfish over PLDM called RDE.  That might be a useful way of tying all
> these concepts together.
>
>
>
> I'd be curious about your thoughts and use cases here.  Would either PLDM
> or Redfish fit your use case?
>
>
>
> Regards,
>
> Richard
>
>
>
> *I've heard of some proposals that run a network interface over PCIe.  I
> don't know enough about PCIe to know if this is a good idea.
>
>
>
> On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani <neladk@microsoft.com>
> wrote:
>
> Are there any standards in managing heterogeneous systems? For example in
> a rack if there is a compute node( with its own BMC) and storage node( wi=
th
> its own BMC) connected using a PCIe switch.  How these two BMC represente=
d
> as one system ?  are there any standards for BMC =E2=80=93 BMC communicat=
ion?
>
>
>
>
>
> Neeraj
>
>
>
>

--0000000000006c93cb0599873b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In our case we are working to migrate away from IPMI to Re=
dfish.=C2=A0 Most of the solutions I&#39;ve been thinking about have leaned=
 pretty heavily into that.<div><br></div><div>In my mind I&#39;ve sliced th=
is project up into a few different areas.<div><br></div><div><b>Merging/Tra=
nsforming Redfish Resources</b></div><div>Let&#39;s say that there are seve=
ral Redfish services.=C2=A0 They will have collections of Systems, Chassis,=
 and Managers that=C2=A0need to be merged.=C2=A0 In the simplest uses this =
would be just an HTTP proxy cache with some URL cleaning.</div><div><br></d=
iv><div>However, this could end up being a pretty deep merge in cases where=
 some resources are split across=C2=A0multiple management domains.=C2=A0 Me=
mory errors being on one node, but the temperature=C2=A0sensor being on a s=
eparate=C2=A0node is a good example. Another example would be the &quot;Con=
tainedBy&quot; link.=C2=A0 These links might reach across different BMC bou=
ndaries, and would need to be inserted by the primary node.=C2=A0</div><div=
><br></div><div><b>Aggregating Services and Actions</b></div><div>This is w=
here I think the DMTF proposals for Redfish aggregation (located <a href=3D=
"https://members.dmtf.org/apps/org/workgroup/redfish/document.php?document_=
id=3D91811" target=3D"_blank">here</a>) provide the most insight.=C2=A0 My =
reading of this proposal is that an aggregation service would be used to ti=
e actions together.=C2=A0 For example, there may be individual chassis rese=
t action embedded in the chassis resources, and then aggregated action for =
a full reset.</div><div><br></div><div>DMTF seems to be leaving the arbiter=
 of the aggregation up to the implementation.=C2=A0 I&#39;d imagine that so=
me implementations would provide a static aggregation service, while others=
 would allow clients to create their own dynamic aggregates.</div><div><b><=
br></b></div><div><b>Discovery, Negotiation, and Error Recovery</b></div><d=
iv>This is an area where I&#39;d like to hear more about your requirements,=
 Vishwa.=C2=A0 Would you expect the BMC cluster to be hot-swappable?=C2=A0 =
Is there a particular reason that it has to be peer to peer? What kind of e=
rror recovery should be supported when a node fails?=C2=A0</div><div><br></=
div><div>At a high level, the idea that has been suggested internally is to=
 have a designated master node at install time.=C2=A0 That node would disco=
ver any other Redfish services on the LAN, and begin aggregating them.=C2=
=A0 The master node would keep any in memory cache of the other services, a=
nd reload resources on demand.=C2=A0 If a node goes down, then there error =
is propagated using HTTP return codes.=C2=A0 If the master node goes down, =
then the entire aggregate will go down.=C2=A0 In theory a client could talk=
 to individual nodes if it needed to.</div><div><b><br></b></div><div><b>  =
Authentication=C2=A0and=C2=A0Authorization</b></div></div><div>This is an a=
rea where I think Redfish is a little hands off.=C2=A0 In an ideal world AC=
Ls could be setup without proliferating username/passwords across nodes.=C2=
=A0 As an aside, we&#39;ve been thinking about how to use Redfish without a=
ny usernames or passwords.=C2=A0 By using a combination of certificates and=
 authorization tokens it should be possible to extend a security zone to a =
small cluster of BMCs.</div><div><br></div><div>Regards,</div><div>Richard<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Dec 11, 2019 at 11:33 PM Neeraj Ladkani &lt;<a href=3D"mailto:=
neladk@microsoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Sure, how do we wan=
t to enable BMC-BMC communication? Standard redfish/IPMI ?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Neeraj<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=C2=A0<u></u=
></span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> vishwa &lt;<a href=3D"mailto:vishwa@linux=
.vnet.ibm.com" target=3D"_blank">vishwa@linux.vnet.ibm.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, December 11, 2019 10:59 PM<br>
<b>To:</b> Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" targe=
t=3D"_blank">neladk@microsoft.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a>; <a href=3D"mailto:sgundura@in.ibm.com" target=
=3D"_blank">sgundura@in.ibm.com</a>; <a href=3D"mailto:kusripat@in.ibm.com"=
 target=3D"_blank">kusripat@in.ibm.com</a>; <a href=3D"mailto:shahjsha@in.i=
bm.com" target=3D"_blank">shahjsha@in.ibm.com</a>; <a href=3D"mailto:vikant=
an@in.ibm.com" target=3D"_blank">vikantan@in.ibm.com</a>; Richard Hanley &l=
t;<a href=3D"mailto:rhanley@google.com" target=3D"_blank">rhanley@google.co=
m</a>&gt;<br>
<b>Subject:</b> Re: [EXTERNAL] Re: Managing heterogeneous systems<u></u><u>=
</u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 12/10/19 3:20 PM, Neeraj Ladkani wrote:<u></u><u>=
</u></p>
</div>
<blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Great discussion.=
 </span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">The problem is no=
t physical interface as they can communicate using LAN. The problem is enti=
ty binding as one compute node can be connected to 1 or more storage nodes.=
 How can we have one view of system from
 operational perspective? Power on/off, SEL logs, telemetry? </span><u></u>=
<u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><u></u>=C2=A0<u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><br>
Correct. This is where I mentioned about &quot;Primary BMC acting as Point =
Of Contact&quot; for external requests.<br>
Depending on how we want to service the request, we could orchestrate that =
via PoC BMC or respond to external requesters on where they can get the dat=
a and they connect to &#39;em directly.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"color:wi=
ndowtext"><br>
!! Vishwa !!<u></u><u></u></span></p>
</div>
<blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Some of problems =
:</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li style=3D"color:rgb(0,32,96);margin-left:0in">
Power operations : Power/resets/ need to be coordinated in all nodes in a s=
ystem <u></u>
<u></u></li><li style=3D"color:rgb(0,32,96);margin-left:0in">
Telemetry : OS runs only on head node so if there are requests to read tele=
metry, it should get telemetry ( SEL logs, Sensor Values ) from all the nod=
es.
<u></u><u></u></li><li style=3D"color:rgb(0,32,96);margin-left:0in">
Firmware Update<u></u><u></u></li><li style=3D"color:rgb(0,32,96);margin-le=
ft:0in">
RAS: Memory errors are logged by UEFI SMM in to head node but corresponding=
 DIMM temperature , inlet temperature are logged on secondary node which ar=
e not mapped. =C2=A0<u></u><u></u></li></ol>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">I have been explo=
ring couple of routes
</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li style=3D"color:rgb(0,32,96);margin-left:0in">
LUN=C2=A0 discovery and routing: this is similar to IPMI but I am working o=
n architecture to extend this to support multiple LUNs and route them from =
Head node. ( we would need LUN routing over LAN )
<u></u><u></u></li><li style=3D"color:rgb(0,32,96);margin-left:0in">
Redfish hierarchy for systems <u></u><u></u></li></ol>
<pre><span style=3D"color:black">=C2=A0=C2=A0 &quot;Systems&quot;: {</span>=
<u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;@<a href=3D"http://odata.id" target=3D"_blank">odata.id</a>&quot;: &=
quot;/redfish/v1/Systems&quot;</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</span><u></u><u></u>=
</pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;Chassis&quot;: {<=
/span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;@<a href=3D"http://odata.id" target=3D"_blank">odata.id</a>&quot;: &=
quot;/redfish/v1/Chassis&quot;</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</span><u></u><u></u>=
</pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;Managers&quot;: {=
</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;@<a href=3D"http://odata.id" target=3D"_blank">odata.id</a>&quot;: &=
quot;/redfish/v1/Managers&quot;</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</span><u></u><u></u>=
</pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;AccountService&qu=
ot;: {</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;@<a href=3D"http://odata.id" target=3D"_blank">odata.id</a>&quot;: &=
quot;/redfish/v1/AccountService&quot;</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</span><u></u><u></u>=
</pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;SessionService&qu=
ot;: {</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;@<a href=3D"http://odata.id" target=3D"_blank">odata.id</a>&quot;: &=
quot;/redfish/v1/SessionService&quot;</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</span><u></u><u></u>=
</pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;Links&quot;: {</s=
pan><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;Sessions&quot;: {</span><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blan=
k">odata.id</a>&quot;: &quot;/redfish/v1/SessionService/Sessions&quot;</spa=
n><u></u><u></u></pre>
<pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }</span><u></u><u></u></pre>
<pre style=3D"margin-left:0.5in"><u></u><span>3.<span style=3D"font:7pt &qu=
ot;Times New Roman&quot;">=C2=A0 </span></span><u></u><span style=3D"font-f=
amily:Calibri,sans-serif;color:rgb(0,32,96)">Custom Messaging over LAN ( Pu=
bSub)</span><u></u><u></u></pre>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">I am also working=
 on a whitepaper on same area
</span><span style=3D"font-family:Wingdings;color:rgb(0,32,96)">J</span><sp=
an style=3D"color:rgb(0,32,96)">.=C2=A0 Happy to work with you guys if you =
have any ideas on how can we standardize this.
</span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=C2=A0</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">Neeraj</span><u><=
/u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=A0</span><u></u=
><u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> vishwa
<a href=3D"mailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">&lt;vishwa@l=
inux.vnet.ibm.com&gt;</a> <br>
<b>Sent:</b> Tuesday, December 10, 2019 1:00 AM<br>
<b>To:</b> Richard Hanley <a href=3D"mailto:rhanley@google.com" target=3D"_=
blank">&lt;rhanley@google.com&gt;</a>; Neeraj Ladkani
<a href=3D"mailto:neladk@microsoft.com" target=3D"_blank">&lt;neladk@micros=
oft.com&gt;</a><br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a>;
<a href=3D"mailto:sgundura@in.ibm.com" target=3D"_blank">sgundura@in.ibm.co=
m</a>; <a href=3D"mailto:kusripat@in.ibm.com" target=3D"_blank">
kusripat@in.ibm.com</a>; <a href=3D"mailto:shahjsha@in.ibm.com" target=3D"_=
blank">shahjsha@in.ibm.com</a>;
<a href=3D"mailto:vikantan@in.ibm.com" target=3D"_blank">vikantan@in.ibm.co=
m</a><br>
<b>Subject:</b> [EXTERNAL] Re: Managing heterogeneous systems</span><u></u>=
<u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p>Hi Richard / Neeraj,<u></u><u></u></p>
<p>Thanks for bringing this up. It&#39;s one of the interesting topic for I=
BM.<u></u><u></u></p>
<p>Some of the thoughts here.....<u></u><u></u></p>
<p>When we have multiple BMCs as part of a single system, then there are 3 =
main parts into it.<u></u><u></u></p>
<p>1/. Discovering the peer BMCs and role assignment<br>
2/. Monitoring the existence of peer BMCs - heartbeat <br>
3/. In the event of loosing the master, detect so using #2 and then reassig=
n the role<u></u><u></u></p>
<p>Depending on how we want to establish the roles, we could have Single-Ma=
ster, Many-slave or Multi-Master, Multi-Slave. etc<u></u><u></u></p>
<p>One of the team here is trying to do a POC for Multi BMC architecture an=
d is still in the very beginning stage.
<br>
The team is currently studying/evaluating the available solution - Corosync=
 / Heartbeat / Pacemaker&quot;.<br>
Corosync works nice with the clusters, but we need to see if we can trim it=
 down for BMC.<br>
<br>
If we can not use corosync for some reason, then need to see if we can use =
the discovery using PLDM ( probably use the terminus IDs )<br>
and come up with custom rules for assigning Master-Slave roles.<u></u><u></=
u></p>
<p>If we choose to have Single-Master and Many-Slave, we could have that Si=
ngle-Master as an entity acting as a Point of Contact for external request =
and then could orchestrate with the needed BMCs internally to get the job d=
one<u></u><u></u></p>
<p>I will be happy to know if there are alternatives that suit BMC kind of =
an architecture<u></u><u></u></p>
<p>!! Vishwa !!<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">On 12/10/19 4:32 AM, Richard Hanley wrote:<u></u><u>=
</u></p>
</div>
<blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
<div>
<p class=3D"MsoNormal">Hi Neeraj, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">This is an open question that I&#39;ve been looking =
into as well.=C2=A0=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">For BMC to BMC communication there are a few options=
.<u></u><u></u></p>
</div>
<div>
<ol start=3D"1" type=3D"1">
<li class=3D"MsoNormal">
If you have network connectivity you can communicate using Redfish.<u></u><=
u></u></li><li class=3D"MsoNormal">
If you only have a PCIe connection, you&#39;ll have to use either the inban=
d connection or the side band I2C*.=C2=A0 PLDM and MCTP are protocols that =
defined to handle this use case, although I&#39;m not sure if the OpenBMC i=
mplementations have been used in production.<u></u><u></u></li><li class=3D=
"MsoNormal">
There is always IPMI, which has its own pros/cons.<u></u><u></u></li></ol>
<div>
<p class=3D"MsoNormal">For taking several BMCs and aggregating them into a =
single logical interface that is exposed to the outside world, there are a =
few things happening on that front.=C2=A0 DMTF has been working on an aggre=
gation protocol for Redfish.=C2=A0 However,
 it&#39;s my understanding that their proposal is more directed at the clie=
nt level, as opposed to within a single &quot;system&quot;.<u></u><u></u></=
p>
</div>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I just recently joined the community, but I&#39;ve b=
een thinking about how a proxy layer could merge two Redfish services toget=
her.=C2=A0 Since Redfish is fairly strongly typed and has a well defined me=
chanism for OEM extensions, this should be
 pretty generally applicable.=C2=A0 I am planning on=C2=A0having a white pa=
per on the issue sometime after the holidays.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Another thing to note, recently DMTF released a spec=
 for running a binary Redfish over PLDM called RDE.=C2=A0 That might be a u=
seful way of tying all these concepts together.=C2=A0=C2=A0<u></u><u></u></=
p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I&#39;d be curious about your thoughts and use cases=
 here.=C2=A0 Would either PLDM or Redfish fit your use case?<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Richard<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">*I&#39;ve heard of some proposals that run a network=
 interface over PCIe.=C2=A0 I don&#39;t know enough about PCIe to know if t=
his is a good idea.<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani &lt;<a=
 href=3D"mailto:neladk@microsoft.com" target=3D"_blank">neladk@microsoft.co=
m</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin:5pt 0i=
n 5pt 4.8pt">
<div>
<div>
<p class=3D"MsoNormal">Are there any standards in managing heterogeneous sy=
stems? For example in a rack if there is a compute node( with its own BMC) =
and storage node( with its own BMC) connected using
 a PCIe switch.=C2=A0 How these two BMC represented as one system ? =C2=A0a=
re there any standards for BMC =E2=80=93 BMC communication?
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Neeraj<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
</blockquote>
</blockquote>
</div>
</div>

</blockquote></div>

--0000000000006c93cb0599873b97--
