Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C21CE9F8
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 18:59:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n6Cg6LZrzDqKf
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 03:59:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46n6By2J8pzDqDs
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 03:59:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96097142F;
 Mon,  7 Oct 2019 09:58:59 -0700 (PDT)
Received: from supven01-thinkstation-p720.austin.arm.com
 (supven01-thinkstation-p720.austin.arm.com [10.118.28.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91B343F68E;
 Mon,  7 Oct 2019 09:58:59 -0700 (PDT)
Message-ID: <25533c883bced48e02c485294770f8ec97fee7ec.camel@arm.com>
Subject: Re: libpldmresponder comments
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Mon, 07 Oct 2019 11:58:59 -0500
In-Reply-To: <0828a1d2-15db-b34d-36fb-73fce2c7c0c6@linux.vnet.ibm.com>
References: <VE1PR08MB51659EF13F43D182785C0B81809E0@VE1PR08MB5165.eurprd08.prod.outlook.com>
 <90f319cc-904e-e7ed-92b0-2e5e34c79168@linux.vnet.ibm.com>
 <543dd100fe66427941bf123ad67d2b00fdeb8d89.camel@arm.com>
 <0828a1d2-15db-b34d-36fb-73fce2c7c0c6@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sat, 2019-10-05 at 04:05 -0500, Deepak Kodihalli wrote:
> On 05/10/19 3:01 AM, Supreeth Venkatesh wrote:
> > On Fri, 2019-10-04 at 09:28 -0500, Deepak Kodihalli wrote:
> > > On 04/10/19 7:26 PM, Supreeth Venkatesh wrote:
> > > > Hello Deepak/all,
> > > > 
> > > > Sorry for the late comments/feedback.
> > > 
> > > No problem, thanks for the feedback Supreeth!
> > > 
> > > > I was looking at porting libpldmresponder and libpldm to an Arm
> > > > based
> > > > platform.
> > > 
> > > libpldm - sure, it is meant to be portable across OpenBMC, but
> > > libpldmresponder is not :)
> > > 
> > > > These are  few observations with the design, some of them were
> > > > discussed
> > > > during OSF OpenBMC Hackathon, summarizing them here:
> > > > 
> > > > Assumption was that libpldmresponder can be easily ported to
> > > > Host/other
> > > > Satellite/Service Management controller,
> > > 
> > > libpldmresponder was not meant to be ported outside OpenBMC -
> > > it's
> > > the
> > > OpenBMC implementation of the BMC as a PLDM responder.
> > 
> >  From our previous discussion, I was under the impression you
> > wanted
> > libPLDMresponder to get publicity and ported over as well.
> > If I was mistaken, the rest of discussion is moot.
> 
> Well, there has to be an aspect of the stack that transforms PLDM 
> concepts to OpenBMC concepts, and vice versa. That's
> libpldmresponder 
> today. However, I think we're talking about a layer above this
> (which 
> can probably sit in libpldm itself). I believe that's what you're 
> suggesting below as well.
Yes.

> 
> > > 
> > > > However, in the current design,
> > > > 
> > > >   1. libpldmresponder implements standard Commands/APIs defined
> > > > by
> > > > PLDM
> > > >      specifications in C++.
> > > >   2. libpldmresponder PDR, BIOS config structures are defined
> > > > by
> > > > PLDM
> > > >      specifications, However, the library uses Json format,
> > > > thus
> > > > making
> > > >      JSON parser mandatory for
> > > > Host/Service management controller firmware.
> > > > 
> > > >   3. libpldmresponder has DBUS/other OpenBMC implementation
> > > > dependencies,
> > > >      thus making portability harder. >  4. I guess the
> > > > expectation
> > > > when we started with the design was that
> > > >      there will be one **single** library which will handle all
> > > > pldm
> > > >      requests/responses and
> > > > 
> > > > upper layer application/Daemon will call the APIs provided by
> > > > PLDM
> > > > library to implement use cases as they fit.
> > > 
> > > https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
> > > makes
> > > the distinction between a portable libpldm (which handles the
> > > protocol
> > > encode/decode), and an OpenBMC specific responder implementation.
> > > 
> > > >   5. Libpldm also has dependencies on OpenBMC structures/DBUS
> > > > objects,
> > > >      making it a little harder to port.
> > > 
> > > No, libpldm has no OpenBMC dependencies. It for example is used
> > > by
> > 
> > If I remember right, in libpldm, for getting date and time, there
> > was
> > dependency on OpenBMC object to get it from the timer as opposed to
> > upper level app calling into libpldm and providing date and time?
> > Now that I look at the code in repo, it does not seem to be the
> > case.
> > Please ignore my rant.
> > 
> > > IBM's
> > > host firmware stacks today without any code changes. Can you
> > > point me
> > > to
> > > where you see D-Bus dependencies in libpldm? Do you just mean you
> > > find
> > > this hard to build outside an OpenBMC environment?
> > 
> > 
> > > 
> > > > Please let me know, how I can help fix some of these, so that
> > > > it
> > > > is
> > > > easily portable.
> > > 
> > > No change should be needed to libpldm code, it should already be
> > > portable like noted earlier. As far as the libpldmresponder is
> > > considered, like we discussed at the OSFC, one thing we could do
> > > is
> > > to
> > > write a responder API layer, the implementation of which is
> > > platform
> > > (for eg OpenBMC/ARM) specific. Would you like to propose a design
> > > update
> > > for this to the existing document? I think we need to understand
> > > the
> > > usefulness of such a layer though. I mean for example if you
> > > consider
> > > a
> > > PLDM command along the lines of ReadSensor, such a sensor maybe a
> > > D-
> > > Bus
> > > object on OpenBMC and something else on the ARM platform, those
> > > specifics *must* be implemented on the platform, so what would
> > > the
> > > portable layer consist of? Those details would be good to capture
> > > in
> > > the
> > > design doc.
> > 
> > Ok. Thanks for the example command.
> > Let's take the example of "GetSensorReading" as specified by one of
> > the
> > PLDM specification,
> > 
> > Use case: BMC is trying to get the current reading from a platform
> > smart (MCTP enabled) sensor.
> > Request is:
> > GetSensorReading (uint16 sensorID, bool8 rearmEventStatus)
> 
> Just to clarify, the examples I was talking about, and what 
> libpldmresponder today is meant to serve, is the case where the BMC
> is 
> the final PLDM responder. Another example - say a requester wants to 
> reboot the BMC. The native API for the same is a D-Bus property, so
> at 
> some layer, a PLDM SetEffecter to reboot the BMC needs to be
> converted 
> to a D-Bus operation - that's what libpldmresponder does.
For the example of rebooting the BMC, I think you mean
"SetStateEffecterStates" command to  as per the specification. correct?
If yes, "SetStateEffecterStates" API in BMC will implement the
following:
1. It will parse the incoming request (from other endpoint), 
2. Does the action (Native API --> DBus property invocation)
3. Respond back.

The implementation for this API will be provided by the platform.

> 
> > Request Message to the smart MCTP enabled sensor (not including
> > headers
> > and other field for illustration only) will be somthing like this
> > GetSensorReading | Sensor ID | rearmEventStatus
> > 
> > Response will contain the following fields:
> > enum8 completionCowhatde,
> > enum8 sensorDataSize,
> > enum8 sensorOperationalState,
> > bool8 sensorEventMessageEnable,
> > enum8 presentState,
> > enum8 previousState,
> > enum8 eventState,
> > var   presentReading
> > These fields will be filled in by smart MCTP enabled sensor or
> > microcontroller(MCTP endpoint) which controls the sensor.
> > 
> > Hence for this use case, my current thinking is that PLDM library
> > will
> > provide the standard template for GetSensorReading API as a
> > function
> > pointer.
> 
> I'm not sure I followed this (the standard template part) entirely,
> but 
> I can wait for details in the design doc update.
> 
> > The implementation of this GetSensorReading in openBMC and in smart
> > sensor software/firmware will be different.
> > To elaborate a little further, the implementation of this API in
> > OpenBMC for this particular use case is to fill in the PLDM request
> > fields and send it over the  to the smart sensor over MCTP over
> > sensor
> > specific physical media and get the response. (or can use DBUS
> > specifics to get the response, if possible)
> > 
> > The smart sensor implementation of GetSensorReading will be
> > different
> > and it will be to parse PLDM request and then to fill in the
> > response
> > fields and send back the PLDM message over MCTP over sensor
> > specific
> > physical media.
> > 
> > So, my thinking is to have a wrapper with function pointers, which
> > will
> > have all standard  commands defined by the PLDM specification.
> > This wrapper can then be ported across management controller
> > software
> > and devices alike.
> 
> So the wrapper will not have any handlers of incoming PLDM requests, 
> right? It expects platforms to provide handlers?
> 
> > I am thinking from the specification view point, but from your
> > email it
> > looks like to you want merge DBUS and PLDM concept. please confirm.
> 
> libpldmresponder is the sink of an incoming message meant intended to
> be 
> addressed by the BMC as the PLDM responder, so at that level OpenBMC 
> specifics are expected to be seen. Although I think you're
> suggesting 
> (and I like the concept in general, like I mentioned at the OSFC) a 
> layer above the platform specific responder implementation, which 
> provides hooks for platforms to provide their specific
> implementations 
> of a PLDM command. Please let me know if I've misunderstood what
> you're 
> suggesting.
This is exactly what I am suggesting --> Platform hook.

> 
> > I can add more details when I propose a design.
> 
> Sounds good!
> 
> > 
> > > 
> > > > Thanks,
> > > > 
> > > > Supreeth
> > > > 
> > > > IMPORTANT NOTICE: The contents of this email and any
> > > > attachments
> > > > are
> > > > confidential and may also be privileged. If you are not the
> > > > intended
> > > > recipient, please notify the sender immediately and do not
> > > > disclose
> > > > the
> > > > contents to any other person, use it for any purpose, or store
> > > > or
> > > > copy
> > > > the information in any medium. Thank you.
> > > 
> > > 
> 
> 

