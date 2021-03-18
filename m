Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE772340ED8
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 21:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1dQd4bslz3bvc
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:09:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=WQL3wIJU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=WQL3wIJU; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1dQK3bKgz3bpW
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 07:08:55 +1100 (AEDT)
IronPort-SDR: Ivaz5bNGj7S5Sju19d/S4Ukp0WOO3vEVVmhhGHJ8BOD5QmEVBm/u/8jys0QoFmb7Z7d5Uf1X4q
 bzzYTXRGKKQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="176895065"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="176895065"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 13:08:52 -0700
IronPort-SDR: 1s1K2AQ+Ebp7iJuX0KNv1k/5+h2JLSImjbztQTxf+mwznIgaJhhBe6A5ppsrdoc0JFcpekRssp
 GerQBXVsvN4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="434005325"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 18 Mar 2021 13:08:51 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 13:08:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 13:08:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 13:08:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOhV4JTuqMvdWsq0zZnwHyVCr4fugTq/rvZKeuh0zCUjaXaKC8RLSO1F2/dU+1XrXTWuVGEMOxhiofdoc4vGZniO+FxljJil95lgFJlWthvdLelTvTNWTDGla8W5EW9WsIsd0t3DS6MxKn1fKuYoot+C7+ziCyPqjrsSazyV0ezszrBLqwl4wEqEgUrdBSZHaWin1O1Ln0XMoirqqLDV3nfUrMkr+dEcrESA7Hd4yRIH0j5G/br7M0qN7GX6vNyuK/xRJJiil9slMmzrzfB9ReBAtyQPd+qQoQ/AGgkMFKUbwrnSC9C5FKSRYLpZmL6QJjDy8tXWyu4veuQ0JOilQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFOvWV/8GRg87HfFGegQuDxbL2+GSJnKpEbr9gj7PLQ=;
 b=FdQaqH2rL7jWlRM0W+m8boGFoEUSDUy4HnqscsZ5rI+AYqCnu9Alx+YZraBaCJGZpDAB2WSR5i1LEbWuiufl2VmTI9d9IaTv93W3XkMKtokwTayADuLoDnUE93g3KeBskYeGAFKC4gHJPGH9hFnf8sQINi/otJTdq4jYEBWAszxIPtv6SapUB/foJlfNuvB9OV5/AY8Pm+4Qm7t76hPet+zi+Ru4R3E6VgXq13OqvsN0uQ4QMrYz8ggjrojPQHhsK3Y1AC2LQ1YXwfb72JVrLA70DdaR/WQPJi1n4lN1tN2ui3QYTRiHkAF5DeNIXE76TCr1Rw5GL8CkN2uMHqZ6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFOvWV/8GRg87HfFGegQuDxbL2+GSJnKpEbr9gj7PLQ=;
 b=WQL3wIJUfyzk/DjRzmyKKOGXY4x5av2rRFGd5lI3Y5CouuoOR0eEoJmlzW9lBZSkBaxzqFwVaXXvku1EKMYGSRR62vRci7loWqbsWNLmemApWa2XbqikiqA3noVomorVlDIADvYfl+SgvQp0K6xI9YbtBiF/PcHHJ7S9YzepIPk=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB3035.namprd11.prod.outlook.com (2603:10b6:5:69::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 20:08:50 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::d040:bf81:df34:7648%3]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 20:08:50 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: Thang Nguyen <thang@os.amperecomputing.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Topic: Where to collect information for Redfish System's Processors,
 Storage, Memory data
Thread-Index: AQHXGk5bmpyzcDwpB02ckXa9+uLk8qqIkRgwgADOWACAAM/TUA==
Date: Thu, 18 Mar 2021 20:08:50 +0000
Message-ID: <DM6PR11MB44106F3A52B2949ACA9950C594699@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <925a9eba-db8f-fba0-7d17-db32860c44ba@os.amperecomputing.com>
 <DM6PR11MB4410AB2F408E39757C2D38B1946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <f5275c09-4eb8-fc19-520a-5c3d23a94235@os.amperecomputing.com>
In-Reply-To: <f5275c09-4eb8-fc19-520a-5c3d23a94235@os.amperecomputing.com>
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
x-ms-office365-filtering-correlation-id: d186f25b-d426-41b4-40a5-08d8ea49a582
x-ms-traffictypediagnostic: DM6PR11MB3035:
x-microsoft-antispam-prvs: <DM6PR11MB3035D0184E290EE26084FBE994699@DM6PR11MB3035.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UTxh77nfcAvL0CEvNxhl8wzvFeexx6ZvaM64zaOkMpFfXl2m9De23zkndIoCOk1xZQaDV8aGwy74FcRMjJEFZcd9WBwyxiUMD6Y5mVOZxItadKZ4o3Ci7j23Mdy/XHI/+byCxOYWNgm6/5RyTt/6NnRqCW3669L5/8n1xQ9W2UvimEHxY5+5BxS83BeJd4ZFn5bVpkvS0nNGLBoWddsoj++zKAZsiv7bRwOCjSHLMgaKZ1+FrY5Y5vEMlSfu2vz1ZLe8KYdUMBRGTLdwQMy5B+Pw9GSpw+V/MP3GhGoCE27oQ+D7CdCzuivTLxs816kBirRhuf6IvgiCOkuyPunladlb+U3aWETCgNwLTWwCyh0cNHaaNt4gX4PhnNNSX2elc9cmqn/KO3J1bP7zKl70DX3J88jfCVKAqi31vzhcb1EPKNBLElLNtwgF259t7+yuMTQ5TCNB1OaT0XmpwbPK42eko8hJnG1IP5ms+MdVslEIVWDfmv0R9XwCx5zlvapRGlcFovtQjz+yBmO7TJNpzgmkm5YdQgh5U200+uVx05+/4wesvoek5RihcKS1dtbyEMYqokcLOFxIyAKhHUhit360nh+vo986o8KEZ3awGSk+fnEpbw1aO8PbTMTdi069mYPiYXomVNDwywoR67bBs+W6iG23JHX80Qx1Mr84GujbIITUZbo+is/ItoFjWDF+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(186003)(55016002)(316002)(76116006)(9686003)(83380400001)(38100700001)(52536014)(110136005)(33656002)(478600001)(8936002)(71200400001)(26005)(7696005)(19627235002)(66946007)(8676002)(64756008)(5660300002)(66556008)(66476007)(6506007)(86362001)(2906002)(53546011)(66446008)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N0JabjVGZnE2YUcrbS9kNTNLNzVwSVI4ZGNVMkRWbWp5eUFUQXBHYVlGM0Vr?=
 =?utf-8?B?Z0dZWUJCQzlaK1RjU2gycCtkVHdXVnFyeWFvYURlOTNIUDRnRktJTXErNTBz?=
 =?utf-8?B?aVRhbzc4SHB1bGZmZVg3aStlS05kSGtmaDZoeXRnb2tFd1prN1ZjRjFsWFhn?=
 =?utf-8?B?VzBZUStUN0piNUQyekR4cWpOWStzVFVLK25pVlBMakdaOGdxb2s5Q096VHps?=
 =?utf-8?B?RlcvdlFsdGgzbW9ub2srcG5vdkx3eXQrcVpudVNOWTVoZFN0QnBXeEdTd0FC?=
 =?utf-8?B?MFZsSTN0VlVaMEtWbzlTUXFPbGlvKzhpd0pCbzJsd3VxQXByd0x3Ujdka3BV?=
 =?utf-8?B?azIzdi80YWw2UGtSVFFhQTdVYlpucUUwQXVKMk0vRFh2U1RzMjNUU0x0SUJs?=
 =?utf-8?B?ZWtpTFJXeEtNbGQzbkFhYktEdUV4TWFqdmUvZmF6dUdDeDVCZ0NvZTZHRzRN?=
 =?utf-8?B?bzAvNnZUNERaa21xMnFYOW9rUjErYkExTEY3Tk9aS1pVTDIvK3YwVGxIUlNo?=
 =?utf-8?B?YS9ad3hBMW1iSEM0cmdHNHdvQTlvT3JBeWUvQ2t2R2hnYXZvQURnRXRHM211?=
 =?utf-8?B?d3VTSUtxbnZyZ21nazJFRGFYdDhoYnRGaklUcmtlbWNOangyTGNmR1BkbTZy?=
 =?utf-8?B?SUxJcmt3dC9YT0dvNytVdFlJcys4SmpqNjEwRmxDQW1TM3M2YmJWRjQ2VXdD?=
 =?utf-8?B?L0ErUURZelFjWmxTMUNhMFpVT3lrakhPcHRjVUhNRUpOaVplUXFTSFVZVGpw?=
 =?utf-8?B?MzRXbW9hbS9nSlU1bmt5S3V4b2UrTXlSZ3AvM3pNVGhCMllnNzlaVFlHNjRZ?=
 =?utf-8?B?ckdqOE1yZEROcSswYnJEeVkyMElGK2pBc1FaODZpWlB4bXpmVkx1NENKcnpH?=
 =?utf-8?B?cjRLb0M5UldYMEFtNlNsL3hmZURvTkoxOTJTcFI4Y1Y0bDRTN3p1akR3cTJF?=
 =?utf-8?B?T09QdUxBR1pWcGdUclV4dzRCcWpvQmtlUGt1Uk5wdHFtaXo1dXkxb004NXVJ?=
 =?utf-8?B?NENiNHFIY2I5U2Evd20xRHY3NnRhYVIydkpYRm42dlE5ek1LdXhKNnN4cnZt?=
 =?utf-8?B?REptL3QvdytrTlNsZFl6SitvSWZzTFVlQkQrQ0xWTEJJbjlSK1k1RUZ3TVRQ?=
 =?utf-8?B?dTExbEZ5NWZLZEhJRVhjdFphVGYrSDJzd00xS3RPOHNPblFiL1V4czc0NnNY?=
 =?utf-8?B?Q1YwOUFnNUhMZmE2UTVEcTJhSC9Qdkh4Rm0zTzlpa013eXZOU1FYWThJbFFm?=
 =?utf-8?B?Nld6anFwMHZadGV1cHhud29jT0ZMVkIwditQbzQyZWNSVjZQUGxPUWFieks0?=
 =?utf-8?B?QmlZSlZkWURzeFBraXFRbHJBYm9sTzUrTFhwWFJ3eThLZGkvZTZqbFVpQ3pk?=
 =?utf-8?B?YVE0bXk1UzB4c3A5OTIzanZKd09UVDhqRG5MckdJYmg3czFWbFJTSkhaVmth?=
 =?utf-8?B?NElOdXhNempUdlZqdFF2Y3BWeFVidnVHQ1I4TEcvZC9oaXlsQW4zSzdVcVRR?=
 =?utf-8?B?OFhVdjdNdC9nOXBhNHlKMFVsakh2RkFBck5yVWVXOXVsQzlIcG1OejdxeVpL?=
 =?utf-8?B?SVNMREZDOEVqMGRWWHBNNW54bm1aRXVoUDZ2UmtBSVJLcVNhM0xyVFhJWVJ4?=
 =?utf-8?B?S2dISWhibURRQUFRZzdSVGJqMTBoWXN6KytQZUhpd0NEK1RhbjI1bXliQXFh?=
 =?utf-8?B?bGU1T2xBYkxzcFVLM1dLTDRjNFpJamNuQTN0NjRTUWk3S3o4UnE3VzZUekIr?=
 =?utf-8?Q?R2BiZU+3qdOzU3HDh0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d186f25b-d426-41b4-40a5-08d8ea49a582
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 20:08:50.1895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9Tf/Pln2Zf6/pes756iNWoJlXRUOzBlcqlXYOzJVqu8o7opoD99Zii3WmUEAaOV9x3sieo0M4SzaFh1svAokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3035
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFRoYW5nIE5ndXllbiA8dGhh
bmdAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4NCj5TZW50OiBUaHVyc2RheSwgTWFyY2ggMTgsIDIw
MjEgMTI6NDEgQU0NCj5UbzogUmVuLCBaaGlrdWkgPHpoaWt1aS5yZW5AaW50ZWwuY29tPjsgT3Bl
bkJNQyBNYWlsbGlzdA0KPjxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+U3ViamVjdDogUmU6
IFdoZXJlIHRvIGNvbGxlY3QgaW5mb3JtYXRpb24gZm9yIFJlZGZpc2ggU3lzdGVtJ3MgUHJvY2Vz
c29ycywNCj5TdG9yYWdlLCBNZW1vcnkgZGF0YQ0KPg0KPg0KPk9uIDE4LzAzLzIwMjEgMDI6MjYs
IFJlbiwgWmhpa3VpIHdyb3RlOg0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtDQo+Ym91bmNlcyt6aGlrdWkucmVuPWludGVsLmNv
bUBsaXN0cy5vemxhYnMub3JnPg0KPj4+IE9uIEJlaGFsZiBPZiBUaGFuZyBOZ3V5ZW4NCj4+PiBT
ZW50OiBUdWVzZGF5LCBNYXJjaCAxNiwgMjAyMSAzOjIyIEFNDQo+Pj4gVG86IE9wZW5CTUMgTWFp
bGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4+PiBTdWJqZWN0OiBXaGVyZSB0byBj
b2xsZWN0IGluZm9ybWF0aW9uIGZvciBSZWRmaXNoIFN5c3RlbSdzDQo+Pj4gUHJvY2Vzc29ycywg
U3RvcmFnZSwgTWVtb3J5IGRhdGENCj4+Pg0KPj4+IEhpLA0KPj4+DQo+Pj4gSSBhbSBsb29raW5n
IGZvciBob3cgdG8gc3VwcG9ydCBSZWRmaXNoIFN5c3RlbSBzY2hlbWEgd2hpY2gNCj4+PiBpbmZv
cm1hdGlvbg0KPj4gPmZyb20gSG9zdDoNCj4+PiAtIFByb2Nlc3NvcnM6IHJlZGZpc2gvdjEvU3lz
dGVtcy9zeXN0ZW0vUHJvY2Vzc29ycw0KPj4+DQo+Pj4gLSBTdG9yYWdlOiByZWRmaXNoL3YxL1N5
c3RlbXMvc3lzdGVtL1N0b3JhZ2UNCj4+Pg0KPj4+IC0gTWVtb3J5OiByZWRmaXNoL3YxL1N5c3Rl
bXMvc3lzdGVtL01lbW9yeQ0KPj4+DQo+Pj4gSSBsb29rZWQgaW50byB0aGUgYm1jd2ViIHJlcG9z
aXRvcnkgYXQgcmVkZmlzaC1jb3JlL2xpYi9tZW1vcnkuaHBwDQo+Pj4gYW5kIHJlZGZpc2gtY29y
ZS9saWIvcGNpZS5ocHAgYnV0IGp1c3Qgc2VlIGRvR2V0KCkgZnVuY3Rpb24gdG8gcmVhZA0KPj4+
IGRhdGEgZnJvbSBkYnVzIHRvIHJlcG9ydCB2aWEgUmVkZmlzaC4gVGhlcmUgaXMgbm8gZG9Qb3N0
KCkgZnVuY3Rpb24NCj4+PiB0byBwb3N0IGNvZGVzIHRvIFJlZGZpc2guDQo+Pj4NCj4+PiBNeSBx
dWVzdGlvbnMgYXJlOg0KPj4+DQo+Pj4gMS4gSG93IGNhbiBIb3N0IEJJT1MgY29sbGVjdCBpbmZv
cm1hdGlvbiBhbmQgc2VuZCB0byBCTUMgc28gdGhhdCBCTUMNCj4+PiBjYW4gcmVwb3J0IHZpYSBS
ZWRmaXNoPyB2aWEgaW4tYmFuZCBSZWRmaXNoPw0KPj4+DQo+Pj4gMi4gSWYgdGhlIGluZm9ybWF0
aW9uIGlzIG5vdCBmcm9tIEJJT1MsIGhvdyBjYW4gQk1DIGNvbGxlY3QgaW5mb3JtYXRpb24/DQo+
Pj4gV2hhdCByZWNpcGVzL3JlcG9zaXRvcmllcyBhcmUgdXNlZCB0byBjb2xsZWN0IGluZm9ybWF0
aW9uPw0KPj4+DQo+PiBbUmVuLCBaaGlrdWldIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Nt
Ymlvcy1tZHIgaXMgdGhlIHNlcnZpY2UNCj4+IHRoYXQgcG9wdWxhdGVzIGRidXMgb2JqZWN0cw0K
Pg0KPltUaGFuZ10gVGhhbmtzIGZvciB5b3VyIGluZm9ybWF0aW9uLiBCdXQgSSBkb24ndCBzZWUg
YW55IG1ldGEtKiB1c2Ugc21iaW9zLQ0KPm1kci4gSG93IGNhbiBPcGVuQk1DIGdldCBTTUJJT1Mg
aW5mb3JtYXRpb24/DQo+DQo+RG8gd2UgbmVlZCB0byBpbXBsZW1lbnQgSVBNSSBPRU0gb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdCB0byBzZW5kIGRhdGEgdG8NCj5CTUM/DQo+DQpbUmVuLCBaaGlrdWld
IEkgc2F3IGFub3RoZXIgcHJvcG9zYWwgZm9yIGFkZGluZyBQT1NUIGFuZCBQQVRDSCBpbiByZWRm
aXNoIGluIGEgZGlmZmVyZW50IHRocmVhZC4gDQpGb3IgY29tcGxldGVuZXNzIG9mIGluZm9ybWF0
aW9uLCBoZXJlIGlzIHRoZSBleGlzdGluZyBJUE1JIGhhbmRsZXIgaW4gaW50ZWwtaXBtaS1vZW06
IA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaW50ZWwtaXBtaS1vZW0vYmxvYi9tYXN0ZXIv
c3JjL3NtYmlvc2hhbmRsZXIuY3BwDQoNCj5BbmQgVUVGSSAoRURLMikgY29sbGVjdHMgU01CSU9T
IGRhdGEgYW5kIHNlbmQgdG8gQk1DIG92ZXIgSVBNST8NCj4NCj4+PiBUaGFua3MsDQo+Pj4NCj4+
PiBUaGFuZyBRLiBOZ3V5ZW4gLQ0K
