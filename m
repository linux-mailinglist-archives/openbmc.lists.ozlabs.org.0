Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBD464B19
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 10:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3vh15P1Bz305j
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 20:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=uUnXUyWL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.255.110;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=uUnXUyWL; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2110.outbound.protection.outlook.com [40.107.255.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3vgX1P5Qz2xsc
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 20:59:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEAPba4P4GqjLdWMXnNbm1H4ecSER7fvzWO4VpFQbQzhjUDChjxy4nY3aRRWDuxYgGm2b70pP0gKXC9jz0TbmwebV+r0HpCudR6KXFByOI24EV0v81NJ1hjgtYI8iuL0pKx9JVFkhw9OrbvgRcuoAReXAzURmTsHRtA24yWRv7IGQW0/gENI1yrj+On2AnqRxbY8DHPe1D7y2VExhVZynyRl5/JxEjzPhvOhrgntSGZ6ZL5sjHyARcByu+fYZo7NeaVwuGX/ZRlTUnFlvcl850bTE4Z+I9NWBxh9W7/dG3PXwoN+6tBip5hctLIjzozAV34C9RTOQqD4SKJEXm0G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D49MdWs21wybUrbF6xEXVM4ExyQMFHdHpXv36OADhb0=;
 b=YUaXFvIfufIbZuSaLckas0NChb7L/z6LKUFz/jd4W4eayCi3oBo8g6FVVrW7bUWNMCKniAe+KjLvXvfQ7iRa5cQQCelVYfNb5o1JECwD7s5f/Qi2eGLFW07l9k2+qaN9WSKm3u2CETLqE+pP00AS1q5RJcEBm+rGNowAWQ1tNr9QEGvg9u5Hqn9SFoW9kGFqMJZ5p56M8CQVtE06cdYG1TQN5C+1omEvi006shJG/RaVghqVO0exZ2Af2CAiAIgIxLXKrMXeGFIpuC1Hu1YlF0wC35XpHgYqMYd4PPG4ADwNTAAEgvnchAzcaOiTuMC1mxA0yoSJYVOZ0sBubJux+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D49MdWs21wybUrbF6xEXVM4ExyQMFHdHpXv36OADhb0=;
 b=uUnXUyWL4lzHFlUdfD09P6NSfhzbpHLF3useOxFYub8/rcgyQh7JZiPX2x3NZYaVCvmsQcvHbAyf1m8hyk+qfBMHdBOXge1obdBpvfwtau3Wou9T1/DEtWj4r6qtkCeF5rXMOu+fgRiGyqbcvk/OXZPQ+hc5ihNEksjpnqTPf28=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK2PR04MB3764.apcprd04.prod.outlook.com (2603:1096:202:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 09:58:41 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c%7]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:58:41 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQ==
Date: Wed, 1 Dec 2021 09:58:41 +0000
Message-ID: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09fbcf27-63c6-4fca-6da3-08d9b4b12769
x-ms-traffictypediagnostic: HK2PR04MB3764:
x-microsoft-antispam-prvs: <HK2PR04MB37643A89D1DF0B7DE065CDD0E4689@HK2PR04MB3764.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mm+y/JqZ08d2/nPVFE1bnviBxQejsxgEbSL0FK8jSBCnz809JshIBhsRi41AyApf8YD3iB8g+JdwaOtfJVcNFjgAL2Po2tuB8cUvVUr5709svLDZvyqUuCRpQqnPTnMh7zFo4hGgpAlRw/ZYOrzFurdLQaoUtN8Ddw0TcxttBvTSHMbCzlgLlcTmCz2klI9ButPG0/0UTGyYWBJ7mpxhNOona65tKoFJrZgPAYBWSgORvb5iFoJJ1wXDEbUGYTA80wlEftB8SQwGfUcgIDTZIXMQ0pNK7iCCcCYeELZyKP362YaK0yIVQfRVojOBN8GGkMZweCFeBJ4j6+n9ED7FuyuOemQQIJZ2hdtsCiBJWg8dTsavjtycMPpbTAEPJ+iWS6SmPldFEbixk/ZNWtjctM4cUPIyCOmEC+lAPnuiPY/XW/dNvbjbEucnPAMxloqYg1m1/IXCI0dXWNSVepDbbYYg3l0MP+XizybWjvMxkQIz5nOziu8grFfwuv3tXEvkXetyqN2nhtei9jL425BHmMYjLFntRnl88fjZGZh3gFDj5nxVMy7wcOEJupedCUjZY0YbzT/xwcQI8uwxiZEiCEeDNqLZcqX/BLaeHeW+GQ6gj7Pb3WF16rUYeonCRRVxnAsX4VpbBruF4Vdfhvj+scJLgqb1lDflZPWLc1iN4DSMnVvdi9SDyejvX40nOuU2hSJMbPY7MON/PLth9IrL8cXM+W0WtDr9CG9cjZcx1tRpYCI0U1BWQuuRYJ612iJce3hKDajhggWF1FqGSNd44oKRMtZwYAcRdVf3CEsXIdM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(66946007)(66476007)(76116006)(186003)(8676002)(107886003)(166002)(85182001)(66556008)(508600001)(122000001)(3480700007)(9686003)(6506007)(86362001)(7696005)(55016003)(64756008)(8936002)(38100700002)(54906003)(6916009)(52536014)(33656002)(2906002)(4326008)(5660300002)(26005)(38070700005)(71200400001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?TDdnN3MwdGQvd1Y5czFQcnhGd2Q3UlBYbTR6ekFPTDcvdFRpOG9FcUdwMExyRHov?=
 =?big5?B?eS9wODRQNTNrNWJUTFlHNExyNTZrQys1eTVzcTYvb2E5TzkrVnVkbG9xTHpKRGh3?=
 =?big5?B?aVcyaEZhZmdQZ01vdXJwZ1o4bk1FbWNBOXNWb3ZlREM2UTJ3WUZhdXc1Y0xjd2Vw?=
 =?big5?B?VDZCbXhyWnRhU2ZTUzh1bmk4ZXZ0WlVhUnVrNlpDdnBrSVF4V3dtUXBpUDByMDYz?=
 =?big5?B?ZnZ4WkdURG9rQkpFNWc4a3JZQ0FLVEtjVVlrT093dE00Nm1Gcmg0ZGt5elhWYjQ1?=
 =?big5?B?WTRoTDNxTzlibmhOMTk4VFFaMlJubmZrUVVqb29aNlRVZHNzTEsrZnJXVTBpSWdr?=
 =?big5?B?Qmd5V1NPOUU1V2M2SDV1aFBxT2xPWWJsVVBwMStmZk1oK21ERW12R056a3dlWVJE?=
 =?big5?B?Qk5SMjMvUTFmeWttU2ptSnhVMVRGMTRXekR4WUlySTRTdjF5c08vRzRjWUV3anVu?=
 =?big5?B?cUI0blljWC9xVDVYR2tUMGk0c1RRZGtxNVVycmdGeXc1ZG5DRGdWMkR1QkI5cFVi?=
 =?big5?B?eDZYZTlSUWNseDB6WEIzbld2OGlQQTVxNVhFS2pmdUpMNzB1SXIxbVBUOUxzRlVJ?=
 =?big5?B?TTNDa2k5ZHlhcWFybDdlWldSOXIvdlFqWnVXQktWMkh1VU9hb2FJTUlPcTgyMURR?=
 =?big5?B?WUM4eU5oUFY4U0Vzc2JDV0pPWUY1cERJMmV5dDFzbDJXNmlDNHc5N2RUSWVZRVpk?=
 =?big5?B?eWtEQlRrdzlDTTRvQXNvNndHN3BrbTY2YWt1d1VyaWlXT3l4aHpBODFNWGRldm1W?=
 =?big5?B?RWFKcWJLQWhnNUpPY3RLOWRlL2xFK0c2K1FrcjdGbkJNSmZsQjI2S3BkdlNxRUtG?=
 =?big5?B?QUdsbTJHRWkxUnZHNWNQWFNoRk4vZ0o5WDkyWXlKMXpyKzc4cXlGR05IWEhxTjJl?=
 =?big5?B?bERCZjRzNWFPZXNSZEN1UTMweUREbEtidGFUcXRRcjUwcUhmRW9WU3Mvd0g5UHlL?=
 =?big5?B?T1k3ei9mS2RTampEODRIYU1YcW9qaVpscGRWcWh6ZG4wSWNDMmdXQVZ1dDNpV2Fq?=
 =?big5?B?dlNrVWR6ME1tVE5FdzZkNk1ZZkczTENCUlRjMU45WmdPbWxHQXR4bGc4N3JLejZj?=
 =?big5?B?RlgrR0JONFdtSFJTTXlIUENGRU96WjFJczN4UXV2U0xTWVFtc2R2TG12ZlRBWGxa?=
 =?big5?B?ZG03VmZ4bWI0aVdiN0VpVWswNU1QYUw3bllTbnBkZkJnM0w0aWxXdEJRL0diNWtw?=
 =?big5?B?blBGYm8vVVhScHNtd2YzR3ZodGdhVU5EWVk3VFZNdzNPQ01zRXMwek1hMVFCcVV5?=
 =?big5?B?SEs4UEpzMWQrRndXUHZXMldXWTcwYmNnMGhadE5pQ0NsdnJSaTlCY2hiV1JCNDk5?=
 =?big5?B?M1hMZ0xNaXR5NzJ6ZUwyUS95cngxeEVXTGxuTUlPK2h1TzFSNjZVRDRwQzJZRWQz?=
 =?big5?B?TU5teUFEQ056UzBGTWVxbDJmY3VwVGcvdjVqKys4UUV0K3V0MERKejFXMFRiTS8y?=
 =?big5?B?cVoyNGlLVVZ2cWM3bndCTjRIcFE5bHJiSkl4VzYwMEZ3ODV2M2VmZFlXTlVKVndM?=
 =?big5?B?NEJ3QVlSVlNJRndSWWJENHdWNy9OdzFQeG1GSWZjNGVFYXpCWEtUUE1XMnFDT0JJ?=
 =?big5?B?UTJxdE93TmlTSHNoOWViWVFDaU14eHgrb1VQd3pHODNKU25TYVkyazIxQ1NEQUhr?=
 =?big5?B?QnJ1dXIyU3AzL2RHZStBUERDSmpsMkFkeEI2bDdVdGE4WW1IMEI4MkRkZm43QWdz?=
 =?big5?B?cDFxNUo4bGZ4SlNUb3RRVGRKU3pFTDhoRnFudlpKb29nK1dIWVkvMTh0Q1ZwNnBU?=
 =?big5?B?Y0ZHV3pVWFhQTmorN1pCN1hVajdKRWNWUnBESWNYNm04QTljbHdxZ1FPQm9sbmtk?=
 =?big5?B?RFpjbjRzbXE2Wm0xMlJXVTRFUVB2VHBlay9lYzAvYWNYT3dvTVNsS1pWMUJNeXlo?=
 =?big5?B?MW0zWFl2VkFlVDNIUzVGa0N0WTE4eVFSQTdSYzRaeXlaWmtEcWozQXo4aW9GeWFQ?=
 =?big5?B?TCtnTU9yakRWWHhhUEp5aHNiNHBwbkg5T093RlUzcG92QlpZbGQzTlBZaFZzcU1w?=
 =?big5?B?cXIwdDVkcUltS29EUG1qVThZR2RmM3FwclFJbkl2eU9PalpyYVE9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB329947E4E37431B956A8D17AE4689HK0PR04MB3299apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fbcf27-63c6-4fca-6da3-08d9b4b12769
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 09:58:41.1238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTpjTsRYdBMTdJkAPLFJIyPZYhlySTyYbjNClIRVZtGeFtgcjGW+ucmE5Nf3SF6sLyYSX3AGF2Mcxj2z5XQl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3764
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
Cc: =?big5?B?TGl0enVuZyBDaGVuICizr6dR2nop?= <Litzung.Chen@quantatw.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB329947E4E37431B956A8D17AE4689HK0PR04MB3299apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQoNCg0KV2Ugd2FudCB0byBpbXBsZW1lbnQgdHdvIG5ldHdvcmsgRXRoZXJuZXQg
aW50ZXJmYWNlIHByb3BlcnRpZXMgoadCYW5kd2lkdGihqCBhbmQgoadEcm9wIHBhY2thZ2UgcmF0
ZaGoLCBhbmQgZXhwb3NlIHRoZSBpbmZvcm1hdGlvbiB2aWEgUmVkZmlzaC4gVGhlIGdvYWwgaXMg
dGhhdCBjbGllbnRzIGNhbiB0YWxrIHRvIGJtYyB2aWEgUmVkZmlzaCBhbmQgZ2V0IHRob3NlIHR3
byBpbmZvcm1hdGlvbi4gSXQgd2lsbCBpbXByb3ZlIHRoZSBkZWJ1Z2dhYmlsaXR5IG9mIEJNQ3Mu
DQoNCg0KDQpBYm91dCB0aGUgaW1wbGVtZW50IG1ldGhvZCwgd2UgZGl2aWRlIHRoZSB3b3JrIGlu
dG8gdHdvIHBhcnRzOiBwaG9zcGhvci1uZXR3b3JrKG9yIG90aGVyIHN1aXRhYmxlIHNlcnZpY2Up
IHBhcnQsIGFuZCBibWN3ZWIgcGFydC4NCg0KRm9yIHBob3NwaG9yLW5ldHdvcmsgcGFydCwgd2Ug
cHJvcG9zZSB0byB1c2UgZXhpc3RpbmcgdG9vbCBsaWtlIGlwZXJ0IHRvIGdldCB0aGUgRXRoZXJu
ZXQgQlcvRHJvcCBwYWNrYWdlIHJhdGUuIE9yIHRoZSBvdGhlciBtZXRob2QgaXMgdGhhdCByZWFk
IFRYL1JYIGZyb20gZXRoZXJuZXQgZHJpdmVyICgvc3lzL2NsYXNzL25ldC97RXRoZXJuZXRfTmFt
ZX0pLCB0aGVuIGNhbGN1bGF0ZSB0aGUgQlcvRHJvcCBwYWNrYWdlIHJhdGUuIEFmdGVyIHRoYXQs
IHdlIHdpbGwgbmVlZCB0byByZWdpc3RlciB0aGUgRC1CdXMgaW50ZXJmYWNlIGFuZCBzeW5jIHRo
ZSBwcm9wZXJ0eSBpbmZvIHRvIHRoYXQgRC1CdXMuDQoNCg0KDQpGb3IgYm1jd2ViIHBhcnQsIGFz
IEkga25vdyBzbyBmYXIsIHRoZXJlIGhhcyBubyBzdWl0YWJsZSBmaWVsZCB1bmRlciB0aGUgRXRo
ZXJuZXRJbnRlcmZhY2UgPGh0dHBzOi8vcmVkZmlzaC5kbXRmLm9yZy9zY2hlbWFzL3YxL0V0aGVy
bmV0SW50ZXJmYWNlLnYxXzdfMC5qc29uPiB0byBzZXQgQlcvRHJvcCBwYWNrYWdlIHJhdGUuIFRo
ZSBpZGVhIGlzIHRoYXQgcmVhZCB0aGUgdmFsdWUgZnJvbSBELWJ1cyB0aGVuIHNldCB0aGUgcHJv
cGVydGllcyB1bmRlciB0aGUgRXRoZXJuZXRJbnRlcmZhY2UgT0VNIGZpZWxkLiBQbGVhc2UgbGV0
IG1lIGtub3cgaWYgSSBoYXZlIG1pc3NlZCBhbnl0aGluZy4NCg0KDQoNCldlIGFyZSB3aWxsaW5n
IHRvIHNlZSBhbnkgc3VnZ2VzdGlvbnMgYW5kIGFsdGVybmF0aXZlcyBhcyB3ZWxsLiBUaGFua3Mh
DQoNCg0KDQpTaW5jZXJlbHksDQoNClNwZW5jZXIgS3UNCg==

--_000_HK0PR04MB329947E4E37431B956A8D17AE4689HK0PR04MB3299apcp_
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
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.a
	{mso-style-name:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	mso-style-priority:99;
	mso-style-link:=AF=C2=A4=E5=A6r;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">We want to implement two net=
work Ethernet interface properties</span><span lang=3D"EN-US"> =A1=A7Bandwi=
dth=A1=A8 and =A1=A7Drop package rate=A1=A8,
</span><span lang=3D"EN-US">and expose the information via Redfish. The goa=
l is that clients can talk to bmc via Redfish and get those two information=
. It will improve the debuggability of BMCs.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">About the implement method, =
we divide the work into two parts: phosphor-network(or other suitable servi=
ce) part, and bmcweb part.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">For phosphor-network part, w=
e propose to use existing tool like ipert to get the Ethernet BW/</span><sp=
an lang=3D"EN-US">Drop package rate. Or the other method is that
</span><span lang=3D"EN-US">read TX/RX from ethernet driver (/sys/class/net=
/{Ethernet_Name}), then calculate the BW/</span><span lang=3D"EN-US">Drop p=
ackage rate. After that, we will need to register the D-Bus interface and s=
ync the property info to that D-Bus.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">For bmcweb part, as I know s=
o far, there has no suitable field under the
<a href=3D"https://redfish.dmtf.org/schemas/v1/EthernetInterface.v1_7_0.jso=
n">EthernetInterface
</a>to set </span><span lang=3D"EN-US">BW/</span><span lang=3D"EN-US">Drop =
package rate. The idea is that read the value from D-bus then set the prope=
rties under the EthernetInterface OEM field. Please let me know if I have m=
issed anything.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">We are willing to see any su=
ggestions and alternatives as well. Thanks!<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Spencer Ku<o:p></o:p></span>=
</p>
</div>
</body>
</html>

--_000_HK0PR04MB329947E4E37431B956A8D17AE4689HK0PR04MB3299apcp_--
