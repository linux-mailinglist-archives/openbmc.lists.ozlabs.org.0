Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249BF15B3F0
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:37:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hvf31tS7zDqS3
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:37:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HvdG31VMzDqQP
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:36:33 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Functionality vs Security
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <3cee9f0f-9b6a-78da-479e-dd038daafb0d@linux.intel.com>
Date: Wed, 12 Feb 2020 17:36:29 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <94389294-51B9-44F7-AA9F-FCFF5F4F7EB5@fuzziesquirrel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <4F01EAF1-E621-4908-8080-C2BE62287E0C@fuzziesquirrel.com>
 <3cee9f0f-9b6a-78da-479e-dd038daafb0d@linux.intel.com>
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



> On Feb 12, 2020, at 5:06 PM, James Feist <james.feist@linux.intel.com> =
wrote:
>=20
> On 2/12/20 2:01 PM, Brad Bishop wrote:
>> Hi James
>>> On Feb 12, 2020, at 4:16 PM, James Feist =
<james.feist@linux.intel.com> wrote:
>>>=20
>>> In IRC yesterday I proposed the question of whether to change the =
default of bmcweb to disable REST D-Bus, or to change it in our =
meta-layers only. I created the patch here: =
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 and I am =
looking for feedback. While REST D-Bus does expose many useful APIs, and =
phosphor-webui depends heavily on it, it does leak information to any =
logged in user. This comes to the question, should we prefer =
functionality by default or security by default? It is a compile switch =
either way, so each user can still decide which they prefer.
>> There is no user that prefers something that doesn=E2=80=99t work or =
is incomplete, no matter how secure it is.  If you can find one, I=E2=80=99=
m happy to be proven wrong.
>=20
> To my knowledge the only thing that breaks is the Web-UI, if you don't =
find the Web-UI useful, then I don't think it matters much.

The project test automation suite would also break.  What if you do find =
the Web-UI (or test automation suite) useful?  Who gets to decide what =
the =E2=80=9Cimportant=E2=80=9D usage patterns are that need to be =
maintained and which ones don=E2=80=99t and can be allowed to break with =
changes like this?

I think we should take a cue from Linux.  The answer is _all_ usage =
patterns are important and must be maintained.  I don=E2=80=99t see why =
we should be any different.

>=20
>> In my mind, the only user that wants this is Intel, because Intel has =
a bunch of patches to the webui that would make the broken upstream =
work.  The path forward here is simple (in concept) - upstream your =
webui patches, and the need for this to even be a discussion point goes =
away.  Has Intel had issues getting the webui patches upstreamed?
>=20
> We had someone working on the Web-UI, but they had problems getting =
things merged due to differences in design opinions.

I don=E2=80=99t understand how design differences would present problems =
in getting back-end api calls switched over to Redfish.  It sounds like =
the commits were not structured properly or there were design changes =
mixed in with functional changes.

>=20
>>> I have the opinion that the default should be the safest =
configuration
>> I completely agree!  This disconnect is what should we entertain =
calling a configuration.  I say that configurations that break existing =
(working) usage patterns of the upstream project code are not on the =
table.
>=20
> It doesn't break it, it's just a default that you can switch back with =
a single build flag. This is only changing a default.

If I clone openbmc and try to run the webui, will it still work after =
this change?  If I clone openbmc and run the test automation suite =
against that, will it still work after this change?=
