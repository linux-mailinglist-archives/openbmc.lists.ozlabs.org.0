Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED53CAF37
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 00:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQq4T6wv6z3bSp
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 08:37:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=tony.luck@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQjcV27KFz2yhr;
 Fri, 16 Jul 2021 04:30:57 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232435789"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="232435789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 11:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; d="scan'208";a="413725599"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2021 11:29:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 11:29:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 11:29:46 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.010;
 Thu, 15 Jul 2021 11:29:46 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>, "Winiarska, Iwona"
 <iwona.winiarska@intel.com>
Subject: RE: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXd2pbzZadhIqqdEqWEklQPBy5PKtDKGuAgAGQOwCAABg7gP//jU5Q
Date: Thu, 15 Jul 2021 18:29:46 +0000
Message-ID: <475c3f70da104d4bac6a902cc41e48d8@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-2-iwona.winiarska@intel.com>
 <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
 <218ef97a68491e88d8012799385ee244544a157a.camel@intel.com>
 <CAPcyv4hxsjKjLkEgGuG6tHvYxUa69315OvhYRORvCtXv6vu2nw@mail.gmail.com>
In-Reply-To: <CAPcyv4hxsjKjLkEgGuG6tHvYxUa69315OvhYRORvCtXv6vu2nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Jul 2021 08:37:03 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBIYXZpbmcgMiBwb3RlbnRpYWwgcGxhY2VzIGZvciB0aGUgc2FtZSBkZWZpbml0aW9uIGNhdXNl
cyBhIHNtYWxsDQo+IG9uZ29pbmcgbWFpbnRlbmFuY2UgLyByZXZpZXcgYnVyZGVuLCBzbyBJIHZv
dGUgbW92aW5nIHRoZSBmaWxlIHJhdGhlcg0KPiB0aGFuIGxlYXZpbmcgYSBwbGFjZSBob2xkZXIs
IGJ1dCBpdCdzIHVsdGltYXRlbHkgYW4geDg2IG1haW50YWluZXINCj4gY2FsbC4NCg0KSSB0aG91
Z2h0IHRoZSBwYXRjaCBrZXB0IHRoZSBvbGQgZmlsZSBhcyBhIHN0dWIgd2l0aCBqdXN0IG9uZSBs
aW5lOg0KDQojaW5jbHVkZSA8bGludXgveDg2L2ludGVsLWZhbWlseS5oPg0KDQp0byBncmFiIHRo
ZSByZWFsIGRhdGEgZnJvbSB0aGUgbmV3IGxvY2F0aW9uLiAgU28gdGhlIGluZm9ybWF0aW9uIGlz
bid0DQppbiB0d28gcGxhY2VzLg0KDQokIGdpdCBncmVwIC1sIGFzbS9pbnRlbC1mYW1pbHkuaCB8
IHdjIC1sDQo1Mw0KDQpEYW5nLiBXZSBzZWVtIHRvIGxvdmUgc3ByYXlpbmcgbW9kZWwgc3BlY2lm
aWMgY29kZSBhbGwgb3ZlciB0aGUgcGxhY2UgOi0oDQoNCk15IG9waW5pb24gaXMgdG8gcG9zdCBh
cyBJd29uYSB3cm90ZSBpdCAuLi4gYnV0IGJlIHByZXBhcmVkIGZvciB0aGUgbWFpbnRhaW5lcnMN
CnRvIHNheSAiSXQncyBvbmx5IDUzIGZpbGVzIC4uLiBqdXN0IGZpeCB0aGVtIGFsbCINCg0KLVRv
bnkNCg0K
