Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CDE20CD
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 18:39:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yx156ND7zDqDs
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 03:39:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yx0N1SJKzDqFH
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 03:38:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1887614D325;
 Wed, 23 Oct 2019 12:38:55 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: multiple telemetry designs
Message-Id: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
Date: Wed, 23 Oct 2019 12:38:54 -0400
To: james.feist@linux.intel.com, piotr.matuszczak@intel.com, kunyi@google.com
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
Cc: thalerj@linux.vnet.ibm.com, openbmc@lists.ozlabs.org, james.mihm@intel.com,
 neladk@microsoft.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are two telemetry / metric designs under review right now:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357

I would like to see one or both of them merged.  Neither seem to have =
any support=E2=80=A6.there is a single +1 on the latter review from =
Shawn McCarney.  If you support one of these designs, please go review =
it and indicate your support.

I also can=E2=80=99t figure out what the path forward for OpenBMC is.  =
Maybe to start with, we could all level set on where we are at with our =
thinking:

Kun: How far along are you in the implementation of your proposal?
Piotr: How far along are you in the implementation of your proposal?
James: OpenBMC can support one or both proposals.  If we support both, =
this means multiple implementations for the same thing in bmcweb.  One =
that gets data from dbus objects, and another that gets it from librrd.  =
As the maintainer of bmcweb are you open to accepting one or both of =
these options?

Without any discussion and resolution, I=E2=80=99m afraid both of these =
proposals are just going to sit here, unmerged, indefinitely.

thx - brad=
