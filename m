Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EA663D019
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 09:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMWvp2ZdWz3bY2
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 19:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=VUN+RNOl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:fe5b::703; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=thang@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=VUN+RNOl;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20703.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMWv85Ygnz2y84
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 19:04:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRo3nvb99x1OVMxZm9vYIjoj++2WUEz6zZt1Uz9ul7FNNrx4EMb2GSWK1YtYVp2YWFRRTK4t6VRNq2diOpR0W0GlfsIooicDYCWa+Ca2/7sowMnHdyEnI1tbVDyVn1/YIt1AGiHn4+9bCOaGKb0Lhn4JJl+WDnQAtq54uTQPxD8xYL+8pjm9d4d7KeC0zVxIQrebOJWuxVjIOrjUnh/h9qQSr+nP90Z7kdBaGoe21dpN2v7l44Tz8/SHu35cqhAMH62eRrsHaLwrboG+C3YtEFV45zs9UxhsVubbCt+0Qya5+C/71GUqxR3+uBV6f7t8LAnqKPkKRHFBKdzKNqZnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17eUd20xZ7St+oRDrndPoo8Ylg162nV8rmKDseD56wo=;
 b=oTop+jR4kkDipwizABepS9q1RL6QMfXL+f3nvoeP176/nWedqd0FyIxeiDDWahhT2NLYDX50q5D/4fWiroGPkLkfdgmn3ZqSyChoy0Of0YWxtatGHqoVR+X8HOuMsqZgL6BE1VUKrfpkE9VNycfSTPBfHsa0441sLeOLqeLm8udCFDbnVe6+eIBsUhqHJvWw1+Ag8BLiuWQrmcUa//zaGK4THfcaqIIVloaKi6APXU7Hf5DjWJLjtvgW6gLA1TvUz8WVpP/L0PHK+DAn8YQ7Ia8rJ4JbND8FMXfKKpf4AMAEiS6hwA3G6dEalg3VBPMyNxJtxFlRHutXaX3E0+EyLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17eUd20xZ7St+oRDrndPoo8Ylg162nV8rmKDseD56wo=;
 b=VUN+RNOlCYxGruaiG10Pt35R+XyufxvDkbeVxabvvMHrQByICGLH1qFiGWOPNgbWpjlGNzF4EgNYUBoVGXy3HAVdPftAjZYpvkUbnfpmpCom8y6T/F/KSyVwfVAi9n+wBRcyXnI0raFRkBL0qWbeVqILS9L95HDy+9fZRCKNcT8=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 SJ2PR01MB8051.prod.exchangelabs.com (2603:10b6:a03:4c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Wed, 30 Nov 2022 08:03:55 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::82c0:f6e9:d5f9:d3ec%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 08:03:54 +0000
From: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Ampere's CCLA Schedule A update 2022-11-21
Thread-Topic: Ampere's CCLA Schedule A update 2022-11-21
Thread-Index: AQHY/ZKuSL26KKg1n0WYrg76xhjT0a5WFDiAgAEVKYA=
Date: Wed, 30 Nov 2022 08:03:54 +0000
Message-ID: <3FB4A84D-2ADB-43F7-9E97-B6A4F3BDF61D@amperemail.onmicrosoft.com>
References: <600E431F-0F36-4253-9293-9626C2C9B9E2@amperemail.onmicrosoft.com>
 <22901d25c965d23458ac7bec69529fdc7eb20043.camel@fuzziesquirrel.com>
In-Reply-To:  <22901d25c965d23458ac7bec69529fdc7eb20043.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|SJ2PR01MB8051:EE_
x-ms-office365-filtering-correlation-id: 5d2f0750-27b3-4a3c-37c8-08dad2a96d2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7vVCw8iCrwFFDDNZf1yrVdYFCZB5FtG5vVLRcm/WOtMgt+xW5J8gTxx1BrH0V73SLOe5aWEkZYu9/6PE8bsk375Gj6FjB465E+ZOUkE/XBuHxtebWcfuGN8m+BCcmVzQBxzIW6qMREa1seXI9lXOTw414Bt/UmEyYOA+dfyamCsqZzo46/5XtfI5cZQkgl8qj8mdFQKejelt3dPMk8ScTbL1Jz5sb3Y0fTB1+fwk8+hamm2lykrMEy+oothHoyUPUrLdaDl0czoEpiOKdJsQPrBE+g/a/grVFVmBpN1WyXhfmrGxqSRZvXfwselmWjGFt6cgWg9PU4Dpb7xvXN0TuJF5oZCDa9cp5dp4NIHna/K5bW9ecOA4+Ykq/oKEHBqCFHyMnGEdzHb719brO4SLmj4p9CKZv62VEE8F7LWoO1r9mR42cl4RNCJGKfbolCrtPp7IWO9NUpWYupikuhb7mpO6LpNlzqkdkUTiqievHUuD9wv+l2oDTh0s3+VSdK8n2+CAmNq4WkFra/Ri+qyxpx4Um21eQ+XynBFF+RxxMwLopPdqmuEFodo40nTXcZB7x+XlkBlyFjMimwveei15BlGO5rzt/KNe8v2qDAWq731LRXeWlaNQ7mDb7xhL/T7m4iIa053hVAPL/EjGmoDBXghSPemGm7vrWje1LIBuaevQheD11WqB8wxuRMAYAPsU+hq0qljohUE9CslORhpZcA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(4001150100001)(8676002)(4326008)(2906002)(15650500001)(33656002)(86362001)(4744005)(41300700001)(5660300002)(6506007)(2616005)(66476007)(83380400001)(26005)(6512007)(53546011)(186003)(478600001)(71200400001)(76116006)(6486002)(6916009)(316002)(8936002)(38070700005)(66946007)(66446008)(91956017)(38100700002)(122000001)(66556008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?lrzYROBaZoDymNS35Ev4upLle0Hxqf0QEsIXCHCimStKusbBVE2orIaeP1YT?=
 =?us-ascii?Q?IAZtjqIWs96Rt4aW1aIMoKfDOqskPAB6Vme2MAVvP00b8yXVqPlLCrIup67l?=
 =?us-ascii?Q?bP56oPRIFBGr0eLAtzyr8Z6JueKPAmwazfILsyooNvxcX4JjNtLoKuagChwH?=
 =?us-ascii?Q?GA4ii/X2YOiUFZk+R3/jsr24cjzio8M1ZAJQlMVSrMxT1jAkpJLXGKNBz0mK?=
 =?us-ascii?Q?6YBYTaaZK1EXhW4EefiV49umXSpFWO5ReJ/+UhLfASHtQUyW8/+O2O8nZNMn?=
 =?us-ascii?Q?NEJ5s4p4LZQnXNOw//QrdYZg++3AfXMLK4K5zOmQtCfWnu40R2vV9sf20f5w?=
 =?us-ascii?Q?Ib1xpQB3LRWx9eywYGwH/pykLGNiZiQ3OteRCIEh3ktLkrfTSBKpiQjYWEvK?=
 =?us-ascii?Q?Bae0TSsanslKCroTSfOtt5tYsUl2Lud6h5uyRHV50a+ZTFuGJdiHfEYuJdk0?=
 =?us-ascii?Q?rzslkU5GIwjtRL77prtqjPausYOk/gBjliaW9XU+dXOCir8hLFW4JrKhVsvK?=
 =?us-ascii?Q?j49Q5LTWcc/QNzS1fmZlYb62tQ6BTsEJICss/1+T59MUUSKjxVjQ1izkYWMb?=
 =?us-ascii?Q?58dP9PXihbHePex2JaqVLAgWHZDYs6clbQxKqrkLpPtd/LzfvXZNWiObul7u?=
 =?us-ascii?Q?TQ+JexzbQy9xEpIkeXZAzs0zITdfr426dRusBHmlX4wiKSQlzSVC6TWLh8ho?=
 =?us-ascii?Q?wOQUWqigkbwKh53nvE6J+0QIyOrtb0AYbz5bVHK7RG/KHNmqmHU2UNx2XOor?=
 =?us-ascii?Q?Yv8ekGK3FnGAb3qpfTN+UlWlfwmslFI4Lj2fLsxPzELzt117iukXd4RIwkB1?=
 =?us-ascii?Q?cDC95k83ILH5vOFufoz4SzBR1D4GSBwVvpmBI9DWsIjCatHzi4HD693B3OC/?=
 =?us-ascii?Q?zOg3sUhecyXrmhmunBPnmKsud1+F/eSynRJ7E10bvlLY9yh4IbzUs4aYBC5n?=
 =?us-ascii?Q?d8NSVzLQdtXm5IbEoYKfelu26/ulhs934THhI67fELBsVNh0szZfTJhVpCvP?=
 =?us-ascii?Q?rLDRCLNlK3HY8ztAn67wTwRngejYocDz9WE9T7zKYllAeq7OD9lHpNUyBOe+?=
 =?us-ascii?Q?BKqXm1FpR+21bzA8r0mgtNWbT64YwfQ96xT5z8ClQe5+pc0kc7wKg+ej+Fgw?=
 =?us-ascii?Q?H7PU6d27U699fpnKub+nga9RaDAjyiUOYbvxJAbwzmi2ziYsLiu6qY/jLhm0?=
 =?us-ascii?Q?88jX5oXWOXOporjNhisri54nZlqs8jn494+hbivYoaMAbU2xxYOysta3Evsz?=
 =?us-ascii?Q?xwpE+Llhv6suHW1SSNj0vw3l0m8QRZ1A/E8/WVFzfziFqr9vtD8yHUu/ynBZ?=
 =?us-ascii?Q?pLHsSgE1avpEXQYhflvu6zCFjZt/D2o4aLsiWgz3Ze4NDRwleClbuLX1sqNp?=
 =?us-ascii?Q?zgUWGK7AbP4HBe3/FnhEDB9ij/Q8IEvOZ89EvqmF9O4sseBAOyzosltEVYnj?=
 =?us-ascii?Q?I1YduY3ZtA8ladrCjrprxltGDVB3FAAZaZXKOMndpclxzi4Mh0Pix3SBJfi0?=
 =?us-ascii?Q?ARvArwk0cTSPTJbUBv0wV5Fp2qbzNmafGGZQO92XsNBfuB3YkpSfGCLa//Gm?=
 =?us-ascii?Q?bmD/jtiYCudR1LUMOcfBBjzDLHdHf6RtrhlZB4XQxc5cZBoA4X5uhVji4fml?=
 =?us-ascii?Q?92ublxOl5mMMhmvYS5oLvqU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD4F1846459D4A4EBB1333E3E93540A0@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2f0750-27b3-4a3c-37c8-08dad2a96d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 08:03:54.8823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+5hyTqKuZO7+M6fgx0QJZ1vai6gkTAzCCDplb4dGoFbmGXwZxItEscuPginCOzVaBkNu1av2uZv+u5yHld467st5UsmpVTK1qnWDyutVt8/03HbRgNL00TTFEopGNsy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8051
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



> On 29 Nov 2022, at 22:31, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote=
:
>=20
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Pl=
ease be mindful of safe email handling and proprietary information protecti=
on practices.]
>=20
>=20
> On Mon, 2022-11-21 at 10:19 +0000, Thang Nguyen OS wrote:
>> Hi Brad,
>> Attachment is the updated schedule A of CCLA from Ampere.
>> Please help review.
>=20
Thanks Brad
> Sched A updated.  Apologies for the delay!
>=20
> thx,
> Brad

