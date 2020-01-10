Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3115136A3D
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 10:50:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vJC26RgwzDqf2
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 20:50:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vJB43szGzDqcy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 20:49:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 01:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,415,1571727600"; d="scan'208";a="272360527"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2020 01:49:56 -0800
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 10 Jan 2020 09:49:55 +0000
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Jan 2020 09:49:55 +0000
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Fri, 10 Jan 2020 09:49:55 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Subject: Event Service - support for multiple protocols
Thread-Topic: Event Service - support for multiple protocols
Thread-Index: AdXHmFAh3LW+ur4/RPSTjibPd2GD8g==
Date: Fri, 10 Jan 2020 09:49:54 +0000
Message-ID: <44773a366aa849ad9ee6c6f6376ad45e@intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDkxZWQ4NjEtMTVmOC00NmYyLTlkMmMtODQ2MTFiMjYwY2FjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT1hEM0ZwZ3dMYXA4cEczeFdQMHZsdHFyZXRhS2luQ20rMU9OUFB6Q2ZhWU90b01vb29DVnViUk9EYmFFVVhGSCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-originating-ip: [163.33.253.164]
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
 Adrian" <adrian.ambrozewicz@intel.com>, "Lawniczak,
 Maciej" <maciej.lawniczak@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,=20

I was wondering whether to make it part of design review, but I would like =
to discuss my thoughts/questions here.=20
My focus is mainly on telemetry and crashlog parts, not the events. As for =
telemetry, we would like to be able to support not only the native Redfish =
metric report and protocols defined by the DMTF. We do not want to define n=
ew Redfish schema for the subscription, but rather reuse EventDestination s=
chema. Is it possible to extend the proposed architecture of Event Service =
to support Kafka or MQTT telemetry streaming instead only Redfish Metric Re=
port via the SSE or push-style events? I was thinking to use 'Protocol' pro=
perty in the EventDestiation schema to define the protocol used (like Kafka=
 or MQTT). Did you think about it?=20



Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.=20
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

