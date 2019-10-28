Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C20E78CD
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:56:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723p60npkzDrNG
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:55:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723nG0Vy9zDrG2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:55:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 6E0AF6E201;
 Mon, 28 Oct 2019 14:55:08 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Could someone help to review bmcweb code?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <38183aaf-4ef9-a8b0-8394-95f86dabcbbb@linux.intel.com>
Date: Mon, 28 Oct 2019 14:55:08 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CB62B71-B5AC-4482-A67E-D2951638BC1A@fuzziesquirrel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
 <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
 <D2F9CCC1-AAB3-4365-9C5A-E4764D7D099A@fuzziesquirrel.com>
 <3879e352-3d6f-6742-b94c-678b6ba7e286@linux.intel.com>
 <38183aaf-4ef9-a8b0-8394-95f86dabcbbb@linux.intel.com>
To: "Puli, Apparao" <apparao.puli@linux.intel.com>
X-Mailer: Apple Mail (2.3594.4.19)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Oct 28, 2019, at 2:49 PM, Puli, Apparao =
<apparao.puli@linux.intel.com> wrote:
>=20
> Yeah, on it.

thanks AppaRao!

-brad=
