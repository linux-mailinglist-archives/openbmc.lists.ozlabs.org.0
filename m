Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F18EF1EE20F
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 12:06:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d1dw2NXnzDqpd
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 20:06:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d1d404YyzDqVv
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 20:05:58 +1000 (AEST)
IronPort-SDR: 3sCj6FyLdMUac+TvPKgdGaJ+s7NzXvqdFcKPmgu73BC4rKzBrqkhuGhSznPZLnfMgPb7+4jkDg
 +DVrIGpx6J2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 03:05:54 -0700
IronPort-SDR: 2GMSGrWElyKvGO2IFvMPtMDrxHLWJ6DvHQbHyHXfLlzk+s3d1Bm8cpfTOQgu5scoongGUM1lRw
 I2gb/ZOnfiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
 d="scan'208,217";a="416862755"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.90.24])
 ([10.252.90.24])
 by orsmga004.jf.intel.com with ESMTP; 04 Jun 2020 03:05:50 -0700
Subject: Re: MCTP Null EID - Physical addressing support - Binding private in
 API
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
 <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
Date: Thu, 4 Jun 2020 15:35:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
Content-Type: multipart/alternative;
 boundary="------------24DB7FA415E55D64F2A13DF8"
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------24DB7FA415E55D64F2A13DF8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

Clarified inline, let me know your further comments / questions.

Regards,

Richard

On 6/3/2020 8:10 AM, Andrew Jeffery wrote:
> Hi Richard,
>
> On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
>> All,
>>
>>   MCTP specification doesn’t restrict communication without EID
>> assignment. i.e. MCTP devices can communicate with each other, even
>> without EID’s (Spec limits bridging MCTP commands only – Sec 8.2
>> Special Endpoints in DSP0236). The scenario can happen in following
>> cases
> Before we jump ahead, as far as I can see this is only a problem in libmctp for
> local bus communications involving at least one device requiring dynamic
> address allocation.
[Richard]: Intentionally didn't talk about static EID - networks as this 
problems won't be there. If you meant to say that libmctp is not 
designed to handle non-static network case, let me know. I brought this 
topic to cover it in libmctp.
> Obviously that doesn't mean it's not a problem, just that there exists a class
> of configuration for which this is not an issue. Where it's not an issue we can
> follow the usual message routing path. My goal is that the flow for sending
> messages is the same regardless of whether we're communicating with static or
> dynamic devices irrespective of whether the dynamic device has formally been
> assigned an address (i.e. we follow the same routing path in both cases).
>
> For static allocation, each endpoint in the network must be aware of the
> allocated EIDs a-priori, and how this is managed is out of scope of the MCTP
> base specification. If the EID assignment is known statically then there's no
> need to worry about the special case of EID 0 as alluded to above.
>
> Finally, conceptually, we can split the process of sending a command into
> three phases for the purpose of discussing addresses:
>
> 1. Command Generation: Performed at the application layer
> 2. Message Routing: Performed in libmctp core
> 3. Message Dispatch: Performed in the libmctp binding implementation
[Richard]: Yes. We are on same page here.
> Keep this separation in mind. My goal is that we maintain abstractions and do
> not propagate physical layer information beyond the libmctp core. I'll try to
> build the case for EID 0 being a corner case, and that we should treat it that
> way in the libmctp public APIs as well (i.e. not let it impact the usual interfaces
> for sending messages).
[Richard]: Yes, we are on the same goal, but finding discrepancies in 
achieving the said cases, and hence this discussion.
>> 1. MCTP Bus owner available only in Main power and not on stand-by. In
>> this case, devices are required to communicate using NULL EID, till
>> main power is applied.
> Again, only for communication involving a device that requires dynamic EID
> allocation.
[Richard]: Yes.
>
>> 2. Till the EID’s are assigned by the Bus Owner, devices can
>> communicate with NULL EID(Source & Dest).
> Agreed, except for in the static case there's no need to do this because we
> know the EIDs.
[Richard]: Now for dynamic only EID case, how this will happen is the 
question here.
>
>> Even Bus owner, when it sends
>> out SetEID or query GetEID, it must send with NULL EID (for Dest – Sec
>> 12.3 Set Endpoint ID, 8.17.6 – Reclaiming EID’s from hot-plug devices
>> in DSP0236)
> Here's an extract from 8.17.6:
>
>> Attempting to access each endpoint can be accomplished by issuing the Get
>> Endpoint ID command to the physical address of each device and comparing the
>> returned result to the existing entry in the routing table. If there is no
>> response to the command, or if there is a mismatch with the existing routing
>> information, the entry should be cleared and the corresponding EID or EID
>> range should be returned to the "pool" for re-assignment.
> Note that it says "can be accomplished" and "or if there is a mismatch". So
> "must send with NULL EID" is too strong here - if we know an EID we can
> use it.
>
> This is where breaking down the process of sending a command into the three
> phases becomes useful: The application uses the EID to specify the device it
> wants to talk to in the Command Generation phase, while the Message Routing
> phase performs the mapping of EID to physical device address. If necessary, the
> EID in the message can be substituted with 0 in the Message Routing phase.
[Richard]: Not really. This section 8.17.6 talks about reclaiming. i.e 
Basically, in this case, don't send GetEID command based on EID to 
physical address mapping, instead send GetEID to the needed physical 
address with Dest EID Null, and cross verify it's EID. This needs to be 
performed, to figure out whether EID of the device changed due to card 
replacement or reset etc. If we don't send with Dest EID as 0, then 
device may drop the packet, if there is mismatch with it's EID.
>> Similarly, as EndPoint device, need physical address of the bus owner,
>> so that when SetEID is received from secondary/backup bus owner, we
>> will know what to do?
> This isn't dependent on the physical address - the specification says that if a
> device receives a subsequent SetEID to the first it must respond indicating the
> EID it has already been allocated. This has no tie to the physical address of
> the device sending the SetEID command. Further, we know both the EID and the
> physical address of the device that propagated the SetEID from the received
> packet, so the local routing table should simply be updated with the information
> captured.
[Richard]: Not really, if the same bus owner sends SetEID, we need to 
accept that, but if the request comes from different one, then we can't 
accept that one. Assume bus owner crashed / reset and coming back up, it 
may start with different EID assignment, based on number of devices at 
that point and devices needs to identify the bus owner with UUID or 
physical address to uuid mapped.
>
>> (Note: Secondary / backup bus owner may send with
>> same bus owner EID, but it’s physical address will be different, and
>> device can request for force Set EID).
>>
>> 3. Devices without bus owner in the network trying to communicate in
>> peer-to-peer – single / simple network.
> Again, if the EIDs have been statically assigned there's no reason not to use
> them. So again this is the case where communication involves at least one
> dynamic device.
[Richard]: Yes, talking about non-static network model only.
>> There are also scenario’s where device’s issue Get EID command to the
>> Bus owner to do a discovery or initiate discovery based on the need. In
>> this case, there can be 2 / 3 devices which will issue this GetEID, and
>> physical addressing is the way to differentiate the same.
> Yep. And this is covered by the proposal I previously outlined to Sumanth (the
> sequence outlined near the bottom of the reply):
>
> https://lists.ozlabs.org/pipermail/openbmc/2020-April/021293.html
>
> The summary is that for sending messages we populate the route table with a
> provisional EID assignment before sending the message.
>
> What we lack at the moment in libmctp is proper route table handling and an API
> to interact (add/remove/inspect) with route entries. However, continuing:
>
> The fact that the EID is marked provisional in the routing table will cause
> libmctp core to replace the EID in the message with EID 0 before passing the
> message and the physical address to the appropriate binding.

[Richard]: This is as per our earlier discussion in the PMCI WG, but the 
problem with the provisional is we can't manage as per the need. Say, 
GetEID needs to be sent to a newly discovered device say PA.X 
(physicalAddress X), then for this we need to form the command with MCTP 
transport header with Dest EID as EID.0 (can't put a provisional EID 
here) (If we send a provisional EID, then the device can drop the 
packet, when the EID doesn't match). i.e. we need a mechanism to 
differentiate between provisional & real EID and for the provisional 
EID, Dest EID must be 0, if that's what we required. Currently MCTP 
Transport header is filled/decoded by core-mctp, hence it must be aware 
about this. For this we need to introduce a field, which we call here as 
binding private.

>
> Going the other direction, upon receiving a message with EID 0, libmctp core
> will populate the routing table with a provisional EID, replace the source EID
> 0 in the MCTP header with the provisional EID, then propagate the message up
> the stack.
[Richard]: This means that Provisional EID is carved out of the EID 
Pool. With bridging - (Multiple networks), this can't be handled. We 
will end up with real EID for the same provisional EID, and hence we 
won't know when we send back data to which device we need to deliver.
>>   This requires to pass physical addressing information to the MCTP
>> Control command layer or to the upper layer from libmctp.
> I think I've demonstrated above that this might not be not necessary. Please
> poke holes in what I've proposed!

[Richard]:

_*For control command handling:*_  As stated, we need a mechanism other 
than EID (Note: I meant we may need to introduce one more field, to make 
the difference - if you are saying that as provisional (i.e. not the 
same mcpt_eid_t then that's what we are saying as binding private).

_*Now for other Message types*_ say PLDM etc. Other than EID, PLDM 
doesn't use any of the MCTP Transport header, but we still need to 
expose the transport header in the upper API, as other OEM types may use 
it or rely on MCTP transport header for informaiton. Now, having said 
there are cases where devices behind mux or requires special handling, 
now we need to see how to handle the same in terms of API (which is 
second part of this discussion).

> Andrew

--------------24DB7FA415E55D64F2A13DF8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Andrew, <br>
    </p>
    <p>Clarified inline, let me know your further comments / questions.
      <br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 6/3/2020 8:10 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Richard,

On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">All,

 MCTP specification doesn’t restrict communication without EID 
assignment. i.e. MCTP devices can communicate with each other, even 
without EID’s (Spec limits bridging MCTP commands only – Sec 8.2 
Special Endpoints in DSP0236). The scenario can happen in following 
cases
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Before we jump ahead, as far as I can see this is only a problem in libmctp for 
local bus communications involving at least one device requiring dynamic 
address allocation.</pre>
    </blockquote>
    [Richard]: Intentionally didn't talk about static EID - networks as
    this problems won't be there. If you meant to say that libmctp is
    not designed to handle non-static network case, let me know. I
    brought this topic to cover it in libmctp.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
Obviously that doesn't mean it's not a problem, just that there exists a class 
of configuration for which this is not an issue. Where it's not an issue we can 
follow the usual message routing path. My goal is that the flow for sending 
messages is the same regardless of whether we're communicating with static or 
dynamic devices irrespective of whether the dynamic device has formally been
assigned an address (i.e. we follow the same routing path in both cases).

For static allocation, each endpoint in the network must be aware of the 
allocated EIDs a-priori, and how this is managed is out of scope of the MCTP 
base specification. If the EID assignment is known statically then there's no 
need to worry about the special case of EID 0 as alluded to above.

Finally, conceptually, we can split the process of sending a command into
three phases for the purpose of discussing addresses:

1. Command Generation: Performed at the application layer
2. Message Routing: Performed in libmctp core
3. Message Dispatch: Performed in the libmctp binding implementation 
</pre>
    </blockquote>
    [Richard]: Yes. We are on same page here.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
Keep this separation in mind. My goal is that we maintain abstractions and do 
not propagate physical layer information beyond the libmctp core. I'll try to
build the case for EID 0 being a corner case, and that we should treat it that
way in the libmctp public APIs as well (i.e. not let it impact the usual interfaces
for sending messages).
</pre>
    </blockquote>
    [Richard]: Yes, we are on the same goal, but finding discrepancies
    in achieving the said cases, and hence this discussion. <br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
1. MCTP Bus owner available only in Main power and not on stand-by. In 
this case, devices are required to communicate using NULL EID, till 
main power is applied.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, only for communication involving a device that requires dynamic EID 
allocation.</pre>
    </blockquote>
    [Richard]: Yes.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
2. Till the EID’s are assigned by the Bus Owner, devices can 
communicate with NULL EID(Source &amp; Dest). 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agreed, except for in the static case there's no need to do this because we 
know the EIDs.</pre>
    </blockquote>
    [Richard]: Now for dynamic only EID case, how this will happen is
    the question here.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Even Bus owner, when it sends 
out SetEID or query GetEID, it must send with NULL EID (for Dest – Sec 
12.3 Set Endpoint ID, 8.17.6 – Reclaiming EID’s from hot-plug devices 
in DSP0236)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Here's an extract from 8.17.6:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Attempting to access each endpoint can be accomplished by issuing the Get 
Endpoint ID command to the physical address of each device and comparing the 
returned result to the existing entry in the routing table. If there is no 
response to the command, or if there is a mismatch with the existing routing 
information, the entry should be cleared and the corresponding EID or EID 
range should be returned to the "pool" for re-assignment.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Note that it says "can be accomplished" and "or if there is a mismatch". So
"must send with NULL EID" is too strong here - if we know an EID we can
use it.

This is where breaking down the process of sending a command into the three 
phases becomes useful: The application uses the EID to specify the device it 
wants to talk to in the Command Generation phase, while the Message Routing 
phase performs the mapping of EID to physical device address. If necessary, the 
EID in the message can be substituted with 0 in the Message Routing phase.
</pre>
    </blockquote>
    [Richard]: Not really. This section 8.17.6 talks about reclaiming.
    i.e Basically, in this case, don't send GetEID command based on EID
    to physical address mapping, instead send GetEID to the needed
    physical address with Dest EID Null, and cross verify it's EID. This
    needs to be performed, to figure out whether EID of the device
    changed due to card replacement or reset etc. If we don't send with
    Dest EID as 0, then device may drop the packet, if there is mismatch
    with it's EID.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Similarly, as EndPoint device, need physical address of the bus owner, 
so that when SetEID is received from secondary/backup bus owner, we 
will know what to do?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This isn't dependent on the physical address - the specification says that if a 
device receives a subsequent SetEID to the first it must respond indicating the 
EID it has already been allocated. This has no tie to the physical address of 
the device sending the SetEID command. Further, we know both the EID and the 
physical address of the device that propagated the SetEID from the received 
packet, so the local routing table should simply be updated with the information 
captured.</pre>
    </blockquote>
    [Richard]: Not really, if the same bus owner sends SetEID, we need
    to accept that, but if the request comes from different one, then we
    can't accept that one. Assume bus owner crashed / reset and coming
    back up, it may start with different EID assignment, based on number
    of devices at that point and devices needs to identify the bus owner
    with UUID or physical address to uuid mapped.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com"><br>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">(Note: Secondary / backup bus owner may send with 
same bus owner EID, but it’s physical address will be different, and 
device can request for force Set EID).

3. Devices without bus owner in the network trying to communicate in 
peer-to-peer – single / simple network. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, if the EIDs have been statically assigned there's no reason not to use 
them. So again this is the case where communication involves at least one 
dynamic device.
</pre>
    </blockquote>
    [Richard]: Yes, talking about non-static network model only.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
There are also scenario’s where device’s issue Get EID command to the 
Bus owner to do a discovery or initiate discovery based on the need. In 
this case, there can be 2 / 3 devices which will issue this GetEID, and 
physical addressing is the way to differentiate the same. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yep. And this is covered by the proposal I previously outlined to Sumanth (the 
sequence outlined near the bottom of the reply):

<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/pipermail/openbmc/2020-April/021293.html">https://lists.ozlabs.org/pipermail/openbmc/2020-April/021293.html</a>

The summary is that for sending messages we populate the route table with a 
provisional EID assignment before sending the message.

What we lack at the moment in libmctp is proper route table handling and an API 
to interact (add/remove/inspect) with route entries. However, continuing:

The fact that the EID is marked provisional in the routing table will cause 
libmctp core to replace the EID in the message with EID 0 before passing the 
message and the physical address to the appropriate binding.</pre>
    </blockquote>
    <p>[Richard]: This is as per our earlier discussion in the PMCI WG,
      but the problem with the provisional is we can't manage as per the
      need. Say, GetEID needs to be sent to a newly discovered device
      say PA.X (physicalAddress X), then for this we need to form the
      command with MCTP transport header with Dest EID as EID.0 (can't
      put a provisional EID here) (If we send a provisional EID, then
      the device can drop the packet, when the EID doesn't match). i.e.
      we need a mechanism to differentiate between provisional &amp;
      real EID and for the provisional EID, Dest EID must be 0, if
      that's what we required. Currently MCTP Transport header is
      filled/decoded by core-mctp, hence it must be aware about this.
      For this we need to introduce a field, which we call here as
      binding private.</p>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

Going the other direction, upon receiving a message with EID 0, libmctp core 
will populate the routing table with a provisional EID, replace the source EID 
0 in the MCTP header with the provisional EID, then propagate the message up 
the stack.
</pre>
    </blockquote>
    [Richard]: This means that Provisional EID is carved out of the EID
    Pool. With bridging - (Multiple networks), this can't be handled. We
    will end up with real EID for the same provisional EID, and hence we
    won't know when we send back data to which device we need to
    deliver.<br>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
 This requires to pass physical addressing information to the MCTP 
Control command layer or to the upper layer from libmctp.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think I've demonstrated above that this might not be not necessary. Please 
poke holes in what I've proposed!
</pre>
    </blockquote>
    <p>[Richard]: <br>
    </p>
    <p><u><b>For control command handling:</b></u>  As stated, we need a
      mechanism other than EID (Note: I meant we may need to introduce
      one more field, to make the difference - if you are saying that as
      provisional (i.e. not the same mcpt_eid_t then that's what we are
      saying as binding private). <br>
    </p>
    <p><u><b>Now for other Message types</b></u> say PLDM etc. Other
      than EID, PLDM doesn't use any of the MCTP Transport header, but
      we still need to expose the transport header in the upper API, as
      other OEM types may use it or rely on MCTP transport header for
      informaiton. Now, having said there are cases where devices behind
      mux or requires special handling, now we need to see how to handle
      the same in terms of API (which is second part of this
      discussion).<br>
    </p>
    <blockquote type="cite"
      cite="mid:7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------24DB7FA415E55D64F2A13DF8--
