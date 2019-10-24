Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A3E36D8
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 17:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zWfn2TRhzDqVb
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 02:40:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zWf32p8zzDqSq
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 02:40:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 908ED6E201;
 Thu, 24 Oct 2019 11:40:04 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Continuous Integration Build Failures
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
Date: Thu, 24 Oct 2019 11:40:04 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>,
 Andrew Geissler <geissonator@gmail.com>
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



> On Oct 24, 2019, at 11:16 AM, Johnathan Mantey =
<johnathanx.mantey@intel.com> wrote:
>=20
> I would like to propose a change to how the continuous integration =
system works.
>=20
> I understand there are many builds, and there is a lot of data =
associated with the builds. Thus the current desire to remove the log =
file data in a short amount of time is a requirement. This works alright =
when the build succeeds. It's unhelpful when the build fails. =
Identifying where the build fails is impossible after approximately an =
hour. As an ordinary contributor I don't know how to make the CI system =
rebuild the source code so that the log files are available again =
without pushing some new change that consists of a useless piece of =
whitespace (or some other pointless change).  It shouldn't be necessary =
for the contributor to make requests for a build restart to the CI =
maintainers, they have their own agenda.=20

Are you referring to the bitbake CI jobs or the repository CI jobs?

>=20
> Are the maintainers of the CI system willing to make a change that =
aids in debug?
>=20
> Suggestions:
> 	=E2=80=A2 Don't delete the log on build fails.
> 	=E2=80=A2 Delete everything but the log ascii output on build =
fails.
> 	=E2=80=A2 Email the ascii logfile for build fails
> 	=E2=80=A2 Email a compressed debug bundle to the submitter?
> 	=E2=80=A2 Allow build fails to be restarted by the submitter so =
the logs can be regenerated, inspected, and captured.
> 	=E2=80=A2 other...?

At first glance these are all good ideas.  Andrew how many of these can =
Jonathan implement himself and how many of them require access to the =
Jenkins instance?=
