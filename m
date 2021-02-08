Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A127313949
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 17:25:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZBFd6mRfzDsTw
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 03:25:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=666918061=scron.chang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=S1Js8Y5D; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DZBDY1yvPzDrh9
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 03:24:11 +1100 (AEDT)
IronPort-SDR: Wx5VQxlxfSCCeym2/n4H7RIECkRg8Rq2tHqf/JqZSCsHOf9llRY16ynrvnrQklD8y222E9eKfN
 IdMGqloOekhg==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 09 Feb 2021 00:24:10 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 9 Feb 2021
 00:23:56 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.56)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Tue, 9 Feb 2021 00:23:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbiRmmtBeaZ3YlE15WHgTRjwYZmShQb5fx3E0S1gXUKhBUJMS1qoGWzUMhe6MMuoZrNH2r33CPyLwr591mIvwP0S4d3D8JgmHxTFoUb9yER5qDFxF+qb+dYf5dgYoBsYUYbeEt4hCG91RwGJ+yavwq3G1nbD2YwZ/nnRFGw4xn3ikOYnjklI6odwIz5EM1T2P2ZTEBZxCvJNGMFkmreOfJPIwp2MykbRVM7rOdDgBoCFgmgSysiDFVWNtiRgLX0nnV2GJ0YEWIcN79aLaMVlNeQHvLCHWYijb4U6pqvpsFQimr9xFv/MBZVDMZ4oj8QMbfz/hcqZCW49A4Sn5F8cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3279kjpnqYGiv8jWA/F5YIyx8zfZpHNwd0GChlsLxE=;
 b=Y33fqlcMenRs98YtOan5/9imSd9XWAWElQx9V4dY+cFSC6cRuDr6b7R1nfCax1h7KMPQhZbLxiOW+Lv2QdUIpPvG96E/hvnVlMrqRi+a5hzgcpkkIaei8T5Vd8Piqj32nb4+a3/0ZznFuPtnGKttXsNMtn6OA8nrGQlleO9hz1Ymf6xbYIjgk1edX4NXP0q9pRLsvrNyBNdn+aqLW/70+5Bia624907HtcUcf2BWJHrlF/7dyPYXA2fu3gZ7nHI0Zfth+L/sWicqFuivoJtZix6V8vvWQ8a0TbYeZwpSljkXDhzmv8ioKBazv3ms7+cfw8tcOjDrqNQvVNC8tKVVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3279kjpnqYGiv8jWA/F5YIyx8zfZpHNwd0GChlsLxE=;
 b=S1Js8Y5DF4QE9QP+G7ddKUYEdO86ZE4s0TlY0qonxuBA9O5YfOBXo0XxVdR/gBruDAZ2UM2cB55Liuyxt935Fr4pMV28s5shg1In/t54CLhBiClON1hiH6M1S0hsppE8ddSKQAUz6LNF8CGmoZMx2PzqDK5ck/51DCQHwYE+GUs=
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com (2603:1096:203:67::10)
 by HK2PR04MB3761.apcprd04.prod.outlook.com (2603:1096:202:3d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 16:24:06 +0000
Received: from HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51]) by HK0PR04MB2564.apcprd04.prod.outlook.com
 ([fe80::8cc7:12a2:abfd:c51%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 16:24:06 +0000
From: =?big5?B?U2Nyb24gQ2hhbmcgKLFppfKptSk=?= <Scron.Chang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Discrete sensors for entity-manager and dbus-sensors.
Thread-Topic: Discrete sensors for entity-manager and dbus-sensors.
Thread-Index: Adb+NTjECu1AFmpISEqsmDI5NX9asQ==
Date: Mon, 8 Feb 2021 16:24:06 +0000
Message-ID: <HK0PR04MB2564A5A76720BD2BEA6AE6D9868F9@HK0PR04MB2564.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e93eb5d-cced-48cb-2b8d-08d8cc4df4c7
x-ms-traffictypediagnostic: HK2PR04MB3761:
x-microsoft-antispam-prvs: <HK2PR04MB376103AB8152FD47BB456A76868F9@HK2PR04MB3761.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0jU24aBp1J2fl6kkUE8NA9Z2QeQ5QAfbb7ec/1pM1oNWl8gF/MpxdIx6SJo0Mkf6oQi7ccBZFQHPDurtxrciiGtkEjFTNd6S/R3p8PrAawN56s3NfPF2Bb0aAcoq5acS/yFWZRcbxtCzlUWB5FTB9CCpazz7jM2x43ahOsuPZDACkwH11XquVywwfMs8VCZtOn1ca1dqZ7WrQGzv59vjrp+8xWODCPsXqBVa+aWfxtG1CFSOvJ7fAAdbr81bASa2w7LzFJ40o9r6qwav8Rrv7XMaIWPtMvmGRfurfAzSMSpFe2w3K8YiclNW5wb+XaWr1k340rNPCJnCzbLNDhNW9eQsWKVq32gc4eBN6gPOASZv7mo40GDSxYgAA1JrY6NrkPzOzVJZHX3HnqQwY+a3HWSP97Xit4hBVwTdNibJl4iT3QL9VNz8XginPQtE+hAk3ueKEDQcxXmFt0IItYGt090A71mvmukxgGIhukMf1EDE22rL9e/0XMcS5I8N1tWKmhmOoEyIsmazx33yIFT5ng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2564.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39850400004)(33656002)(6916009)(7696005)(8676002)(186003)(316002)(4744005)(85182001)(2906002)(86362001)(55016002)(66476007)(71200400001)(9686003)(8936002)(5660300002)(66946007)(76116006)(478600001)(66556008)(52536014)(6506007)(66446008)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?cGdpcVdYaHdNRzdoQkRyMzJXZGk5cUNnN2d2YjE3ZzdUZ01kSFo4Vk12eldXMjNq?=
 =?big5?B?dnByOFNGK0dEbkhxL3l4aCtaT0ZNRnlHMk0zcWliSHY1VUpYcTRSQWlZN2I0RndE?=
 =?big5?B?WmVmZ3NkYVVnUXl2TTRXMFlyS3h0S2dxcExuWm45V0JlYjRpS0xHRDRLNVh4b0lH?=
 =?big5?B?V3QyeDRRdHE5U1BDNldGb1lscnpldE9keG4yYXFBejVzK3dXdlFZUW95SnFFcXY0?=
 =?big5?B?L2NTYUFvMC93RytTLytlWnQ4VTBXS0d5eDlQMFZEVFh5UTZxS1JENlBLaDdpWXV5?=
 =?big5?B?ZHFrMUhBUDFRZnhXdm9Va3g1V1ltNnJpeFBBZ3dPOUpHbC9CRUE1cUFGeDhQNDZZ?=
 =?big5?B?N0p4KzhMOVZtdENiT1I3eGJueVlTY0xxcUtzeW41UHdoOXBRMDF1WmpERFpUQnJF?=
 =?big5?B?VnR0TUYwUGkvQzhDaVJteVFVTEVFeE5xdCtPYWN6MjdzaEVLekpiREZXYmlCZW5Q?=
 =?big5?B?aTYrbnNZaC9FTXJUMEZVWDExaGtkMmUrWENWS3kzWnZyZWRzdFB2b1hjTDROYndW?=
 =?big5?B?KzhWQS9qWGF0Tit0QnhRTlEvVFF0M212NXJwaFlQS1lWSXJTS0Q5bHEzeThMU2d0?=
 =?big5?B?dm40SlpNVjdKZGFQdTdpS0hPVlRaTHhKdnJ6WWhQbDdqSGtWOHMyVmpsQ3AxTEI1?=
 =?big5?B?YmFueWNiUHIrSFNjZjJHODhudU4rQUZqejVLZmhDZlc2SjdWZXlHdXZUb3NPQnZk?=
 =?big5?B?NmlZU1M4WnVYbERGNW1VaGhuNS9RbnJEYXNON1FVNHVNY2lpWkRzUHR4d3JKOUxn?=
 =?big5?B?L1RJcEMzejlWNTIwak1RRlVFYmhlUXMxZ2VoWnNoZzl3WDRPQ1RBKy9uYk5wbU1Z?=
 =?big5?B?ZmZ4QkdmVzNYdXNYdFY2ZWI1OEhOUDI2cHFpMGZpcGZmS2xpZDZ6UjdoNHZxSDh5?=
 =?big5?B?bkdVRzY3TDhPVzZyWjVFcVd5NEJKeG5ReTc3dXdVZnpuaDZpOGwrTE4yMXVLZFR3?=
 =?big5?B?ZlBlTmlZUVB4dUgyeCtOYjdZQWtMZWFHTjlSeTRxcjFIUEFINTBqdTEzOVoyUk5F?=
 =?big5?B?WFZzZU5pUjdhVThEREEvMVVvRDdzOFNTVkxkMGhFOFlKQkVRWEFLaHBickpqRnhr?=
 =?big5?B?UzRiWk5pVWp1SmtoYnc5WndqTmdEckRjbWFUTTlqdm02ZkJuZVZlQnlvdjJ6Yk5z?=
 =?big5?B?NXhlazZ1TnE1Z2daalRNbysxTzlkdXNrcHJFcytZa0NnNjNXL3VaRHlHWVBMck1Z?=
 =?big5?B?TnlBQTIyZUR5L3R4bVdUT0ZnU05YTkpxbHJkMURVNWZnL2tXcUgzNU1JalhINkxv?=
 =?big5?B?VjJ1WlQzMkd3WS9BN3FTRHlrYVZHVTRENWhPQXRoQWExem4rZnpia3FNWnNoSzJU?=
 =?big5?B?aVhXTUtWdkI3TFFJK05lVGJzY3BBNDZhbmpocHZNS2FEeGViU2twdE1mcWNmSUtr?=
 =?big5?B?cFRWaGFwd2szM2pVNU5NNkp4UENRcmtjeDRHUEtrUE5CUkt4clNudG9sLzE1V2pk?=
 =?big5?B?VU5Va0N3QjJ2VUN1SnZrZkc1ckdRd2l4STBxbHNtNU9QWWRsSG1jRDhHdlRrWEdE?=
 =?big5?B?U2lLR0ROTkZwTjE3Q0wvNzgxRkRrOEtncEYwcm1WN3JkZ2lTVUJvMDBFMWVRbGdV?=
 =?big5?B?MGZ3YUdrenZ0eDd5MW1FVE5ScmRxUFRpMjFFSXQyelNFZWphNG9MRFcvTTh6S1Qz?=
 =?big5?Q?Zuu2KrOWhTzMZH5y1pwarJgiw9b92lVgBgSpIt5JV5YH5Fo9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2564.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e93eb5d-cced-48cb-2b8d-08d8cc4df4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 16:24:06.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6nQSZt1S7ZOFYVzU+oCtWD7wJDNyhrsw+bEiIDFESJEzSTQN1gThHzQ5nC7v46ytTpLb/TZCi08GeDjo23N3Zi10C+ZtvlwLGTy+0JmOwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3761
X-OriginatorOrg: quantatw.com
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

SGkgYWxsLA0KDQpJbiBwaG9zcGhvci1pcG1pLWhvc3QsIGEgeWFtbCBmaWxlIG9mIHNlbnNvcnMg
Y2FuIGFzc29jaWF0ZSBhIGRidXMtb2JqZWN0IHdpdGggYSBzZW5zb3IgYXQgdGhlIGJ1aWxkIHRp
bWUuIEFuZCB0aHVzLCBib3RoIG51bWVyaWNhbCBhbmQgZGlzY3JldGUgc2Vuc29ycyBjYW4gcHJl
c2VudCBvbiB0aGUgaXBtaSBzZW5zb3IgbGlzdC4NCg0KSW4gbXkgY2FzZSwgdGhlIEJNQyB1c2Vz
IGludGVsLWlwbWktb2VtICsgZW50aXR5LW1hbmFnZXIgKyBkYnVzLXNlbnNvcnMuIEhvd2V2ZXIs
IGVudGl0eS1tYW5hZ2VyIGFuZCBkYnVzLXNlbnNvcnMgYXBwZWFyIG5vdCB0byBzdXBwb3J0IGRp
c2NyZXRlIHNlbnNvcnMuIA0KDQpEbyBkYnVzLXNlbnNvcnMgYW5kIGVudGl0eS1tYW5hZ2VyIHBs
YW4gdG8gc3VwcG9ydCBkaXNjcmV0ZSBzZW5zb3JzPw0KDQpBcHByZWNpYXRlIGFueSBzdWdnZXN0
aW9ucy4NCg0KU2Nyb24gQ2hhbmcNCkUtTWFpbCAgU2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tDQpF
eHQuICAgIDExOTM2DQoNCg==
