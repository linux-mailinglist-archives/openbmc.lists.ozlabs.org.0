Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5658F1C970F
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 19:04:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J0Df3r4czDqjT
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 03:04:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jakub.dlugolecki@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hzyn0nbNzDqS2
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 02:52:07 +1000 (AEST)
IronPort-SDR: eozyE9pLGZcqSdOeOsA1YH8wuuBG9MVJsm1BvbKBE5y3E7rUBf0qgCc41dxjSEtAPW4iAq1wR2
 e6Bye3lhBJiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 09:52:05 -0700
IronPort-SDR: dWlS6ueCCK27QCxrLUceXhG51OPc0hFvOxILhydudx9oB9S0zwSQznqp8z4UKRWhed1ctOkqpC
 xvCEyJMjdMEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="462205700"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by fmsmga006.fm.intel.com with ESMTP; 07 May 2020 09:52:04 -0700
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx105.ger.corp.intel.com (163.33.3.28) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 7 May 2020 17:52:03 +0100
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 7 May 2020 17:52:03 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Thu, 7 May 2020 17:52:03 +0100
From: "Dlugolecki, Jakub" <jakub.dlugolecki@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Prometheus telemetry exporter for OpenBmc - repository location
Thread-Topic: Prometheus telemetry exporter for OpenBmc - repository location
Thread-Index: AdYkj5vvpNNV4kcSS0e+Kh77qQiyqQ==
Date: Thu, 7 May 2020 16:52:03 +0000
Message-ID: <b422a05c874e423ca0ad556ace9f8d03@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.0.600.7
dlp-product: dlpe-windows
dlp-reaction: no-action
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi OpenBmc Community,

We would like to release a Prometheus exporter for telemetry collected via =
Redfish protocol.
Our team uses this exporter for OpenBmc telemetry collection and for health=
 monitoring.

Would you agree create a repository in https://github.com/openbmc/ organiza=
tion?

My initial idea was to create a repository in a Prometheus GitHub organizat=
ion.
Unfortunately, Prometheus project does not have any dedicated space for thi=
rd party exporters:
https://prometheus.io/docs/instrumenting/exporters/

Thank you,
Jakub
