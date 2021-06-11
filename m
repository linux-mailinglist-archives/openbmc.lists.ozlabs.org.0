Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A513A3B8A
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 07:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1VTf0S0sz3bvQ
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 15:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=mDhC3oHy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.109;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=mDhC3oHy; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300109.outbound.protection.outlook.com [40.107.130.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1VTJ5QJpz302Y
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 15:56:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWcWH4B3aIRKhbp3zaGFgrXf/TWUmkR1Sr8RY9+sw+rkv8tUh+2JLDzvwmNa65/VZRuIV2yaOFQSiWPa4YRsKG4z4mD/QLdp8DV0ZJU/Ao6m0B0RFHm3R3HtNWXWYrNWruCRnr4aI/3/O175UcPydwRnECNFsYLbFS99Ztd70UoQ3ov/hezwseKReXgtaeTPeOfbkjAc8nJHa9/KqeC3wbZ+pH/6VEctvuypQ5n7Xc4Xf9mvMCMHKO0sJ4Hfbu4UnRKtJDFeb7OT54+ArTorrbrIj3WmNRK7Ghj3VWZR9Upk9zTTI8tOJoFMoRfburH7ouImkF3ui49tXuwuDHY0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzNc/I3D3nEgVycPoxfVzvp4Mx+aInEMUfRH186tZh8=;
 b=N8nqHrQbGppHrJLEA3+4o0Okb//2dMeODBP/viHfJjGk2FFf6iI7i0BxNTqjaESXuHLNr2D/2s0nrepGdDC1tqn65XU3R4PVrdemumjEdKuhtrDhZK6IrRYr6TM5OvrRczOAogdiMDbnkFdHJP62c8h6YN13ht49mJiAfodIyaKJpTogQ65NMM3BGQXj9tZ85bT2yGC1EFd0jxnJvnlL8xWWZ03VCMcYK4lIn7KCr27X1zh9MDMzu1K1btxzY9WZrqCNnI93eTGju68Ed1zHrLz+IKsE0mT7WTS2yLRjllPEcafIabnkvadp9Q6KYWUnpx/ObQ6aNl3AAJ8eyDw6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzNc/I3D3nEgVycPoxfVzvp4Mx+aInEMUfRH186tZh8=;
 b=mDhC3oHyJHAgsmna/QiszM5Z0NGf5wmkt/Ncnv0VEipahuT4X7E7u5EN/2ch1UJQf1ARBfgF5MfpLXOopC4GGNgCv/1+3CXsDGbxT92we4s+58EkN3KoSl5ggwAjz0zTgUmcRkLt8xg8RFl8Lqu+Ta+DPNXH/O0YEApuja+cM3g=
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com (2603:1096:203:5b::20)
 by HK2PR04MB3778.apcprd04.prod.outlook.com (2603:1096:202:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 05:56:06 +0000
Received: from HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::b01d:7a8b:441d:95a]) by HK0PR04MB2737.apcprd04.prod.outlook.com
 ([fe80::b01d:7a8b:441d:95a%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 05:56:06 +0000
From: =?utf-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SYSTEMD_OVERRIDE do not install into image
Thread-Topic: SYSTEMD_OVERRIDE do not install into image
Thread-Index: AddehjIGyPGnl/XER5W/SdvBjrs6IA==
Date: Fri, 11 Jun 2021 05:56:06 +0000
Message-ID: <HK0PR04MB273730C0DEBB24EE4A435477C9349@HK0PR04MB2737.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54ba00d0-24ba-44a8-ff40-08d92c9d9a93
x-ms-traffictypediagnostic: HK2PR04MB3778:
x-microsoft-antispam-prvs: <HK2PR04MB37782F07E07C0E2C44261091C9349@HK2PR04MB3778.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OPK3ELnotBjg4BPVP0dQwRO+dUogdSsfRZqTLUO303jea3nrYotPy+8UKjSxuOrTtHEYXWeW2AJxf5afRLdWYSAst29ZcPXTjig+Ye+DLGFkL49k6iFNOrmecdUYSk6W/Vk/97jNrXU/CbXrQ0d1B++Liij0VAGXZIj8Uw7jVMgNBUxO3YggU4GQijEgtJDH1zy1MvolFXrgaOomeTvEJbK8tJxeV8DFzCwsEJ4dtKOvpU98Qwywy3wlzcdB/qHnFJKhKJQF5JSfbwt8oBZpmiPa8rgrcbcx/JOUfYgQkj6guO3gepkHmYPW9fFlWCx/wl4Vu40aB1MNa04aBS+2ym3KIZwKXFWSeC8yaZuu4y7dauEEj6pSLUFXXBJyF5ghmZf/dU0IVcuw4P9aCAoA3QxUnkR/itAPY9Nu1TUDFE7Mur/y74sURNjiGMSveG27Wb0cZq//H2oZOJNwqCzQj2UsUYeiT7dEI92W66Ck/e1Tr0OSS8OlLuLqEcyXUwXiwNf/fOd0WGenFN9WTXthU78RSGIc3llZ5l/RfNLpu0xunZULqblad0Wem2yEcDT96DnqAA6pOtJ6cRtjEP2BZzY+0Rk6TPmd94JXWGGRR+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2737.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(85182001)(478600001)(76116006)(66556008)(122000001)(38100700002)(66446008)(64756008)(66476007)(66946007)(316002)(86362001)(52536014)(71200400001)(2906002)(26005)(186003)(4744005)(7696005)(55016002)(9686003)(6506007)(33656002)(6916009)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VmdkZDFKcEc3bXFnR1VjeFZnWkREbmg5amFkanhSd2pBVkVpcnVTU0tmSWkx?=
 =?utf-8?B?ZkZvUHFiUnVjcDhTZ2QzOUNiL0J0M0RWV2VNNERrU1ZnR0xubGlGRmRqT0VD?=
 =?utf-8?B?OFZzWUQ4V1dubXNobndneTUwRWtZZzRjTHpwb1FOSC9rOGx2bnhCSVl6TUYz?=
 =?utf-8?B?cTV1TnoyZUFHQ25UaXlTZ1hKYkJTRjdKd2xWU21LY1ZUeWkzdGxFRmF2NEJo?=
 =?utf-8?B?TlRvNDdxeGVjK3FGdDFQZHJUWFhsVVJ0SXBLaDRwMlZ0dGVRQld4RmpNRnNx?=
 =?utf-8?B?VlE3NWxtNzJNWE5KdWl3OVdobS9ObjB1b0ZIOFlIb3FkQzF3Ym9xOWMvN0Nh?=
 =?utf-8?B?WGdMTThxL1dMbS8ycW5zelZBUThuQ2tYdDBqMzlnamkvYWQ1Ry9nemxYSDVj?=
 =?utf-8?B?VmtWTEsxVjNOMTVtUmZOZ042U01ETEtxN3dhcGRkY1ppbitoVlIyUktVbDRI?=
 =?utf-8?B?eHdtQjA1THRUNGdJMWRHZmF0eXdmaGtuUE9tQnVwZlBzSkkzVTBHb3dqaitj?=
 =?utf-8?B?NU1pTFRWb0xQT09OYS9iV09rYmp0ZXBrQzZFby9xQnY1a2hYSDJsYldDT1Ew?=
 =?utf-8?B?Y0lnNUovMXY3STZNdFFLbmV5L2dWZ3o5OERHQ1duUFNiMXNMZVIxcVQzK2dB?=
 =?utf-8?B?MWFnR3BZK1pidE5UcGVBMVVGS3UwOXQ4UHJBOW9OOGdmOG5wT2E4T1A1ZDhh?=
 =?utf-8?B?ZDhEOWZlRHFzOE1VRWFNVk1HSVM0UUpjNVljbWdZL1l6SWJWZXZiTFhZeFJR?=
 =?utf-8?B?eThEWk5tZkk0K0ZEbUNOY3dxT2xJWEN6bHZ2UUQ2K0drSERZRWV6ZzZKTkdP?=
 =?utf-8?B?akt2Y0tseHdSMDlKT3U2V05jVm91Q3Fwb3Z1d2sySlVGZDZTMElwU0hFbE1P?=
 =?utf-8?B?aGtUZHhDUHN3ZUlOdGhhQ3VGamhncmxEczU3KzBWaUtlY2NSMCt3MkREWmJT?=
 =?utf-8?B?c2kxVS9vYlJPN2VSTzVFK3U2OGZsNEZDRTdMaCsyQmEyUjRoVjdxVkd5Ylpo?=
 =?utf-8?B?dWYyc2tWVFpjZHArSG45andjWTBIMk05ZlI1OGZROG0rQ3RZeGpib3YzN2gy?=
 =?utf-8?B?WEY1SEN2MGQzTzU2dG1EaFhIZ3JVNlFyL3V3SVZHa1FUbkdjWmkrRTRRT08v?=
 =?utf-8?B?WGpCenJHZjVPOEVIN0c1QnJYR05GV2prMDMydks0SVdBQVBxbGgyWHBIMEYv?=
 =?utf-8?B?Sk5KTVE1YjJYWU5zdlF4WFVtazgrZk5vU2wzc1FETk1FbHVYOWNOQ1AvQ0w5?=
 =?utf-8?B?NWFtcGYyZFVKL3lsSXV6dkNVS2ZIU3RuazcrdEdIbVZ2eDNjVHArRTFZWU5Z?=
 =?utf-8?B?eGErK0NLQldzelRab3htMGw4cDFSNTRBV2V5dkFCRmRKbFJGaTZ3V1NrMm85?=
 =?utf-8?B?b01Reld0a2thK0haVEtEMHBKYnQ3WWpSLzFKNjg2Rk42dk5heFVRZFFmd3J2?=
 =?utf-8?B?WjlQVkZkc1FKVjU1bFQyYmt5ZDBCb1d3TDM0UGR1aHBBNDdsdlZ4WTNuM2hx?=
 =?utf-8?B?UytSbDdwR2k3QlBUdW1rYS9UQnlWbWxIbllBQW5qaTVEZlFvTjBoZ3pTN0pM?=
 =?utf-8?B?WENsS2FJT2xyNkJ6N3FOOVZ3NkNzelVnb0kyQ2NSbW0vM3VObVVkTTFkbEk2?=
 =?utf-8?B?b3hCcE9RTVJuTStRY3VHWEpqaWpLU1EzTW9zdk5PbndWL0gvYnk4S3hXYjJB?=
 =?utf-8?B?V2kxUWVKcGVTbzdjdEkyVCtKRzBsK2plL0lBTW5oQTJSMjkycG0zaE1RMGxG?=
 =?utf-8?Q?BrJO37r1SZdiZMFMgg58Gmnjrtvu2AKkvQlqXgO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2737.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ba00d0-24ba-44a8-ff40-08d92c9d9a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 05:56:06.3154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f4JXum6O9x6I0oEnvIPTYm/Y25A84VjTfxM02iup9w+JfxnCNq4Jkw9TwTAV9C9eWJ3dR36Tg96o/mXqBut9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3778
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

SGkgYWxsLA0KDQpJIGhhdmUgd3JpdHRlbiBTWVNURU1EX09WRVJSSURFIGludG8gdGhlIGJiYXBw
ZW5kIGZpbGUsIGFuZCBiaXRiYWtlIGRvZXMgcGFja2FnZSBhIGNvbmYgZmlsZSwNCkJ1dCB0aGUg
Y29uZiBmaWxlIGlzIG5vdCBpbnN0YWxsZWQgaW4gb2JtYy1waG9zcGhvci1pbWFnZS4NCkFtIEkg
bWlzc2luZyBhbnkgc3RlcHM/IEkgdXNlZCB0aGUgc2FtZSBtZXRob2QgdG8gb3ZlcndyaXRlIExF
RC5Hcm91cE1hbmFnZXIuc2VydmljZSBhbmQgaXQgc3VjY2VlZGVkDQpXaGF0IG1ha2VzIHRoZXNl
IGRpZmZlcmVudD8gUGxlYXNlIGxlYXZlIGFueSBjb21tZW50cywgdGhhbmsgeW91Lg0KDQpTWVNU
RU1EX09WRVJSSURFXyR7UE59ICs9ICIgc2VydmljZS1vdmVycmlkZS5jb25mOnh5ei5vcGVuYm1j
X3Byb2plY3QuTmV0d29yay5zZXJ2aWNlLmQvc2VydmljZS1vdmVycmlkZS5jb25mIg0KDQphcm12
N2Etb3BlbmJtYy1saW51eC1nbnVlYWJpL3Bob3NwaG9yLW5ldHdvcmsvMS4wK2dpdEFVVE9JTkMr
ZmMzYWZmOTE2NS1yMS9wYWNrYWdlL2xpYiQgdHJlZQ0K4pSU4pSA4pSAIHN5c3RlbWQNCiAgICDi
lJzilIDilIAgc3lzdGVtDQogICAg4pSCwqDCoCDilJzilIDilIAgeHl6Lm9wZW5ibWNfcHJvamVj
dC5OZXR3b3JrLnNlcnZpY2UNCiAgICDilILCoMKgIOKUlOKUgOKUgCB4eXoub3BlbmJtY19wcm9q
ZWN0Lk5ldHdvcmsuc2VydmljZS5kDQogICAg4pSCwqDCoCAgICAg4pSU4pSA4pSAIHNlcnZpY2Ut
b3ZlcnJpZGUuY29uZg0KDQpvYm1jLXBob3NwaG9yLWltYWdlLzEuMC1yMC9yb290ZnMvbGliL3N5
c3RlbWQvc3lzdGVtJCBscyB4eXoqc2VydmljZS5kIC1kbA0KZHJ3eHIteHIteCAyIHVzZXIgdXNl
ciA0MDk2ICAxMSAxMzozMyB4eXoub3BlbmJtY19wcm9qZWN0LkxFRC5Hcm91cE1hbmFnZXIuc2Vy
dmljZS5kDQoNCg0KQmVzdCBSZWdhcmRzLA0KRGF2aWQNCg0KDQo=
