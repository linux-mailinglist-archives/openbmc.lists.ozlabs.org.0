Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290793142BC
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:19:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZL6r3ffrzDvX7
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 09:19:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.111;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=eamLBcAZ; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2111.outbound.protection.outlook.com [40.107.236.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZL5v0Hs6zDvVL
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 09:18:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwJQ3pDsDZfC8dFLLpDnh6tPOMBsvwSe3HeXqj4Ybvi5SEdPmvt/OUsvmB+kc0I+rt00r9Jygnx2fczNUg0vKQ4i3feYxypxCS0R0TlAyzk150AG6D3gCUOD+FvsmTg1Hd3xe32DyY1TyyU8CE7DlxcpbBcAmNR6tGfkf1IL6pOdmXGStR8+JdoM151+zZqfxwOZYttcKor594Xm3lk6K8CHZCrY44lM4xeRSxry6tfT+LzR+okXUcKtjitpTVUbUsY1CUsE4/I7rq8Ji5G3lVzdk7QSP8Dg3N7kRTYloXjGTJRea8qrqRz0g89JMTr5hAU/1NxiqjuNnnAhBxUSYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHNVMemGB658mK+10CvgDlXGTvR/QBE/2kOU6nH6RY4=;
 b=MWwXi36XYz6foDwjrl7vu0uuRSTfd/0zMR3+lZbMuuHBugV0r3fOVW4wwVRDOd9tad+zi9cIdHpu3cgYy92375ypUme9x/aPcl5RTPGI+SOp5kgQJa6TvxwoSiDhX16qc1a3junFidAccPEM/DZeDRQMc3YALvDzE/fRDXaj27uAVQ9VtqzRzKVJR0e7SRwS6wHuO1yxuyJ9nzn+XeZsbz5557GiCcIOhANT0DSIqUivFxw4e9tyXmHOlWy1/8LIMA2yDvmP3RU63WAN92d3ZTqHnF/BgrLXnFrVvt49dipfpf1ixZbOAz/iwflgdtVetbwNXO2zy61hsOPHJCWIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHNVMemGB658mK+10CvgDlXGTvR/QBE/2kOU6nH6RY4=;
 b=eamLBcAZDfMOR2rWNDnJKfSOemwuOI5Otou/D2oPJ32Z7D9m+eEkEEJB1QodJxbLYu3gbjQJa3vb5QbeDgY1L5BLB1AJyoVxMH7lxQCMbHiK/lX3ZYR+9AVPSpIacgwsr/Nqok3Rg0xnoFcsFTOy2pTZUgESaoNn4Yv2AxuZHZo=
Received: from BYAPR01MB4678.prod.exchangelabs.com (2603:10b6:a03:88::27) by
 BYAPR01MB3941.prod.exchangelabs.com (2603:10b6:a02:91::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Mon, 8 Feb 2021 22:18:49 +0000
Received: from BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96]) by BYAPR01MB4678.prod.exchangelabs.com
 ([fe80::650e:6480:5f2a:4b96%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 22:18:49 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: create meta-ampere folder in openbmc repo
Thread-Topic: create meta-ampere folder in openbmc repo
Thread-Index: AQHW05FtxubWmqNYTUGRYN8lAatuOKoFhiSAgBLcUQCAAMregIAmnh0AgADTt4CAAJLTAIACaJuAgAdDWACABEniAIAAAY7H
Date: Mon, 8 Feb 2021 22:18:49 +0000
Message-ID: <BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9@BYAPR01MB4678.prod.exchangelabs.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
 <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>,
 <20210208221222.42tgcozztspf3mru@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210208221222.42tgcozztspf3mru@thinkpad.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [58.186.197.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a3825fc-2415-4c3f-f19a-08d8cc7f825f
x-ms-traffictypediagnostic: BYAPR01MB3941:
x-microsoft-antispam-prvs: <BYAPR01MB3941C491E346490BD25ABB3A8D8F9@BYAPR01MB3941.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PYoNI/NaX7wDYGR2T8JdrFfVCRzARRXpz3VWDeK/T+nE2t2ULHDFmrKCdMkfWDFA/ycwWjArvi9pEKr6xxpR7VSJe0N0kiVgBG85j57ro+eEoMnrZ08m+uC/SOCUggeHJgGcTppbr/tvqZEzhfuh+1yoP8habgND9qXxNNuLad5ljOLSWlJgOqRAJLHX0XSDZzLVXBwKoOgTguHOtEiAzAv/aVIdXK3w9jd0+/APYHL2QQ1+2ZZdZrJ85E541Bal5sxx60V9Omgzwkhv1K2KQSSFscyx2+o61wW2mHfllAMcHZqUC16/idCksMr6FeaB5T/t5hDTELKyDuwMN13nQlEbSmv4munuIQwEghtzqxi3BiVFEU6UO7aYJ1WS7LYuRGGg9jsg6x+eZRyDEFKRHHAovCxcny05HyOBP20lpZeQkqxx/L4K3VbrDa10D5ktMl1r2dWkEgWUE0u/JX0V/3qXh9PBDVI+CxigyRtWNKEiHxi10VSZiFggH6/BcXa2wvmn/xkHlB5jVnJS138JNOLEbcrlqOO5Jwj0jGslGgZgr9yKfJ0P0c6XQrO2feOd1lurY77xlX4zwJIv/2SStA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4678.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(346002)(376002)(366004)(66446008)(5660300002)(52536014)(64756008)(66556008)(6916009)(33656002)(66946007)(76116006)(66476007)(71200400001)(8676002)(9686003)(55016002)(91956017)(84040400003)(2906002)(478600001)(54906003)(7696005)(966005)(316002)(8936002)(4326008)(86362001)(83380400001)(166002)(26005)(186003)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eur0hDAa/QQ2dXDnJsXVFkHVh3Mo4OdYvNT7zTacMq9y0jgpzD8gwYX4RoqP?=
 =?us-ascii?Q?ZGOcizjuLICpX3a73aTt+31n7fGrdIxNIamLOe9tNfbyutISjJed4gJ/ReRV?=
 =?us-ascii?Q?raTRBaWiWgf7P8jKv7LCS11p+0rULvPfgVI2FVkblEtVp6KOjuB+AC06CxS4?=
 =?us-ascii?Q?HD2fX12JNTN5MBJ/LsLRUjjSUDAXkEeKSSPg7OAJGmiBvYV/YQRUbKkWoiVy?=
 =?us-ascii?Q?kZVQ0PEEE/nj/oGuz8IaOcrZklDd81Q20d+c6cpjimpXI1HHlagrbexIIp2q?=
 =?us-ascii?Q?zATonEzbJ0nawOXkPMQ6OR6SBVuervMQpO1gbiy+2VTtSzc7MCu/jll60hIw?=
 =?us-ascii?Q?Ru3SE3LQQWfTzQeSUatltlsJ4/YgmnHyhEtA39raq4wUJj+gAKVw081jG5u2?=
 =?us-ascii?Q?eFY2QQRqhZTCPFVy6L1Lcw9bYjHPQULiMvI87cC9UcK6uy7vjzZPZyq97j4Q?=
 =?us-ascii?Q?ab6aEy8Ef+gBXB9GmCpRPm6e2vIQwSV7tcZkGbQFLjAuHn8HoBflkgrcS2gr?=
 =?us-ascii?Q?yYQVOh7AkRD+xGVT2VEINnNsgpi4+CxGpSBYnYFAx2/D0f/HVtdG5j77Nafz?=
 =?us-ascii?Q?9f64f2CSQi9yh5umM/77nD6/LtyEw6eGmNpW6XZp5aRSwsb8yp53AePnpXZ0?=
 =?us-ascii?Q?fpk0K2S/yEVphGOUfpuvh3g5nLCHIgIV0BC8hgVYW48FzgDAjnnlRkcsLGSr?=
 =?us-ascii?Q?FO2CpfZJgVyNk0XTKpk0SrCVUUDNGmUbzhB9spgPG9oBAMBu6K+7D3FXWFg5?=
 =?us-ascii?Q?sRFTRERtNmC/bh84SUN1grfAJi3+t0ba+QyMFXk09aO9CGiXYDrsW3QoD2z8?=
 =?us-ascii?Q?wYkI3tLg0I4FFPpyz6lru7tyxW4zXx7SBfAyNnaAG04Rd3w4skEGPKZDIBoz?=
 =?us-ascii?Q?T1WdLvuKJlIHUVS0rSqDhFY7ehej4ylurDwHsu5DicVhDQ4vCTMPIhKoCXvi?=
 =?us-ascii?Q?MueDp5BuNjQbKbYztEqmwuZ3rFPrvQrQznFj9lp2iZROxdvRWR4PfcTRC1tY?=
 =?us-ascii?Q?lm8nzFQS0Bmdz7spjE6DNzd40LClVkgXoSe8AN20jHzEzzAA5pq000W/wMXj?=
 =?us-ascii?Q?aorSe1zh0+bkq48UmKMqRvNmWSD/EgsUi4wMtBh/xsYNPfjDTZakRoYm3BK5?=
 =?us-ascii?Q?wKqyyCRxVxhuoZgy8Ya6fH0Qf+ew86VA4Umt01oyVbbAvOHp9BUqrvCvMX76?=
 =?us-ascii?Q?6CO8eIo1VZzArR/lPSpjtSN4mu4c8yKdTc3TW8f0JTN/1oXyIt5CDBrRkYye?=
 =?us-ascii?Q?ftImIvYue8SsBH0qepn+M035qCYZJNNwVrDUT3cPrQAJOZ+vLL9xXwsB92U8?=
 =?us-ascii?Q?+rFBorwfe5cvLqh9XHfcowPM?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9BYAPR01MB4678prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4678.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3825fc-2415-4c3f-f19a-08d8cc7f825f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 22:18:49.0805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFYUhy4PYfOrBa3z+Y1M1Yv0jlkqyCtoYMOzYwuHuCnC1jvx00aTNWRa1IL+owBb6RbF+8DJXMQ3peItj3VB/kkF6I1RpFZ6jWQlrIjzf0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB3941
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Lancelot.Kao@fii-usa.com" <Lancelot.Kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9BYAPR01MB4678prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,
I still not have the permission to trigger Ok-to-Test after adding myself t=
o ci-authorized

Best Regards,
Thang Q. Nguyen
________________________________
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Sent: Tuesday, February 9, 2021 5:12:22 AM
To: Thang Nguyen OS <thang@os.amperecomputing.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Lancelot.Kao@fii-usa.com <=
Lancelot.Kao@fii-usa.com>
Subject: Re: create meta-ampere folder in openbmc repo

On Sat, Feb 06, 2021 at 11:42:54AM +0700, Thang Q. Nguyen wrote:
>Hi Brad,
>
>Sorry for asking for your help again.

no problem.

>Currently, I just have +1 or +2 permission when submitting codes to
>github.com/openbmc/openbmc/meta-ampere. I don't have permission for
>Ok-To-Test and Code-Review-from-owners. Can you help check?

Is this the change?
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40355

The submit button won't appear until the patch is verified.

You should add yourself to ampere/ci-authorized to fix Ok-To-Test.

Please let me know if these suggestions don't resolve the problem.

thx - brad

--_000_BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9BYAPR01MB4678prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Hi Brad,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
I still not have the permission to trigger Ok-to-Test after adding myself t=
o ci-authorized</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Best Regards,<br>
Thang Q. Nguyen</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Brad Bishop &lt;bradl=
eyb@fuzziesquirrel.com&gt;<br>
<b>Sent:</b> Tuesday, February 9, 2021 5:12:22 AM<br>
<b>To:</b> Thang Nguyen OS &lt;thang@os.amperecomputing.com&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;; Lancelot.Kao@=
fii-usa.com &lt;Lancelot.Kao@fii-usa.com&gt;<br>
<b>Subject:</b> Re: create meta-ampere folder in openbmc repo</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Sat, Feb 06, 2021 at 11:42:54AM +0700, Thang Q.=
 Nguyen wrote:<br>
&gt;Hi Brad,<br>
&gt;<br>
&gt;Sorry for asking for your help again. <br>
<br>
no problem.<br>
<br>
&gt;Currently, I just have +1 or +2 permission when submitting codes to <br=
>
&gt;github.com/openbmc/openbmc/meta-ampere. I don't have permission for <br=
>
&gt;Ok-To-Test and Code-Review-from-owners. Can you help check?<br>
<br>
Is this the change?<br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40355">ht=
tps://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40355</a><br>
<br>
The submit button won't appear until the patch is verified. <br>
<br>
You should add yourself to ampere/ci-authorized to fix Ok-To-Test.<br>
<br>
Please let me know if these suggestions don't resolve the problem.<br>
<br>
thx - brad<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR01MB46786DC69D7FCF46045FD1FB8D8F9BYAPR01MB4678prod_--
