Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D43E29661D
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 18:19:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cbbm1R2MzDrP5
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:19:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cbb35RLWzDrJB
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 02:19:10 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E6FA614E0C8;
 Tue, 20 Aug 2019 12:19:05 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Integrate collectd with OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6UO0T7Dq4--QDXGkbWZ3CwKAhFSLxy5rKeMW-Af=V=o_A@mail.gmail.com>
Date: Tue, 20 Aug 2019 12:19:05 -0400
Message-Id: <843FFB1F-4CF1-45EB-80E1-216FD23C8E2D@fuzziesquirrel.com>
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
 <20190722163049.kyupys7alq6zzq6x@thinkpad>
 <CAGMNF6UO0T7Dq4--QDXGkbWZ3CwKAhFSLxy5rKeMW-Af=V=o_A@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
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
Cc: Gabriel Matute <gmatute@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 12:30 PM, Kun Yi <kunyi@google.com> wrote:

> hi Brad,
>
> We are making some progress toward two things that we'd like to push =20
> upstream:
> 1. An C++ wrapper for RRD "-- librrdplus=E2=80=9D
> 2. An IPMI OEM handler -- "rrd-ipmi-blobs=E2=80=9D
>
> Would you please help create these two repositories?

done!

Sorry about the delay Kun.  I added this to my todo list and then forgot =
=20
about it :-(

-brad
