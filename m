Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DFFC846
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 15:00:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DNRd4lY8zF7F2
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 01:00:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DNMV1fk2zF3vX
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 00:57:09 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 23032166D2C;
 Thu, 14 Nov 2019 08:57:05 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: openbmc project for telemetry
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8bda426c-5dfa-b9c6-f4b0-769288ff675c@linux.intel.com>
Date: Thu, 14 Nov 2019 08:57:04 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A128ED3-1DFD-43F2-B249-79BFB97E4672@fuzziesquirrel.com>
References: <ca853ff3-6017-7e75-b66e-3116c042f38c@linux.intel.com>
 <A727F88F-D32D-4CAD-8E92-2C99B39E4CEE@fuzziesquirrel.com>
 <ce5c1774-ff0f-602c-a165-43cbca90f818@linux.intel.com>
 <ee14af8a-5e0a-04b1-4978-09d34f6f9628@linux.intel.com>
 <FC0713B7-19EB-49E0-958F-3290DA5A10DD@fuzziesquirrel.com>
 <8bda426c-5dfa-b9c6-f4b0-769288ff675c@linux.intel.com>
To: =?utf-8?Q?Adrian_Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak,
 Piotr" <piotr.matuszczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 14, 2019, at 5:55 AM, Adrian Ambro=C5=BCewicz =
<adrian.ambrozewicz@linux.intel.com> wrote:
>=20
> So now it's time for silly questions...
>=20
> What should be my first steps as maintainer?

I would add MAINTAINERS, LICENSE and README files.  Add a clang-format =
file to avoid quibbling over style.  Select a build system.  Many =
OpenBMC projects are moving to meson.  Ask Andrew to enable the =
repository CI job on the telemetry repo.  Start submitting patches for =
review.

And if you are willing, document the process as you go though it and add =
that to the maintainer workflow document for the next person :-)

> I've found guide here =
https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but =
its general.
> I'm more interested in technical side of things.
> - Is Linux MAINTAINERS format utilized for automation or information =
about code maintainers should be just included in README file in repo? =
MAINTAINERS file is referenced in =
https://github.com/openbmc/docs/blob/master/maintainer-workflow.md but I =
don't see that in every repo..

Most OpenBMC projects are using this format:

https://github.com/openbmc/hiomapd/blob/master/MAINTAINERS

I=E2=80=99m not aware of any automation that has been built around that =
file format though.  FWIW I intend to implement the owners plugin on our =
gerrit installation in the near future:

https://gerrit.googlesource.com/plugins/owners/

so you could make use of that if you wanted.

> - Should maintainer have additional access for repo/gerrit config?

You have owner acesss (full access) on the project.  You can delegate or =
give that to others here: =
https://gerrit.openbmc-project.xyz/admin/groups/45,members

-brad=
