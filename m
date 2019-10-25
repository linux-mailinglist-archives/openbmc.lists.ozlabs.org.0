Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A7E5257
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 19:31:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470B4N70V2zDqsb
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 04:31:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470B3f4P8GzDqSS
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 04:31:10 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id EDEEA6E201;
 Fri, 25 Oct 2019 13:31:06 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: multiple telemetry designs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9D72@IRSMSX101.ger.corp.intel.com>
Date: Fri, 25 Oct 2019 13:31:06 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <2782E6C9-E976-4D06-B3A9-77E8FD4BB860@fuzziesquirrel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
 <2C816F5E-C0F9-4C2F-899C-34B7CA984826@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9D72@IRSMSX101.ger.corp.intel.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Piotr

> On Oct 25, 2019, at 11:08 AM, Matuszczak, Piotr =
<piotr.matuszczak@intel.com> wrote:
>=20
> Hi,=20
>=20
> Our design is tailored to support the Redfish Telemetry Service, but =
it is not limited to it and either, the telemetry configuration and =
presentation is done via the Redfish. Also, the monitoring service is =
designed to support Redfish triggers leveraging the Redfish Event =
Service for sending events.=20

I wasn=E2=80=99t trying to suggest that your design was inflexible.  I =
apologize if that seemed to be the case.

> If the collectd is to exist independently of Redfish and D-Bus it is =
possible to use both solutions. I have some questions, though:
> 1. How the telemetry gathering will be configured by the user, when =
collectd is used?

-OEM extension to any management protocol
-ssh + collectd config file
-no configuration (baked into the image - think per-system images =
deployed to 10000 systems).

but I=E2=80=99m just blasting ideas - I don=E2=80=99t have any need for =
running the collectd network output plugin.

> 2. What is the use case for storing historical readings in the BMC, =
using non-volatile storage (or did I misunderstood the rrd files)?=20

Clients can have have transient disconnects and not miss any sensor =
readings.

> As for merging the two proposals, the common D-Bus API for the =
telemetry back-end (either collectd or monitoring service) was what I =
thought about at first. Of course, the back-end will have to support =
metric report and triggers management, because the bmcweb is only the =
presentation layer (Redfish Telemetry Service) for the telemetry data.=20=


That makes sense.  And I assume you believe that it is more work to use =
collectd as that back-end than writing one from scratch?  I guess at =
this point it is a little moot - from the other thread it sounds like =
you have the code mostly done already anyway...

thx - brad=
