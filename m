Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10149F8186
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 21:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BjdW3pzczDrdL
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 07:48:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bjcn3RpPzDqXD
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 07:47:52 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6F4D6114C3A;
 Mon, 11 Nov 2019 15:47:47 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: entity-manager: adding additional fru formats to fru-device
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1327cf09-6bb2-7901-598f-3411ad724efb@linux.intel.com>
Date: Mon, 11 Nov 2019 15:47:47 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1DC15AE-6CA8-46CD-AA27-DD31B21A5BE6@fuzziesquirrel.com>
References: <80AD98E1-20D5-4ADD-ADD2-6901A3B77A43@fuzziesquirrel.com>
 <120a78a0-1801-facf-040b-346471c37b70@linux.intel.com>
 <D4FB1F4C-C279-47B5-A55B-108D7186A1C3@fuzziesquirrel.com>
 <1327cf09-6bb2-7901-598f-3411ad724efb@linux.intel.com>
To: James Feist <james.feist@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 11, 2019, at 3:06 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> Oh I assumed it was long living, I guess I misunderstood. Either =
should be fine. Is there any reason to make the parsing logic a shared =
library?

None other than continuing to support the existing application.

Now that I think about it, I could probably re-work the existing =
application that uses the parsing logic to instead just call the =
fru-device DBus API (removing the need to expose the parsing logic via =
shared library).  Does that seem better?

> The parsing logic could probably just be a build switch otherwise, I =
imagine some sort of binary-to-dict function that we could just create =
multiple of and compile time choose what format we want.

Any issue with support for multiple formats at the same time?=
