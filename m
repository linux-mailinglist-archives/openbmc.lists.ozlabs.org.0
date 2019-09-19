Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8FB7E6F
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 17:42:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1Ls6wsWzF3qh
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 01:42:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z16r5X08zF4tJ
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 01:32:04 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9AAA36DECB;
 Thu, 19 Sep 2019 11:32:01 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2 linux dev-5.3 0/5] ARM: dts: aspeed-g6 lpc, rainier
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
Date: Thu, 19 Sep 2019 11:32:01 -0400
Message-Id: <01789E02-E182-49A0-8901-97501F35F51F@fuzziesquirrel.com>
References: <20190919152340.23133-1-bradleyb@fuzziesquirrel.com>
To: Joel Stanley <joel@jms.id.au>
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

at 11:23 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:

>> This is a quick attempt at wiring up some of the LPC bits on the
>> AST2600, and then using it on a new board, Rainier, a new POWER system
>> with an AST2600.  The only verification performed was ensuring the
>> kernel still booted and the ibt device probed using the Rainier device
>> tree atop the ast2600-evb qemu model.  Please review.

I=E2=80=99ve sent the v2 of this series twice.  Apparently I can=E2=80=99=
t do email.  Sorry =20
about the spam.

-brad
