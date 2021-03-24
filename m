Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07F347763
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 12:31:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F55dt1R3xz30QN
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 22:30:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=rBbEU7G6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=710e33ba8=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=rBbEU7G6; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 24 Mar 2021 22:30:43 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F55db5fhZz2yZC
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 22:30:42 +1100 (AEDT)
IronPort-SDR: 0chGSI9ehO0VBYA5Tq1B6Hjh7SylGTt6Urul1VpCerRx3NKSail6s63f4o/PH6tYa9vc0gGyp4
 Fm4k/xOxKd7g==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 24 Mar 2021 19:29:35 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 24 Mar
 2021 19:29:34 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx10.quanta.corp (10.243.91.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 24 Mar 2021 19:29:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIjwEC5l9+uCl0FCGGugqQuPSw+IfGzoF/lVewVDvmm1Q9otuumjV/ZfEOLL+jD/mPVI/OehjWiSKWKd7VTjaxSZGW1cJsEXk/2PpcLw4OwcwG7/LHgXRFY29FZuveooZvDtFsaxTb7Xvg6oQlHa/9k74OIMIQJAfQVPTyme7rE31wO7+L0JoIYYcA4HwT3dAvxjD+dirECVrhdNmDebk8S4gvhbxKFlyT125paOuRTAxvzgaCyvb8omAPVpGlxXXzUoYgojuToEoi/l/b1+yk74QTlNdQRz1Ny4Lqd+RlKnloRFQZdxO4yprBsxNgrcvyNTX/8cBuvusqo6ZRBCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnuJJ+Qc8umufNdiXAJ/RgES+GjQZBFrslC4WdZN6/4=;
 b=Am7CRP/hTxETNRVaSoSa0zaOF17SQbWYc6Y/wAhG05kzHAyJ6q/SEjkLlEw42iSubcmjrMwgiSDHV5I/Sed0U1TcwBU2Qw/HmgDckx2NdVkw9xCeKJ2nfpcSH41x93W+ncIhah1vmCOEpOIBXX0XGGYI0RfVffPrvcRGaBUhrdKb3RM4eCuGXypF+UvaYNQhCQkjsCi+k3ua4/6rMIw0eaJ5C3sTejlTkBvcFMVwTX4wEOWhjoUWaQxDi84nNu+hCcEnkm7NktAqwfLKVoYRbfjXcuXKi+vs/lQM8sx/h0Dll2cmGKGbTSMZnPwMBCr2GyxFVG/iZJnRMWDF3obeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnuJJ+Qc8umufNdiXAJ/RgES+GjQZBFrslC4WdZN6/4=;
 b=rBbEU7G6N0tzNQjka6IgygO1AHtCbpd7chvT2g3QOoG/Ixjpsp0TYCuM8nLJLFoAeZJ1p2dKe9HoF4F6TjuAxVuwzdRKWTCu5crEyLhMSJm1Sed/NY8KU9bpEqgc+3cuTQyyUmyQlqJSUsBjp/cKK2ItIL6Usa72cC25qwjh+lM=
Received: from TY2PR04MB3712.apcprd04.prod.outlook.com (2603:1096:404:100::15)
 by TY2PR04MB3389.apcprd04.prod.outlook.com (2603:1096:404:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 11:28:31 +0000
Received: from TY2PR04MB3712.apcprd04.prod.outlook.com
 ([fe80::8cfe:610a:b81c:221c]) by TY2PR04MB3712.apcprd04.prod.outlook.com
 ([fe80::8cfe:610a:b81c:221c%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 11:28:31 +0000
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question of phosphor-sel-logger
Thread-Topic: Question of phosphor-sel-logger
Thread-Index: AdcgoHwyqfZQU98ITCqUNZr+o4bhCA==
Date: Wed, 24 Mar 2021 11:28:31 +0000
Message-ID: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18fbc0c0-be44-4783-b35f-08d8eeb7f3fb
x-ms-traffictypediagnostic: TY2PR04MB3389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR04MB338967686EF3B79FACF6806A88639@TY2PR04MB3389.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MtoCeLUAmKfph+8+AswKUky7ndTj/IM3Clbrwoe1tR+wg/3NpkP63WK92COLdRegcKFHxa2IASMv+2jUfYmAVdPK0o551XcLLcjJ0jSqNvqNHL+aWu5v6QN0dfxVr2iEO5MyXeUv7E7LmUJDlMIUqr5xKblru+RrD6yBhMGbP0nczEk1w9Eb6N288cxysujL+8RX3aEmGfoMhNVogiMGe9GTA7whvlCohijMU4s4YNKXH++cbMMb8a06t/zBZAX6XUMJerILqD+QtqnFZ0/wmsV6uKt3Vu9hWrSWE7/znP9sKp8gm2Sfa51KB6+P2TLgDmzFKyYUefTlIeqf4PLXDRstldol3tW9+ITDdehSOjjy72TpDsGNOGrFIrOKKxV6uZC2oD2wgbhdOo4dVgVx40wR/vaWsEPV9tWVDngiyjhAdu2hN0H7wdkvGYnFpW7hfERpIJubOBRebGACQaBf8ZP8ZDre776bv6KdaRJL8f4+PaC1WZDbmBoWMX2BmiNB4cgl3SQPIBK1oawwit7Ai0doholxaEYD2/3jLktRmeL/MlBhXTEnTpNjRzWzsWq1+f/Wrc86TWV58neITFuIsED6rn5YMTZEZigqaAIkJfAInh8WoZAGwqTNR4h9lqVJuJE99+3wszXPn9Z6cSg3tJSOqblILzeMRqGljnJ6Dr2r+RtGXGEI2mEU3Zp/nd7nrTXwwlCYd4TBkFHzg2rdK6RbIeLeVhEFEV5/i3dhPb4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3712.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(66946007)(85182001)(7696005)(2906002)(9686003)(186003)(6916009)(64756008)(66476007)(26005)(8936002)(38100700001)(66446008)(33656002)(76116006)(6506007)(478600001)(107886003)(54906003)(4744005)(5660300002)(316002)(83380400001)(4326008)(966005)(86362001)(55016002)(71200400001)(8676002)(52536014)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?c3FINEl0dUwvVFFaL2NXNlFlOG9KWjU1NnIwRlMvWUZLU1pyeGlTbmpsWG5OY2x2?=
 =?big5?B?djZjTjlrZkhLZlhWSWFDK1BxREtFNURWUmtENkpGbndvQ2I2RWYwN2VmYXU1YjVX?=
 =?big5?B?bkd3ZUQrY0JqdG9reFFwaFhlWFVQelBNdmRSUkdNeUloTGVWMGpGVnlsYXBtZ0xs?=
 =?big5?B?MlN4WTl2NFArM2hyWHFzTVVIaUtUNUNnK3pqNTNsZFp4aGlHMXFTM3RiSjk4UXdE?=
 =?big5?B?dTJxY2k4K214eTM2K3h4OTFPcU9BaFBia3FBSDZqNG5CWE9CUTUrMndocU9kUGo0?=
 =?big5?B?UWR1R2ZnVXhwQ3J1R3lQWC9rSzVjUWRVSE9ScnJPK1VEZTYra0RkZ0dCYldSU1BU?=
 =?big5?B?UVdlTTdPc21EK1dEQUFpbXFOWmYzNXFCY2tYMXJJMUNxbm1FVEVjTm1vMWZlNUov?=
 =?big5?B?b3hYUERXYmNGbVBaYmpZeGdvR1g1eWtyWVVxelV2SHBHdzhTcFFVY3gvWFZSR0Vr?=
 =?big5?B?TklHUXQ2V3hQWHVUdzhIT1pZMlVnNklXQUJKVDRxc1NyclNHOHNyWTZHYkswSklL?=
 =?big5?B?WlJPWmdEY04vbGVMSDd6OHdqOGxBUWFFNXI5OFgwc3liZmxNZ1p6SzlyRkVqZUk3?=
 =?big5?B?R3RZNjI4SVZQYTdIM3QyNUVqc21CSmM2YWRrV01nYlByVk1jUnVJNmI0UXlSSDN4?=
 =?big5?B?NkxCOU5ycjNLZWJEMG5EekZNWDNzZkhkVVpNSURqS3VJTmU3K3lJMThkTDV1T0Er?=
 =?big5?B?OENzZWNTWTIrSFNZelU2VUdSaGg5Q1htTDZYNGNiZ2dmTUczRHlUOVFDMnpHU01F?=
 =?big5?B?SExaMUlYL2Z4VXBKcC9qL3BnSEd6NjJzTldSLzZZdk5md2Uwa20vWTJXTGJFRnBa?=
 =?big5?B?RVRjNHNWV0xRSUljWCtQZE9wVWJ2bEtHb0g1MmgxaWJTYXJUNWs0Rkx1bUUwNkZI?=
 =?big5?B?QW1YT3AzY29WSEd2ditvUFRDZXpDcWt0aUVVYkpWcWR1ckpjd21JSm8zcVhBZlJ3?=
 =?big5?B?b1hiNE0wWFF4OVNDYUtrVDFCOXZOc0lCRW1qUjdaVXowNnhKWlF3TkhGTC9RY3F5?=
 =?big5?B?b0pwMytiaWF3NVFrT3BHYnlxTmxqTjlJN3dnR1hmOGNJR2NiVEF5bks5UzFJNDAr?=
 =?big5?B?VTFnVXlRcHlWS0N4cW5HbFpsSCtBRlpQeHY5cjhSL3JUM1IrUDZUODBBSTVPaHoy?=
 =?big5?B?YWFEQi9pMExYWjVEeGxjbjNJQTJJdVVSNVh2eXozV3RkNVdsSnJoVzZYbWFwcUt4?=
 =?big5?B?b2h5WjZGSWF4V0ZVbmhNUlY3WnFvdGxETmZSSFUwdEpGUDl2MUtuT2dSTTM2MC9j?=
 =?big5?B?ckxXKzVRY3FKL0hZdVVFM2tTM2t6SjFZL2gwMGFkTmc4YVpKaGsrRGdWR0ZjNWFx?=
 =?big5?B?dWV6M0N0T0oraU9pMFNHKzZKdkkvUVJ5dG1vV09jVmVmbE9TMENuVVZvUTlFYlRF?=
 =?big5?B?TncySUJTK0RvSURPWEVTc05ISVByRXA1N2orTjRSVitFTHRyZExFQzJraTZSSk5l?=
 =?big5?B?eGE0U0tZLyt3Z2ZSUHJoNktXL2NCZ2F5MjN4RVRqVXNoWlM3WWNRL2Y4UkZuMFF6?=
 =?big5?B?b1ZlK0docSt0ajk4NVFlUjNSaHN2RXVkMTI2VWtLaVBZNVZpSThYd0Q1QkF5UW1h?=
 =?big5?B?YURLVFZ6bG5qUjFvMVQ4V21MVVRrYUtTZ0R1MS81Z0ZTSXlwcmY0cXYrNWlkMXJC?=
 =?big5?Q?GoUraIuCFQyD3serq0KB6kpHgKk=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3712.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fbc0c0-be44-4783-b35f-08d8eeb7f3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 11:28:31.2140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BEzcPoejMGLH5fpuXJt/PqLdzl1//J01RN29FteAT+++EBbaNXtKlKAhSHGehOTo0CN3tIAcLkTSnvO51ERsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3389
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
Cc: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgYWxsLA0KDQogICAgIEkgdXNlZCBwYWNrYWdlIHBob3NwaG9yLWh3bW9uIGFuZCBwaG9zcG9y
LXNlbC1sb2dnZXIgdG8gbW9uaXRvciBzZW5zb3IgYW5kIGNyZWF0ZSBsb2cgd2hlbiBzZW5zb3Ig
cmVhZGluZw0KICAgY3Jvc3MgdGhlIHRocmVzaG9sZC4gSSBmb3VuZCBhZnRlciB0aGUgY29tbWl0
IDI1YjI2ZTE2MmJkMTA5YjUxYWEwOWIxNmYyNmY5YWEzZDlkOTQwZmEgb2YgcGhvc3Bob3Itc2Vs
LWxvZ2dlciANCiAgIHdvdWxkIGNhdGNoIHRoZSBzaWduYWwgIlRocmVzaG9sZEFzc2VydGVkIiB0
byBjcmVhdGUgc2Vuc29yIHRocmVob2xkIGxvZyBpbiB0aGUgam91cm5hbCwgYnV0IHRoZSBwaG9z
cGhvci1od21vbiANCiAgIHdvdWxkIG5vdCBzZW5kIHRoZSBzaWduYWwgIlRocmVzaG9sZEFzc2Vy
dGVkIiB3aGVuIHNlbnNvciByZWFkaW5nIGlzIGFibm9ybWFsIHNvIHRoYXQgcGhvc3Bob3Itc2Vs
LWxvZ2dlcg0KICAgd291bGQgbm90IGNyZWF0ZSB0aGUgc2Vuc29yIHRocmVob2xkIGxvZywgYW0g
SSByaWdodCA/DQoNCiAgIElmIEknbSByaWdodCwgY2FuIHlvdSBnaXZlIG1lIHNvbWUgc3VnZ2Vz
dGlvbiB0byBmaXggdGhpcyBzaWRlIGVmZmVjdCwgb3Igd2hhdCBzZXR0aW5nIEkgaGF2ZSBsb3N0
IGluIHRoZQ0KICAgcGhvc3Bob3ItaHdtb24gb3IgcGhvc3Bob3Itc2VsLWxvZ2dlciA/IA0KDQog
ICBwaG9zcGhvci1zZWwtbG9nZ2VyIGNvbW1pdCAyNWIyNmUxNjJiZDEwOWI1MWFhMDliMTZmMjZm
OWFhM2Q5ZDk0MGZhIGxpbmsgOg0KICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bo
b3Itc2VsLWxvZ2dlci9jb21taXQvMjViMjZlMTYyYmQxMDliNTFhYTA5YjE2ZjI2ZjlhYTNkOWQ5
NDBmYQ0KDQogICBUaGFua3MgdmVyeSBtdWNoICENCiAgIER1a2UNCg==
