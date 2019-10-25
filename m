Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C6E4AE1
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 14:17:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47035K0fDCzDqhN
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 23:17:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4703410j1HzDqXw
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 23:16:00 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 454616E201;
 Fri, 25 Oct 2019 08:15:57 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: multiple telemetry designs
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6UOfyzArHhoaA7H30WhdYFaHOhbHiCtUx0U7S2xeM_ngg@mail.gmail.com>
Date: Fri, 25 Oct 2019 08:15:57 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <085BF71B-2AEB-4D0C-A566-4F75FC167E2C@fuzziesquirrel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
 <CAGMNF6UOfyzArHhoaA7H30WhdYFaHOhbHiCtUx0U7S2xeM_ngg@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
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
Cc: james.mihm@intel.com, Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, piotr.matuszczak@intel.com,
 James Feist <james.feist@linux.intel.com>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 24, 2019, at 1:27 PM, Kun Yi <kunyi@google.com> wrote:
>=20
> (author of the collectd/RRD based design here)
> First of all, I have been silent on the mailing list for a while, =
without any progress on collectd. There are some fires that I need to =
put out first, unfortunately :(
>=20
> I have discussed with Piotr in the telemetry meeting. Basically we'd =
like to rephrase it as this: Piotr's design doesn't prevent future =
extension such as using collectd/rrdtool as a backend to provide =
telemetry data, and I reviewed the Redfish API that the design would =
provide, which LGTM. Therefore I +1'ed Piotr's design, given that there =
is already concrete work behind it, and collectd didn't work for his =
requirements.

That=E2=80=99s great.  This is exactly the sort of consensus I was =
looking for!  Thanks for documenting it Kun (apologies if this was =
already common knowledge to the telemetry workgroup).

I=E2=80=99ll re-state to make sure I have it right - we=E2=80=99ll merge =
Piotr=E2=80=99s design now, and leave yours open for the time being, =
until we sort out how to have a collectd based back-end live =
side-by-side with the custom monitor service from Piotr.

> To be able to merge the designs, either Bmcweb can use RRD library or =
collectd/librrd can talk D-Bus, which is some work but not =
insurmountable. Piotr maybe you want to call that out explicitly in your =
design doc?
>=20
> Regards,
> Kun

Thanks Piotr, James, Shawn, Kun, Justin, and Neeraj for the replies!

-brad=
