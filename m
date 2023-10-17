Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E967CB91B
	for <lists+openbmc@lfdr.de>; Tue, 17 Oct 2023 05:19:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=LcpRRaja;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8fMq01vbz3cFw
	for <lists+openbmc@lfdr.de>; Tue, 17 Oct 2023 14:19:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=LcpRRaja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=565406fb26=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4847 seconds by postgrey-1.37 at boromir; Tue, 17 Oct 2023 14:18:28 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8fM86XzGz2yhR
	for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2023 14:18:27 +1100 (AEDT)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H1gfmp008319;
	Tue, 17 Oct 2023 01:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=RfFTMjhKtx6UvCiZr1hMgOGfjdsGUUCVzj3/Z8mypH4=;
 b=LcpRRajaDE4P1bErJd5S+R4Liv5cJb2CNw1Nuep32SnECzB9NCiFVdnYeRg21NHcBn2C
 pv1T9/tPNOsuw4GkXhxWueKxzwhYfxj30pp03flR2WWAvX6vYh08cjvCbnt2gLCLDArI
 cGtnRBoZknEZoUW90Kk6VBvBXPYu+z2fSMEryQQA7C8Z33MMCP57R66eD1KsCKUuzho9
 e3ERoLJ9WCm3VS4JYtEedkFzv/+EITjqHnjDwYblvv9NwCT0t1kts5bHx073NI148xEi
 YUukpG7mAc/63iJWajYmXECqDOdFpywEvhbk4447CG4GyqUdbpdNmBgS5YH0sFOulxrd BA== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3tscnu13dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 01:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5vAyI/XFUDkhri6LmdLPcQQESGOjJ/drEyyBsvbLOaOta/WtOsEHIA3QoXfvHqBqBCU8Za/T9S63/j8X88kzSlkKtwBFTq5LvXtkFMu1CbDjuquT3mPiZNrCk2aodjx4EhEezFgAfoEyIqK7+vsZrwoC/rN1RmQrWCL9uDnYmW5aQpILHcZcE9Ela3AqI0DC4jOAgw365vC/2pHVNjsOVhgOcIYFpU+UO3W1WYXhO8trIF9OxVvZH6MIwFxZ1wYTYQ6eTqR5YLoCe0rTMrfNtb/cgeKYNZorYImWcQHi7tgHfNg1tiduQxWd7uD+aw+cBV1FeeEt2LRA3BF/LentA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfFTMjhKtx6UvCiZr1hMgOGfjdsGUUCVzj3/Z8mypH4=;
 b=CEoe2eMLsihS52xe7YvgcD/F8c7zVmYbOXrlXt5kLLax3VTWGPj2rJSfGSnRCPHbb/8l5do8capczldvFHRF7rqNl2K42AcEATD8G/PMJiFT2+Wjpd1IkKThvLhzT6EfCn7uvjfqF355MXgHOkdc4WX4rgwXyxJpFXejHt3BNdSs0DiPsjZgw4QDDlKsRJazxhnRWK6p42cXqBREh4/Lp7tuSQ+m5kwPj/aeJQfJ8UfsfILR8Jtde8ANw6ChGDDvcoiGN4fLR0ZtFvXF+xrISOJe2IHoT7DK85/mGaPfimBJdElXXhWZieFFzB2AapmN9DtHwfhwbfTpZDy6SPC1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by DM6PR04MB7130.namprd04.prod.outlook.com (2603:10b6:5:243::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 17 Oct
 2023 01:55:50 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559%4]) with mapi id 15.20.6907.018; Tue, 17 Oct 2023
 01:55:49 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: Aspeed SuperIO runtime management
Thread-Topic: Aspeed SuperIO runtime management
Thread-Index: AQHaAJ0NhAQ9dKbwokeLNkAOV225xg==
Date: Tue, 17 Oct 2023 01:55:49 +0000
Message-ID: <20231017015516.GA26965@packtop>
References: <20231004003427.GI19997@packtop>
 <5dcbd06f90de39f191eabacf61f0e42d9719bbac.camel@codeconstruct.com.au>
In-Reply-To:  <5dcbd06f90de39f191eabacf61f0e42d9719bbac.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|DM6PR04MB7130:EE_
x-ms-office365-filtering-correlation-id: 221941f2-7511-4a24-432b-08dbceb43003
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gKa5URVb90F6tLTrBUTV+JztyvQBVrxeROw0bvR68CcRXtj4U1fVLJ4ssgLi6dt3dwLWQra8lXFgEocCZQy/yP+SQHLfHJCd82INu44+VeA51qZ5eozoO4oFYs+9wrQp2+X8T0U/MZ7yHWxC7oGt61AbMT2YBrTWaNW/67oN/VBPCHkCFue0onoWHMC1RRz7ZhiPYwOlETvR2fC8G6mS2xJdMgy2UBBs4l5ymuBXildJi59tRqGMl10MSvhJZpfj20qGfo48Nl2rCGmsro6AgMgLVdsHTKlC2lUCSMVVjYtygAkrQidxojcQ9IG97Axf9XQtOZcN7aCt1aCWytFUKMzBtU/tPwCW4DiqCio/DfhX+nMb+/az3G2mkd6Vom5iSxZLqcH9Sv3DUYyEtHOj3UXzcunW4oQvCJqv5Nsh14FajRJbMgALPPzbyFhItW8nQ9QJZDhEi6FV0Op1dGJBfLE7zT+h9SsfAGdiV98TP88w/VfTtDxGoE+NYtJEDllYBcs2o3ksZhV2+eh2xgbt6XmZKPWA5+bKt5FNCEWmnYWR6usea7NutAZ5IgZnz7PdAceUczsrj/VYQJYlFG7pDeedUS2qggNxREk5piOUHhg6pcTfqCzisTYtHffPf4QO
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2906002)(86362001)(3480700007)(38070700005)(122000001)(33656002)(38100700002)(83380400001)(9686003)(1076003)(26005)(6512007)(71200400001)(6506007)(478600001)(5660300002)(66476007)(76116006)(66946007)(66556008)(6486002)(316002)(64756008)(41300700001)(6916009)(66446008)(4326008)(8936002)(8676002)(33716001)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Sj75fOgDnjAQfu/W6hJK0bPLVENnlo5L6DAGkU71jI17ZfjxVti8FIaK05+d?=
 =?us-ascii?Q?oudxYcnl8xRmJv6WlTQ8jnGpZnMT3t5k+PKaNPtWgZEQurQ8ycbKoR2LjPMM?=
 =?us-ascii?Q?v0g6fxagVvy9DYwrtnd215lA3UNL571HcPdiyx2rmYdb74a5108vls3+ROYJ?=
 =?us-ascii?Q?gkRuLMT0iaxgSfwTGAVoVabtOfF1Zu+WEbFTLrgw/gY4s2rqXpRDy1KF4wZ1?=
 =?us-ascii?Q?tuCv9/nvjvqy2KtgqZvmQv4KXMQ1c231Gc3Pf9smvSiW6Gf0GOQox9FHPJ5z?=
 =?us-ascii?Q?RQPTm15NoGZ5AObZEIbGux6MP3QiIqILo9P2oirWUrOK/22fFSfb8gQECj1/?=
 =?us-ascii?Q?idy62fuT46UOnt2fXTGptNmsA+q7rTfZwPPbLfghTxbi+5YCxFNbqanXvs83?=
 =?us-ascii?Q?YOE6B6SyAyR25x17mKb56ialFiLmjj2QVwFQPt7cfluAlhin2ct/15z7lmXK?=
 =?us-ascii?Q?6pBImJGkE85c6El4xPJEAt2OirWTK8HhUJpw0LH0e6T1lYf2P23puY7c1GH6?=
 =?us-ascii?Q?3/7vLwfka6piW5bBUk1b6QTnSeAIRvQr2aM4ZBd29AGeDAEqgSoNyst5pl0c?=
 =?us-ascii?Q?f5ThiI0Yh4hFTwrs384s4cHQKkSEnDLIWqwm7g2uyWfSYCifEWjS4XiFKRqr?=
 =?us-ascii?Q?/U6e7wBNKuR1b3wAopNjcBtJxDIcH8HkDDDKjggN8FPodYgzmPCwkKOVeasg?=
 =?us-ascii?Q?zEmKn3brX2DneuLto+ifEnsiauxwNNBk+XK/fxS3WMvsZF+sh89taX8ILxQf?=
 =?us-ascii?Q?2npMbyMOKbWImYH8wiXFAGl5g86g7tC2ROflDu1J42s23oiT3M4xZ85fKQ2X?=
 =?us-ascii?Q?tv4vrVVRisHUC6xMN8LoZDlSLJ9reHk5/jy5itW+0M6bvrVdLdeaxKTyGjqy?=
 =?us-ascii?Q?B9ICd/BvxQS7uktHiYZx21nlzKND04j0tnI/cZdwLrI6FSiczEzupsAN1J5T?=
 =?us-ascii?Q?dBwXHnESfxfB1t7zCQh+pbnX+LbzpQxMPN22nQQtAFe/SL+B5w1FE2u73oJ2?=
 =?us-ascii?Q?+CaXu6BsiUTE4Hqp6MjTW79cW6L4S46kWMduwymwh4aveDAT98HcOGcE42og?=
 =?us-ascii?Q?qb2RPxvLTBNr2HFnuisgwhxBakzkw4hjC4AKUjyG8n1Fo6yR+xwFIjazFJFO?=
 =?us-ascii?Q?ylGvX3XEndaYK5XDgC/DtrCVQG9F01kEqzUqvLQblLxV93ME5POensyCPCWj?=
 =?us-ascii?Q?iXyJmC/At23X70lS+tFWmGEmCDENp3WTAj7o+AW/udZzqQOoXi6TYGl8zPeS?=
 =?us-ascii?Q?CJfG4K5AUdZ9IiyfkmAowXeZ60li9dJ97i5lYRVRpuLFOz1MsAcz/oZpYJgV?=
 =?us-ascii?Q?o2hZErREPnSXGGCSTpgTSvhiEdzFfNJPwxQd2GbyGGMWh/6FAeV7AkTgbYjw?=
 =?us-ascii?Q?YjODQq7AYTi7U8UoS7kMKoLz+zM7CuQ0H/FSvVC9R2CI79eX+XktJR/8Tuzx?=
 =?us-ascii?Q?oaCrPfvfrXY1WV9zbSLJT48SvAmfENW+eLDHhhZuZibniwihxjSUh0oKRPpP?=
 =?us-ascii?Q?DlxFJNDB5+4mAmtNWS/GsXSCp7uh/pqahT62qKt0UzePkUjW8muGSUvLjjJU?=
 =?us-ascii?Q?XUsB/OB0HiaNvAAQZ6zkCHxiUKFhKg3ziLQTA+9t?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B4BA185410CA14F836DCF2CFD15A08D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	QV6biZOCU16PP+55N8cjR8ofW7gEbHV+sr8KVdl7RwmoHJwZPc+sJgzTN498PnTHhF9955n3rxRAW+ryLfK8Fp1WaoA3hKSj26BLz8mgH5Ij1Aa/dgSC34h27kHnyZa1fnRlvZmb3mLKbleBuF83yVogHQZmbGtTeQqRiGJ6/pQHS34CSC5+pXImRaZk5eMNXxbbJNB3kPNkVLKGkSwCsr94xzwMFu2Dx+dYlgYROjDZbnQbJQqSs2MtmdI+n0+knhiWPff7kkpCBF8qk22qr/UymBHQ3ixFlz2pAlIgd9lJl6/H6/F8Pij62S8X2kTRgcNDjoW5cKc6vF32Q12fHO8F0igO4o18WlcsnXuC/wg5kh4yuaV3Ba9XddG403N4+kbQeGVeA5hodUvCZDHntcO64oQlTfZBKS/28E4Ox60nFEQGeppOPD667hhh5RFMe5OBpqiK0ok1Sshl2QEkbKhErWGvAamvx3h936rnRr8cPoBdzMb0B7Q/Hybq6NAtdx6f9ShmhYHgkZG7vFyeHOdRbX9Po8PMq97J+TgJu8vPLFW2lx7jr8gI39ZrmfNhtCQCyYQ7EFUOjhsvbS2Zd2xK5BO+he/YXy1jwvfPFYSqa2loq+x7dRLHCSvUxEvsK8k0f12chtIqJg9rom4ZCmwUln0rzaOLurnOhhX5nA2djboQ0gQJ2AXizZN4lvxgCMBlGpta89cJvhVFPFiRqW2hXSbxcp1rJE2VXic5UPRjMgjBi3S3F7IZzhi5q51ZTK2XBxAI8gPzjw6jX5H9dZCewqenAOnnuyAhPyufP4JalE8WSXUqa5vqBG+yXMaxVKaGZGNM+uBQDPuRyhG2gDPGg4Yz9A7WIucRBnB9U/SyrKunH1v6Cz8sVTkB0G0a
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221941f2-7511-4a24-432b-08dbceb43003
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 01:55:49.7420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykYCAvSrra0AaoShxOgr4oDOYkw6sM67nNJcVtlUeGA9mrDUuQxg+UMIhMHmxl+3bz64h/BLfX1O8wjxgvwQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7130
X-Proofpoint-GUID: ypq7QIuSoTgDzUBp41UjFxxcYFFgtkhs
X-Proofpoint-ORIG-GUID: ypq7QIuSoTgDzUBp41UjFxxcYFFgtkhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170015
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

On Wed, Oct 04, 2023 at 03:52:53PM PDT, Andrew Jeffery wrote:
>On Wed, 2023-10-04 at 00:34 +0000, Zev Weiss wrote:
>> Hello all,
>>
>> I was hoping to gather any thoughts in the community on how best to deal
>> with a problem I've encountered on my latest OpenBMC platform port (but
>> which I think might be relevant to some other systems as well).
>>
>> For reasons I don't fully understand but that I think are orthogonal to
>> this particular issue, the platform in question can't use the Aspeed
>> VUART, and so instead uses two SUARTs configured back-to-back via the
>> UART mux to provide the host's serial console.  The host's firmware thus
>> enables its UART early in the host boot sequence, which requires that
>> the AST2500's built-in SuperIO device be enabled (SCU70[20]=3D0).
>
>Is part of the issue that it's difficult to change the initialisation
>sequence in the host firmware here? I assume host firmware doesn't
>behave very well if you disable SuperIO entirely?
>
>If host firmware doesn't completely bail out, would the PUARTs help?
>
>Essentially you can configure UART1 and UART2 to behave as if they were
>VUARTs in the sense that they're configurable from the BMC-side, but
>with the benefit (?) of still doing TTL serial signalling internally
>and being hooked up to the UART mux.
>
>The big caveat is I haven't actually tried this myself so have no
>feel for the potential traps, and may in-fact be imagining the
>functionality. However, see the description of the PUARTs at the end of
>43.1 (pg 669) in ast2500v17.pdf

Yeah, unfortunately I'm not able to change the host firmware, and it
doesn't take kindly to the SuperIO being disabled.  My attempts to get
it to use the PUART have likewise not led anywhere useful.

>
>> Unfortunately that exposes the BMC to some of the CVE-2019-6260
>> ("pantsdown") vulnerabilities, which is a pretty big downside, and one
>> that I'd like to minimize as much as I can.
>>
>> The SuperIO only really *needs* to be enabled during the window of time
>> in which the host firmware performs the UART-enable sequence; once it's
>> up and running I can manually disable it without any adverse effects.
>> So what I'd ideally like is to have the BMC enabling and disabling the
>> SuperIO at runtime, turning it on only when it's expected to be needed
>> and then turning it back off so as to minimize the exposure to known
>> security holes (while in general I wouldn't like the BMC to consider the
>> BIOS/UEFI code as "trusted", it's hopefully at least less actively
>> hostile than whatever might be running when the host OS is booted).
>>
>> To that end, what I've currently got consists of:
>>
>>  1. A kernel tweak (currently hacked onto the aspeed-socinfo driver) to
>>     expose the SuperIO enable/disable state as a read/write sysfs file,
>>     and
>>
>>  2. A patch to x86-power-control using that file to enable the SuperIO
>>     when the host's POST-complete signal is deasserted (and disable it
>>     when it's asserted).
>>
>> Aside from being a bit of a kludge (and a fairly special-purpose one at
>> that), the major drawback with this approach is that it seems kind of
>> inherently racy.  When the host resets and the POST-complete signal
>> deasserts, there's nothing synchronizing the BMC and the host to ensure
>> that the BMC does in fact enable the SuperIO before the host tries to
>> access it when it goes to enable the UART.  In the stress-testing I've
>> done (including swamping the BMC with artificial CPU & interrupt load) I
>> haven't ever seen it "lose" the race, but I don't have a terribly
>> accurate sense of how tight the window of time really is.
>
>I assume it's not enough to live with maintaining BMC integrity but not
>confidentiality by putting the iLPC2AHB into read-only mode and leaving
>SuperIO enabled?
>

I suppose it'd marginally better than just leaving the read-write door
wide open, but I with the options I can see at the moment I'd be more
comfortable with a race condition that my best efforts have been unable
to actually trigger if it means I can shut off the SuperIO entirely.


Thanks,
Zev
