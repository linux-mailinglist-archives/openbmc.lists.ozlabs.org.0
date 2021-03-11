Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2C336A2E
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 03:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwtN374Jsz3cTZ
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 13:35:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.121;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300121.outbound.protection.outlook.com [40.107.130.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwtMs0lFcz30Qn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 13:35:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAskEdzMuu4DLwhetCYHBn6cumX2hMLlGYiQcT7s1J8id8ciTGmzOCqeY4pZtXmIHUJWhQpwKZHW8AAxBj31NBdqoC+ov7rrKbJIvlkMiG+S9XhORjUnNSTIPJaz+mAAS7EUOLct+BvIObpXbos2SWHyQf3sBtUz9btopbRWiWX6gGUhsDPMapW82NmYTN2e0pPGBGouQ+5qkEc6RQi5vz+qwovfBnIpKfmGjfOo7VQpX1j0m03py3kTWZJny/fYTXjU/s0VAOsPpdbNled0OrvwNMPxYBdv2KfRlKS0qwSekXcXzNsK8Yh44ZQCxMwD8GRJ8mNYGBuZvAGrxOX4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au04DSoDK9efSsHGbim7P4lf9ablJjX0rVqwVulCfKQ=;
 b=YegqWPyWpPqv0JtuYk7AxPEFQssNmhYsiu9PWmYFp4Au2Ce2ZYmum0UvMOMhXpLcXF5FxReLLExdnsCoSXqIK7XFiaQBDaj1lDI9s0PxvOHSIU5wloznEtp5MPrK10zwblRKgsJQomNsq9i59E4d6LBtDEIY07b1YoSKt4wEY5AMPmHEiTs5+V5u4KykD+3MQh1f2zGZACWcyBuQyd/Acs8hOPzBMsUMOTnWEZomhUzfHtIdw3AzfiAkstuah0EgRiMJtLMSlG+fnwAGIpvqYo+PHGix7FH6WZOLflQIvMLZMdMba+3H4x4b3mc+DJXOz9Zs9WnIErNKtODZn6eRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK2PR0601MB1859.apcprd06.prod.outlook.com (2603:1096:202:3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Thu, 11 Mar
 2021 02:35:09 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::9b:5f33:9be8:96a9]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::9b:5f33:9be8:96a9%7]) with mapi id 15.20.3890.039; Thu, 11 Mar 2021
 02:35:09 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: RE: Adding keys to BMC production build
Thread-Topic: Adding keys to BMC production build
Thread-Index: AdcWHLaEG+FX12cqRTejcxdLrfLSogAAcqYw
Date: Thu, 11 Mar 2021 02:35:08 +0000
Message-ID: <HK0PR06MB2145076F4CB2696DA9E282C78A909@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <1f6f6ee72b8746939289c1897de828b2@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <1f6f6ee72b8746939289c1897de828b2@SCL-EXCHMB-13.phoenix.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none; phoenix.com; dmarc=none action=none header.from=aspeedtech.com; 
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d291eac-b86f-4bbd-1b96-08d8e43649cf
x-ms-traffictypediagnostic: HK2PR0601MB1859:
x-microsoft-antispam-prvs: <HK2PR0601MB1859B3BF4FDE78D4FCC2F9E48A909@HK2PR0601MB1859.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IyBYmUyeX+YXWNZD/ZWrfe+oPP3iy1ZftYHOF/4zK4QAedMOkzo+YuH0alX+50shyqB89jF/kksLetyB7Iqf89Yvhywms18GmneeuCwJzyEFcf2LC5Pv/eWbP/QX9lXPLdmbYKCZxrWa7hV1auqCZD42xi17jk3AOCRM65yiOrEALK1Kxzuo0sQWEkXTYBhgPpVavUTfQ7x9Iyd9ysrmOoutpPanpkBZeuucFvIiKgzK+S2fSGpH4Tyq+GgP1nqAa78V5YTR+RZY6z5LfyR1ckhQzevvELLsNdojeOnLfWilg5PzVSxc48NUqcP0ZYgPvcfbcEJO35HqJ6S9o1Z6T9cBLcQiSrCFc399gR6Qgum/jQ/vDh4ceWU/LYTD1ufPWZ0WSZ0uHgyW9D7KO90Slcf2uEhbRkSDQbyELcJN2703tR41PVTP0AvGFENnj8GEzF+GarKGoabq4n6G5K7906YfP6mNC15ZvQcryLWkRBkHJNw6g7u0ODkZ4kiIFtn3JDwO6P0PTUBjXliy/txT6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(39840400004)(136003)(376002)(66446008)(64756008)(66476007)(66556008)(52536014)(5660300002)(66946007)(86362001)(478600001)(9686003)(316002)(53546011)(110136005)(76116006)(55016002)(6506007)(4744005)(2906002)(7696005)(9326002)(8676002)(83380400001)(26005)(186003)(8936002)(33656002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NLPnphtHt2NPjPYBLw5pz8CGTr3Oj5sY/HfnyMuZKJyFaRZymAq7C/2mydjG?=
 =?us-ascii?Q?Nwy/Csy+gA/lDtnUN9sjaHzop/pI1yC99YbVih9VovZAiYY/Dp6vXhEazSR/?=
 =?us-ascii?Q?Q7iIclL1Q/tg3paemVY6MpuAim7PjnWipmzYs6jT75mg8iIbynOb5G5m0kod?=
 =?us-ascii?Q?XMCt0GP8Y1vkSnJB8RFN8CYKLqKMoa6P1oWAz+TjX/0Rm56kc77eWRyiQYO/?=
 =?us-ascii?Q?v8H8gjEYG19W0ktUdNqXCr+G3Krl+YvHAWBTvnKrAFPqhPMTPp/XmU/PWCU9?=
 =?us-ascii?Q?ITBcoRPT9xhh/rF23y4IxVlPTxhSVb+Ggeml4BefGw521qhXwcZ62fLroPJ4?=
 =?us-ascii?Q?X1pRy+VOFo36B1BnO9FVOUShheCpHJUYLEMcs6tIALXOx6Tjr/snI0byOgVd?=
 =?us-ascii?Q?TOgmSjsalo9yeWG/aRhh1Rq+P1p3sCoCLIbM6fI0OwjBzDUFCE517egKNaUL?=
 =?us-ascii?Q?VTzGueInBP54QTziVHCT4RXUmsCgXVipzYN8bZ7meEIhbeAdhaD7hWzZsGEm?=
 =?us-ascii?Q?iTnHj3Uh3BAB2ZlUyBzPnGD6ZTBZyufbWDRj12SkqWJkIol4gX99z/q7/xau?=
 =?us-ascii?Q?WfZKumSBtLucyRo9eSXHsIGoGB3m8iHDRTR8Cb+EcTSQfaACLAD7urcqcH5Y?=
 =?us-ascii?Q?iUYOUY8UWY2T3QiAqUkRxkv8/LT8jSVkcQ9PeRh4MFzeeuqxQODxUZUU5lJ0?=
 =?us-ascii?Q?N3PUARAtO/ZEis+3z2yPrxCkad9G86WK67x8jzhm2WUBU53CjUQpQpH4hI7d?=
 =?us-ascii?Q?wzt2z7h/9CIqPmR/aZVGA47U9aTDgJxNdbktwYna0NAQ4nNkiCNF79RJyKAD?=
 =?us-ascii?Q?C5yE3Zibpvx3W3z/2EasJhh5gxG/FAzrLvD3k0CJrr7atDnvJ9lc4zfKF/tl?=
 =?us-ascii?Q?Ifso580I9D6OZgRmpKChosLYw8tfsC5kohZPQ6pFvyZw032xvxeiQi/3kMsu?=
 =?us-ascii?Q?qViNxRvOa1oTJeBo1I1WP1fteng5V+pR0kNvKkJDznyHSwgNCEkLB6VkNm24?=
 =?us-ascii?Q?JF7G4hdCcnY9YjGJ8jZ1Tjm7uCIPVmnkzBFBmTIKkiXcvAX+XEcy7nrZSjk/?=
 =?us-ascii?Q?iZf+uneTp7W5JXzsb3g9cz7BAgdhpHYVtBSfNTtxOaNYQNJyvs5ODyo923pv?=
 =?us-ascii?Q?gw35er9LAJR8YIG2crvvhfICYzZh2jIjfQDp35sM0mpoh5JFm0/IDW9+LBc4?=
 =?us-ascii?Q?FqJbHw7Xjn97XNl+PdWZAauunvKd4a9+N1aennpRLOrN9mlvF0jAeMDCZtPi?=
 =?us-ascii?Q?7kXgGhiv2imywva9vqT6luyzazz4tzfaa535mZMe9OL0LUYTGcSIwv2XqSkZ?=
 =?us-ascii?Q?Q7rO1iDgdUogWfjh19dce7JK?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR06MB2145076F4CB2696DA9E282C78A909HK0PR06MB2145apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d291eac-b86f-4bbd-1b96-08d8e43649cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 02:35:09.0122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3nufGdmCR9BT8RJf6oabAtcA6MqRl7LAeJ2iFL6L1Nx+dxGjKppavBDPky/yWKG9mtZJTP4ijJFNSDZeOexZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1859
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

--_000_HK0PR06MB2145076F4CB2696DA9E282C78A909HK0PR06MB2145apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

You could assign SIGNING_KEY to your private key for signing image.
If it is not set, meta-phosphor/recipes-phosphor/flash/phosphor-insecure-si=
gning-key-native.bb will be applied.

Thanks,
Troy Lee

From: openbmc <openbmc-bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> =
On Behalf Of Patrick Voelker
Sent: Thursday, March 11, 2021 10:18 AM
To: OpenBMC (openbmc@lists.ozlabs.org) <openbmc@lists.ozlabs.org>
Subject: Adding keys to BMC production build

Is there a page or document with instructions for adding a custom key for s=
igning the production BMC build? I haven't had any luck finding it yet.

--_000_HK0PR06MB2145076F4CB2696DA9E282C78A909HK0PR06MB2145apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Patrick,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">You could assign SIGNING_KEY to your private key for=
 signing image.<o:p></o:p></p>
<p class=3D"MsoNormal">If it is not set, meta-phosphor/recipes-phosphor/fla=
sh/phosphor-insecure-signing-key-native.bb will be applied.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Troy Lee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> openbmc &lt;openbmc-bounces+troy_lee=3D=
aspeedtech.com@lists.ozlabs.org&gt;
<b>On Behalf Of </b>Patrick Voelker<br>
<b>Sent:</b> Thursday, March 11, 2021 10:18 AM<br>
<b>To:</b> OpenBMC (openbmc@lists.ozlabs.org) &lt;openbmc@lists.ozlabs.org&=
gt;<br>
<b>Subject:</b> Adding keys to BMC production build<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a page or document with instructions for ad=
ding a custom key for signing the production BMC build? I haven't had any l=
uck finding it yet.<o:p></o:p></p>
</div>
</body>
</html>

--_000_HK0PR06MB2145076F4CB2696DA9E282C78A909HK0PR06MB2145apcp_--
