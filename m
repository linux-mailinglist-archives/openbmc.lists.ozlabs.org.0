Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA1B2548
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 20:41:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VPc94DQ9zF5Ck
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 04:41:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VPbP2PsmzF4dx
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 04:40:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 504105C09F;
 Fri, 13 Sep 2019 14:40:44 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: how to do large-ish IPC transfers
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <e0a953de-e329-7586-b072-c78294df452d@yadro.com>
Date: Fri, 13 Sep 2019 14:40:44 -0400
Message-Id: <62412D1A-F4CF-4044-9115-61C917F1E310@fuzziesquirrel.com>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
 <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
 <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>
 <e0a953de-e329-7586-b072-c78294df452d@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 3:42 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:

> 12.09.2019 16:24, Brad Bishop wrote:
>>> What is a 'file descriptor' you're referring to here? The Linux file =
=20
>>> descriptor
>>> (the integer you get from open()) is process-specific and doesn't kee=
p =20
>>> its
>>> meaning in another process' context.
>>
>> On Linux you can pass file descriptors (the ones returned by open) ove=
r =20
>> unix
>> sockets.  The implementation of the =E2=80=98h=E2=80=99 DBus type reli=
es on that.
>
> Oh, great! Didn't know about that. Thanks.
>
> Anyway, I think I'd just use message queues or sockets (directly). What=
's =20
> the
> profit of using a file whose descriptor is sent over a socket instead o=
f =20
> just
> using the socket for communication?

I feel like you might be trolling me a tiny bit on our usage of DBus but =
=20
I=E2=80=99ll answer just in case you aren=E2=80=99t=E2=80=A6

In this particular case we already have a socket established and are =20
passing other data over it, using an existing protocol (DBus).  Obviously=
 =20
we can=E2=80=99t stuff this file data onto that socket without breaking t=
he =20
protocol and all the code that implements it.  We could open yet another =
=20
socket for this but it seems simpler to me to just pass the fd over the =20
existing one=E2=80=A6especially when the DBus protocol has allowances for=
 that.

-brad
