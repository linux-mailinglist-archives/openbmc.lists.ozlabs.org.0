Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA1134FD4
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 00:14:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tQ7X2y0LzDqSP
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 10:14:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tQ6d6ZXdzDqJl
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 10:14:00 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Redfish Dump Service Proposal
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8ee2690f-0149-3ac3-118a-5489b48afd79@linux.intel.com>
Date: Wed, 8 Jan 2020 18:13:55 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <E196EA8B-B261-4D5C-BE48-C86112145D73@fuzziesquirrel.com>
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <B3B51CCE-D255-489C-9C4C-57DB2F962B31@fuzziesquirrel.com>
 <8ee2690f-0149-3ac3-118a-5489b48afd79@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 8, 2020, at 3:42 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
>=20
>=20
> On 1/8/2020 12:04 PM, Brad Bishop wrote:
>>> On Dec 13, 2019, at 3:01 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>>>=20
>>> I like this as well.  I'm trying to support a CPU crashdump that =
would fit perfectly with this proposal.
>> Hi Jason
>> Could you say a few words about how your crash dump service works?  =
I=E2=80=99m asking because Dhruv is working on an implementation of this =
proposal:
>=20
> Sure.
>=20
> I have a service called host-error-monitor that watches for error =
signals from the host.  When a CPU fatal error occurs, the =
host-error-monitor triggers a crashdump from the crashdump service.
>=20
> The crashdump service itself is very minimal today.  It has two =
trigger methods on DBus.  One is to trigger a log for a real error that =
may need to be stored on the BMC.  The other is to trigger a manual log =
that does not need to persist.
>=20
> When triggered, the BMC reads the crash data from the CPU using PECI. =
After a log has been completed, it is added to DBus as a new object with =
a 'Log' property which holds the contents of the log as a string.
>=20
> The host-error-monitor source is shared here: =
https://github.com/Intel-BMC/host-error-monitor.
> The crashdump source is not currently licensed for public access.

Thanks for sharing!

>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28260
>> Right now it looks pretty POWER-centric but depending on how your =
code works I=E2=80=99m wondering which makes more sense:
>> 1 - a single implementation with =E2=80=94-enable-power =
=E2=80=94-enable-x86 type configure options.
>> -or-
>> 2 - two completely different implementations with the same dbus =
interfaces.
> I think this is probably the simplest approach.  It will allow us to =
standardize the Redfish interface without worrying about the actual log =
collection.

Ok, sounds good.  If you are able to find the time it would be good if =
you could look at Dhruvs proposal just from a DBus interface =
perspective.  That way we all don=E2=80=99t have to deal with two =
different DBus data models for gathering dumps in bmcweb when you end up =
implementing the x86 version.

>=20
> I also think we can move from this toward option 1 if we find a lot of =
commonalities in the future.

Awesome!

thx - brad=
