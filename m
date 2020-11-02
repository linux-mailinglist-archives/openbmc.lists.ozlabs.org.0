Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2302A31EB
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 18:46:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ0hz1fztzDqRg
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 04:46:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.116;
 helo=mail1.bemta24.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-LenovoBeijing-onmicrosoft-com header.b=VLudRx3w; 
 dkim-atps=neutral
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ0gv5mCrzDqFS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 04:45:45 +1100 (AEDT)
Received: from [100.112.132.75] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-b.us-west-2.aws.symcld.net id 8C/C8-42875-5C540AF5;
 Mon, 02 Nov 2020 17:45:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLJsWRWlGSWpSXmKPExsWSLveKXfeo64J
 4g3P+Frsuc1g83PCJ2eJUywsWB2aPq+272D12zrrL7nF+xkLGAOYo1sy8pPyKBNaMqce2sRa0
 8lT82PODqYGxjauLkYtDSOA/o8T1e9/YIJznjBJvXj6GclqYJL5fvM8I4fxmlLj05TsriMMos
 JRZYvLybnYI5xiLxOvOLkYIZwOjRPevz2AOi8BuZokfHcegBsxjkrg8rYcZwrnHKDH9712gAZ
 wcbAJKEi2vVoDZIgKeEte6njKC2MwClhKbP14CinNwCAuYSnzoNQUxRQTMJK51ZkNUO0k8eTa
 XFcRmEVCRWLt/MzOIzSsQI9H4bA7UqtuMEge+3mQCSXAKuEic/r0ZzGYUkJV4suAZE8QqcYlz
 F1vBTpAQEJBYsuc8M4QtKvHy8T+opzsYJTqnPGGCSChKvN34C6pBVuLS/G5GCNtX4mnXVKi4l
 sTVxRvB7pcQyJb4ctUaIqwmsf3aeagxchKreh+yTGA0moXkDAhbR2LB7k9sELa2xLKFr5lngf
 0mKHFy5hOWBYwsqxjNkooy0zNKchMzc3QNDQx0DQ2NdA2NTXRN9RKrdJP0Sot1y1OLS3SN9BL
 Li/WKK3OTc1L08lJLNjEC01BKQRvrDsbzrz/oHWKU5GBSEuXlZ1wQL8SXlJ9SmZFYnBFfVJqT
 WnyIUYaDQ0mCV8EFKCdYlJqeWpGWmQNMiTBpCQ4eJRHe5SBp3uKCxNzizHSI1ClGY44JL+cuY
 uZ493PxImYhlrz8vFQpcV55kFIBkNKM0jy4QbBUfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6
 OSMO9/kCk8mXklcPteAZ3CBHTKwqQ5IKeUJCKkpBqYLm9P/7Or4/Wqe7O2dceb6130UdrF3j7
 vif23wv4pngrzyhLzLhbMeunkN/XU9ElGgZuM9+QZsy9VriixZrD//tz+4rrghCCBeZ5vz+zY
 vHZRbXJJFWOnatXs+Ts4r2hflyt8bG6mMuf65PPFWhbfH7q4WT7ceFbxRNrcCDY94+0Tnn36f
 CFmwfpeDV3Od4GKsiyCD6aWxvdNLXCRD9v/Zh/PwRtJm7ce3PjFkyd2puwb1UdZOpUxu+zmtD
 pkpMeZvfu465Xtmkk5lYqfb21LKbn3bfkus8bc61/Vzb/N2yPPWLXlnWxigb+o+aYLtRfe15o
 brHBqFLmUptC613PBhOX3xIoNqzU0OYQCWTJNlFiKMxINtZiLihMBuwbfP1AEAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-31.tower-355.messagelabs.com!1604339138!10403!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8002 invoked from network); 2 Nov 2020 17:45:40 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
 by server-31.tower-355.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Nov 2020 17:45:40 -0000
Received: from reswpmail03.lenovo.com (unknown [10.62.32.22])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 920309732C2E2F69914B;
 Tue,  3 Nov 2020 01:45:37 +0800 (CST)
Received: from reswpmail01.lenovo.com (10.62.32.20) by reswpmail03.lenovo.com
 (10.62.32.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Mon, 2 Nov 2020
 12:45:34 -0500
Received: from va32wusexedge02.lenovo.com (10.62.123.117) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4
 via Frontend Transport; Mon, 2 Nov 2020 12:45:34 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.51)
 by mail.lenovo.com (10.62.123.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Tue, 3 Nov 2020 01:45:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+abtU6wMka87EKHLgaFJIOuTg7BMDV7vL5dBu8/TDYEFU0EL13j0S+c0wCfSaEqDom1V/bCP3fkbhHZy597xVrOuCvX5wuEE/Tb8qvRqESx+W4eQDIraTWlEE7K6N/J9eSRLr1RetmmTy/ot5C3gyPnJpiuC81RMkCVnSYTznYii87K+/1Pv4NvQbwBxPgVGyNmhUvOfVsCMh9m5X2a/410+9eCeD9rvgO5Y2PErwbC390n2lfG6HBdI7db2qIYzFjNGspjn7+fERTytX3AoRHt28Rpqlp1P9w8PlhmSySk43a5SIH3y2U6ir2F8LRhAE9Ap+QU4S4geWcfQPrHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUIkqwlYMCDMfkIg42CLJCpDcaOqhfaVcjZqfSX0MI=;
 b=VL2XncI05sbljQ6Bh7Zs1jYlJeL0QhODVl7iXYiNWPFDkcFzihMjJhLHNkVMlMVeba4GGoLEMluOyv6RWr+WN+kTwzqzP8q6dSG9CSMcNPxOsJHlt8PQ2FpDicZvcBX4/a2q6yd9EITyNkftsYu7HQii579xgfxiFrzCFP2LgC0vfZUJwmLh6Eiz0f+4ZD+fVSLsj+iz+LmwMtGzw8LiZrQRNO48uyeQe0xRWqjkohAWauiL9IHgbSu5nDll4uNwjDtm4eQyNzgrEkT0kqXXIU06Wn/ko+Hlm77cs7ZOywQ8mfrhAX8E2NNAKNT4VeooOhkPCcKS0y6My0zDv/w2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUIkqwlYMCDMfkIg42CLJCpDcaOqhfaVcjZqfSX0MI=;
 b=VLudRx3whuVC9/Y0Bn6nki46IXcY8MjDbIcGFO3YSE7dReh4B2bzCwyLDzNvN4qluSs5GsLCgS2PtWXKmrBkrDLq7mGemHh6yP75tDEQFaGiPLqnvqXQkrWzfcoLsbs22xEkmKQQ2cCZIsjrlGeQKaQeN8+2GbHGNrmh3+a9f7Q=
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com (2603:1096:202:27::17)
 by HK0PR03MB3092.apcprd03.prod.outlook.com (2603:1096:203:47::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Mon, 2 Nov
 2020 17:45:29 +0000
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3]) by HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3%5]) with mapi id 15.20.3541.010; Mon, 2 Nov 2020
 17:45:29 +0000
From: Ivan Li11 <rli11@lenovo.com>
To: Andrew Jeffery <andrew@aj.id.au>, Artem Senichev <artemsen@gmail.com>
Subject: RE: [External]  Re: SELinux support question
Thread-Topic: [External]  Re: SELinux support question
Thread-Index: Adat9Q0TJiHksjyJQcmUGb2KI+9JLAAjECGAAIxYCwAAIhickA==
Date: Mon, 2 Nov 2020 17:45:28 +0000
Message-ID: <HK2PR03MB4580C4DF82B1089E34B97311D3100@HK2PR03MB4580.apcprd03.prod.outlook.com>
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
 <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
In-Reply-To: <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.250.179.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4527555-d004-4c78-0ae1-08d87f571696
x-ms-traffictypediagnostic: HK0PR03MB3092:
x-microsoft-antispam-prvs: <HK0PR03MB30926072E871CFC5819F129BD3100@HK0PR03MB3092.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sYcFKNNsM8kUAWgpeSqYozcvpf5mxi+H7tTiwOHCqMr+R6hs8V0uDxKNjp8wppWR9d8S8z3l113daYjwmE47Ry/4VwzWMdFmQr7mb7u6xT4jRuLIYBLDYntMqe1tVwhcN3KRZWoSHcfUyKgRXa3P3SUsQEqLxB5RLe7JwJHes9jiKY8XnLQNTRFbKAJuJ8X0mWzCRhi3haEM/GBFSoIqmKu6lL4LQc2lpVcFo/JhcW/76hjn8rrxpeOwzYzBbOsjvIdRDGGeJOA2tb6yd2dZ2CgOiX3B4mBbj9mGzyq+HcevL8uy4Yeyl87pF/kWTfW6iaXv4qi2hW4nJCNvDKTjcMnxDKDmHomC+kLKh5DODFFASua5Zmsmm9zz8TPk+ZgzcczyQ8aNGhXTkZWDnAfuJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4580.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(71200400001)(4326008)(7696005)(8936002)(83380400001)(53546011)(6506007)(186003)(26005)(8676002)(33656002)(86362001)(52536014)(316002)(66556008)(55016002)(9686003)(66476007)(5660300002)(110136005)(76116006)(2906002)(66446008)(64756008)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: gZqDNrsIdA2t+keGUzhW/GXKjyG1LNhmxNw/vJTiI69vpRVI9ZdzhcB+gsrQRoRv6SXseJjaaaD19ZRQ5HW1Esozmc0YqLL3rBUXZmuNcJNrkpjtZpaz2K8qwNBjg877KCEmvKIWpvTbMo1mUKhkVapaWrK61+j4nIP3NUoT5kvRGlvVwTLUH6SQ0GtJWau3fO9Vubr0/Y7MKPAJdFXG37fZ45WYE6LdBYBOB0dXcj2dsDEcH7gAqaqaE7wKSs+HXW+GrMbHDTqFh1n2AU25jLx8Gsk3UCWFeDrjkXXla2VicHRy2sGep8lppi/HQpkebf2vAcCB9xbAfcUjPTfEQxBBCI1v2nOTH44a9vmtoU7H/oEfj6pek0vRqNXNxL08SIn1tZmz+JZpN+KLXJfwN6W5OkDRCma+4avCQqrRW39X08/0ZeNTeVli3+RyldvMfxzMLQXcJawAKfXCRcc3LfSqGAyydeFuusZfW7tyqGyXCsBMbBfMMONhVt9ytUghLUkrYDlHmNvAr03/NGqHpeCTe+Deqclg8CShW4Ku6iPbObI6Lx3BbXBo1thNI87cZKUH3S8EBfD+5xk23ZUr2QE3gMgEEJm6TWo1rkVGnMGafQ1afXpaI473oFgg4hABRqG0etF2g/keWEj6hY/cPQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4527555-d004-4c78-0ae1-08d87f571696
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 17:45:28.9630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j1cTR+/6M9mIp/+D+CD0RyxoFr6jLns2Hto/0pvkbzaNJ++A5FVRTExkDD2VvRgVBWKKv/QSr2LsWeiHESoDbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3092
X-OriginatorOrg: lenovo.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Monday, November 2, 2020 8:54 AM
> To: Artem Senichev <artemsen@gmail.com>; Ivan Li11 <rli11@lenovo.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: [External] Re: SELinux support question
>=20
>=20
>=20
> On Fri, 30 Oct 2020, at 16:25, Artem Senichev wrote:
> > Hi Ivan,
> >
> > Yocto has a layer for SELinux
> > (http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
> > it.
> > But the layer depends on Python for management tools, which does not
> > exist in the OpenBMC image anymore.
> > The problem is that Python significantly increases image size, it will
> > be more than 32MiB, which causes some troubles with qemu emulation.
>=20
> The problem is broader than qemu though, it would also be broken on any
> platform shipping a 32MiB flash part if the image exceeds 32MiB.
>=20
> That said, if there are systems that ship bigger parts and enabling SELin=
ux for
> those is feasible, we should add those platform models to qemu so emulati=
ng
> them isn't constrained by the existing platform support.
>=20
> Andrew

Hi Andrew and Artem,
Per your suggestion, I try to enable SELinux with Yocto SELinux layer(http:=
//git.yoctoproject.org/cgit/cgit.cgi/meta-selinux) and 64MiB flash part.
But encountered one problem which is when I use command "getenforce" to che=
ck SELinux mode, it always returns "Disabled" even if SELinux mode in confi=
g file '/etc/selinux/config' is permissive or enforcing by default.

Please help to advise it. =20
