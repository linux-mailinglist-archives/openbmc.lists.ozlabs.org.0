Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360146C209
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 18:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7nkc0zgpz305p
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 04:45:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=Selector header.b=G7H4Hxut;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.247.5;
 helo=mail1.bemta33.messagelabs.com; envelope-from=dukh@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256
 header.s=Selector header.b=G7H4Hxut; dkim-atps=neutral
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com
 [67.219.247.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7nk51kJHz2yp0
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 04:44:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
 s=Selector; t=1638899080; i=@lenovo.com;
 bh=0wfwcP8xYil+xVBvTgvdf7Ruwe63b7ywuP7dAPlDCRo=;
 h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
 b=G7H4HxutldYxc4p+achgfP3zPibiVB9jG0WH/UXNwi1+bjIxFnGwb/aCBMAFfBjGE
 M5KtQDnsR/pzh9owGI4Hll4wzPUHJv5eg0Mu+ADH1fuYbr4cjJtH3tNr+52EYKfRuq
 Ix3vad2Ai2ik8i+7FJWAnbsBqtgfpg9ofPKnjqQ89vPyX+ZlwfK7O1Znm3FWPlCQxY
 uBlWvOm9jLadUtz15nJgzQVn5W4AaqT/D3NLu3ZcoXL6PwXMuDWcKqJfiBJza9gEiQ
 dlwLa9fqgHKmAqGq9es5cBde+oUSClWeRva+tYwdV1qlhuKVPODx8XWIEKSskLd+NE
 2pN4GrsRoMk+g==
Received: from [100.114.67.132] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.us-east-2.aws.ess.symcld.net id 27/16-26186-88D9FA16;
 Tue, 07 Dec 2021 17:44:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWSoS+lq9sxd32
 iwf0v7BanWl6wODB6nJ+xkDGAMYo1My8pvyKBNaO54wxjwXnpih+3VrM3ML6X6GLk4mAUWMos
 sa7/FjOEs4hVovfKZiYIZwOjRPevz4wgjpDAbCaJdUvmsXQxcgI5dxglpk5QBrHZBJQkNj+9w
 wZiiwhYSix50A5mCwuYSmxd1gnUzAEUt5Lovi4JUaIn8fzUarASFgEViQldTYwgNq9ArMSP6V
 eYQWxGATGJ76fWMIHYzALiEreezAezJQQEJJbsOc8MYYtKvHz8jxWivkTi1sv1bBBxWYlL87s
 ZIWxfiSUdP6BsXYlXD5tZQc6REMiRuN4LVa4msa3rJNR4OYlVvQ9ZIGx5iWmL3rND2DISD25s
 ZwMFg4TABDaJK3/+M0E4X5klzp5aA9VhIDHv2xGoqfMEJGZvsYd4IE/i1vHlUE8KSpyc+QSqX
 lpiwvxVLBMYNWch+XMWkpZZSFog4joSC3Z/YoOwtSWWLXzNDGOfOfCYCVl8ASP7KkarpKLM9I
 yS3MTMHF1DAwNdQ0MTXTNzXRMzvcQq3US90mLd1MTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2
 MwESVUuSst4Px94FveocYJTmYlER5n05cnyjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfTDKCc
 YFFqempFWmYOMGnCpCU4eJREeDlmAqV5iwsSc4sz0yFSpxjtOSa8nLuImePjqiVA8juYvPkeS
 Aqx5OXnpUqJ8x6eA9QmANKWUZoHNxSW5C8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtAZ
 nCk5lXArf7FdBZTEBnObeAnVWSiJCSamAqLP775p/lxo3nbA7PzLP/6V1z+6evy0Wv13LSPXm
 GD//ZzkwNi366/ONsbp0648llBY1bfW9qLefZEfnFV8357XPrm5wP15Zv08xcHh+T/Hvm5hPP
 rKWf3b+7QCdTdKtedce5p5z6NdvDD1Xv72d/86z778y1YeE3K4rvR32fv+5L9648pQe9jpwnJ
 d/WP6qU2vz8z9NDK10aTzJOa2kqEAk7HpZT+Gz3J8X2rLQJCyZtvtLvfm/qh5578kn5lS8++n
 rlrJE3fcCYk1J2Y5vsxR/5+QdmPI+7LbA+oabB/jH/tQeLf7tOTxYrPnH4/E8dNqkCv/tHeWX
 mJH8udljl+Lnm/0HlizduVrnNTf6nrsRSnJFoqMVcVJwIACDQb+xtBAAA
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-14.tower-635.messagelabs.com!1638899076!9890!1
X-Originating-IP: [104.47.26.45]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13258 invoked from network); 7 Dec 2021 17:44:38 -0000
Received: from mail-psaapc01lp2045.outbound.protection.outlook.com (HELO
 APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.45)
 by server-14.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Dec 2021 17:44:38 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqyZlXA9upByuuHfrI9jUAb2MldgVLlQJhaPYJNj1ADBIfGgNsoNPqYWdzS9h275vBv9/y6D5pRJexsvasyGEoVVP7cWIlIh7FhPb9AgHXbLtaFITaIfkmTUhKxp+oJcm4AezTGTx0MG9evr4ie5vXLz6gRCdeOiSvWEzXEW2ELeF5q5t1k3ElIk36KXMly5fTFtrkfNcVzzXR3kJ2K9V90skQ6btO5deqAqDFq2IU0FX6aDoOpclaZ+4WTu/UcIs0wW+O1nT5pZPsi3F/I8G050h/wS+nkFJY04WkHP2uycS6Ah/OOlZTQOfIMT/pSDfoDI5yEv0FZJej+JGqyIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wfwcP8xYil+xVBvTgvdf7Ruwe63b7ywuP7dAPlDCRo=;
 b=VXSsJo6S7YtbOtQqT3ilxM6nDPubohZXIPNw2oY0Ec80mY7lmOWedRxl8UoUJYl/7yy4qIrEz9mJptSNmSdjDbn3ArP8FGskI7YXeia+a+U0gquFY+svng+DQQmb/Zmz6yaLyaX2DifByPZBwjMOG8brrrwUUnow9IAd6uTP5PR2j+Z7Ny3mmgBoYAJOYK349yjt/orBGZhJbSXqhQBTqCpixH3r1fx7+8hPnXDwwAvPkwGCb2AQTBMRl3DmHCBWQqwDgHp+wNsBduDs5RflrjBtXZxvnigqUFnrpNE3G+jgPLpcOMm2vWuLXUDdoiGpoPcGefLNpdzIcsM4q1c0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB5831.apcprd03.prod.outlook.com (2603:1096:4:143::12)
 by SI2PR03MB5786.apcprd03.prod.outlook.com (2603:1096:4:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.9; Tue, 7 Dec
 2021 17:44:35 +0000
Received: from SI2PR03MB5831.apcprd03.prod.outlook.com
 ([fe80::4058:258:50b4:78e5]) by SI2PR03MB5831.apcprd03.prod.outlook.com
 ([fe80::4058:258:50b4:78e5%6]) with mapi id 15.20.4734.028; Tue, 7 Dec 2021
 17:44:35 +0000
From: Duke KH Du <dukh@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Apply edit permission for Lenovo CCLA folder
Thread-Topic: Apply edit permission for Lenovo CCLA folder
Thread-Index: Adfrkdat6+RFCn7nTq+ELly0GnVdQA==
Date: Tue, 7 Dec 2021 17:44:35 +0000
Message-ID: <SI2PR03MB58317B51F6CB17FF2910D4F0B66E9@SI2PR03MB5831.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cf22021-53f0-409d-a08a-08d9b9a93bd1
x-ms-traffictypediagnostic: SI2PR03MB5786:EE_
x-microsoft-antispam-prvs: <SI2PR03MB5786CD86B1DA63494990FA7CB66E9@SI2PR03MB5786.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H3pF3jqukINuDJcQ6rbW2x4qkv5tyY7KxWTWADUqdR71qUn/3rSKyGhjhBbGQfp3SMIjg8/ANoF5VHu6g6RVtBd0Amp4xy+TuB1meyXjZOGxBR2isQ58E2iwbMbv/FD/u2iiPxZL8CCCW9HJtjuHklnA9fVpicchXVHNljeQs51mCCpnhtGvGlG79Vl8QLNTUHra3hT/dPR4rt3jbGslcludN/ChWhVEfnoxT2xlZ2ixFgaj7BEplKWYa0/NRvkbdIxcmxlxUv8ZP5zPJq8gjW8rWf/O5tBYLq/E52MQ0FCLepcfc/glG4fRq7+bfnmmfgr+7FYDsnpOLG1ypJ4bEIltxm9dkqhVNFtQT+8j1ah2ec5nLPv+IrL+0ksec1N2AJNgi6MvtlWxDpbqqYJ1CV0mCLSMRnsFmBidODWNqIpkdTMkzuh8dmlW1iLzfkoKzvaLaU4EYpCESFpHCH4ktYZzEUFlUJgOgcif8ggHcQGnRZjqbDHuIrKetq9S3Ddk7yISdTr4G+Mk/KkQTyXEgimESpugoT29gkw10f0LprT2hrtTHhhZVJOohzRkuJOCHGcaUibPVSqKqp2fwEdod99Vw8caMOOVaqOXnpo+H9FwLssTfPuSbPKJwOAgH7daHhB+9NdYr+RpKamm92WpX+B6hcM6Zxo0xuOv1bKmoYcVIq+2hWay3igBk1QLKbz7c8Ar4a51n1wUg0XCdT0U72QUKdisgQdoKDVVtSSYnFo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5831.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(83380400001)(38070700005)(33656002)(38100700002)(26005)(53546011)(6506007)(186003)(508600001)(6916009)(71200400001)(86362001)(122000001)(66556008)(64756008)(52536014)(66446008)(66476007)(82960400001)(55016003)(4744005)(5660300002)(2906002)(8936002)(66946007)(8676002)(9686003)(76116006)(7696005)(80764003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Y5Htp0JTEB5ZlmfjeVW+qCExeGPSE2PTbcezCqeBVftzOiFR32ti0FCiLV8?=
 =?us-ascii?Q?1AcvD52YJhRhsy3SA1E6XuBdcnZAZ9QJ9UkTEYgiOiNEmMSw9az0w60X/IzT?=
 =?us-ascii?Q?QSp9YjTTpPGRxYhVS0WYF9M2Dq9DMXCAb5+8n1xRyLLwIFbJCi0GBEPnqQYU?=
 =?us-ascii?Q?KcMBqkhPhHaNw1391PBsdHHnh9TgdBoVwGFAVZRzuViaaoWqj1ZMTM1T+uEN?=
 =?us-ascii?Q?S8nJAzCkFfp8z6QjFSd+FLp5Mio4o8J2d9T4CSqwCJ/uxfxuhUXLDTjg/g2w?=
 =?us-ascii?Q?lLqI4NlAyrdFIgBEs9kTrqsaDP2vmIddY4cO6g64kF5t0yyu0m9z8DrtNeEl?=
 =?us-ascii?Q?8FkdC10JmZYmlVIo2jrojTKpatvlunBzorMZ2Tz6CG1rVidtt0Y2NKmPrgut?=
 =?us-ascii?Q?WlavDmyZHpKO6c2pI8dnT7hVtYUg7v5kD9SlAPRTDAx6pzaLjIirPkH5tmjR?=
 =?us-ascii?Q?Wd/zyB/QRhdpq0I6dJREc+3IfsU0XZzLCLiELVLJTDZo3QV9F+zXHPHsMjuh?=
 =?us-ascii?Q?P4B5Wn5KhiXqqyl/9WH3DHxLLmJHaHJsV5ScNfuNXSWFJSf5vRf9PoGcm4ry?=
 =?us-ascii?Q?tPu2Bh+wm+0Qwmu1dRHh71K+K8arvXNwd51qqWefm0iFTbKctW5u+YlKkRkA?=
 =?us-ascii?Q?5NbAY4IAxq69ITr3Fu2s0vRI/Zan3UurXu6K3FNdG41PN1EF6zMnCurra6qh?=
 =?us-ascii?Q?cppWe43huE+98xHb3e2LNNcUYinwDcp9k/zV0mDLKKykF7oIRrXKjwYHz7+l?=
 =?us-ascii?Q?l1AK7zJkeR8hcOTae3iqSGR460hjj6YyxcHiQrhIeYqj3gW/Y6d/VM3/FrvY?=
 =?us-ascii?Q?Aw4p7IVShcT74gS4m6JZOdrppg1W7HL+OVfjYpaEEa5ZJaRd3dWYHM7Slkc4?=
 =?us-ascii?Q?8VjW3nXIts0fqvTU6HXnKMdJESgEsL3i4oaAn+7daF7MJIzUnenqYDV0neSc?=
 =?us-ascii?Q?dul3l9OFjm/zP0OCjg09pBLHQ2+UMX2MZU6/DYaxStx/BUOhiyd8gsZrZ+WA?=
 =?us-ascii?Q?rwop+XVD6ADvu9Co/A/gWBR8ZdV6AsLGLsdjxyoYKhYnlCxADOBzzc1RkHdY?=
 =?us-ascii?Q?vGzBiC1wHicBdL+tuHfh20Hm+gVHWjXXkev+cZ3fa7bUBDJI6UJqz/lIcSCV?=
 =?us-ascii?Q?uoXQ3M5VsBVXUCHO8NEAg0IJa4LPjiRNqNYaHDdRrqWFs7KUATTf+FvbHYG7?=
 =?us-ascii?Q?L97fRT82NHOmgTO0xUTCvLNUHXbAvfCoLS4LY1nvJq6BJMImu0SjNmDTLrOm?=
 =?us-ascii?Q?P/xKwC0oyF8kHOcnJHJ+Xcgp/jOXjxzl+rQJ4kt+5EHzpM6qq0qq7GGZLs/3?=
 =?us-ascii?Q?7dJRKdw4+OhaT67dfNDnwzkcz8qPVW3bHHpUBq8HQViPf7Q4+L1B+Q+ems8U?=
 =?us-ascii?Q?I/jsh6309afZQwNeChrjL567l/PufrSrK8+RSudb6vC3qdq7rDv6lfrVOFBM?=
 =?us-ascii?Q?gkNvLMFOGupaK+XCFaspRxiug4SxqNR+QeNos3+Nni+Mo8awRJylG4l8q7/m?=
 =?us-ascii?Q?c2dvTcnmGbuPLWSBnfbC2GpDjVT1Ja25nznQQf+MnQXm28ABPe1ezMEOa2dE?=
 =?us-ascii?Q?AN1Al7ICt/Ujm7AnC7s=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SI2PR03MB58317B51F6CB17FF2910D4F0B66E9SI2PR03MB5831apcp_"
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5831.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf22021-53f0-409d-a08a-08d9b9a93bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 17:44:35.2566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zkb4bYKhNQOGgVAWdGt1VAl1HqiMxq6Eug+A/PNTbhc2YTfZV0NiKAkWObSj6+QW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5786
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

--_000_SI2PR03MB58317B51F6CB17FF2910D4F0B66E9SI2PR03MB5831apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad and all,

Could you grant the edit permission for me about the Lenovo CCLA folder in =
the Google drive?
I will update the Lenovo CCLA.

Thanks.

From: Duke KH Du
Sent: Wednesday, December 1, 2021 11:02 PM
To: openbmc@lists.ozlabs.org
Subject: Add member in the CLA

Hi Bishop,

We would like add some members into the CLA list.
The attachments are the CLA files.

Thanks.

BR,
Duke

--_000_SI2PR03MB58317B51F6CB17FF2910D4F0B66E9SI2PR03MB5831apcp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">Hi Brad and all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you grant the edit permission for me about the=
 Lenovo CCLA folder in the Google drive?<o:p></o:p></p>
<p class=3D"MsoNormal">I will update the Lenovo CCLA.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Duke KH Du <br>
<b>Sent:</b> Wednesday, December 1, 2021 11:02 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Add member in the CLA<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Bishop,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would like add some members into the CLA list.<o:=
p></o:p></p>
<p class=3D"MsoNormal">The attachments are the CLA files.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BR,<br>
Duke<o:p></o:p></p>
</div>
</body>
</html>

--_000_SI2PR03MB58317B51F6CB17FF2910D4F0B66E9SI2PR03MB5831apcp_--
