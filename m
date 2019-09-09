Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4A6AD85C
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 13:57:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rmr83BMyzDqR7
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 21:57:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rmqc5QmqzDqDD
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 21:57:16 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 457465C09F;
 Mon,  9 Sep 2019 07:57:13 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: QEMU native compile issue
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
Date: Mon, 9 Sep 2019 07:57:13 -0400
Message-Id: <9F637263-2AC1-4F88-8A91-43FA3BB83148@fuzziesquirrel.com>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
 <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>,
 James Feist <james.feist@linux.intel.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 8:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> On Wed, 28 Aug 2019, at 00:09, Johnathan Mantey wrote:
>> Not really. I'm not sure where the code went.
>>
>>  I cloned the OpenBMC QEMU, made my change, and then pushed the change
>> to "upstream". I have SHA "650af0e183 Fix compile error when using
>> kernel 5.2" as the text.
>
> As you noted in your follow-up email you found the fix upstream. Furthe=
r, =20
> the fix
> is contained in the QEMU v4.1 tag.
>
> Upstream open-embedded has already bumped QEMU to v4.1 - I guess we
> should backport that change to openbmc/openbmc and this will be resolve=
d.
> I've Cc'ed Brad so he's across it.

I think this was picked up with openbmc =20
c68388fccb8c0b5bf4d6b8efff91203796be98b2.

If that doesn=E2=80=99t have what we needed...I=E2=80=99m blocked on doin=
g further oe-core =20
updates because of this:

https://lists.ozlabs.org/pipermail/openbmc/2019-September/017984.html

-brad
