Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B478701531
	for <lists+openbmc@lfdr.de>; Sat, 13 May 2023 10:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QJJBw3XQXz3fNL
	for <lists+openbmc@lfdr.de>; Sat, 13 May 2023 18:07:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=etotTOKl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pliops.com (client-ip=2a01:111:f400:fe16::604; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=liorw@pliops.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=etotTOKl;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QJJBJ5k55z3c6f
	for <openbmc@lists.ozlabs.org>; Sat, 13 May 2023 18:06:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz5OfpFcXIhSDAT9Il5sI62j9xAmMm4m6H3dMXiEt3iEafRpKek6jeJVBOU5aFMaWtpTGtJIZ3dG2+INq8r74LR+upa1C9LHwCI7oRw9v44IVRzVy+fXnEJZ5RkoYqnjllz+BdI4Noc342b70XnmWGIpS3/j3ewXkm0tJmrT6PV3A+DJ+y8z8hYbaFNpEITnCuGikFiaYxoArlBXqhM8p7EpUwEdxjzlRwaufl90kA2kqrOW3L4Va06CLb3Mr//n6oZajpd6Fd7bT5XynGa9dYE5iwC+hANAVD0D9k/oc84ZpLISfvki/fmvf9LsweqpBwl/gg/j/MKLV4oi7wdceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq6WUDYcvQWYYQtQkuDNfXXfB+be/QRtH1nf3fElkGk=;
 b=atj85SH2+6VYJkjU9VXdq9toUjI/AHJ53YR01Pir7/ubLqE3jmx267CbsjGQwh3Lz/9EYQ1btAphETye79a61eBHNyUwgvvxRWH9sxkblAJnr5+WLsa8QRZEIU4+vSIJRRKR7wsbIOVHloiwmyWVL+aAwSKH9BQXmJHh5eIE5XK3xquZ/IUNYVf4vjFTszPBK6xH7OR+s5qS/t5EUvFx9kAwclWogoZMlPR0Oz4jVbIj7VAoHt9lEdDX91lwmZ75jIkcP4ilLJOoswngs5UVrhZDQIrzhmKfXEObtPpjucCz6jeL6ZCDrKNECIw/jWOJh0FQLOA78EfpzHob7jDfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pliops.com; dmarc=pass action=none header.from=pliops.com;
 dkim=pass header.d=pliops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pliops.onmicrosoft.com; s=selector2-pliops-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq6WUDYcvQWYYQtQkuDNfXXfB+be/QRtH1nf3fElkGk=;
 b=etotTOKl41fSv3N9nkzEcVG8Q/AJNEKcvS79pCVjSX+RHDu43xYrwp4oLT13d/uj90obd5BI1teovVzxK0E3ZdtwSSdBCoQWAzCXuFT5xftPNeDeuYYnejfyanoCrjmWxMMm0WeKl5hIk+HJxwmzMWiMa9OUt/i+QPxCSPegfNk=
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:30::14)
 by PAXP195MB1509.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Sat, 13 May
 2023 08:06:22 +0000
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::c695:44b1:a751:3684]) by PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::c695:44b1:a751:3684%3]) with mapi id 15.20.6387.027; Sat, 13 May 2023
 08:06:21 +0000
From: Lior Weintraub <liorw@pliops.com>
To: Stefan Berger <stefanb@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
	Patrick Williams <patrick@stwcx.xyz>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: RE: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Topic: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Index:  Adlvg6fi1hXH38M1TxmitTi5f2yoIABVM/2AAAYX0AAEvO8YkAADgKhQAAkn+jAABbA6kAAwMVgAACBXPPA=
Date: Sat, 13 May 2023 08:06:21 +0000
Message-ID:  <PR3P195MB055596A26365D27728D7BD54C37A9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
References:  <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <be8000ad-722b-418a-8629-ea7c90805782@app.fastmail.com>
 <PR3P195MB055565CDA894F11E456057E7C39C9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB055586BFBA25640B58330262C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB05558407A1DA15EFD31970E0C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB05556A7B4E0C14103E442714C3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <PR3P195MB0555FBD69A0A93D2270BA6EEC3749@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <ab2fa14b-e749-6e57-ac8f-285da3b13ed1@linux.ibm.com>
In-Reply-To: <ab2fa14b-e749-6e57-ac8f-285da3b13ed1@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pliops.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P195MB0555:EE_|PAXP195MB1509:EE_
x-ms-office365-filtering-correlation-id: aca47aa0-9346-4072-0358-08db5388f070
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K367t23cOGFeSUeDoR5J7sYzq0BLk5pk9IiehOOL/YUnQImGXoNZ3zCi2LCleOiTSeM1RLcnOqOh2ehVwlGS7UNCGu+V8MnlY8w0oZhtGERgJIUm47KHv8dl+MncZuiP/pr4Qn7jUSSrvawnhV3y+IsvSkrxdAqAkZMzYSN118vEABktl1CQGJllMqdJIE0xB9gcEfOcDE4o/y6M5d4ivpmuznZbozzVbkn+f1oFZFMa/83PcfExo7OuUlAOn9PAcVJ955jZYz/DoF5CEC+rWip+CmzqdlMc/5VEx0PlFPNtUr5QpTqsSNzTmIuQChSZaHSUJh2vzhypDcABgLEgRU6qsMwdtv+rjiNIuBXuwXBQQeEhxYMgTB3Sq0CAVoJNAp2OH/xzFt2USEcxk4mXZLGRc55q+MZYwvg0wXcRZ7vsEUoQs+kKpdCfqCFGSKS7GYLwyoJOWO87CnRlzqDQhBRekOXYfCqJAGuTSyWdv1Ofwyi8P0X6DvWo5hv5bx1AQo7eq+qqAE8oNjqq9d0x3YN6aSu5jziLsuoEM/KsqBrTpp+ZQ+x+y2hZ+SgdhaCwU8JYD/H5gDXly1S0vdPNaVRwMzu5uqAYKl3lNyLVi+I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P195MB0555.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39830400003)(376002)(346002)(366004)(451199021)(41300700001)(33656002)(66899021)(478600001)(52536014)(5660300002)(71200400001)(6506007)(9686003)(55016003)(26005)(53546011)(7696005)(16799955002)(186003)(38100700002)(966005)(316002)(38070700005)(66446008)(66476007)(66556008)(64756008)(66946007)(4326008)(4001150100001)(30864003)(2906002)(83380400001)(76116006)(122000001)(86362001)(8936002)(110136005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akEwTTRsOUdnRjdwdHdMREpsL3lKN05SdS9SUndJVW40MlhCcFV6SVI3NkN4?=
 =?utf-8?B?NlY5MjJUTjFKMnVaZk92Uk9Qc3Z4QWp0MCtVOWN0YnZvWi94Rmd5STlvRDJM?=
 =?utf-8?B?a28yOTQ3VXNscjllcGRyc1I5Q0tONGlrenB2QTg4MjdCVWllVCtWQjJDcjNY?=
 =?utf-8?B?cjFweEI2Vzg5aU9XcExLNXNlaHU5QnlaQWJTaThDekx1YkZSTG5CTnU2MVhL?=
 =?utf-8?B?NkVSYVRWYUFlWmlHREVCQk5lVVdoemp5aWlqVWVGSEUyQkxtTE1nSEdYN25M?=
 =?utf-8?B?L0FiRTJ5VC9zV2YrNk9CdGhMMkJYRFYyMHlFZ0QrejRUWnMzWS9SZjNtR0lZ?=
 =?utf-8?B?M0ZjM0t6dEpPRDBWaHVEaFdIcG84UlpHVnpuaVM1M2xVWDVQYmsxaE1HZjJp?=
 =?utf-8?B?TVRxTmRSakhWbFR6SW45MGhENXowNnhxL0p5dHdtYU9VV3dkV0ZXRmpkL2pr?=
 =?utf-8?B?WkJBdFA3V3JKYkErakJjeDBCR0tuYjA0b09nYysvMG5qRXJVL0pwejhwSWNQ?=
 =?utf-8?B?SUt0elJnemxpYmxDMExPYnFLQnJQQVJKZnFjME83d0ZJdzVpSlNER2JOSTl1?=
 =?utf-8?B?RzdVRUY0RVlwenN3VHJPS2Y3d0xBcTU2Y2Z6eGdKYkFYMUNMOXlOWHRZcmN0?=
 =?utf-8?B?RVN4bUVzWmVtZitoS3BBYk50anFRZ1M0bWYzQWNselA3ZW5mZnpEbzRkZit2?=
 =?utf-8?B?VkNtNFdneW05L0FTaW1HUThHZnFSWlFXa1AzUU1XQVI0ZjQ1b2VMWW5pUE83?=
 =?utf-8?B?T1JRdDh1d25HYjF2OFIrYTFQUFo3MmZhd3ZOVG9ZSzMyRjVHSERFMXl5c3lv?=
 =?utf-8?B?YUtWdzJ3Q3FKcmYwTUdvOVlnT28yV3ZUaER5c2l5SUR2OENxRFFuYTZnbFlD?=
 =?utf-8?B?K1JPaHNOWFFtbUlHRHNOdzl5M3R3Ym5EbS9uakJoT3JjaDNuNHNocVpMRk13?=
 =?utf-8?B?VXprMnNqRkRWaTI5eXdObjJqQk13M29sUzFVcVRuUWxOcWVnVEpTTS81VkJz?=
 =?utf-8?B?S2VlU3ZtaUxmZndNZkNkb1BROVdsbkF4aVFFK29JdllDNlRFN3Nod1kzS3hX?=
 =?utf-8?B?NzRGUFRGUGwyUTZGUHBwM0paVlQ4KzZWNlk1NFd3R1dFcjRSNmtUU2pHeHVu?=
 =?utf-8?B?T3JrRUx3NDNBVXFEQlNMOVpQeDdlbGtkTTBXc3diZi9GN1JxRmtXaHYwenY1?=
 =?utf-8?B?dlh4MUF5dnpOMUM1cFovUzdEUHJXQlZ4aGFVMGJxU3EzZzQyeWNJV0tDNXY5?=
 =?utf-8?B?VjZLS0g0ZHV5bklWampvT0g0dE9BYWZFY1RRbEdMTDU5RXJzb3RQKzJGSnV3?=
 =?utf-8?B?L1U1TzQyQnBaL2habW9tblFVeGJCdG5yT0VWdWRwbitaVjBldTA4eDBOY1dt?=
 =?utf-8?B?Q1cvc3NEbjBXTlpWUFhVTEh3ZkpCb2xMZ3JTbklsWG9mdUpFdmFXeVlwTGt3?=
 =?utf-8?B?aXhnbm5oNUdjQkExTFA1UFZpTmd0dTlTUmg1VTNIVE1hek1jVUtTRXNpd2Zm?=
 =?utf-8?B?Ync4dFBVVUlqSWxzNE5LaTU5ZjFSK3JubEM3b0E3cmRUMDQyaldObTVYcmZR?=
 =?utf-8?B?MWRPZlhaZUkvWGtxZFdSYjJtbEg4YkNISjlabW1yaXVvNVNXOWxpWWRwTHpi?=
 =?utf-8?B?S2pJM1c4Y2RwbVdXeUhwdnpvVkttNWZCSGVXdTljdGdweDBEWlh0NUthNDMy?=
 =?utf-8?B?K3hMWGI2S3ZZcWQzb2RwSWprdHIxQ0gwL1FxdEFMazFSZnAzaDVkV1p5VWhN?=
 =?utf-8?B?TE1jS2RjMkM0dXZtQTZQdDlqbUR5VFNmVFg1Rk1iSVducUdsRytwOWdIa1Mz?=
 =?utf-8?B?TzVvak1pR3lWV3JXS2k4L2lUaFp1K01JZkNqemtGaWYvbEhYZmxTMWNzZGpW?=
 =?utf-8?B?NFVRVFF2SkVHaWFqSmVybjZCWVF5MzZFSnJDQkNoVWZRNE14UEJtaENTNFky?=
 =?utf-8?B?VTJ2Uk5xb2ZqaE1wd3lpOE1RakNPQWtPM040YTkreTBudmwwc2RrWmtPRkYv?=
 =?utf-8?B?eVFoY2VPcHJ3RHNsUFl3cEJBWjZKcTM1aElyRmtLcnRNdzh6ODR1UkpoenhI?=
 =?utf-8?B?WjBadjZSOUFYdXdNb01ueGlyREc5WE5ZcUtWNG8xOHloZUx6dlkwazdDQ0Mv?=
 =?utf-8?Q?GS98=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: pliops.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aca47aa0-9346-4072-0358-08db5388f070
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 08:06:21.7165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40fe8f47-55ac-403a-a5ab-1be3dd209cf8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+wyWFtHZE8F51E0tc1VLiGCJCyxlEFkdlQRKZmL3pzK0L1XSIAwQBNWoCeLF9r4F17w0ciaR7HO1g4Cw7pqYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1509
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIFN0ZWZhbiwNCg0KSSB0aGluayB0aGUgaXNzdWUgd2FzIFlvY3RvIHJlbGF0ZWQgYXMg
dGhlIG1ldGEtcG9ydHdlbGwgbGF5ZXIgSSB3YXMgcG9ydGluZyBjYW1lIGZyb20gYW4gb2xkZXIg
KH4xOCBtb250aHMgYWdvKSB2ZXJzaW9uIG9mIE9wZW5CTUMuDQpPbiB0aGUgb2xkZXIgdmVyc2lv
biwgZXZlbiB0aG91Z2ggMiBsYXllcnMgKG1ldGEtYXNwZWVkIGFuZCBtZXRhLXBvcnR3ZWxsKSBo
YWQgdGhlIHNhbWUgZmlsZSAobGludXgtYXNwZWVkX2dpdC5iYikgaXQgdG9vayB0aGUgY29ycmVj
dCBvbmUgYW5kIHRoZSBwYXRjaCB3YXMgYXBwbGllZC4NCk9uIHRoZSBsYXRlc3QgdmVyc2lvbiwg
Zm9yIHNvbWUgcmVhc29uLCBpdCB0b29rIHRoZSBvbmUgZnJvbSBtZXRhLWFzcGVlZC4NClRvIGZp
eCB0aGF0IEkganVzdCByZW5hbWVkIHRoZSBtZXRhLXBvcnR3ZWxsIGZpbGUgdG8gYmUgbGludXgt
YXNwZWVkXyUuYmJhcHBlbmQNCg0KSSB1bmRlcnN0YW5kIG5vdyB3aHkgbWFudWFsIHBhdGNoIGRp
ZG4ndCB3b3JrLg0KU2ltcGx5IGJlY2F1c2Ugb3RoZXIgc2V0dGluZyB3ZXJlIG5vdCBiZWluZyBh
cHBsaWVkIHRvbyBhbmQgdGhhdCBhbHNvIGluY2x1ZGUgdGhlIC5jb25maWcuDQoNCkNoZWVycywN
Ckxpb3IuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGVmYW4gQmVyZ2Vy
IDxzdGVmYW5iQGxpbnV4LmlibS5jb20+IA0KU2VudDogRnJpZGF5LCBNYXkgMTIsIDIwMjMgNzoy
OCBQTQ0KVG86IExpb3IgV2VpbnRyYXViIDxsaW9yd0BwbGlvcHMuY29tPjsgQW5kcmV3IEplZmZl
cnkgPGFuZHJld0Bhai5pZC5hdT47IFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2tAc3R3Y3gueHl6
PjsgUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQpDYzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogT3BlbkJNQyBwb3J0aW5nIHRvIHBvcnR3ZWxsIHBj
b21jNjYwLWFzdDI2MDAgZGV2aWNlLg0KDQpDQVVUSU9OOiBFeHRlcm5hbCBTZW5kZXINCg0KT24g
NS8xMS8yMyAxNjo0OCwgTGlvciBXZWludHJhdWIgd3JvdGU6DQo+IFdlbGwsIFlvY3RvIGlzIGEg
dHJpY2t5IGJ1aWxkIHN5c3RlbSBmb3IgbmV3YmllcyDimLkgSSB0aG91Z2h0IEkgZm91bmQgDQo+
IHNvbWV0aGluZyBidXQgdGhlbiBzYXcgc29tZXRoaW5nIGVsc2UgdGhhdCBJIGNhbm5vdCBleHBs
YWluLi4uDQo+DQo+IDEuDQo+IEkgbWFuYWdlZCB0byBidWlsZCBpdCBzdWNjZXNzZnVsbHkgYWZ0
ZXIgY2QgaW50byB0bXAvd29yay1zaGFyZWQvcGNvbWM2NjAtYXN0MjYwMC9rZXJuZWwtc291cmNl
LCBnaXQgcHVsbCBhbmQgZ2l0IGFwcGx5IHBhdGNoIDAwMDEtcGNvbWM2NjAtYXN0MjYwMC5wYXRj
aC4NCj4gVGhlbiBnbyBiYWNrIHRvIGV4ZWN1dGUgYml0YmFrZSBvYm1jLXBob3NwaG9yLWltYWdl
Lg0KPiBGdXJ0aGVyIGludmVzdGlnYXRpb24gc3VnZ2VzdGVkIHRoYXQgdGhlIG1ldGEtcG9ydHdl
bGwgbGF5ZXIgd2FzIHVzaW5nIHRoZSBZb2N0byBpbmNvcnJlY3RseSAob3IgaXQgbWlnaHQgYmUg
aG93IFlvY3RvIHVzZWQgdG8gd29yayAxOCBtb250aHMgYWdvPykuDQo+IFRoZSBpc3N1ZSB3YXMg
dGhhdCB0aGVpciBsaW51eC1hc3BlZWRfZ2l0LmJiIHdhcyBwcm9iYWJseSBpZ25vcmVkIGFuZCB0
aGF0IGV4cGxhaW5zIHdoeSB0aGUgcGF0Y2ggd2FzIG5ldmVyIGFwcGxpZWQuDQo+IDIuDQo+IENv
cGllZCB0aGUgc3ludGF4IG9mIGxpbnV4LWFzcGVlZF8lLmJiYXBlbmQgZnJvbSBtZXRhLWlibSBh
bmQgYWZ0ZXIgYXBwbHlpbmcgaXQgdG8gdGhlIHBvcnR3ZWxsIGxheWVyIHRoaW5ncyBzdGFydGVk
IHRvIGhhcHBlbi4NCj4gSSBnb3QgY29tcGlsYXRpb24gZXJyb3JzIG9uIGFzcGVlZC1nNi1wd20t
dGFjaG8uYyBhbmQgYWZ0ZXIgc29tZSBkaWdnaW5nIEkgZm91bmQgdGhhdCAxMiBtb250aHMgYWdv
IHRoZSBBUEkgb2YgUFdNIHdhcyBjaGFuZ2VkIGFuZCB0aGlzIGNhdXNlZCB0aGUgZXJyb3JzLg0K
PiAobGludXggY29tbWl0IDA4MjljMzVkYzUzNDZlOTBmNDI4ZGU2MTg5NjM2MmI1MWFiNTgyOTY6
IHB3bTogRHJvcCANCj4gc3VwcG9ydCBmb3IgbGVnYWN5IGRyaXZlcnMpIEFmdGVyIGZpeGluZyB0
aGUgY29tcGlsYXRpb24gZXJyb3JzIEkgY291bGQgYnVpbGQgYWdhaW4uDQo+DQo+IFN0aWxsIEkg
aGF2ZSBubyBjbHVlIHdoeSBhZnRlciBtYW51YWxseSBhcHBseWluZyB0aGUgcGF0Y2ggKCMxKSBJ
IGRpZG4ndCBnZXQgdGhlIGNvbXBpbGF0aW9uIGVycm9ycy4NCg0KSXMgdGhlIGZpbGUgeW91IGFy
ZSBwYXRjaGluZyBhY3R1YWxseSBiZWluZyBjb21waWxlZD8gQXJlIHRoZSBjb25maWcgb3B0aW9u
cyB0aGF0IG5lZWQgdG8gYmUgc2V0IGluIC5jb25maWcgdG8gaGF2ZSB0aGUgZmlsZSBjb21waWxl
ZD8gSSBmaW5kIG15IC5jb25maWcgZmlsZSBoZXJlOg0KDQpidWlsZC9ldmItYXN0MjYwMC90bXAv
d29yay9ldmJfYXN0MjYwMC1vcGVuYm1jLWxpbnV4LWdudWVhYmkvbGludXgtYXNwZWVkLzYuMS4x
NStnaXRBVVRPSU5DKzU4MDYzOWE5NzMtcjAvbGludXgtZXZiX2FzdDI2MDAtc3RhbmRhcmQtYnVp
bGQvLmNvbmZpZw0KDQpBbGwgdGhlIG9iamVjdCBmaWxlcyBmcm9tIGNvbXBpbGluZyB0aGUga2Vy
bmVsIGFyZSBsb2NhdGVkIGhlcmUgb24gbXkgbWFjaGluZSBhbmQgSSBzb21ldGltZXMgY2hlY2sg
d2hldGhlciB0aGV5IHdlcmUgY29tcGlsZWQgdXNpbmcgJ2ZpbmQgPHBhdGg+IHwgZ3JlcCA8bW9k
dWxlIG5hbWU+Jy4NCg0KYnVpbGQvZXZiLWFzdDI2MDAvdG1wL3dvcmsvZXZiX2FzdDI2MDAtb3Bl
bmJtYy1saW51eC1nbnVlYWJpL2xpbnV4LWFzcGVlZC82LjEuMTUrZ2l0QVVUT0lOQys1ODA2Mzlh
OTczLXIwL2xpbnV4LWV2Yl9hc3QyNjAwLXN0YW5kYXJkLWJ1aWxkLw0KDQogICBDaGVlcnMsDQog
ICAgIFN0ZWZhbg0KDQo+IFRoYW5rcyBmb3IgbGlzdGVuaW5nIPCfmIoNCj4gQ2hlZXJzLA0KPiBM
aW9yLg0KPg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW9yIFdl
aW50cmF1Yg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDExLCAyMDIzIDY6MDYgUE0NCj4gVG86IEFu
ZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQYXRyaWNrIFdpbGxpYW1zIA0KPiA8cGF0
cmlja0BzdHdjeC54eXo+OyBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4g
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSRTogT3BlbkJNQyBwb3J0
aW5nIHRvIHBvcnR3ZWxsIHBjb21jNjYwLWFzdDI2MDAgZGV2aWNlLg0KPg0KPiBBZnRlciBmaXhp
bmcgdGhlIHBhdGNoICh2ZXJpZmllZCBpdCBjYW4gYmUgYXBwbGllZCB3aXRob3V0IGVycm9ycyBv
bnRvIGxpbnV4IGJyYW5jaCA2LjEpIEkgd2FzIHN0aWxsIGdldHRpbmcgdGhlIGVycm9yLg0KPiBJ
IGZvdW5kIHRoYXQgdGhlIHBhdGNoIHdhcyBuZXZlciBhY3R1YWxseSBhcHBsaWVkIChjb3VsZCBl
eHBsYWluIHdoeSBiaXRiYWtlIGRpZG4ndCBjb21wbGFpbiBhYm91dCB0aGUgZXJyb3JzKS4NCj4g
UGFydCBvZiB0aGUgcGF0Y2ggd2FzIGFkZGluZyBhIG5ldyBmaWxlIHBjb21jNjYwLWFzdDI2MDAu
ZHRzIGJ1dCBpdCB3YXNuJ3QgZm91bmQgb24gdG1wL3dvcmstc2hhcmVkL3Bjb21jNjYwLWFzdDI2
MDAva2VybmVsLXNvdXJjZS9hcmNoL2FybS9ib290L2R0cy4NCj4gU28gSSBzdXNwZWN0IHNvbWV0
aGluZyBpcyB3cm9uZyB3aXRoIHRoaXMgU1JDX1VSSSBsaW5lOg0KPg0KPiBLQlJBTkNIID89ICJk
ZXYtNi4xIg0KPiBMSU5VWF9WRVJTSU9OID89ICI2LjEuMTUiDQo+IFNSQ1JFVj0iNTgwNjM5YTk3
MzQwNjY5MWZhOTNiOGZhMzc3YzRjNWE0M2Y2NjA5NCINCj4gU1JDX1VSSTphcHBlbmQgPSAiIGZp
bGU6Ly8wMDAxLXBjb21jNjYwLWFzdDI2MDAucGF0Y2giDQo+IHJlcXVpcmUgbGludXgtYXNwZWVk
LmluYw0KPg0KPiBJIGFsc28gdHJpZWQgdXNpbmcNCj4gU1JDX1VSSSArPSAiZmlsZTovLzAwMDEt
cGNvbWM2NjAtYXN0MjYwMC5wYXRjaCIgb3INCj4gU1JDX1VSSTphcHBlbmQ6cGNvbWM2NjAtYXN0
MjYwMCA9ICIgZmlsZTovLzAwMDEtcGNvbWM2NjAtYXN0MjYwMC5wYXRjaCINCj4NCj4gYnV0IHN0
aWxsIGl0IHNlZW1zIHRoYXQgdGhlIHBhdGNoIHdhc24ndCBhcHBsaWVkLg0KPiBBbnkgdGhvdWdo
dHM/DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExpb3IgV2VpbnRy
YXViDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTEsIDIwMjMgMToyNyBQTQ0KPiBUbzogQW5kcmV3
IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBhdHJpY2sgV2lsbGlhbXMgDQo+IDxwYXRyaWNr
QHN0d2N4Lnh5ej47IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiBDYzog
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJFOiBPcGVuQk1DIHBvcnRpbmcg
dG8gcG9ydHdlbGwgcGNvbWM2NjAtYXN0MjYwMCBkZXZpY2UuDQo+DQo+IEkgdGhpbmsgSSBoYXZl
IGEgY2x1ZSB3aGF0IHRoZSBpc3N1ZSBpcyAoc3RpbGwgbm8gc29sdXRpb24pLg0KPiBJIHRvb2sg
dGhlIExpbnV4IGtlcm5lbCBkZXYtNi4xIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
bGludXggaW50byBhIHNlcGFyYXRlIGZvbGRlciBhbmQganVzdCB0cmllZCB0byBhcHBseSB0aGUg
UG9ydHdlbGwgcGF0Y2ggbWFudWFsbHk6DQo+IGVycm9yOiBwYXRjaCBmYWlsZWQ6IGFyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1nNi5kdHNpOjMwNA0KPiBlcnJvcjogYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWc2LmR0c2k6IHBhdGNoIGRvZXMgbm90IGFwcGx5DQo+IGVycm9yOiBwYXRjaCBmYWls
ZWQ6IGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1oY2QuYzo2MzQNCj4gZXJyb3I6IGRyaXZlcnMvdXNi
L2hvc3QvZWhjaS1oY2QuYzogcGF0Y2ggZG9lcyBub3QgYXBwbHkNCj4gZXJyb3I6IHBhdGNoIGZh
aWxlZDogZHJpdmVycy91c2IvaG9zdC9laGNpLmg6MjE4DQo+IGVycm9yOiBkcml2ZXJzL3VzYi9o
b3N0L2VoY2kuaDogcGF0Y2ggZG9lcyBub3QgYXBwbHkNCj4NCj4gMS4gSSB3aWxsIHRyeSB0byBm
aW5kIHdoYXQgY2F1c2VzIHRoZXNlIGVycm9ycyAyLiBJIHdvbmRlciB3aHkgKG1heWJlIGl0IGlz
IGEgWW9jdG8gcXVlc3Rpb24pIHRoZXJlIGlzIG5vIGluZGljYXRpb24gdG8gdGhpcyBmYWlsIGR1
cmluZyB0aGUgYml0YmFrZSBwaGFzZS4NCj4NCj4gQ2hlZXJzLA0KPiBMaW9yLg0KPg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW9yIFdlaW50cmF1Yg0KPiBTZW50OiBU
aHVyc2RheSwgTWF5IDExLCAyMDIzIDEyOjQ2IFBNDQo+IFRvOiBBbmRyZXcgSmVmZmVyeSA8YW5k
cmV3QGFqLmlkLmF1PjsgUGF0cmljayBXaWxsaWFtcyANCj4gPHBhdHJpY2tAc3R3Y3gueHl6Pjsg
UnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+IENjOiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCj4gU3ViamVjdDogUkU6IE9wZW5CTUMgcG9ydGluZyB0byBwb3J0d2VsbCBw
Y29tYzY2MC1hc3QyNjAwIGRldmljZS4NCj4NCj4gSGksDQo+DQo+IFBvcnR3ZWxsIHN1cHBvcnQg
aGVscGVkIHJlc29sdmluZyB0aGUgdS1ib290IGNvbXBpbGF0aW9uIGVycm9yIHdpdGggdGhpcyBt
b2RpZmljYXRpb24gb24g4oCcbWV0YS1wb3J0d2VsbC9tZXRhLXBjb21jNjYwLWFzdDI2MDAvcmVj
aXBlcy1ic3AvdS1ib290L3UtYm9vdC1hc3BlZWQtc2RrXzIwMTkuMDQuYmJhcHBlbmTigJ0NCj4N
Cj4gRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJUn0vJHtQTn06Ig0KPiBTUkNS
RVYgPSAiNDRhOGM2MThjMTIxNWUwZmFhYzBmMzM1ZjBhZmQ1NmVkNDI0MGU3NiINCj4gU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtMjAyMS0xMS0xOC1BZGQtUENPTS1DNjYwLUFTVDI2MDAtdS1ib290
LXN1cHBvcnQucGF0Y2giDQo+IFNPQ1NFQ19TSUdOX0VOQUJMRSA9ICIwIg0KPg0KPiBOb3cgdGhl
cmUgaXMgYW5vdGhlciBlcnJvcjoNCj4gbWFrZVsxXTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJn
ZXQgJ2FyY2gvYXJtL2Jvb3QvZHRzL3Bjb21jNjYwLWFzdDI2MDAuZHRiJy4gIFN0b3AuDQo+DQo+
IFBvcnR3ZWxsIGhhdmUgYSBwYXRjaCB3aXRoIHBjb21jNjYwLWFzdDI2MDAuZHRzIHNvIEkgYW0g
bm90IHN1cmUgd2h5IGl0IHdhcyB3b3JraW5nIG9uIGtlcm5lbCB2ZXJzaW9uIDUuMTggYW5kIG5v
dCBvbiA2LjEuDQo+IFRoZSBwYXRjaCBpcyBsb2NhdGVkIG9uOiANCj4gaHR0cHM6Ly9naXRodWIu
Y29tL3dsYmU0L29wZW5ibWMvYmxvYi9wb3J0d2VsbC9tZXRhLXBvcnR3ZWxsL21ldGEtcGNvbQ0K
PiBjNjYwLWFzdDI2MDAvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtYXNwZWVkLzAwMDEtMjAy
MS0xMS0xOC1BZGQtUGNvDQo+IG0tQzY2MC1BU1QyNjAwLXN1cHBvcnQucGF0Y2ggVGhlIGxpbnV4
LWFzcGVlZF9naXQuYmIgZmlsZSB0aGF0IGFkZHMgDQo+IHRoaXMgcGF0Y2ggaXMgbG9jYXRlZCBv
bjogDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS93bGJlNC9vcGVuYm1jL2Jsb2IvcG9ydHdlbGwvbWV0
YS1wb3J0d2VsbC9tZXRhLXBjb20NCj4gYzY2MC1hc3QyNjAwL3JlY2lwZXMta2VybmVsL2xpbnV4
L2xpbnV4LWFzcGVlZF9naXQuYmINCj4NCj4gSSdtIHdhaXRpbmcgZm9yIFBvcnR3ZWxsIHN1cHBv
cnQgYnV0IGlmIHlvdSBoYXZlIGFuIGlkZWEgd2hhdCBjYW4gYmUgDQo+IHRoZSByZWFzb24g8J+Y
ig0KPg0KPiBDaGVlcnMsDQo+IExpb3IuDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IExpb3IgV2VpbnRyYXViDQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMTcsIDIwMjMg
OTo1NSBBTQ0KPiBUbzogJ0FuZHJldyBKZWZmZXJ5JyA8YW5kcmV3QGFqLmlkLmF1PjsgUGF0cmlj
ayBXaWxsaWFtcyANCj4gPHBhdHJpY2tAc3R3Y3gueHl6PjsgUnlhbiBDaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVj
dDogUkU6IE9wZW5CTUMgcG9ydGluZyB0byBwb3J0d2VsbCBwY29tYzY2MC1hc3QyNjAwIGRldmlj
ZS4NCj4NCj4gSGkgQW5kcmV3LA0KPg0KPiBUaGUgQVNUMjYwMCBEZXZlbG9wbWVudCBraXQgZnJv
bSBQb3J0d2VsbCBjb21lcyB3aXRoIGEgc2xpZ2h0bHkgb2xkIHZlcnNpb24gb2YgT3BlbkJNQy4N
Cj4gVGhlIHNvdXJjZXMgY2FtZSBhcyBhIHRhci54eiBmaWxlIGFuZCBjb3VsZCBiZSBkb3dubG9h
ZGVkIGZyb206IA0KPiBodHRwczovL3d3dy5kcm9wYm94LmNvbS9zL3QybmIxMW1rdW9pc2owcy9Q
Q09NLUM2NjAtQVNUMjYwMF9CU1BfMjAyMTEyDQo+IDEwLnRhci54ej9kbD0wDQo+DQo+IFdoYXQg
SSB0cnkgdG8gZG8gaXMgdG8gZ2V0IHRoZSBsYXRlc3QgT3BlbkJNQyBjb2RlYmFzZSBhbmQgaW50
ZWdyYXRlIG1ldGEtcG9ydHdlbGwgbGF5ZXIgZnJvbSB0aGUgb2xkIHNvdXJjZXMgKGRhdGVkIGZy
b20gRGVjLiAyMDIxKS4NCj4gSWYgeW91IHRha2UgYSBsb29rIG9uIHRoZSAzIGxhc3QgY29tbWl0
cyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS93bGJlNC9vcGVuYm1jL3RyZWUvcG9ydHdlbGwsIHlv
dSBjYW4gc2VlIG15IG1pZ3JhdGlvbiBhdHRlbXB0Lg0KPg0KPiBJIGhhdmUgdXBncmFkZWQgdGhl
IGxpbnV4LWFzcGVlZCB2ZXJzaW9uIHRoZXkgdXNlZCAoNS4xMC42NykgdG8gNi4xLjE1IGJ1dCBs
ZWZ0IHRoZWlyIHBhdGNoIGFzIGl0IGluY2x1ZGVzIHRoZSBkZXZpY2UgdHJlZSBmb3IgdGhlaXIg
cGxhdGZvcm0uDQo+IEkgaGF2ZSByZW1vdmVkIHRoZSBwYXRjaCB0aGV5IGhhZCBmb3IgdS1ib290
LWFzcGVlZC1zZGsgYXMgYW4gYXR0ZW1wdCB0byBzb2x2ZSB0aGUgZXJyb3JzIEkgZ290IGV2ZW4g
dGhvdWdoIEkgdGhpbmsgdGhpcyBwYXRjaCBtaWdodCBiZSBuZWVkZWQuDQo+DQo+IFRoZSBjdXJy
ZW50IGJ1aWxkIGVycm9yIHdpdGggdS1ib290LWFzcGVlZC1zZGsgaXM6DQo+IGJ1aWxkL3Bjb21j
NjYwLWFzdDI2MDAvdG1wL3dvcmsvcGNvbWM2NjBfYXN0MjYwMC1vcGVuYm1jLWxpbnV4LWdudWVh
YmkvdS1ib290LWFzcGVlZC1zZGsvMV92MjAxOS4wNCtnaXRBVVRPSU5DK2ZkOTE1NzI4ZTEtcjAv
Z2l0L2xpYi9zbWJpb3MuYzo4NDo1ODogZXJyb3I6ICdVX0JPT1RfRE1JX0RBVEUnIHVuZGVjbGFy
ZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiAgICAgODQgfCAgICAgICAgIHQtPmJp
b3NfcmVsZWFzZV9kYXRlID0gc21iaW9zX2FkZF9zdHJpbmcodC0+ZW9zLCBVX0JPT1RfRE1JX0RB
VEUpOw0KPg0KPiBSZWdhcmRpbmcgdGhlIGVycm9ycyBJIGhhZCB3aXRoIG9ibWMtY29uc29sZToN
Cj4gRVJST1I6IA0KPiAvbWVkaWEvZGF0YS93b3Jrc3BhY2Uvb3BlbmJtYy9vcGVuYm1jLWZvcmsv
bWV0YS1waG9zcGhvci9yZWNpcGVzLXBob3NwDQo+IGhvci9jb25zb2xlL29ibWMtY29uc29sZV9n
aXQuYmI6IFVuYWJsZSB0byBnZXQgY2hlY2tzdW0gZm9yIA0KPiBvYm1jLWNvbnNvbGUgU1JDX1VS
SSBlbnRyeSBvYm1jLWNvbnNvbGUuY29uZmZpbGU6IGZpbGUgY291bGQgbm90IGJlIA0KPiBmb3Vu
ZA0KPg0KPiBUaGVpciBvcmlnaW5hbCBjb2RlIGluY2x1ZGVkIGEgYmJhcHBlbmQgZmlsZSBmb3Ig
dGhlIG9ibWMtY29uc29sZToNCj4gRklMRVNFWFRSQVBBVEhTOnByZXBlbmQgOj0gIiR7VEhJU0RJ
Un0vJHtQTn0vOiINCj4gT0JNQ19DT05TT0xFX0hPU1RfVFRZID0gInR0eVMwIg0KPg0KPiBTUkNf
VVJJOnJlbW92ZSA9ICJmaWxlOi8vJHtCUE59LmNvbmYiDQo+IFNSQ19VUkk6YXBwZW5kID0gImZp
bGU6Ly9zZXJ2ZXIudHR5UzAuY29uZiINCj4NCj4gZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+ICAg
ICAgICAgICMgUmVtb3ZlIHVwc3RyZWFtLXByb3ZpZGVkIGNvbmZpZ3VyYXRpb24NCj4gICAgICAg
ICAgcm0gLXJmICR7RH0ke3N5c2NvbmZkaXJ9LyR7QlBOfQ0KPg0KPiAgICAgICAgICAjIEluc3Rh
bGwgdGhlIHNlcnZlciBjb25maWd1cmF0aW9uDQo+ICAgICAgICAgIGluc3RhbGwgLW0gMDc1NSAt
ZCAke0R9JHtzeXNjb25mZGlyfS8ke0JQTn0NCj4gICAgICAgICAgaW5zdGFsbCAtbSAwNjQ0ICR7
V09SS0RJUn0vKi5jb25mICR7RH0ke3N5c2NvbmZkaXJ9LyR7QlBOfS8NCj4gICAgICAgICAgIyBS
ZW1vdmUgdXBzdHJlYW0tcHJvdmlkZWQgc2VydmVyIGNvbmZpZ3VyYXRpb24NCj4gICAgICAgICAg
cm0gLWYgJHtEfSR7c3lzY29uZmRpcn0vJHtCUE59L3NlcnZlci50dHlWVUFSVDAuY29uZg0KPiB9
DQo+DQo+IEkgc3VzcGVjdGVkIHRoYXQgdGhlaXIgcmVtb3ZhbCBvZiAiZmlsZTovLyR7QlBOfS5j
b25mIiB3YXNuJ3Qgd2VsY29tZWQgYnkgdGhlIG9ibWMtY29uc29sZV9naXQuYmIgcmVjaXBlIFNv
IEkganVzdCBjb21tZW50ZWQgaXQgYWxsIG91dCAoZXhjZXB0IGZvciB0aGUgZmlyc3QgbGluZSks
IGNvcGllZCB0aGUgb2JtYy1jb25zb2xlLmNvbmYgYW5kIHRoZSBlcnJvciB3YXMgZ29uZS4NCj4N
Cj4gVGhlaXIgc2VydmVyLnR0eVMwLmNvbmYgZmlsZSBpbmNsdWRlZDoNCj4gbG9jYWwtdHR5ID0g
dHR5UzANCj4gYmF1ZCA9IDExNTIwMA0KPiBTbyBJIGhhdmUgYW5kIGFkZGVkIHRoZSBsb2NhbC10
dHkgbGluZSB0byBteSBvYm1jLWNvbnNvbGUuY29uZiBjb3B5Lg0KPg0KPiBJIGFtIG5vdCBzdXJl
IHRoYXQgdGhlIGNvbnNvbGUgd2lsbCB3b3JrIGFmdGVyIG15IGNoYW5nZXMgYXMgSSBjdXJyZW50
bHkgZG9uJ3QgaGF2ZSB0aGUgYm9hcmQgZm9yIHRlc3RpbmcgKHdpbGwgYXJyaXZlIGluIDIgd2Vl
a3MgdGltZSkuDQo+IFNvIEkgYW0gY3VycmVudGx5IGZvY3VzaW5nIG15IGVmZm9ydHMgb24gbWln
cmF0aW9uIGFuZCBmaXhpbmcgdGhlIGNvbXBpbGF0aW9uIGVycm9ycy4NCj4NCj4gVGhhbmtzIGZv
ciB5b3VyIGhlbHAsDQo+IExpb3IuDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMTcsIDIwMjMgNTo1OCBBTQ0KPiBUbzogTGlvciBXZWludHJhdWIgPGxpb3J3QHBsaW9w
cy5jb20+OyBQYXRyaWNrIFdpbGxpYW1zIA0KPiA8cGF0cmlja0BzdHdjeC54eXo+OyBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZw0KPiBTdWJqZWN0OiBSZTogT3BlbkJNQyBwb3J0aW5nIHRvIHBvcnR3ZWxsIHBjb21jNjYw
LWFzdDI2MDAgZGV2aWNlLg0KPg0KPiBDQVVUSU9OOiBFeHRlcm5hbCBTZW5kZXINCj4NCj4gSGkg
TGlvciwNCj4NCj4gT24gU2F0LCAxNSBBcHIgMjAyMywgYXQgMjA6MDgsIExpb3IgV2VpbnRyYXVi
IHdyb3RlOg0KPj4gSGkgR3V5cywNCj4+DQo+PiBJIGhhdmUgZm9ya2VkIHRoZSBvcGVuYm1jIHBy
b2plY3QgYW5kIG9wZW5lZCBhICJwb3J0d2VsbCIgYnJhbmNoIGZyb20gDQo+PiBpdCdzICJtYXN0
ZXIiLg0KPj4gVGhlIHJlcG8gaXMgdW5kZXI6IGh0dHBzOi8vZ2l0aHViLmNvbS93bGJlNC9vcGVu
Ym1jIEkgYW0gdHJ5aW5nIHRvIA0KPj4gcG9ydCBPcGVuQk1DIGludG8gdGhpcyBib2FyZDoNCj4+
IGh0dHBzOi8vcG9ydHdlbGwuY29tL3NvbHV0aW9ucy9vcGVuQk1DLnBocA0KPj4NCj4+IE15IGZp
cnN0IGNvbW1pdCB0byB0aGlzIGJyYW5jaCB3YXMgdGhlIG9yaWdpbmFsIGNvZGUgb2YgbWV0YS1w
b3J0d2VsbCANCj4+IGxheWVyIGdpdmVuIHRvIG1lIGJ5IFBvcnR3ZWxsIHN1cHBvcnQgKFBDT00t
QzY2MC1BU1QyNjAwX0JTUF8yMDIxMTIxMCkuDQo+PiBUaGUgc2Vjb25kIGNvbW1pdCB0cmllcyB0
byBtaWdyYXRlIG1ldGEtcG9ydHdlbGwgbGF5ZXIgdG8gdGhlIGxhdGVzdCANCj4+IFlvY3RvIHN5
bnRheC4NCj4+DQo+PiBDaGFuZ2VzIGluY2x1ZGUgKGFtb25nIG90aGVycyk6DQo+PiAxLiByZXBs
YWNlIF9hcHBlbmQgd2l0aCA6YXBwZW5kDQo+PiAyLiByZXBsYWNlIF9wcmVwZW5kIHdpdGggOnBy
ZXBlbmQNCj4+IDMuIG1vdmUgYmJsYXllcnMuY29uZi5zYW1wbGUsIGNvbmYtbm90ZXMudHh0IGFu
ZCBsb2NhbC5jb25mLnNhbXBsZSANCj4+IGludG8gdGVtcGxhdGVzL2RlZmF1bHQgZm9sZGVyLg0K
Pj4gNC4gVHJ5IHRvIGZpeCBidWlsZCBlcnJvcnMgb24gdS1ib290IGFuZCBhc3BlZWQtbGludXgg
LSBTdGlsbCB0aGVyZSANCj4+IGFyZSBlcnJvcnMNCj4NCj4gVGhpcyBkb2Vzbid0IGdpdmUgdXMg
YW55IGluc2lnaHQgYXMgdG8gd2hhdCB0aGUgZXJyb3JzIHdlcmUuIENhbiB5b3UgcHJvdmlkZSBt
b3JlIGRldGFpbD8NCj4NCj4+IDUuIFRyeSB0byBmaXggb2JtYy1jb25zb2xlIC0gVGhlIGJ1aWxk
IGVycm9ycyBhcmUgZ29uZSBidXQgbm90IHN1cmUgDQo+PiBpdCB3aWxsIHdvcmsgKG5vIHBsYXRm
b3JtIGZvciB0ZXN0aW5nIHlldCkNCj4NCj4gV2hhdCBidWlsZCBlcnJvcnMgZGlkIHlvdSBzZWU/
DQo+DQo+Pg0KPj4gU29tZSBvZiB0aGUgY2hhbmdlcyB3ZXJlIGp1c3QgYSBzeW50YXggY2hhbmdl
IGJ1dCBzb21lIHJlcXVpcmVzIA0KPj4gZGVlcGVyIHVuZGVyc3RhbmRpbmcuDQo+PiBGZXcgZXhh
bXBsZXMgYXJlIHRoZSBjaGFuZ2VzIGluIG9ibWMtY29uY29sZSwgdS1ib290IGFuZCBhc3BlZWQt
bGludXguDQo+PiBTaW5jZSB0aGUgb3JpZ2luYWwgdmVyc2lvbiBpcyBiYXNlZCBvbiBvbGRlciB1
LWJvb3QgYW5kIGxpbnV4IGtlcm5lbCwgDQo+PiB0aGUgcGF0Y2hlcyBtaWdodCBub3QgYmUgcmVs
ZXZhbnQgYW55bW9yZS4NCj4+DQo+PiBDYW4geW91IHBsZWFzZSByZXZpZXcgdGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIG9uIG15IHJlcG86DQo+PiBtZXRhLXBvcnR3ZWxsL21ldGEtcGNvbWM2NjAtYXN0
MjYwMC9yZWNpcGVzLXBob3NwaG9yL2NvbnNvbGUvb2JtYy1jb24NCj4+IHMNCj4+IG9sZV8lLmJi
YXBwZW5kDQo+DQo+IEl0J3MgaGFyZCB0byBzYXkgd2hldGhlciB0aGF0J3MgY29ycmVjdCBmb3Ig
eW91ciBwbGF0Zm9ybSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnl0aGluZyBvYnZpb3Vz
bHkgd3JvbmcgdGhlcmUuDQo+DQo+PiBtZXRhLXBvcnR3ZWxsL21ldGEtcGNvbWM2NjAtYXN0MjYw
MC9jbGFzc2VzL3NvY3NlYy1zaWduLmJiY2xhc3MNCj4NCj4gQ2FuIHlvdSB1bnBhY2sgd2hhdCB3
ZXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZSBieSBjb3B5aW5nIHNvY3NlYy1zaWduLmJiY2xhc3M/
DQo+DQo+PiBtZXRhLXBvcnR3ZWxsL21ldGEtcGNvbWM2NjAtYXN0MjYwMC9jb25mL21hY2hpbmUv
cGNvbWM2NjAtYXN0MjYwMC5jb24NCj4+IGYgDQo+PiBtZXRhLXBvcnR3ZWxsL21ldGEtcGNvbWM2
NjAtYXN0MjYwMC9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWFzcGVlZC0NCj4+IHMNCj4+IGRr
XzIwMTkuMDQuYmJhcHBlbmQNCj4+IG1ldGEtcG9ydHdlbGwvbWV0YS1wY29tYzY2MC1hc3QyNjAw
L3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWFzcGVlZA0KPj4gXw0KPj4gZ2l0LmJiDQo+DQo+
IEhhdmUgeW91IHRyaWVkIGJ1aWxkaW5nIHdpdGhvdXQgYXBwbHlpbmcgcGF0Y2hlcyB0byB1LWJv
b3QgYW5kIGxpbnV4LWFzcGVlZD8gSXQncyBub3QgY2xlYXIgd2hldGhlciBpdHMgeW91ciBvd24g
cGF0Y2hlcyB0aGF0IGFyZSBicmVha2luZyB0aGUgYnVpbGQgb3IgaWYgc29tZXRoaW5nIGVsc2Ug
aXMgYWZvb3QuDQo+DQo+IEFuZHJldw0K
