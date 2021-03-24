Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C28347003
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 04:13:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4tbQ1R2yz30Fd
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 14:13:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.140.114;
 helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400114.outbound.protection.outlook.com [40.107.140.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4tbC47Y6z2yYw
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 14:12:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEXavjdz3b0RlwQCZpxmp6Lsjw9CLECwCjYaOXe1FqTOfFQn2s15QrbFL7yzpBgIE4o9K5eznOFG0+Y4kTo0Z8FcCJqbNntCg2UkhYA+AF/XQMQedNycXOTo/jg6eKLwx/y4+9EmhuYdzAEyxXSIoBS9N5apbjrWYhROIKIL+A3bs7COrah5PLUJ7pazO7qT0ez37l3pLmLCdB8JqaR2gscshPw0GgcmtAvuxzh4dU2mMacSAE8xg4AULUAY6QGOWHszWHJsuqs7l3z4eb7a84c/Pi6snjuB1m9gXzllheVj3OIs4tuDB1D2BE4zsQ000GMGsi4uGssvBSJBy7TjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEtT+N3ek4gKXErF0vzAjgp/DC2I9LLi/lQZgekFJRY=;
 b=Hk2GI9e7dAOjN64b1wqedAlMSFA6qxT/m8aD3RSjeZ9qDth3lrwyaN16Vm8McQZAVQaBfHSJrnt90aYJM0IME6uYAvkEKwU1MEhQshFDIkaYU0TlYhP2muyIEGYLD+O5VI9/Hx+NJeNEqq+69IuB33HsiYTjrcyo9zudp8klZbWFNmXFHNwyArN39nVae0v5LpU3mFJhG+HlpagGIGojJKd7qSG95bmJGtFgMqPIfXAS/Au2fOb236ZIyXPqSBsKYXGPlhd20pu+g5BOI3TRM3IAaExDj92TTWNf1QqYArCC4U7OzkDi5S2HY2fxsAlsiO5cBgv3+NuE9vh8/rGxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by TYAPR06MB2128.apcprd06.prod.outlook.com (2603:1096:404:1f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 03:12:41 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::59c0:4796:eee4:7ca7]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::59c0:4796:eee4:7ca7%5]) with mapi id 15.20.3977.024; Wed, 24 Mar 2021
 03:12:41 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [Question] u-boot-spl and secure boot support
Thread-Topic: [Question] u-boot-spl and secure boot support
Thread-Index: AdcgWhw0F+W9icTxTqaQ8dxkFaTmDwAAUhBg
Date: Wed, 24 Mar 2021 03:12:40 +0000
Message-ID: <TYZPR06MB40157F38242EA130EBFFE202FC639@TYZPR06MB4015.apcprd06.prod.outlook.com>
References: <TYZPR06MB401518A37630A1C4299E4565FC639@TYZPR06MB4015.apcprd06.prod.outlook.com>
In-Reply-To: <TYZPR06MB401518A37630A1C4299E4565FC639@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9df10680-089c-4b3a-2e7c-08d8ee72af7a
x-ms-traffictypediagnostic: TYAPR06MB2128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR06MB2128AEAB45C684B6F122E1CCFC639@TYAPR06MB2128.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OBloTUPo4qy5cI4XAc8/j9/5lYWGrOQKN/mKOghwKLMgeV7et8Veazyhs+Oj+D3Z4SySw+GLLWDExdmy1Z80QUhAU9Bh8n9Vf1jBcNyF8crGcRVkg8d99QCyHMPaBM5Bet5JIjyx3TxAkWhIv/RruhQn6kAcQmTS1vcack1uqL+HHRs/diwpnYH3irB3U5klSov3KPDZT7VsJxRsf6XtYxn8cH5/GCabi/zZj8W8Cb3iQGM68w5WrE5OS0l0Hm23+68EuMuOjnw2PYnslpVlHnS3osgppDVN8pubAbxRzjMuBpPUIxnrEk5hgnmSmf7zZY0fdZclBpnnhJmIaptea0t9f4VOSXXYMpqhg8yT4tVYcXZ6xBIhrLnhSBH5RZKfTCDGHMlLH6nsZOQbLi//EjlvDKdVfny78jKvTOPxy0XpFx1LancnMZ1p8WWGneCmFrmeiAEc61ZRWk+dmtk+M2NeDWWl5UmGSMmmF12OgPww4oc5ISqTSlODbcKTEVNTXh1ZrPH/JBhBAZ+ryR52YNazHj24goEsIYAaps1HJj9S9CwJZ5yvsNEHY0by+yojsv3CHsrg2kPKYWagwF6zrW504Luc15JHHrlKQLhsBAGsoYm9a8rcrqmF1CP/zDpo0kSnPdwUpWAwByvOzx46MzgYiYz1ZXUuJmSnVjgAgnxyzP9h2OnL/RERh3txStXc1M0Kt4kBDwTcJuQe59vXLCY9WVb3okpzNtRm3cnPLfyScAu04QAp55tTi/n/BMe2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(376002)(366004)(346002)(136003)(6916009)(186003)(316002)(478600001)(107886003)(966005)(26005)(83380400001)(2940100002)(4326008)(86362001)(55016002)(9686003)(6506007)(38100700001)(76116006)(52536014)(5660300002)(53546011)(8936002)(7696005)(8676002)(66446008)(66556008)(66476007)(64756008)(71200400001)(33656002)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?c1M0RC9xOW5XTkFsNUl0dDh6VDNlTFlvbkhLdzRoM2p4OGpKaFNjVC90cmUx?=
 =?utf-8?B?RzJSTGdsNExVTC9qckI1QzJnRDEvaWM4QUFFU2x3TzRDb3dNY0E5Y00yMnM3?=
 =?utf-8?B?RU10d2czbFFWaThqaE8ya2EvcHR5aXV3TklzZzFiN0VqcG5wRUg1V3R3dG9i?=
 =?utf-8?B?NkV5dlBoVGhQbE5IVE9HQ3pKL0JPR1Z4b3ByaDd0cmFSTmpoSnlraThDemds?=
 =?utf-8?B?SGRYWVZVcHJENUFwMTB2OEs0dXIyMFZUSlRmYm1iN3FjSCtncFdnb1lpSXlR?=
 =?utf-8?B?Sm9IMHd6dTBwbm5HcFVTVnpTdmVvZEFQRHEzeXZleVo3d3BPanVaN1JIbVdU?=
 =?utf-8?B?UUpmREp5V0hSUlphdC96WnNqRTJKU1pzR21kL2FQVEdNTVE0MnE3Kzk4SHBi?=
 =?utf-8?B?cXhkYldtL2xZMmt3RVRGbEZkZ0RBdURlTUZyY3htbDhGQjl5VUh3UHJMSU8r?=
 =?utf-8?B?MkFkcnBYVDRaWlA0YUN0TmtiQ1NUWlN5anlDdkMySmt1VnZkSC9ZOVIrM1ht?=
 =?utf-8?B?eC9QRk05WkxQRldOS3d2U2pERHRpUjkveHliWkJBek03OU9uTmNySUpYSzlx?=
 =?utf-8?B?ZENVNHJKTWV6dUtCUlFIdGNWSjRYb3J6QVRGQXowRTF2TzN4VmdYQVp6cUNl?=
 =?utf-8?B?bzgyRklLWnhsOS8vTS9oNnNhMkRBcjh6KzhrcFVKOHgvTDZEM0RaenVXa0dF?=
 =?utf-8?B?Y0lwOVNrRTVHTk5xaThLeDdaUUEwcVRibU45YTVid3ZneDZ0eUNYM1E1cldB?=
 =?utf-8?B?VEY3REw1b3BhUEErTksxUmRLMi9odjBibVBtVThSWCtCdlZDT09pZEdtUGhN?=
 =?utf-8?B?V0hOUG5GUG5LQ2hlVGp3NGg3bFFablczb0NVVVR5OXRBVkdxbGUzL1R0YjZE?=
 =?utf-8?B?Z2FhZi9BNXVDSWE3andNVVp2bC93UWNCdkdoZ3dGRHl3L0ZTeGVaSjdBY3FE?=
 =?utf-8?B?WWNuQjNjMVU5K3ZsUGptWFh5NTFid3hjRlhCNUtyWmtVUHNhY1psREY2ZWtU?=
 =?utf-8?B?c3gwaTVKK0FKaFNVMURYWllhZzQ2enU4S2hoeml5cVR5S1VNZGkrSklEbURG?=
 =?utf-8?B?aWRFMVVzOGdWcHkvZ0VMamhDcDFERTJkMUhBaTJDOXZPaERIaWZXamFjSlVI?=
 =?utf-8?B?Tkl0Mk9YV2VsY1haUmQwRHpNaHpIK2trYWlEVUxleHZzWmIvVVlBcE1VdFN1?=
 =?utf-8?B?bUI4b3VuU0ZPYTJobDNrVDRjT3NtcmQ3eGthMlBnTk5hbjVoY3hIbGdPayt4?=
 =?utf-8?B?YXhySitIakVFdnNIN2ZsQTk2eDdSdXkyRUc1KzBPMWl0MWVkRGJLeGNSY1RY?=
 =?utf-8?B?VWwrVDZkT21HWUJCbmNvbVZXTEtVQ1Y3UTZJYy8vSTcvV2Fla2tFb0xTajQz?=
 =?utf-8?B?ekZzQmxiMWF1ZU13ZWhWeWNsU1lST1I1RHA4cnhIRlViVzRmUUs4bXBBNzJw?=
 =?utf-8?B?U1JmZmxDNkgySGhZY1lZd3N2aG5ab01hczBPUUd1TzN3cTQrWE41S1ozZWhh?=
 =?utf-8?B?MlVwbFhWRy9lank1a1BEV3Jta1gyMEZsWW9CYkNhaDhlSUJlRE9sNFJGTTZa?=
 =?utf-8?B?THZFVi85ZmxIcUFsdUdFMTBXdDU0YWtrenZMbkFGV0lUakJZTUJ1OWFzV3Az?=
 =?utf-8?B?YjRpMW5EdFZra3c0bmlCa0RlYVR2WVkyN1o5VU1sZVNBVjRNcVpCVTVWTDNm?=
 =?utf-8?B?UEVzak1Tbno4N0VaRi9ybUFUS2lGOGs5M09teEJueHBsRlg0ZmY1MEdPMGp1?=
 =?utf-8?Q?jVFVz8F/rQcUdbFq9gAw8gHqXgUipC2tzxSdl22?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df10680-089c-4b3a-2e7c-08d8ee72af7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 03:12:40.8437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H0hOEpNmtJ0uO2O8cdQFU+VdIm5NpmZu2Ykc14wgzd/8gPSVsUvX+vv6E0wi6csMB95DQwx3RoBPidygkjy4zjvwNUuhqgRoaKKpWTDptro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR06MB2128
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

U29ycnkgYW5kIGNoYW5nZSB0aGUgdGV4dCBmb3JtYXQuDQoNCioqKioqKioqKioqKiogRW1haWwg
Q29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KRElTQ0xBSU1FUjoN
ClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5IGNvbnRhaW4gbGVnYWxseSBw
cml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlvdSBo
YXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVw
bHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUtbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRoZSBjb250ZW50cy4gVGhhbmsg
eW91Lg0KDQpGcm9tOiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4gDQpTZW50
OiBXZWRuZXNkYXksIE1hcmNoIDI0LCAyMDIxIDExOjExIEFNDQpUbzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpDYzogSmFtaW4gTGluIDxqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20+DQpTdWJq
ZWN0OiBbUXVlc3Rpb25dIHUtYm9vdC1zcGwgYW5kIHNlY3VyZSBib290IHN1cHBvcnQNCg0KSGkg
YWxsLA0KTWF5IEkgYXNrIHNvbWUgcXVlc3Rpb25zIGFib3V0IHUtYm9vdC1zcGwgYW5kIHNlY3Vy
ZSBib290IGZvciBBU1BFRUQgQVNUMjYwMCBzdXBwb3J0Pw0KDQoxLiBSZWZlciB0byB0aGUg4oCc
ZG9fZ2VuZXJhdGVfc3RhdGlj4oCdIGFuZCDigJxkb19nZW5lcmF0ZV9pbWFnZV91Ym9vdF9maWxl
4oCdIHRhc2tzIGZyb20gaW1hZ2VfdHlwZXNfcGhvc3Bob3IuYmJjbGFzcywgYm90aCB0YXNrcyBz
dXBwb3J0IHRvIGFkZCDigJx1LWJvb3Qtc3BsLiR7VUJPT1RfU1VGRklYfeKAnSBpbiB0aGUgaW1h
Z2UgZmlsZS4NCkhvd2V2ZXIsIEkgZGlkIG5vdCBmaW5kIHRoZSBpbWFnZSBmaWxlIG9mIFVCSSBt
b2RlIGluY2x1ZGUg4oCcdS1ib290LXNwbC5iaW7igJ0gaW4gZG9fbWFrZV91YmkgdGFzay4NCmh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvYmxvYi9tYXN0ZXIvbWV0YS1waG9zcGhv
ci9jbGFzc2VzL2ltYWdlX3R5cGVzX3Bob3NwaG9yLmJiY2xhc3MjTDIxMA0KwqAgwqANCuOAgGRv
X21ha2VfdWJpKCkgew0KwqDCoCDCoMKgwqDCoMKgIyBDb25jYXRlbmF0ZSB0aGUgdWJvb3QgYW5k
IHViaSBwYXJ0aXRpb25zDQrCoMKgwqDCoMKgwqDCoCBta19lbXB0eV9pbWFnZSAke0lNR0RFUExP
WURJUn0vJHtJTUFHRV9OQU1FfS51YmkubXRkICR7RkxBU0hfU0laRX0NCsKgwqDCoMKgwqDCoMKg
IGRkIGJzPTFrIGNvbnY9bm90cnVuYyBzZWVrPSR7RkxBU0hfVUJPT1RfT0ZGU0VUfSBcDQrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWY9JHtERVBMT1lfRElSX0lNQUdFfS91LWJvb3Qu
JHtVQk9PVF9TVUZGSVh9IFwNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZj0ke0lN
R0RFUExPWURJUn0vJHtJTUFHRV9OQU1FfS51YmkubXRkDQrCoMKgwqDCoMKgwqDCoCBkZCBicz0x
ayBjb252PW5vdHJ1bmMgc2Vlaz0ke0ZMQVNIX1VCSV9PRkZTRVR9IFwNCsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZj11YmktaW1nIFwNCsKgwqDCoMKgwqDCoMKgwqDCoCBvZj0ke0lN
R0RFUExPWURJUn0vJHtJTUFHRV9OQU1FfS51YmkubXRkDQrjgIDjgIB9DQrCoMKgwqANCsKgwqDC
oMKgQ2FuIHdlIGNoYW5nZSB0byBhZGQgdS1ib290LXNwbC5iaW4gaW4gdGhlIGltYWdlIGZpbGUg
Zm9yIFVCSSBtb2RlPw0KDQoyLiBSZWZlciB0byB0aGUgaW1hZ2VfdHlwZXNfcGhvc3Bob3IuYmJj
bGFzcywgaXQgdXNlcyB0aGUgaGFyZCBjb2RlIGZpbGVuYW1lIG9mIHUtYm9vdCBhbmQgdS1ib290
LXNwbCBhbmQgaXQgaXMgdmVyeSBkaWZmaWN1bHQgdG8gY2hhbmdlIHRvIHVzZSB0aGUgc2luZ2Vk
IGZpbGVzIG9mIHUtYm9vdC1zcGwgYW5kIHUtYm9vdCBpbiB0aGUgaW1hZ2UgZmlsZS4NCkZvciBl
eGFtcGxlOiANCkkgdHJpZWQgdG8gdXNlIHNvY3NlYyB0b29sIHRvIHNpbmcgdGhlIG9yaWdpbmFs
IHUtYm9vdC1zcGwuYmluIGFuZCB0aGUgZ2VuZXJhdGVkIGZpbGUgd2FzIOKAnHMtdS1ib290LXNw
bC5iaW7igJ0uIEkgd2FudGVkIHRvIGFkZCDigJxzLXUtYm9vdC1zcGwuYmlu4oCdIGluIHRoZSBp
bWFnZSBmaWxlIGFuZCBJIG5lZWRlZCB0byBtb2RpZnkgaW1hZ2VfdHlwZXNfcGhvc3Bob3IuYmJj
bGFzcy4NCkNhbiB3ZSB1c2UgdGhlIHZhcmlhYmxlIG5hbWUgb2YgdS1ib290LXNwbCBhbmQgdS1i
b290IGluc3RlYWQgb2YgaGFyZCBjb2RlIG5hbWluZz8NCkZMQVNIX1VCT09UX1NQTCBfTkFNRSA/
PSDigJx1LWJvb3Qtc3Bs4oCdDQpGTEFTSF9VQk9PX05BTUUgPz0g4oCcdS1ib2904oCdDQoNClRo
YW5rcy1KYW1pbg0KDQoqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2Ug
KioqKioqKioqKioqKioqKioqKioNCkRJU0NMQUlNRVI6DQpUaGlzIG1lc3NhZ2UgKGFuZCBhbnkg
YXR0YWNobWVudHMpIG1heSBjb250YWluIGxlZ2FsbHkgcHJpdmlsZWdlZCBhbmQvb3Igb3RoZXIg
Y29uZmlkZW50aWFsIGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCBpdCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJlcGx5IGUtbWFpbCBhbmQgaW1tZWRpYXRl
bHkgZGVsZXRlIHRoZSBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB3aXRob3V0IGNvcHlpbmcg
b3IgZGlzY2xvc2luZyB0aGUgY29udGVudHMuIFRoYW5rIHlvdS4NCg0K
