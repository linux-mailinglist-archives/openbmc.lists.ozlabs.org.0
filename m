Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC942CCEDB
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 06:57:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmlVC1j4qzDr2g
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 16:57:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.98; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=TB7L3EMW; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=TB7L3EMW; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300098.outbound.protection.outlook.com [40.107.130.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmlT26W0czDr1m
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 16:56:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+9txG8k66FvyDYxwGz1SRJGX3pmACh8G1j8/p8ttic=;
 b=TB7L3EMWV4n44dpb8Gotaa2P/aY5wpnghMIaqNrM4HedAzIllxlfRiD7/os8dMIbO6i4hzGXu6G2DYc8UiYxE0XDuT/uH8etXV0NRVsSYoK6envv7TktbfkjlUJWEZleOaHxXGcL0bD4BGX5uifR9eGvbJR/ytnccrYmYtRC+/k=
Received: from HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24)
 by SG2PR04MB3320.apcprd04.prod.outlook.com (2603:1096:4:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Thu, 3 Dec
 2020 05:56:02 +0000
Received: from HK2APC01FT015.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2e:cafe::94) by HK2PR06CA0012.outlook.office365.com
 (2603:1096:202:2e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 05:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 HK2APC01FT015.mail.protection.outlook.com (10.152.248.167) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 05:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hB29dvTqFujakUNj8TmWaEQ2xi+x0bRwtdIFf1wKtXafMTb38XjkNZFyzoqzZMWdy1NsjjNSNTbgTE2OoiKRK39zZGxMkWvpX5BCsxlFwpWoeo4ZunCQNKCvOg2B1ypQq9yk+JsrktcfCV6XarHfcd+5Jt4WHDJW8OaAu7iXw5t9IsZSeuOQb8MkkeNKse6WnpKfXr1Gl27KKX1dFSditCnTIJsgJ3qEpUz4ozgB+Vkrvnhox+1xbdxd6h3OohyfzRIFLB6etie4x5OgXLh+UP2XxGWy5BTlZZdCUGorV1F+usjHBTyMrLLBbd4uJOihX1+BhmpIHdMCT8r8nZgmfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+9txG8k66FvyDYxwGz1SRJGX3pmACh8G1j8/p8ttic=;
 b=j4Ss7zXIakREIUaJVK50u/lKbgNZnXmgcrDKXx7cIvNAjf7K1AnUKwmQvU+wTJ7j9tzufnL1EX6gIBQ8NrqAedIMOQ2Q4T4cWW91yEdzBkCCjAwAs0mohKVt00W/rjsIeWBN6vnqUWs8Jd8GDm0FtHjshyOmGwLNks65mjDMQTsheDCjnn44h4rcdKkq1hMHWVgEcEx67+Qd97dZwCe/10GzSnG/XjBJsONrFVqrxpFr1Pdf5vntN/zdm+DZg+ScS0osaWvgOEeDjwWea8ayugQmkzpTWx7pBw9sX8snj2M/H5pGsiu0GnrhCE39b8qGlE3YHYDl0Fv1S/m+lJRKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+9txG8k66FvyDYxwGz1SRJGX3pmACh8G1j8/p8ttic=;
 b=TB7L3EMWV4n44dpb8Gotaa2P/aY5wpnghMIaqNrM4HedAzIllxlfRiD7/os8dMIbO6i4hzGXu6G2DYc8UiYxE0XDuT/uH8etXV0NRVsSYoK6envv7TktbfkjlUJWEZleOaHxXGcL0bD4BGX5uifR9eGvbJR/ytnccrYmYtRC+/k=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 05:55:48 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3589.037; Thu, 3 Dec 2020
 05:55:48 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Add version info in the fan - json config
Thread-Topic: Add version info in the fan - json config
Thread-Index: AdbH8TNPc+j+bLH6SyW0u3W2Zi4qRQA1dZYAABtK5kA=
Date: Thu, 3 Dec 2020 05:55:48 +0000
Message-ID: <HK0PR04MB2964BFFC8314B2C02297D8BBFDF20@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB29643B6D1550EC772A099250FDF30@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX82=MG2kMPyBei7zp1P8jik0Ay4ZpjyxNkyi+U31nwNx-w@mail.gmail.com>
In-Reply-To: <CACWQX82=MG2kMPyBei7zp1P8jik0Ay4ZpjyxNkyi+U31nwNx-w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiM2U3NGI1N2YtOWRiZC00ZTUzLWEyODYtZWNmODZhYjMzOWIzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlVGd2VtZVN0d21XTFJnYmVKMENGREl4VVJIY3ptOHhZb2d4a2lOTzl6WUIyekJwXC9ZWkpHMXRhNXRiTlpJUXl1In0=
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.51.1.81]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 580cf78d-4a25-4ddf-41b6-08d897501c9f
x-ms-traffictypediagnostic: HK0PR04MB3282:|SG2PR04MB3320:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB332039877A30AB02E3ED1D87FDF20@SG2PR04MB3320.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2/7ZrvJLzf6+ekaQB7bPHI7tuLteXWA+ENmG9uhdjb5ZXs26jwwjz058II+vcLZj+qGjmctAKMNJMg2jiww6lO18XedCkwMS/JTfHK8CIAIF5gEfFjs4xe9BKGpGSvLy9z3TuR8BRfhATKyxARkBWBQvm2sTuhcpoUKx05eJ7vFompskVrTqu1Tf3sYr6r1NNGBzMnpM7/f95UES0DC92PB6+TZ1UusPUx2OusKFmn1xeety9vTZhfC1eQW0KNxftkt8NH25P0JOqjQ5ayxrjrc/zmb6+IwksvOiYKZSLCOdBIN99sH0IBd4mvZSCEQWB6S1bmQg7aCsdTE3D/wz5w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(71200400001)(2906002)(54906003)(66946007)(316002)(76116006)(8936002)(52536014)(5660300002)(186003)(83380400001)(33656002)(66476007)(8676002)(6916009)(7696005)(26005)(6506007)(53546011)(4326008)(478600001)(66556008)(66446008)(64756008)(86362001)(55016002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MFRoalQzU3dGemF3RVN4UHl5R0FnZURNRHZLK1VQS2xxcHJlQVBRTkt1alVJ?=
 =?utf-8?B?dGZja0xwcWpMWGRUdDhXOXhnd0tSVG0zZkxwY2F2M1YyQXRSTXd2UUVkT1U0?=
 =?utf-8?B?S050UEpPdXN3NVcya0U0OTdBajh3Tk9vcjNVQ0VlbHVMSmVHYmhwNUJLUjFD?=
 =?utf-8?B?T1F5Q3dyYkppYm10MFM1TjVJVDdRS0VwaTFLeGdMUC8xUFN1R2V1T0UwK3Rw?=
 =?utf-8?B?RXh3dlNydUdFVXUySHNIQUlGME0xZnQzS0ZKTjhwcW9yMEp2WEczaXZ6TlZx?=
 =?utf-8?B?TnJhRG1YNmhOUWtPL3FtOW9HbVFaUWd3bzNlZWMwcU9idU92SVRPNkJaODcw?=
 =?utf-8?B?RGdnaTJud0EvNXc2cFRQQmRaalhIMVJUQ2U3VS96OEVJWUpoMldBdkZKZElQ?=
 =?utf-8?B?Wm4zZmtFMjBaMm1nSE9kT3g1eVdoMDZqZ0t5SFRvN0oxMFIyVStlUkRVR2J0?=
 =?utf-8?B?N0pDK0tOZUQ1dUdxNHJ3ZHJSaVNISUtBbFlsc2FId1NxdEd5SWM4M0Z4eHFR?=
 =?utf-8?B?bXRSV0xyQzRYR2hpcXhuUC9JaEQ4VG9zNFFpdmMwMklXVm16dURyWFpHMGNH?=
 =?utf-8?B?OUlBaFRuQlJBNmRUdjFEdmE0WkhqaXlEL0w2dW8vMTBBQXpST2tiQnJHTEFE?=
 =?utf-8?B?Sk1mcnRWbFZnVVBmTFdVbUZ3TkNLMS9PQUZhc0xub25oWUhDc05jdXJKR0pW?=
 =?utf-8?B?ckdOeU9qc1NxUlZDWlJHNjNIYnB1VHNlSkp2RE13dFBrUnZkdXI3c0dmMDI0?=
 =?utf-8?B?NkUyQjQxTzhMTU1qd1dtQVA4WVh4cUUva1RvdUpKRDlKNG9MMmMyODZYUW1I?=
 =?utf-8?B?eW1scFRONGh3eXQzZXd5Mit5Wk9Kb211NllHZGpNQ2hQVG00UW1pa1VnRy9Y?=
 =?utf-8?B?V3pGSjRxREUrZ05BTE1EeUtKUWFHSy81eE5CREt3YUJBSEpjb2lJaldVZFJ5?=
 =?utf-8?B?MEcwcVdqdDV0MjBJMWFYbzN6ekxhVWNDNUhQanUyYnJTaktGZEduNTRjVXJH?=
 =?utf-8?B?eSt5Rm9nSkZHV1VGNHpvVnJvWnRkWE1jc0VpRWxDTXUxUXFERENoNjZVanE4?=
 =?utf-8?B?eGNmOTRWNlJUTHVWdTFoSk45RmNxWkRSdlN2TVBTTHVIeklvRTUzanVFOVlO?=
 =?utf-8?B?YXlUWThRWWg2MUhMdm5ZVjNiS0doLzRuWjladVp0WmNVWkdZRVhyY2pTamcr?=
 =?utf-8?B?bytPZWJ3b1lhZUlqWGZvcjhIRVBxYk5SZnFOSlFiTE9DOXVpR0RzdE84YUs0?=
 =?utf-8?B?ejVGQlRFcU5uM0drclhNQlM1cmlBeXN0UExNUkx1UHBkMWRkdm9WeGFwNEpq?=
 =?utf-8?Q?szK7Qjp8ShOhI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3282
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT015.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ff0955b9-2f48-4230-a4e9-08d89750155a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpJiarsevgvSswMsCBKQyza6VyX0+bddvFCcCRKWSGRBVCLBugJINEbESr9JxdOb+ocyI3NDJQD0qsL8g5x9dgkc4iwgJkNX0vJMD3iszmvwm0NC5RWXWQoaWhJ1y0EZdv9//gOQOFWRAowEhM6Cl7S/NwyyQ2qq8Vsjo5L1sfluGob6ukkynthga0wvdNDm9gbtNPP8rAxs82/P8/OJVjYkKZI+gKK/pUoM4yPF+JE6kIsZqBat6The49LZAhB5JsXH8/gvOXFgnw74AO7HGOY+lp1PBQRhYCb42/h/IftWVKRvSILCQsKIvhZ7iVWihn0fM1utJYSpRpjYJo+2oRLvQwlpoktm+MlRnSDjU6J57pCFsJe4m3HBOKH7ibVqofN5tsikimF38Hsgv4T01A==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(478600001)(70206006)(55016002)(86362001)(54906003)(36906005)(316002)(70586007)(9686003)(2906002)(6916009)(26005)(33656002)(336012)(8676002)(356005)(82740400003)(53546011)(81166007)(8936002)(82310400003)(4326008)(83380400001)(6506007)(5660300002)(47076004)(52536014)(186003)(7696005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 05:55:58.3053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 580cf78d-4a25-4ddf-41b6-08d897501c9f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT015.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3320
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IFB1YmxpYw0KDQpDbGFzc2lmaWNhdGlvbjogUHVibGljDQoNCiBIaSBF
ZCwgDQoNClRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4gUGxzIGZpbmQgbXkgcmVwb25zZSBiZWxv
dyBpbmxpbmUuIA0KDQpUaGFua3MsDQpLdW1hci4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEVkIFRhbm91cyA8ZWRAdGFub3VzLm5ldD4gDQpTZW50OiBXZWRuZXNkYXksIERl
Y2VtYmVyIDIsIDIwMjAgOTo1MCBQTQ0KVG86IEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtA
aGNsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFZlbHVtYW5pIFQtRVJTLEhD
TFRlY2ggPHZlbHVtYW5pdEBoY2wuY29tPjsgc2Rhc2FyaUBmYi5jb207IFBhdHJpY2sgV2lsbGlh
bXMgPHBhdHJpY2t3M0BmYi5jb20+OyBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4
LmludGVsLmNvbT47IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4N
ClN1YmplY3Q6IFJlOiBBZGQgdmVyc2lvbiBpbmZvIGluIHRoZSBmYW4gLSBqc29uIGNvbmZpZw0K
DQpbQ0FVVElPTjogVGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhlIE9yZ2FuaXphdGlvbi4g
VW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyLCBEb27igJl0IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgYXMgaXQgbWF5IGJlIGEgUGhpc2hpbmcgZW1haWwsIHdoaWNoIGNhbiBzdGVh
bCB5b3VyIEluZm9ybWF0aW9uIGFuZCBjb21wcm9taXNlIHlvdXIgQ29tcHV0ZXIuXQ0KDQpPbiBU
dWUsIERlYyAxLCAyMDIwIGF0IDEwOjA4IFBNIEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtA
aGNsLmNvbT4gd3JvdGU6DQo+DQo+IENsYXNzaWZpY2F0aW9uOiBQdWJsaWMNCj4NCj4gSGkgQWxs
LA0KPg0KPg0KPg0KPiAgICAgICAgIFNoYWxsIHdlIGhhdmUgYSBuZXcgZmllbGQg4oCcdmVyc2lv
buKAnSBpbiB0aGUgZmFuIGNvbnRyb2xsZXIgcGFydCBpbiB0aGUgRW50aXR5LU1hbmFnZXIganNv
biBmaWxlIHRvIGlkZW50aWZ5IHRoZSB2ZXJzaW9ucyBvZiB0aGUgZWFjaCBmYW4gY29udHJvbGxl
ciB1cGRhdGVzLg0KPg0KPg0KPg0KPiAgICAgICAgIFRoaXMgd2lsbCBnaXZlIHVzIHRoZSBpZGVh
IGFib3V0IHdoaWNoIHZlcnNpb25zIHdlIGFyZSB1c2luZyBhbmQgZmFuIGNvbmZpZyB1cGRhdGVz
IGFuZCB0cmFja2luZy4NCg0KR2VuZXJhbGx5IHRoaXMgaXMgYmV0dGVyIHRyYWNrZWQgdXNpbmcg
dGhlIHZlcnNpb24gb2YgT3BlbkJNQyBiZWluZyBsb2FkZWQgdGhhbiB3aGF0IHZlcnNpb24gb2Yg
dGhlIGNvbmZpZyBmaWxlcyBoYXZlIGJlZW4gbG9hZGVkLiAgV2hpbGUgdGhpcyBtYWtlcyBpdCBh
IGxpdHRsZSBiaXQgb2YgYSBwYWluIGZvciBkZWJ1ZyB3aGVuIGxvYWRpbmcgbXVsdGlwbGUgY29w
aWVzIG9mIHRoZSBzYW1lIHZlcnNpb24sIGl0IGhlbHBzIHVzIGF2b2lkIGhhdmluZyB0byB0cmFj
ayBhbnkgcGVyLWZpbGUgdmVyc2lvbiBpbmZvcm1hdGlvbi4NCg0KS3VtYXIgOiBPay4gVGhhbmtz
IGZvciB5b3VyIHN1Z2dlc3Rpb25zLiANCg0KV2l0aCB0aGF0IHNhaWQsIGhvdyB3b3VsZCB5b3Ug
aW1hZ2luZSB0aGUgdmVyc2lvbiBpbmZvcm1hdGlvbiB3b3VsZCBiZSBleHBvc2VkIHRvIHRoZSB1
c2VyPyAgV2hhdCB2YWx1ZSB3b3VsZCBpdCBzZXJ2ZSB0byBhIHVzZXIgdGhhdCdzIHVuYWJsZSB0
byB1cGRhdGUgdGhlIGZpbGVzIChleGNlcHQgdGhyb3VnaCBhIGZpcm13YXJlIHVwZGF0ZSkuDQoN
CiBLdW1hciA6IFdlIGNhbiBleHBvc2UgdGhpcyB0byB1c2VyIGFzIHNvZnR3YXJlIHZlcnNpb24g
aW4gdGhlIGRidXMgaWYgbmVlZGVkLiANCg0KPg0KPg0KPg0KPiAgICAgICAgIFNvLCBkYnVzLXNl
bnNvcnMvRmFuTWFpbi5jcHAgY29kZSBzaG91bGQgYmUgdXBkYXRlZCB0byBoYW5kbGUgdGhpcyB2
ZXJzaW9uIGluZm8gZm9yIHRoZSBmYW4uDQo+DQo+DQo+DQo+ICAgICAgICAgUGxlYXNlIGxldCB1
cyBrbm93IGlmIGFueSBjb21tZW50cyBvbiB0aGlzLg0KPg0KPg0KPg0KPiBUaGFua3MsDQo+DQo+
IEt1bWFyLg0KPg0KPg0KPg0KPg0KPg0KPiA6OkRJU0NMQUlNRVI6Og0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFt
ZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRl
ZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50
ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNv
bXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFp
bCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFs
bCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9y
IEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2Vu
dGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkg
bm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBp
dHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBj
b3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBw
dWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25z
ZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRl
bGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5n
IGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1
c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0K
