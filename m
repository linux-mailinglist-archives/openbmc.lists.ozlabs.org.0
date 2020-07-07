Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26429217C1F
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 02:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1ft22vLhzDr3L
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 10:13:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=john.leung@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=ZRqMWmi+; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1T7b3ZcszDqpr
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 02:54:46 +1000 (AEST)
IronPort-SDR: YlSz9jsLHXF+z79UxlRYJ1GnKM/kf1pniPlEZEDzhwZzVO20eLtQGJ3QiIrgmF12zbQK0by91z
 qNuGqvs0DRKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="135113017"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="135113017"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 09:54:41 -0700
IronPort-SDR: GvN6b1mZI8yvpO9Xr2vke5nPL9s3sKd3/wW0uhdX+r9CEDi65hRRRcpHdADtqIjlTjS7Blc3JB
 N5hh2J+A1BnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="357838038"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 07 Jul 2020 09:54:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 7 Jul 2020 09:54:41 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 7 Jul 2020 09:54:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 7 Jul 2020 09:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Psedm4E7uh9ymLAkZO+5zsz+KjQlowSly803frJeEJLSmYiITQj+0zveCxrO+By85xXeziktRstLEqK1WYf/ZvVj6osDdv9oWsA0qHtDpdakgPeBjdEgDjgI4CK3mH6+h5MQcCSqt5+XBLP5IzuECOAqwE5Ju01ZKrqtKkkuPGV0U3ES4gT0UbKeiPN8SCc9N/xuKvTvJ2wYwLG+5aAWipw87engh5bduS+xx17izbhk2fE5uGu54faxcahu0IRtPNlIFavkwSZF1oUosZpoJ9Ijl/fNS/aM87mY5F54ziapAUiR35+z9PtfGgFJxcqmHcSRVSSjohroSzuptIb6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlbQUiyPk+UDQaZ6boMPTySXMGs7BQ/jLdmnID5wqQg=;
 b=oY2uj2nejrbHPe41pYHk0le6vZdMxRkyHx1iR5Iy411oCHlj2lznSUZ1w91V99P/xdflXB7jSOUpKMipV7WTVFij6a9zig0dd2SmB+uEeEjPEEtXMVqbgIg8pFkuwzyxE6k5s5qPkYpwLNTE9vfq/hJ7gYAFnhdPI8XE1LacQy3NvZUZs2T3bBLtE8ktwl1K9M4AqOXa7VHWP6PIn/9+d+2xLnswreJi/P+kGvkT11eIB1Fa7fhKNn8uh35DJm4JIrElNNddtJjKtTxOmv+lorFNcPoFTJVvlM6sXMJAnIx+iWZqiF8Re4XkKr8o3fSsPZOHgOjooRPwvFsV2iU4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlbQUiyPk+UDQaZ6boMPTySXMGs7BQ/jLdmnID5wqQg=;
 b=ZRqMWmi+6B/v+28b83NlUD99Rrfc6OMJzpO29m/wtXgf/f6GGqmnI+18PUQvVs0X7jffAJ8O9y0GOpfIth2vRacm8rgP8/jrgLtbtmiUUKO5ujOxqpNHBb1xYdOaC1G+kQM+YuBpRD8sZx2vZi05fGkD9hV8qfV9xEva5WG6r7A=
Received: from BYAPR11MB2982.namprd11.prod.outlook.com (2603:10b6:a03:84::10)
 by BYAPR11MB3591.namprd11.prod.outlook.com (2603:10b6:a03:b4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Tue, 7 Jul
 2020 16:54:39 +0000
Received: from BYAPR11MB2982.namprd11.prod.outlook.com
 ([fe80::10ed:fe19:5b55:5f86]) by BYAPR11MB2982.namprd11.prod.outlook.com
 ([fe80::10ed:fe19:5b55:5f86%7]) with mapi id 15.20.3174.020; Tue, 7 Jul 2020
 16:54:39 +0000
From: "Leung, John" <john.leung@intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Redfish Processor Command
Thread-Topic: Redfish Processor Command
Thread-Index: AQHWU+K7wsYTM5nngU21l9zuYI184qj8VFZw
Date: Tue, 7 Jul 2020 16:54:38 +0000
Message-ID: <BYAPR11MB2982E205A5A403CA9E173EB997660@BYAPR11MB2982.namprd11.prod.outlook.com>
References: <16576aa9-ae11-82b7-8f31-88f82684d703@linux.intel.com>
In-Reply-To: <16576aa9-ae11-82b7-8f31-88f82684d703@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1658e3a-32ae-4b9d-369a-08d822966ff3
x-ms-traffictypediagnostic: BYAPR11MB3591:
x-microsoft-antispam-prvs: <BYAPR11MB359179412CC56EAE267D79D497660@BYAPR11MB3591.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K+J3TZWnzE4n706MoirQZpe1PK0XjGgO07ERbiAqFFzsbISFnbeZc3ZUMI2uEA2w68gntFJDM48vWGQod0aMp8hsuHfQFyoVrcRGEEIgHG1afYGT5Yoca55lUwIvfMnX5AYasnQCuCE4dwzaDvlbd6DGOnbyq7zrQKKXOEL0+Co2lzQtS1OJyZagMPPZoDAc10VVd+H43FHI4WAFEnMe2kNFKcSDfPh/LvbMA2Hvd/h3SvZTLBo0GnbnzfDxNiKaZmDNLeFNVKaDDPOO6u7WlavHnF3mfWZBJLqxU0Jva0ZyeLhIZHk9K/jw7o2wupXLd44+3IZ3C4ROQGiFkfTDuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2982.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(186003)(83380400001)(26005)(8676002)(64756008)(66476007)(498600001)(33656002)(53546011)(66446008)(66556008)(7696005)(7116003)(76116006)(66946007)(8936002)(86362001)(110136005)(6506007)(2906002)(3480700007)(5660300002)(55016002)(9686003)(71200400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qtgCIymfdwW+5PDVBbZ4j2CoIooyI+MWDLcX5ibVEUDghljGqUpCSBZBEBSZldPqaC5q3WleOg8I7wQpvULQuqDucdTE9TEduhaVv/xc6g6GF9J6EEJJDFYjp0+9VqYUwsohVsRaiJoh5ZXcyM4KeM2CCve2By1K/xsBAZw0E9ScL8sbfEcaV8MoCUQnAU2mpd9Yvi1VYMAjdC5KOGVYjDkQODJrlDAR+TjYM3J2ICvNTJhDhm7ikarHtYI9LSlXb9moab0f2eqWgImo32OJsiOTDpSLJ/ylcM2BPhXJ8UJ5uZS+G1DKlZMJXmwnIsVo1HvXCX4D5JxwO+GH5NsB81/wpHrAtESPLawGoTJRvUuRgCmr0NbLSgntbHOJJBLUuB8zhweU1eWPjDogzVTj9/3sMllTaab6zGzPtC1U0gZWkrvONwRk4QMNg9HJS9qqXDWju3JJ8OyqGY7RJDVOmgTwzLixdgFWWrZTEVQxclSLitdSN5zUEMRap4EsUK4N
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2982.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1658e3a-32ae-4b9d-369a-08d822966ff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 16:54:38.9955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89UATNVslFQu4nf4Q30xSGd3O2St5zFPREeikj6f42321gBX6GtTpg2rmc17esC7fITzl0ne+pGDEyNt/hjf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3591
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 08 Jul 2020 10:10:34 +1000
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

VGhlIHByb3Bvc2FsIGluIHRoZSBETVRGIHdhcyB0byBuYW1lIHRoZSBhY3Rpb24gc29tZXRoaW5n
IG1vcmUgZ2VuZXJpYywgU2VuZFByb2Nlc3NvckNvbW1hbmQsIHdoaWNoIG90aGVyIHByb2Nlc3Nv
ciBjb21wYW5pZXMgY291bGQgdXNlLg0KDQpUaGUgcmF0aW9uYWxlIG9mIHRoZSBETVRGIHdhcyB0
aGF0IHRoZSB1bmRlcmx5aW5nIGNvbW1hbmRzIG1pZ2h0IGJlIGRpZmZlcmVudCwganVzdCBoYXZl
IHRoZSBzYW1lIHByb3BlcnR5IG5hbWUgbWF5IGNhdXNlIGNvbmZ1c2lvbiwgYW5kIGhpZ2hseSBy
ZWNvbW1lbmRlZCB1c2luZyB0aGUgT0VNIHN0cnVjdHVyZS4gVGhleSB3ZXJlIG9wZW4gdG8gZW5k
LXVzZXIgKFJlZGZpc2ggY2xpZW50KSBmZWVkYmFjayBvbiB0aGUgdmFsdWUgb2YgYSBjb21tb24g
YWN0aW9uIG5hbWUuDQoNClJlZ2FyZHMsDQpKb2huDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBCaWxscywgSmFzb24gTSA8amFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+
IA0KU2VudDogTW9uZGF5LCBKdWx5IDYsIDIwMjAgMzoxNCBQTQ0KVG86IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZzsgTGV1bmcsIEpvaG4gPGpvaG4ubGV1bmdAaW50ZWwuY29tPg0KU3ViamVjdDog
UmVkZmlzaCBQcm9jZXNzb3IgQ29tbWFuZA0KDQpIaSBBbGwsDQoNCkludGVsIHByb2Nlc3NvcnMg
aGF2ZSBhbiBpbnRlcmZhY2UgY2FsbGVkIFBFQ0kgdGhhdCBhbGxvd3MgY29tbWFuZHMgdG8gYmUg
c2VudCB0byB0aGUgcHJvY2Vzc29yIGZyb20gdGhlIEJNQywgYW5kIHdlIGN1cnJlbnRseSBwcm92
aWRlIGEgUmVkZmlzaCBPRU0gYWN0aW9uIHRvIHNlbmQgUEVDSSBjb21tYW5kcyB0byB0aGUgcHJv
Y2Vzc29yLg0KDQpXZSBwcm9wb3NlZCB0byB0aGUgRE1URiB0byBhZGQgYSBzdGFuZGFyZCBjb21t
YW5kIGFjdGlvbiB0byB0aGUgUmVkZmlzaCBQcm9jZXNzb3IgcmVzb3VyY2UgZm9yIHRoaXMgcHVy
cG9zZSwgYW5kIHRoZWlyIHN1Z2dlc3Rpb24gd2FzIHRvIGp1c3Qga2VlcCBpdCBhcyBhbiBPRU0g
YWN0aW9uLg0KDQpXZSdyZSBub3cgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgdGhlIHJpZ2h0IHdheSB0
byBoYW5kbGUgdGhpcyBjYXBhYmlsaXR5IGluIE9wZW5CTUMuICBXb3VsZCBhbnlvbmUgZWxzZSBo
YXZlIHVzZSBvZiBhIGdlbmVyaWMgcHJvY2Vzc29yIGNvbW1hbmQgYWN0aW9uIGluIG91ciBPcGVu
Qk1DIFJlZGZpc2ggaW1wbGVtZW50YXRpb24/DQoNClRoYW5rcyENCi1KYXNvbg0K
