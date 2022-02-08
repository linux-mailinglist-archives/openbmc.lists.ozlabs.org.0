Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1964ADB8F
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 15:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtQsy1Kr5z3bVf
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 01:50:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nUejOlth;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nUejOlth; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtQsP4HQfz301M;
 Wed,  9 Feb 2022 01:49:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644331802; x=1675867802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y8lP4iwMxCsk9cUKDGeotfvhWlxv2ExnbxdW/yaur6o=;
 b=nUejOltheGOhmLldMzUcX5oY4OtC3nhJs2oalCJkWqUMZr9Mcu3VK1b5
 Ad0fdLYfjvlYgtfd0XHMTlMh3xGySQmwufLyvWw+fco8nozuigcoAH3H0
 mFsvz4m4oe5uf9XPj2MtGProdSA7ciNxy3EW0OQBG1L+Jlj0pDVcCeO3B
 uCCKDApbwfe04HIsADg2PSI2EazaMKL1J0Ad6Q27o44GBQx4kNpdWndY7
 KIiEZmm59Cvuaw9cD8Vmw4tO1Tnlr3Rn2hr9uGQ7YsHGFtdSrjM83j56D
 EAypqFwdvpQeqQ05h/UeG1jMujf1K8x5jVZxkBwwQreP+zCXRQYa5NVhn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="247795958"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="247795958"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 06:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="499582244"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 08 Feb 2022 06:48:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 8 Feb 2022 06:48:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 8 Feb 2022 06:48:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 8 Feb 2022 06:48:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QE8EWYlPKWPtvOQIDGjHWXMUt/kCIu9Fs7r39rlorrAgJuLGP3OriI7bYLhhXHSY2lw1yXV5GDa7KnU+KBcjI5H3QQjtqpOw42SWn4ESixiphp2VaRZqbNdsrIishWMNfkro9/otpHAvj2U/y4CLuGXFtWn4nk76gkI/xZv86/1MVw55Cy8fSF20TebzojFlsJQl1LgHLO1FtZNb2jhfUHRA1OdJwV8m6NmRDXVw9xsPH0DDTYN9MSQ78ZHVOVRW0MgaWCuKf8aZn5Sw6FtW3GMYUYYVrCsyf5ju/8Lp1Z9W0aNWrxXsME77kdpjCHOyFm/UGGVxeyKUjUkYHwD6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8lP4iwMxCsk9cUKDGeotfvhWlxv2ExnbxdW/yaur6o=;
 b=YIDxdKrFihZGczUqPmK9IBrf/2cHtzKgsHuVpCIxx6pXud8F7tD4tonHv4AFj5h7kHla3xZI/nBKo19j7cHGFiWX6Umb88kiMrX0MNMiJ30WQGOtdX53UbEFw7nx15LoUcnSeur0R1VHoiqtSU2mEMoWpnDBfo+gIhAu0wZS44XRQ8iPaYjxnChzSKZeuAma7r6qCszlGAy3ZywA4+jF4IISTwkk6Kw3WhW2VcPOyGvD0m5pIhR+JPdJhh4/0zZib/PjuKphan97RwS81dQzzkc+W9Gk61szm8aV72nENtSKM3QVRRwAmCdvjOfsjYAOV2n3eY1gpV5hazvoy1tgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by BN6PR11MB4084.namprd11.prod.outlook.com (2603:10b6:405:7f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Tue, 8 Feb
 2022 14:48:46 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c2e:55c2:bbfc:b47b]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c2e:55c2:bbfc:b47b%8]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 14:48:46 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 07/13] peci: Add sysfs interface for PECI bus
Thread-Topic: [PATCH v7 07/13] peci: Add sysfs interface for PECI bus
Thread-Index: AQHYGESiDUghmgopc0Km5psbo+5bfKyJh8IAgAA9pQA=
Date: Tue, 8 Feb 2022 14:48:45 +0000
Message-ID: <4892938763614967ba8b0f428afc1bc734f8f0b5.camel@intel.com>
References: <20220202144838.163875-1-iwona.winiarska@intel.com>
 <20220202144838.163875-8-iwona.winiarska@intel.com>
 <YgJPFlr18AmWiTRY@kroah.com>
In-Reply-To: <YgJPFlr18AmWiTRY@kroah.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8116123e-2de4-4119-454d-08d9eb121bfb
x-ms-traffictypediagnostic: BN6PR11MB4084:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-microsoft-antispam-prvs: <BN6PR11MB4084520695E0962CF1F0C5FAEC2D9@BN6PR11MB4084.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 42I7eE16794i3v9HN+zZfbAOevFlsx6h7xFQM9aV1TA37fwLcrgVhxNxn3pZNS5f8Za4r9aQoQhFwhy9La5UNaP28L1MYbPilVvSXz0nB/uY/mh4Zb8gqTc7yZA4zT5RDQIKaZ947WilG60X13MdsO0FH+pp1sfHWp2rjW0v6h6Jw4XyVybRpGd1MndM6P4ipf9idrLUbgb9kzsR3BC/MCsm8c+EOo3NsZdJLARJo+bbDMeMdU3n0vp2fdY9WHaqlQfZ1AaVOsFOI+VZfvF0HW7Tine2JbHvh1l2Ge2zaSqRgTtb9pz9aKFjMfbDaz7O86BZJ7E3nwdbf1CVJKkvUif5bbVwALbxrM+3v1kjGb1ZGLDZMQG8U9RhnIhKq+DsE0ZOCT03H99VYh1PeQg2n41tG85KvZK8VQmtlvgRJugVJsT+bSgQYg8OuLMabcoAceAyH4kGuWiDkwSlVlSvsI+TrEljSDUDxo6n261DnwXR+67R3Wf/uGN0Rkhz7YpA5Vc47nBQhuXTr4JuF9duV1HntkEmMNLRBTagoVomY6HkpoGAXYUZAp6GLK0EU2bkrr00QL7E6cO6AEyIDBunwux9X53TIVpEqwNusUhT8gmu1wWqJQo9v2IrhZh9YqSIHmAw2cc8x15A0ZtUv8TKOmp/m/cr/2EWmZB0NkAgj/4uTx91SHydPJJVtHt+mDih3Snhfg03HfeyyS0ikMx8zA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5823.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(64756008)(6916009)(8676002)(8936002)(71200400001)(91956017)(508600001)(6486002)(66946007)(186003)(76116006)(66476007)(26005)(38070700005)(6506007)(6512007)(316002)(54906003)(2616005)(4326008)(36756003)(2906002)(82960400001)(122000001)(86362001)(5660300002)(38100700002)(7416002)(83380400001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czdIcDJxbU5VQzg4dHV1MW5NVlNqWjFHcWhmUkFYRDl5REVmdFBsUlVBcGVW?=
 =?utf-8?B?VkpsbWtEY3F5ZmxacE5HM1hTTVc0cDVLNHk1ZWM3L1FvbUlrVFMzQWUzRi9M?=
 =?utf-8?B?YnQrdUdvTWZSeEZwZnVjdVVtR3FOaUZKWHRLZ25YdThKcGlwekdJWWUwSjFo?=
 =?utf-8?B?Z1cxUUoxSTZtMEpSMkhOamZWa3lHUHJaektMWUlBSy8wRTR2d2xjNWRXemdZ?=
 =?utf-8?B?d3ZrUXN1SkRnUU42VTJFZGtWaEQxRWVDb25YMzlSY0ZlcGVoSEV4QWNpMHl6?=
 =?utf-8?B?NDBIZnpscC9ydHY1allWNWlsQ29sc1VQdGYvNGxXQVB0ajRiR0ZWeUpaR1JE?=
 =?utf-8?B?SUNqMVNCZ3RvZnBvY3E1dDBadHZRZ1dxVVlPckp0c21EaFQ4ZTVjRitEaGFI?=
 =?utf-8?B?ZS9mS1BWbnp6ZnlnZmhhaVVTVTZ4a21DU0thbXFjS0Z5N0htQ3YzM1lidHNu?=
 =?utf-8?B?UUlWOVNPWTI1TFpweWNVTTQ2SGYwQ1k3ZmdDSlAybHhMZ3IzaVJSVWs3UE96?=
 =?utf-8?B?NG56cUFLTzg5NWpwNlRhVGR4VWMwMk85MEYxUitMakxiMHgzaUFLTjM0dUV4?=
 =?utf-8?B?eEJudVVuT2JvUEJ5YTZENWcxZTZaV3RZTlpKampLakpxdXlFbEFNeThlblpi?=
 =?utf-8?B?N3p3TXpxSmc4Y1ZRUzBQbUt6b2FZd1BBMDZqUEpVRXFPOFVSRDZzTjYxbFZu?=
 =?utf-8?B?NDl1VUQzWEY4MnMwdUorOFoxdnY4Qy9TeHl5VTRwOXFEVklwbDAzM3laRzVx?=
 =?utf-8?B?QkUrR3VWeXBaSTZqZDdVWEFEZTByOTdHbk1wUm5hdUN1MDNQbXdXdFYySk1k?=
 =?utf-8?B?bm1EekVDdHlDVXRjSm1ZcHJCdS9YTWdYQllnRkpUNmxnelhsYmdHVTVjNG9X?=
 =?utf-8?B?K3RjRitDOU5EUzluaDNpQWJWYUl4WXNSbnlEUmVVVy9QdG1DdHVsc2Uyb05w?=
 =?utf-8?B?eTl2eHFGTDl2Sk53Q05uc1VOZ2ZvOXNSVjBHMXdVL3JDWGtuMzNyVjBLaE9E?=
 =?utf-8?B?K3RCcmhTQkRaSEI1dm1OTGtOOThlbUJKNVhjK3g3NTFtZDIvcXlaN0l2czZw?=
 =?utf-8?B?SCs1VU9SZkppc3RZcHdNU2xmTVBveDJPNkQzYkpxRW52TDJrdVNsN0FaWWxu?=
 =?utf-8?B?WmpBbzZLWUFrb25kcXZCMG51MFJUdUI3SG5vRkFOVE5jOHJIK2N5MUY3ZWFK?=
 =?utf-8?B?VTMrY3VlSDJRWkxaSVpoK3F2Z1JnNHZ6bmJFN21Rc3cvYWFaZ0t6Z0dwQ2Qv?=
 =?utf-8?B?dVZZWnVyR2o2amp2TG8wUkFZRC9SdkdrT2svZVY2QzZUYlc3aDdYZ01JR2xG?=
 =?utf-8?B?ZUhDOG16K01SK2pCZFcxanJUZURGTGYyRVhickRCT0JDTlp3dWEzUFB1QTBC?=
 =?utf-8?B?Mk5kQnpPeXN3Q0NERTVWM1JKNDR4V1V4VExZMWt0RFMyeXhJc3UyeDhmNEtU?=
 =?utf-8?B?bGRYMG9ENlVyc29WcXloTDZmNEhxRTFPM01JTythTmZFUU9yRjdPMTFWNElM?=
 =?utf-8?B?alc4TVpFWjZVV21BaDBuSnIwT3dDdUtiV3ZZNWsxUUlWbWV3Qjg5L1dleWZu?=
 =?utf-8?B?QUtkWjR3NC9xemRYTTBVMndKcEg4clpxVzM1RUYyMWx1NjJnZXV2MDhHS252?=
 =?utf-8?B?WWZSNVI3VUNhbzVGSWxyeDRUN2ZyaEt1UURvUlE1SitINTBscCtqcWNqM0pD?=
 =?utf-8?B?UHQ4dS9HUUNPTzhYcXpsS0RveTF5V1F6eEN2aXlReHdDV2ZjakI2WTJ2dWtE?=
 =?utf-8?B?SUlYL3ZOVjlLTnlJRlkraFFDY3g4a3lUTzdQZ1haSU5wQjZaU1gvYTEyQUlq?=
 =?utf-8?B?VlErSDg3d2RmRzhZV3QxckxMM1p5Ti8zaUhQZk1wZk1pVmxwYjJxakpyNzVI?=
 =?utf-8?B?V0t5RStYSHBaYk1qK3ZrdFBlQXNSbDU0UkRoMW12anhiMHY0dzRHVllwNENx?=
 =?utf-8?B?dU9VRU8xMTRZRkN5QnhRMTd6R0ZUQzkxM0EwcEVackJlMWRRYVlGVEJVTTBo?=
 =?utf-8?B?M2NMK29BdzRJMGtKWGRsZVZxd09FclVjUW8vTUVZUHNUcURuN3BEVURmRnpS?=
 =?utf-8?B?OW80bHpwZlEybnZmSDRuWElxOW4ySFE3TGxSYUpZTVQzWlJSSEhsMDJXMHZv?=
 =?utf-8?B?bkk3MWVCaWJtbVA1VEJEQ3BHUGpKbFV1TTI0Q2poaGkzYUpBT1FxUkRPTk9T?=
 =?utf-8?B?WmtoRk02L0VhSU9heXZUWW0wTEUyUTJjaWtIbWpSQUxHaEV0Zm9zb0dQSVox?=
 =?utf-8?Q?FHiMTicEDZ+n+Fupi48zb0wm75JnIlOOPu+gDRdd78=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02B75580903E70428AB857B4C9F959AB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8116123e-2de4-4119-454d-08d9eb121bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 14:48:45.8683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfPZ96VeI90LwIW+4kOavx9pLK/nXKAzsGlSM3xuXk6AAOIOdJpO7bx+24zeHM7Q5qeJAJArBoeCH5SXLnZdypDaJqA9L6JcxybBnfv1j08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4084
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
 Dave" <dave.hansen@intel.com>, "Weiss, Zev" <zweiss@equinix.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIyLTAyLTA4IGF0IDEyOjA4ICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFdlZCwgRmViIDAyLCAyMDIyIGF0IDAzOjQ4OjMyUE0gKzAxMDAsIEl3b25hIFdp
bmlhcnNrYSB3cm90ZToNCj4gPiBQRUNJIGRldmljZXMgbWF5IG5vdCBiZSBkaXNjb3ZlcmFibGUg
YXQgdGhlIHRpbWUgd2hlbiBQRUNJIGNvbnRyb2xsZXIgaXMNCj4gPiBiZWluZyBhZGRlZCAoZS5n
LiBCTUMgY2FuIGJvb3QgdXAgd2hlbiB0aGUgSG9zdCBzeXN0ZW0gaXMgc3RpbGwgaW4gUzUpLg0K
PiA+IFNpbmNlIHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIHRoZSBjYXBhYmlsaXRpZXMgdG8gZmln
dXJlIG91dCB0aGUgSG9zdA0KPiA+IHN5c3RlbSBzdGF0ZSBpbnNpZGUgdGhlIFBFQ0kgc3Vic3lz
dGVtIGl0c2VsZiwgd2UgaGF2ZSB0byByZWx5IG9uDQo+ID4gdXNlcnNwYWNlIHRvIGRvIGl0IGZv
ciB1cy4NCj4gPiANCj4gPiBJbiB0aGUgZnV0dXJlLCBQRUNJIHN1YnN5c3RlbSBtYXkgYmUgZXhw
YW5kZWQgd2l0aCBtZWNoYW5pc21zIHRoYXQgYWxsb3cNCj4gPiB1cyB0byBhdm9pZCBkZXBlbmRp
bmcgb24gdXNlcnNwYWNlIGludGVyYWN0aW9uIChlLmcuIENQVSBwcmVzZW5jZSBjb3VsZA0KPiA+
IGJlIGRldGVjdGVkIHVzaW5nIEdQSU8sIGFuZCB0aGUgaW5mb3JtYXRpb24gb24gd2hldGhlciBp
dCdzIGRpc2NvdmVyYWJsZQ0KPiA+IGNvdWxkIGJlIG9idGFpbmVkIG92ZXIgSVBNSSkuDQo+ID4g
VW5mb3J0dW5hdGVseSwgdGhvc2UgbWV0aG9kcyBtYXkgdWx0aW1hdGVseSBub3QgYmUgYXZhaWxh
YmxlIChzdXBwb3J0DQo+ID4gd2lsbCB2YXJ5IGZyb20gcGxhdGZvcm0gdG8gcGxhdGZvcm0pLCB3
aGljaCBtZWFucyB0aGF0IHdlIHN0aWxsIG5lZWQNCj4gPiBwbGF0Zm9ybSBpbmRlcGVuZGVudCBt
ZXRob2QgdHJpZ2dlcmVkIGJ5IHVzZXJzcGFjZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBJ
d29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
wqBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1wZWNpIHwgMTYgKysrKysNCj4g
PiDCoGRyaXZlcnMvcGVjaS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAyICstDQo+ID4gwqBkcml2ZXJzL3BlY2kvY29yZS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICstDQo+ID4gwqBkcml2ZXJzL3BlY2kv
ZGV2aWNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+
ID4gwqBkcml2ZXJzL3BlY2kvaW50ZXJuYWwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDUgKysNCj4gPiDCoGRyaXZlcnMvcGVjaS9zeXNmcy5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgyICsrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+IMKgNiBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2Zz
LWJ1cy1wZWNpDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL3N5c2ZzLmMN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1i
dXMtcGVjaQ0KPiA+IGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1idXMtcGVjaQ0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41NmMyYjIy
MTZiYmQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVz
dGluZy9zeXNmcy1idXMtcGVjaQ0KPiA+IEBAIC0wLDAgKzEsMTYgQEANCj4gPiArV2hhdDrCoMKg
wqDCoMKgwqDCoMKgwqDCoC9zeXMvYnVzL3BlY2kvcmVzY2FuDQo+ID4gK0RhdGU6wqDCoMKgwqDC
oMKgwqDCoMKgwqBKdWx5IDIwMjENCj4gPiArS2VybmVsVmVyc2lvbjrCoDUuMTUNCj4gDQo+IDUu
MTUgd2FzIGEgbG9uZyB0aW1lIGFnbyA6KA0KPiANCj4gDQo+IE90aGVyIHRoYW4gdGhpcyBuaXQs
IHRoZXNlIGFsbCBsb29rIHNlbWktc2FuZSB0byBtZS7CoCBXaGF0IHRyZWUgYXJlIHlvdQ0KPiB3
YW50aW5nIHRoZXNlIHRvIGdvIHRocm91Z2gsIG1pbmU/wqAgSWYgc28sIGNhbiB5b3UgZml4IHRo
aXMgdXAgKGJvdGgNCj4gcGxhY2VzIGluIHRoaXMgZmlsZSkgYW5kIHJlc2VuZD8NCg0KVGhhbmsg
eW91ISBZZXMsIGl0IHdvdWxkIGJlIGdyZWF0IGlmIGl0IGNhbiBnbyB0aHJvdWdoIHlvdXIgdHJl
ZS4NCkknbGwgc2VuZCB2OCB3aXRoIGZpeGVzLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiB0
aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQo=
