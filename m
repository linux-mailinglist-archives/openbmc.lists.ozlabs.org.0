Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE142C0BEB
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 21:04:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g1S52wpYzDqpf
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 05:04:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g1RQ4SBrzDqhD
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 05:03:45 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id CEEE413983C;
 Fri, 27 Sep 2019 15:03:41 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Proposal to merge code into openbmc 2.7 warrior branch
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <586101dc-f7bd-37f8-9377-0ecbb3d4fc88@linux.ibm.com>
Date: Fri, 27 Sep 2019 15:03:41 -0400
Message-Id: <D607707F-741E-46D1-904D-70B5870FA7BF@fuzziesquirrel.com>
References: <586101dc-f7bd-37f8-9377-0ecbb3d4fc88@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 11:29 AM, Joseph Reynolds <jrey@linux.ibm.com> wrote:

> This proposal is to merge code into the [OpenBMC 2.7 warrior fix =20
> branch][].  There are three sets of changes:
> 1. Refresh our warrior branch with fixes from the yocto warrior branch.

poky, meta-openembedded and meta-xilinx had some patches in their warrior=
 =20
branches.  I put them up for review:

https://gerrit.openbmc-project.xyz/q/project:openbmc/openbmc+branch:warri=
or+status:open

TBH I didn=E2=80=99t see all that much that was very interesting.  But I =
also don=E2=80=99t =20
see any problems with pulling that content in.  In the absence of any =20
discussion, if a couple people give them a +1 I=E2=80=99d probably merge =
them.

-brad
