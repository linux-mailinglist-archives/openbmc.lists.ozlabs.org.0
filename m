Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D0F7940
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 17:56:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BcTS2PVXzF4Nr
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 03:56:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BcSW33JvzDrgj
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 03:55:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id F2365166D31;
 Mon, 11 Nov 2019 11:55:17 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: in-band hardware management after IPMI
Message-Id: <18608ACD-34D8-4408-B0C1-B5185A92CE2B@fuzziesquirrel.com>
Date: Mon, 11 Nov 2019 11:55:17 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "OCP-HWmgt@ocp-all.groups.io" <OCP-HWmgt@OCP-All.groups.io>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

This is my first post to the hardware management list.  I'm Brad, I work =
for IBM and I'm the TSC chair of the OpenBMC project.  I've cross posted =
to both the OCP HW management mailing list and the OpenBMC project =
mailing list because I expect both audiences are interested in the =
discussion.

My question is mostly simple - The answers will likely not be.  I would =
like to know whatever anyone is willing to share about in-band hardware =
management plans in a post-IPMI world.  By in-band I mean applications =
(or firmware) running on host processors in the same server as a BMC.

Will you use Redfish?  PLDM?  A mix?  =46rom host firmware?  =46rom =
Windows?  =46rom Linux?  =46rom virtualized OSes?  =46rom un-virtualized =
OSes?

Thanks!

-brad=
