Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B4F10C808
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 12:35:06 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NwY21p9BzDr0X
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 22:35:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NwW105lDzDqyg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 22:33:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 03:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="199499994"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
 by orsmga007.jf.intel.com with ESMTP; 28 Nov 2019 03:33:04 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX152.ger.corp.intel.com ([169.254.6.76]) with mapi id 14.03.0439.000;
 Thu, 28 Nov 2019 11:33:04 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "neladk@microsoft.com" <neladk@microsoft.com>
Subject: Adding new metric definition use case
Thread-Topic: Adding new metric definition use case
Thread-Index: AdWl3aOwRZz1PlNdQ6G816tHTiv0cw==
Date: Thu, 28 Nov 2019 11:33:03 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWFlODk0NDMtM2EyZi00OWUwLWFjNmUtZjliMWYxOTdhMmFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoianR6azhBTEJ0cVB1eHBzb1dLcWQ1V1FlUXdvVTJacG9rdXhxXC9uQlBMR1JrZWhwNmpGSWYyNHhhK3VCb3ZBdGMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Neeraj,

	As we talked recently during the Telemetry WG meeting, you were asking abo=
ut adding new metric definitions. Please, let me better understand your use=
 case, you have HW sensor present on the board (for example, let it be CPU0=
 VR temperature), you have already HWmon reading it and exposing it as the =
sensor on D-Bus. You want to be able to add the new Metric Definition for p=
roper interpretation of sensor's reading and new metric definition shall al=
so modify sensor's D-Bus parameters (Scale and Unit) ? Do I understand it c=
orrectly?=20
	Monitoring Service does not have to interpret the metric from the sensors,=
 because it is used only for report management.=20
	=20

Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.=20
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

