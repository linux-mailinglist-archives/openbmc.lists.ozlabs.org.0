Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C9622AE8
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 12:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6jsl0JJxz3cH0
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 22:48:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=aqiPLAn/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=43124f46f2=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=aqiPLAn/;
	dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6js51R6pz3byZ
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 22:48:07 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A9Awsr6019718;
	Wed, 9 Nov 2022 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=D5Y9yz33LUNZi0PvWbKAsjxydNIFtntrg2c0eYUz/rg=;
 b=aqiPLAn/u5tnImOp9JW1rOyUZ+EzuBMoYk8Hh9UPos2iueThp9+ng1jsvHOyc3JsC6I/
 028BA7vo++6+01ZC+KNgkrJSH6udj5ebn7n8QVyM5uYT5IXzfgaJG2JX6/M2/MWtAGtO
 rUGU0KxwL41OBzhtqmcCzC09OF+lqiD3jQz+uBVIfYt3BdFYU8SCDMGxFJtz+5FV0h5D
 a0idjYnTcErLvXlq4LCKyOu0/PFpOXvVTJpjANQavNUxWTkPMUH3n3RXCJTREq4oMBJ1
 J9pfExbnMQZ6Y3hhV/yw+DrUBP8fvxeyWdxKPji+SntqSma5Nj8oiS7TiJj6rMm7Fea+ 2A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3kr5wah1b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 11:47:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftyE7tnz/2iH07wWFkqf1nlEWPlkjvvnzyv6b2MK+0NjUtAPlkgg/pGm8cD2067uCprC9P7B8+N8NqN8vo6j7msFYd76udhefrtvg08JecGW+RD1EwFyMawFwJ8X7X4ICbnw8rTMk7yTu3nnR8i3Ium4Ujbf8KBGggTVdO1zPgJa0C5aCSes2mLQ97VuMgg4fps4gjnrOog+2dNQ7gBk7QoK87O3dFhorF3Px8XB0RMobu6IfvsdcXW2QLoRLlndk/Q0wmmHvZBi25YnNzuen06tEZCMebgMO2llGNn5+10flLWg1DlKqrHiDJGbNE3lxjpS6ftK4xz4OhMyvSulIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5Y9yz33LUNZi0PvWbKAsjxydNIFtntrg2c0eYUz/rg=;
 b=iRCYuFPlMo8UEiSKSgbcrmmwpYznPa3p1EbB5D8rn2q6/zJKbyAP2+6TB5eVff4TPm28e/f8Duidq8D0tZd7EX9Vq6/0hFfwq9dC/vBOkFmk7bsuHqikNXK7bCZH/TtrhRbtnISduWFuB2tHAuYQY5n7EWCoH6fvqSAzsCTiCqfRhsiI4x14M1JwvVxJ15YwXpghsjzM4+R+RDDN1J1y0ok06ehrxxymaKqJ27zcG4HaYqFEomlJbPYDjXR25AjYnPngR4LTnYofilArIy6mh4Z7TThkvUNyPN5Vhrz9WhlRXSfhHxlnhQ0bl+CZC1W/baA/0nE1znP5k506gwxs2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM5PR0401MB3576.namprd04.prod.outlook.com (2603:10b6:4:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 9 Nov
 2022 11:47:51 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13%5]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 11:47:51 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "config/ast2500:
 Enable RAM devices"
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "config/ast2500:
 Enable RAM devices"
Thread-Index: AQHY9DEYvrFv2xYkLUqbRc3EVzqaQQ==
Date: Wed, 9 Nov 2022 11:47:51 +0000
Message-ID: <20221109114748.GE18848@packtop>
References: <20221026064021.16683-1-zev@bewilderbeest.net>
In-Reply-To: <20221026064021.16683-1-zev@bewilderbeest.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|DM5PR0401MB3576:EE_
x-ms-office365-filtering-correlation-id: f52aae63-5382-4add-204b-08dac2483b43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BBsy187fGjh+WLFiMoSjmn3Zyprpzc65kRbbdZ1mRrO5vkC8+CZtvzs3MSUEpWtdmcr2EL7EB3PVCdOatDljtW39jWap3R3HzhpVvSiEDZRCX5iJANWaIvnSTkTbM2olQsz7fPCft2mXcEhT5rpCl9sP0ELuvDPgc/6WXwg1uiFfmuZzcCRUSg42XptsDjphNysQkE7+et1ZShZ9Xn9/Ntr4sa2btHdZsgPlG9v3YL17BvT1Ewbjhz6v5btIPMnTdkmANcJ7ehHTyafc7ufV+Vu1A/1Dh6TdMlCt1HZqAMY04w785OZaro0Pk6Bm4MPOrIVmlETrRCDG/zkHqyNZqJG7jbYqKS1jCVDxugp9+KB5hiQwh0g5Ahm6AYj279uu8Q/3mm/HFRAXbSx618JvrwuNxuriL8G/5hAOEpOEImapHlfZ4bf/mb7G09PNjrllF1BoUEgsjnoiiJiSd7n21FOAVPEXaTNmOORA3pS/OnuXzpQsjbzIT3pNbkgoKcGJZh+1WqE2ylBETYvAz6BSTYcUbbtHhbN/8vHteBoZb5YJ/uwxkqPCmsOXudPEv55aADpUjYSPWXtqeSgGYkP76bpAf4E53uJtohh3wE+akQWCkvkWFx5e4Zz6UfrOu6xeqH3ni1lsCvpFFMDQ8bRo6l5kA+PTuB0WooKAlqAIS9mABWV4DK0UhBxcwxQd0b2ltnVA+G9TyLkOGTfgfcVPnPvwXvp2RiHHf3nTov0JzzW0R/2TBZ4J/ePasNGjUROPGqqJMmW8j+oHPG183y3Bsj50VE4ba9PGITNeqVGXadc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(33656002)(38070700005)(38100700002)(86362001)(5660300002)(2906002)(186003)(6506007)(6512007)(9686003)(26005)(1076003)(33716001)(66446008)(478600001)(66476007)(66946007)(64756008)(66556008)(122000001)(54906003)(71200400001)(76116006)(45080400002)(966005)(4326008)(6916009)(6486002)(316002)(91956017)(8676002)(41300700001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?fHW5uJqDzRTgKkv69OujS7sZJDQOqbkB/JgjbiKyhYVD+L/VzImDcPxHjTVt?=
 =?us-ascii?Q?9FzED4oz3agu/N8RZ0u/ayOa1RNcvdctBEPyPHbEuyxkIslgpVAcjg+yHeqJ?=
 =?us-ascii?Q?Kn9/pBY2vIgOHmDIm15fc5Y3f0j2MfZmqE8O3rNgoLdGb/gYRZF5PSvumuZD?=
 =?us-ascii?Q?DlaXT+n8sxk/vv1EwmdLvA0wexpF5YHjBNfbDZWuFCGLF/g3cMG0dvszDcz+?=
 =?us-ascii?Q?luwwgXT6wAZeSmkH0POl1gaUhryhjEEQQJY7mP0KcFVBjY8DpvC2f02T8sNG?=
 =?us-ascii?Q?SQp8esm7pZrGfjh3x1nzZcwA04Isz5VMSMFirf3dlR1EP+Rjttlix0U2ef/O?=
 =?us-ascii?Q?oRC6B7IFu+pXcJAhlRlcuKexhvaPNwo0lG+j/iNOEhtCJqV0amq+dFvvX12n?=
 =?us-ascii?Q?2Mv0qcmvOZq3MeRKGygnZhstidU7SJa5vX5f7B3vwAp6neV6O5rgZ8qF7jLm?=
 =?us-ascii?Q?wafmoUr7psGsGX/8FuBo5Rb3rPiRkZt72Q3UlBQgEPFZxqqrM9E2wzxCiwrc?=
 =?us-ascii?Q?X7vpSKIP6vfkKpexw4nuMrSkrODD0UOUZajtZz0AZ8Sfcag2AJVv7DXKhNF+?=
 =?us-ascii?Q?MDEc06jPhZMth5h4Mergyi/MFGezGzPfdDWTDyUdv/vmu+wCbkKRXbNlZxye?=
 =?us-ascii?Q?x+9nZkizwgQ3gJYoUbq7yEMoBLIVo2QIxaLRTI8tpvfUQk14oJQR4wEXucom?=
 =?us-ascii?Q?B2eALbFGiMev9G7TX4tbB9z7rY9811wj4/pw0GZ7LWUe7rjUT3rrJg3W8JYz?=
 =?us-ascii?Q?3XA122/fVslXd3T4wgHd1NPN3Pv856ATIUsbBe2kmgMk+69eM6IWlG8X2R7S?=
 =?us-ascii?Q?mRpGx0T2/aLAPp1FGPpVS+lWPV7ku5Nvp95XrInfa2Mj7rSZFNJjzQ9TUmPD?=
 =?us-ascii?Q?MbPved4usFMQbzf72thJd3Shjt9IT3hQp9FZwd2/IORQ6kl1bCIAPNp4Nzh5?=
 =?us-ascii?Q?we7PRfXvA/3YS5rvbaAQmbxH5nwWASXwdGccuXskJbwvyWeJZl19qUTEiF5K?=
 =?us-ascii?Q?Ub6Pdk4J+zqoEdpvKj5MvNlS/meYoUXf+NJYNbR4vXf6Hzmwob0Xv8BdXGu+?=
 =?us-ascii?Q?2gCzHWlfXCNgK6+V18Ja0uhGGM6J/ZikuT+oMnSuJ/WYXbZ5zQbBDoHRaQOd?=
 =?us-ascii?Q?ZNul6nn6qRqLbAivqZ1Ih0vtzR7VgpCQhLggg49dHrfXNOa846vSNFrUyHda?=
 =?us-ascii?Q?V9KV4+GH67Vqe3/a3z5WAHqrbzxsyoINQCCG/Bk0eKtJH46LSx3qrkW3Yp3N?=
 =?us-ascii?Q?gQLNb2wDoQLo2BtPc2nOUFKv+0eSxibhw225GoySGmhhrKa8mKslBHzW20RD?=
 =?us-ascii?Q?yoRKXIaOhSrwnOV5+HJNPOchW0iacQxCek4867zDZbtC+lRh485gVgOpe+gI?=
 =?us-ascii?Q?q+f/TnZW7+t58p4m7yVktMk3ErkSRKU6C1O3mekAFqMprP4qZ41zSUNPGaiM?=
 =?us-ascii?Q?RrHsSucr4Gwil2M01hUZAtkDxia7q3ndrMEw4hVl2KI9j0eZk48yi7sovoWx?=
 =?us-ascii?Q?0O61PJPFJcLfhPyE0RmpgINUXlhdANoMyYkIfexTYRzQI8u3HNFfPnq9DVla?=
 =?us-ascii?Q?elhLt3+15gHiamiJTCduVMIsMULXoc61faV8p7o9?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23BAB5B6051F624FA922945C328DD911@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52aae63-5382-4add-204b-08dac2483b43
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 11:47:51.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCm/YqYkwxC3do0i9n3dJt+urbVQCztd4HZfKLi4NATbx8mmfQNSmmLEieN1PxM8gsO8dhuh+pHZu22Y1bWR6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3576
X-Proofpoint-GUID: eSzVe07sJzNKmbwi6m0bvBCIsRQKOfUh
X-Proofpoint-ORIG-GUID: eSzVe07sJzNKmbwi6m0bvBCIsRQKOfUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090090
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zhang Jian <zhangjian.3032@bytedance.com>, Joel Stanley <joel@jms.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 11:40:21PM PDT, Zev Weiss wrote:
>This reverts commit ba91e9df1e16db0d209177148e864c65e58eb00f.
>
>CONFIG_RAM=3Dy currently breaks DRAM initialization on ast2500; Aspeed
>recommends against using it [0].
>
>[0] https://lore.kernel.org/openbmc/HK0PR06MB2834AE1581020A5B7CE191839C5B9=
@HK0PR06MB2834.apcprd06.prod.outlook.com/
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
>
>Note that I'm not at all tied to this particular patch as the fix if
>the interested parties can agree on better course of action; I'm
>mostly just hoping to spur some further conversation given that
>currently a vanilla OpenBMC build bricks my ast2500 systems in a way
>that's not real easy to recover without a flash programmer.
>

Ping...I'm hoping to get e3c246d4i migrated to u-boot-aspeed-sdk soon
(bearing in mind the end-of-year deadline suggested in Joel's email a
few months ago [0]), but with this issue outstanding doing so will make
any such systems self-bricking unless I hack around it with a bandaid
kconfig fragment in a bbappend, which doesn't seem like a great fix
since it's not really an e3c246d4i-specific problem.


Thanks,
Zev

[0] https://lore.kernel.org/openbmc/CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5=
osATYnqqutSw@mail.gmail.com/
