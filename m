Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6CE3748
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 17:57:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zX1S29HszDqTR
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 02:57:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zX0Q2ZG9zDqVF
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 02:56:03 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B50E06E201;
 Thu, 24 Oct 2019 11:56:00 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Continuous Integration Build Failures
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <b7c8b873-15d8-8e16-eb5d-077bb4f5cc4f@intel.com>
Date: Thu, 24 Oct 2019 11:56:00 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <C10A4C80-2CB9-4FD8-913B-23E7A4FCD593@fuzziesquirrel.com>
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
 <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
 <b7c8b873-15d8-8e16-eb5d-077bb4f5cc4f@intel.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 24, 2019, at 11:49 AM, Johnathan Mantey =
<johnathanx.mantey@intel.com> wrote:
>=20
> Brad,
> No I had not seen that doc.  That said, I worked with someone here to =
run the CI build locally.  I got the Docker instance to perform a build =
on the submission that instigated this email trail. The Docker instance =
passed on my code changes.  Yet, the upstream Gerrit build does not. =20

You and any other contributor should be able to reproduce the CI build =
locally.  If that isn=E2=80=99t the case, that is a bug somewhere.  =
I=E2=80=99ll try downloading your patch.

> Now I don't have logfiles on the upstream Gerrit server to find out =
why.  I believe I've done my due diligence for preparing the code for a =
successful build.  At the end of the day the only place that matters for =
build success/failure is the upstream system.  As such anything that can =
be done to improve that system is, in my opinion, a benefit to the =
community.

I agree.

> My specific issue is: =
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/24666
> I have no idea why this is failing now that the logs have been =
deleted, and I can't determine a way to manually start a new build to =
get logs without pushing meaningless commits.  I'd rather not waste =
reviewers time having to see email messages about meaningless commits.

Yep, that makes sense and I can understand that point of view.  We all =
want to work independently.  I=E2=80=99ll just say that while we work to =
make the process better, I have no problem with you or anyone else =
pinging me in IRC to go kick a job where the logs have wrapped.

-brad
