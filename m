Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3734F5A3
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 02:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97FR657cz3bwM
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 11:57:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=cFW9NMuC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.80; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=cFW9NMuC; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310080.outbound.protection.outlook.com [40.107.131.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97DZ15Csz3bwl
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 11:56:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQaMsquoIoPbqPYhJ3IZq3pjYTjVNBPgH/7M2Zjgjww3RcouAaURZHng8sxrafZ4vhS1KIQa+WjjZbvkzxQmUJB9cXrpfUxaFq+tFMz8gYeDmcyo9D49dKZIzFhLM/Zpv+4CfBwE7w+V5xDZLGNI+o+MNwdoY7ehkAkSHhnu1g2kLO8Gf8I2X91DDmQZ8tyfMef/8LXbqvqQ7a1Z2aSyMcELYb7xytwOQBjo80z+3AkgNHltJLTO5y7upheGsEKq3vCgb/04RTChVmKdR4LQgHTYN4J+bVJ9kOZEY4oPrZk5K66cznWUm3pO9EUl91TLyroTKSs9YoIg7BUdDFBzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2abYJKKqlmbUc+43HMVPBg3D4rKDGM1pqW0tDJIaf4=;
 b=XImciQVxWFI9P/JzxQGA0+K+B9lzhRhzfWwhbpNV74W9Z3etpOpD5SQd7tg7h5HJ60MMOmZaPZhH3tf0fb0yNOU+E3F0UopKpLfQ+kY5dvDESyaL31RXD8ju8oMi8xNkyMf3qXkP+xCJ1RARuWWeUIEvoC07qjS2CYJv3poGf6dFNiSng+yeNVryldjMqWTJuodu9kj02UtFIHwpBxcqKa5H4gTJ5goHZFKOsOYmUvOZMLL7jT75IDkCQsY5XfWIQmNv3EElq9eP9pDW/T7aZPjiMngh3ZGHKJ/odrfw/M/XHRkxsQLcMU15iUAXL7AnGmJgzh8Opnj27pEmkINfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2abYJKKqlmbUc+43HMVPBg3D4rKDGM1pqW0tDJIaf4=;
 b=cFW9NMuCv0OUua9X7lMY1zDy0agcbpka6jT9RP9FD4Q+MYApbzre9H+nqWXSA+v3urRkGFavWxoGJMm7hMFfbDr9hvHl3ayHCHOVz89/c7a/dD4pxml/1mUqZ5zpda/ggYrSeQn9WuGYcjV8G9B255zhT76TQwRyOt7YRyjYkwI=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK0PR03MB4916.apcprd03.prod.outlook.com (2603:1096:203:bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.14; Wed, 31 Mar
 2021 00:56:12 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::ccf4:f360:d6ac:ae8c]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::ccf4:f360:d6ac:ae8c%6]) with mapi id 15.20.3999.027; Wed, 31 Mar 2021
 00:56:12 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Topic: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd
Thread-Index: AdckYUdVvnoSdGPcThuquxaeQmoqIAAqg4oAAAFymlAAKPTlAAAEnFiA
Date: Wed, 31 Mar 2021 00:56:12 +0000
Message-ID: <HK0PR03MB50905D2E4F78474328A8A05CCF7C9@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <HK0PR03MB5090B60085F8D0C40B0D9496CF7E9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <CAGm54UE+zUQHXiLONCVUZRuxOJVC8Mhkxo-A5DZtb+t56oiHhg@mail.gmail.com>
 <PS1PR03MB51000EC29C060029981CE8B6CF7D9@PS1PR03MB5100.apcprd03.prod.outlook.com>
 <CACPK8XfyM4R3y7DDfU3Yi13z5QiA-7ciUUdtz+m970tU83-z3g@mail.gmail.com>
In-Reply-To: <CACPK8XfyM4R3y7DDfU3Yi13z5QiA-7ciUUdtz+m970tU83-z3g@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ad4e603-7fcd-4f84-f0c5-08d8f3dfc7a9
x-ms-traffictypediagnostic: HK0PR03MB4916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB4916C4EBF65A2DA517EA51DACF7C9@HK0PR03MB4916.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffdqvHBfmllS7fsuBlP9eDijY3I+/4UkH7AX6Px16iMH+mTU0CMDQJAvZswlAuxPeI6q/pr4+wY6of8F223plLfbfHsEpkDYFxzfO9+CHxh40zWZJB0VBqKYP/septkA649gA80rB2T4yE14+v6zgskfYx0dbyM2YSw0071XAFLpTKz56lAcfll/9Y71sFfvYHtM1xo4tgLJcLkU9BiLdhmbuAudjCNL22JUW2GMk6qxJLkckVHszaeLNtLyIip2DG5ZMs2ntQin/yeGqHIygXnqCSdoKW7f2CUywy7ObJ79Mz2h7RHnbnKGwy1d37Cd1oCcqp4gihgCewWle4QUeHHildVYZzOWlq6ncGMZnu7XcjDoO1w3ys+UUpQyW+96FMUHlQL7m6x7ratei0MCcdWoIYGmd3jvpcYEZ036n8BVaJ/7s1nLlLPF9G2zHYHc1fskpKHk2bqYGTuGIqFnSXceI643Xt7l5DRNVOHbYJxP5Q2HGNNZOh3vedly5w0at4IQdPEWRDZQGG++bgWZM1lsBar0UUzdAEmfpJlc0hSgajwV5+FS1WB3qlZGNqUNGEMrzWCcD+p5mldwtKjcHWNVSskRYD3uXGscPxFkpdGLruwDhFoXCSpjs6eRF6buE0JGlKRKt6t+Y2BJ5ODZd9QLX+aeJHmkkqYm/yCU0UBNM6YHfBB1XU0D7/oSVGBlDPbUfvrq6K+FxB5lHUpWudq/MVq+PSin+19UvzIm+CtgTGEXvdMlNgR4k3Bc7RfG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(5660300002)(8676002)(71200400001)(186003)(52536014)(76116006)(4326008)(478600001)(6506007)(55016002)(66946007)(66476007)(64756008)(66556008)(66446008)(966005)(33656002)(9686003)(7696005)(107886003)(2906002)(38100700001)(8936002)(316002)(54906003)(45080400002)(86362001)(26005)(83380400001)(6916009)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WPMK6Q0uAA9WAvr7NgW1MKy4KqatbbZkK0L7ycHGz8I06/IIfk3i9ef6Pa3Q?=
 =?us-ascii?Q?UH6uXWeZHD7CTLARkQnHiu/xHf4osozj2HevNZR/7f4p8gb4X3GIB1A8e4hU?=
 =?us-ascii?Q?/GvtueflQxvvRz3dME6WGblzDoQKtSeyDx/sKu/zNhdmovPcs48gCNaKwkYp?=
 =?us-ascii?Q?Ac0kTdInL4r2c4W07NCYdLBL4q0DipeLI/PEPxZYbiHRAgmk8z0IBFsiUsY9?=
 =?us-ascii?Q?6sZFJyvWmdHjaJEOUwXijVOmCckPKdOOoUB2T3/ZICVDXNAJTiRI8r1ug+Or?=
 =?us-ascii?Q?67d/1ODENKPYa9YlXr5N26AE27aEILYVmUIivNSWyW4UweAHZYgeSriXv9sd?=
 =?us-ascii?Q?q+BBq5aZfUR9eER32IFxsrc+ZLYlOBm+r88xV3hyz2e8qqTRVBT2Xbw7Rlgi?=
 =?us-ascii?Q?vrRNqOT2pZ+1834zX22q6UbwNXTDiGyXboGaPv5Y/tKOZP0JRmpQmamsmfAF?=
 =?us-ascii?Q?mSaVfHh7yTguzG+HOyKDUVpzpqr4GMPe2MTyGlNZeJNod/jzIV9Uh93dEKfY?=
 =?us-ascii?Q?3+ZAMPVGovIQB6vB+gKyEc1HzKWvEGlvVastDbXfi9rsuproxErTmicH7gdU?=
 =?us-ascii?Q?VroiKbkQgsf4Z8onUN0rbOQSU5/yHX11AdVtyKg9yh4GStvMQqcyUnTq0qaE?=
 =?us-ascii?Q?ivixIu3PsI9M3glZ5jcAasxjnWvSLCJ1uiJ5yjbM7zCAYZq/OtSdmyAipuJc?=
 =?us-ascii?Q?/R3JhpH+pmiNRqNBm6q4OTNJHGXPfkBYs1mesghq5eCxijv6CEGB1fVhkqDb?=
 =?us-ascii?Q?h5anvYTrVdYW1YJmPUTxWlXEQ8ZhNtJl4lG0p59DPWy6lu+UTWmHy6BhJC7E?=
 =?us-ascii?Q?a1XqCEB5NBkJazZgn/ejCnFgLcsB3eP1i0ov4EZlRojCkS/W8Hx+tnH2ZArt?=
 =?us-ascii?Q?1cGttICRmTeTIm7xcx/Io4qjs/S4P7m9MnAq3NnD+nTc69VeqlSemvOx9MVF?=
 =?us-ascii?Q?G8qGM1K7qHC2A8yh9cMUWhYeJyRHLNPor/X65ieKfjqHXGNiG269Q9y6MpBM?=
 =?us-ascii?Q?tp/N1ig0mJk2JFkGfuwwbE/3t/ZnJ9PXlcx3VVLIeAsS96XsCU7hOJSliLDT?=
 =?us-ascii?Q?2Z7C7fRmLtdD7iOxqzOqu/W6RWLKcDvnuE87zi0n2Et3Wz/3Q7ODSCjY1RbP?=
 =?us-ascii?Q?OZNoJ0U1O/r3Tba7+9UgqaSFG5G/NqJ0WEUaFtFVQy2MKZAs+g7SXo/Uvzld?=
 =?us-ascii?Q?EdifAk4r0bVFkWm9xc9wzEYY/Fv22GAJki/26NzPDlPUz4Klgi78tPphP5uk?=
 =?us-ascii?Q?CrTmYC5VQ4gwcqO4up4TLUCPUbMtErdgAiJlbyZNn/L2waJz1oEyMGE4uVyV?=
 =?us-ascii?Q?+FrmbmtqUlIIrxGsXxKa1GNk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad4e603-7fcd-4f84-f0c5-08d8f3dfc7a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 00:56:12.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pl86e3VGlZJJP0HLZwdcpcya2VO4IwwuO9VXj4gPYEdIe23AW1i0R3KEynPthyO3GuIb2LVQlm/F3xBhIe+1Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4916
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Yes, you are right, the problem is jffs2 driver. Below is our analysis resu=
lt:

Analysis result:
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
Yesterday, we added more debug log in fs driver seems relate to do_splice_f=
rom() this function.
After replacing this function from kernel 5.4 then issue symptom was gone.

In jffs2 driver (kernel 5.4 and 5.10) that didn't provide .splice_write ope=
ration call from file_operations jffs2_file_operations.
But do_splice_from() be changed to verify .splice_write operation in kernel=
 5.10.
Thus, if didn't find this file operation just return not support write oper=
ation.

However, do_splic_from() will provide a default .splice_write function when=
 it's not find .splice_write operation in kernel 5.4.
Thus, we could add .splice_write =3D iter_file_splice_write in jffs2 driver=
 or using old do_splic_from() function to fix this problem.
We are checking if there is any misunderstanding to work around this issue.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------

After checking your patch for this issue that did the same solution as our =
finding in jffs2 driver.
Thanks your help to fix this problem and merge it. Thank you!!!

Sincerely,
Tim

-----Original Message-----
From: Joel Stanley [mailto:joel@jms.id.au]
Sent: Wednesday, March 31, 2021 6:35 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: Lei Yu <yulei.sh@bytedance.com>; openbmc@lists.ozlabs.org
Subject: Re: [OpenBMC] [Linux-5.10] useradd: cannot open /etc/passwd

On Tue, 30 Mar 2021 at 05:47, CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>
> Hi Lei Yu,
>
> Thanks your help to provide this information.
> This issue seems relate to "cannot do write action for /etc/passwd file".
> I'm trying to check whether is relate to jffs2 or overlayfs filesystem dr=
iver.

jffs2!

I did a bisection and the offending commit is https://apc01.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Ftorvalds%2Fc%2F36e2=
c7421f02a&amp;data=3D04%7C01%7CCHLI30%40nuvoton.com%7Ccd7e5a2f62bd4fbd46e90=
8d8f3cc2035%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C637527405356044360=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DqbmFGMGW5J4mbfQw%2BB%2FzukUwj7kTwiAfESN=
Ebx6Uync%3D&amp;reserved=3D0, from v5.9-rc1. I have posted a patch that fix=
es the issue:

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flkml%2F20210330134537.423447-1-joel%40jms.id.au%2F&amp;data=3D04=
%7C01%7CCHLI30%40nuvoton.com%7Ccd7e5a2f62bd4fbd46e908d8f3cc2035%7Ca3f24931d=
4034b4a94f17d83ac638e07%7C0%7C0%7C637527405356044360%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3Dm7iDZ2rhyAibeRj2OGDzz999ronznTNLloFqQDyZq%2Bc%3D&amp;reserved=
=3D0

I will merge this patch into dev-5.10 today.

Cheers,

Joel
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
