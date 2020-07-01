Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AB210AE9
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 14:18:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xgGt4kg8zDr0y
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 22:17:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xgFd0nq6zDqxs
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 22:16:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 1 Jul 2020 08:15:54 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: Re: "Initial commit" with entire git history - possible?
Message-ID: <20200701121554.bfkoh34xxiz7k5hr@thinkpad.dyn.fuzziesquirrel.com>
References: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
 <43a3c7b0-df25-b4a7-13e7-3d944f892420@linux.intel.com>
 <c7907f47-db04-12e2-9812-ee72cde822a9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <c7907f47-db04-12e2-9812-ee72cde822a9@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 01, 2020 at 01:08:20PM +0200, Adrian Ambro=C5=BCewicz wrote:
> Brad,
>
> How (as a maintainer) I could 'move' code from our internal repository
> to github/openbmc hosted one? Is it specified somewhere?

git push <remote> HEAD:master

The gerrit remote is something like:
ssh://<user>@gerrit.openbmc-project.xyz:2918/openbmc/telemetry

and the github remote is:
ssh://git@github.com/openbmc/telemetry

You'll need to have configured both github and gerrit to accept whatever
ssh keys you present.

> Currently I've pushed whole code to gerrit as usual review to gather
> feedback, but after that I would still want to pursue path of pushing
> entire git history + review changes on top  of that.

I'm glad to see you are willing to entertain feedback but I'd be
suprised if Intel let you spend time on making any meaningful changes
(e.g. ones that cause significant rework and time investment on your
part) at this point.  This is why code should be developed and reviewed
in the open in the first place if you actually want others to use it.
