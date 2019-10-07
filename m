Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B445CED3C
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:15:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nBZ024DvzDqMT
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:15:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nBYN63MtzDqLN
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:15:20 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5964914C5B
 for <openbmc@lists.ozlabs.org>; Mon,  7 Oct 2019 16:15:17 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Feedback on documentation philosophy requested
Date: Mon, 7 Oct 2019 16:15:17 -0400
References: <507D4043-19B5-43ED-B28B-408D4BC504E6@fuzziesquirrel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <507D4043-19B5-43ED-B28B-408D4BC504E6@fuzziesquirrel.com>
Message-Id: <DEAFC8E2-2995-4298-89FD-B3A4635A51CD@fuzziesquirrel.com>
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

Bumping this thread in case anyone had intended to reply but forgot.

thx! - brad

> Hello OpenBMCers
>
> Over here at IBM we are just getting started on a large-ish project.  T=
he =20
> effect of which I=E2=80=99d like to focus on with this thread is that w=
e will be =20
> generating a fair amount of documentation.
>
> I=E2=80=99m not talking about documentation for existing function.  The=
re is =20
> certainly a need for that too but that is also something to tackle in =20
> another thread.  Rather, I=E2=80=99m talking about new designs and docu=
mentation =20
> for new features.
>
> Some of the new features we=E2=80=99ll be documenting will -not- be int=
eresting =20
> to some/many/most/all in the OpenBMC community.  For the features that =
=20
> fall more towards the most/all end of that spectrum, I ask for your =20
> thoughts on a couple points:
>
> - Should these docs and designs be segregated somehow?  Would they beco=
me =20
> a burden on the rest of the community if not?
>
> - I=E2=80=99d like to contribute a process around documentation that he=
lps =20
> contributors figure out where and how to document things like this.  A =
=20
> really rough thought I have here is some kind of flow chart or decision=
 =20
> tree that could be applied to a document or set of documents, the outpu=
t =20
> of which would be how to break up your documentation into pieces and/or=
 =20
> where to put it/them.  Does anyone have any ideas here?
>
> As you ponder these questions a couple things to keep in your head:
>
> - At the moment all designs are unconditionally found in =20
> openbmc/docs/designs.
>
> - We have documentation in openbmc/docs, *-dbus-interfaces, and various=
 =20
> sub-project repo READMEs.  Any others?
>
> - My observation is that the project is headed away from micro services=
 =20
> and towards larger applications - highly configurable at build time.  =20
> bmcweb and phosphor-logging are great examples of this.  Think =20
> Linux/KBuild (but without modules).  What this means is that code with =
=20
> relatively few users (or even just one) goes in the same codebase as th=
e =20
> code with many users.  This seems counter to segregating documentation =
=20
> and designs of the code with few users.
>
> - An example of an un-interesting feature might be the support we=E2=80=
=99ll add =20
> for the hardware management console.  The HMC is a management appliance=
 =20
> we sell and it has a custom REST API [1], which we=E2=80=99ll implement=
 in bmcweb =20
> (tucked behind cmake flags that compile the support out of course, as =20
> described in the previous bullet).
>
> A couple simple ideas that have been thrown around=E2=80=A6
>
> - put vendor subfolders in openbmc/docs/designs
>
> - document vendor specific features in meta-<vendor>/docs
>
> If you are still reading, thanks!  I look forward to hearing your ideas=
.
>
> -brad
>
> [1] =20
> https://www.ibm.com/support/knowledgecenter/TI0003N/p8hat/p8hat_partiti=
oningwithanhmc.htm

