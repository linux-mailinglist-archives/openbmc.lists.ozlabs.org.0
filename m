Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2437125EBA
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 11:18:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dnsH6dqKzDqW8
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 21:18:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dnrS0BcMzDq6J
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 21:17:58 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBJAHnhr070495
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 05:17:53 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2x04ma6mek-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 05:17:51 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 19 Dec 2019 10:17:25 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Dec 2019 10:17:23 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBJAHK4k42532998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 10:17:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 588A9A405B;
 Thu, 19 Dec 2019 10:17:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C826FA4062;
 Thu, 19 Dec 2019 10:17:18 +0000 (GMT)
Received: from [9.122.210.87] (unknown [9.122.210.87])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Dec 2019 10:17:18 +0000 (GMT)
Subject: Re: [EXTERNAL] Re: Managing heterogeneous systems
To: Richard Hanley <rhanley@google.com>, Neeraj Ladkani <neladk@microsoft.com>
References: <DM6PR21MB13889A7DE46B9DEF6D97959BC8580@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YrfgnLGdiTOao4t7kXDw7494MQM7pxOAZCbEP6i4EVcw@mail.gmail.com>
 <cb3fe45e-72b8-9910-9dda-b9127bf74fdc@linux.vnet.ibm.com>
 <DM6PR21MB13886072C143F07E3CE63ECDC85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
 <21b9654b-1e40-804b-a607-e156c848ad85@linux.vnet.ibm.com>
 <DM6PR21MB13887E6D80993E771E217B0BC8550@DM6PR21MB1388.namprd21.prod.outlook.com>
 <CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 19 Dec 2019 15:47:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------176306A3E9CAFA33E7623F8B"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19121910-0020-0000-0000-00000399D77C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121910-0021-0000-0000-000021F0FF19
Message-Id: <f487171c-18e3-ee90-6cf8-13f98f04c919@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_01:2019-12-17,2019-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912190088
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

This is a multi-part message in MIME format.
--------------176306A3E9CAFA33E7623F8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Richard,

Thanks for putting it together.

On 12/13/19 1:32 AM, Richard Hanley wrote:
> In our case we are working to migrate away from IPMI to Redfish.  Most 
> of the solutions I've been thinking about have leaned pretty heavily 
> into that.
>
> In my mind I've sliced this project up into a few different areas.
>
> *Merging/Transforming Redfish Resources*
> Let's say that there are several Redfish services.  They will have 
> collections of Systems, Chassis, and Managers that need to be merged.  
> In the simplest uses this would be just an HTTP proxy cache with some 
> URL cleaning.
>
> However, this could end up being a pretty deep merge in cases where 
> some resources are split across multiple management domains.  Memory 
> errors being on one node, but the temperature sensor being on a 
> separate node is a good example. Another example would be the 
> "ContainedBy" link. These links might reach across different BMC 
> boundaries, and would need to be inserted by the primary node.
>
> *Aggregating Services and Actions*
> This is where I think the DMTF proposals for Redfish aggregation 
> (located here 
> <https://members.dmtf.org/apps/org/workgroup/redfish/document.php?document_id=91811>) 
> provide the most insight.  My reading of this proposal is that an 
> aggregation service would be used to tie actions together. For 
> example, there may be individual chassis reset action embedded in the 
> chassis resources, and then aggregated action for a full reset.
>
> DMTF seems to be leaving the arbiter of the aggregation up to the 
> implementation.  I'd imagine that some implementations would provide a 
> static aggregation service, while others would allow clients to create 
> their own dynamic aggregates.
> *
> *
> *Discovery, Negotiation, and Error Recovery*
> This is an area where I'd like to hear more about your requirements, 
> Vishwa.  Would you expect the BMC cluster to be hot-swappable?  Is 
> there a particular reason that it has to be peer to peer? What kind of 
> error recovery should be supported when a node fails?
>
> At a high level, the idea that has been suggested internally is to 
> have a designated master node at install time.  That node would 
> discover any other Redfish services on the LAN, and begin aggregating 
> them.  The master node would keep any in memory cache of the other 
> services, and reload resources on demand.  If a node goes down, then 
> there error is propagated using HTTP return codes.  If the master node 
> goes down, then the entire aggregate will go down.  In theory a client 
> could talk to individual nodes if it needed to.
> *
> *

Case-1:
.......

Consider a hypothetical case where I have 4 compute nodes, each having 
BMC in it and that BMC is responsible for initiating power-on and other 
services for that node / getting the debug data out of that node / etc...

We would want an external Management Console(MC) to manage this rack. 
Instead of going to 4 nodes separately, MC can ask 1 BMC that I am 
calling as "Point Of Contact" BMC / Primary BMC for that rack. It is the 
job of that BMC to do whatever is needed to return the result.

Similarly, when the POC goes down, we would need another POC.

I believe, Redfish discovery can be used to discover each BMCs. But how 
does the heart beat work between discovered BMCs ?
Also, when the POC goes down, how can we sense that and make some other 
BMC as POC using Redfish framework ?


Case-2:
.......

I have a control node that is housing 2 BMCs. One can be Primary and 
other can be Slave. Each BMC has the complete view of the whole systems.

I am assuming, we could still discover the other BMC using Redfish.. But 
again, how do we exchange heartbeat and do failover operations ?

Thanks,

!! Vishwa !!

> *Authentication and Authorization*
> This is an area where I think Redfish is a little hands off.  In an 
> ideal world ACLs could be setup without proliferating 
> username/passwords across nodes.  As an aside, we've been thinking 
> about how to use Redfish without any usernames or passwords.  By using 
> a combination of certificates and authorization tokens it should be 
> possible to extend a security zone to a small cluster of BMCs.
>
> Regards,
> Richard
>
> On Wed, Dec 11, 2019 at 11:33 PM Neeraj Ladkani <neladk@microsoft.com 
> <mailto:neladk@microsoft.com>> wrote:
>
>     Sure, how do we want to enable BMC-BMC communication? Standard
>     redfish/IPMI ?
>
>     Neeraj
>
>     *From:*vishwa <vishwa@linux.vnet.ibm.com
>     <mailto:vishwa@linux.vnet.ibm.com>>
>     *Sent:* Wednesday, December 11, 2019 10:59 PM
>     *To:* Neeraj Ladkani <neladk@microsoft.com
>     <mailto:neladk@microsoft.com>>
>     *Cc:* openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>;
>     sgundura@in.ibm.com <mailto:sgundura@in.ibm.com>;
>     kusripat@in.ibm.com <mailto:kusripat@in.ibm.com>;
>     shahjsha@in.ibm.com <mailto:shahjsha@in.ibm.com>;
>     vikantan@in.ibm.com <mailto:vikantan@in.ibm.com>; Richard Hanley
>     <rhanley@google.com <mailto:rhanley@google.com>>
>     *Subject:* Re: [EXTERNAL] Re: Managing heterogeneous systems
>
>     On 12/10/19 3:20 PM, Neeraj Ladkani wrote:
>
>         Great discussion.
>
>         The problem is not physical interface as they can communicate
>         using LAN. The problem is entity binding as one compute node
>         can be connected to 1 or more storage nodes. How can we have
>         one view of system from operational perspective? Power on/off,
>         SEL logs, telemetry?
>
>
>     Correct. This is where I mentioned about "Primary BMC acting as
>     Point Of Contact" for external requests.
>     Depending on how we want to service the request, we could
>     orchestrate that via PoC BMC or respond to external requesters on
>     where they can get the data and they connect to 'em directly.
>
>
>     !! Vishwa !!
>
>         Some of problems :
>
>          1. Power operations : Power/resets/ need to be coordinated in
>             all nodes in a system
>          2. Telemetry : OS runs only on head node so if there are
>             requests to read telemetry, it should get telemetry ( SEL
>             logs, Sensor Values ) from all the nodes.
>          3. Firmware Update
>          4. RAS: Memory errors are logged by UEFI SMM in to head node
>             but corresponding DIMM temperature , inlet temperature are
>             logged on secondary node which are not mapped.
>
>         I have been exploring couple of routes
>
>          1. LUN  discovery and routing: this is similar to IPMI but I
>             am working on architecture to extend this to support
>             multiple LUNs and route them from Head node. ( we would
>             need LUN routing over LAN )
>          2. Redfish hierarchy for systems
>
>            "Systems": {
>
>                 "@odata.id <http://odata.id>": "/redfish/v1/Systems"
>
>             },
>
>             "Chassis": {
>
>                 "@odata.id <http://odata.id>": "/redfish/v1/Chassis"
>
>             },
>
>             "Managers": {
>
>                 "@odata.id <http://odata.id>": "/redfish/v1/Managers"
>
>             },
>
>             "AccountService": {
>
>                 "@odata.id <http://odata.id>":
>         "/redfish/v1/AccountService"
>
>             },
>
>             "SessionService": {
>
>                 "@odata.id <http://odata.id>":
>         "/redfish/v1/SessionService"
>
>             },
>
>             "Links": {
>
>                 "Sessions": {
>
>                     "@odata.id <http://odata.id>":
>         "/redfish/v1/SessionService/Sessions"
>
>                 }
>
>         3.Custom Messaging over LAN ( PubSub)
>
>         I am also working on a whitepaper on same area J.  Happy to
>         work with you guys if you have any ideas on how can we
>         standardize this.
>
>         Neeraj
>
>         *From:*vishwa <vishwa@linux.vnet.ibm.com>
>         <mailto:vishwa@linux.vnet.ibm.com>
>         *Sent:* Tuesday, December 10, 2019 1:00 AM
>         *To:* Richard Hanley <rhanley@google.com>
>         <mailto:rhanley@google.com>; Neeraj Ladkani
>         <neladk@microsoft.com> <mailto:neladk@microsoft.com>
>         *Cc:* openbmc@lists.ozlabs.org
>         <mailto:openbmc@lists.ozlabs.org>; sgundura@in.ibm.com
>         <mailto:sgundura@in.ibm.com>; kusripat@in.ibm.com
>         <mailto:kusripat@in.ibm.com>; shahjsha@in.ibm.com
>         <mailto:shahjsha@in.ibm.com>; vikantan@in.ibm.com
>         <mailto:vikantan@in.ibm.com>
>         *Subject:* [EXTERNAL] Re: Managing heterogeneous systems
>
>         Hi Richard / Neeraj,
>
>         Thanks for bringing this up. It's one of the interesting topic
>         for IBM.
>
>         Some of the thoughts here.....
>
>         When we have multiple BMCs as part of a single system, then
>         there are 3 main parts into it.
>
>         1/. Discovering the peer BMCs and role assignment
>         2/. Monitoring the existence of peer BMCs - heartbeat
>         3/. In the event of loosing the master, detect so using #2 and
>         then reassign the role
>
>         Depending on how we want to establish the roles, we could have
>         Single-Master, Many-slave or Multi-Master, Multi-Slave. etc
>
>         One of the team here is trying to do a POC for Multi BMC
>         architecture and is still in the very beginning stage.
>         The team is currently studying/evaluating the available
>         solution - Corosync / Heartbeat / Pacemaker".
>         Corosync works nice with the clusters, but we need to see if
>         we can trim it down for BMC.
>
>         If we can not use corosync for some reason, then need to see
>         if we can use the discovery using PLDM ( probably use the
>         terminus IDs )
>         and come up with custom rules for assigning Master-Slave roles.
>
>         If we choose to have Single-Master and Many-Slave, we could
>         have that Single-Master as an entity acting as a Point of
>         Contact for external request and then could orchestrate with
>         the needed BMCs internally to get the job done
>
>         I will be happy to know if there are alternatives that suit
>         BMC kind of an architecture
>
>         !! Vishwa !!
>
>         On 12/10/19 4:32 AM, Richard Hanley wrote:
>
>             Hi Neeraj,
>
>             This is an open question that I've been looking into as well.
>
>             For BMC to BMC communication there are a few options.
>
>              1. If you have network connectivity you can communicate
>                 using Redfish.
>              2. If you only have a PCIe connection, you'll have to use
>                 either the inband connection or the side band I2C*. 
>                 PLDM and MCTP are protocols that defined to handle
>                 this use case, although I'm not sure if the OpenBMC
>                 implementations have been used in production.
>              3. There is always IPMI, which has its own pros/cons.
>
>             For taking several BMCs and aggregating them into a single
>             logical interface that is exposed to the outside world,
>             there are a few things happening on that front.  DMTF has
>             been working on an aggregation protocol for Redfish. 
>             However, it's my understanding that their proposal is more
>             directed at the client level, as opposed to within a
>             single "system".
>
>             I just recently joined the community, but I've been
>             thinking about how a proxy layer could merge two Redfish
>             services together.  Since Redfish is fairly strongly typed
>             and has a well defined mechanism for OEM extensions, this
>             should be pretty generally applicable.  I am planning
>             on having a white paper on the issue sometime after the
>             holidays.
>
>             Another thing to note, recently DMTF released a spec for
>             running a binary Redfish over PLDM called RDE.  That might
>             be a useful way of tying all these concepts together.
>
>             I'd be curious about your thoughts and use cases here. 
>             Would either PLDM or Redfish fit your use case?
>
>             Regards,
>
>             Richard
>
>             *I've heard of some proposals that run a network interface
>             over PCIe.  I don't know enough about PCIe to know if this
>             is a good idea.
>
>             On Mon, Dec 9, 2019 at 1:27 PM Neeraj Ladkani
>             <neladk@microsoft.com <mailto:neladk@microsoft.com>> wrote:
>
>                 Are there any standards in managing heterogeneous
>                 systems? For example in a rack if there is a compute
>                 node( with its own BMC) and storage node( with its own
>                 BMC) connected using a PCIe switch.  How these two BMC
>                 represented as one system ?  are there any standards
>                 for BMC – BMC communication?
>
>                 Neeraj
>

--------------176306A3E9CAFA33E7623F8B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Richard, <br>
    </p>
    <p>Thanks for putting it together.<br>
    </p>
    <div class="moz-cite-prefix">On 12/13/19 1:32 AM, Richard Hanley
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">In our case we are working to migrate away from
        IPMI to Redfish.  Most of the solutions I've been thinking about
        have leaned pretty heavily into that.
        <div><br>
        </div>
        <div>In my mind I've sliced this project up into a few different
          areas.
          <div><br>
          </div>
          <div><b>Merging/Transforming Redfish Resources</b></div>
          <div>Let's say that there are several Redfish services.  They
            will have collections of Systems, Chassis, and Managers
            that need to be merged.  In the simplest uses this would be
            just an HTTP proxy cache with some URL cleaning.</div>
          <div><br>
          </div>
          <div>However, this could end up being a pretty deep merge in
            cases where some resources are split across multiple
            management domains.  Memory errors being on one node, but
            the temperature sensor being on a separate node is a good
            example. Another example would be the "ContainedBy" link. 
            These links might reach across different BMC boundaries, and
            would need to be inserted by the primary node. </div>
          <div><br>
          </div>
          <div><b>Aggregating Services and Actions</b></div>
          <div>This is where I think the DMTF proposals for Redfish
            aggregation (located <a
href="https://members.dmtf.org/apps/org/workgroup/redfish/document.php?document_id=91811"
              target="_blank" moz-do-not-send="true">here</a>) provide
            the most insight.  My reading of this proposal is that an
            aggregation service would be used to tie actions together. 
            For example, there may be individual chassis reset action
            embedded in the chassis resources, and then aggregated
            action for a full reset.</div>
          <div><br>
          </div>
          <div>DMTF seems to be leaving the arbiter of the aggregation
            up to the implementation.  I'd imagine that some
            implementations would provide a static aggregation service,
            while others would allow clients to create their own dynamic
            aggregates.</div>
          <div><b><br>
            </b></div>
          <div><b>Discovery, Negotiation, and Error Recovery</b></div>
          <div>This is an area where I'd like to hear more about your
            requirements, Vishwa.  Would you expect the BMC cluster to
            be hot-swappable?  Is there a particular reason that it has
            to be peer to peer? What kind of error recovery should be
            supported when a node fails? </div>
          <div><br>
          </div>
          <div>At a high level, the idea that has been suggested
            internally is to have a designated master node at install
            time.  That node would discover any other Redfish services
            on the LAN, and begin aggregating them.  The master node
            would keep any in memory cache of the other services, and
            reload resources on demand.  If a node goes down, then there
            error is propagated using HTTP return codes.  If the master
            node goes down, then the entire aggregate will go down.  In
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
      that I am calling as "Point Of Contact" BMC / Primary BMC for that
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
    <blockquote type="cite"
cite="mid:CAH1kD+YLN37-DHXSZ5RKYa+xmvFSszOf6MxSkHjFC5n6H2GOMg@mail.gmail.com">
      <div dir="ltr">
        <div>
          <div><b> Authentication and Authorization</b></div>
        </div>
        <div>This is an area where I think Redfish is a little hands
          off.  In an ideal world ACLs could be setup without
          proliferating username/passwords across nodes.  As an aside,
          we've been thinking about how to use Redfish without any
          usernames or passwords.  By using a combination of
          certificates and authorization tokens it should be possible to
          extend a security zone to a small cluster of BMCs.</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Richard</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Dec 11, 2019 at 11:33
          PM Neeraj Ladkani &lt;<a href="mailto:neladk@microsoft.com"
            target="_blank" moz-do-not-send="true">neladk@microsoft.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div lang="EN-US">
            <div>
              <p class="MsoNormal"><span style="color:windowtext">Sure,
                  how do we want to enable BMC-BMC communication?
                  Standard redfish/IPMI ?
                </span></p>
              <p class="MsoNormal"><span style="color:windowtext"> </span></p>
              <p class="MsoNormal"><span style="color:windowtext">Neeraj</span></p>
              <p class="MsoNormal"><span style="color:windowtext"> </span></p>
              <p class="MsoNormal"><span style="color:windowtext"> </span></p>
              <div>
                <div
style="border-right:none;border-bottom:none;border-left:none;border-top:1pt
                  solid rgb(225,225,225);padding:3pt 0in 0in">
                  <p class="MsoNormal"><b><span style="color:windowtext">From:</span></b><span
                      style="color:windowtext"> vishwa &lt;<a
                        href="mailto:vishwa@linux.vnet.ibm.com"
                        target="_blank" moz-do-not-send="true">vishwa@linux.vnet.ibm.com</a>&gt;
                      <br>
                      <b>Sent:</b> Wednesday, December 11, 2019 10:59 PM<br>
                      <b>To:</b> Neeraj Ladkani &lt;<a
                        href="mailto:neladk@microsoft.com"
                        target="_blank" moz-do-not-send="true">neladk@microsoft.com</a>&gt;<br>
                      <b>Cc:</b> <a
                        href="mailto:openbmc@lists.ozlabs.org"
                        target="_blank" moz-do-not-send="true">openbmc@lists.ozlabs.org</a>;
                      <a href="mailto:sgundura@in.ibm.com"
                        target="_blank" moz-do-not-send="true">sgundura@in.ibm.com</a>;
                      <a href="mailto:kusripat@in.ibm.com"
                        target="_blank" moz-do-not-send="true">kusripat@in.ibm.com</a>;
                      <a href="mailto:shahjsha@in.ibm.com"
                        target="_blank" moz-do-not-send="true">shahjsha@in.ibm.com</a>;
                      <a href="mailto:vikantan@in.ibm.com"
                        target="_blank" moz-do-not-send="true">vikantan@in.ibm.com</a>;
                      Richard Hanley &lt;<a
                        href="mailto:rhanley@google.com" target="_blank"
                        moz-do-not-send="true">rhanley@google.com</a>&gt;<br>
                      <b>Subject:</b> Re: [EXTERNAL] Re: Managing
                      heterogeneous systems</span></p>
                </div>
              </div>
              <p class="MsoNormal"> </p>
              <div>
                <p class="MsoNormal">On 12/10/19 3:20 PM, Neeraj Ladkani
                  wrote:</p>
              </div>
              <blockquote style="margin-top:5pt;margin-bottom:5pt">
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">Great
                    discussion. </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">The
                    problem is not physical interface as they can
                    communicate using LAN. The problem is entity binding
                    as one compute node can be connected to 1 or more
                    storage nodes. How can we have one view of system
                    from operational perspective? Power on/off, SEL
                    logs, telemetry? </span></p>
              </blockquote>
              <div>
                <p class="MsoNormal"><span style="color:windowtext"> </span></p>
              </div>
              <div>
                <p class="MsoNormal"><span style="color:windowtext"><br>
                    Correct. This is where I mentioned about "Primary
                    BMC acting as Point Of Contact" for external
                    requests.<br>
                    Depending on how we want to service the request, we
                    could orchestrate that via PoC BMC or respond to
                    external requesters on where they can get the data
                    and they connect to 'em directly.</span></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-bottom:12pt"><span
                    style="color:windowtext"><br>
                    !! Vishwa !!</span></p>
              </div>
              <blockquote style="margin-top:5pt;margin-bottom:5pt">
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">Some
                    of problems :</span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <ol style="margin-top:0in" start="1" type="1">
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    Power operations : Power/resets/ need to be
                    coordinated in all nodes in a system </li>
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    Telemetry : OS runs only on head node so if there
                    are requests to read telemetry, it should get
                    telemetry ( SEL logs, Sensor Values ) from all the
                    nodes.
                  </li>
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    Firmware Update</li>
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    RAS: Memory errors are logged by UEFI SMM in to head
                    node but corresponding DIMM temperature , inlet
                    temperature are logged on secondary node which are
                    not mapped.  </li>
                </ol>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">I
                    have been exploring couple of routes
                  </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <ol style="margin-top:0in" start="1" type="1">
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    LUN  discovery and routing: this is similar to IPMI
                    but I am working on architecture to extend this to
                    support multiple LUNs and route them from Head node.
                    ( we would need LUN routing over LAN )
                  </li>
                  <li style="color:rgb(0,32,96);margin-left:0in">
                    Redfish hierarchy for systems </li>
                </ol>
                <pre><span style="color:black">   "Systems": {</span></pre>
                <pre><span style="color:black">        "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/Systems"</span></pre>
                <pre><span style="color:black">    },</span></pre>
                <pre><span style="color:black">    "Chassis": {</span></pre>
                <pre><span style="color:black">        "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/Chassis"</span></pre>
                <pre><span style="color:black">    },</span></pre>
                <pre><span style="color:black">    "Managers": {</span></pre>
                <pre><span style="color:black">        "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/Managers"</span></pre>
                <pre><span style="color:black">    },</span></pre>
                <pre><span style="color:black">    "AccountService": {</span></pre>
                <pre><span style="color:black">        "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/AccountService"</span></pre>
                <pre><span style="color:black">    },</span></pre>
                <pre><span style="color:black">    "SessionService": {</span></pre>
                <pre><span style="color:black">        "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/SessionService"</span></pre>
                <pre><span style="color:black">    },</span></pre>
                <pre><span style="color:black">    "Links": {</span></pre>
                <pre><span style="color:black">        "Sessions": {</span></pre>
                <pre><span style="color:black">            "@<a href="http://odata.id" target="_blank" moz-do-not-send="true">odata.id</a>": "/redfish/v1/SessionService/Sessions"</span></pre>
                <pre><span style="color:black">        }</span></pre>
                <pre style="margin-left:0.5in"><span>3.<span style="font:7pt &quot;Times New Roman&quot;">  </span></span><span style="font-family:Calibri,sans-serif;color:rgb(0,32,96)">Custom Messaging over LAN ( PubSub)</span></pre>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">I
                    am also working on a whitepaper on same area
                  </span><span
                    style="font-family:Wingdings;color:rgb(0,32,96)">J</span><span
                    style="color:rgb(0,32,96)">.  Happy to work with you
                    guys if you have any ideas on how can we standardize
                    this.
                  </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)"> </span></p>
                <p class="MsoNormal"><span style="color:rgb(0,32,96)">Neeraj</span></p>
                <p class="MsoNormal"><span style="color:windowtext"> </span></p>
                <div>
                  <div
style="border-right:none;border-bottom:none;border-left:none;border-top:1pt
                    solid rgb(225,225,225);padding:3pt 0in 0in">
                    <p class="MsoNormal"><b><span
                          style="color:windowtext">From:</span></b><span
                        style="color:windowtext"> vishwa
                        <a href="mailto:vishwa@linux.vnet.ibm.com"
                          target="_blank" moz-do-not-send="true">&lt;vishwa@linux.vnet.ibm.com&gt;</a>
                        <br>
                        <b>Sent:</b> Tuesday, December 10, 2019 1:00 AM<br>
                        <b>To:</b> Richard Hanley <a
                          href="mailto:rhanley@google.com"
                          target="_blank" moz-do-not-send="true">&lt;rhanley@google.com&gt;</a>;
                        Neeraj Ladkani
                        <a href="mailto:neladk@microsoft.com"
                          target="_blank" moz-do-not-send="true">&lt;neladk@microsoft.com&gt;</a><br>
                        <b>Cc:</b> <a
                          href="mailto:openbmc@lists.ozlabs.org"
                          target="_blank" moz-do-not-send="true">openbmc@lists.ozlabs.org</a>;
                        <a href="mailto:sgundura@in.ibm.com"
                          target="_blank" moz-do-not-send="true">sgundura@in.ibm.com</a>;
                        <a href="mailto:kusripat@in.ibm.com"
                          target="_blank" moz-do-not-send="true">
                          kusripat@in.ibm.com</a>; <a
                          href="mailto:shahjsha@in.ibm.com"
                          target="_blank" moz-do-not-send="true">shahjsha@in.ibm.com</a>;
                        <a href="mailto:vikantan@in.ibm.com"
                          target="_blank" moz-do-not-send="true">vikantan@in.ibm.com</a><br>
                        <b>Subject:</b> [EXTERNAL] Re: Managing
                        heterogeneous systems</span></p>
                  </div>
                </div>
                <p class="MsoNormal"> </p>
                <p>Hi Richard / Neeraj,</p>
                <p>Thanks for bringing this up. It's one of the
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
                  Pacemaker".<br>
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
                  <p class="MsoNormal">On 12/10/19 4:32 AM, Richard
                    Hanley wrote:</p>
                </div>
                <blockquote style="margin-top:5pt;margin-bottom:5pt">
                  <div>
                    <p class="MsoNormal">Hi Neeraj, </p>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">This is an open question that
                        I've been looking into as well.  </p>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">For BMC to BMC communication
                        there are a few options.</p>
                    </div>
                    <div>
                      <ol start="1" type="1">
                        <li class="MsoNormal">
                          If you have network connectivity you can
                          communicate using Redfish.</li>
                        <li class="MsoNormal">
                          If you only have a PCIe connection, you'll
                          have to use either the inband connection or
                          the side band I2C*.  PLDM and MCTP are
                          protocols that defined to handle this use
                          case, although I'm not sure if the OpenBMC
                          implementations have been used in production.</li>
                        <li class="MsoNormal">
                          There is always IPMI, which has its own
                          pros/cons.</li>
                      </ol>
                      <div>
                        <p class="MsoNormal">For taking several BMCs and
                          aggregating them into a single logical
                          interface that is exposed to the outside
                          world, there are a few things happening on
                          that front.  DMTF has been working on an
                          aggregation protocol for Redfish.  However,
                          it's my understanding that their proposal is
                          more directed at the client level, as opposed
                          to within a single "system".</p>
                      </div>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">I just recently joined the
                        community, but I've been thinking about how a
                        proxy layer could merge two Redfish services
                        together.  Since Redfish is fairly strongly
                        typed and has a well defined mechanism for OEM
                        extensions, this should be pretty generally
                        applicable.  I am planning on having a white
                        paper on the issue sometime after the holidays.</p>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">Another thing to note,
                        recently DMTF released a spec for running a
                        binary Redfish over PLDM called RDE.  That might
                        be a useful way of tying all these concepts
                        together.  </p>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">I'd be curious about your
                        thoughts and use cases here.  Would either PLDM
                        or Redfish fit your use case?</p>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">Regards,</p>
                    </div>
                    <div>
                      <p class="MsoNormal">Richard</p>
                    </div>
                    <div>
                      <p class="MsoNormal"> </p>
                    </div>
                    <div>
                      <p class="MsoNormal">*I've heard of some proposals
                        that run a network interface over PCIe.  I don't
                        know enough about PCIe to know if this is a good
                        idea.</p>
                    </div>
                  </div>
                  <p class="MsoNormal"> </p>
                  <div>
                    <div>
                      <p class="MsoNormal">On Mon, Dec 9, 2019 at 1:27
                        PM Neeraj Ladkani &lt;<a
                          href="mailto:neladk@microsoft.com"
                          target="_blank" moz-do-not-send="true">neladk@microsoft.com</a>&gt;
                        wrote:</p>
                    </div>
                    <blockquote
style="border-top:none;border-right:none;border-bottom:none;border-left:1pt
                      solid rgb(204,204,204);padding:0in 0in 0in
                      6pt;margin:5pt 0in 5pt 4.8pt">
                      <div>
                        <div>
                          <p class="MsoNormal">Are there any standards
                            in managing heterogeneous systems? For
                            example in a rack if there is a compute
                            node( with its own BMC) and storage node(
                            with its own BMC) connected using a PCIe
                            switch.  How these two BMC represented as
                            one system ?  are there any standards for
                            BMC – BMC communication?
                          </p>
                          <p class="MsoNormal"> </p>
                          <p class="MsoNormal"> </p>
                          <p class="MsoNormal">Neeraj</p>
                          <p class="MsoNormal"> </p>
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
  </body>
</html>

--------------176306A3E9CAFA33E7623F8B--

