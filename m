Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A2DE4ED2
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 16:22:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4705sp09v5zDqJ8
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 01:22:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47042D0xxkzDqlR
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 23:59:30 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3B4016E201;
 Fri, 25 Oct 2019 08:59:25 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: multiple telemetry designs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
Date: Fri, 25 Oct 2019 08:59:25 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C816F5E-C0F9-4C2F-899C-34B7CA984826@fuzziesquirrel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Neeraj Ladkani <neladk@microsoft.com>, piotr.matuszczak@intel.com,
 James Feist <james.feist@linux.intel.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>, "Mihm,
 James" <james.mihm@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Oct 24, 2019, at 1:13 PM, Shawn McCarney =
<shawnmm@linux.vnet.ibm.com> wrote:
>=20
> * Could the two proposals be merged, with D-Bus providing the public =
API to the data?  Maybe something like the following?  1) Continue to =
store current sensor values on D-Bus using the existing architecture.  =
Sensor values come from a variety of sources.  2) An application obtains =
current sensor values from D-Bus and stores them with timestamps in RRD =
to provide efficient history/telemetry.  3) A new D-Bus interface/method =
is created to obtain the history/telemetry data.  4) bmcweb uses the =
current D-Bus interfaces for the Sensor URIs (as it does today) and uses =
the new D-Bus interface/method for Telemetry URIs?

I think there is room for a merged/split design.  There are two use =
cases to consider though while we formulate that.

1 - I want to expose sensor data with collectd (collectd-binary).
2 - I want to expose sensor data with bmcweb (Redfish).

I would suggest that for #1, dbus be avoided and go right to the source =
of the data, whatever that may be.  That would be more performant and it =
avoids dependencies on OpenBMC software which means collectd plugins =
that are written would have a chance at being accepted in upstream =
collectd.  This would be irrespective of how #2 is designed and =
implemented.

I don=E2=80=99t think I need #1 though.  Does anyone plan on doing #1 on =
their BMC?  When I originally suggested collectd, it was because I =
thought:

1 - collectd is a preexisting implementation of the proposed custom =
monitoring service...

therefore

2 - it would save effort and be a smaller maintenance burden to use =
pre-existing software rather than writing it from scratch.

It is certainly possible though that collectd can=E2=80=99t be made to =
fit the bill or I am imagining more of an overlap between the custom =
monitoring service and a collectd based one than there really is.

thx - brad=
