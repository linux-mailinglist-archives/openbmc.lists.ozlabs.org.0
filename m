Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F20E7372
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 15:13:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471xXJ02nwzDr1d
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 01:13:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 471xW73ZPjzDqwh
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 01:12:34 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id AD21C6E201;
 Mon, 28 Oct 2019 10:12:31 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: Curiosity: Why is the OpenBMC layer named "phosphor"
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <DF4PR8401MB10841D9A4AB2C85B587D477FD86A0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
Date: Mon, 28 Oct 2019 10:12:31 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5DFCF5B-2691-4308-BB27-4E3A185EF674@fuzziesquirrel.com>
References: <DF4PR8401MB10841D9A4AB2C85B587D477FD86A0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 23, 2019, at 8:21 PM, Muggeridge, Matt =
<matt.muggeridge2@hpe.com> wrote:
>=20
> I see =E2=80=9Cphosphor=E2=80=9D shows up all over the place in =
openbmc.  E.g. meta-phosphor is the OpenBMC layer.
> =20
> Is phosphor a project name that will evolve with OpenBMC generations =
or is it forever static?

At the moment it is static but that isn=E2=80=99t any kind of hard and =
fast rule.  It is typically used to distinguish a default or reference =
implementation but that definition and its usage is certainly fuzzy.

The first platform supported by this project back in 2015 was the =
barreleye system.  Barreleye is a kind of fish - it has a phosphorescent =
glow; meta-phosphor is a nod to those roots of the project.

thx - brad=
