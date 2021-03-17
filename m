Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992A33F923
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 20:28:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F10Yp4YSpz3bmx
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 06:28:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=sNvV4luO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=sNvV4luO; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 18 Mar 2021 06:27:59 AEDT
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F10YW5CrVz30CM
 for <openbmc@lists.ozlabs.org>; Thu, 18 Mar 2021 06:27:59 +1100 (AEDT)
IronPort-SDR: bLGKhi6kAV+qnaxWdSTW5ekUYs2rorMGlEjvZAvjK80F5bapGwDQI/hZXiHACKJJ/nlk0lelb1
 EkkQONy4F0AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="189625148"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="189625148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 12:26:34 -0700
IronPort-SDR: hMp3rR6uBoC8UXkvDavjC7nDkm0Brmw3+7MlfD3gm5kSf3HNNrrhTY/au3/q2NiTKX5K5wsfhy
 APssLpD8LlKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="591178166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2021 12:26:34 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 12:26:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 17 Mar 2021 12:26:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 17 Mar 2021 12:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1XFILt1fE2rhVljWncWQLFi5yOfXPx1HvGd1wnH0R3emnWfM+wiPcw+zjLLt0LvgtIwrC2zw0e2RvznFoRDqutnutoXtjlC8HzpsSUkUe32XDWI8YVXmXq/9/DqBwpG0Ij6onHYETRlSSDjDAyFXSOp5Ofrt7B+H/LLWdgriLrq12iyHB+MVSIx2gtELytwRuLGKtgnSSvzMXWWRR4ytS939mOl6rN0rS+2/GIUuIwvNH+/RLAMOWrkEcNVHvGOCg+f1KWc1AKQhD02WE1lNH8KUfXpNpKG8YSidRF+DDHes2wwTqHRzIs53P8MTP4YVSV/Sgnh8MZLwzpHqZIp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDS4XmnArtdVs43qTf+COwNyuImkDnQ6h6rQvRQwKOg=;
 b=PNEPJwPlGUKrgPxkxpo4kYRQFmEJJKhyxGa9Ym4qv1SYoRiqZasUFPGxrlqe5kG50EUwjEgpdEf7/JxPA0l6BIEkN91iuxeSW1fowV9AdY3HHZvYP7v+CBXZXMsOVO3GlN0ve5TRvSoynmgUbYRzo05XMcTGXY5Pv1ff8AvVnvbb0CyF5HQz5vqEGPSzk8y2OChXUQtvHdtuw+VVtLOwPqd6o9PBW/f+VZuIA6rFKPThCKaJddTzYnT9BprJ7VKUvWhHPyzDFJSNuO4WLzXpoAj0tTu+MjGbqE8Z4SrJ785YPFnzVOMKl6a6vOI3NcSYp2nLZ1K1Z9JRm5J8PWV/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDS4XmnArtdVs43qTf+COwNyuImkDnQ6h6rQvRQwKOg=;
 b=sNvV4luOCl5P+0tePcy5MOjgvVCS4/ihp7PRd8ywneKpnLZLvHakX+CJUkqKcnlrxzIh5SdqL11j9zfg7tCYdtOQXnKO1CrpvKZmU6+EllIQC2hnQYqAiGmxctgv+7AnkS7Ff1l9BTcOIiQ4z63VBqZbONma2pF2TkwcLGgrSbc=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB3786.namprd11.prod.outlook.com (2603:10b6:5:142::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 19:26:33 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648%3]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 19:26:33 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Thang Nguyen <thang@os.amperecomputing.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Topic: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Index: AQHXGk5bmpyzcDwpB02ckXa9+uLk8qqIkRgw
Date: Wed, 17 Mar 2021 19:26:32 +0000
Message-ID: <DM6PR11MB4410AB2F408E39757C2D38B1946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
In-Reply-To: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0818a3c7-5f77-419d-2364-08d8e97a92bf
x-ms-traffictypediagnostic: DM6PR11MB3786:
x-microsoft-antispam-prvs: <DM6PR11MB37863D51E10673DA5C837B6B946A9@DM6PR11MB3786.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gg9GgqW1HOfqMU/DOYeOaPOK9dUckeZyvXJcJfkMoMaSu+vu9sZ9qOBLEjvdJ9VH3afHasMCnWN29ZT1V/wv32EhnWf3BUat2HHg4IfvWhsdtxrZC7xpj9kTU6Mdh+Re1O1YgkbzbLg7afGsroSNzMYONo+HcdurJIhHyugA8YxgxJAwweK6O0ESpg7I5vGxqH5rICQij/gLTtLvd9pMbnd9Km69BCLKiQiPT2M2ZWBn4DQVl0SDgn5VMsymAPy9MIWarHJpGSRPxkWLGqq/GFNM8JG4mqjb0ElIxCpydxZbR7MW8uFrf0Lnd7vvLeO9gGpWEBhoH1gmUTC4qpC/zUIQD2Dy/orsSQyGIv26LVHOe51oVO5G2AuQW98/TBDb8LzEpFHx0M7ePE8GvQdD3KgHwKbLX79nNOrbjfY240NOV9tnIDIkTlT7mP9uP0Q9S4CJVcoHCxCh4qdbSsLREgcya4CPYntshUwcZ7CYJMJ7IQ0M7/MKmc7JHrNIth+dct6NV3Js9TX5Xw86paFCYgCrsOEo9qmaCHiYIJhV8XcNF8a5w91YmrUfA3pEoZp1JCAXEXjAH/r3HW89i6jQTPWBF82MHbqAiupwknr3RQ9ruP28w6qSz5qevPTVzSkO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(39860400002)(366004)(396003)(5660300002)(55016002)(71200400001)(8676002)(110136005)(33656002)(66446008)(19627235002)(7696005)(66946007)(66476007)(6506007)(9686003)(83380400001)(64756008)(66556008)(478600001)(2906002)(966005)(52536014)(26005)(316002)(76116006)(8936002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VnRpQ1dSc21jcVJBR2drVDNIdHBkQjhWYm1VbHVXT0ZZNFYvWlNwSjlWRlkv?=
 =?utf-8?B?dGpCOGV4bmpualJsYjZsb3JoVE9hN2IybFRhNmI2NG5ROFUwRUd2NDFUb2dR?=
 =?utf-8?B?bmdrS0w4WTF1d1FjN3RDWnhOSWdNMSt2aW5veHlXakVCMnJ2bHBFWE9CNDFI?=
 =?utf-8?B?NlJhbTVpSVVHQTNGcGpyQmcxNWpVZDVYVThBNys0R0dXc01MSVFhM1lhMksr?=
 =?utf-8?B?RjdIdEk2dTVQN2ZKTXJnSFZCTHl1dkJ1K0xGcTM1UmlJWmR3UE9tWFVENElZ?=
 =?utf-8?B?cGVrWFBObW5GUEJoc3lDbGN6K1JLMXhBWnpZMTdNY2diekcwUkwxbGp3Mzdx?=
 =?utf-8?B?UTNQTFp3eXV4VG5pdGFYODR0ZW4rS0x4cC9GeCtNeHhxUHVyeW9Ocmo0eEdx?=
 =?utf-8?B?UmVzTmUyelRJbkFMeWhiQUt1VWhzdGtRY3BLdWlhZkpqa1lVQjZwUkgzOGp1?=
 =?utf-8?B?RG15L0lndDdFT1pKMnF5TE0vVWtRSCs2S2U4MVorcDdRb0JvNDlVQ0Y1Ymp5?=
 =?utf-8?B?YUNKdTNWK3p2T2xjUGx0ZXY4M1JRR1AyWlJ5NmFCOGlQNkhIY2Y5MmlVZ294?=
 =?utf-8?B?cGl3UDJxV0xjZ0pVVGJQT1FkRUo3OXNKbVBzOVpUSVdEY2d2R0NuVitzVW5Q?=
 =?utf-8?B?ZXJTRzBiRDNzRjM0M1JQRVZVN3VCN2ZEWnNnRU9iaFB1b21NUXNRL0xnL3pl?=
 =?utf-8?B?MzNOWnZ1cUFxVHE3SVJlZXl3MCt2cHNNMjZiNE5QeWV4bDlGWWdXbzRadGFp?=
 =?utf-8?B?bnp3anR0Lzh0cVh3R2dKeXRxZEZsUWVzZ1NMUzdrTk52eUlVWnRqVjExRmtj?=
 =?utf-8?B?endUNWNKaExta3hHVFVOakNyKzNNc0FzSGhENTFRSHpzQlNIZ1J5UnN5YzUv?=
 =?utf-8?B?NTVsbFF0QWVwU0tkNStiQUV3d0daVy9aSmVRVFZyUnlPNHViWUgzTlRxbHE0?=
 =?utf-8?B?cUM0WDUrUXJSR3B1L0V4RlFxZWR5R1c4K2l1UnlFWXEyL0xxVFdONDZ6dWN2?=
 =?utf-8?B?bFIxQWZobjZLNTIrclRMdjQxVnFBTzZFd1FZakRTUERQSmhmRHdrQm9va1B4?=
 =?utf-8?B?NjQ2WjJURzBjUm9mSEV0aXlEZXRNMWQ1dC9RbWNUUENzNW5HSU1oeFdrTERy?=
 =?utf-8?B?QkZwbmNXS21XdXJzeDd0d2dmSlZYRWtDOFJidG8rYUVKSHlTVnBrT1dmT2sy?=
 =?utf-8?B?enUyVGhKMUVDdE44SnFDSjN3Z1A5WmREQWROSmk5YTBscExXS2dudUI2dVhn?=
 =?utf-8?B?N1VWRExOTUR2aVkwMXI2cTl6cWp5TXQxSGtYYkpLa3puejhOMUZzTWlUUGY0?=
 =?utf-8?B?cS91YitOWndSbkF0L1RPUnduYy9oK0I4VmhTUE5ZOSs0SlZIQWpLQy9NRWh6?=
 =?utf-8?B?eW9tdWZCaFlQbmoxQTkvT3lOenlmY2NPWUpmVWVIRngrSVZxcHlOY1JFRHFX?=
 =?utf-8?B?clB6SXZyV2N4a2FTRG40OGFYSzBZZTJxanhDMW83OHBsbHJUNDNRdGVpUjRa?=
 =?utf-8?B?WktVd1MxQ0RkNG1vck4raWpkYmRWNmt0ZmFEN1U5NHErMzVzcjhrN1ZYN0tO?=
 =?utf-8?B?aUhjQ1h0QXQ4Y3B4N0dRaXgwYXB1Q1FONS82SU0vOUhsNVVoUTB0T1dCdWFI?=
 =?utf-8?B?UU5rRFl4bjJnc2pHRDRnVW11RFZHMXI3RkFYTGhYYXNxMzdRM3h3VTYxQ0FO?=
 =?utf-8?B?enI3QWxDQTNUb21qVEdLU0xnWlZxTHFlRXFiN2RIVW1tNUl1YlRnSE05YXhX?=
 =?utf-8?Q?Nt2JzOxkYCZN7Q0Uas=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0818a3c7-5f77-419d-2364-08d8e97a92bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 19:26:32.9377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLiI0okwPQzpwvXRLbYJd+c8e+7iI6GKKqD7P5kpZWqsFn3KCbcfSOaNYZSlDuGcZa3bj0GO8mOqr4HXSzG7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3786
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG9wZW5ibWMgPG9wZW5ibWMt
Ym91bmNlcyt6aGlrdWkucmVuPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPg0KPk9uIEJlaGFs
ZiBPZiBUaGFuZyBOZ3V5ZW4NCj5TZW50OiBUdWVzZGF5LCBNYXJjaCAxNiwgMjAyMSAzOjIyIEFN
DQo+VG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj5TdWJq
ZWN0OiBXaGVyZSB0byBjb2xsZWN0IGluZm9ybWF0aW9uIGZvciBSZWRmaXNoIFN5c3RlbSdzIFBy
b2Nlc3NvcnMsDQo+U3RvcmFnZSwgTWVtb3J5IGRhdGENCj4NCj5IaSwNCj4NCj5JIGFtIGxvb2tp
bmcgZm9yIGhvdyB0byBzdXBwb3J0IFJlZGZpc2ggU3lzdGVtIHNjaGVtYSB3aGljaCBpbmZvcm1h
dGlvbg0KPmZyb20gSG9zdDoNCj4NCj4tIFByb2Nlc3NvcnM6IHJlZGZpc2gvdjEvU3lzdGVtcy9z
eXN0ZW0vUHJvY2Vzc29ycw0KPg0KPi0gU3RvcmFnZTogcmVkZmlzaC92MS9TeXN0ZW1zL3N5c3Rl
bS9TdG9yYWdlDQo+DQo+LSBNZW1vcnk6IHJlZGZpc2gvdjEvU3lzdGVtcy9zeXN0ZW0vTWVtb3J5
DQo+DQo+SSBsb29rZWQgaW50byB0aGUgYm1jd2ViIHJlcG9zaXRvcnkgYXQgcmVkZmlzaC1jb3Jl
L2xpYi9tZW1vcnkuaHBwIGFuZA0KPnJlZGZpc2gtY29yZS9saWIvcGNpZS5ocHAgYnV0IGp1c3Qg
c2VlIGRvR2V0KCkgZnVuY3Rpb24gdG8gcmVhZCBkYXRhIGZyb20NCj5kYnVzIHRvIHJlcG9ydCB2
aWEgUmVkZmlzaC4gVGhlcmUgaXMgbm8gZG9Qb3N0KCkgZnVuY3Rpb24gdG8gcG9zdCBjb2RlcyB0
bw0KPlJlZGZpc2guDQo+DQo+TXkgcXVlc3Rpb25zIGFyZToNCj4NCj4xLiBIb3cgY2FuIEhvc3Qg
QklPUyBjb2xsZWN0IGluZm9ybWF0aW9uIGFuZCBzZW5kIHRvIEJNQyBzbyB0aGF0IEJNQyBjYW4N
Cj5yZXBvcnQgdmlhIFJlZGZpc2g/IHZpYSBpbi1iYW5kIFJlZGZpc2g/DQo+DQo+Mi4gSWYgdGhl
IGluZm9ybWF0aW9uIGlzIG5vdCBmcm9tIEJJT1MsIGhvdyBjYW4gQk1DIGNvbGxlY3QgaW5mb3Jt
YXRpb24/DQo+V2hhdCByZWNpcGVzL3JlcG9zaXRvcmllcyBhcmUgdXNlZCB0byBjb2xsZWN0IGlu
Zm9ybWF0aW9uPw0KPg0KW1JlbiwgWmhpa3VpXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9z
bWJpb3MtbWRyIGlzIHRoZSBzZXJ2aWNlIHRoYXQgcG9wdWxhdGVzIGRidXMgb2JqZWN0cw0KPg0K
PlRoYW5rcywNCj4NCj5UaGFuZyBRLiBOZ3V5ZW4gLQ0KDQo=
