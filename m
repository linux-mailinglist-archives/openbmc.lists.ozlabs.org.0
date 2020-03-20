Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DB518CF9A
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 14:58:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kQNQ6Y3BzDrN9
	for <lists+openbmc@lfdr.de>; Sat, 21 Mar 2020 00:58:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kP115FSrzDrff
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 23:56:35 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: service for tracking user activity (phosphor-audit)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <9bfe6392-902a-25aa-ac5c-d6254677f02b@linux.ibm.com>
Date: Fri, 20 Mar 2020 08:56:28 -0400
Message-Id: <678E0FDF-6A80-4829-8843-334AB75C4DB3@fuzziesquirrel.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
 <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
 <07C231EA-1761-4014-9A78-E2BDA3D71F0E@fuzziesquirrel.com>
 <3672a09d41f6d80fcff8f85306eda4ef07351a34.camel@yadro.com>
 <9bfe6392-902a-25aa-ac5c-d6254677f02b@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, gmills@us.ibm.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 2:05 PM, Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 3/19/2020 10:14 AM, Ivan Mikhaylov wrote:
>> On Tue, 2020-03-17 at 16:08 -0400, Brad Bishop wrote:
>>> at 2:46 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>>>
>>>> Matt and Deepak could weigh in on whether this could be a part of
>>>> phosphor-logging.
>>> This would be my preference.
>>>
>>> thx - Brad
>> Who can grant me rights into this rep or to directory in it? Matt, =20
>> Deepak? Also,
>> phosphor-logging/phosphor-audit would be the possible place for it the=
n.
>
> I think you mean to merge code?  You could either put up a commit to ad=
d =20
> your
> name to the MAINTAINERS file, or there is a gerrit plugin that we can =20
> somehow use
> to grant people merge access to only certain directories.

Yes, the gerrit owners plugin is installed on our instance:

https://gerrit.googlesource.com/plugins/owners/+doc/master/README.md

The missing piece for wide-scale deployment is the submit rules.  I=E2=80=
=99ve not =20
had time to figure these out - if someone wanted to get the first example=
 =20
working on a repository that would be much appreciated.

With that said Ivan, as an alternative to this^, I think if you:

-submit your application for review
-procure reviewers for your application (_real_ reviews, not rubber stamp=
s)
-one of the existing maintainers merges it

and _then_ submit yourself for merge authority to all of phosphor-logging=
 I =20
suspect the phosphor-logging maintainers would be fine with that.
