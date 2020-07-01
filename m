Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE545210E6F
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 17:07:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xl2p4kxQzDr5y
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 01:07:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=hRNIaIuz; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xl0N6LbzzDr55
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 01:05:32 +1000 (AEST)
IronPort-SDR: ctUEr6tlFOMcgm6Zn1FqWH36dVwsiBNKDVkKtBH+laFVy+bSUJrHufNzewFV/LOxLE2IFCKplr
 aUrpxvM1s0UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146596035"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="146596035"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 08:05:27 -0700
IronPort-SDR: 5nufq3vW1wI12/rl/MKtarFZqwDQsN4XvUSKPZQT/wnAFoNNjYL9+Eshj0e60VMqlKSF92nQes
 8r08lDqXldbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; d="scan'208";a="312716840"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga008.jf.intel.com with ESMTP; 01 Jul 2020 08:05:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 08:05:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 1 Jul 2020 08:05:26 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 1 Jul 2020 08:05:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Jul 2020 08:05:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSFiqPKi3f/igvOH7PGybJ0LJsHG2XUsctryGnGo0znNbmfP4o3B4YvjhXNPoKpHlxSexCKJOJ+oHQ3mIINhRi8c6YvC8URLpPO5XA7eoFCvbvSZFN4wEHDn5ktWIZisAvej92gPzaJpfbWK6+gnAseR90xheIaHriiaxGxw3AN+7XjDMiCfz94LFDSFTNmP2ou6oJZ9qy3YzBiAIT1Gf4bkjyiiEZsmmsq9rbBEJxXvnltJ/Mcq1HISgFzbjkLnozbhf+MBKGxb1ukUlw6RS15dAl/6wz3dOCSPcGGMOKhvJYdgM/r1C4eOMmQD5tQOEayQmcWcD09g9Ifd/akfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZF+nlAHRWZ8mj5qrGcGzmyYzXwZ+cFIB698NJqeKmg=;
 b=VxJF1STDdGA3StIlF36UDTuNE8Rl0x24TPGNdU/Ym9veEJrLBaM6htJLYeFqx1ukaZ6aetOYF1NiJKt5vaUNRoTrPAHdQEX2ChYjEm3BMVAJ3t8msAKhfqoUkt+Eo249a/sOI9rEqhXeAEdn0Lnl3bzMyG+EHF3HCkL9x1fo9VJejeCWd3pjsdsdjXEWgMJi9CVA0qG3BFkkimEFMLdSSCW63ebVP5Ee9FWigkVHNk9+BdUOxhuoMexmK+/Ow/mNhfcx/1iGsab0QOa7yebFFYrRuHO1pDt3SIWB439Kwc1wL3wn9zH9qoFC3S0BSGYkTz2gUY/bizhRf2wbGJMTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZF+nlAHRWZ8mj5qrGcGzmyYzXwZ+cFIB698NJqeKmg=;
 b=hRNIaIuz+Nr1JN0EQu7C93U39sbU+UbnFjQ39dnMk7am1CoRVPryx3GB7cfkcJrJoy3aA8MnuBvhdRbPatU+R6m6BglJWixdfOF2E/FBkxpBjVPTyqL9TepM2iOo3WR0KGCR9MhslkJI0kcYmSeYICGekkyKQAzVsMwPkxmx5dU=
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 (2603:10b6:910:23::12) by CY4PR11MB1878.namprd11.prod.outlook.com
 (2603:10b6:903:11f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 15:05:23 +0000
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::3447:6d09:f8e2:62cf]) by CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::3447:6d09:f8e2:62cf%2]) with mapi id 15.20.3131.021; Wed, 1 Jul 2020
 15:05:23 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Milton Miller II <miltonm@us.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Subject: RE: OpenBMC health statistics
Thread-Topic: OpenBMC health statistics
Thread-Index: AdZOLPWDDv1xqlasSdaTVfH5fJhasAACN8EAAAH3NoAAAyxEAAAxUcEAAAILVAAAKC9akA==
Date: Wed, 1 Jul 2020 15:05:23 +0000
Message-ID: <CY4PR1101MB2311892FC6029422D65938B6866C0@CY4PR1101MB2311.namprd11.prod.outlook.com>
References: <02d91b6a-c2ba-0239-a62e-a680f97bb009@linux.ibm.com>,
 <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
 <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
 <OF5EABA8F0.4EA96F13-ON00258597.006CE4F4-00258597.006D1458@notes.na.collabserv.com>
In-Reply-To: <OF5EABA8F0.4EA96F13-ON00258597.006CE4F4-00258597.006D1458@notes.na.collabserv.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
authentication-results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.191.221.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0432869c-3373-4208-d871-08d81dd02dfb
x-ms-traffictypediagnostic: CY4PR11MB1878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB1878E0CA4DF52B6E4C658FF9866C0@CY4PR11MB1878.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xz+gLtIEYGXw9eXbfH0W3OlW+Igu5IlEaak1KWQOSRooNlVfn2XS08kvl9IECGZ1p3mURL+eO1J0b8Y3BJ3wqMBfd3Hvs135IxQNyfSWKMWGaNzU+Wm5REKAViiEUIGtMOMxHT//zXnJZXdbaOvlkXK/YmT+Thm/wOADGu80LkX49lRvZG+H6mr7ud8zJkeimLwBmwznGo8XFKlpIJAznTTBiMB+vrrMbowlVoEK0UsaUDWIFWNokRkoWHwMI2WWd6M651mxavWXHgQ7ttKPSop6dLTDeO1KK0BvUhPQ3um2ADrtAh/uwHPBJk2jAfPc8PBl4eg3adq+Rx5OmZ1l7LhoDaJnGBz7E6OJQXaR3WndtrXvNXC2CaWqFL5T6cA1vDD74iu09KzAgAko3q1wng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2311.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(7116003)(76116006)(66556008)(3480700007)(186003)(5660300002)(4326008)(66446008)(54906003)(64756008)(83380400001)(66476007)(110136005)(55016002)(33656002)(966005)(26005)(8936002)(478600001)(8676002)(71200400001)(86362001)(52536014)(53546011)(316002)(2906002)(9686003)(7696005)(66946007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kd+DKXbflTeHqtCsp/+A+OzG8Af05FhT6ZGxFeIELqAjv1v6gp6q6eZnu2EoTnLgfEj72nNaiKgJJw8ks6SPqYZx0CPOs2IMtM1mIeeQZ7FH1j56MapJr51zP3+pIl4MlL1WGCXdlUi7cACeFup2/AOURxqnlnhVF8+pX5uq9BVR2K4TqpR57Z13k+XGO1pP4AVcsnrx3ZazWMpEkcBBogO6IEIPQzVjeD8LKLS5nZ4yI0KlILZR0BuhJBT/sydeAyEDeJw+NkgHXmJvAyxZ9+60ucuhoe2N7zEE2Zshgl1iH8v5UaQ9j+LAtGos6SQewIx909vTcYmCvHz7PuTvP7xH7pk256r5Mb/AlH8a8ALNtRvkso2uLLFhPiSKUhGcKkrw2aItF1EnXCvZxhVWgaD41eeRTznVaFiOZGRrtCJusv+pmsfHghjMRtUBpNtdm5SC0TznrsQLI1Ix8jhgcu/wua3lttjljPnAJUONGiSKJJv1SwpB4SHDw4u1ICMh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2311.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0432869c-3373-4208-d871-08d81dd02dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 15:05:23.3668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N01nVl2T4GCNWPSZbtMxFTZHbqhijEF+CWpcDm0hEAOTD+y/JijCwSw03NqItxBHNHK4LCZCBfWZnT1OT71ul8giulelvrkPXDKpY0iSxDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1878
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Khetan,
 Sharad" <sharad.khetan@intel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IGZvciB0aGUgbWVhbmluZ2Z1bCBkaXNjdXNzaW9uLiBUaGlzICBkb2N1bWVudCBp
cyBtb3JlIHJlbGV2YW50IGZvciB0aGUgZGV2ZWxvcGVycywgYmVjYXVzZSBpdCBjb250YWlucyBp
bmZvcm1hdGlvbiBhYm91dCBob3cgdG8gaW1wbGVtZW50IEJNQyBoZWFsdGggc3RhdGlzdGljcyB0
byBiZSBjb21wbGlhbnQgd2l0aCB0aGUgT3BlbkJNQyBzZW5zb3IgYW5kIHRlbGVtZXRyeSBhcmNo
aXRlY3R1cmUuIFNvIHByb2JhYmx5LCB0aGUgYmVzdCBwbGFjZSB0byBwdXQgaXQsIHdvdWxkIGJl
IHRoZSBkZXZlbG9wbWVudCBmb2xkZXIuIERvIHlvdSBhZ3JlZT8gDQoNClBpb3RyIE1hdHVzemN6
YWsNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLiANCnVs
LiBTbG93YWNraWVnbyAxNzMsIDgwLTI5OCBHZGFuc2sNCktSUyAxMDE4ODINCk5JUCA5NTctMDct
NTItMzE2DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNaWx0b24gTWlsbGVy
IElJIDxtaWx0b25tQHVzLmlibS5jb20+IA0KU2VudDogVHVlc2RheSwgSnVuZSAzMCwgMjAyMCA5
OjUxIFBNDQpUbzogSm9zZXBoIFJleW5vbGRzIDxqcmV5QGxpbnV4LmlibS5jb20+DQpDYzogVmlq
YXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+OyBLaGV0YW4sIFNoYXJhZCA8c2hhcmFkLmto
ZXRhbkBpbnRlbC5jb20+OyBrcnRheWxvciA8a3VydC5yLnRheWxvckBnbWFpbC5jb20+OyBNYXR1
c3pjemFrLCBQaW90ciA8cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20+OyBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNClN1YmplY3Q6IFJFOiBPcGVuQk1DIGhlYWx0aCBzdGF0aXN0aWNzDQoNCk9u
IDA2LzMwLzIwMjAgYXJvdW5kIDAxOjU0UE0gaW4gc29tZSB0aW1lem9uZSwgSm9zZXBoIFJleW5v
bGRzIHdyb3RlOg0KPk9uIDYvMjkvMjAgMzoyMCBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KPj4g
V2UgY2FuIGhhdmUgYSBmb2xkZXIgImhvdyB0byIgdW5kZXIgZ3VpZGVsaW5lcyBhbmQgdGhpcyBk
b2N1bWVudA0KPnNob3VsZCBmaXQgdGhlcmUuDQo+DQo+VGhhdCBtYWtlcyBzZW5zZSB0byBtZS4g
IEkgd2FudCBkb2N1bWVudCBzdHVmZiBmb3IgYm90aCBzeXN0ZW0gDQo+aW50ZWdyYXRvcnMgKHdo
byBwdXQgdG9nZXRoZXIgZmlybXdhcmUgaW1hZ2VzKSBhbmQgc3lzdGVtIA0KPmFkbWluaXN0cmF0
b3JzICh3aG8gcGVyZm9ybSBCTUMgaW5pdGlhbCBjb25maWd1cmF0aW9ucywgb3ZlcnNlZSBCTUMg
DQo+b3BlcmF0aW9uLCBldGMuKS4NCj5XZSBhbHNvIG5lZWQgYSBwbGFjZSBmb3IgZG9jdW1lbnRh
dGlvbiBmb3IgdGhpbmdzIGxpa2UgaG93IHRvIHVzZSANCj5CTUNXZWIncyBtVExTIGZlYXR1cmUg
d2hpY2ggY3V0cyBhY3Jvc3Mgc3lzdGVtIGludGVncmF0aW9uIGFuZCANCj5hZG1pbmlzdHJhdGlv
bi4NCg0KU3BlYWtpbmcgb2Ygd2hpY2gsIHdlIGFkZGVkIHRoZSBkb2N1bWVudCBidXQgZGlkbid0
IGxpbmsgdG8gaXQgaW4gZWl0aGVyIHRoZSB0b3AgbGV2ZWwgb3IgdGhlIHVzZXIgZ3VpZGUgc2Vj
dGlvbiBzbyB5b3UgaGF2ZSB0byBzdHVtYmxlIGFjcm9zcyBpdC4NCg0KaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9zZWN1cml0eS9UTFMtY29uZmlndXJhdGlvbi5t
ZA0KDQpNYXliZSBoZXJlPyBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzLyNvcGVuYm1j
LXVzYWdlDQoNCj4gRGV0YWlsczoNCj5odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20v
djIvdXJsP3U9aHR0cHMtM0FfX2dpdGh1Yi5jb21faWJtLTINCj5Eb3BlbmJtY19kZXZfaXNzdWVz
XzE1MzEmZD1Ed0lEYVEmYz1qZl9pYVNIdkpPYlRieC1zaUExWk9nJnI9YnZ2N0FKRUUNCj5Db1JL
QlUwMnJjdTRGNURXZC1Fd1g4QXMyeHJYZU85WlNvNCZtPVhDTDhlSTk1NGY0ZXF1RjVtam5vODBr
OVJ0UXBOQnINCj5rRm9XcnR0TEhVRjgmcz1melBCQzJfelNnSEZGMEt1Xzg3UVhQQmxsNUNZcUM5
TFRETzlCRFZDdkxRJmU9DQo+DQo+LSBKb3NlcGgNCg0KbWlsdG9uDQoNCg==
