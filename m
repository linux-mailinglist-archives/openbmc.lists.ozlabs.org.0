Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF24D99E8C
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 20:18:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dt7m3ZPnzDqcP
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 04:18:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Dt714mJLzDqZm
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 04:17:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7C47514E0C8;
 Thu, 22 Aug 2019 14:17:44 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [yocto] assembling lvm disk images
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <MN2PR14MB265597F84291C8F0D51C00FDE6A50@MN2PR14MB2655.namprd14.prod.outlook.com>
Date: Thu, 22 Aug 2019 14:17:44 -0400
Message-Id: <5964717D-2ED9-41A1-9115-74D2BECDD353@fuzziesquirrel.com>
References: <38CEEC26-E746-42DE-B4AD-24BCB29ED326@fuzziesquirrel.com>
 <MN2PR14MB265597F84291C8F0D51C00FDE6A50@MN2PR14MB2655.namprd14.prod.outlook.com>
To: "Schmitt, Richard" <Richard.Schmitt@commscope.com>
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
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 10:28 AM, Schmitt, Richard <Richard.Schmitt@commscope.com> wrote:

> Not sure the type of lvm you're trying to use, but we successfully buil=
d =20
> a dm-verity rootfs offline.
>
> It probably is specific to what type of lvm you are using.
>
> Rich

Thanks for the reply Rich!

I=E2=80=99m not exactly sure what is meant by LVM type.  If I look at the=
 wikipedia =20
page on devicemapper (https://en.wikipedia.org/wiki/Device_mapper) it lis=
ts =20
a number of =E2=80=9Cmapping targets=E2=80=9D - are these the LVM types? =
 If it is, we=E2=80=99d be =20
looking at linear mapping.

The broader objective is to have a system with multiple root filesystems =
on =20
a 16 GB EMMC device, and be able to add/remove/resize additional =20
filesystems using the LVM2 userspace tools, much like a typical binary =20
desktop distro would configure your hard drive.

thx - brad
