Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD1815B5A4
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 01:06:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HxdH6yHHzDqRr
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 11:06:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hxc70DGkzDqQY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 11:05:42 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Functionality vs Security
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
Date: Wed, 12 Feb 2020 19:05:39 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, "Mihm, James" <james.mihm@intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 12, 2020, at 4:16 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> In IRC yesterday I proposed the question of whether to change the =
default of bmcweb to disable REST D-Bus, or to change it in our =
meta-layers only. I created the patch here: =
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 and I am =
looking for feedback. While REST D-Bus does expose many useful APIs, and =
phosphor-webui depends heavily on it, it does leak information to any =
logged in user. This comes to the question, should we prefer =
functionality by default or security by default? It is a compile switch =
either way, so each user can still decide which they prefer. I have the =
opinion that the default should be the safest configuration, and if =
someone wants to change that, then they can accept the risk and change =
the build flag.
>=20
> Thoughts?
>=20
> Thanks,
>=20
> James

One idea I have is adding a new distro configuration.  Today we have =
openbmc-phosphor - we could add a DISTRO=3Dopenbmc-secure-at-all-costs =
to meta-phosphor, and the legacy API could be disabled by default there, =
and remain enabled by default in openbmc-phosphor.

This is still a workaround - what really needs to happen is (most of) =
the webui and test automation suites need to be ported to Redfish, and =
when that happens, the need for this new distro policy set goes away - =
at least in terms of legacy REST API enablement.

Would this be a satisfactory compromise?

-brad=
