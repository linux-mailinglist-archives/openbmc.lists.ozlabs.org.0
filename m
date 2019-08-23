Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B19A4C6
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 03:10:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F3HF6sNzzDrg8
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 11:10:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F3GS23whzDrfN
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 11:09:50 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9850B14E0C8;
 Thu, 22 Aug 2019 21:09:45 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Build break in the latest openbmc tree.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
Date: Thu, 22 Aug 2019 21:09:45 -0400
Message-Id: <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 akuster808@gmail.com
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 6:38 PM, James Feist <james.feist@linux.intel.com> wrote:

> On 8/22/19 3:35 PM, Jae Hyun Yoo wrote:
>> Hi brad,
>
> + The mailing list
>
>> We met a build break while making Intel platform builds.
>> ERROR: No recipes available for:
>> /home/yoojae/workspace/openbmc/meta-security/recipes-kernel/linux/linu=
x-stable_5.2.bbappend =20
>> It was added by the subtree update patch but there is no main recipe f=
or =20
>> it. Did we miss something?
>> Thanks,
>> Jae

Hi Jae

linux-stable is in meta-odroid:
https://lists.yoctoproject.org/pipermail/yocto/2019-August/046424.html

It isn=E2=80=99t clear to me if meta-security is supposed to have a hard =
dependency =20
on meta-odroid or not.

Hi Armin

Could you suggest what the right thing to do here might be?

thx!
brad
