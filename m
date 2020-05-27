Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A341E4250
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 14:30:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X9CM4V9VzDqTl
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 22:30:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X95S4CBTzDqS7
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 22:25:13 +1000 (AEST)
IronPort-SDR: Q9xm/muSHV5T6wb+CyBKNmEieQc3UfP8Sxm+EwuvqRhXwXDK/F13CP19uZG/v6t29K3GRqagMC
 6E+AvCEIDMXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 05:25:09 -0700
IronPort-SDR: H5L5ii9c2B8pAg2GP+SIPsSK3tBAeNO/lH0jhzaxipmexyFi4jLMxRKwGayl94q4j1eXZIL00e
 UL+V5tBApjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; d="scan'208";a="256750945"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 27 May 2020 05:25:09 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 05:25:09 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 20:25:07 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.1713.004;
 Wed, 27 May 2020 20:25:07 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: ?? <yulei.sh@bytedance.com>
Subject: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Topic: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Index: AQHWNAoiHqXsmqwbA0iM3Or4iwImpKi72vVw
Date: Wed, 27 May 2020 12:25:06 +0000
Message-ID: <c3ab98b048824b50859560d747d07f84@intel.com>
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
 <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
In-Reply-To: <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T2ssIGl0IGlzIGEgd29ya2luZyB3YXksIHdlIGNvdWxkIGRpc2N1c3MgbW9yZSBkZXRhaWwgb24g
eW91ciBwYXRjaCByZXZpZXcuDQoNCg0KVGhhbmtzLA0KS3dpbi4NCg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTog6YOB6Zu3IFttYWlsdG86eXVsZWkuc2hAYnl0ZWRhbmNlLmNv
bV0gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyNywgMjAyMCA1OjM1IFBNDQpUbzogV2FuZywgS3Vp
eWluZyA8a3VpeWluZy53YW5nQGludGVsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNClN1YmplY3Q6IFJFOiBBZGRpbmcgdXNiLWN0cmwgZnJvbSBpbnRlbC1ibWMgaW50byBwaG9z
cGhvci1taXNjDQoNCk9uIFdlZCwgTWF5IDI3LCAyMDIwIGF0IDQ6NDEgUE0gV2FuZywgS3VpeWlu
ZyA8a3VpeWluZy53YW5nQGludGVsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIExlaSwNCj4NCj4gV2hh
dOKAmXMgeW91ciBmaW5hbCBwdXJwb3NlIGZvciB0aGlzPw0KPg0KDQpUaGUgVVNCIEVDTSBkZXZp
Y2UgaXMgYW4gZXRoZXJuZXQgYmV0d2VlbiBCTUMgYW5kIEhvc3QsIHNvIHRoYXQgdGhleSBjb3Vs
ZCBoYXZlIGEgcmVhbCBsb2NhbCBldGhlcm5ldCBiZXR3ZWVuIHRoZW0uDQoNCk9uIHRoaXMgaW50
ZXJuYWwgZXRoZXJuZXQsIGl0IGlzIHBvc3NpYmxlIHRvIGRvIGludGVybmFsIGNvbW11bmljYXRp
b24sIGUuZy4gaG9zdCBjYWxscyBSZWRmaXNoIEFQSSB0byBCTUMgd2l0aG91dCBhbnkgb3V0c2lk
ZS1uZXR3b3JrLg0KDQotLQ0KQlJzLA0KTGVpIFlVDQo=
