Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 800351633C6
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 22:03:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MYHP57dSzDqLx
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 08:03:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYDH63fPzDqdp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 08:01:03 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
Date: Tue, 18 Feb 2020 16:01:00 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>>> Please could you help with your thoughts on this ?.. What is the =
Industry norm on this ?
>>=20
>> FWIW on our (IBM) system designs we usually hook an RTC up to the =
BMC, and any host software needing a RTC has to get it via some in-band =
software interface.  I think I heard somewhere though that often in =
other systems designs the RTC is connected to the host processors and =
the BMC doesn=E2=80=99t have access to it.
>=20
> FB's OCP designs all have the RTC to the Host, so I'm not sure any of
> this is applicable to us.

Are there any down sides to designs like this?  I guess if NTP is not an =
option on the BMC, you are at the mercy of the host firmware if you want =
correct time.  If NTP is in use on the BMC does an RTC still do anything =
for you?=
