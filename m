Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB5AD848
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 13:51:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RmhP18mmzDqPj
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 21:51:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rmgc0MrXzDqP1
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 21:50:18 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8FF135C09F;
 Mon,  9 Sep 2019 07:50:14 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Persistent storage of AssetTag
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <MWHPR13MB1360F536BDF71319FE7FA457EDA40@MWHPR13MB1360.namprd13.prod.outlook.com>
Date: Mon, 9 Sep 2019 07:50:14 -0400
Message-Id: <B5261E52-3D09-460E-B2EB-60372868A790@fuzziesquirrel.com>
References: <MWHPR13MB1360F536BDF71319FE7FA457EDA40@MWHPR13MB1360.namprd13.prod.outlook.com>
To: Troy.Lee@vertiv.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>, gkeishin@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 5:28 AM, Troy.Lee@vertiv.com wrote:

> We met an issue about persistent storage of AssetTag.
> AssetTag is managed by phosphor-inventor-manager, and it was defined wi=
th =20
> assettag.yaml.
> Though we could update the AssetTag with DCMI command over IPMI or DBus=
, =20
> but the value will not retain after BMC reboot.
>
> Does this behavior work as expect in OpenBMC? (AssetTag become empty =20
> string after reboot)

I don=E2=80=99t see how.  George does our testing framework allow us to c=
heck for =20
things like this -after- rebooting the bmc?

> Does anyone have suggestion how to change the YAML to have persistent =20
> storage for Asset Tag?

There should probably be a check to see if the objects exists already or =
=20
not here:

https://github.com/openbmc/phosphor-inventory-manager/blob/master/manager=
.cpp#L293
