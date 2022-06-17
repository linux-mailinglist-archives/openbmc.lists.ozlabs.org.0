Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FB54FD81
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 21:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPpxW2b99z3086
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 05:28:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=V+d6Ava4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nuvoton.com (client-ip=2a01:111:f400:feab::61f; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=V+d6Ava4;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPpx26Pkdz3bkw
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jun 2022 05:28:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvSir0bj9F6RQZQf/toU4Rvc02/q+KHW7wiDTxlMM8IriU7/ECgKdSQ4nQmK947cnfNwKJebL59JQVk/OFft+Ic+jJY9DR/zV+pbgVmgFAkcN+DnVho6rTdSU7rQXbTyXOLjl/9I0abaee0ohl83VOZN98kEO1AZEU9xvRP/UF5m5hSe5RG4KyI1jXzCwcrfGskUamSDvyEuidJ6YKsn7aDPrvUWebkttX8shS/pAQqaFfv7QqpP0Sv8CooXJpriAf8DfQFU3rh3mV9tRJrfRpWzl1v56S0+Ik0ptBI7xiSQ5uVwfVOMIJBAzZLWO20EH8S+0DQPORUZnh/HGm8rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KvBGqWBuvCep80YyrAfJjRTakFv+UZCismigQYyW34=;
 b=bjezeRNMF/SpXfxbN0s9Ob7XFk/XHatkdizsRvuADOZX8X3fjsoFH66MdjHxRpPVGNtcykWv8SxuLZgn24lncF/rxBqtu3bDIhe3nYn4B+zx7JmACsGxK2y1dQzA21J8iiiT/aOnjI4E3B0Kw0Tqv9anO5lDMW/TjM5FvOXCxUsrn7Y8EdrVtFpFE9HfY6J6ulTUFlXlAGH2ecqaF5EmIBhk5oEQE3d9OnLyPKZqHPH51Mgjzp/dXB/Z4X6OeE7efWFSCPlH+0nsR8UzKVxnnmYaTpMGEQt5b/4CDf/qYdBngzmF4pa9C+DUfaVhP1aKuGIWQO8ajnPfaeZMaLvHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KvBGqWBuvCep80YyrAfJjRTakFv+UZCismigQYyW34=;
 b=V+d6Ava4YA9p38oZoWUKXZS0cY/oVgyL+EPzU+UHLODiIsV7nnoLTwZqUVO0x/dZb/DZujIDKNiKjHIkJUdxF/bXXjHLgT4jfui6DUOLA1yQLswlAkYWZC3rLsWEOwMZL6sXHfN6i7R1Ez7eyFfuyXmypkZ3mLsqqtxsUZNN3vQ=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK0PR03MB4753.apcprd03.prod.outlook.com (2603:1096:203:b8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.9; Fri, 17 Jun
 2022 19:27:58 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::154b:d390:51c5:ace6%6]) with mapi id 15.20.5373.010; Fri, 17 Jun 2022
 19:27:58 +0000
From: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Topic: [phosphor-ipmi-host] static assertion be raised in aarch64 build
Thread-Index: Adh7E1A0RBnDUQomT8akrW8kFEDvBAGzl48gACGr2YAABVmKoA==
Date: Fri, 17 Jun 2022 19:27:58 +0000
Message-ID:  <HK0PR03MB509008115E6018186A1C81D8CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
References:  <HK0PR03MB5090481BE38DBC9CBC513F99CFA49@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <HK0PR03MB5090F2D83AD05E5774A65910CFAF9@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <YqytgdIR0kZUXZMN@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YqytgdIR0kZUXZMN@heinlein.stwcx.org.github.beta.tailscale.net>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08e8be85-2478-4377-2edf-08da50977c8c
x-ms-traffictypediagnostic: HK0PR03MB4753:EE_
x-microsoft-antispam-prvs:  <HK0PR03MB4753BF5B540B870991AAB0ABCFAF9@HK0PR03MB4753.apcprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bUcgW48qIjw6PIWo77HkPf7VEGcL7XP5YRngsKyEC+Io7BaCANPA7cA/pTx5bHezPzOj6KnazlerKVAEcXlttHCEgBIY/g4N6aJDhboqWVWyq2f/wylA+BixSediqZB5KUMLvdxjishDe4ZuMtsaZboDUO20YiKh/BNw7ZgQ9iHpgObhvL1I4ixKNX4Oyb93y304shqPZdgmE4sgdSed1VTwOEw3gYUq6N228E2dRqjRCMG+kqyw8Q5C5pCOYYs4u1AlCIixT2dzlKHOcA0LUMd1dYK19bEfwkXirbDnTEecaIy5xbeAoKsGPk/08Fw+xda11FJJNCiSxPPy5wXcj/IyLPr/USWSFhQezadPTlTXVcV9G8gcy1dGm1+oTRgfiin+cEIACd81mGQohn48kMOoTHlTTo9dtG6LrBLf2fYuKkyePMy3/JOomz1+nAeXj2b5BhmRUi2lcKPElGz0c0OOFIVtTa1T5uAKqBHPyVAozFZQmdAIiQO5NMylomm55l+dXifIbRlQTsQz6e0ZcQ2k+TAtX+BkBa7n+4W9Q3wtO/rKVb1s3O4T3E4kgNbbZ9EYlt+RARrb7xyAhiDgg8oGWk291vfDf7D75o0Iv3CGHfQS8Foe+LmmM40O8fPXYWgx1V3xnS9KIUxtz80LWdi7D5fN4ymkz4vSMAU6nYwpykPwPUrAYWpu7zbU23OCqf9JDXb9f/hRHwRXvo78enE20xrl1GehJycTiGJfkbMxx0Sh5S2n+aojSEA2obliO1GeLA4lDWeE5Jx1zMsDwdGzHSp0zSaNEqDsnDdWTJZKCmdYts/mQMvzTzm2jvXpJbwEmJPphlEbB56SQEXdpCoD8zS4rEyffHeBCQdya4W5b5bJUCMC19T3d3apuI6V
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB5090.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(26005)(316002)(2906002)(66476007)(66556008)(64756008)(8676002)(76116006)(71200400001)(52536014)(7696005)(66946007)(6506007)(38070700005)(55016003)(4326008)(966005)(186003)(6916009)(5660300002)(53546011)(9686003)(33656002)(8936002)(83380400001)(54906003)(86362001)(38100700002)(498600001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?XGcgb4RcbRgwko+J3xnFyIvuyUK7zD5+d2Zq8Kx+/ngiJujD9RqeBClK/l+Y?=
 =?us-ascii?Q?S8BQW6lSBHJrQ0Qk05NSy8nUMY0bq+RKZOIIaeROc4eNrdmwwPbURzXF2lde?=
 =?us-ascii?Q?+Aya04E55Hf8fA6o1MwEM1nWBh46pkJYsbSe6o3vM4ONOZqMISjOu8s4s1XJ?=
 =?us-ascii?Q?ZL3+6cZJiLd4N1JYx/wFBt2NQBCnacab5ebMsaDor1q+dewLlgdSjqq5RqE6?=
 =?us-ascii?Q?IugWIXIvFf9impk5dzbzvUAWeB3TJRk3En0lLwrl8fA0gPdFO8kTyl8R0Qkm?=
 =?us-ascii?Q?EIWZlUTaPB+XsuxwRN6YXFoBDyzGaCVqzvs31NKzuasGybTFeuVYV4ZcvwMG?=
 =?us-ascii?Q?oOryg+8s7g6/+7UTCRMXwvX0zfZM9e/74fJjW3ebs9jNtR8DgDm0EVy/eK6R?=
 =?us-ascii?Q?ttVEdjRZfsZwOHa5YAuVk6mDWJClHQb4aqb0BPDUBC6zt1fc9FGRHqfUbjwo?=
 =?us-ascii?Q?HwtYZpn5Le+JB0ttsWDp8CdiEP7K8zLQbKAfxgfmri7iq9UqDjIiJKKVGy8L?=
 =?us-ascii?Q?6aqWLUiZ+gDcbwJBciITFM3QKMlTGHqKVcotl08YJJc1gk9Qz+N/d1jWTOOf?=
 =?us-ascii?Q?UUm1602NWeaxMsDLLXQhD8LzjslHGtAeIeykLq9MEQU78anps78gb/YVn8+U?=
 =?us-ascii?Q?M0J381i7flWoKV4qyZtaDlBu5YJuy3m2Lhm8ESOvKu+p/d2oiKWJyvQSCM4O?=
 =?us-ascii?Q?AEUOusojiLB/xJ8s5dZ8e7TOAUk+M2+DgVZwt/ELzMeERooOMsbpQ+tm64ds?=
 =?us-ascii?Q?rZYB3Tw1FJkSTU+d+/05zG9XtnVSWapJzgOiDdwur+P9WBhELCcX1nX64uY8?=
 =?us-ascii?Q?JTg/CspILWBA7qz1/bk6bitX0DA42L0MuQyzo9jVsUo29cf6ApigFJ0apuMk?=
 =?us-ascii?Q?wOKZSjRXFVO/vMjQqI3bCuZxgu5Ch50njRmFKh3CF4C6xbPcjaYVLosVIJmv?=
 =?us-ascii?Q?aosA6tBgXBfn6m472hTl/VNy2Yekk2jV7D0VCyh/wF55fgzWgtmHNSyB3LBP?=
 =?us-ascii?Q?gsMAjY8AnpavH81ukUn9aEnIb2WiSAMLgS6svot3N+BdkIyqpHqCHXGRdPoN?=
 =?us-ascii?Q?0JeIT9FBbHDzFiAYgT0+s3NNtGs9CgzuBT/rvEkz9BjUcqTv4s6l2YHakjix?=
 =?us-ascii?Q?7vRE2o1CHWLFvV19rfYnqt5X8hAuUiUzQgjZzPzNiIqM1Ql4eaDz06EP79tV?=
 =?us-ascii?Q?Z3wzHs6sLZ2BJBjlGwfnNnXD3Jrm8uWJcI/6VmvLXpDVqz9aFpsLpxv55C69?=
 =?us-ascii?Q?2TL704rYEiktcgPLU5AePsU9c95JjoxjjGw6m4xnDF50KMLc1j/NCavy/BXi?=
 =?us-ascii?Q?pfRYwrhZ19U4MaammYrqS/9KBXLrey1MvQrx1SRBPvk8cZEEObdyDwsIGZuL?=
 =?us-ascii?Q?Tt4qokcI2uMrLgW8XIDzyPecC2G8zSnulVYuFRFW0UipFvE99YuD738FCypL?=
 =?us-ascii?Q?FORZo1YiS/ma0pv5Ufq6pLu9ZXxIsh+JlaCwHn3zVi6Ng3gTE+IjeGqwQmsw?=
 =?us-ascii?Q?crWbZUe3OE2/n9p0tNvsdnwXwKEjpl1IExxfn0VZjC7OR2K/ESPzx+c03iK7?=
 =?us-ascii?Q?qXmZhCSJHIKVk9Q/NAqQp6qnjsZ4iUW8ic5yuon/q87sAfHvkT16guVlO36T?=
 =?us-ascii?Q?osUY2QWJZ1a4HxMvz9/3mTKUigSmOk+0pL8fG39GX4DhGxZgMUDQKhsfaVId?=
 =?us-ascii?Q?hnr+gNraOecGznE+bMtP0aC71acokZ5AYaf/0kSr+budwBKh7LY1iOtdhUsy?=
 =?us-ascii?Q?vRZ04Kilmw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e8be85-2478-4377-2edf-08da50977c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 19:27:58.6035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcIUvNvRM0i1wpRSDzvccP4cfEkbegC599UTFBke6kILfbvU0B0haWHRaB7DuHjSw1+XvvZbERnBoqNdlqLrjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4753
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
Cc: Tim Lee <timlee660101@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "john@johnmaddock.co.uk" <john@johnmaddock.co.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Patrick,
No. This PR was submitted by boost/multiprecision maintainer @jzmaddock.
Due to he seems cannot submit via gerrit. Just, I help him to submit this P=
R via gerrit.
https://gerrit.openbmc.org/c/openbmc/phosphor-host-ipmid/+/54692
Please help to review and merge it for fixing this compile error in ipmid a=
t arrach64 platform. Thanks.

Hi John,
Thanks your great help to resolve this compile error.
If there is any suggestion, welcome to discuss with us. Thanks.

Best regards,
Tim
-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Saturday, June 18, 2022 12:36 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: openbmc@lists.ozlabs.org; Tim Lee <timlee660101@gmail.com>
Subject: Re: [phosphor-ipmi-host] static assertion be raised in aarch64 bui=
ld

On Fri, Jun 17, 2022 at 03:20:04AM +0000, CHLI30@nuvoton.com wrote:
> Hi All,
> Share the root cause about this kind of compile error in ipmid at aarch64=
 platform.
> After debugging with boost/multiprecision owner, we have found the root c=
ause why boost v1.79.0 got this compile error in ipmid.
> More detail you can refer from
> https://github.com/boostorg/multiprecision/issues/472

Hello Tim,

I saw a PR that someone submitted related to this problem:
    - https://github.com/openbmc/phosphor-host-ipmid/pull/183

Was that from your team?  Can you have someone resubmit it by Gerrit as we =
do not accept Github pull requests for the project.

--
Patrick Williams
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
