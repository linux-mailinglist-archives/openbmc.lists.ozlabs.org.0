Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F32FB3BD
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 16:30:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CpT320mkzF5Tq
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 02:29:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CpS30XBYzF4db
 for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2019 02:29:05 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A80AE6E23C;
 Wed, 13 Nov 2019 10:29:00 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [yocto] Yocto/bitbake recipe 'diff test'?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <8fe3f80a-5b5c-4474-bb18-98c19fad29cd@www.fastmail.com>
Date: Wed, 13 Nov 2019 10:29:00 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF52C0E6-80F6-4E31-AB9D-57061ED7104F@fuzziesquirrel.com>
References: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
 <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
 <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
 <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
 <8fe3f80a-5b5c-4474-bb18-98c19fad29cd@www.fastmail.com>
To: Paul Barker <paul@betafive.co.uk>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: Yocto discussion list <yocto@yoctoproject.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Nov 12, 2019, at 1:41 PM, Paul Barker <paul@betafive.co.uk> wrote:
>=20
> have a look at my slides at the start of the Day 1 slide deck at =
https://wiki.yoctoproject.org/wiki/YP_Summit_Lyon_2019.

This is a great resource for layer best practices.  Thanks Paul!

-brad=
