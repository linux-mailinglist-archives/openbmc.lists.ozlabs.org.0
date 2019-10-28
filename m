Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E032E78B7
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:46:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723bX553zzDrNG
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:46:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723Zm6v33zDqK5
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:46:08 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CECB06E201;
 Mon, 28 Oct 2019 14:46:04 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Could someone help to review bmcweb code?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <0e83ea88-f057-c1b9-f968-c503a3486945@linux.intel.com>
Date: Mon, 28 Oct 2019 14:46:04 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <37F47D46-62EB-47CB-8186-E9927D9F6598@fuzziesquirrel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
 <0e83ea88-f057-c1b9-f968-c503a3486945@linux.intel.com>
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



> On Oct 28, 2019, at 2:40 PM, Puli, Apparao =
<apparao.puli@linux.intel.com> wrote:
>=20
> I am waiting for new patch-set from Carol to the one's which was =
mentioned that those are going to be modified and loaded new patch set.

Before even answering his questions?

Is this really the community norm we want to establish?  Questions are =
simply ignored without explanation?=
