Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FD455122
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 00:28:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvfJ339YTz2yp4
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 10:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=TNait4Yq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=TNait4Yq; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvfHX1GPDz2yNr;
 Thu, 18 Nov 2021 10:28:07 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="214795133"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="214795133"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 15:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="549612486"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2021 15:25:38 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 15:25:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 15:25:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 15:25:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YziDNpnxYdx9QpMMKteE1hBANjIT8t1cpFZYShIIGhfBTSDFlSIxDqj+bb3ea3+lT7wU+tJDdmvnnENBeGoqwvxUVPBGtrenWUy5j95vx3fxyYj3e75e13pYbskVrYU7NKNbZ+t4BtHeIx+0LMs8dmRugwenMY/p/RsC7uPv84ni6I/6iKdgSn/x6SKqkccjwkHDB+n7BTAR2N6zob/+hjwdrr+K/tAQu4RwurJqtpk6fE3KM0gd76heqxcUOBKa37eSTvvEN8CL1R2jyW1hkWsp1VGaSyI4Vd+UtOxYoflr6RH3g4+EI5EuQwrUjH1Vwf12fWlJKctwsLTBs+N/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omnjO8peh/vXiSg5UMFD5OIjkDHi+IHl8vE9gvuViJo=;
 b=QVla+uatsNk/NhEXo9b3LIuHdMPe6bywKuFgLuTP3Q3lcjzno6pf93ohdGd4+acCjE6j153LIElPeRKkiRASEgExlymWfuG/KOg1+7NrXNe74vwEYYkn0Z0KdNdFgQRZF1HRTvD6Z+Q/YvT//K4TI63gi8HrHeQGe3HijIqykdT4A+zYekKsGTsyGKNyFTnZNILpaE34ZZjFAA3ZtjPYxbtiYgkcbADSfDXxy6aMxC/l0QekdV7MhhDnW4THrRNbn1WjQhio6H8fJMWmUU2W5L5mWjVInKOdkG9mBCRN0TZp2l4q2IV6FKaqgK9ul0WQ441xz4CmtYmxqTGIIaPLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omnjO8peh/vXiSg5UMFD5OIjkDHi+IHl8vE9gvuViJo=;
 b=TNait4YqnPTtDAhwShO24BqrKyQ09BxhUg8kjSwv64dPAKcwUszKdIH7SgleNsFUu7tZ2cU2LihZSdK2cs+1sgPecpoiVNfw+Eh4bRuaS6hsFlcJeHat3BiHA0GS4BzI+g31SRq8/Np/am/PvRvowtpIDlZjJ5Y2v2BW+s7nlRQ=
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by MWHPR11MB1726.namprd11.prod.outlook.com (2603:10b6:300:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 23:25:35 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::6553:c7f9:a224:cac1%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 23:25:35 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "zweiss@equinix.com" <zweiss@equinix.com>
Subject: Re: [PATCH v3 00/13] Introduce PECI subsystem
Thread-Topic: [PATCH v3 00/13] Introduce PECI subsystem
Thread-Index: AQHX2k5NKZ1/0n7np0ifc/nqtUjljqwHGaeAgAFGkYA=
Date: Wed, 17 Nov 2021 23:25:35 +0000
Message-ID: <74100d46dc362cccaca5ce6b780dfa3d99fd96df.camel@intel.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211117035642.GH14774@packtop>
In-Reply-To: <20211117035642.GH14774@packtop>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65eeb230-cd27-44a6-0ab0-08d9aa218ef4
x-ms-traffictypediagnostic: MWHPR11MB1726:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <MWHPR11MB17267F77752247C266964600EC9A9@MWHPR11MB1726.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSIR4gujT1uHuTeRIb/k4uUde+wAEmSn83s6BvEZB92GYYgmbnmqrXjfpK2kEfvC+25xuXBfTi8cm+rhPtEHMnB8iaEXRpd4EJ1WCTxeXY17/p1pg3NQDW+N17X0+mBGFBdjGjXp3gxkqYfI4+JvKiahRv/hD0yk3xjP/A4KptxhXlXSxoVANqbWIt16i/+OVo54DCj7ty4nfDhWon49aenhCvGN4emQNcdjV51knZrgJSkFbCNLaD7KQwGvBvb+X3CWeQpW6U/EZJgG3PrCzFHmvYOwrw83bReCjToP3eurqjcByiDJy/iznPFgkzTWLRRWHzrWKWAcCwv1rhB/qgS6lRAcNCNveK7pBWlaNw3YlfcVq+ezNuaTwNoURE8vbBxZkQVNK/I+/OAH+oStgojy3LjQetbrwNX8U/L7DjP8YhYveNoUB1i8GuALwR1eYGuBzps3H3b6D7fyKwrXfKrowWjXHdxrBf3d+Un+MfxKzYqQh2HdSa+IV10NmY/ai2HUYKUI2iByIdrSELBEZYdplmNTnStHrIOH+JPZk47uIgFk2pE51TOnDqJvp9sB+Q3Qa4oBCPcDTUgMjxfaWnnL2t20kXmkXpodvPbr6NplapY0JH+6ZCKhq0uTXQ/JCtw6m4xIWFPNXt+q31IDI8SheMeoiFLIWAmubmfj91+OlHZY4tzx0lStRDt5BGlOTuH89NE/XXviIeFgueaSZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(6512007)(86362001)(5660300002)(122000001)(66556008)(6506007)(6486002)(36756003)(26005)(6916009)(186003)(8676002)(508600001)(66476007)(66446008)(2906002)(8936002)(82960400001)(71200400001)(4001150100001)(316002)(4326008)(2616005)(38100700002)(54906003)(38070700005)(76116006)(7416002)(64756008)(66946007)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1p4RE5yOW8xcEZIRTdKaWxIaU1wQXV5MWNCVGZjM1BJOHd5OFdGVzRvd2Fl?=
 =?utf-8?B?Z3kvdDI1b0h5YjhOVHVhKzhZWDVzS0lDR3laOXFyVitqQ1JLUzg4bDBneXBP?=
 =?utf-8?B?K1Myd0szWG1sRWFmaVREWHdUdWFXWXJ1ZEdBT2tBRG9qanMxVmpBMEczSTVh?=
 =?utf-8?B?TFZmQ2t6MjkyUEhHcmtHRTc5WDhKVUd6VWFsaUY2V3orOCtLQnUvRm9vRkNy?=
 =?utf-8?B?dEczazFPbFB0enRpNVZQQWlIS3RNN2hwRkRGemM0MnFaUkZoN3c4ZGwxcnhG?=
 =?utf-8?B?SWFJZ1I3ZVdCb0lESy9QaVNvMHpYdGFvTE9JNzk1elZvdjJ6aVJUbWFGd0l5?=
 =?utf-8?B?SUNiWWVRbW9KTThpZWRUeUxxdG5OSXBoeXltSHdYQ1kyUEV2dE50ZE5Fa3Bl?=
 =?utf-8?B?eHlGMmZTRXhlT1EvaXhpQ2E4SEVBcUxBZWdOZFJUUXl6dkFOSmF6YnlrTDR0?=
 =?utf-8?B?WW1aZ0svOVArdWpUUkYwdUhmbW1LeVNSNHppbXZLMXZVbnZYaWMyVU9mb2FO?=
 =?utf-8?B?SVorVlQ4eWFsTy91c29nSlVUcUx4amtGWXprZ1E2L2ZsT0F1ZWc0R2w2alhE?=
 =?utf-8?B?bEh5SCtFMzQ5OGdUdEFVM0QxMnhrMFEzcTJCWVNXalc4alRwcXZndjVHaXNI?=
 =?utf-8?B?U1F2Z3pVVmVmQnk0VjZMVlVTbE5rZ3NGZDRCbWFHYno4RTZhOWRnMkZVRGhO?=
 =?utf-8?B?U3pwMVdXNG0rSXQ4dldwMWN0V0l4ZUorVEs2V293d1BFclVZVUxGRVVMTmZj?=
 =?utf-8?B?NEFxUFcrWmpKWGl3b0UzS1lBdzJvVU1LOUxiRGxmTVV3dVZtVG1iWUNSWHpE?=
 =?utf-8?B?SDNmNEVsakp1UGVldGZwcDMydEVTREliL2dmZ2FkOURNbm5EZmJyTlJxU3Rn?=
 =?utf-8?B?eVAyUktXajZrMXNrOTgzS1p3Qzg5MmhDNWh3Snh4ZGk2SXFKSWIveDRzMkpj?=
 =?utf-8?B?M3drNThGUkQ4c0gxamdvMS9BU0U2V3lIakhkV04yY0V4U1V0RWpwallpNURR?=
 =?utf-8?B?c0FXSHRiekUxVGlucXJyeVY1di9SRFFOaVVLaEpZWDFOSGRTK0QrWnRhOGtN?=
 =?utf-8?B?YktKNjVhc0hIQ1Y1aHBvc2NVeWNoTENvN24yZ1JUYUVNN05ERkoyVkFzYXJx?=
 =?utf-8?B?bmFVVWpTNUJXN29FMEVUajVsdW9tZHdwcjJVL204QmlhZ0RrbjRyZElkYnU1?=
 =?utf-8?B?Z05GeWZuU0pZZGo0dDhHOEJoaWpvRmc3a3NYQjlzRXlNdERXZmNhNHliMUtH?=
 =?utf-8?B?RDE1a1RsZTVBK0xxcVE1eGp1czdjRGhlTnk0dFdzZWFpdTd6d0RDMkpXcHdy?=
 =?utf-8?B?OTRKSWJCMyttVEZ3d3V0eCtxNHJBVzJ6MGZ5Ry8yQSs4QWFGYnQwcmZpQTZl?=
 =?utf-8?B?YlYzaE1nWWh2WWtsYStnRTl4NERlZm5GUTJCRlpYa3dwZEZBWWYvM29KQ1NQ?=
 =?utf-8?B?VFI0MkZ6QmxOOEhhNTI2aHRDaHhIaGNkdy9xNk1zTndTVjU3THZING4wNDBJ?=
 =?utf-8?B?VFZmazd4ZDhIOW1sY2ptcGU5SGdFRTVwckpLNG1FVjlrZFQ5ZlpNaDVxZ1k4?=
 =?utf-8?B?K2M5OUJwcDRYOFFYTlRFT3BaL1RVS29MYWNSRWFpM3RqNEgrd05vYm5OSFJi?=
 =?utf-8?B?ZUM1MVVKdEQ3K2F5M0s1VXBLM3U5YzVONVF5RmVMeWo1NWwwQ1hiNVlwZTlm?=
 =?utf-8?B?N2R1NFJ4aTVVSExnS1ZuL29DTENjZ1ozeEp2dVpYeEk2Ui92YldXNWlEcEQr?=
 =?utf-8?B?Kzg0MFpJcUI4L0ZpcU5ZaDRJaEEzNXhndmZMOG5XaXllRFlDbVR1ekcxSlhM?=
 =?utf-8?B?NUhHaUVyL21OQ1V0UFl2V2VZZkN0QkVEODFiVEp3RzJQUENMWk5wNittUlg3?=
 =?utf-8?B?b3E2VEEySjM3ejQyNVEyRUVNRlg5dExyQzFkOGRsMDRQdjgrRXdsNWFPZXhz?=
 =?utf-8?B?M1ZvWkVWeklyV3Z6UnRYSjVld0w3MUg0VkJJKzRjbFp2NFEvUUtKR3VLa29y?=
 =?utf-8?B?a05Qd3dUc1hLcEpBT1RGaVE0Y2U1eExPWVJqUGlTTDNKUk5XRnptTnpBSS9i?=
 =?utf-8?B?NXkvbUpISUJESEtrM1ZLSVdESXpHM2VqRUpaaEZ1OUQ0bHd1c0RjYmpqM0sz?=
 =?utf-8?B?TXphUFF0Mm1iT2xYeWtPRVNWeVpIMnhwcXhMUUZKZ2EzS00zRytnVmZzN01P?=
 =?utf-8?B?RWE5WkxKaTY1N3JpUENQbGd1eFBJYjJReFYvQnNRTTR3bDFvMGF1Ris2by9T?=
 =?utf-8?Q?L4wU8WXbSXcg61/nH+QtGM8hP385uwittzBbVGfaHE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C34FB42418C7444A0AB1D9C4E8A2D53@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65eeb230-cd27-44a6-0ab0-08d9aa218ef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 23:25:35.6974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3B3s7mvWWhQypUAd7PsIaHxpNskNYzMMj3f/UI+EJNbQCb9CwqhkoOPyZV8bghdm3wRDjMI3ymFNnzDQQfamnnCC3XQJsrF2QQTtOzFbYbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1726
X-OriginatorOrg: intel.com
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTExLTE3IGF0IDAzOjU2ICswMDAwLCBaZXYgV2Vpc3Mgd3JvdGU6DQo+IE9u
IE1vbiwgTm92IDE1LCAyMDIxIGF0IDEwOjI1OjM5QU0gUFNULCBJd29uYSBXaW5pYXJza2Egd3Jv
dGU6DQo+ID4gSGksDQo+ID4gDQo+ID4gVGhpcyBpcyBhIHRoaXJkIHJvdW5kIG9mIHBhdGNoZXMg
aW50cm9kdWNpbmcgUEVDSSBzdWJzeXN0ZW0uDQo+ID4gU29ycnkgZm9yIHRoZSBkZWxheSBiZXR3
ZWVuIHYyIGFuZCB2My4NCj4gPiANCj4gDQo+IEhpIEl3b25hLA0KPiANCj4gSSd2ZSBkb25lIHNv
bWUgdGVzdGluZyBvZiB0aGVzZSBwYXRjaGVzIG9uIG15IEFTVDI1MDAvRS0yNzc4RyBPcGVuQk1D
DQo+IHBsYXRmb3JtIC0tIEkgaGFkIHRvIGRvIGEgc21hbGwgYml0IG9mIGhhY2tpbmcgdG8gYWRk
IHN1cHBvcnQgZm9yDQo+IElOVEVMX0ZBTTZfS0FCWUxBS0UsIGJ1dCB3aXRoIHRoYXQgaW4gcGxh
Y2UgdGhlIG5ld2x5LWFkZGVkIGNvZGUgZm9yIHRoZQ0KPiA4LjggZm9ybWF0IHNlZW1zIHRvIHdv
cmsgYXMgaXQgc2hvdWxkLsKgIFRoYW5rcyENCg0KVGhhbmtzIGZvciB0aGUgcmVwb3J0IGFuZCB0
ZXN0aW5nIDopDQoNCj4gDQo+IEluIHBva2luZyBhdCBpdCBhIGJpdCBmdXJ0aGVyIEkgZW5jb3Vu
dGVyZWQgc29tZSBzdWItb3B0aW1hbCBiZWhhdmlvcg0KPiB3LnIudC4gdG8gaG9zdCBwb3dlciBz
dGF0ZSB0cmFuc2l0aW9ucyBhbmQgdGltZW91dHMgdGhvdWdoIC0tDQo+IGVzc2VudGlhbGx5LCBp
ZiBJIGV2ZXIgaGl0IGEgdGltZW91dCBpbiBhc3BlZWRfcGVjaV94ZmVyKCkgKGZvciBleGFtcGxl
DQo+IG9uIGEgcmVhZCBvZiBhIGh3bW9uIHRlbXBYX2lucHV0IGZpbGUgYWZ0ZXIgYW4gdW5leHBl
Y3RlZCBob3N0DQo+IHNodXRkb3duKSwgaXQgc2VlbXMgdG8gZ2V0IHN0dWNrIGluIGEgc3RhdGUg
d2hlcmUgZXZlbiBpZiB0aGUgaG9zdCBjb21lcw0KPiBiYWNrIG9ubGluZSwgYWxsIGF0dGVtcHRl
ZCBQRUNJIHRyYW5zZmVycyBjb250aW51ZSBqdXN0IHRpbWluZyBvdXQuDQo+IChSZWJvb3Rpbmcg
dGhlIEJNQyBzZWVtcyB0byByZXNvbHZlIHRoZSBwcm9ibGVtLinCoCBUaGlzIGFsc28gaGFwcGVu
cyBpZg0KPiBJIHJlbW92ZSB0aGUgcGVjaSBjbGllbnQgZGV2aWNlIHZpYSB0aGUgJ3JlbW92ZScg
c3lzZnMgZmlsZSwgc2h1dCBkb3duDQo+IHRoZSBob3N0LCBhbmQgdGhlbiBkbyBhIHJlc2NhbiB2
aWEgc3lzZnMgd2hpbGUgdGhlIGhvc3QgaXMgb2ZmIChpLmUuDQo+IGFub3RoZXIgb3BlcmF0aW9u
IHRoYXQgdGltZXMgb3V0KS4NCj4gDQo+IExldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55IG90aGVy
IGluZm8gdGhhdCB3b3VsZCBiZSBoZWxwZnVsIGZvcg0KPiBkZWJ1Z2dpbmcuDQoNClRoYXQncyB1
bmV4cGVjdGVkLiBJIGRvIGhhdmUgYW4gaWRlYSB3aGF0IG1pZ2h0IGhhdmUgY2F1c2VkIHRoYXQu
IExldCBtZSBmaXggaXQNCmluIHY0Lg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiANCj4gVGhh
bmtzLA0KPiBaZXYNCg0K
