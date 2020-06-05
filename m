Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C661EEFE1
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 05:24:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dSgC5QHWzDqyY
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 13:24:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dSfT2MVQzDqtV
 for <openbmc@lists.ozlabs.org>; Fri,  5 Jun 2020 13:23:44 +1000 (AEST)
IronPort-SDR: B3nt/Pu1egQIZ4xwI1Yddm8AUiW/0N8n80NCSsYYQunH1R/YAVZmJq4FIFU7PKzGBVoS2jdRGm
 0A+uQ96o39fQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 20:23:39 -0700
IronPort-SDR: 94nArG+w22XgYTMqJzsHLcdTkUsLgi6anI9npZjEkkqz4pvnJSR6+ItiKylYYEnxjrljOg5fTX
 u5abP73K0K9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,474,1583222400"; 
 d="scan'208,217";a="258565220"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.71.141])
 ([10.252.71.141])
 by orsmga007.jf.intel.com with ESMTP; 04 Jun 2020 20:23:36 -0700
Subject: Re: MCTP Null EID - Physical addressing support - Binding private in
 API
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Hawrylewicz Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b774a6d0-97f3-8cc7-9289-3792b5094cdd@linux.intel.com>
 <7fdfa5dd-11a8-4566-a8b6-090b37506cf8@www.fastmail.com>
 <54948e11-946b-49ad-945e-2d73c41c1a8a@linux.intel.com>
 <8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <be5a68c4-39b4-2d88-425d-0ab2121ed564@linux.intel.com>
Date: Fri, 5 Jun 2020 08:53:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com>
Content-Type: multipart/alternative;
 boundary="------------C0C4F11889F7936F1AA8CBD8"
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
--------------C0C4F11889F7936F1AA8CBD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Andrew,

inline comments. Captured this as an agenda for our next work group call 
discussion https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG

Regards,

Richard

On 6/5/2020 7:51 AM, Andrew Jeffery wrote:
> Hi Richard,
>
> I've trimmed out all the bits we agree on.
>
> On Thu, 4 Jun 2020, at 19:35, Thomaiyar, Richard Marian wrote:
>> On 6/3/2020 8:10 AM, Andrew Jeffery wrote:
>>> Hi Richard,
>> On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
>>>> All,
>>   MCTP specification doesn’t restrict communication without EID
>> assignment. i.e. MCTP devices can communicate with each other, even
>> without EID’s (Spec limits bridging MCTP commands only – Sec 8.2
>> Special Endpoints in DSP0236). The scenario can happen in following
>> cases
>>> Before we jump ahead, as far as I can see this is only a problem in
>> libmctp for
>> local bus communications involving at least one device requiring
>> dynamic
>> address allocation.  [Richard]: Intentionally didn't talk about static
>> EID - networks as this problems won't be there. If you meant to say
>> that libmctp is not designed to handle non-static network case, let me
>> know. I brought this topic to cover it in libmctp.
> Let's not get ahead of ourselves :)
>
> I _intend_ libmctp to handle non-static network cases just fine. We need to do
> some work though, mainly implementing support for routing.
[Richard]: we are on the same page then.
>>>> 1. MCTP Bus owner available only in Main power and not on stand-by. In
>> this case, devices are required to communicate using NULL EID, till
>> main power is applied.
>>> Again, only for communication involving a device that requires dynamic EID
>> allocation.  [Richard]: Yes.
>>>> 2. Till the EID’s are assigned by the Bus Owner, devices can
>> communicate with NULL EID(Source & Dest).
>>> Agreed, except for in the static case there's no need to do this
>> because we
>> know the EIDs.  [Richard]: Now for dynamic only EID case, how this will
>> happen is the question here.
> It is handled by the provisional EID proposal.

>>>> Even Bus owner, when it sends
>> out SetEID or query GetEID, it must send with NULL EID (for Dest – Sec
>> 12.3 Set Endpoint ID, 8.17.6 – Reclaiming EID’s from hot-plug devices
>> in DSP0236)
>>> Here's an extract from 8.17.6:
>>>> Attempting to access each endpoint can be accomplished by issuing the Get
>> Endpoint ID command to the physical address of each device and comparing the
>> returned result to the existing entry in the routing table. If there is no
>> response to the command, or if there is a mismatch with the existing routing
>> information, the entry should be cleared and the corresponding EID or EID
>> range should be returned to the "pool" for re-assignment.
>>> Note that it says "can be accomplished" and "or if there is a mismatch". So
>> "must send with NULL EID" is too strong here - if we know an EID we can
>> use it.
>>
>> This is where breaking down the process of sending a command into the
>> three
>> phases becomes useful: The application uses the EID to specify the
>> device it
>> wants to talk to in the Command Generation phase, while the Message
>> Routing
>> phase performs the mapping of EID to physical device address. If
>> necessary, the
>> EID in the message can be substituted with 0 in the Message Routing
>> phase.
>>   [Richard]: Not really. This section 8.17.6 talks about reclaiming. i.e
>> Basically, in this case, don't send GetEID command based on EID to
>> physical address mapping, instead send GetEID to the needed physical
>> address with Dest EID Null, and cross verify it's EID.
> That's an option but not a necessity as far as I read it. And if it's not a
> necessity, we can still use our current understanding of the EID to perform the
> EID to physical address mapping in the routing phase. If we're unsure of the
> device's assigned EID, we can always mark what know as was its previous address
> as provisional before sending the GetEID command. The provisional mark will
> cause the routing layer to replace the message's destination EID with 0 after
> resolving the physical address.

[Richard]: If you are saying to use different flag / field, apart from 
mctp_eid_t for it, then we are on the same page here, and can talk about 
how that must be done. The main agreement we need to make here is 
whether same mctp_eid_t must be used or not.

>> This needs to be
>> performed, to figure out whether EID of the device changed due to card
>> replacement or reset etc. If we don't send with Dest EID as 0, then
>> device may drop the packet, if there is mismatch with it's EID.
> This is why in the provisional EID proposal we substitute the supplied EID with
> 0 in the routing layer.

>>>> Similarly, as EndPoint device, need physical address of the bus owner,
>> so that when SetEID is received from secondary/backup bus owner, we
>> will know what to do?
>>> This isn't dependent on the physical address - the specification says
>> that if a
>> device receives a subsequent SetEID to the first it must respond
>> indicating the
>> EID it has already been allocated. This has no tie to the physical
>> address of
>> the device sending the SetEID command. Further, we know both the EID
>> and the
>> physical address of the device that propagated the SetEID from the
>> received
>> packet, so the local routing table should simply be updated with the
>> information
>> captured.  [Richard]: Not really, if the same bus owner sends SetEID,
>> we need to accept that, but if the request comes from different one,
>> then we can't accept that one. Assume bus owner crashed / reset and
>> coming back up, it may start with different EID assignment, based on
>> number of devices at that point and devices needs to identify the bus
>> owner with UUID or physical address to uuid mapped.
> This isn't what the spec says as I read it. Can you point to the sections that
> made you come to this conclusion about the specific device that's acting as bus
> owner?

[Richard]: yes, in section 12.3 of the DSP0236. Capturing the excerpt below.

The Set Endpoint ID command is also used to provide the Physical Address 
and EID of the Bus Owner to
an Endpoint. An Endpoint that needs to communicate with the Bus Owner 
may capture the physical
address and EID that was used to deliver the Set Endpoint ID message.

>
>>> Going the other direction, upon receiving a message with EID 0,
>> libmctp core
>> will populate the routing table with a provisional EID, replace the
>> source EID
>> 0 in the MCTP header with the provisional EID, then propagate the
>> message up
>> the stack.
>>   [Richard]: This means that Provisional EID is carved out of the EID
>> Pool. With bridging - (Multiple networks), this can't be handled. We
>> will end up with real EID for the same provisional EID, and hence we
>> won't know when we send back data to which device we need to deliver.
> This case can be detected by the routing layer, however I need to think through
> the impacts some more. I don't think it precludes the provisional EID approach.
> To get a bit more specific, provisional EIDs are only used above the routing
> layer where an inbound message contains a 0 source EID, and for the outbound
> case where the destination EID should be 0. If an inbound message arrives with
> a non-zero source EID then we know it is a legitimately assigned EID and we can
> de-conflict the routing table.
>
> I just need to make sure this works for each scenario.
[Richard]: We can't know which EID can be used as provisional. It may be 
real EID in a bridged network. Please educate me, if the same can be 
achieved without having a conflict.
>
>>>>   This requires to pass physical addressing information to the MCTP
>> Control command layer or to the upper layer from libmctp.
>>> I think I've demonstrated above that this might not be not necessary. Please
>> poke holes in what I've proposed!
>> [Richard]:
>>
>> _*For control command handling:*_ As stated, we need a mechanism other
>> than EID (Note: I meant we may need to introduce one more field, to
>> make the difference - if you are saying that as provisional (i.e. not
>> the same mcpt_eid_t then that's what we are saying as binding private).
>>
>> _*Now for other Message types*_ say PLDM etc. Other than EID, PLDM
>> doesn't use any of the MCTP Transport header, but we still need to
>> expose the transport header in the upper API, as other OEM types may
>> use it or rely on MCTP transport header for informaiton.
> Can you please provide concrete examples of this being necessary?
[Richard]: For control commands, already stated the scenarios and 
excerpt from specification, let me know if you are looking for any other 
specific concrete examples.
>
>> Now, having
>> said there are cases where devices behind mux
> For muxes it should be possible to determine the necessary mux state between
> the routing and the binding. The mux configuration should be encoded as part of
> the physical address. This may mean we need binding "decorators" to handle the
> case.
>
>> or requires special
>> handling, now we need to see how to handle the same in terms of API
>> (which is second part of this discussion).
> Can you please be more specific here? What do you have in mind?
>
> Cheers,
>
> Andrew

--------------C0C4F11889F7936F1AA8CBD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thanks Andrew, <br>
    </p>
    <p>inline comments. Captured this as an agenda for our next work
      group call discussion <a
        href="https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG">https://github.com/openbmc/openbmc/wiki/OpenBMC-PMCI-WG</a></p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 6/5/2020 7:51 AM, Andrew Jeffery
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">Hi Richard,

I've trimmed out all the bits we agree on.

On Thu, 4 Jun 2020, at 19:35, Thomaiyar, Richard Marian wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 6/3/2020 8:10 AM, Andrew Jeffery wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Richard,
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
On Tue, 2 Jun 2020, at 02:43, Thomaiyar, Richard Marian wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">All,
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
 MCTP specification doesn’t restrict communication without EID 
assignment. i.e. MCTP devices can communicate with each other, even 
without EID’s (Spec limits bridging MCTP commands only – Sec 8.2 
Special Endpoints in DSP0236). The scenario can happen in following 
cases
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Before we jump ahead, as far as I can see this is only a problem in 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">libmctp for 
local bus communications involving at least one device requiring 
dynamic 
address allocation.  [Richard]: Intentionally didn't talk about static 
EID - networks as this problems won't be there. If you meant to say 
that libmctp is not designed to handle non-static network case, let me 
know. I brought this topic to cover it in libmctp.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Let's not get ahead of ourselves :)

I _intend_ libmctp to handle non-static network cases just fine. We need to do 
some work though, mainly implementing support for routing.
</pre>
    </blockquote>
    [Richard]: we are on the same page then.<br>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">1. MCTP Bus owner available only in Main power and not on stand-by. In 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">this case, devices are required to communicate using NULL EID, till 
main power is applied.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Again, only for communication involving a device that requires dynamic EID 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">allocation.  [Richard]: Yes.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">2. Till the EID’s are assigned by the Bus Owner, devices can 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">communicate with NULL EID(Source &amp; Dest). 
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Agreed, except for in the static case there's no need to do this 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">because we 
know the EIDs.  [Richard]: Now for dynamic only EID case, how this will 
happen is the question here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is handled by the provisional EID proposal.
</pre>
    </blockquote>
    <br>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Even Bus owner, when it sends 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">out SetEID or query GetEID, it must send with NULL EID (for Dest – Sec 
12.3 Set Endpoint ID, 8.17.6 – Reclaiming EID’s from hot-plug devices 
in DSP0236)
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Here's an extract from 8.17.6:
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Attempting to access each endpoint can be accomplished by issuing the Get 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Endpoint ID command to the physical address of each device and comparing the 
returned result to the existing entry in the routing table. If there is no 
response to the command, or if there is a mismatch with the existing routing 
information, the entry should be cleared and the corresponding EID or EID 
range should be returned to the "pool" for re-assignment.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Note that it says "can be accomplished" and "or if there is a mismatch". So
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">"must send with NULL EID" is too strong here - if we know an EID we can
use it.

This is where breaking down the process of sending a command into the 
three 
phases becomes useful: The application uses the EID to specify the 
device it 
wants to talk to in the Command Generation phase, while the Message 
Routing 
phase performs the mapping of EID to physical device address. If 
necessary, the 
EID in the message can be substituted with 0 in the Message Routing 
phase.
 [Richard]: Not really. This section 8.17.6 talks about reclaiming. i.e 
Basically, in this case, don't send GetEID command based on EID to 
physical address mapping, instead send GetEID to the needed physical 
address with Dest EID Null, and cross verify it's EID.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's an option but not a necessity as far as I read it. And if it's not a 
necessity, we can still use our current understanding of the EID to perform the 
EID to physical address mapping in the routing phase. If we're unsure of the 
device's assigned EID, we can always mark what know as was its previous address 
as provisional before sending the GetEID command. The provisional mark will 
cause the routing layer to replace the message's destination EID with 0 after 
resolving the physical address.</pre>
    </blockquote>
    <p>[Richard]: If you are saying to use different flag / field, apart
      from mctp_eid_t for it, then we are on the same page here, and can
      talk about how that must be done. The main agreement we need to
      make here is whether same mctp_eid_t must be used or not. <br>
    </p>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This needs to be 
performed, to figure out whether EID of the device changed due to card 
replacement or reset etc. If we don't send with Dest EID as 0, then 
device may drop the packet, if there is mismatch with it's EID.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is why in the provisional EID proposal we substitute the supplied EID with 
0 in the routing layer.
</pre>
    </blockquote>
    <br>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Similarly, as EndPoint device, need physical address of the bus owner, 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">so that when SetEID is received from secondary/backup bus owner, we 
will know what to do?
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This isn't dependent on the physical address - the specification says 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">that if a 
device receives a subsequent SetEID to the first it must respond 
indicating the 
EID it has already been allocated. This has no tie to the physical 
address of 
the device sending the SetEID command. Further, we know both the EID 
and the 
physical address of the device that propagated the SetEID from the 
received 
packet, so the local routing table should simply be updated with the 
information 
captured.  [Richard]: Not really, if the same bus owner sends SetEID, 
we need to accept that, but if the request comes from different one, 
then we can't accept that one. Assume bus owner crashed / reset and 
coming back up, it may start with different EID assignment, based on 
number of devices at that point and devices needs to identify the bus 
owner with UUID or physical address to uuid mapped.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This isn't what the spec says as I read it. Can you point to the sections that 
made you come to this conclusion about the specific device that's acting as bus 
owner?</pre>
    </blockquote>
    <p>[Richard]: yes, in section 12.3 of the DSP0236. Capturing the
      excerpt below.</p>
    <p><span class="fontstyle0">The Set Endpoint ID command is also used
        to provide the Physical Address and EID of the Bus Owner to<br>
        an Endpoint. An Endpoint that needs to communicate with the Bus
        Owner may capture the physical<br>
        address and EID that was used to deliver the Set Endpoint ID
        message.</span> <br style=" font-style: normal; font-variant:
        normal; font-weight: normal; letter-spacing: normal;
        line-height: normal; orphans: 2; text-align: -webkit-auto;
        text-indent: 0px; text-transform: none; white-space: normal;
        widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto;
        -webkit-text-stroke-width: 0px; ">
    </p>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Going the other direction, upon receiving a message with EID 0, 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">libmctp core 
will populate the routing table with a provisional EID, replace the 
source EID 
0 in the MCTP header with the provisional EID, then propagate the 
message up 
the stack.
 [Richard]: This means that Provisional EID is carved out of the EID 
Pool. With bridging - (Multiple networks), this can't be handled. We 
will end up with real EID for the same provisional EID, and hence we 
won't know when we send back data to which device we need to deliver.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This case can be detected by the routing layer, however I need to think through 
the impacts some more. I don't think it precludes the provisional EID approach. 
To get a bit more specific, provisional EIDs are only used above the routing 
layer where an inbound message contains a 0 source EID, and for the outbound 
case where the destination EID should be 0. If an inbound message arrives with 
a non-zero source EID then we know it is a legitimately assigned EID and we can 
de-conflict the routing table.

I just need to make sure this works for each scenario.</pre>
    </blockquote>
    [Richard]: We can't know which EID can be used as provisional. It
    may be real EID in a bridged network. Please educate me, if the same
    can be achieved without having a conflict. <br>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap=""> This requires to pass physical addressing information to the MCTP 
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Control command layer or to the upper layer from libmctp.
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I think I've demonstrated above that this might not be not necessary. Please 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">poke holes in what I've proposed!
[Richard]: 

_*For control command handling:*_ As stated, we need a mechanism other 
than EID (Note: I meant we may need to introduce one more field, to 
make the difference - if you are saying that as provisional (i.e. not 
the same mcpt_eid_t then that's what we are saying as binding private). 

_*Now for other Message types*_ say PLDM etc. Other than EID, PLDM 
doesn't use any of the MCTP Transport header, but we still need to 
expose the transport header in the upper API, as other OEM types may 
use it or rely on MCTP transport header for informaiton.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you please provide concrete examples of this being necessary?</pre>
    </blockquote>
    [Richard]: For control commands, already stated the scenarios and
    excerpt from specification, let me know if you are looking for any
    other specific concrete examples. <br>
    <blockquote type="cite"
      cite="mid:8f92dcfd-c6b3-4625-a158-17e03a940687@www.fastmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Now, having 
said there are cases where devices behind mux 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For muxes it should be possible to determine the necessary mux state between 
the routing and the binding. The mux configuration should be encoded as part of 
the physical address. This may mean we need binding "decorators" to handle the 
case.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">or requires special 
handling, now we need to see how to handle the same in terms of API 
(which is second part of this discussion).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can you please be more specific here? What do you have in mind?

Cheers,

Andrew
</pre>
    </blockquote>
  </body>
</html>

--------------C0C4F11889F7936F1AA8CBD8--
