Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B256B26A2
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 22:28:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VRzZ3gSWzF5qG
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 06:28:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VRyy0PtlzF5jJ
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 06:27:52 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1014B5C09F;
 Fri, 13 Sep 2019 16:27:48 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Rant regarding code review issues
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <50cbafb6-6043-40fa-ef2c-2289906afecd@intel.com>
Date: Fri, 13 Sep 2019 16:27:47 -0400
Message-Id: <BB11D70B-19A2-467B-9C9B-98A04F33EF39@fuzziesquirrel.com>
References: <EB0500AF-9574-4007-BE55-B6E7384D027C@fb.com>
 <f5205bbe-7320-67ee-2b2d-91c5cc185b02@intel.com>
 <CAJoAoZm2apzNtkLNHULG1pkUL4U27+DoeVeR9-fgDPyjrBBakw@mail.gmail.com>
 <50cbafb6-6043-40fa-ef2c-2289906afecd@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 4:10 PM, Ed Tanous <ed.tanous@intel.com> wrote:

> On 9/13/19 1:02 PM, Emily Shaffer wrote:
>> I'll point out that as I understand it, 80c line limit is an
>> accessibility issue for tools like braille readers or for users who
>> need to use a larger font size than you may expect.
>
> Neat.  I never knew that was a reasoning for 80 character widths.

Me either=E2=80=A6TIL...

>
> I will probably continue to complain in my own head every time I need t=
o
> go to a few nested scopes and my line gets wrapped in an inconvenient
> place, but to a lesser extent than before now that I know there's a goo=
d
> reason for it :)

Another commonly sited reason for 80c + 8space indent=E2=80=A6 highlighti=
ng when =20
you have too many levels of nested scopes :-)
