Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820DCEEF3
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 00:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nFGC2mxRzDqMK
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 09:17:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nFFf5rHXzDqJC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 09:16:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2996D1866D1;
 Mon,  7 Oct 2019 18:16:49 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: unit test build failure in phosphor-hwmon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPnigKk4_fAD-Y-W_Uu4Z4-ZXq-SKvS+MDtgth=WZsYHLSf4eQ@mail.gmail.com>
Date: Mon, 7 Oct 2019 18:16:48 -0400
Content-Transfer-Encoding: 7bit
Message-Id: <EB769CC4-2C13-4A23-9784-E22B1D822C46@fuzziesquirrel.com>
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
 <46DC7782-8F89-4890-9876-E54895CC8C98@fuzziesquirrel.com>
 <CAO=notyDgrSBRsKcuT0vwFLQi91hAco4dH7v=NPeK__+-PhpEQ@mail.gmail.com>
 <CAPnigKk4_fAD-Y-W_Uu4Z4-ZXq-SKvS+MDtgth=WZsYHLSf4eQ@mail.gmail.com>
To: William Kennington <wak@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
 Matt Spinler <mspinler@linux.ibm.com>, Andrew Geissler <geissonator@yahoo.com>,
 wangkair@cn.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 4:43 PM, William Kennington <wak@google.com> wrote:

> Looks like someone is comparing longs to uint64_t's or something,
> which works on 64 bit arches but not 32-bit ones where unint64_t is
> long long int.

This was most definitely the problem:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/25879/1

Thanks William!

-brad
