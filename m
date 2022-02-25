Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47D4C3CFE
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4c5M2rysz3bZR
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=i/9FK1+g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::72f;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=i/9FK1+g; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4c4r25Yqz3bPK
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:20:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKHvViGaMtm9DxAAM3RBjchJteuHYQwpJEsoWbWPCCUykwGTgjZtDj/AyrNUQW4CkH7WTG7LA+4QjihPu33+MXd0zKeodcyWzMmWgElyVjE/MA01mxDFouAhLel2SsvDWHyW9kp7SXjhI5qfLFhgI3yXItOfIcKbivAEwDXBixIKLf2I7PP3uYzJoDflcxt9Y0QzAH2teu/VLltbUXl3RLTn76JSsHnRwV4Dc6x0UR3vHO7On2NjJU8iMAppoNaGokc9Jldti1yP7Q9dac4BD3D6COdTQL4NWlNSaCVHNZL4C7dbiBr1ITqiitSAIhXRq2R0FgHOky7gNcMCNSXuCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYCXYw1tnmpIaoVKniSGYhIYcKNoMl3uMDgPTz3F38s=;
 b=jt4wK+0zFqO+5ghrY2n5wtCLFADixDlZu7biexolbP+0pVt+j7c0Ptt+Zm1B/0vk8b7TViEeLLo+Q3RgvmxkJmcSJxqJmkNLpr3uWfENmRFBGYtLnMr/4TsaLtD0V/X3pLp0RLUiv6JBt9AmZjzuesK0U/S860Gf8NreuHFNV4xw2fRUIDiC323TYuuN9roGYnGpqpXOsi897RyjnSdgANB3dqv7ZGDQTGKi2VdCvShy79x3yFLXaxKC9GVHfkqX5Z+btEFlP+3VoBu/ilsTSYnbldjA/QdxY/soRo+t0Bt1tRIRIRsooslfxE5QTnGDLPkeNsUnrysv1J35r9Sw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYCXYw1tnmpIaoVKniSGYhIYcKNoMl3uMDgPTz3F38s=;
 b=i/9FK1+gckFo7Srsta9mFzGtIT7CWIU2Xve0kr22m06notWKU52sYhvztYQbJRy6SnShyAw+Az7lDeQxrzxh/8Zu6CTUaE/FFveEJfYNsEchgWPArASBZ9fM6uGlAFKz/Rh7qZtIssOHaQffJywD8N2gqQMe6Q7ZGtbuUqkh3L4=
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by KL1PR0401MB5046.apcprd04.prod.outlook.com (2603:1096:820:91::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 04:19:52 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 04:19:51 +0000
From: =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.15 00/26] Add w25q01jvq and convert flash_info
 format
Thread-Topic: [PATCH linux dev-5.15 00/26] Add w25q01jvq and convert
 flash_info format
Thread-Index: AQHYKfFYHIjbHMkpOUKFmAdZ/HDGzqyjpO8AgAAFC4A=
Date: Fri, 25 Feb 2022 04:19:51 +0000
Message-ID: <291dfd1a-4519-b130-91d9-af4ea085ff9f@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
 <CACPK8XdFGD3wT2C+gnPaVcshnnOgjyq-32qudQWn4VtcHh3SoA@mail.gmail.com>
In-Reply-To: <CACPK8XdFGD3wT2C+gnPaVcshnnOgjyq-32qudQWn4VtcHh3SoA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22a71e18-ef02-44af-0cd9-08d9f81611ae
x-ms-traffictypediagnostic: KL1PR0401MB5046:EE_
x-microsoft-antispam-prvs: <KL1PR0401MB50467CA9C070182FE0B4710D8E3E9@KL1PR0401MB5046.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tt2HCHWitTB4CHOKMvFkJZmofhSzY/E0PUdOV2qrZ/ZOjCFwtWpRvQyCCQBqsTFQIhcQqMAI7h7wcthMCCkkcS+cZ/7vSQrjqQ8obKaXgliVSn7wj1l+fziWkFTQzyrr3ZYuY5kvzWiaFLqk7wcfd1eu+4e/4p4tGFxgE3Gh9XTCyYLOxHAsLgVYARMM5dE6wDyRcSvjQDyilJJEkpDUlyZFModv988mADY5+0FuY2CJCbbbsCjaFHXiZxfLKWfQMT7pJXzjMMgeoLXsYYgfyuIGcmf6kVy6aFoTrgox5bfhj5ltURU5iGRSEDKdmXG2sw/qpd56TxF75gm4T09IdNXGqyyqZjCZrNP/T+7onregVb161BhLlBIHE7Qp1LakmAin5uhjvSNBvJjTbLGeu7VbRmqaQHVjVnRNQHg1HhFTRpFI00qNpSf9sz2CGNs0ySxRMcRo3GRlioAT8f6ELc8j+OAGSdpCXoXjsN1YLZNgRKQbukSONFj20qIejwjCmnbP5jGeWj6zuy6veFN8Hem1NrepHz1Obr9XphxCM8TfOUecghQwOvud8L5vJJUEFPGvC2r22qdRNcjjWvRkvuzgYBC/rMt1hcnEX7F9cngNpqP4LKjh38oVdg5MjhBQ1p46b33mGcIhdCa58Df6zmsJUWnLNCuidU6ZmVIvp2g8RfPJz1mkKQpPUbLtoDnUSJ+y1Jv0cV24aQ4j3WSSGr3h7i0NSi8ZpHAbR3S0b7idbd+mNVXXMajIFbsWFevJwedwt4VNZ0FygBwETfUg3ED95MzMS27thiSwsrwNHbTdsGip7SRTvnGY//fv++IXEPN/o6wG/sz3mtPcFKgJVzLebhfuNWoTiJ2GV+/hN721dvH5ttoUlSEYmDoJNbauO6NWXMtjh0f3GDrf+QsR6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6506007)(6486002)(6512007)(2616005)(31696002)(38070700005)(4326008)(508600001)(5660300002)(86362001)(2906002)(36756003)(26005)(186003)(45080400002)(8936002)(85182001)(83380400001)(122000001)(71200400001)(54906003)(316002)(64756008)(66946007)(66446008)(6916009)(66476007)(66556008)(76116006)(38100700002)(31686004)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDJqOEJzb2Y4cVdBeGx4YlZtYmZlY1ZHMFRwb21zKzdmQmM5cUMvbHFxbDBq?=
 =?utf-8?B?UVNuWDhlK3V1bmtka1pMWWNUalhCR0ZPMDVXZzRYdnBLVy9ZNlRFbHY3aW9l?=
 =?utf-8?B?K1pEbEI0eVdudnpNbFVWYi9DYTFjNDBaeWJYc2d4ampLVC81eUJUTDFKcVpo?=
 =?utf-8?B?cVRWdGVKaFlXSHFVNDM5RXFaeWRuQkdwVWRQVFNwMXIvQWRjaDR6ZmV2Tmpa?=
 =?utf-8?B?dG5iZjRtSmREc1NLejh1bVRFKzc5TUx5YnpSUFRDRDQvU29XMWpvWXc1WHZI?=
 =?utf-8?B?Y0k1SiswRGpyQW05alp5VW1taEo4RVUvcUx5RE9lSlJ5QU5xTmNreHBJTXZh?=
 =?utf-8?B?YWkvSDZKTzYrVDdCZnN5bzFnSUkxaDd1UDJmOVN5T3E2K2RXU0dpdUFJYUk0?=
 =?utf-8?B?ZHc3REZGRVFweFZTS2tMczVxTndqV3QzQVJUNTZlVFNNUWVQZ3lNVG5ydDgx?=
 =?utf-8?B?YWRjejhTMHp4YmNyOCtDZWkzQ2lYSXNTMnhXRVhLL24wTFBlRUJmc0xyekdU?=
 =?utf-8?B?dXlmNlpOeVdNQ28zTDBZa3VOa1dmdGxEdWNUa3lOWExoZVlNdG9iT1JzWlNO?=
 =?utf-8?B?amZZMTZxNmNrT2JYUmlTbkNoTEpadml5NmtEWWc2Y0dVYjN3ajBBT3R6SmRp?=
 =?utf-8?B?RlpHVEFEeGQzd0NSMC95NUI4c2VvRGpWUEwrZlJlY2JXN2IwRC9zRmJmTFF4?=
 =?utf-8?B?ZE41Tk1sWktISU9LZHNYNTZvS2pUSjZKUGNubHVDWFlWSm5ONVZ2dGJ3VTZW?=
 =?utf-8?B?WUJITHdyQWRjYlBiZTdhUHVXeWtMMzg1MUYwQnZ0dXNDTEQxa081SDlFNnFC?=
 =?utf-8?B?NmFVY0FkUXBSK3UzZEZKcDk0NTltSXgvYnQ2bDZCbUhpbEc4QW1mY3JkTGVv?=
 =?utf-8?B?M2VTdURqNUpPdElHTnVCZGl3THJQck90WWNOYmZHOW9Gd3ZzZkh4UEl2WDJM?=
 =?utf-8?B?UmxwZG43aEtIRS9HbGtmOHFHcGU4MTlnRWxydWhEMlRpSjdYUmxNb2xRM3Z1?=
 =?utf-8?B?Z21CM0dqQldRZUpqbHM4MWRZZm5JelRVa0VRdkwzRzRZcWVxOFoxRUpvR0xl?=
 =?utf-8?B?K2MvMHBQYTdPZUxnRVIwOGFVdCt5RlMyMWQxaHFDR3llSUtiMzRlTmxoVUlW?=
 =?utf-8?B?cXhpRi9Kd1N3VWN3ejByTWNpb29nOEZMbVp5OGhORktTQTZ1clhyUHdXMkRQ?=
 =?utf-8?B?MlloVHJLTnpvcmRqbHMwK2xKajFWWlN0dTZrZ3UrdW9uMHgwZjNZR2pKOEZp?=
 =?utf-8?B?WWVoajk5eWQ5eUNFZnZ2OC9QTzBOeWVjQzVSaFh6ZFBGL2ZxQ2pkbTVEQ1dB?=
 =?utf-8?B?d0V0Zlp1eERYWmwvbTFkU0dUWHpkMWRMTkgwYnlFVW1YbkZzRGZJV0cyM2lT?=
 =?utf-8?B?ajdKYW1VQWpKb3VaWFVpRVdzTEZWMDBFSjRSRnhYSGJ0T0NuUkVWNVhMTENL?=
 =?utf-8?B?VkhoSkh0citaWTZyZk5lYlJPMCtLU2Z5MmY2WlU1S3ZpT2hGTVExd3JRaC9D?=
 =?utf-8?B?RmRzVEN0Ukd2cmlzbnZqeUJWVllPVXF4bVIxV2ZJTXRJdjk5R2lIQUFkQXgv?=
 =?utf-8?B?YktVSzhQNDNJcFNpc1hjYkJmbU16R1JYaGFrbVd4eTdHSDBGeHV5UGZtT3Zx?=
 =?utf-8?B?NzNMdU9pcHFOSVNhSTFRRDd5V3VoeHlaOVE3WTVlOHl1bHRtUFFPK3pPNW03?=
 =?utf-8?B?UHNxd09lNER1K0pUdnZJZ0tBN1ZvRnVLRjhVWm9Uc0tsNW12TXZnN3NLSERX?=
 =?utf-8?B?R3BHRllmS0V5NmpWVXFEMG5VSmhVdFM4bWE4NVR3enRRVGVIL3d1cllTVUlZ?=
 =?utf-8?B?RTRwUDVBcGxxRUdsdnplaTVLZVF4dnhUcHZlNENjVGFvTHJHdXcxbjg1YWtR?=
 =?utf-8?B?NzR0cGY5Ulc3ckhpNGMxaVcyemJ5MVkrSEQ5NnkxanoyOGJCYjFTT0VpVEFk?=
 =?utf-8?B?U25jcUlEQnJ0MllmdWNYb3hRTVp5Y2RldWkzYnRZSVkyd3VBY3ZyQWNHK1F5?=
 =?utf-8?B?amZzQkd3eUg1eWFIZXl1OWJOTmIyYW5HU0pxNkJhekcwajd1UTNPRkRMTjZk?=
 =?utf-8?B?WVdWOXNZYXRITU9tK0dMcnI4Wi9mMHQ1d3RCWWdBYytBTVNXUmhBbFZCUXFB?=
 =?utf-8?B?S2JzcCtWY0RGRmY4d2F2TkwwbEQvTVFPeWhhNVpzTlFWNloyNGdaVmJFRVFV?=
 =?utf-8?Q?6z0fXhtULfXqbGu+5m2h9kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ED841335838874395A374A9CD4DC7B4@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a71e18-ef02-44af-0cd9-08d9f81611ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 04:19:51.8755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hVjAKtpi6YGnKyFTmvtxB6wdxeGJBpPsDMzlFbUBzCw25wYI29TvVdRs8TPMqF5xbEcBOGTPvEAr21t5D/qptQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB5046
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sm9lbCBTdGFubGV5IOaWvCAyMDIyLzIvMjUg5LiL5Y2IIDEyOjAxIOWvq+mBkzoNCj4gSGkgUG90
aW4sDQo+DQo+IE9uIEZyaSwgMjUgRmViIDIwMjIgYXQgMDI6NDIsIFBvdGluIExhaSA8cG90aW4u
bGFpQHF1YW50YXR3LmNvbT4gd3JvdGU6DQo+PiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgd2luYm9u
ZCB3MjVxMDFqdnEgZmxhc2ggaW5mbyBhbmQgY29udmVydCBmbGFzaF9pbmZvDQo+PiBmbGFncyBp
biBuZXcgZm9ybWF0IHRvIGFsaWduIHdpdGggdXBzdHJlYW0gKHY1LjE3KS4NCj4+DQo+PiBUaGUg
cGF0Y2hzIGZyb20gMDEgdG8gMjUgYXJlIGNoZXJyeS1waWNrZWQgZnJvbSBrZXJuZWwgNS4xNywg
YW5kIHBhdGNoIDI2DQo+PiBpcyBuZXcgcGF0Y2ggZm9yIGFkZGluZyB3MjVxMDFqdnEgZmxhc2gg
aW5mby4NCj4+DQo+PiBMSU5LOiBodHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZhbGwlMkYyMDIy
MDIyMjA5MjIyMi4yMzEwOC0xLXBvdGluLmxhaSU0MHF1YW50YXR3LmNvbSUyRiZhbXA7ZGF0YT0w
NCU3QzAxJTdDcG90aW4ubGFpJTQwcXVhbnRhdHcuY29tJTdDNmQ0MDBmYTgzMTI2NDIxODRkZTcw
OGQ5ZjgxMzk3NTIlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdD
NjM3ODEzNTg1MzIwOTY1MDQzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMw
MDAmYW1wO3NkYXRhPUVpaW5IZyUyQjFzbFMxJTJCSGUxNGRvb3lkeElEaVlQelglMkJMbzVaY29Y
dlp1cUElM0QmYW1wO3Jlc2VydmVkPTANCj4gSSB0aGluayB0aGVyZSB3YXMgYSBtaXN1bmRlcnN0
YW5kaW5nLiBQYXRyaWNrIHN1Z2dlc3RlZCB0aGF0IHdlIHNpbXBseQ0KPiBhcHBseSB0aGUgdjEg
b2YgeW91ciBwYXRjaCB0byBzdXBwb3J0IHRoZSB3MjVxMDFqdnEgdG8gZGV2LTUuMTU6DQo+DQo+
ICBodHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZhbGwlMkYyMDIxMTIyNDEwNDUyMi4yNDYxNS0x
LXBvdGluLmxhaSU0MHF1YW50YXR3LmNvbSUyRiZhbXA7ZGF0YT0wNCU3QzAxJTdDcG90aW4ubGFp
JTQwcXVhbnRhdHcuY29tJTdDNmQ0MDBmYTgzMTI2NDIxODRkZTcwOGQ5ZjgxMzk3NTIlN0MxNzli
MDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3ODEzNTg1MzIwOTY1MDQz
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPW9mZDdx
a0lGRzclMkY5JTJCbXU1M1hBJTJGNGZYaWR4Rm41VHZHaUU0Qk56SDVLcUUlM0QmYW1wO3Jlc2Vy
dmVkPTANCj4NCj4gVGhpcyBhdm9pZHMgdGhlIG5lZWQgdG8gYmFja3BvcnQgdGhlIG5ldyBzdHls
ZSBmbGFzaCBzdXBwb3J0IGZyb20NCj4gbWFpbmxpbmUgdG8gdjUuMTUuIFdlIGF2b2lkIGxhcmdl
IGJhY2twb3J0cyB3aGVyZSBwb3NzaWJsZSBhcyBpdA0KPiBjb21wbGljYXRlcyBnZXR0aW5nIGZp
eGVzOiBhcyB0aGUgcGF0Y2hlcyBhcmVuJ3QgaW4gbWFpbmxpbmUgdjUuMTUsDQo+IHdoZW4gZml4
ZXMgYXJlIHNlbGVjdGVkIGZvciBiYWNrcG9ydGluZywgdGhleSB3aWxsIG5vdCB0YXJnZXQgdjUu
MTUgYXMNCj4gdGhlIGNvZGUgdGhlIGZpeGVzIHdhbnQgdG8gZml4IGRvZXMgbm90IGV4aXN0IGlu
IHRoYXQgcmV2aXNpb24uDQo+IEFkZGl0aW9uYWxseSwgbGFyZ2UgYmFja3BvcnRzIGNhcnJ5IHRo
ZSByaXNrIG9mIHJlZ3Jlc3Npb25zLCBhbmQNCj4gbWFraW5nIG91ciBibWMga2VybmVsIGxlc3Mg
c3RhYmxlLg0KDQpJIGp1c3Qgbm90aWNlIHRoYXQgSSBtaXNzZWQgdGhlIHJlcGx5IGZyb20gUGF0
cmljayBvZiBteSBxdWVzdGlvbiAobm90IHN1cmUgd2h5IGl0IHdhcyBtYXJrIGFzIGp1bmsgbWFp
bC4uLiksIHNvcnJ5IGFib3V0IHNlbmRpbmcgdGhpcyBwYXRjaCBzZXJpZXMuDQoNCj4NCj4gV2Ug
c3RpbGwgd2FudCB0byBkbyB0aGUgd29yayB0byB1cHN0cmVhbSBzdXBwb3J0IGJlZm9yZSBhZGRp
bmcgaXQgdG8NCj4gdGhlIG9wZW5ibWMgdHJlZS4gVGhhdCBtZWFucyBuZXh0IHRpbWUgd2UgcmVi
YXNlIG9uIGEgZnV0dXJlIHJlbGVhc2UsDQo+IHRoZSBwcm9wZXIgcGF0Y2hlcyB3aWxsIGJlIHBy
ZXNlbnQuIFRoYW5rcyBmb3IgZG9pbmcgdGhpcy4NCj4NCj4gQW5vdGhlciB0aXAgd2hlbiBzdWJt
aXR0aW5nIHVwc3RyZWFtOiBtYWtlIHN1cmUgeW91IHVzZQ0KPiAtLXN1cHByZXNzLWNjPWFsbCwg
c28geW91IGRvbid0IHNlbmQgdGhlIGJhY2twb3J0IGVtYWlscyB0byB0aGUgYXV0aG9yDQo+IG9m
IHBhdGNoZXMgeW91J3JlIGJhY2twb3J0aW5nLg0KDQpHb3QgaXQsIHRoYW5rcyBhIGxvdCBmb3Ig
eW91ciB0aXAsIHdpbGwgYWRkIHRoaXMgaW4gZnV0dXJlLg0KDQo+DQo+IEkgYXBwbGllZCB2MSBv
ZiB5b3VyIHBhdGNoIHdpdGggY29ycmVjdGlvbiB0byB0aGUgY2hpcCBuYW1lLg0KDQpUaGFuayB5
b3UgZm9yIGFwcGx5IHYxIHBhdGNoLg0KDQpQb3Rpbg0KDQo+DQo+IENoZWVycywNCj4NCj4gSm9l
bA0KPg0KPj4gSm9uYXRoYW4gTGVtb24gKDEpOg0KPj4gICBtdGQ6IHNwaS1ub3I6IEVuYWJsZSBs
b2NraW5nIGZvciBuMjVxMTI4YTEzDQo+Pg0KPj4gUG90aW4gTGFpICgxKToNCj4+ICAgbXRkOiBz
cGktbm9yOiB3aW5ib25kOiBBZGQgc3VwcG9ydCBmb3IgdzI1cTAxanZxDQo+Pg0KPj4gVHVkb3Ig
QW1iYXJ1cyAoMjQpOg0KPj4gICBtdGQ6IHNwaS1ub3I6IGNvcmU6IEZpeCBzcGlfbm9yX2ZsYXNo
X3BhcmFtZXRlciBvdHAgZGVzY3JpcHRpb24NCj4+ICAgbXRkOiBzcGktbm9yOiBjb3JlOiBVc2Ug
Y29udGFpbmVyX29mIHRvIGdldCB0aGUgcG9pbnRlciB0byBzdHJ1Y3QNCj4+ICAgICBzcGlfbm9y
DQo+PiAgIG10ZDogc3BpLW5vcjogR2V0IHJpZCBvZiBub3ItPnBhZ2Vfc2l6ZQ0KPj4gICBtdGQ6
IHNwaS1ub3I6IGNvcmU6IEludHJvZHVjZSB0aGUgbGF0ZV9pbml0KCkgaG9vaw0KPj4gICBtdGQ6
IHNwaS1ub3I6IGF0bWVsOiBVc2UgZmxhc2ggbGF0ZV9pbml0KCkgZm9yIGxvY2tpbmcNCj4+ICAg
bXRkOiBzcGktbm9yOiBzc3Q6IFVzZSBmbGFzaCBsYXRlX2luaXQoKSBmb3IgbG9ja2luZw0KPj4g
ICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IFVzZSBtYW51ZmFjdHVyZXIgbGF0ZV9pbml0KCkgZm9y
IE9UUCBvcHMNCj4+ICAgbXRkOiBzcGktbm9yOiB4aWxpbng6IFVzZSBtYW51ZmFjdHVyZXIgbGF0
ZV9pbml0KCkgdG8gc2V0IHNldHVwIG1ldGhvZA0KPj4gICBtdGQ6IHNwaS1ub3I6IHNzdDogVXNl
IG1hbnVmYWN0dXJlciBsYXRlX2luaXQoKSB0byBzZXQgX3dyaXRlKCkNCj4+ICAgbXRkOiBzcGkt
bm9yOiBzcGFuc2lvbjogVXNlIG1hbnVmYWN0dXJlciBsYXRlX2luaXQoKQ0KPj4gICBtdGQ6IHNw
aS1ub3I6IEZpeCBtdGQgc2l6ZSBmb3IgczNhbiBmbGFzaGVzDQo+PiAgIG10ZDogc3BpLW5vcjog
Y29yZTogRG9uJ3QgdXNlIG10ZF9pbmZvIGluIHRoZSBOT1IncyBwcm9iZSBzZXF1ZW5jZSBvZg0K
Pj4gICAgIGNhbGxzDQo+PiAgIG10ZDogc3BpLW5vcjogSW50cm9kdWNlIHNwaV9ub3Jfc2V0X210
ZF9pbmZvKCkNCj4+ICAgbXRkOiBzcGktbm9yOiBjb3JlOiBDYWxsIHNwaV9ub3JfcG9zdF9zZmRw
X2ZpeHVwcygpIG9ubHkgd2hlbiBTRkRQIGlzDQo+PiAgICAgZGVmaW5lZA0KPj4gICBtdGQ6IHNw
aS1ub3I6IGNvcmU6IEludHJvZHVjZSBmbGFzaF9pbmZvIG1mcl9mbGFncw0KPj4gICBtdGQ6IHNw
aS1ub3I6IFJld29yayB0aGUgZmxhc2hfaW5mbyBmbGFncw0KPj4gICBtdGQ6IHNwaS1ub3I6IElu
dHJvZHVjZSBzcGlfbm9yX2luaXRfZmxhZ3MoKQ0KPj4gICBtdGQ6IHNwaS1ub3I6IEludHJvZHVj
ZSBzcGlfbm9yX2luaXRfZml4dXBfZmxhZ3MoKQ0KPj4gICBtdGQ6IHNwaS1ub3I6IGNvcmU6IElu
aXQgYWxsIGZsYXNoIHBhcmFtZXRlcnMgYmFzZWQgb24gU0ZEUCB3aGVyZQ0KPj4gICAgIHBvc3Np
YmxlDQo+PiAgIG10ZDogc3BpLW5vcjogY29yZTogTW92ZSBzcGlfbm9yX3NldF9hZGRyX3dpZHRo
KCkgaW4gc3BpX25vcl9zZXR1cCgpDQo+PiAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogdzI1cTI1
Nmp2bTogSW5pdCBmbGFzaCBiYXNlZCBvbiBTRkRQDQo+PiAgIG10ZDogc3BpLW5vcjogc3BhbnNp
b246IHMyNWZsMjU2czA6IFNraXAgU0ZEUCBwYXJzaW5nDQo+PiAgIG10ZDogc3BpLW5vcjogZ2ln
YWRldmljZTogZ2QyNXEyNTY6IEluaXQgZmxhc2ggYmFzZWQgb24gU0ZEUA0KPj4gICBtdGQ6IHNw
aS1ub3I6IGlzc2k6IGlzMjVscDI1NjogSW5pdCBmbGFzaCBiYXNlZCBvbiBTRkRQDQo+Pg0KPj4g
IGRyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYyAgICAgIHwgIDc5ICsrKy0tDQo+PiAgZHJpdmVy
cy9tdGQvc3BpLW5vci9jYXRhbHlzdC5jICAgfCAgMTUgKy0NCj4+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYyAgICAgICB8IDUzNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+
PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggICAgICAgfCAyMTcgKysrKysrKystLS0tLQ0K
Pj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvZW9uLmMgICAgICAgIHwgIDMzICstDQo+PiAgZHJpdmVy
cy9tdGQvc3BpLW5vci9lc210LmMgICAgICAgfCAgMTUgKy0NCj4+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL2V2ZXJzcGluLmMgICB8ICAxMiArLQ0KPj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvZnVqaXRz
dS5jICAgIHwgICAzICstDQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9naWdhZGV2aWNlLmMgfCAg
NTcgKystLQ0KPj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvaW50ZWwuYyAgICAgIHwgIDEyICstDQo+
PiAgZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgICAgICAgfCAgNjAgKystLQ0KPj4gIGRyaXZl
cnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyAgIHwgMTA1ICsrKy0tLQ0KPj4gIGRyaXZlcnMvbXRk
L3NwaS1ub3IvbWljcm9uLXN0LmMgIHwgMjA4ICsrKysrKy0tLS0tLQ0KPj4gIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivb3RwLmMgICAgICAgIHwgICAyICstDQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9z
ZmRwLmMgICAgICAgfCAgMjAgKysNCj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwYW5zaW9uLmMg
ICB8IDE2MiArKysrKy0tLS0tDQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYyAgICAgICAg
fCAgOTYgKysrKy0tDQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9zd3AuYyAgICAgICAgfCAgIDIg
Ky0NCj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyAgICB8IDE3NCArKysrKystLS0t
DQo+PiAgZHJpdmVycy9tdGQvc3BpLW5vci94aWxpbnguYyAgICAgfCAgMjEgKy0NCj4+ICBkcml2
ZXJzL210ZC9zcGktbm9yL3htYy5jICAgICAgICB8ICAxMCArLQ0KPj4gIGluY2x1ZGUvbGludXgv
bXRkL3NwaS1ub3IuaCAgICAgIHwgICAyIC0NCj4+ICAyMiBmaWxlcyBjaGFuZ2VkLCAxMDQ1IGlu
c2VydGlvbnMoKyksIDc5NiBkZWxldGlvbnMoLSkNCj4+DQo+PiAtLQ0KPj4gMi4xNy4xDQo+Pg0K
DQo=
