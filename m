Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C7136332
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 23:22:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v0wl3W6zzDqbt
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 09:22:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=rhanley@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Bi+gJxKX; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v0vq29D2zDqb0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 09:21:41 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id y19so6395172lfl.9
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jan 2020 14:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qUYZUyYlfTbzzizvVd33hwzmYPcqZLMT4JhoI75SxIo=;
 b=Bi+gJxKXdInZqQasJSZmjnVTCBlxmXfdgw8F6gUn2IP00hEVrd4f+FY44VTgJn7EW2
 siJCa28VIkckc71kvlTJky4GRwymZfMuISDNqarxpW1msTk03H3Vvoisl7k8+NvijxKr
 BJjpfDc6BtAVvVovRhlHz9jb5wMv6UI7A+MMAGE/RTOxaouG8T2ZOfjxGQJEqJORq7wx
 7zhNwAmhZfrD3bulqFzNEk9wibWxnq+t0tNduJCSW58xkybXG/ZFK0pnmbpCQomfbvZ3
 43M2gMnfeyH2jtlPS3VbmdV99N+E2BFiIAWoffxZH4xqKTVzBKYw527LPp1YHVJjACdl
 h6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qUYZUyYlfTbzzizvVd33hwzmYPcqZLMT4JhoI75SxIo=;
 b=Xa0L7mbUW+J7dLBjBFFB/vXs+idIUGg1bkwX3n3+v2PQd4csMo89OTGIkKOrzkyZ7r
 v7lbE8EKZjnUAHsN7LqSe4IAz++c3CdIBQf/Gu9R8EyyyW9FcqCF1ZQ4zpi92p4xkzmO
 V/0+lRkLDIAX+JUEAr2I/E6bpEZFInkuZQ1FBypdKf9tdip26W9MzlQNMfXTTOcb9b96
 twPYQ8oFrpCcT7oaqWjYZKDhQHTVH3zIw/eYdfI0E+BIs+ePKpc2cE1d642h0ceUrGv0
 8qVYtoG/FjuyBI1EwnCX2JAvJqfkWbL6e7rmb4rIIZawREC9fiKR/F0RQ8phkTCDswCF
 +YPg==
X-Gm-Message-State: APjAAAVHOoMClNRJ95cJ/XVfeO57fm0DKizcVFnYu6ubuXCnnbcqsGqO
 smqti3n/otpzQkDc6hEqKjqkK3FaqTsvfUNEj8w1Gw==
X-Google-Smtp-Source: APXvYqzhJWiGtipkRROW8SYvZN5NoTyljFJ+odvkcjm4AOBW1LviMJ97pTpMTeX9mffNu4ozf94VusvamvaRh3hBcuE=
X-Received: by 2002:a05:6512:48c:: with SMTP id v12mr37218lfq.56.1578608497078; 
 Thu, 09 Jan 2020 14:21:37 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
 <cb3fe45e-72b8-9910-9dda-b9127bf74fdc@linux.vnet.ibm.com>
 <DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <21b9654b-1e40-804b-a607-e156c848ad85@linux.vnet.ibm.com>
 <DM6PR21MB13887E6D80993E771E217B0BC8550@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com>
 <f487171c-18e3-ee90-6cf8-13f98f04c919@linux.vnet.ibm.com>
In-Reply-To: <f487171c-18e3-ee90-6cf8-13f98f04c919@linux.vnet.ibm.com>
From: Richard Hanley <rhanley@google.com>
Date: Thu, 9 Jan 2020 14:21:25 -0800
Message-ID: <CAH1kD+a-DtmgbeyE_OyW6uNr9kja=Fe38Lp9oXxdOzFF6RbuoQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: Managing heterogeneous systems
To: vishwa <vishwa@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000b57fa4059bbc6e69"
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
 Neeraj Ladkani <neladk@microsoft.com>,
 "vikantan@in.ibm.com" <vikantan@in.ibm.com>,
 "kusripat@in.ibm.com" <kusripat@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b57fa4059bbc6e69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm going to resurrect this thread for the new year.

It sounds like there is a decent need for some type of aggregator.  Would
anyone be interested in setting up a meeting to try and synthesize our use
cases into some broadly applicable requirements?

I'm located on the West Coast, but I have a pretty flexible schedule for
other time zones next week.

Some topics for us to discuss (either in a meeting or offline) include:

1) Layer 2/3 discovery and negotiation
2) Caching, proxy, and consistency requirements
3) Target hardware, performance requirements, and scale of aggregation
4) Tooling and infrastructure improvements needed to support an aggregator
5) Amount of configuration and knowledge an aggregator needs to know a
priori.

Any ideas on what else we can cover?  Is there a preferred format or medium
that would work best to gather these higher level requirements?

Regards,
Richard

On Thu, Dec 19, 2019 at 2:17 AM vishwa <vishwa@linux.vnet.ibm.com> wrote:

> Richard,
>
> Thanks for putting it together.
> On 12/13/19 1:32 AM, Richard Hanley wrote:
>
> In our case we are working to migrate away from IPMI to Redfish.  Most of
> the solutions I've been thinking about have leaned pretty heavily into
> that.
>
> In my mind I've sliced this project up into a few different areas.
>
> *Merging/Transforming Redfish Resources*
> Let's say that there are several Redfish services.  They will have
> collections of Systems, Chassis, and Managers that need to be merged.  In
> the simplest uses this would be just an HTTP proxy cache with some URL
> cleaning.
>
> However, this could end up being a pretty deep merge in cases where some
> resources are split across multiple management domains.  Memory errors
> being on one node, but the temperature sensor being on a separate node is=
 a
> good example. Another example would be the "ContainedBy" link.  These lin=
ks
> might reach across different BMC boundaries, and would need to be inserte=
d
> by the primary node.
>
> *Aggregating Services and Actions*
> This is where I think the DMTF proposals for Redfish aggregation (located
> here
> <https://members.dmtf.org/apps/org/workgroup/redfish/document.php?documen=
t_id=3D91811>)
> provide the most insight.  My reading of this proposal is that an
> aggregation service would be used to tie actions together.  For example,
> there may be individual chassis reset action embedded in the chassis
> resources, and then aggregated action for a full reset.
>
> DMTF seems to be leaving the arbiter of the aggregation up to the
> implementation.  I'd imagine that some implementations would provide a
> static aggregation service, while others would allow clients to create
> their own dynamic aggregates.
>
> *Discovery, Negotiation, and Error Recovery*
> This is an area where I'd like to hear more about your requirements,
> Vishwa.  Would you expect the BMC cluster to be hot-swappable?  Is there =
a
> particular reason that it has to be peer to peer? What kind of error
> recovery should be supported when a node fails?
>
> At a high level, the idea that has been suggested internally is to have a
> designated master node at install time.  That node would discover any oth=
er
> Redfish services on the LAN, and begin aggregating them.  The master node
> would keep any in memory cache of the other services, and reload resource=
s
> on demand.  If a node goes down, then there error is propagated using HTT=
P
> return codes.  If the master node goes down, then the entire aggregate wi=
ll
> go down.  In theory a client could talk to individual nodes if it needed =
to.
>
> Case-1:
> .......
>
> Consider a hypothetical case where I have 4 compute nodes, each having BM=
C
> in it and that BMC is responsible for initiating power-on and other
> services for that node / getting the debug data out of that node / etc...
>
> We would want an external Management Console(MC) to manage this rack.
> Instead of going to 4 nodes separately, MC can ask 1 BMC that I am callin=
g
> as "Point Of Contact" BMC / Primary BMC for that rack. It is the job of
> that BMC to do whatever is needed to return the result.
>
> Similarly, when the POC goes down, we would need another POC.
>
> I believe, Redfish discovery can be used to discover each BMCs. But how
> does the heart beat work between discovered BMCs ?
> Also, when the POC goes down, how can we sense that and make some other
> BMC as POC using Redfish framework ?
>
>
> Case-2:
> .......
>
> I have a control node that is housing 2 BMCs. One can be Primary and othe=
r
> can be Slave. Each BMC has the complete view of the whole systems.
>
> I am assuming, we could still discover the other BMC using Redfish.. But
> again, how do we exchange heartbeat and do failover operations ?
>
> Thanks,
>
> !! Vishwa !!
>
> * Authentication and Authorization*
> This is an area where I think Redfish is a little hands off.  In an ideal
> world ACLs could be setup without proliferating username/passwords across
> nodes.  As an aside, we've been thinking about how to use Redfish without
> any usernames or passwords.  By using a combination of certificates and
> authorization tokens it should be possible to extend a security zone to a
> small cluster of BMCs.
>
> Regards,
> Richard
>
> On Wed, Dec 11, 2019 at 11:33 PM Neeraj Ladkani <neladk@microsoft.com>
> wrote:
>
>> Sure, how do we want to enable BMC-BMC communication? Standard
>> redfish/IPMI ?
>>
>>
>>
>> Neeraj
>>
>>
>>
>>
>>
>> *From:* vishwa <vishwa@linux.vnet.ibm.com>
>> *Sent:* Wednesday, December 11, 2019 10:59 PM
>> *To:* Neeraj Ladkani <neladk@microsoft.com>
>> *Cc:* openbmc@lists.ozlabs.org; sgundura@in.ibm.com; kusripat@in.ibm.com=
;
>> shahjsha@in.ibm.com; vikantan@in.ibm.com; Richard Hanley <
>> rhanley@google.com>
>> *Subject:* Re: [EXTERNAL] Re: Managing heterogeneous systems
>>
>>
>>
>> On 12/10/19 3:20 PM, Neeraj Ladkani wrote:
>>
>> Great discussion.
>>
>>
>>
>> The problem is not physical interface as they can communicate using LAN.
>> The problem is entity binding as one compute node can be connected to 1 =
or
>> more storage nodes. How can we have one view of system from operational
>> perspective? Power on/off, SEL logs, telemetry?
>>
>>
>>
>>
>> Correct. This is where I mentioned about "Primary BMC acting as Point Of
>> Contact" for external requests.
>> Depending on how we want to service the request, we could orchestrate
>> that via PoC BMC or respond to external requesters on where they can get
>> the data and they connect to 'em directly.
>>
>>
>> !! Vishwa !!
>>
>>
>>
>> Some of problems :
>>
>>
>>
>>    1. Power operations : Power/resets/ need to be coordinated in all
>>    nodes in a system
>>    2. Telemetry : OS runs only on head node so if there are requests to
>>    read telemetry, it should get telemetry ( SEL logs, Sensor Values ) f=
rom
>>    all the nodes.
>>    3. Firmware Update
>>    4. RAS: Memory errors are logged by UEFI SMM in to head node but
>>    corresponding DIMM temperature , inlet temperature are logged on seco=
ndary
>>    node which are not mapped.
>>
>>
>>
>>
>>
>> I have been exploring couple of routes
>>
>>
>>
>>    1. LUN  discovery and routing: this is similar to IPMI but I am
>>    working on architecture to extend this to support multiple LUNs and r=
oute
>>    them from Head node. ( we would need LUN routing over LAN )
>>    2. Redfish hierarchy for systems
>>
>>    "Systems": {
>>
>>         "@odata.id": "/redfish/v1/Systems"
>>
>>     },
>>
>>     "Chassis": {
>>
>>         "@odata.id": "/redfish/v1/Chassis"
>>
>>     },
>>
>>     "Managers": {
>>
>>         "@odata.id": "/redfish/v1/Managers"
>>
>>     },
>>
>>     "AccountService": {
>>
>>         "@odata.id": "/redfish/v1/AccountService"
>>
>>     },
>>
>>     "SessionService": {
>>
>>         "@odata.id": "/redfish/v1/SessionService"
>>
>>     },
>>
>>     "Links": {
>>
>>         "Sessions": {
>>
>>             "@odata.id": "/redfish/v1/SessionService/Sessions"
>>
>>         }
>>
>> 3.  Custom Messaging over LAN ( PubSub)
>>
>>
>>
>> I am also working on a whitepaper on same area J.  Happy to work with
>> you guys if you have any ideas on how can we standardize this.
>>
>>
>>
>> Neeraj
>>
>>
>>
>> *From:* vishwa <vishwa@linux.vnet.ibm.com> <vishwa@linux.vnet.ibm.com>
>> *Sent:* Tuesday, December 10, 2019 1:00 AM
>> *To:* Richard Hanley <rhanley@google.com> <rhanley@google.com>; Neeraj
>> Ladkani <neladk@microsoft.com> <neladk@microsoft.com>
>> *Cc:* openbmc@lists.ozlabs.org; sgundura@in.ibm.com; kusripat@in.ibm.com=
;
>> shahjsha@in.ibm.com; vikantan@in.ibm.com
>> *Subject:* [EXTERNAL] Re: Managing heterogeneous systems
>>
>>
>>
>> Hi Richard / Neeraj,
>>
>> Thanks for bringing this up. It's one of the interesting topic for IBM.
>>
>> Some of the thoughts here.....
>>
>> When we have multiple BMCs as part of a single system, then there are 3
>> main parts into it.
>>
>> 1/. Discovering the peer BMCs and role assignment
>> 2/. Monitoring the existence of peer BMCs - heartbeat
>> 3/. In the event of loosing the master, detect so using #2 and then
>> reassign the role
>>
>> Depending on how we want to establish the roles, we could have
>> Single-Master, Many-slave or Multi-Master, Multi-Slave. etc
>>
>> One of the team here is trying to do a POC for Multi BMC architecture an=
d
>> is still in the very beginning stage.
>> The team is currently studying/evaluating the available solution -
>> Corosync / Heartbeat / Pacemaker".
>> Corosync works nice with the clusters, but we need to see if we can trim
>> it down for BMC.
>>
>> If we can not use corosync for some reason, then need to see if we can
>> use the discovery using PLDM ( probably use the terminus IDs )
>> and come up with custom rules for assigning Master-Slave roles.
>>
>> If we choose to have Single-Master and Many-Slave, we could have that
>> Single-Master as an entity acting as a Point of Contact for external
>> request and then could orchestrate with the needed BMCs internally to ge=
t
>> the job done
>>
>> I will be happy to know if there are alternatives that suit BMC kind of
>> an architecture
>>
>> !! Vishwa !!
>>
>> On 12/10/19 4:32 AM, Richard Hanley wrote:
>>
>> Hi Neeraj,
>>
>>
>>
>> This is an open question that I've been looking into as well.
>>
>>
>>
>> For BMC to BMC communication there are a few options.
>>
>>    1. If you have network connectivity you can communicate using Redfish=
.
>>    2. If you only have a PCIe connection, you'll have to use either the
>>    inband connection or the side band I2C*.  PLDM and MCTP are protocols=
 that
>>    defined to handle this use case, although I'm not sure if the OpenBMC
>>    implementations have been used in production.
>>    3. There is always IPMI, which has its own pros/cons.
>>
>> For taking several BMCs and aggregating them into a single logical
>> interface that is exposed to the outside world, there are a few things
>> happening on that front.  DMTF has been working on an aggregation protoc=
ol
>> for Redfish.  However, it's my understanding that their proposal is more
>> directed at the client level, as opposed to within a single "system".
>>
>>
>>
>> I just recently joined the community, but I've been thinking about how a
>> proxy layer could merge two Redfish services together.  Since Redfish is
>> fairly strongly typed and has a well defined mechanism for OEM extension=
s,
>> this should be pretty generally applicable.  I am planning on having a
>> white paper on the issue sometime after the holidays.
>>
>>
>>
>> Another thing to note, recently DMTF released a spec for running a binar=
y
>> Redfish over PLDM called RDE.  That might be a useful way of tying all
>> these concepts together.
>>
>>
>>
>> I'd be curious about your thoughts and use cases here.  Would either PLD=
M
>> or Redfish fit your use case?
>>
>>
>>
>> Regards,
>>
>> Richard
>>
>>
>>
>> *I've heard of some proposals that run a network interface over PCIe.  I
>> don't know enough about PCIe to know if this is a good idea.
>>
>>
>>
>> On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani <neladk@microsoft.com>
>> wrote:
>>
>> Are there any standards in managing heterogeneous systems? For example i=
n
>> a rack if there is a compute node( with its own BMC) and storage node( w=
ith
>> its own BMC) connected using a PCIe switch.  How these two BMC represent=
ed
>> as one system ?  are there any standards for BMC =E2=80=93 BMC communica=
tion?
>>
>>
>>
>>
>>
>> Neeraj
>>
>>
>>
>>

--000000000000b57fa4059bbc6e69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m going to resurrect=C2=A0this thread for the new ye=
ar.<div><br></div><div>It sounds like there is a decent need for some type =
of aggregator.=C2=A0 Would anyone be interested in setting up a meeting to =
try and synthesize our use cases into some broadly applicable=C2=A0requirem=
ents?</div><div><br></div><div>I&#39;m located on the West Coast, but I hav=
e a pretty flexible schedule for other=C2=A0time zones next week.</div><div=
><br></div><div>Some topics for us to discuss (either in a meeting or offli=
ne) include:</div><div><br></div><div>1) Layer 2/3 discovery and negotiatio=
n</div><div>2) Caching, proxy, and consistency=C2=A0requirements</div><div>=
3) Target hardware, performance requirements, and scale of aggregation</div=
><div>4) Tooling and infrastructure improvements needed to support an aggre=
gator</div><div>5) Amount of configuration and knowledge an aggregator need=
s to know a priori.</div><div><br></div><div>Any ideas on what else we can =
cover?=C2=A0 Is there a preferred=C2=A0format or medium that would work bes=
t to gather these higher level=C2=A0requirements?</div><div><br></div><div>=
</div><div>Regards,</div><div>Richard</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2019 at 2:17 AM =
vishwa &lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.i=
bm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Richard, <br>
    </p>
    <p>Thanks for putting it together.<br>
    </p>
    <div>On 12/13/19 1:32 AM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">In our case we are working to migrate away from
        IPMI to Redfish.=C2=A0 Most of the solutions I&#39;ve been thinking=
 about
        have leaned pretty heavily into that.
        <div><br>
        </div>
        <div>In my mind I&#39;ve sliced this project up into a few differen=
t
          areas.
          <div><br>
          </div>
          <div><b>Merging/Transforming Redfish Resources</b></div>
          <div>Let&#39;s say that there are several Redfish services.=C2=A0=
 They
            will have collections of Systems, Chassis, and Managers
            that=C2=A0need to be merged.=C2=A0 In the simplest uses this wo=
uld be
            just an HTTP proxy cache with some URL cleaning.</div>
          <div><br>
          </div>
          <div>However, this could end up being a pretty deep merge in
            cases where some resources are split across=C2=A0multiple
            management domains.=C2=A0 Memory errors being on one node, but
            the temperature=C2=A0sensor being on a separate=C2=A0node is a =
good
            example. Another example would be the &quot;ContainedBy&quot; l=
ink.=C2=A0
            These links might reach across different BMC boundaries, and
            would need to be inserted by the primary node.=C2=A0</div>
          <div><br>
          </div>
          <div><b>Aggregating Services and Actions</b></div>
          <div>This is where I think the DMTF proposals for Redfish
            aggregation (located <a href=3D"https://members.dmtf.org/apps/o=
rg/workgroup/redfish/document.php?document_id=3D91811" target=3D"_blank">he=
re</a>) provide
            the most insight.=C2=A0 My reading of this proposal is that an
            aggregation service would be used to tie actions together.=C2=
=A0
            For example, there may be individual chassis reset action
            embedded in the chassis resources, and then aggregated
            action for a full reset.</div>
          <div><br>
          </div>
          <div>DMTF seems to be leaving the arbiter of the aggregation
            up to the implementation.=C2=A0 I&#39;d imagine that some
            implementations would provide a static aggregation service,
            while others would allow clients to create their own dynamic
            aggregates.</div>
          <div><b><br>
            </b></div>
          <div><b>Discovery, Negotiation, and Error Recovery</b></div>
          <div>This is an area where I&#39;d like to hear more about your
            requirements, Vishwa.=C2=A0 Would you expect the BMC cluster to
            be hot-swappable?=C2=A0 Is there a particular reason that it ha=
s
            to be peer to peer? What kind of error recovery should be
            supported when a node fails?=C2=A0</div>
          <div><br>
          </div>
          <div>At a high level, the idea that has been suggested
            internally is to have a designated master node at install
            time.=C2=A0 That node would discover any other Redfish services
            on the LAN, and begin aggregating them.=C2=A0 The master node
            would keep any in memory cache of the other services, and
            reload resources on demand.=C2=A0 If a node goes down, then the=
re
            error is propagated using HTTP return codes.=C2=A0 If the maste=
r
            node goes down, then the entire aggregate will go down.=C2=A0 I=
n
            theory a client could talk to individual nodes if it needed
            to.</div>
          <div><b><br>
            </b></div>
        </div>
      </div>
    </blockquote>
    <p>Case-1:<br>
      .......<br>
    </p>
    <p>Consider a hypothetical case where I have 4 compute nodes, each
      having BMC in it and that BMC is responsible for initiating
      power-on and other services for that node / getting the debug data
      out of that node / etc...</p>
    <p>We would want an external Management Console(MC) to manage this
      rack. Instead of going to 4 nodes separately, MC can ask 1 BMC
      that I am calling as &quot;Point Of Contact&quot; BMC / Primary BMC f=
or that
      rack. It is the job of that BMC to do whatever is needed to return
      the result.</p>
    <p>Similarly, when the POC goes down, we would need another POC.</p>
    <p>I believe, Redfish discovery can be used to discover each BMCs.
      But how does the heart beat work between discovered BMCs ?<br>
      Also, when the POC goes down, how can we sense that and make some
      other BMC as POC using Redfish framework ?</p>
    <p><br>
      Case-2:<br>
      .......</p>
    <p>I have a control node that is housing 2 BMCs. One can be Primary
      and other can be Slave. Each BMC has the complete view of the
      whole systems. <br>
    </p>
    <p>I am assuming, we could still discover the other BMC using
      Redfish.. But again, how do we exchange heartbeat and do failover
      operations ?</p>
    <p>Thanks,</p>
    <p>!! Vishwa !!<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>
          <div><b> Authentication=C2=A0and=C2=A0Authorization</b></div>
        </div>
        <div>This is an area where I think Redfish is a little hands
          off.=C2=A0 In an ideal world ACLs could be setup without
          proliferating username/passwords across nodes.=C2=A0 As an aside,
          we&#39;ve been thinking about how to use Redfish without any
          usernames or passwords.=C2=A0 By using a combination of
          certificates and authorization tokens it should be possible to
          extend a security zone to a small cluster of BMCs.</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Richard</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 11, 2019 at 11:33
          PM Neeraj Ladkani &lt;<a href=3D"mailto:neladk@microsoft.com" tar=
get=3D"_blank">neladk@microsoft.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div lang=3D"EN-US">
            <div>
              <p class=3D"MsoNormal"><span style=3D"color:windowtext">Sure,
                  how do we want to enable BMC-BMC communication?
                  Standard redfish/IPMI ?
                </span></p>
              <p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=
=A0</span></p>
              <p class=3D"MsoNormal"><span style=3D"color:windowtext">Neera=
j</span></p>
              <p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=
=A0</span></p>
              <p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=
=A0</span></p>
              <div>
                <div style=3D"border-right:none;border-bottom:none;border-l=
eft:none;border-top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
                  <p class=3D"MsoNormal"><b><span style=3D"color:windowtext=
">From:</span></b><span style=3D"color:windowtext"> vishwa &lt;<a href=3D"m=
ailto:vishwa@linux.vnet.ibm.com" target=3D"_blank">vishwa@linux.vnet.ibm.co=
m</a>&gt;
                      <br>
                      <b>Sent:</b> Wednesday, December 11, 2019 10:59 PM<br=
>
                      <b>To:</b> Neeraj Ladkani &lt;<a href=3D"mailto:nelad=
k@microsoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt;<br>
                      <b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org=
" target=3D"_blank">openbmc@lists.ozlabs.org</a>;
                      <a href=3D"mailto:sgundura@in.ibm.com" target=3D"_bla=
nk">sgundura@in.ibm.com</a>;
                      <a href=3D"mailto:kusripat@in.ibm.com" target=3D"_bla=
nk">kusripat@in.ibm.com</a>;
                      <a href=3D"mailto:shahjsha@in.ibm.com" target=3D"_bla=
nk">shahjsha@in.ibm.com</a>;
                      <a href=3D"mailto:vikantan@in.ibm.com" target=3D"_bla=
nk">vikantan@in.ibm.com</a>;
                      Richard Hanley &lt;<a href=3D"mailto:rhanley@google.c=
om" target=3D"_blank">rhanley@google.com</a>&gt;<br>
                      <b>Subject:</b> Re: [EXTERNAL] Re: Managing
                      heterogeneous systems</span></p>
                </div>
              </div>
              <p class=3D"MsoNormal">=C2=A0</p>
              <div>
                <p class=3D"MsoNormal">On 12/10/19 3:20 PM, Neeraj Ladkani
                  wrote:</p>
              </div>
              <blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">G=
reat
                    discussion. </span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">T=
he
                    problem is not physical interface as they can
                    communicate using LAN. The problem is entity binding
                    as one compute node can be connected to 1 or more
                    storage nodes. How can we have one view of system
                    from operational perspective? Power on/off, SEL
                    logs, telemetry? </span></p>
              </blockquote>
              <div>
                <p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=
=A0</span></p>
              </div>
              <div>
                <p class=3D"MsoNormal"><span style=3D"color:windowtext"><br=
>
                    Correct. This is where I mentioned about &quot;Primary
                    BMC acting as Point Of Contact&quot; for external
                    requests.<br>
                    Depending on how we want to service the request, we
                    could orchestrate that via PoC BMC or respond to
                    external requesters on where they can get the data
                    and they connect to &#39;em directly.</span></p>
              </div>
              <div>
                <p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span s=
tyle=3D"color:windowtext"><br>
                    !! Vishwa !!</span></p>
              </div>
              <blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">S=
ome
                    of problems :</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    Power operations : Power/resets/ need to be
                    coordinated in all nodes in a system </li>
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    Telemetry : OS runs only on head node so if there
                    are requests to read telemetry, it should get
                    telemetry ( SEL logs, Sensor Values ) from all the
                    nodes.
                  </li>
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    Firmware Update</li>
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    RAS: Memory errors are logged by UEFI SMM in to head
                    node but corresponding DIMM temperature , inlet
                    temperature are logged on secondary node which are
                    not mapped. =C2=A0</li>
                </ol>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">I
                    have been exploring couple of routes
                  </span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    LUN=C2=A0 discovery and routing: this is similar to IPM=
I
                    but I am working on architecture to extend this to
                    support multiple LUNs and route them from Head node.
                    ( we would need LUN routing over LAN )
                  </li>
                  <li style=3D"color:rgb(0,32,96);margin-left:0in">
                    Redfish hierarchy for systems </li>
                </ol>
                <pre><span style=3D"color:black">=C2=A0=C2=A0 &quot;Systems=
&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/Systems&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</spa=
n></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;C=
hassis&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/Chassis&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</spa=
n></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;M=
anagers&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/Managers&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</spa=
n></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;A=
ccountService&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/AccountService&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</spa=
n></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;S=
essionService&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.id" target=3D"_blank">oda=
ta.id</a>&quot;: &quot;/redfish/v1/SessionService&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 },</spa=
n></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0 &quot;L=
inks&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &quot;Sessions&quot;: {</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;@<a href=3D"http://odata.i=
d" target=3D"_blank">odata.id</a>&quot;: &quot;/redfish/v1/SessionService/S=
essions&quot;</span></pre>
                <pre><span style=3D"color:black">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }</span></pre>
                <pre style=3D"margin-left:0.5in"><span>3.<span style=3D"fon=
t:7pt &quot;Times New Roman&quot;">=C2=A0 </span></span><span style=3D"font=
-family:Calibri,sans-serif;color:rgb(0,32,96)">Custom Messaging over LAN ( =
PubSub)</span></pre>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">I
                    am also working on a whitepaper on same area
                  </span><span style=3D"font-family:Wingdings;color:rgb(0,3=
2,96)">J</span><span style=3D"color:rgb(0,32,96)">.=C2=A0 Happy to work wit=
h you
                    guys if you have any ideas on how can we standardize
                    this.
                  </span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">=
=C2=A0</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:rgb(0,32,96)">N=
eeraj</span></p>
                <p class=3D"MsoNormal"><span style=3D"color:windowtext">=C2=
=A0</span></p>
                <div>
                  <div style=3D"border-right:none;border-bottom:none;border=
-left:none;border-top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
                    <p class=3D"MsoNormal"><b><span style=3D"color:windowte=
xt">From:</span></b><span style=3D"color:windowtext"> vishwa
                        <a href=3D"mailto:vishwa@linux.vnet.ibm.com" target=
=3D"_blank">&lt;vishwa@linux.vnet.ibm.com&gt;</a>
                        <br>
                        <b>Sent:</b> Tuesday, December 10, 2019 1:00 AM<br>
                        <b>To:</b> Richard Hanley <a href=3D"mailto:rhanley=
@google.com" target=3D"_blank">&lt;rhanley@google.com&gt;</a>;
                        Neeraj Ladkani
                        <a href=3D"mailto:neladk@microsoft.com" target=3D"_=
blank">&lt;neladk@microsoft.com&gt;</a><br>
                        <b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>;
                        <a href=3D"mailto:sgundura@in.ibm.com" target=3D"_b=
lank">sgundura@in.ibm.com</a>;
                        <a href=3D"mailto:kusripat@in.ibm.com" target=3D"_b=
lank">
                          kusripat@in.ibm.com</a>; <a href=3D"mailto:shahjs=
ha@in.ibm.com" target=3D"_blank">shahjsha@in.ibm.com</a>;
                        <a href=3D"mailto:vikantan@in.ibm.com" target=3D"_b=
lank">vikantan@in.ibm.com</a><br>
                        <b>Subject:</b> [EXTERNAL] Re: Managing
                        heterogeneous systems</span></p>
                  </div>
                </div>
                <p class=3D"MsoNormal">=C2=A0</p>
                <p>Hi Richard / Neeraj,</p>
                <p>Thanks for bringing this up. It&#39;s one of the
                  interesting topic for IBM.</p>
                <p>Some of the thoughts here.....</p>
                <p>When we have multiple BMCs as part of a single
                  system, then there are 3 main parts into it.</p>
                <p>1/. Discovering the peer BMCs and role assignment<br>
                  2/. Monitoring the existence of peer BMCs - heartbeat
                  <br>
                  3/. In the event of loosing the master, detect so
                  using #2 and then reassign the role</p>
                <p>Depending on how we want to establish the roles, we
                  could have Single-Master, Many-slave or Multi-Master,
                  Multi-Slave. etc</p>
                <p>One of the team here is trying to do a POC for Multi
                  BMC architecture and is still in the very beginning
                  stage.
                  <br>
                  The team is currently studying/evaluating the
                  available solution - Corosync / Heartbeat /
                  Pacemaker&quot;.<br>
                  Corosync works nice with the clusters, but we need to
                  see if we can trim it down for BMC.<br>
                  <br>
                  If we can not use corosync for some reason, then need
                  to see if we can use the discovery using PLDM (
                  probably use the terminus IDs )<br>
                  and come up with custom rules for assigning
                  Master-Slave roles.</p>
                <p>If we choose to have Single-Master and Many-Slave, we
                  could have that Single-Master as an entity acting as a
                  Point of Contact for external request and then could
                  orchestrate with the needed BMCs internally to get the
                  job done</p>
                <p>I will be happy to know if there are alternatives
                  that suit BMC kind of an architecture</p>
                <p>!! Vishwa !!</p>
                <div>
                  <p class=3D"MsoNormal">On 12/10/19 4:32 AM, Richard
                    Hanley wrote:</p>
                </div>
                <blockquote style=3D"margin-top:5pt;margin-bottom:5pt">
                  <div>
                    <p class=3D"MsoNormal">Hi Neeraj, </p>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">This is an open question that
                        I&#39;ve been looking into as well.=C2=A0=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">For BMC to BMC communication
                        there are a few options.</p>
                    </div>
                    <div>
                      <ol start=3D"1" type=3D"1">
                        <li class=3D"MsoNormal">
                          If you have network connectivity you can
                          communicate using Redfish.</li>
                        <li class=3D"MsoNormal">
                          If you only have a PCIe connection, you&#39;ll
                          have to use either the inband connection or
                          the side band I2C*.=C2=A0 PLDM and MCTP are
                          protocols that defined to handle this use
                          case, although I&#39;m not sure if the OpenBMC
                          implementations have been used in production.</li=
>
                        <li class=3D"MsoNormal">
                          There is always IPMI, which has its own
                          pros/cons.</li>
                      </ol>
                      <div>
                        <p class=3D"MsoNormal">For taking several BMCs and
                          aggregating them into a single logical
                          interface that is exposed to the outside
                          world, there are a few things happening on
                          that front.=C2=A0 DMTF has been working on an
                          aggregation protocol for Redfish.=C2=A0 However,
                          it&#39;s my understanding that their proposal is
                          more directed at the client level, as opposed
                          to within a single &quot;system&quot;.</p>
                      </div>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">I just recently joined the
                        community, but I&#39;ve been thinking about how a
                        proxy layer could merge two Redfish services
                        together.=C2=A0 Since Redfish is fairly strongly
                        typed and has a well defined mechanism for OEM
                        extensions, this should be pretty generally
                        applicable.=C2=A0 I am planning on=C2=A0having a wh=
ite
                        paper on the issue sometime after the holidays.</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">Another thing to note,
                        recently DMTF released a spec for running a
                        binary Redfish over PLDM called RDE.=C2=A0 That mig=
ht
                        be a useful way of tying all these concepts
                        together.=C2=A0=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">I&#39;d be curious about your
                        thoughts and use cases here.=C2=A0 Would either PLD=
M
                        or Redfish fit your use case?</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">Regards,</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">Richard</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">=C2=A0</p>
                    </div>
                    <div>
                      <p class=3D"MsoNormal">*I&#39;ve heard of some propos=
als
                        that run a network interface over PCIe.=C2=A0 I don=
&#39;t
                        know enough about PCIe to know if this is a good
                        idea.</p>
                    </div>
                  </div>
                  <p class=3D"MsoNormal">=C2=A0</p>
                  <div>
                    <div>
                      <p class=3D"MsoNormal">On Mon, Dec 9, 2019 at 1:27
                        PM Neeraj Ladkani &lt;<a href=3D"mailto:neladk@micr=
osoft.com" target=3D"_blank">neladk@microsoft.com</a>&gt;
                        wrote:</p>
                    </div>
                    <blockquote style=3D"border-top:none;border-right:none;=
border-bottom:none;border-left:1pt solid rgb(204,204,204);padding:0in 0in 0=
in 6pt;margin:5pt 0in 5pt 4.8pt">
                      <div>
                        <div>
                          <p class=3D"MsoNormal">Are there any standards
                            in managing heterogeneous systems? For
                            example in a rack if there is a compute
                            node( with its own BMC) and storage node(
                            with its own BMC) connected using a PCIe
                            switch.=C2=A0 How these two BMC represented as
                            one system ? =C2=A0are there any standards for
                            BMC =E2=80=93 BMC communication?
                          </p>
                          <p class=3D"MsoNormal">=C2=A0</p>
                          <p class=3D"MsoNormal">=C2=A0</p>
                          <p class=3D"MsoNormal">Neeraj</p>
                          <p class=3D"MsoNormal">=C2=A0</p>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </blockquote>
              </blockquote>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000b57fa4059bbc6e69--
