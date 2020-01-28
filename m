Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A088C14AD31
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:25:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4866ph6sYCzDqDM
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:25:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4866nj2NV4zDqDD
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:24:53 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id B94253898D;
 Mon, 27 Jan 2020 19:24:11 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 87DCCA3B;
 Mon, 27 Jan 2020 19:24:48 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security workgroup meeting times
In-Reply-To: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jan 2020 19:24:48 -0500
Message-ID: <16942.1580171088@localhost>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > Let's try again to establish another OpenBMC Security Workgroup meeti=
ng
    > time.=C2=A0 The current meeting time (every other week 10am Pacific D=
aylight
    > Time) is working for some, but not for others.=C2=A0 To be clear, we =
would
    > use the same workgroup, just have alternate meeting times.

    > First, let's find a time that works for Australia, Asia, and Europe.=
=C2=A0

There aren't any such times :-)
If you move to 7am PST, 10am Eastern, then it's 14:00 UTC, which is still
within the working day in Germany, Helsinki and Tel-Aviv.
In Beijing, that's 11pm. Seoul, 00:00, and Syndey, 2am.

https://www.timeanddate.com/worldclock/meetingtime.html?iso=3D20200131&p1=
=3D188&p2=3D33&p3=3D235&p4=3D240&p5=3D37

Many left-coast types that I work with prefer 7am, as they can do the meeti=
ng
while still at home, before traffic, before school-drop-off, etc.
(And aren't they all supposed to be super-health-nuts who get up at 6am to =
do Yoga?)

    > Second, I am thinking we could establish alternating meeting times. We
    > will not find a time that works for everyone.=C2=A0 I try to accommod=
ate
    > folks who cannot attend by writing a summary of the topics and
    > conclusions, and by pushing the work back out into this email list.=
=C2=A0

I've been on meetings that have simply alternated the AM/PM of the meeting.
     7pm California
     10pm NYC
     4am Berlin/5am Helsinki
     11am Beijing
     12:00 Seoul
     2pm Syndey

--
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [

