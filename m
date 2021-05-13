Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AED237F827
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 14:48:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgrzw652Yz306F
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 22:48:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=J2zswaQl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.110;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=J2zswaQl; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310110.outbound.protection.outlook.com [40.107.131.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgrzY092rz2xvH
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 22:47:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5Te5OKcd+k0zig87c/QbkYgqt1oSQrU1/PE/4xUoafYAirma9M+jEpGcbBdwpxZ/uDjODIQCMU+XBOOkf5LFYCPTfmWpSG0aOuKKFH80ZBm7xbncwGGa0xkpVbngrTOVEAQy1rFlIbgf8Griy6J+DWJEfxWFiWJu+lB1N+V12ySCi/1a4+QtzWSwNad9Gd14Y1k66cXf/eukncycXyXCrivbNxBT75Rdp7EeJufEul9OTXg3fl7iSsrLk+05jZVw+iGOWccwW0ZFdEAS1+YCBNcIoZUAYIuOLsLYICabvsVUsqL90EM7DSZR+x44Le456+1FvxVB4z+DwzsOMN7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgXneEkHxua6XJPAJGnVD7MRdXGGhcyt+gPTHvnW9nw=;
 b=RgpcNK38nhB6kHPR8baRC5KbWTX4BUmV62sU+X7gf32+TTWNumFSXs2S1eHOYdDxpbej7gtXpua0lXiplIUlPMBg7oqF7UgU67hNTL6F8V382kCQazjgzrb14NMldVQPxiLpzc2vze3dGgyaFvugVoG/Q+auo9ouzFxxxC4TjUOIAjhioXzYNwx4arVfnvP2AwsPJsMswIRo6YrkLdRJKWvACESKqW5v222bt+DVz+aPTfrqndN5Vl553VTYU35MKLXycTGcI+iL3hBl6XfuLPB2eFOY3Za5jK4nJgrdr+GF8ppEn1o3Vmdo4ltED22VKiVSaCVFZE9H90bEMZMp8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgXneEkHxua6XJPAJGnVD7MRdXGGhcyt+gPTHvnW9nw=;
 b=J2zswaQl+oORgAEkfR3SnfkPF0VDUkIv0LI+WFNCAeiTgFnJ/5uMZgZJUC+rFVrkNunw4hScPfpyUWQLrUxlk6WDF2UXcguytMaBiFjC5F3ip7VxksHtMhUAf9WOSJ+BsBcESsuyUbMmO9HaC4D7YvNpfnO9VcF6PYtaupYtr0k=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK2PR04MB3730.apcprd04.prod.outlook.com (2603:1096:202:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 13 May
 2021 12:47:24 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 12:47:24 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: Brandon Kim <brandonkim@google.com>, Andrew Geissler
 <geissonator@gmail.com>
Subject: RE: CI build for quanta/gbs
Thread-Topic: CI build for quanta/gbs
Thread-Index: AdcPP65+jY/sq0xaRI+ylE14EJw/VQzTh9kbACB1JxAAqx+EqwCOfMZA
Date: Thu, 13 May 2021 12:47:24 +0000
Message-ID: <HK0PR04MB23395928C8737F4177DEFA238F519@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
 <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
 <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <7DAD0FAA-E02E-4666-846C-1363B45871FD@gmail.com>
 <CALGRKGNyJ3WMd1CO36xD2+o8n3ACqaPpu7XwrnJfF83foFZDPg@mail.gmail.com>
 <EF3FAEED-549A-426B-8236-79CFAE728411@gmail.com>
 <CALGRKGM26N+vUdjahXR0L671M2CZGE8o2ochTy7=69vMGDnM0w@mail.gmail.com>
In-Reply-To: <CALGRKGM26N+vUdjahXR0L671M2CZGE8o2ochTy7=69vMGDnM0w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f981814c-a7ee-4b54-c401-08d9160d41be
x-ms-traffictypediagnostic: HK2PR04MB3730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR04MB3730A62163E02CF55DEB25F68F519@HK2PR04MB3730.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xw0sdX8AwLFRTlRe9pTZ+yx0vLTFk+FVmT2W/8EZHYD9orJ+2u60t85kpfJtUq+64Rik/KN3xngIJS33njkAvGOHxRsTBGdT55sdQky1pu4gRC5aurjiB7GoyOX1b5xMLVKblGP3Cgve7uOHIqhgKHZWNnpyFJtCXMjTCgC787Bk2jozuQHep5vjJiJ3kocZy0w8kheuj8A4HatmAdhLTJY48J7C1sNhHzPABjprhBvVY6h4bcmBzwPgrGFwO3WU3oYTM9UIj5aV6Lf9cmaKf6aIRmjTIRx5b1IKlsWFS0AMsm7/4Ge/35DoyGyj4tKLNXmqzl8u4EULv7vQekxpfYgWC4cOo93rcw4/rLshHGWdshQO/iSPNxbwP2nia2faM14c4+ABX3hDsfDVdqdKK2O6NfVona4G4VsRM4gLU4dGNmDV+PgpV9M5YAyLXqKBFuLI21x99OdmjvMSQIZlkv6eyMu1E9+uCBnQVumAr4ByECz6Ov1QaEky8CDhjPz+FN43Kscy1YNZFVEA1xDoiC7NTBH9vINHaxQhzkzN1FfMeDsjaCOMrvnuOTknwkXVvLh1mS4fkax2iFF6g6ZlHodjaErQ3KuQyBnmSAIXxW8rs3b/I+dzvhsgPKjzxNIPN+LZ4Y/C6UPON2IGcECcDKlZRNeDh7S5AWm8vAgcnliqo4++ZukzSP5XxBE5V/uyaH4XSAlc1mY0j168n8zY0UfsH9x/+tKhpVC3Oqh+33M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(85182001)(52536014)(8676002)(33656002)(66446008)(66556008)(66476007)(64756008)(478600001)(166002)(55016002)(966005)(76116006)(38100700002)(86362001)(83380400001)(8936002)(122000001)(2906002)(110136005)(54906003)(53546011)(7696005)(9686003)(6506007)(26005)(5660300002)(186003)(4326008)(66946007)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?NzdRUXVGeEVDKzRHSExEc3Nxdi9PakRnTnpmSGNLeFdVOFp0cjlMM0FESXJTRng2?=
 =?big5?B?ckY3ZE5QN0IrM0MyR0ZNaERvTjdya2pzQWhYV2Naa1plalRZMGk4TFVndmpjdHo2?=
 =?big5?B?NW5qdmZlN2J1ZGZTUzhUdHlaMG1pWS8yTm5BNXFJbExib2I0V3hXaDg5WkNzdjht?=
 =?big5?B?NUlWeG9BYjBRNG9WMU84ZmFtQlZPdFhXOXIzeFljZmNqanlLU0RCdGlVYS96V21t?=
 =?big5?B?Y0F4NkR2K3BYOUd3dG9FQ3ZVdlMrYUZMc1ZBWElmTHZ4L2k1dlB3Um1STXZVMVI5?=
 =?big5?B?WFBsSVhZM25INHBHWVZ2TTd1NTZYdUpBWXVZOFVJOFlLRy9hT2ZLWkl3QlZZSmJI?=
 =?big5?B?ZVVqczFqclU0NGNFdGdUMjdDS1RBL3FkQkU4UHFrWElTVEFxQjZSUGZTYnZzeGQ1?=
 =?big5?B?SXIybVFsSUdpbS9WZllqR29nQVlWdXBPb2wvYXJiU0VRSG96RWFIa3poVkRJbXJD?=
 =?big5?B?Z0k3dG9jMlBpNHo0QitLV1dzR2I1UVpURHVCcDhvMm9VTkpPdGl1UDFtTTNrMTZB?=
 =?big5?B?WDF6aGhiamRrQUMrSEM2OHc3WHQ3WHp1UjdXaVo4RmVncUc0Y1RoTkFhVEk0S3pU?=
 =?big5?B?ekFTWWJOaENtc3FBc284ckJxb3c1Y3lrZkwxVVpqYzdWanNDUUNpRVdTbWdXTE85?=
 =?big5?B?cE1uYjZ2QVFNVGhTSjJXOTF3WXBJbjJycmFLV290S0V5Ymd6Z3oyTUlJdmhyS21C?=
 =?big5?B?M1FncDZEeHBReWk4QzJQeWZtYTRzcG92Rk94dW5JNVVLNi9zOXQ4cFVmN2NEbHR0?=
 =?big5?B?aWp3UkdIVTB0NmovTVRRWUx6UENRZ3pGUHFkdjdlemU1dFgrdjdZZmxoQm9lK2dL?=
 =?big5?B?QTR4N1JxMndHRXZlVXlTMklhZHVXMFd6M0MwanNVWkx2SnVIVzZJbXAwd25sWmps?=
 =?big5?B?SWQ2MXkzallwcWJmWU9kRjRueGh5V2UyZUVPZzZYTDlxbGtTVHp6c1lZVjhXQWNO?=
 =?big5?B?OWkvV29LeWw1dGdBRmN1citaSmVWUVFDa3pvcGRteXBlbkNGdENUelNBN3Y0V0sx?=
 =?big5?B?cCtvdkhCQ1B1ZTBtbGJpZHZGZ2lac1F6VVR5MTZHSHF3eUZjRWRCbStxUUNUR3py?=
 =?big5?B?OGYrUS9SdFoxdG9qSDVRNEdnUmViWEVGN05uVW94Q2puUTVYeGZhSjRpVlhPclZJ?=
 =?big5?B?b2VaMFAzUVhacVdMdGNqVWJXK1dPdmxyY0t2cnJOdi9SVE41eENhcEp5b3M5YzB5?=
 =?big5?B?RWEzam5qK1pkcTc4T2xUZGV1MlJOaW91bVVGMzBORGNjcWpoQ05WZU9lWDh1aVpr?=
 =?big5?B?RjAwdVpwZkkwMDRKQVZya09sejN6anJMbVVNclUyVHVyYlg5dGphb29oeUtZejYr?=
 =?big5?B?RWRZTXpoLy9wc3poUXhGVkFGZWxFNUxkR3lydXF3bll0ZkVyMlhZTEJvZ2o1OXpw?=
 =?big5?B?RUkvazhoUGFNQUU1MzZiUkxYWitIa0NTWEQycnU0QUg4TEE4dUZsTkF4WkFqZEU3?=
 =?big5?B?SGRuV0VUdkJWSG0zL2NReTVtVHhROUYzb2pWNENGd1JEVkpLWlQvTXk1MGwzRnp4?=
 =?big5?B?M3J6ZW10enAvZjRFRzEvZ0lMUmQyZk91NWxiL2pTUnpHYmZKaDhjZlVSakx4Q1U5?=
 =?big5?B?bTVHTnR6V2ljemw2WmkxcFVocWNhYWhKd3JpUlJSVDZCWnIxUWlQL3lwbEYwOHNP?=
 =?big5?Q?U13IPIwvMCWcz0AcMWaFWtcR0Q3GLg42Kcw0LRfTjd6UbUBk?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB23395928C8737F4177DEFA238F519HK0PR04MB2339apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f981814c-a7ee-4b54-c401-08d9160d41be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 12:47:24.2013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ywoqgphw9keXL87z/b7hkeLbEh7db1uCKr9CP9trmKliuslsfVqpG17FUSoDOlbyakKnMvksxiidtUvEhYKZl8L45AB5iTA2iVgmahkxfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3730
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB23395928C8737F4177DEFA238F519HK0PR04MB2339apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KDQpTb3JyeSB0byBtYWtlIHlvdXIgaW5jb252ZW5pZW5jZSwgd2UgYWxyZWFk
eSBmaXggYWxsIENJIGJ1aWxkIGVycm9ycyBhbmQgYWxzbyBydW4gQ0kgYnVpbGQgbG9jYWxseSB0
byBtYWtlIHN1cmUgaXQgY2FuIHdvcmsgZmluZS4NCg0KQ291bGQgeW91IGhlbHAgdG8gbWVyZ2Ug
Z2JzIHRvIENJIGJ1aWxkID8NCg0KDQpUaGFua3MgYSBsb3QuDQoNCkJlc3QgUmVnYXJkcw0KR2Vv
cmdlIEh1bmcNCg0KQXBvbG9naWVzLCBvbmUgb2YgbXkgb2xkIHBhdGNoIHRoYXQgUXVhbnRhIHNl
ZW1lZCB0byBoYXZlIGJlZW4gdXNpbmcgd2FzIGZpbmFsbHkgbWVyZ2VkIChodHRwczovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1od21vbi8rLzI0MzM3Lzxo
dHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZnZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5eiUyRmMlMkZvcGVuYm1jJTJGcGhvc3Bo
b3ItaHdtb24lMkYlMkIlMkYyNDMzNyUyRiZkYXRhPTA0JTdDMDElN0NHZW9yZ2UuSHVuZyU0MHF1
YW50YXR3LmNvbSU3Q2YxNGJmNjhhNmVkYTQzZWNkOWNiMDhkOTEzZDM0MDk1JTdDMTc5YjAzMjcw
N2ZjNDk3M2FjNzM4ZGU3MzEzNTYxYjIlN0MxJTdDMCU3QzYzNzU2MjYyMDMzMzYyNTUxMCU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJnNkYXRhPUgzU3VVck1wcyUyRmJr
OWxkakM5c0xqWjVqVXlXUEtkY3BkcVpZMWpEZzBlWSUzRCZyZXNlcnZlZD0wPikgYW5kIGl0IHNl
ZW1zIGxpa2UgdGhhdCBjYXVzZWQgdGhlIHBhdGNoIGZhaWx1cmUgeW91IHNlZSBoZXJlLg0KDQpI
ZXJlIGlzIHRoZSBmaXggdGhhdCBzaG91bGQgZml4IHRoZSBwcm9ibGVtOiBodHRwczovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9vcGVuYm1jLysvNDMwNDY8aHR0cHM6Ly9h
cGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
Z2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXolMkZjJTJGb3BlbmJtYyUyRm9wZW5ibWMlMkYlMkIl
MkY0MzA0NiZkYXRhPTA0JTdDMDElN0NHZW9yZ2UuSHVuZyU0MHF1YW50YXR3LmNvbSU3Q2YxNGJm
NjhhNmVkYTQzZWNkOWNiMDhkOTEzZDM0MDk1JTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3MzEz
NTYxYjIlN0MxJTdDMCU3QzYzNzU2MjYyMDMzMzYzNTUwNSU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MxMDAwJnNkYXRhPTZIcW41RzVmcE1aTkRzMXpadjE2a1lwJTJCd25LOHNC
a0taM25KQ0poaGNYcyUzRCZyZXNlcnZlZD0wPg0KDQpUaGFua3MsDQpCcmFuZG9uDQoNCk9uIE1v
biwgTWF5IDEwLCAyMDIxIGF0IDg6NTUgQU0gQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBn
bWFpbC5jb208bWFpbHRvOmdlaXNzb25hdG9yQGdtYWlsLmNvbT4+IHdyb3RlOg0KDQoNCj4gT24g
TWF5IDcsIDIwMjEsIGF0IDc6MTkgUE0sIEJyYW5kb24gS2ltIDxicmFuZG9ua2ltQGdvb2dsZS5j
b208bWFpbHRvOmJyYW5kb25raW1AZ29vZ2xlLmNvbT4+IHdyb3RlOg0KPg0KPiBIaSBBbmRyZXcs
DQo+DQo+IERvIHlvdSBtaW5kIGtpY2tpbmcgb2ZmIHRoZSBkb2NrZXIgYnVpbGQgYWdhaW4gZm9y
IGdicz8gSXQgbG9va3MgbGlrZSBzc2xoIGJ1bXAgbWF5IGhhdmUgIGJlZW4gbmVlZGVkIGZyb20g
bWV0YS1nb29nbGUgaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMv
b3BlbmJtYy8rLzQzMDE1PGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6JTJGYyUy
Rm9wZW5ibWMlMkZvcGVuYm1jJTJGJTJCJTJGNDMwMTUmZGF0YT0wNCU3QzAxJTdDR2VvcmdlLkh1
bmclNDBxdWFudGF0dy5jb20lN0NmMTRiZjY4YTZlZGE0M2VjZDljYjA4ZDkxM2QzNDA5NSU3QzE3
OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc1NjI2MjAzMzM2MzU1
MDUlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT1OamYlMkJw
WHRscm1FbSUyQmtUblVnVGJQN1hWZWJ4TDJmR0QlMkZXaUdIUHlFbmlzJTNEJnJlc2VydmVkPTA+
DQoNClRoZSBqb2IgcnVucyBkYWlseSAod2hlbiBuZXcgY29kZSBpcyBhdmFpbGFibGUpLCBsb29r
cyBsaWtlIHdloaZyZSBvbiB0byBzb21ldGhpbmcgbmV3IG5vdz8NCg0KaHR0cHM6Ly9qZW5raW5z
Lm9wZW5ibWMub3JnL2pvYi9sYXRlc3QtbWFzdGVyL2xhYmVsPWRvY2tlci1idWlsZGVyLHRhcmdl
dD1nYnMvMjM0L2NvbnNvbGU8aHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGamVua2lucy5vcGVuYm1jLm9yZyUyRmpvYiUyRmxh
dGVzdC1tYXN0ZXIlMkZsYWJlbCUzRGRvY2tlci1idWlsZGVyJTJDdGFyZ2V0JTNEZ2JzJTJGMjM0
JTJGY29uc29sZSZkYXRhPTA0JTdDMDElN0NHZW9yZ2UuSHVuZyU0MHF1YW50YXR3LmNvbSU3Q2Yx
NGJmNjhhNmVkYTQzZWNkOWNiMDhkOTEzZDM0MDk1JTdDMTc5YjAzMjcwN2ZjNDk3M2FjNzM4ZGU3
MzEzNTYxYjIlN0MxJTdDMCU3QzYzNzU2MjYyMDMzMzY0NTQ5OSU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWFZDSTZNbjAlM0QlN0MxMDAwJnNkYXRhPTVpaHBDTTZ0WjZKNFljJTJCMjhnQkYlMkZ6dTZC
cldYY3VrelQ0NWVVZWVXYllNJTNEJnJlc2VydmVkPTA+DQoNCjMgb3V0IG9mIDUgaHVua3MgRkFJ
TEVEIC0tIHJlamVjdHMgaW4gZmlsZSBzZW5zb3IuaHBwDQpQYXRjaCAwMDAxLXNlbnNvci1JbXBs
ZW1lbnQtc2Vuc29yLUFTWU5DX1JFQURfVElNRU9VVC5wYXRjaCBkb2VzIG5vdCBhcHBseSAoZW5m
b3JjZSB3aXRoIC1mKQ0KDQpzdGRlcnI6DQpFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3Jl
ZCBpbjogL2RhdGEwL2plbmtpbnMvd29ya3NwYWNlL2xhdGVzdC1tYXN0ZXIvbGFiZWwvZG9ja2Vy
LWJ1aWxkZXIvdGFyZ2V0L2dicy9idWlsZC93b3JrL2FybXY3YS1vcGVuYm1jLWxpbnV4LWdudWVh
YmkvcGhvc3Bob3ItaHdtb24vMS4wK2dpdEFVVE9JTkMrNmQ1MGMzZTllMS1yMS90ZW1wL2xvZy5k
b19wYXRjaC4xOTExOA0KDQoNCj4NCj4gVGhhbmtzLA0KPiBCcmFuZG9uDQo+DQo+IE9uIEZyaSwg
TWF5IDcsIDIwMjEgYXQgMTE6MjYgQU0gQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBnbWFp
bC5jb208bWFpbHRvOmdlaXNzb25hdG9yQGdtYWlsLmNvbT4+IHdyb3RlOg0KPg0KPg0KPj4gT24g
TWF5IDcsIDIwMjEsIGF0IDI6MTAgQU0sIEdlb3JnZSBIdW5nICiseKm+t3EpIDxHZW9yZ2UuSHVu
Z0BxdWFudGF0dy5jb208bWFpbHRvOkdlb3JnZS5IdW5nQHF1YW50YXR3LmNvbT4+IHdyb3RlOg0K
Pj4NCj4+IEhpIEFuZHJldywNCj4+DQo+PiBXZSBhbHJlYWR5IGZpeCB0aGUgcGF0Y2ggZXJyb3Ig
Zm9yIHBob3NwaG9yLWh3bW9uLCBjb3VsZCB5b3UgaGVscCBwcm9jZWVkIHRvIGpvaW4gdGhlIHF1
YW50YS9nYnMgdG8gQ0kgYnVpbGQgPw0KPg0KPiBIZXkgR2VvcmdlLCBJoaZ2ZSBhZGRlZCBpdCB0
byBvdXIgZGFpbHkgYnVpbGQsIGl0oaZzIHN0aWxsIG5vdCBwYXNzaW5nIGZvciBnYnMgdGhvdWdo
LiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgaHR0cHM6Ly9qZW5raW5zLm9wZW5ibWMub3JnL2pvYi9s
YXRlc3QtbWFzdGVyLzIzMy9sYWJlbD1kb2NrZXItYnVpbGRlcix0YXJnZXQ9Z2JzLzxodHRwczov
L2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZqZW5raW5zLm9wZW5ibWMub3JnJTJGam9iJTJGbGF0ZXN0LW1hc3RlciUyRjIzMyUyRmxhYmVs
JTNEZG9ja2VyLWJ1aWxkZXIlMkN0YXJnZXQlM0RnYnMlMkYmZGF0YT0wNCU3QzAxJTdDR2Vvcmdl
Lkh1bmclNDBxdWFudGF0dy5jb20lN0NmMTRiZjY4YTZlZGE0M2VjZDljYjA4ZDkxM2QzNDA5NSU3
QzE3OWIwMzI3MDdmYzQ5NzNhYzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc1NjI2MjAzMzM2
NDU0OTklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZzZGF0YT0lMkIx
QWlYY3k2SUtxVUg5cSUyRlVzTHp6aUxxS3pjNmtaMFR3SGljSSUyRnpNaHRBJTNEJnJlc2VydmVk
PTA+DQo+DQo+IE9uY2UgSSBzZWUgdGhhdCBkYWlseSBqb2IgcGFzcyBJoaZsbCBhZGQgaXQgdG8g
b3VyIG9mZmljaWFsIENJIGpvYi4NCj4NCj4+DQo+PiBUaGFua3MgYSBsb3QuDQo+Pg0KPj4gQmVz
dCBSZWdhcmRzDQo+PiBHZW9yZ2UgSHVuZw0KPj4NCj4+DQo+PiBIaSBBbmRyZXcsDQo+Pg0KPj4g
SXQgbG9va3MgbGlrZSBpdCdzIGR1ZSB0byBteSBwYXRjaCB0byBwaG9zcGhvci1od21vbiAod2hp
Y2gsIHRoZSByZXBvIGlzIGdvaW5nIHRocm91Z2ggc29tZSBvdmVyaGF1bCBhbmQgaXMgY2F1c2lu
ZyBjb25mbGljdHMgd2l0aCkuIFRoZSBwYXRjaCBpbiBxdWVzdGlvbiBpcyBpbiB0aGUgcHJvY2Vz
cyBvZiBnZXR0aW5nIHVwc3RyZWFtZWQgYW5kIHRoZSByZXBvIGlzIHNldHRsaW5nIGRvd24sIHNv
IEknbGwgcGluZyB5b3Ugb24gRGlzY29yZCBvbmNlIGl0IGxvb2tzIHJlYWR5IHRvIGJlIHRyaWVk
IGFnYWluIChob3BlZnVsbHkgYnkgZW5kIG9mIHRoZSB3ZWVrKS4NCj4+DQo+PiBUaGFua3MsDQo+
PiBCcmFuZG9uDQo+Pg0KPj4gT24gVGh1LCBNYXkgNiwgMjAyMSBhdCA2OjM4IEFNIEFuZHJldyBH
ZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPG1haWx0bzpnZWlzc29uYXRvckBnbWFpbC5j
b20+PiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+IE9uIE1heSA1LCAyMDIxLCBhdCAyOjM3IFBNLCBC
cmFuZG9uIEtpbSA8YnJhbmRvbmtpbUBnb29nbGUuY29tPG1haWx0bzpicmFuZG9ua2ltQGdvb2ds
ZS5jb20+PiB3cm90ZToNCj4+DQo+PiBIaSBBbmRyZXcsDQo+Pg0KPj4gYGdic2AgbWFjaGluZSB3
aWxsIHByb3ZpZGUgbWV0YS1nb29nbGUgY292ZXJhZ2UsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IGlm
IGBnYnNgIGNvdWxkIGJlIGFkZGVkIGluIGFkZGl0aW9uIHRvIGBnc2pgIGluc3RlYWQgb2YgYXMg
YSByZXBsYWNlbWVudC4NCj4+DQo+PiBJcyB0aGVyZSBhIHNob3J0YWdlIG9mIE9wZW5CTUMgQ0kg
bm9kZXMgYnkgYW55IGNoYW5jZT8gR29vZ2xlIGhhcyBiZWVuIHByb3ZpZGluZyAyIG9mIHRoZSBP
cGVuQk1DIENJIG5vZGVzLCBzbyBpdCB3b3VsZCBiZSBncmVhdCBpZiBhZGRpbmcgYGdic2AgY291
bGQgY291bnQgdG93YXJkcyBvbmUgb2YgdGhvc2UgQ0kgbm9kZXMuDQo+Pg0KPj4gWWVwLCBnb29n
bGUgZG9uYXRlcyB0d28gc2VydmVycyBzbyBzb3VuZHMgZ29vZC4gSSBhZGRlZCBpdCB0byBvdXIg
ZGFpbHkgYnVpbGQgb2YgbWFzdGVyIGFuZCBpdCBsb29rcyBsaWtlIGl0IGhpdCBhIGJ1aWxkIGlz
c3VlLiBXZSBjYW4gY29vcmRpbmF0ZSBpbiBkaXNjb3JkIGlmIHlvdSBsaWtlIGJ1dCBvbmNlIHdl
IGdldCB0aGlzIGZpZ3VyZWQgb3V0LCBJoaZsbCBhZGQgaXQgdG8gdGhlIG1haW4gb3BlbmJtYy9v
cGVuYm1jIENJIGpvYi4NCj4+DQo+PiBodHRwczovL2plbmtpbnMub3BlbmJtYy5vcmcvam9iL2xh
dGVzdC1tYXN0ZXIvMjMxL2xhYmVsPWRvY2tlci1idWlsZGVyLHRhcmdldD1nYnMvY29uc29sZTxo
dHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZqZW5raW5zLm9wZW5ibWMub3JnJTJGam9iJTJGbGF0ZXN0LW1hc3RlciUyRjIzMSUy
RmxhYmVsJTNEZG9ja2VyLWJ1aWxkZXIlMkN0YXJnZXQlM0RnYnMlMkZjb25zb2xlJmRhdGE9MDQl
N0MwMSU3Q0dlb3JnZS5IdW5nJTQwcXVhbnRhdHcuY29tJTdDZjE0YmY2OGE2ZWRhNDNlY2Q5Y2Iw
OGQ5MTNkMzQwOTUlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdD
NjM3NTYyNjIwMzMzNjU1NDkyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEw
MDAmc2RhdGE9eGdGMVlPSDdaU1BFVjZrTDkzd3F3MERnbzBON283TmdnZ3c5JTJGYTB6eEd3JTNE
JnJlc2VydmVkPTA+DQo+Pg0KPj4NCj4+DQo+PiBUaGFuayB5b3UsDQo+PiBCcmFuZG9uDQo+Pg0K
Pj4gT24gV2VkLCBNYXkgNSwgMjAyMSBhdCAxMDo1NCBBTSBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1
cmVAZ29vZ2xlLmNvbTxtYWlsdG86dmVudHVyZUBnb29nbGUuY29tPj4gd3JvdGU6DQo+PiBPbiBX
ZWQsIE1heSA1LCAyMDIxIGF0IDY6MjUgQU0gQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBn
bWFpbC5jb208bWFpbHRvOmdlaXNzb25hdG9yQGdtYWlsLmNvbT4+IHdyb3RlOg0KPj4gPg0KPj4g
Pg0KPj4gPg0KPj4gPiA+IE9uIE1heSA1LCAyMDIxLCBhdCAxOjI2IEFNLCBHZW9yZ2UgSHVuZyAo
rHipvrdxKSA8R2VvcmdlLkh1bmdAcXVhbnRhdHcuY29tPG1haWx0bzpHZW9yZ2UuSHVuZ0BxdWFu
dGF0dy5jb20+PiB3cm90ZToNCj4+ID4gPg0KPj4gPiA+IEhpIEFuZHJldyBHZWlzc2xlciwNCj4+
ID4gPg0KPj4gPiA+IFdlIGhhdmUgcG9ydGVkIG1hbnkgT3BlbkJNQyBmZWF0dXJlcyB0byBxdWFu
dGEvZ2JzIG1hY2hpbmUgKE51dm90b24gQk1DIHBsYXRmb3JtKSBhbmQgaG9wZSBpdCBjb3VsZCBi
ZSBhZGRlZCB0byBDSSBidWlsZCwgY291bGQgeW91IGhlbHAgYWRkIHF1YW50YS9nYnMgbWFjaGlu
ZSB0byBDSSBidWlsZCB2ZXJpZmljYXRpb24gPyAoSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMs
IGlmIHRoZXJlJ3MgYW55dGhpbmcgd2UgbmVlZCB0byBkbyBmaXJzdCwgcGxlYXNlIGxldCB1cyBr
bm93KQ0KPj4gPg0KPj4gPiBIZXkgR2VvcmdlLA0KPj4gPg0KPj4gPiBHZXR0aW5nIGEgbmV3IHN5
c3RlbSBpbnRvIENJIGRvZXNuoaZ0IGhhdmUgdGhlIG1vc3QgZGVmaW5lZCBwcm9jZXNzIGJ1dA0K
Pj4gPiBJIHRoaW5rIGluIGdlbmVyYWwgaXQgaGFzIHRvIGZhbGwgdW5kZXIgb25lIG9mIHRoZXNl
IGR1ZSB0byBvdXIgY29uc3RyYWludHMNCj4+ID4gaW4gY29tcHV0ZSBwb3dlciBmb3IgQ0k6DQo+
PiA+DQo+PiA+IDEpIFByb3Bvc2UgYW4gZXhpc3Rpbmcgc3lzdGVtIGluIENJIHRvIHJlcGxhY2Ug
KGFuZCB0aGUgYmVuZWZpdHMgb2YgdGhhdCkNCj4+ID4gMikgRG9uYXRlIGEgamVua2lucyBjb21w
dXRlIG5vZGUgdG8gb3BlbmJtYyBDSQ0KPj4gPiAzKSBDb252aW5jZSB0aGUgY29tbXVuaXR5IHRo
YXQgeW91ciBzeXN0ZW0gcHJvdmlkZXMgYWRkaXRpb25hbCBtZXRhLSoNCj4+ID4gICAgIGxheWVy
IGNvdmVyYWdlIChvciBzb21lIG90aGVyIGNyaXRpY2FsIGJlbmVmaXQpIHRoYXQgd291bGQgYmUg
d29ydGgNCj4+ID4gICAgIHRoZSBhZGRpdGlvbmFsIGhpdCB0byB0aGUgZXhpc3RpbmcgQ0kgaW5m
cmFzdHJ1Y3R1cmUuDQo+PiA+DQo+PiA+IFdlIGN1cnJlbnRseSBoYXZlIGEgoadnc2qhqCBzeXN0
ZW0gaW4gQ0kuIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gcmVwbGFjZQ0KPj4gPiBpdCB3aXRoIHRo
aXMgbmV3IKGnZ2JzoaggbWFjaGluZT8NCj4+DQo+PiBKdW1waW5nIG9uIHRoaXMgdGhyZWFkIHRv
IHNheSB0aGF0IEknbSBob3BpbmcgdG8gaGF2ZSBxdWFudGEtZ2JzDQo+PiBzdXBwb3J0IGluIHVw
c3RyZWFtIHFlbXUgc2hvcnRseSAtLS0gc28gd2UgY291bGQgYWxzbyBlbmFibGUgdGhpcyBhcyBh
DQo+PiBRZW11IENJIG1hY2hpbmUuDQo+Pg0KPj4gPg0KPj4gPg0KPj4gPiA+DQo+PiA+ID4NCj4+
ID4gPiBUaGFua3MgYSBsb3QuDQo+PiA+ID4NCj4+ID4gPiBCZXN0IFJlZ2FyZHMNCj4+ID4gPiBH
ZW9yZ2UgSHVuZw0KPj4gPiA+DQo+PiA+DQo+DQo=

--_000_HK0PR04MB23395928C8737F4177DEFA238F519HK0PR04MB2339apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@MS PGothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW">Hi Andrew,<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW">Sorry to make your inconvenience, we already fix a=
ll CI build errors and also run CI build locally to
 make sure it can work fine.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW">Could you help to merge gbs to CI build ?<o:p></o:=
p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW">Thanks a lot.<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><font size=3D"3" face=
=3D"Calibri"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-family:&qu=
ot;Calibri&quot;,sans-serif">Best Regards<br>
George Hung<o:p></o:p></span></font></p>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"Calibri"><span lang=3D"EN-U=
S" style=3D"font-size:12.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso=
-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></font></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt">Apologies, one of my old patch that Quanta=
 seemed to have been using was finally merged (<a href=3D"https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.openbmc-project.x=
yz%2Fc%2Fopenbmc%2Fphosphor-hwmon%2F%2B%2F24337%2F&amp;data=3D04%7C01%7CGeo=
rge.Hung%40quantatw.com%7Cf14bf68a6eda43ecd9cb08d913d34095%7C179b032707fc49=
73ac738de7313561b2%7C1%7C0%7C637562620333625510%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DH3SuUrMps%2Fbk9ldjC9sLjZ5jUyWPKdcpdqZY1jDg0eY%3D&amp;reserved=3D0">=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337/</a>)
 and it seems like that caused the patch failure you see here.<o:p></o:p></=
span></font></p>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt">Here is the fix that should fix the&nbsp;p=
roblem:&nbsp;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgerrit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fopenbmc%2F%2B%2=
F43046&amp;data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7Cf14bf68a6eda43ecd9=
cb08d913d34095%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637562620333635=
505%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D6Hqn5G5fpMZNDs1zZv16kYp%2BwnK8sBkKZ3=
nJCJhhcXs%3D&amp;reserved=3D0">https://gerrit.openbmc-project.xyz/c/openbmc=
/openbmc/+/43046</a><o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt">Thanks,<o:p></o:p></span></font></p>
</div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt">Brandon<o:p></o:p></span></font></p>
</div>
</div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></span></font></p>
<div>
<div>
<p class=3D"MsoNormal"><font size=3D"3" face=3D"MS PGothic"><span lang=3D"E=
N-US" style=3D"font-size:12.0pt">On Mon, May 10, 2021 at 8:55 AM Andrew Gei=
ssler &lt;<a href=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a=
>&gt; wrote:<o:p></o:p></span></font></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><font size=3D"3" face=
=3D"MS PGothic"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><br>
<br>
&gt; On May 7, 2021, at 7:19 PM, Brandon Kim &lt;<a href=3D"mailto:brandonk=
im@google.com" target=3D"_blank">brandonkim@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Andrew,<br>
&gt; <br>
&gt; Do you mind kicking off the docker build again for gbs? It looks like =
sslh bump may have&nbsp; been needed from meta-google
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgerrit.openbmc-project.xyz%2Fc%2Fopenbmc%2Fopenbmc%2F%2B%2F43015&amp;da=
ta=3D04%7C01%7CGeorge.Hung%40quantatw.com%7Cf14bf68a6eda43ecd9cb08d913d3409=
5%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637562620333635505%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C1000&amp;sdata=3DNjf%2BpXtlrmEm%2BkTnUgTbP7XVebxL2fGD%2FWiGHPyEnis=
%3D&amp;reserved=3D0" target=3D"_blank">
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015</a><br>
<br>
The job runs daily (when new code is available), looks like we=A1=A6re on t=
o something new now?<br>
<br>
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fjenkins.openbmc.org%2Fjob%2Flatest-master%2Flabel%3Ddocker-builder%2Cta=
rget%3Dgbs%2F234%2Fconsole&amp;data=3D04%7C01%7CGeorge.Hung%40quantatw.com%=
7Cf14bf68a6eda43ecd9cb08d913d34095%7C179b032707fc4973ac738de7313561b2%7C1%7=
C0%7C637562620333645499%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5ihpCM6tZ6J4Yc%2=
B28gBF%2Fzu6BrWXcukzT45eUeeWbYM%3D&amp;reserved=3D0" target=3D"_blank">http=
s://jenkins.openbmc.org/job/latest-master/label=3Ddocker-builder,target=3Dg=
bs/234/console</a><br>
<br>
3 out of 5 hunks FAILED -- rejects in file sensor.hpp<br>
Patch 0001-sensor-Implement-sensor-ASYNC_READ_TIMEOUT.patch does not apply =
(enforce with -f)<br>
<br>
stderr: <br>
ERROR: Logfile of failure stored in: /data0/jenkins/workspace/latest-master=
/label/docker-builder/target/gbs/build/work/armv7a-openbmc-linux-gnueabi/ph=
osphor-hwmon/1.0+gitAUTOINC+6d50c3e9e1-r1/temp/log.do_patch.19118<br>
<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Brandon<br>
&gt; <br>
&gt; On Fri, May 7, 2021 at 11:26 AM Andrew Geissler &lt;<a href=3D"mailto:=
geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; <br>
&gt;&gt; On May 7, 2021, at 2:10 AM, George Hung (</span><span lang=3D"JA">=
=ACx=A9=BE=B7q</span><span lang=3D"EN-US">) &lt;<a href=3D"mailto:George.Hu=
ng@quantatw.com" target=3D"_blank">George.Hung@quantatw.com</a>&gt; wrote:<=
br>
&gt;&gt; <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; We already fix the patch error for phosphor-hwmon, could you help =
proceed to join the quanta/gbs to CI build ?<br>
&gt; <br>
&gt; Hey George, I=A1=A6ve added it to our daily build, it=A1=A6s still not=
 passing for gbs though. Please take a look at
<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fjenkins.openbmc.org%2Fjob%2Flatest-master%2F233%2Flabel%3Ddocker-builde=
r%2Ctarget%3Dgbs%2F&amp;data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7Cf14bf=
68a6eda43ecd9cb08d913d34095%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C63=
7562620333645499%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2B1AiXcy6IKqUH9q%2FUsL=
zziLqKzc6kZ0TwHicI%2FzMhtA%3D&amp;reserved=3D0" target=3D"_blank">
https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,ta=
rget=3Dgbs/</a>
<br>
&gt; <br>
&gt; Once I see that daily job pass I=A1=A6ll add it to our official CI job=
.<br>
&gt; <br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Thanks a lot.<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Best Regards<br>
&gt;&gt; George Hung<br>
&gt;&gt; <br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; It looks like it's due to my patch to phosphor-hwmon (which, the r=
epo is going through some overhaul and is causing conflicts with). The patc=
h in question is in the process of getting upstreamed and the repo is settl=
ing down, so I'll ping you on Discord
 once it looks ready to be tried again (hopefully by end of the week).<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Thanks,<br>
&gt;&gt; Brandon<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; On Thu, May 6, 2021 at 6:38 AM Andrew Geissler &lt;<a href=3D"mail=
to:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; On May 5, 2021, at 2:37 PM, Brandon Kim &lt;<a href=3D"mailto:bran=
donkim@google.com" target=3D"_blank">brandonkim@google.com</a>&gt; wrote:<b=
r>
&gt;&gt;&nbsp; <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; `gbs` machine will provide meta-google coverage, so it would be gr=
eat if `gbs` could be added in addition to `gsj` instead of as a replacemen=
t.<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Is there a shortage of OpenBMC CI nodes by any chance? Google has =
been providing 2 of the OpenBMC CI nodes, so it would be great if adding `g=
bs` could count towards one of those CI nodes.<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Yep, google donates two servers so sounds good. I added it to our =
daily build of master and it looks like it hit a build issue. We can coordi=
nate in discord if you like but once we get this figured out, I=A1=A6ll add=
 it to the main openbmc/openbmc CI job.<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fjenkins.openbmc.org%2Fjob%2Flatest-master%2F231%2Flabel%3Ddock=
er-builder%2Ctarget%3Dgbs%2Fconsole&amp;data=3D04%7C01%7CGeorge.Hung%40quan=
tatw.com%7Cf14bf68a6eda43ecd9cb08d913d34095%7C179b032707fc4973ac738de731356=
1b2%7C1%7C0%7C637562620333655492%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DxgF1YOH=
7ZSPEV6kL93wqw0Dgo0N7o7Ngggw9%2Fa0zxGw%3D&amp;reserved=3D0" target=3D"_blan=
k">
https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,ta=
rget=3Dgbs/console</a><br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt;&nbsp; <br>
&gt;&gt; Thank you,<br>
&gt;&gt; Brandon<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; On Wed, May 5, 2021 at 10:54 AM Patrick Venture &lt;<a href=3D"mai=
lto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:=
<br>
&gt;&gt; On Wed, May 5, 2021 at 6:25 AM Andrew Geissler &lt;<a href=3D"mail=
to:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; On May 5, 2021, at 1:26 AM, George Hung (</span><span la=
ng=3D"JA">=ACx=A9=BE=B7q</span><span lang=3D"EN-US">) &lt;<a href=3D"mailto=
:George.Hung@quantatw.com" target=3D"_blank">George.Hung@quantatw.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hi Andrew Geissler,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; We have ported many OpenBMC features to quanta/gbs machi=
ne (Nuvoton BMC platform) and hope it could be added to CI build, could you=
 help add quanta/gbs machine to CI build verification ? (I'm not familiar w=
ith this, if there's anything we need to do
 first, please let us know)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hey George,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Getting a new system into CI doesn=A1=A6t have the most defin=
ed process but<br>
&gt;&gt; &gt; I think in general it has to fall under one of these due to o=
ur constraints<br>
&gt;&gt; &gt; in compute power for CI:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1) Propose an existing system in CI to replace (and the benef=
its of that)<br>
&gt;&gt; &gt; 2) Donate a jenkins compute node to openbmc CI<br>
&gt;&gt; &gt; 3) Convince the community that your system provides additiona=
l meta-*<br>
&gt;&gt; &gt;&nbsp; &nbsp; &nbsp;layer coverage (or some other critical ben=
efit) that would be worth<br>
&gt;&gt; &gt;&nbsp; &nbsp; &nbsp;the additional hit to the existing CI infr=
astructure.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We currently have a =A1=A7gsj=A1=A8 system in CI. Would it ma=
ke sense to replace<br>
&gt;&gt; &gt; it with this new =A1=A7gbs=A1=A8 machine?<br>
&gt;&gt; <br>
&gt;&gt; Jumping on this thread to say that I'm hoping to have quanta-gbs<b=
r>
&gt;&gt; support in upstream qemu shortly --- so we could also enable this =
as a<br>
&gt;&gt; Qemu CI machine.<br>
&gt;&gt; <br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Thanks a lot.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Best Regards<br>
&gt;&gt; &gt; &gt; George Hung<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt; <o:p></o:p></span></font></p>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_HK0PR04MB23395928C8737F4177DEFA238F519HK0PR04MB2339apcp_--
