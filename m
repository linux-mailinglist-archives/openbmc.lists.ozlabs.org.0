Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D344298EB
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSsPV6M5Kz2ybB
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:29:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=nZJxFyuD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=nZJxFyuD; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSprc0Gbkz2xtV;
 Tue, 12 Oct 2021 06:34:07 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="290446446"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="290446446"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 12:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="562337658"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2021 12:33:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 12:33:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 12:33:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 12:33:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 12:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ppbv+Qfpow8MN6lpFPHIRecg+MUIT27RLrhif1mS9qvnG/YyK4M3uyX3+Xr7JL5PkQDmFNkWfvtNX4uIGtJvQcWW66ZgLw9RbVpjREDiJRw7cGQz9nJsOkqxRT9n3/HF9UMdxaUBMfI29QX8kQ7ngbU4IcfEGmSExEdqPGVOXdG8m80bazbLwCXVJljFOisTdx//i7uR2J38JUUa8yi/ZbrZjSb9ggpAnsUnfT1jE+Tk2xFCGgoT8kelMrY01c3wCB7Oujau3pyAgdp2ub9IJxFubQ3/wLU5CxpVF8mM8S46H1ImakxbLAUsYO5TArgDdzqgvhNQaxKhV+kW5jkFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H97IPd59Py51YwV+6wm+k1DlmgTNbCbJuzKMSm6D9A4=;
 b=dDweLzssvTzBkt/uR4RA+sA0ZIQGAStXxYJlhpLFlWHXpTn+SobIupuaMeipjK+G1h2CgmP2rZL7etDlQWKjz8lokHKH6jf/Kb6Ftczzxr8e8ivrE8Qh+nmiibJAfw3IehPSFbZTXiERUVqTSRvjvR2EZFT1zii/pMyxGqiqeUXg8J+PQYKlSKGyM8wn/xGRuO1bFfNdDNWemT+vektvOP3pnmS8Gd1lIyZzqomZ8GBr2gt5GlsSY++pUi1NyZAwtGOxYK4Fur1kMo+W87DQRwYq2RxLkZ5iCjPCmxs1HQ+9DXBMIVKtJ26p0SbI9+qchQr9te5Jlc7v4NoGaoM8Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H97IPd59Py51YwV+6wm+k1DlmgTNbCbJuzKMSm6D9A4=;
 b=nZJxFyuDkCVhqE6HsAU8GzEotjkc7chjNuhzOWt9lkIPiaH601pGbJkgOuZFJxVWrsNWGqODXpRtNhKfBJdOTTdt2nlhOI6SddejwH3PASGhIK7/WlFolJ8Cn6b11E4FE/NqMGu+WsBqeRnV3a1zsQ8mzk5ySxcsb9HU8K6S+AY=
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 (2603:10b6:910:18::13) by CY4PR1101MB2072.namprd11.prod.outlook.com
 (2603:10b6:910:1d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 19:32:38 +0000
Received: from CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc]) by CY4PR1101MB2278.namprd11.prod.outlook.com
 ([fe80::c482:c237:bcf1:70bc%11]) with mapi id 15.20.4587.026; Mon, 11 Oct
 2021 19:32:38 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "bp@alien8.de" <bp@alien8.de>
Subject: Re: [PATCH v2 02/15] x86/cpu: Extract cpuid helpers to
 arch-independent
Thread-Topic: [PATCH v2 02/15] x86/cpu: Extract cpuid helpers to
 arch-independent
Thread-Index: AQHXiFtkqDvDKoOElESQuBvYrPboIqvDla8AgAsHGIA=
Date: Mon, 11 Oct 2021 19:32:38 +0000
Message-ID: <9ded913cd7dbf6006217c5e173e0734e41f4e7d5.camel@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-3-iwona.winiarska@intel.com>
 <YVtRJiYD9EqGh7TM@zn.tnic>
In-Reply-To: <YVtRJiYD9EqGh7TM@zn.tnic>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: alien8.de; dkim=none (message not signed)
 header.d=none;alien8.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 646fbf03-a3ec-42e3-769a-08d98cede293
x-ms-traffictypediagnostic: CY4PR1101MB2072:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1101MB2072A296EEC91A4CA05D144BECB59@CY4PR1101MB2072.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ByWXfu700I0lbglicYt1gYC5sLSeG7Z963nCTXa+SI7lZ7hKC0qZx5LQeAVR6n0CSGTHMWDhx+fzOnQjd3Pq7bZK5jFonc9CG3U7LiEekIDwGo3qAwWQR87Xx2Uh0Kt6AqAvIyiLggiyYHgnzb7rFEuB+lEXyVLEBIl7RFeQycQDMiULmMTveD/pWBFsxn6I1MBkuaiTDj38LdwsBM/74h4+jR+QD2qQpoVzjNP8N/SbgpsP85n9RPegCJdWAwWKO92eV8h9O6+Z3Hpd8SsyKy471bCoTBGNWU476vDeazAqBINghExon007K40IagM589awMPtZyrMUVOEDLNcc2cH5zd5lk8jGEjGWvK/z1G1wvEUietoAAzLyecO6X+uBrmx3gUdBMLtMU6dgPkpVV27YigqTYHjEp8IdQ5AXWWjPKX+nN6qZ9bvy4HoDcslCGbd0KT4KNCqtSm0D6XHGU/YwaXAL8hhfrjwGd98yQQzYYVQJE79d375Kb2Um4si6GaEzp6TaeRGFUd3gcOhS7vOoDoCLVsfAFOZsH+NjEDkN83ca7B5DXB1EYUrZMGwdf7QAP/P/BiH6g7cVSTvE8Lnc13dQMoz/Y7f7J7Tw/Nkuo4YpzrG2beZHpL4KUJUEqvMuFCIux8dKmLWtxpIgY6xAyaM8u/ONi3N5WmtN3iwvbGFYJfB6uu8D/FjAqT/ZQo05pf6U6lp+8l1rq8PJvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(66556008)(66446008)(316002)(4326008)(71200400001)(2616005)(64756008)(26005)(54906003)(2906002)(186003)(7406005)(7416002)(91956017)(76116006)(6506007)(66946007)(66476007)(38070700005)(83380400001)(86362001)(5660300002)(8676002)(6486002)(122000001)(508600001)(36756003)(6916009)(8936002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUE1NlhoZytUWjRIKzBaeXhzS1kxRXFnTkVxYWJkQ2ViOUZhazZEdERwWHFD?=
 =?utf-8?B?V25mZllMZHVlSTBnakZJVDMvV3IyU0V2MGd6ZUIwclQ3Uk0yUkhJQ00xWkhF?=
 =?utf-8?B?MjRuRnFtZ0kzTGJlNnZabGNHTS9OR2pBMEpYUlB2QndlN21rUERnNTIreWQw?=
 =?utf-8?B?QjNqbzJRUmtPSWpBSDRQbGdXOFc2bVloL2pvY3FTaDZXSG9MSSs3dzNWYXgz?=
 =?utf-8?B?Skptc3hLQVVBc2dVSFJDaWhidmRmc2JveGRPUUJCQzdzSDhDRkpQRzdRb1pV?=
 =?utf-8?B?QmNwNEtZSTZRTlhxTlVhNlJCS1dhbGJ3SENxaGtieUN3bHA3WjNDZjlzeXdZ?=
 =?utf-8?B?d3AvNVBMQUlncCszTDlQSTd4MkpqTkpzRmlnSnFQYXZoWXNldzFWNmZNNmZp?=
 =?utf-8?B?QXBKUE5rSDJXSTNvUUpSUFlVMC9MVXc4VllkdFRRZy9WV3NWcm9NUWNtOGJE?=
 =?utf-8?B?STkyb2tMVzdXaWxIUnF4dldNMjdwWExFNGp1WEU0a3Z0QldkSW5iQi8xelpm?=
 =?utf-8?B?K1N2aU12V1JmR2dtNk5qNHR0SXlMYjNCZittOWpzQjhaTjV1NzIzY2VaVlRK?=
 =?utf-8?B?SnNTQ3JmMGJFUHp2OGNsdTZIWWM3Q0hMMU11amk1RlhLK1paZlkyemd5dmQx?=
 =?utf-8?B?VXIyZVRMYUp0TkdZVWQreENQV2xabFNvbisxQ0NMYVVRT2UvNGVBOCtXellP?=
 =?utf-8?B?ODZ6SnM4Z2pwK0tZL0RMKzNSdGtjOURHS2doaHl2QTdiNjc4WmIrcGdsbGdV?=
 =?utf-8?B?MDUyRWkrVGFMNEJuZlMycDZ5a2hJTHBiVGhaa0RSZ2NXM1ZBbU5WRExJbDZK?=
 =?utf-8?B?QlUxdndmU0ZvRlhkVWRkL1Y5M1pmVDQxOEN6QWZNQm1VdlFWMS9pOTlSRW5i?=
 =?utf-8?B?dFNXU0Q4NlA2SFBlK0tmcFVrUFZCNWFRV3hUbU54b3RhVUZTS1EvaEtKZmgz?=
 =?utf-8?B?TjR1OVZCQVZjcnNBb0lMNEt6WTduempia2pFRUVQR0NzbzlqSnU1YWNTUDNE?=
 =?utf-8?B?S2FsYkdXVGthMy82Y3Q2ZXp4bitaNzZrNE1haXJoWVA0b1dYZ2NBRVZmN0lR?=
 =?utf-8?B?ZTc5bC9FNW1QbHNYKzVOQWhZN25IWHdiaE5QY2NkYXI1c2ljcDlFUGFScGIz?=
 =?utf-8?B?bHBXaDd5VlhYblZqNnpZT2trU3hzSkxKdGp2RlpxKytmMmxYN3dSODJyb29X?=
 =?utf-8?B?d2puQjB3eEpKZ1p2NWE2VUI0RkZqSm55aEc3blowSEVFRUtWVTIxdlNhTmlM?=
 =?utf-8?B?TW94SmVma3BoNjBTOC9xME1uQllrNWJMZ0tWdnVmYW1JV0ZDdWRnU3o3aHgv?=
 =?utf-8?B?cVRBaFAxdUZuamtSNzRpNzlyTElyaEcvYUdnOEtZRVUzVHZHbjBzekJMTDZP?=
 =?utf-8?B?dTl6NENJYVExWW1RZllibktCczN3Q2FBc01UL3l3WGp3N1FXbG4yZUNndi8r?=
 =?utf-8?B?ZHdWbTFZeDJWbEJsVU9RNHV6U3ZqdUNCVjFSWkhUNjB2cUhJaExZVVRHcURR?=
 =?utf-8?B?d1ZiR0JRTGZzcWo5cjdVQUFLRzgvSnpMWnFQcXR2cWltU2VNR3ZuTk9sSjZm?=
 =?utf-8?B?aW5STXdFZlhWK3VhaFBhNzNYOENraUJYOHcwdXF2WVFSVEtWeG94YjkybEpX?=
 =?utf-8?B?dVpwWFNhT3JmZStxblJWdXVOVnpvaGF6Y0gvRHM1N0RjZ1pTMkN5T3I5dTln?=
 =?utf-8?B?YVdlSG1aUDBnU09WZG95NkQwb0dPb2o4bTNqeU4zYi9lcldtcFN2elJuNlJG?=
 =?utf-8?B?WmM2WDc1WVR3RnhNQTNYR2pvT0xJNEwvanJYcDQ0blFMRktYVWQvQzBMR2NS?=
 =?utf-8?B?T1NUS0g0ZGV5VWxqNFNJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02C521F40C7B6B49834C7498A7B5221B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 646fbf03-a3ec-42e3-769a-08d98cede293
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 19:32:38.3029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EUB/mwJ6O34HbIYFK3ji5NajxNI+4S9Uy0nUKoXlX9iLULqxVcEFJBxjxp1V0+GOUPI8X/4ntHMjk7vZgBz4twDtkexT8Y3YlIyFNFhrFNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2072
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

T24gTW9uLCAyMDIxLTEwLTA0IGF0IDIxOjA4ICswMjAwLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6
DQo+IE9uIFR1ZSwgQXVnIDAzLCAyMDIxIGF0IDAxOjMxOjIxUE0gKzAyMDAsIEl3b25hIFdpbmlh
cnNrYSB3cm90ZToNCj4gPiBCYXNlYm9hcmQgbWFuYWdlbWVudCBjb250cm9sbGVycyAoQk1DKSBv
ZnRlbiBydW4gTGludXggYnV0IGFyZSB1c3VhbGx5DQo+ID4gaW1wbGVtZW50ZWQgd2l0aCBub24t
WDg2IHByb2Nlc3NvcnMuIFRoZXkgY2FuIHVzZSBQRUNJIHRvIGFjY2VzcyBwYWNrYWdlDQo+ID4g
Y29uZmlnIHNwYWNlIChQQ1MpIHJlZ2lzdGVycyBvbiB0aGUgaG9zdCBDUFUgYW5kIHNpbmNlIHNv
bWUgaW5mb3JtYXRpb24sDQo+ID4gZS5nLiBmaWd1cmluZyBvdXQgdGhlIGNvcmUgY291bnQsIGNh
biBiZSBvYnRhaW5lZCB1c2luZyBkaWZmZXJlbnQNCj4gPiByZWdpc3RlcnMgb24gZGlmZmVyZW50
IENQVSBnZW5lcmF0aW9ucywgdGhleSBuZWVkIHRvIGRlY29kZSB0aGUgZmFtaWx5DQo+ID4gYW5k
IG1vZGVsLg0KPiA+IA0KPiA+IFRoZSBmb3JtYXQgb2YgUGFja2FnZSBJZGVudGlmaWVyIFBDUyBy
ZWdpc3RlciB0aGF0IGRlc2NyaWJlcyBDUFVJRA0KPiA+IGluZm9ybWF0aW9uIGhhcyB0aGUgc2Ft
ZSBsYXlvdXQgYXMgQ1BVSURfMS5FQVgsIHNvIGxldCdzIGFsbG93IHRvIHJldXNlDQo+ID4gY3B1
aWQgaGVscGVycyBieSBtYWtpbmcgaXQgYXZhaWxhYmxlIGZvciBvdGhlciBhcmNoaXRlY3R1cmVz
IGFzIHdlbGwuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXdvbmEgV2luaWFyc2thIDxpd29u
YS53aW5pYXJza2FAaW50ZWwuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBUb255IEx1Y2sgPHRvbnku
bHVja0BpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2ls
bGlhbXNAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsNCj4gPiDCoGFyY2gveDg2L0tjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKw0KPiA+IMKgYXJjaC94ODYv
aW5jbHVkZS9hc20vY3B1LmjCoMKgwqDCoMKgwqAgfCAzIC0tLQ0KPiA+IMKgYXJjaC94ODYvaW5j
bHVkZS9hc20vbWljcm9jb2RlLmggfCAyICstDQo+ID4gwqBhcmNoL3g4Ni9rdm0vY3B1aWQuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKystDQo+ID4gwqBhcmNoL3g4Ni9saWIvTWFrZWZp
bGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPiA+IMKgZHJpdmVycy9lZGFjL21jZV9h
bWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArLS0NCj4gPiDCoGluY2x1ZGUvbGludXgveDg2
L2NwdS5owqDCoMKgwqDCoMKgwqDCoMKgIHwgOSArKysrKysrKysNCj4gPiDCoGxpYi9LY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrDQo+ID4g
wqBsaWIvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MiArKw0KPiA+IMKgbGliL3g4Ni9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMyArKysNCj4gPiDCoHthcmNoL3g4Ni9saWIgPT4gbGliL3g4Nn0vY3B1LmPCoCB8IDIg
Ky0NCj4gPiDCoDEyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC94ODYvY3B1LmgNCj4g
PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIveDg2L01ha2VmaWxlDQo+ID4gwqByZW5hbWUge2Fy
Y2gveDg2L2xpYiA9PiBsaWIveDg2fS9jcHUuYyAoOTUlKQ0KPiANCj4gQUZBSUNULCBhbGwgdGhh
dCBjaHVybiBpcyBkb25lIGZvciB4ODZfZmFtaWx5KCkgYW5kIHg4Nl9tb2RlbCgpIHdoaWNoDQo+
IGFyZSB1c2VkICpleGFjdGx5KiAqb25jZSogYW5kIHdoaWNoIGFyZSBhbG1vc3QgdHJpdmlhbCBh
bnl3YXkuDQoNCkNvcnJlY3QuDQoNCj4gV2hhdCdzIHdyb25nIHdpdGggc2ltcGx5IGNvbXB1dGlu
ZyB0aGUgZmFtaWx5IGFuZCBtb2RlbCAiYnkgaGFuZCIsIHNvIHRvDQo+IHNwZWFrLCBpbiBwZWNp
X2RldmljZV9pbmZvX2luaXQoKSBhbmQgZG8gYXdheSB3aXRoIHRoYXQgZGlmZnN0YXQNCj4gDQo+
IMKgMTIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4g
DQo+ID8NCg0KTm90aGluZyB3cm9uZyAtIGp1c3QgYSB0cmFkZS1vZmYgYmV0d2VlbiBjaHVybiBh
bmQga2VlcGluZyB0aGluZ3MgdGlkeSBhbmQgbm90DQpkdXBsaWNhdGVkLCBzaW1pbGFyIHRvIHBh
dGNoIDEuDQpBbmQganVzdCBsaWtlIGluIHBhdGNoIDEsIGlmIHlvdSBoYXZlIGEgc3Ryb25nIG9w
aW5pb24gYWdhaW5zdCBpdCAtIHdlIGNhbg0KZHVwbGljYXRlLiANCg0KVGhhbmtzDQotSXdvbmEN
Cg0K
