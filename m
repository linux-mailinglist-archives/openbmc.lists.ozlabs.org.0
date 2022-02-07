Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7464AB576
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 08:03:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscXx6Bsnz3bPT
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 18:02:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dakUvohX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::70a;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=dakUvohX; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JscXR2YC2z2ybK
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 18:02:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq4F3Wcetv4ETTQCBhjNYSClbyweMMZ0my4l2ShWBBjlaw8p0MaV7G3eJvhDL6VrdnDmRb6vJcQdMyTfeZLth9cH10jaRuEsu3W1UwWQEVuJHH4ko+piNfnmDbCRsIDsZvPFqgIM8DiIfMEH+2MjEHRxF4uYZFzhm6jCCmPJI2mC46G2wG0gYZ3RLLHbAhQjWC9d/SI6YLZQI+vjipYRqwiFRRUHEgx3Q+u9w4pYvnobXQBI6KjkDtFYKOHnKba16sQvOeEkew5ZAiMQWlqQls4pms/X6WEbxiAlbj0dv/p9n2vLXJZYe86eojIqtXTYEZkhWAv8G8eorTULtC8XWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex0uSjmRSv/3vaOWU4avhclLF8sJGV7qY9PIBfkJuMU=;
 b=aDlK6smVZxKVZA1ydT21e7iXmcaDMOWiHhN0vpqbJbOx6s7xBvZhjL+scPL0wm5SgjqEWsVBXuPX8IAa4gq8AU3brh1ITTwY5xwtsXNU/G6ibVJR4V5ByxIs2LVsZsMLwm/bkV/iXqEZuhcnXx5xEszP4poA6iH7sVzD9XoiIu9KfgQ4CmdS/EWYJSwr67eWURcX04EhSxFeZnL1nfU7emil/M+opWaCk2PwIOgzFtfsf2rs33EUkZiVEeu4I2/LXrSyg3koDTmK/de7YhLAjDK4djcc4D6x9z9lhUzhOL688xL0h+UQeapeDw2jzFaRiQmfCXC/ujiXKpBXhC7zRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex0uSjmRSv/3vaOWU4avhclLF8sJGV7qY9PIBfkJuMU=;
 b=dakUvohXSx3xNk4D9OtjTH1t9tuJ/9EI5VMxcFirZauVzqfvt8uBxrXL2i+HeIN1hQNyvc4Py2oZbrad7K46ztABdeODNfgivr+dE34vwZpgqvaV5p3qcc3vnEwoti9E/FwcGbN1qkoMdMGawbZaVArjK49ud4g+VEPqNq/ZNDnGb65/xwSDVQ31iLTwkhvPwdg5aj0Wn9OLFFN24cWAv63AydoJEg4Ld4A2Isf4hQxyJj64n9kz00UbRUzzv9l6jzjtOZzFG/44SoB9+0uzb4ngaqD9gi8ubbueqjYbwP43Kv9G0qhqKixH1cdT8D63ZUzpOBAnhUVL7kKNerNWSA==
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by SG2PR06MB3080.apcprd06.prod.outlook.com (2603:1096:4:6d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 07:02:04 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::d0f0:11b4:e1f4:8310]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::d0f0:11b4:e1f4:8310%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:02:04 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, ChiaWei Wang
 <chiawei_wang@aspeedtech.com>
Subject: RE: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Topic: Openbmc u-boot trees (was Re: u-boot:rsa adds rsa3072 algorithm)
Thread-Index: AQHYG+hmIuMp3Rt9gEubL4/iiSSGWKyHqODQ
Date: Mon, 7 Feb 2022 07:02:04 +0000
Message-ID: <TYZPR06MB4015B2ADBBB832D151F4B433FC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
References: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
 <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
In-Reply-To: <CACPK8XfwLCxNVLfVa=FYw0TVXPE_Kj8+p7=6Svw_O10x22Jf1g@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4a1c786-895a-49e2-5aa7-08d9ea07bf52
x-ms-traffictypediagnostic: SG2PR06MB3080:EE_
x-microsoft-antispam-prvs: <SG2PR06MB30800300F0762B965D088E87FC2C9@SG2PR06MB3080.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9y3FulBx4qFcH0uCZ8XL66RDuZbxjWSOqGoUWzEZmbPNXOfIPN6KyFmHwWMOCr+SeQVxcQ2yGPyEGtJr/uD5fv4M0nh6Szk56A7ERO0Ip4EOmdCoQ0LMcN3nbXfAmVYDvDyy9bdvyuCs9pNpN4j2BDWw2kFDcxIUEOCfLzWikXCLQasi+2jRTlks8RXYaZdEfZo4UB09HeNxEhH+3KRTBONq6iaVOj36kQglr7dJvdw8c3YgpFemi4hn97W9RPX9nSceiSiy+qB2o+zYDTl+hA6+6WOWK0cHzBDa4/lHVtoLtxQS+tqGGcpuDBcsk5Fa90madf1qBiH0brj0FwsNMoQdRRfvmyOpeb1mV0kVBXD+XvbtxBksh0KoWzvbWwX3vQL4GBUvBHeP91tDVcnnr55ZhAfNgd/0VtIOJCQ8WVTUQlExKEp4h0/7Lu4CcAzqS9wJbMLM7dtW4B+rCY+dX1d4Kpv4pEU488cyKuRSDLD2FahzcO8w/hg38K+G8c3/5ZFUHfhkyc0M8KU9Ahm1kvgXJ2Ft9YKmfKBLKj0EGXIzDWBf/xMJOqnxPehA7kgq2FuZINh/255aLCI715N87VO0C9hTry/hkZVN90HF+Zb9d9ASjYrmQUqnXUxZ+8BTj1MbASFKkc+5XxVs7SM21FRFIQSIDBVeZ0Mxgtnxib5Ex3Qco5a045BOxqe86H+a9yiD7TCK2hPbkIL0OWq3QTSe3oOSuwUHE8quT5bnBtA6xl2HJSxIZb6iZIA7vHUkLik4pFDZ3nA5OyrJx0SlVKlWEUuUv5WS/xffO9g1TS0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(366004)(136003)(396003)(376002)(83380400001)(86362001)(122000001)(38100700002)(110136005)(6636002)(316002)(54906003)(38070700005)(52536014)(7696005)(55016003)(9686003)(6506007)(64756008)(71200400001)(26005)(186003)(508600001)(53546011)(5660300002)(966005)(8936002)(2906002)(76116006)(66946007)(66476007)(66446008)(66556008)(33656002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3htaFdXdzgrZ1llaEhVQXd2UmQzZ3RJVUl0TXB4OW1sVjI5eFRXdDhaUTR6?=
 =?utf-8?B?T2RaenZZeklJZVlERDZ0dUh6VFF0L1NISmpCdDk1d1N2Kzl0ZHZnblNLdEpX?=
 =?utf-8?B?MjhlUWtDWTVLVzVmaXFNbHpJWERYZXFFVmYrWmNiSjVaUjZHNnVOeVVzekN4?=
 =?utf-8?B?MmhRZ04rbjNyNHpKTnNPZjRxenpKdkpaRUFGZnhaQndyeHZyQllDdzh0VGZC?=
 =?utf-8?B?Uzk4cjgyeWZxU3BnbTFadFZWdE81bWpveExDLytpU21YWEdvSERsa1lKc05M?=
 =?utf-8?B?Ty8xdkNDSW1vblQvUGZ0V21PLzEzM0dFMkpwczZMVzBWak05b3ZPUHRCQTNY?=
 =?utf-8?B?ZVpRNU9XLzh4eUlickdSdXlhYk5lZEs1VjUzbENHVGJzeFQrUnFTVjVDU1JR?=
 =?utf-8?B?QkE2UnVxajlHYVY5dWVaL1VzcHVza082OWg4QUFVZWt1b3kyZUhYVTZXYVNT?=
 =?utf-8?B?UDViK0h0aW1uTUlnZjdXNHJYSC9PVUd4NU12Um14NG9OWWxORzZWY3RseU4r?=
 =?utf-8?B?RkJqMTMrT0RGTmw4TGhLcHRjWU8rQVVRYnlNVzU4MFZOTEtWTUdsdmFreGcw?=
 =?utf-8?B?bkxxNUNTdXFUc1NSNGJMU04xRW03THh4VDA5aTBsdU10YzNkKzJqSTFhbVZO?=
 =?utf-8?B?bXdHMHlYdmJ3bHgxckZlYjJBZ0MrVytIU3lFdmRJcmhUMWthU3UrYjZ6NlYw?=
 =?utf-8?B?WEc0dzJ2Tllod2dHZWhtT0tkQmVIanpkN253eExHbW1TaVZzZTFlMVlKRUJR?=
 =?utf-8?B?Q00rWW1yZExEUTFaZDUzc2J3RC9BakJsWGh1Z3NIdk80eVR4T29oTEVOQStn?=
 =?utf-8?B?SzY0MVJ4RmVEeVBRUFFSdURQUTZ2dS8yeEQ4SkNKQmMxam9XUnF3TFRSMDR6?=
 =?utf-8?B?RldJd3lXU0R1Z2I0cGNSKzJlS2habVp4TWYzMDJSV00zVjYyQm1yVDNac1NL?=
 =?utf-8?B?TTdoWVR3RVpIUTJOSmdIWkdvU29FSGcvVkNHVlliZFo4UkNrb1RURjVEdXEv?=
 =?utf-8?B?Q0laL3pOS2pVTzFrRm1MT1dGb2xTbnU4Rm1QbnFNYUNSek52N01mYnFFKzhV?=
 =?utf-8?B?V1hrV3VNMVlaK0R1ZmhzYUkxRTI5dktyOXRwTmwvRVZUNFh4KzRkejNGTGJh?=
 =?utf-8?B?Rjk3c28ya0VjUy9LeU9nQ2h0NmQrd3ZDTkY4b1BBS3IwUVA1dHNCem42aEg3?=
 =?utf-8?B?SXBUM202b21yeCtUVHlDU3dyOXlOMUFiNlFGV0dtbUtmajgzMHhrVUpUWlpj?=
 =?utf-8?B?ZEk3UGhlSDV0VUpRVVNpelVUVDgwZDJoRXZseFY5NGJtVHN6d3Y1Znp3cTlI?=
 =?utf-8?B?WVZNYm9lV1dicFQvS01pVDMyQy9CeUxzdFZkNDFwL3pzUkIxazBPT3V6U1ha?=
 =?utf-8?B?MGQ0dWR4TGI2YU9FM1BpbTg1cUtkcWhvYXB3WUJGVUczNXdIUkJwMXdjeFdB?=
 =?utf-8?B?L2JYL2RYWFZ1VitIM0d3MVVnRFpkcTdqa3VOOGF0NmRabTBWM1B1KzdzR0hS?=
 =?utf-8?B?ZUNLTXBtVmlqNGQ1UFpick5reE5taWdJU3JWRlV6ZTRJMko0UE50VzJ0SUtT?=
 =?utf-8?B?VmFraDYreG03TEJ1SVdiUkgrNk8wU0ZHNUpRWS9PSVJsR0JEeDU2QVh6NVBF?=
 =?utf-8?B?TURkVzVPUmdNcSt6VkJZajdxaXhkSUpGMDdZNDkvNWdlcFMrTHZ1ZTBPaTVy?=
 =?utf-8?B?L3dtbjNFMFJlWk1waThoTjh1dU8zZ3ArQjVjMk1rL3NyYVVBM0t5NjlteWxo?=
 =?utf-8?B?TTlzbERQSFVkTHZYMk9RUzhKQXI5Tnp4QjZzamYzUS9nMFhVVEJrNzVLSlhu?=
 =?utf-8?B?M2luN0JoY3gyVUhkMkhYc3B4a2tCN3NrNDlkOUx4b0RBYVE0RGxvYndKazRq?=
 =?utf-8?B?Nk1KV2dCejFYd1hkYWRmZkFvbkp2aGtTMDJBODZTY0pBdU44SUxZbnhkVm5l?=
 =?utf-8?B?S1haWitwdmpLcVhmdXM4bFNyRkJZK25UZ0FWblA3cXBiU1lLRTc2WWN3OGFo?=
 =?utf-8?B?Z3BzVkZtMm0wMFpnQVorTGRBZkNhZkU5dXE0UUpjMEI3K2FDNkh3eGltSTdQ?=
 =?utf-8?B?VTFBQlNjdzNiQnRLTW4yaldKSVRMQkJiS2g0ZEdSemJmNkZVT2NVc3RDUExv?=
 =?utf-8?B?N0o1cWJEbVBMZDlqLzNWajh1QXlvV1ZjY0V6bHd0NFFDNmxsNGZmUjdxd0ZJ?=
 =?utf-8?B?eU11Z01TYkRwVU91aFpwSFN6dEZzRGpPVFBIcTJrWEI1ZW91ZHBvQ2NueGlr?=
 =?utf-8?B?VlVDNkFYaVZtNmNOYWZFeTc3N3JnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a1c786-895a-49e2-5aa7-08d9ea07bf52
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 07:02:04.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuYPrzoQvBEcTrgUMEToG0ZLRZqy76DnskwcXibvOsy6JcHxPEIbW+4JU32PQlLZdv6uDXIqJSpd567L2pR4izeIsLzvVAj+paultNV9QIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3080
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

KyBSeWFuLCBDaGlhV2VpIGFuZCBEeWxhbg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVu
dGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCkRJU0NMQUlNRVI6DQpUaGlzIG1l
c3NhZ2UgKGFuZCBhbnkgYXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdl
ZCBhbmQvb3Igb3RoZXIgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNl
aXZlZCBpdCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFp
bCBhbmQgaW1tZWRpYXRlbHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3
aXRob3V0IGNvcHlpbmcgb3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+IA0KU2VudDogTW9uZGF5LCBGZWJydWFyeSA3LCAyMDIyIDI6MDMgUE0NClRvOiBKYW1p
biBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc7IFRyb3kgTGVlIDx0cm95X2xlZUBhc3BlZWR0ZWNoLmNvbT47IFN0ZXZlbiBMZWUgPHN0
ZXZlbl9sZWVAYXNwZWVkdGVjaC5jb20+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1
Pg0KU3ViamVjdDogT3BlbmJtYyB1LWJvb3QgdHJlZXMgKHdhcyBSZTogdS1ib290OnJzYSBhZGRz
IHJzYTMwNzIgYWxnb3JpdGhtKQ0KDQpIaSBKYW1pbiwNCg0KT24gTW9uLCA3IEZlYiAyMDIyIGF0
IDAyOjI2LCBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+DQo+
IEhpIEpvZWwgYW5kIE9wZW5CTUMgdGVhbSwNCj4NCj4NCj4NCj4gVGhpcyBwYXRjaCB3YXMgYXBw
bGllZCB0byB1LWJvb3QvbWFzdGVyLCANCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvdWJvb3QvcGF0Y2gvMjAyMjAxMTkwODIzMjMuNDU2Ny0yLQ0KPiBqYW1pbl9saW5AYXNw
ZWVkdGVjaC5jb20vDQo+DQo+IENvbW1pdCAgIDJhNGIwZDU4OTBkZWIwYzk3M2Y4ZGI3YmIwM2Fk
YWQ5NmFmZjEwNTANCj4NCj4gaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvY29tbWl0
LzJhNGIwZDU4OTBkZWIwYzk3M2Y4ZGI3YmIwM2FkYQ0KPiBkOTZhZmYxMDUwDQo+DQo+IENvdWxk
IHlvdSBwbGVhc2UgaGVscCB0byBiYWNrcG9ydCB0aGUgcGF0Y2ggdG8gdGhlIG9wZW5ibWMvdS1i
b290IHRyZWU/DQoNClN1cmUsIEkgY2FuIGRvIHRoYXQuDQoNCkknZCBsaWtlIHRvIHN0YXJ0IGEg
ZGlzY3Vzc2lvbiBhYm91dCB0aGUgdS1ib290IHRyZWVzIGFuZCBob3cgd2UgbWFpbnRhaW4gdGhl
bS4gQ3VycmVudGx5IHdlIGhhdmU6DQoNCiAtIHVwc3RyZWFtOyBwYXJ0aWFsIDI2MDAgc3VwcG9y
dA0KIC0gYXNwZWVkLW1hc3Rlci12MjAxOS4wNCwgU0RLIHRyZWUgbWFpbnRhaW5lZCBieSBBU1BF
RUQNCiAtIHYyMDE5LjA0LWFzcGVlZC1vcGVuYm1jLCBvcGVuYm1jIG1haW50YWluZWQgYnkgSm9l
bC4gQmFzZWQgb24gU0RLIHRyZWUNCg0KSW4gdGhlIHBhc3QgSSB3YXMgcHV0dGluZyBjb2RlIGlu
IHRoZSBvcGVuYm1jIHRyZWUgc28gd2UgY291bGQgdXNlIGl0IGZvciBicmluZ3VwLCBhbmQgdHJ5
aW5nIHRvIHNlbmQgcHVsbCByZXF1ZXN0cyB0byB0aGUgU0RLIHRyZWUuDQoNCk5vdyB5b3UncmUg
c2VuZGluZyBwYXRjaGVzIHVwc3RyZWFtIChleGNlbGxlbnQhKSBhbmQgc2VuZGluZyBtZSByZXF1
ZXN0cyB0byBtZXJnZSBpbnRvIHRoZSBvcGVuYm1jIHRyZWUuDQoNCkkgd291bGQgbGlrZSB0byBz
ZWUgZmV3ZXIgdHJlZXMuDQoNCkluIHRoZSBzaG9ydCB0ZXJtLCBvbmUgb3B0aW9uIGlzIHdlIHB1
dCBhbGwgb2YgdGhlIG9wZW5ibWMgcGF0Y2hlcyBpbiB0aGUgU0RLLCBhbmQgY29udGludWUgdXNp
bmcgdGhhdCBmb3Igb3BlbmJtYy4gV291bGQgdGhpcyB3b3JrIGZvciBhc3BlZWQ/DQoNCkluIHRo
ZSBtZWRpdW0gdGVybSwgd2Ugc2hvdWxkIHN0YXJ0IHVzaW5nIHVwc3RyZWFtIHJlbGVhc2VzLiBU
aGVyZSBtYXkgc3RpbGwgYmUgc29tZSBkb3duc3RyZWFtIGNvZGUgKGFzIHdlIGhhdmUgZm9yIExp
bnV4IGluIG91ciBkZXYgYnJhbmNoZXMpLCBidXQgdGhpcyB3aWxsIGdvIHRvIHplcm8gb3ZlciB0
aW1lLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cy4NCg0KQ2hlZXJzLA0KDQpK
b2VsDQo=
