Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB497AD7D9
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 13:26:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rm844zSdzDqPG
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 21:26:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rm7S3d51zDqB0
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 21:25:56 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 958005C09F;
 Mon,  9 Sep 2019 07:25:53 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: IBM migrating to entity-manager
Message-Id: <658B795A-BC17-49B9-BDD8-9AA262E3C1A5@fuzziesquirrel.com>
Date: Mon, 9 Sep 2019 07:25:53 -0400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Cc: Santosh Puranik <santosh.puranik.ibm@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I just wanted to let everyone know that IBM will be migrating its OpenBMC=
 =20
deployments to entity-manager/dbus-sensors=E2=80=A6eventually.

The migration is not trivial (a year or more?) and thus you will continue=
 =20
to see IBM contribute to and support the =E2=80=9Cother=E2=80=9D (invento=
ry-manager / =20
hwmon) stack in the shorter term even though this is not our strategic =20
direction.

Some high level things that need to be done to entity-manager before IBM =
=20
could switch:

- Support in frudevice for parsing additional fru formats such as IBMs =20
=E2=80=9Cipz=E2=80=9D fru format VPD and PLDM fru format.
- Support for importing host-firmware-only accessible fru information via=
 =20
in-band channels like pldm or ipmi.

I would encourage the rest of the OpenBMC community to think about how =20
entity-manager could be enhanced to meet your needs and join IBM in this =
=20
migration - we are all better served collaborating around a single =20
inventory / sensors stack.

thx - brad
