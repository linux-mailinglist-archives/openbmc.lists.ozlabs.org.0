Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A41FAC70
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 11:32:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mNK65gM2zDqlS
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 19:32:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mNJ21R5zzDqjy
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 19:31:44 +1000 (AEST)
IronPort-SDR: 20VAkvN2HXiPzZGScbhPssgKGuj9aFjQh6UQ2cI0RPfLDhlt7bCh1r9AvOplHo1/S01icWlY5O
 I9KCO6DfvuUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 02:31:41 -0700
IronPort-SDR: xquH3GAnSf/Pq/PUR19cAw7Pw15J2qLMjEdkWlqWtQ1/NRTSjDu5IiUa0/gUHDPZYyzRnRXvxR
 FoTJn/Sbntmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="273087109"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 02:31:40 -0700
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 IRSMSX106.ger.corp.intel.com (163.33.3.31) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 16 Jun 2020 10:31:39 +0100
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 16 Jun 2020 10:31:39 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Tue, 16 Jun 2020 10:31:39 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Patch for telemetry design
Thread-Topic: Patch for telemetry design
Thread-Index: AdZDwKBuVxBSuCDdS16VHQTaIqereA==
Date: Tue, 16 Jun 2020 09:31:39 +0000
Message-ID: <8428bc15cb234328a6148d47eb2581c6@intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
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

Hi,=20

I've uploaded patch for telemetry service design some time ago. I would lik=
e to ask you for review.=20
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31690


Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.=20
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

