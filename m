Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 632241AB624
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 05:19:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492kwt5Gq6zDrDr
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 13:19:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=carlson.net
 (client-ip=216.40.44.179; helo=smtprelay.hostedemail.com;
 envelope-from=mark@carlson.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=carlson.net
X-Greylist: delayed 604 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Apr 2020 13:18:57 AEST
Received: from smtprelay.hostedemail.com (smtprelay0179.hostedemail.com
 [216.40.44.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492kw16RCYzDr4r
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 13:18:55 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 4333D18289DEB
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 03:08:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id EB10B181D337B;
 Thu, 16 Apr 2020 03:08:47 +0000 (UTC)
X-Session-Marker: 6D61726B406361726C736F6E2E6E6574
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, , ,
 RULES_HIT:41:152:355:379:541:599:800:960:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1431:1437:1513:1515:1516:1518:1521:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2553:2559:2562:3138:3139:3140:3141:3142:3351:3865:3866:3867:3868:3870:3871:3873:4250:5007:6117:7652:10004:10400:10848:11232:11658:11914:12297:13069:13149:13230:13311:13357:14181:14721:14725:14777:21080:21324:21433:21627:21939:30054:30090,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: bat78_4cb61bcb45562
X-Filterd-Recvd-Size: 1386
Received: from [192.168.86.20] (unknown [72.19.133.27])
 (Authenticated sender: mark@carlson.net)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Thu, 16 Apr 2020 03:08:47 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: nvme sensors
From: Mark Carlson <mark@carlson.net>
In-Reply-To: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
Date: Wed, 15 Apr 2020 21:08:45 -0600
Message-Id: <38C6FED3-EACB-4BE9-B3AE-4FE34D2982AF@carlson.net>
References: <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
X-Mailer: iPad Mail (17E255)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>, Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

NVMe-MI. Over MCTP. This gets you into a broad range of SSDs for management.=

Also would like to look to I3C Basic for MCTP in the future, and I know DMTF=
 is looking at this. They have a Redfish Device Enablement method for gettin=
g an NVMe drive to respond with Redfish.

=E2=80=94 mark

> On Apr 15, 2020, at 8:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> If you're making
> use of MCTP then I'd like to hear your use-cases so I can make sure the
> kernel interface meets everyone's requirements.
