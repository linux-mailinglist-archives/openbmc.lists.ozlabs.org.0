Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB9720CFEF
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 17:55:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wXC70D3jzDqYM
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 01:55:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wX9r1H9KzDqWT
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 01:54:32 +1000 (AEST)
IronPort-SDR: 6nBy3ZCzONcBvUVurqGN6IudSqy+99GQMXnfaJ0qBeytrGvAsJJNfqicLyDBwGBKEG//gH7yPm
 GBJo/YK1oGow==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="145989071"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="145989071"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 08:54:28 -0700
IronPort-SDR: 5xQhe5Yz7KnH98tzmIdzDmRTxKU7yPmN+qcxl2HvRcDaFV9/xrMwzu229B944EIt+KtP+3d2ty
 tNqDvfJBh0GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="454238180"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
 by orsmga005.jf.intel.com with ESMTP; 29 Jun 2020 08:54:27 -0700
Received: from irsmsx604.ger.corp.intel.com (163.33.146.137) by
 IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 16:54:26 +0100
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 IRSMSX604.ger.corp.intel.com (163.33.146.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 29 Jun 2020 16:54:26 +0100
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Mon, 29 Jun 2020 16:54:26 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC health statistics
Thread-Topic: OpenBMC health statistics
Thread-Index: AdZOLPWDDv1xqlasSdaTVfH5fJhasA==
Date: Mon, 29 Jun 2020 15:54:26 +0000
Message-ID: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
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

Hello,=20

I would like to upload the OpenBMC health statistics design guide for peopl=
e that would like to integrate the OpenBMC to their platforms. I would not =
like to put it into /docs/designs, since this is not exactly design how it =
will be implemented. This document was meant to guide the OpenBMC users how=
 they can implement BMC health statistics themselves.=20

The question is, where would be the best place to upload such document? =20

Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.=20
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

