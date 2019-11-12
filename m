Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33132F990B
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 19:47:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CGvm1LfDzF5dr
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 05:47:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CFnk3L1BzF5Ty
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 04:57:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7B3786E223;
 Tue, 12 Nov 2019 12:57:23 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: HCL CLA Update
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <SG2PR04MB2876740BC6913B8AB5746397FC770@SG2PR04MB2876.apcprd04.prod.outlook.com>
Date: Tue, 12 Nov 2019 12:57:23 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D00B73B-1D86-4FFA-A59B-BACF4A79D0EC@fuzziesquirrel.com>
References: <SG2PR04MB2876DAF2455DB54427EFFFD6FC660@SG2PR04MB2876.apcprd04.prod.outlook.com>
 <FFEF2719-9A94-4D8A-9409-7D90A4957D1A@fuzziesquirrel.com>
 <SG2PR04MB2876740BC6913B8AB5746397FC770@SG2PR04MB2876.apcprd04.prod.outlook.com>
To: Agnes Amreetha Joseph Arulraj <agnes.amree@hcl.com>
X-Mailer: Apple Mail (2.3601.0.10)
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


> On Nov 12, 2019, at 1:10 AM, Agnes Amreetha Joseph Arulraj =
<agnes.amree@hcl.com> wrote:
>=20
> Hi Brad,
> =20
> I am observing the below issue in my gerrit review =E2=80=9CUser not =
approved, no CI=E2=80=9D. Could you guide me in how to proceed with =
this?
> =20
> <image001.png>
> =20
> =46rom the link I observed, " =
https://github.com/openbmc/meta-ami/pull/1",=20
> For the "User not approved, see admin, no CI" part, =
@bradbishop<https://github.com/bradbishop> should be creating you a =
gerrit group here soon so you and your team will be approved.
> =20
> Hence I am reaching out you, in this part.=20

Hi J. Agnes

I created a new ACL hcl/ci-authorized and added you to it.  Subsequent =
patch submissions from you should trigger CI automatically now.

thx - brad=
