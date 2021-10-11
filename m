Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A38DE4298EA
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSsNd1hGMz2yZv
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=gNRR44pP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=gNRR44pP; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSpbP0myZz2xtb;
 Tue, 12 Oct 2021 06:22:34 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="290444408"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="290444408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 12:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="441549587"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 11 Oct 2021 12:21:30 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 12:21:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 12:21:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 12:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWLuveN5l6A3xFExt+UehIFAsuSqYX70PE0prX8UO+pQDRflnw/kIqPsoQw8IxuWdMDlHYy3x1VTyVjz1oVOBW+/7Bgp8mbVPTilZXscONcluA8jCBxMebFSzEwPgUBY7lUkVSJ7d+HczBshAtSy0gHD5AMtEIkLiRr4t08Nd01uNWa2qZaEa/G5opG/29iQiAznbq4X9Z7IH1odb+xT9fYCE7aahrrmOt2biVhxm99YkRhBXMQmrnq/xm9HSbtSHcNVzFNjFPuP1LRf+Xt41Z1ojGXb41OBRdg81qhQfQOmqrDwOC7u2VqtWqp0wVFSoNBwF+xC6ji+ynXLaapH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oKV0tjNOLBvzoBgPCXP18n1AxnuRzj4DPW7ahX+0uc=;
 b=lfYBfVXHdcL+62BZd2v25URsxd46Qol6jqvoIPZop+3ZoYCYzVjHKn17l7lIRe+qN68LwOQNet+8JEn3PHUUpReImr1hUnz70Z/A5KlwLJjmNuY9FWq7rM275TwRhZfWUbNoh9/CtFiqqBMIEqY5qCODQPvaVAuCKbM4WXiq12CrRb53DFPoNYNLoZw2msVf24UnrKNAPZQiLxZoOxPt4Puwh2Df071S21GwGewoTYTFwXE6XIUGWIDxno5Af0yGUUe+WcSqP0iJR5PHpiI2A1dpySRBcp8nnFgBppXDbPeMw7lIPu6ETzKnxe/tXKAKA1Rp7x+Xqxy27+4NvhgHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oKV0tjNOLBvzoBgPCXP18n1AxnuRzj4DPW7ahX+0uc=;
 b=gNRR44pPobp+MzdTgZirNEuQm1AwYzcQFrm9gutx6KRJf1TFt1flV1vaCNFluBjSDbANqirUKmlXKN2bzQcYDkjdWes9RQsSHgea0nTybImFDU5RGK7S8AEmYTfmt+Dy2CFg5qmn28y9riY4mGGi2hn4TO4e7hh4nkwI1bbxqIE=
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com (10.172.76.13) by
 CY4PR11MB1655.namprd11.prod.outlook.com (10.172.71.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18; Mon, 11 Oct 2021 19:21:27 +0000
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc]) by CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc%11]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 19:21:27 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH v2 01/15] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXiFtZAf43JMVeikGj7NGS9LF26KvDlHGAgAsFNYA=
Date: Mon, 11 Oct 2021 19:21:26 +0000
Message-ID: <58ef4107e9b2c60a2605aac0d2fb6670a95bc9e0.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-2-iwona.winiarska@intel.com>
 <YVtQG+idmwKn0qLe@zn.tnic>
In-Reply-To: <YVtQG+idmwKn0qLe@zn.tnic>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2445aaeb-1dc1-4f35-89fd-08d98cec524d
x-ms-traffictypediagnostic: CY4PR11MB1655:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB16559F4541FC70782BFC1C55ECB59@CY4PR11MB1655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfHbrsIan+Iyf9+XTT9Q25qgdBg6kiZ+6JecSoMqo3IHtTKsCkyAPaF/txSmG7yNw9zap7iYq9vuwgUyzz2bleBf+FJjqsOt+v7PCsz8Cv1dUV00RwcNH+JT7T2pBfoNF3s6I8ytoE8G3dTnupqI8m60SQgnwLanZcT4wp/bzI42Y6p4deVgn38cLw7OHVPGsoX98q7IMC1kQ40PZA8BEnjD2td+d55H6Z8EOnALR5zuYmkK1DZ2zEaXxD2oqS4ykpOBZKToeoQC7SXOVB/klgBGUXDfpxLfSC0trIpvjA9O5+aGDrkUZzzRS+40S8IMtNL7yGaML1Lt076KRZCqezr6gMnbr5WpEoGuiECtbUr76Pc4wUgb6RtxqHRrJ23j//GJGR3pzg6FKk/4DAiUDgQPcY49V4SVP5XQ0uEGi2p9+UwhY1v+4JhPRY4B+84wqxn2UU2yUlpk5pOpZ/xE+fRXJT0xB6+VqB0kw6rNh0ox0AJjM8mJUA8cfoXlpp0Qk7fB1U+GuJ9ZRUEMSxYKTIMP/P4brMGh9ZBuBxwSeERImmcTswB9EruQcKGLOlEbMRm5S/WmFEHiqPrspJ02VO6jI7oIB/G1NELXqrW0U/ItZoivQbpkDLlE3MkTLcYHeItv4TmO1y06o6LkdtBZmi246qq7oIUrZNOsgRcW8ThhWp4ml034WjVM6iEoBcxjlrKo9CVyclviwx07epyHJw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(91956017)(66946007)(76116006)(86362001)(4326008)(54906003)(5660300002)(66476007)(66446008)(66556008)(316002)(7406005)(64756008)(7416002)(2616005)(508600001)(186003)(6512007)(38070700005)(122000001)(6916009)(36756003)(2906002)(26005)(83380400001)(6486002)(38100700002)(8676002)(71200400001)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFg0bEkrT0NQRklmd1VpcFZwK3ZWaHNTTlRiNW05OG5IdG03dXJLUUF5UWJk?=
 =?utf-8?B?enVvd3crNnFkMWhlWnorRFE4clVoS2Z1Q21CZms4WnNXdmVYajFIenNKM2hJ?=
 =?utf-8?B?RFJFSTc1UFlkSk1GbDhtQWJlS09qeE5DRjN5aVN4YmZlSjN3NXJJRmY4SHYv?=
 =?utf-8?B?a2hVK09BZVpPR0luMkx1Z1ZkL1NlM21nalVnQVl5Q3R5eENrSWgvQ0U0aVc1?=
 =?utf-8?B?Z2VNNUczKy9GN2lNNEZINDB6UTd6UGlqVm5VNXI4dEluaTk1SVFUY3FIN0c4?=
 =?utf-8?B?bjBQNCtxbFFHeWo0bXdzcUlRQ0RHZWI5MFY1eVBLVUZsUlVXdVlpaUFWOFNS?=
 =?utf-8?B?eStDMitsSWdpbGtTUnArb05mbGRIN3JMTFhHQTBta1Z0RDA3djAxd3Zya1lj?=
 =?utf-8?B?ZXV4YzhNK0hham53TWtwb2M4cWxDL052SGdmVWdBUW1ydDNjWTJHTUhmU1I2?=
 =?utf-8?B?ZjVHbW5EbHlMQXhQM0NMVkF2d25OSjlybWkvQ01IWE1XV1U4RmxKam0rcm5O?=
 =?utf-8?B?T0ttaURmMDhFb2lINXpjc1VsMFdRYzRrOVkrRXJSVmZPVVltYWovWUIzbUJK?=
 =?utf-8?B?MDN4aDR3c2k0YWxVLzY5RXd5MjRyQXZaNDQrOHBPNXgwQjhWdWxLNUFJNU1a?=
 =?utf-8?B?L2NHQjdFZVVON1dFWE5mL1BoK0JHbnRuNGlnU2tDcDF0eEFOMk5qbmJaaTNo?=
 =?utf-8?B?ZWx0YnBlMHVnb3ZObk1KdXZRSlVTSE9DcGI2SHUrVWxIUUUvMjVFNHpsMWxO?=
 =?utf-8?B?V3BMRDJXR2pqaUVwdHVpY0tHTWhGejE3MHl1eDA1dGNTTWNpN25Rci80alcz?=
 =?utf-8?B?bnVBWWlIaHBxQXlhRk5oN0tpN0d0N0ZpKzNLOWlNTjZWbms0T3dkeEhmWHdr?=
 =?utf-8?B?RnhDUURRVGd4NHRYUDlWanAxN2NZSVdTQ0lUTVdTVXNOMUNrUUEvTk1QZUE2?=
 =?utf-8?B?YmdHMVNjK2pSdlZYRjlSVjJDR01hMkZIS05uL1BPK2drZlpCNkZBRW1ETmhJ?=
 =?utf-8?B?OW9QSWtRVEJpU082VEFtS1kreG1UZlBNVDFrbEM2eGU3UXUreDVxUDQ3cC9Q?=
 =?utf-8?B?U2lJbHRFZDc2OTFHZm9xK0tpdThKckdIbDBiOWtzUzhxdU9mNzd2bkVhdE1J?=
 =?utf-8?B?MUVLY0JUby9kSTV0c2psdGhiVGZxQWE2N3VjSkJJanZFNm4rVk9SRU54d3N2?=
 =?utf-8?B?SEFPRy9VY2JPWlVNWlVxOUdYQStzeUY3N0s3T3J1UExucXN4L0tFNHJIMTA0?=
 =?utf-8?B?NTFaVytFU3pMUWtJOWJIODBPOHVCdHVVZG5mZS9kWTdLaEFtbS9meFNjT3Ba?=
 =?utf-8?B?b3huRFExNVJ2N2pDbjhoZm9hUXV4SG5yWmdzQlpzaGtpN3BuRGIvSG9mKzgz?=
 =?utf-8?B?cGVtOERydEc2SzhGTVdGaE1TSEM3Q2U0WUZJSjBtb0FPZkd0TFR6UVNocVls?=
 =?utf-8?B?Z3FZYnVHRU4yOXVrZ3grME9WK2d2dWM1RWpRV3FvbFVOcnFpbnVaOFFobzY2?=
 =?utf-8?B?TUdsYjI3T1RyR0QzNGsyYlFaUytta3BWTHVOUlA2bTgwc2R0VlRjczRKWFBz?=
 =?utf-8?B?ODhBTVNGallxTGVpdXZFVHY2S3RDNi9Zb0ROVkZKdk1acEpDR0FucTljR2VX?=
 =?utf-8?B?L0doa29HSVpiSkY4bzcxbTBLVnlIZksvYTc2RmpvVUVSRWJ5MERWTUtHclJC?=
 =?utf-8?B?QlFIazVCMWVyS1QyZ29MYk9qVDM5WDJ0bmV5aDI1MXFqNU0raEdqVGlYc1Bz?=
 =?utf-8?Q?E1yxzYtSc4DRsSJLNfdVZBoz1MJ0OFFMDcDJ+AS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <306CA697DFA0784A86D0AB0424C4643C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2445aaeb-1dc1-4f35-89fd-08d98cec524d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 19:21:26.9740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zy0PsukrM3c8pxC7J5RKKriwJr7E0oVKvWeMPB4+oGEab3aA35B+uT4stPdN2GL7WXsV4/jP6fQcCue18FLimvX3r24fKSjY+mLYtAUYnvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1655
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 12 Oct 2021 08:28:10 +1100
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "zweiss@equinix.com" <zweiss@equinix.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Lutomirski,
 Andy" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIxLTEwLTA0IGF0IDIxOjAzICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIFR1ZSwgQXVnIDAzLCAyMDIxIGF0IDAxOjMxOjIwUE0gKzAyMDAsIEl3b25hIFdpbmlh
cnNrYSB3cm90ZToNCj4gPiBCYXNlYm9hcmQgbWFuYWdlbWVudCBjb250cm9sbGVycyAoQk1DKSBv
ZnRlbiBydW4gTGludXggYnV0IGFyZSB1c3VhbGx5DQo+ID4gaW1wbGVtZW50ZWQgd2l0aCBub24t
WDg2IHByb2Nlc3NvcnMuIFRoZXkgY2FuIHVzZSBQRUNJIHRvIGFjY2VzcyBwYWNrYWdlDQo+ID4g
Y29uZmlnIHNwYWNlIChQQ1MpIHJlZ2lzdGVycyBvbiB0aGUgaG9zdCBDUFUgYW5kIHNpbmNlIHNv
bWUgaW5mb3JtYXRpb24sDQo+ID4gZS5nLiBmaWd1cmluZyBvdXQgdGhlIGNvcmUgY291bnQsIGNh
biBiZSBvYnRhaW5lZCB1c2luZyBkaWZmZXJlbnQNCj4gPiByZWdpc3RlcnMgb24gZGlmZmVyZW50
IENQVSBnZW5lcmF0aW9ucywgdGhleSBuZWVkIHRvIGRlY29kZSB0aGUgZmFtaWx5DQo+ID4gYW5k
IG1vZGVsLg0KPiA+IA0KPiA+IE1vdmUgdGhlIGRhdGEgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9pbnRlbC1mYW1pbHkuaCBpbnRvIGEgbmV3IGZpbGUNCj4gPiBpbmNsdWRlL2xpbnV4L3g4Ni9p
bnRlbC1mYW1pbHkuaCBzbyB0aGF0IGl0IGNhbiBiZSB1c2VkIGJ5IG90aGVyDQo+ID4gYXJjaGl0
ZWN0dXJlcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25h
LndpbmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFRvbnkgTHVjayA8dG9ueS5s
dWNrQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxs
aWFtc0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gVG8gbGltaXQgdHJlZS13aWRlIGNoYW5nZXMg
YW5kIGhlbHAgcGVvcGxlIHRoYXQgd2VyZSBleHBlY3RpbmcNCj4gPiBpbnRlbC1mYW1pbHkgZGVm
aW5lcyBpbiBhcmNoL3g4NiB0byBmaW5kIGl0IG1vcmUgZWFzaWx5IHdpdGhvdXQgZ29pbmcNCj4g
PiB0aHJvdWdoIGdpdCBoaXN0b3J5LCB3ZSdyZSBub3QgcmVtb3ZpbmcgdGhlIG9yaWdpbmFsIGhl
YWRlcg0KPiA+IGNvbXBsZXRlbHksIHdlJ3JlIGtlZXBpbmcgaXQgYXMgYSAic3R1YiIgdGhhdCBp
bmNsdWRlcyB0aGUgbmV3IG9uZS4NCj4gPiBJZiB0aGVyZSBpcyBhIGNvbnNlbnN1cyB0aGF0IHRo
ZSB0cmVlLXdpZGUgb3B0aW9uIGlzIGJldHRlciwNCj4gPiB3ZSBjYW4gY2hvb3NlIHRoaXMgYXBw
cm9hY2guDQo+IA0KPiBXaHkgY2FuJ3QgdGhlIGxpbnV4LyBuYW1lc3BhY2UgaGVhZGVyIGluY2x1
ZGUgdGhlIHg4NiBvbmUgc28gdGhhdA0KPiBub3RoaW5nIGNoYW5nZXMgZm9yIGFyY2gveDg2Lz8N
Cg0KU2FtZSByZWFzb24gd2h5IFBFQ0kgY2FuJ3QganVzdCBpbmNsdWRlIGFyY2gveDg2IGRpcmVj
dGx5ICh3ZSdyZSBidWlsZGluZyBmb3INCkFSTSwgbm90IHg4NikuDQoNCj4gQW5kIGlmIGl0IGlz
IHJlYWxseSBvbmx5IGEgaGFuZGZ1bCBvZiBmYW1pbGllcyB5b3UgbmVlZCwgeW91IG1pZ2h0IGp1
c3QNCj4gYXMgd2VsbCBjb3B5IHRoZW0gaW50byB0aGUgcGVjaSBoZWFkZXJzIGFuZCBzbGFwIGEg
Y29tbWVudCBhYm92ZSBpdA0KPiBzYXlpbmcgd2hlcmUgdGhleSBjb21lIGZyb20gYW5kIHNhdmUg
eW91cnNlbGYgYWxsIHRoYXQgY2h1cm4uLi4NCg0KSXQncyBhIGhhbmRmdWwgb2YgZmFtaWxpZXMg
Zm9yIG5vdyAtIGJ1dCBJIGRvIGV4cGVjdCB0aGUgbGlzdCB0byBncm93IG9uY2UgbmV3DQpwbGF0
Zm9ybXMgYXJlIGludHJvZHVjZWQgKGFuZCB3aXRoIHRoYXQgLSBkdXBsaWNhdGVzIGhhdmUgdG8g
YmUgYWRkZWQgaW4gYm90aA0KcGxhY2VzKS4NCg0KU2luY2UgdGhlIGNodXJuIGlzIHJlbGF0aXZl
bHkgbG93IEkgd2FudGVkIHRvIHN0YXJ0IHdpdGggdHJ5aW5nIHRvIGtlZXAgdGhpbmdzDQpjbGVh
biBmaXJzdC4NCklmIHlvdSdyZSBhZ2FpbnN0IHRoYXQgLSBzdXJlLCB3ZSBjYW4gZHVwbGljYXRl
LiANCg0KVGhhbmtzDQotSXdvbmENCg==
