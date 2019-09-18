Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C9AB6E07
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 22:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YX2w4FxQzF4mN
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 06:42:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YX2939WnzF4hP
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 06:41:19 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5D04F6DECB
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 16:41:14 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Feedback on documentation philosophy requested
Message-Id: <507D4043-19B5-43ED-B28B-408D4BC504E6@fuzziesquirrel.com>
Date: Wed, 18 Sep 2019 16:41:14 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello OpenBMCers

Over here at IBM we are just getting started on a large-ish project.  The=
 =20
effect of which I=E2=80=99d like to focus on with this thread is that we =
will be =20
generating a fair amount of documentation.

I=E2=80=99m not talking about documentation for existing function.  There=
 is =20
certainly a need for that too but that is also something to tackle in =20
another thread.  Rather, I=E2=80=99m talking about new designs and docume=
ntation =20
for new features.

Some of the new features we=E2=80=99ll be documenting will -not- be inter=
esting to =20
some/many/most/all in the OpenBMC community.  For the features that fall =
=20
more towards the most/all end of that spectrum, I ask for your thoughts o=
n =20
a couple points:

- Should these docs and designs be segregated somehow?  Would they become=
 a =20
burden on the rest of the community if not?

- I=E2=80=99d like to contribute a process around documentation that help=
s =20
contributors figure out where and how to document things like this.  A =20
really rough thought I have here is some kind of flow chart or decision =20
tree that could be applied to a document or set of documents, the output =
of =20
which would be how to break up your documentation into pieces and/or wher=
e =20
to put it/them.  Does anyone have any ideas here?

As you ponder these questions a couple things to keep in your head:

- At the moment all designs are unconditionally found in =20
openbmc/docs/designs.

- We have documentation in openbmc/docs, *-dbus-interfaces, and various =20
sub-project repo READMEs.  Any others?

- My observation is that the project is headed away from micro services a=
nd =20
towards larger applications - highly configurable at build time.  bmcweb =
=20
and phosphor-logging are great examples of this.  Think Linux/KBuild (but=
 =20
without modules).  What this means is that code with relatively few users=
 =20
(or even just one) goes in the same codebase as the code with many users.=
  =20
This seems counter to segregating documentation and designs of the code =20
with few users.

- An example of an un-interesting feature might be the support we=E2=80=99=
ll add =20
for the hardware management console.  The HMC is a management appliance w=
e =20
sell and it has a custom REST API [1], which we=E2=80=99ll implement in b=
mcweb =20
(tucked behind cmake flags that compile the support out of course, as =20
described in the previous bullet).

A couple simple ideas that have been thrown around=E2=80=A6

- put vendor subfolders in openbmc/docs/designs

- document vendor specific features in meta-<vendor>/docs

If you are still reading, thanks!  I look forward to hearing your ideas.

-brad

[1] =20
https://www.ibm.com/support/knowledgecenter/TI0003N/p8hat/p8hat_partition=
ingwithanhmc.htm
