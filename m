Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB7B945E
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 17:49:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZdSJ2lKJzF3ZC
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 01:49:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZdRZ1pPlzF3Q8
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 01:48:40 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 08:48:37 -0700
X-IronPort-AV: E=Sophos;i="5.64,529,1559545200"; d="scan'208";a="271577547"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Sep 2019 08:48:36 -0700
Date: Fri, 20 Sep 2019 08:48:35 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Staging plans to remove network IPMI support?
Message-ID: <20190920154835.GJ45301@mauery.jf.intel.com>
References: <24ab3a70-2752-e2ba-5a37-41ee35f8aa92@linux.ibm.com>
 <9ad6bc40-8b34-1c54-c1f6-abd5d0ee1672@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9ad6bc40-8b34-1c54-c1f6-abd5d0ee1672@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18-Sep-2019 04:34 PM, Joseph Reynolds wrote:
> Re-sending to fix up formatting error:
>=20
> The OpenBMC security working group discussed a desire to remove out-of-ba=
nd
> network IPMI support from the OpenBMC firmware stack, here:
> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018319.html
>=20
> This would affect out-of-band (network IPMI) only, in repository
> https://github.com/openbmc/phosphor-net-ipmid. The host IPMI support is
> a separate topic.
>=20
> The *main idea* is a staging plan to remove network IPMI support over a
> period of years, like in this progression:

This may be a year 3030 topic; I would not worry too much about it for=20
now. By the time RMCP+ is gone, BMCs may not even be a thing anymore :)

But in all seriousness, telnet and rlogin stayed on for YEARS beyond=20
their welcome. It will be a difficult task to wean users off RMCP+. It=20
is so easy to use and we are all used to it. Redfish is so complicated=20
and we don't have the tooling to make it work as smoothly as RMCP+.

Basically what I am saying is that we need buy-in from the end users. So=20
far, for all its wonder and glory, Redfish really has been a hard sell.=20
For all the warts and flaws of RMCP+ over IPMI, people *need* it. People=20
are not rational and do not make security decisions based on logic.

> 1. Tell everyone the plans at each stage below. For example: emails to the
> group, mention in the release notes, update
> https://github.com/openbmc/phosphor-net-ipmid/blob/master/README.md and t=
he
> ipmitool repo.

We can certainly add something to the README, but we do need to set some=20
expectations on how much people actually read documentation. Adding=20
something there will not have nearly as much effect as putting a big red=20
banner on the bmcweb console that says "IPMI over RMCP+ is enabled and=20
is insecure. You might consider disabling it and using the Redfish=20
protocol instead"

OpenBMC does not own the ipmitool project (or any of the other=20
opensource utilities that speak RMCP+), so we will need to reach out. It=20
turns out that the ipmitool maintainer is a member of the OpenBMC=20
community, so we can hopefully leverage that relationship.

> 2. Implement the Redfish ManagerNetworkProtocol - defined in the DMTF
> Redfish Resource and Schema Guide DSP2046 https://www.dmtf.org/dsp/DSP204=
6.=A0
> This gives the BMC admin an interface to disable out-of-band network
> IPMI.That means stopping the IPMI network service and closing its port.

I keep hearing stories about redfish not being united and common enough=20
to be useful. Does the spec need to grow or do we just need to make sure=20
that it is always implemented according to the spec?

> 3. Change the IPMI ManagerNetworkProtocol setting to be disabled by
> default.=A0 After this, BMC admins have to take an explicit action to ena=
ble
> IPMI access.

I would hope that long before we disable netipmid by default, Redfish=20
would be the main mechanism for accessing the BMC.=20

> By this point it should be possible to learn how to migrate from
> IPMI to Redfish APIs.

No, people should be learning how to migrate from IPMI to Redfish right=20
now, long before we attempt to disable RMCP+/IPMI by default.

> 4. Remove IPMI from the default OpenBMC configuration. This means network
> IPMI is not built into the BMC firmware image. After this, project who wa=
nt
> to use network IPMI will have to explicitly add it to their image. This w=
ill
> hopefully be a wake-up call to anyone who is still using network IPMI.

I think this step could be moved up. Not every OEM user of OpenBMC wants=20
to include netipmid in their builds today. Adding a package to an image=20
is just as easy as removing it. We could make it NOT part of the image=20
by default and require all OEMs that want it to add it to their image.

> 5. Remove all references to network IPMI from OpenBMC.

I am not sure this is ever necessary. This is not a nanny state. If=20
someone wants openBMC to have insecure packages on their builds, that is=20
up to them. We can disable the package by default, but I think that is=20
as far as we need to go.

--Vernon
