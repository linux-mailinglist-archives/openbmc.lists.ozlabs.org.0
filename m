Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A138893E
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQl557Jhz2ymN
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 18:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=OgYlrhJj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.105;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jun-lin.chen@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=OgYlrhJj; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320105.outbound.protection.outlook.com [40.107.132.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQG32lSgz2xg1
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 17:57:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkYW757C+rBWXvVFJ1nd/R0qMbZ9u9PAatDWwRv0sNaxu3BEecy81GkyR+WxF9kZcffSXlRGPvJE2Om+vi84lUiLUFe6h3laEwa3Oruc3rH8l9J9y7SPdvP9ZwxzHO3ph8tFnQtsX8nnH0sbWW4Ul/h3OB+gFu68+R3HYYy4GOEmw2kio8GXrM8JVWSN+U8No5LnB8r37ffCo/emI+inmk7ifC0FFJZNuu9xeasuWfEBNk9nvBbKWv6MWUdZfNZyqCN2z1VnyYILt2HUcbIS5Cw/0VB2zEO4RvywlgdEM6V6D87XrZ6X8HQD3AsKyEOIbzymyWjgZic8K+umET9kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtQaMH45/P3KnHvdvzgd3M9rrpN9fSv1SJQ5f0WnCu4=;
 b=GniMiT83oR+DUxGc6B/FppmhrIPnjW76AaxWDqZUSNkSUfeAkWfpY2eS6JEsWoIPw00P5GO8e5Eo5NuGR78CsivjPc/2mwKnS4gUtzumxLT5TWoDLEFFKENJdm4T1984s0oUwwgLZl3NqAU9VYyX4f/1WHHSMtROfO+V+Z8w7kKJZepF+HnhUx5r0/Pk+0ZQvPJrG1rFkn/XqXaqvIn9V9G3e3dYQzWy+7xM2JnXKyFAth7dpkElGdykmMbLPcDfPA3p9G41PgVPRqsJX7N9TVg7VjhZYXPegF1+wzpxcuhaZvJ5LfYRLLFc0dwoX7hqqJlFJJd2NHXQnQUFPObN2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtQaMH45/P3KnHvdvzgd3M9rrpN9fSv1SJQ5f0WnCu4=;
 b=OgYlrhJjf88uu+Ouvy/7IWJ7E3vyVr9Or+eMso5S6c0cHU6bqHRIJS4vHsBtornF1zqNKx3QQrtXTwyuQe1IzhsIelpFLGCk9YSJ8IdQH64eSIFnz0svGmU57N50vYF0fDUt4kDDUOs1l+E/lv8MIrUHyCHfphjbhMeh9N47dqc=
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com (2603:1096:203:87::9)
 by HK0PR04MB2788.apcprd04.prod.outlook.com (2603:1096:203:54::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 07:57:40 +0000
Received: from HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::2044:8839:c6f9:fa63]) by HK0PR04MB3346.apcprd04.prod.outlook.com
 ([fe80::2044:8839:c6f9:fa63%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 07:57:40 +0000
From: =?big5?B?SnVuLUxpbiBDaGVuICizr6tUwE0p?= <Jun-Lin.Chen@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SimpleStorage proposals
Thread-Topic: SimpleStorage proposals
Thread-Index: AddMgrei/Fpr/op3T+CFNeQhuUFj5A==
Date: Wed, 19 May 2021 07:57:40 +0000
Message-ID: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95c69f3d-f675-46fd-b0ba-08d91a9bc6b6
x-ms-traffictypediagnostic: HK0PR04MB2788:
x-microsoft-antispam-prvs: <HK0PR04MB27885B3FE72B6DF614C48B21B12B9@HK0PR04MB2788.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7SKsJhXcwZPupf7B72Sm1gGPqe4IjGVtHwrHibNWWTh3ecHKyITLCmeLvtzscB8w94zO0t4o2YcJ8A+oxJnGMSDMR9CMXwRXHUJXCMaTiKQkV30r54m/COzKwrlhkjdJE/wOUVMUw0cUgyr6I5W6NVdFUvdsF95uHicPJq5D212KGORMpDpmvKgZ4jRD50MsAzDI4tpb3wiDbVTm8kGjTEaXabTa67NV+Nn+ob/SEehiwkVdbX147bydA0cFKL9uRDkYm7zUgQwGLx25cc+N/CA8iQkyPdij5RhKEsHyJINWDMOE33YqFQTavpk4nYopUtk2M2OALqOcsh14Sbf/MWeS4RbmBWQo1yK+cfHdKW98LBpklNpWjnOKqdUS258VWG6/DvZNquZG4WpOljFOtGwAyKa/Al3t3Akn0vNIqWUBqhvxUm87pu+99VuEJOcvM8LUpFiTe71aGBaxlxw7vyxqeeoJJf/NllMC7CP07ETG13X6KDk7VXLdEoQD2oIxDSsiGHerkmCHldEetdiluyLCxpyXUo8y8hnvhiwM8nzIh6Cw5n5NNLUMqQ18ioybHXeC+M2uPsvmC6rmxyOAgDLUJAdWIeyv4t8jgy4ybpa7CrJjFr9Ae8Whr7PRn6sI2hAZEd6KTMwzSPt97rjZQ8gQd5suFjoRq3t+DACcJus=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3346.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(76116006)(66946007)(6916009)(7116003)(85182001)(2906002)(8676002)(316002)(54906003)(66476007)(83380400001)(64756008)(166002)(966005)(5660300002)(52536014)(6506007)(478600001)(122000001)(55016002)(66446008)(86362001)(38100700002)(66556008)(7696005)(3480700007)(8936002)(9686003)(26005)(4326008)(71200400001)(186003)(33656002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?a0RmbmJvSUhUNlhHT05hK1JSMEx6R0J1aGsrRzlFNEljWW5PWkpwOVZOeVpHSXdV?=
 =?big5?B?aUJNZ2FVMW80U2ZucTVlcytTR2NWTjhvUldaQzN3V09LRmk0U2FnL2hZdWF4bVhv?=
 =?big5?B?UWIrWllBUmowaGZ5TTRMcW93UFRNMXdUZ0VYUWRyUXJ1N3hVVi9JWlVDNnBQVjRv?=
 =?big5?B?ci8xY3RjaEIyREpFbHBGMEpUWXN2b3VNWGtMMUxQWkZVc2xlT1N6U1UwcEhiUWVQ?=
 =?big5?B?MVhhZlNDNmNvazhzQ2dIb0RObmNOZjdwcE1STFA2VTJhOHdsRk1xZitHVVhLU21K?=
 =?big5?B?YjdGbjFWWlpUSkNSOXNLUTR2QzJZK1dhOGs5TGdKeFFWYk9DQVF0QjZyTXlLOWJz?=
 =?big5?B?Q2c5MEZ4UE5uR214YUhnL05aejZZUThyV3JZL2NYbDhOZk5NY0F6YS9rMWpBUnU0?=
 =?big5?B?azVUZWxRcTZIN3RaZzMyZnlqTEV3dzdIQUpsSjRQNTNIUG0zSkJiNXZrajM3NENq?=
 =?big5?B?aVhOL0FTc2NscHJSbXBPYUxDK1NuOGordVJyblRkdlFxdmxFdnl6MDJRNEdBbytN?=
 =?big5?B?ZzMzZ3FFVWhGcm1kSzdWNGd5T0haaUE0MjBrQytWU3RPU1pLQ3ArNjkza21UR0FW?=
 =?big5?B?RkZObFdmODB6UGczK3dvQXQ0VWZJVU84NmxDNlhTMUtJSkpjN3ZmbGQyODBsMjVY?=
 =?big5?B?QmxiUGY2V091Y2MxL29xM0xxZnA0SzNmUEZnYUlzR2JPd2xYYVNndXFQcTBNcldI?=
 =?big5?B?U09xYk1TLy81c3lSaS9VT2c0bThWdTh5eHBveDhyY0crVnpsZ2xwK2tTTHVhQ2dt?=
 =?big5?B?YjYxdjBWMDhpc3drUndPWGdMSWZaM0xDeWxxemZHN3duV2FtWGZaclA4RlBJSnN4?=
 =?big5?B?ek5EWFhERkpIaEJjNDVBMlh2VCsxei8yTVY4aUV4Q3JJT2JUWURDU1FiLzVmeHBw?=
 =?big5?B?dHJHdEdlU3lpTkV2RmtaU1B0T0hDTklzRFNoNXNkZklkUFRldk13NTVRbnozSGg5?=
 =?big5?B?bTZxbEpXSU9TdnFvNlJSdDFtbGVXMzNNd1FKT1FXTXozc1hUbkFtU244NXFlTm84?=
 =?big5?B?MTNrZG9WK2l2M29Ja09DK01ZK0ZsNW1LZXg0VmZwcGREM0FBWlREZnlJOTg2MllQ?=
 =?big5?B?clFSOVJGS3NVYnVCMC9teUI5dDJweTZvb3ZvaGJ4Smx4UTNIR1pDUDdGUzZ4aWk5?=
 =?big5?B?dzZDUGZSZ09wZHJQSEhKSjdjbTdYNWVuWWZHMFB1bVdPQ2wvTDJpY04rR0xqdTBn?=
 =?big5?B?b1FuM2JweWFoV3NaUmVWcXVsSXNCZ3VTTlpIZGF5RmJUVGhITCtnQ1lCSlc1dCtk?=
 =?big5?B?QTRjbVNybCszTVh4V2k0dlBpVHdod3cwakFhdXFuZlFQaG5VSTNVbXFyZkhoQUFJ?=
 =?big5?B?R1FaRDBVenBaQ1NDTjFVUFNaekwxVlB0MGVVdUdmdXUrZzRqZXN4MVlJYTM1YnpE?=
 =?big5?B?bXJNS1JBdmh3V2lRdndhZklEUTk0WnBmb0Q2NnNzREIyVDcrY1ZJaHpRUFA5SEQr?=
 =?big5?B?NFRKMEFLb0J5eDFNNXp0Sm80R200SEpwZGh2d3hkUmhvcjVCL0pROHI5MTVSRHVM?=
 =?big5?B?Rkd2YVJKYUxoei9HTjFJMDR2bFBvM1lQQUZUSVVwVlMzNkdTSSs5WDFpaTM2L0tL?=
 =?big5?B?ZnYwWk5xTzVJdm5JWFNhOW4raGRSR0RUbnFwWm1tNWIyTUFYNTdtem12NUZkSWxp?=
 =?big5?Q?2Th1I+tIa3wFth5ormqW4GeVE1/oXDk/hENMlEC8OCU9C6Ap?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9HK0PR04MB3346apcp_"
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3346.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c69f3d-f675-46fd-b0ba-08d91a9bc6b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 07:57:40.3441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvLEGC4U00lO2IlmeaiYM24ac6i7o1xH9t2BJTic0OhbRiQHQqukuhKOFnquf7RF2cx1w2h+bV1AmHdXrYuDTqF2dlp5F15Z3mB+fWjJYh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2788
X-Mailman-Approved-At: Wed, 19 May 2021 18:19:16 +1000
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
Cc: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Ed Tanous <ed@tanous.net>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9HK0PR04MB3346apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpJbiBvcmRlciB0byBpbXBsZW1lbnQgdGhlIGZlYXR1cmUgdG8gdmlldyBzaW1w
bGUgc3RvcmFnZSBkZXZpY2Ugc3RhdHVzLCBzdWNoIFNBVEEgSEREIHByZXNlbmNlIHN0YXR1cy4N
CldlIHByb3Bvc2UgdG8gaW1wbGVtZW50IGl0IG9uIHRoZSBSZWRmaXNoIFNpbXBsZVN0b3JhZ2Ug
VVJJLg0KDQpBcyBvdXIgcHJvcG9zYWwgZm9yIFJlZGZpc2ggU2ltcGxlU3RvcmFnZSwgaHR0cHM6
Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvZG9jcy8rLzQzMzUyDQpBbmQg
YW4gbmV3IGRhZW1vbiwgaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvZG9jcy8rLzQzMzUxDQoNClRoZXJlIGFyZSB0d28gbmV3IGRidXMtaW50ZXJmYWNlcyB0byBi
ZSBwcm9wb3NlZCwNCnh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lkl0ZW0uU3RvcmFnZURl
dmljZTogaGVyZSBpcyBhbiBlbXB0eSBpbnRlcmZhY2UganVzdCBtYXJrIHRoZSBkYnVzIHBhdGgg
dGhhdCBTaW1wbGVTdG9yYWdlIE1hbmFnZXIgc2hvdWxkIGNvbGxlY3QuDQp4eXoub3BlbmJtY19w
cm9qZWN0LkludmVudG9yeS5JdGVtLlNpbXBsZVN0b3JhZ2U6IGl0IHNob3VsZCBoYXZlIHRoZSBw
cm9wZXJ0aWVzIHJlZGZpc2ggbmVlZHMsIGFuZCBjYW4gYmUgcGFyc2VyIGJ5IGJtY3dlYi4NCg0K
VGhlIGRldGFpbHMgYXJlIGluIHRoZSBwcm9wb3NhbC4NCg0KV2VsY29tZSBhbmQgdGhhbmsgeW91
IGZvciBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMNCg0KQmVzdCByZWdhcmRzLA0KSnVuLUxpbiBD
aGVuDQoNCg==

--_000_HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9HK0PR04MB3346apcp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In order to implement the featu=
re to view simple storage device status, such SATA HDD presence status.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We propose to implement it on t=
he Redfish SimpleStorage URI.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As our proposal for Redfish Sim=
pleStorage,
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352">https=
://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43352</a><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And an new daemon, <a href=3D"h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43351">
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/43351</a><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">There are two new dbus-interfac=
es to be proposed,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.Inventory.I=
tem.StorageDevice: here is an empty interface just mark the dbus path that =
SimpleStorage Manager should collect.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">xyz.openbmc_project.Inventory.I=
tem.SimpleStorage: it should have the properties redfish needs, and can be =
parser by bmcweb.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The details are in the proposal=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Welcome and thank you for comme=
nts and suggestions<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Best regards,<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span lang=3D"EN-US" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif">Jun-Lin Chen<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9HK0PR04MB3346apcp_--
