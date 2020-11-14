Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A022B29B5
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 01:16:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXwr60p3TzDr8V
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 11:16:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.100;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=phong@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=tYXkTMP/; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2100.outbound.protection.outlook.com [40.107.92.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXwpY6HgqzDr7P
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 11:15:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onk73q+/81KJ8H3gW6fUQ25sRwsn8INbtLHZHVwB0K7D2UEQsmOobhvgRgBen/A0Yubcxj3HGZgwhwEONIijCIsbG/YiH80aXDFItX7hdNleki7u9GcrDEp5RXZ2DEW6NN7RGAD2h4zNmuJ1mVbYKPmAoCaC1dupdpo7WwWAbV3Q5UQfg8Yoh+v5zO7WdI8lzCZb8Olof/AxbHKCs3OtbI2jazWC1JymqVrWyI4ZmhvFZx5TazULnZZbnpKcgGOEU/QCf3GMZHULYa29kcUXS1+nlAk2jGj1t7j+GKAmOCA2pcMaTsZgsMCE+EC4MZUwzHHXf1BE9JnyxG3YHylpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0PSJ9RqLugZHlG5WSrJSgyujRuL4FHQ2ZYa4srnsL8=;
 b=TC6IvqaB8t0/PzUH7N6yW+pLkCyFFTr8Cd8jh7p8i8bpH6yFXV4tvbEQJw6jihWFROD7ACIW2MMndzWX4AS7pPvT5lo+nXxrm4MWiZMkFtzq8y+98WpY92IRj/2Ntv6UboTM0CPUDKhpPyts/mFFLKqa77KmNzlbtQclfg37ApvOBdFyPyeNrlZFxYXlMiuKVkjm4RdJfkJXlbCljI/NqlfDsxJy108gEp8MAY9r7eBXxDJsDKqNOHpvxv2fUFdKyeMQlBvXJ20MnTZRVDgs6d54qeWPlot4esrOPTsfkqWQ5B+EssR8WP7U2/IT0jmaJEP7ZEJNGZ4lulBg9ec/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0PSJ9RqLugZHlG5WSrJSgyujRuL4FHQ2ZYa4srnsL8=;
 b=tYXkTMP/8Mcg5BG8wLyXf5bKu/oiVOq1zuH5iDWR08RebFdPfzE8q1ekhJHEryMxX8QKe8c6ERU3+AQvtH6KdKbyHpZ2OdrewfoyU03pS9I9fRFwjnSjUSOK++I9oqZAH5PzE5mXytjGC6OTAVACIZqz1HIcQc5U1ukv2dOhmKc=
Received: from SN6PR01MB4093.prod.exchangelabs.com (2603:10b6:805:ae::21) by
 SN6PR01MB4336.prod.exchangelabs.com (2603:10b6:805:e5::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Sat, 14 Nov 2020 00:15:24 +0000
Received: from SN6PR01MB4093.prod.exchangelabs.com
 ([fe80::597e:618d:7313:f0f3]) by SN6PR01MB4093.prod.exchangelabs.com
 ([fe80::597e:618d:7313:f0f3%7]) with mapi id 15.20.3541.025; Sat, 14 Nov 2020
 00:15:24 +0000
From: Phong Vo OS <phong@os.amperecomputing.com>
To: Hancock Chang <HancockC@supermicro.com.tw>, krtaylor
 <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Topic: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Index: Ada5WVLVdTQdRtNrQkuX76FPCTQPrAAwbxEg
Date: Sat, 14 Nov 2020 00:15:24 +0000
Message-ID: <SN6PR01MB409396D2B24F8007E719D2E187E50@SN6PR01MB4093.prod.exchangelabs.com>
References: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
In-Reply-To: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: supermicro.com.tw; dkim=none (message not signed)
 header.d=none;supermicro.com.tw; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [116.118.69.158]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e72fcd08-2969-4f02-7be5-08d88832622b
x-ms-traffictypediagnostic: SN6PR01MB4336:
x-microsoft-antispam-prvs: <SN6PR01MB4336B04D0E00B8AC7C4D0DEB87E50@SN6PR01MB4336.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5m3SZgHrqgA+HwttxJOkQtaEin69tdn/EFjbMpLe0ZREilajbKtWh3fuRRST4LZpNzeyNtPK8o/qFfcwiLBtqJTmbqhrfkPAZiOe3FoMCoIER6TpgvDLnVeWQ9NVCWngsnRsg6RNi3JOONyxGo77NSsdlQKwyEeLZerFoqTiybbcKgAZHCz5ZO1r8zzJ0oH4ZfHN6z4jA/B3Juo44HuiqpCLzdhbP8AEhrbvldVtAgVlu5IWUnOkb4wE9Wu7kUrSsSn6fM2/GCLLjXxkoCvhKmAe8s/oOlYopXlWXJHywBrcLs2Ix90EQbs8bcOrcctr5jlizSwOGqAQC+qmjmxFUmfKGnC3Mo6kKx96GIvmERY4zec8tTW6O8aST28aW2EthKgBIPxXveNWWcem7xm7kQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4093.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(66556008)(966005)(508600001)(83380400001)(5660300002)(33656002)(316002)(71200400001)(4743002)(53546011)(2906002)(110136005)(9686003)(186003)(4326008)(6506007)(86362001)(26005)(76116006)(52536014)(66946007)(19627235002)(64756008)(66476007)(8936002)(8676002)(54906003)(7696005)(66446008)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: x7K6WKADyFCx6zXkeA9YAiJDeemoowIX2VlZuW8qWMj0HzQOW6PkhvsEKcIMAxymyCGlcw2E52m6GbbhdVkJcYpmCBDyHqFmBVgkcYpogytRkCl68iybX5bVFcU66LazJNszqY7lROfbxV84FNxW0e/PEKLboYFIlppse+LfzAWV1AMT5pE/tSpPnyjfSTod0ui+QoG/QdZYcTVSc6W7kU+Hv10+M3uT+44M0JWC5ngqsBrGf8uBlEf3eRdNdKJOmlJfKl3J7ed+66s7H9jCMDy8JHNffjIIcOUom5AhYRAONNZzmRg6AVbtOCxPHnBwaZIukL5q18X4Wfh+NgUp0ZOxxd7xMpn8JjypZxGD94GCO+3cOUr7o4zTMvmT/tWgkuk3ZhKORjKZ7KQkm5zDWIoYzE8yVG0qs+d4ughcMYUkCBBKCF+g0G7Dk3E/gtrSoqaSXarYGmrKOpKpTORAFc6MR0ePmwIpRmdWNoOzN1Y/TvYCvY9mHRL+yloBQTfW/RI0Xp7eEIGxRzswZPwJmRcC7sBUV+nyQTEodRViX9NkE7HqM44gjTBsfo+tLHEOcKKPvYdE1EgwsLclsJb4W4019ilxLUicILMY5L5iOEB1ENGDMJLtro4Ksxypi05BJViS//3KbgzKE7zq4WtpYg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4093.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72fcd08-2969-4f02-7be5-08d88832622b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2020 00:15:24.8445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWRW7Vp7pGiSfRAeIf7dSdbpnPaJopaGAie0UAdniCZm/9nJsyJ2hS8gLEhUupYF6V48SdVsUqVj6rNoQvGeJeqTpiiThN76Kkva62NErOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4336
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
Cc: Ryan Sie <RyanS@supermicro.com.tw>, Ryan Zhou <RyanZ@supermicro.com>,
 Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 Michelle Liu <MichelleLiu@supermicro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hancock,

I would assume you are request meta-supermicro, and not meta-ampere as we h=
ave been requesting meta-ampere also?

-Phong

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+phong=3Dos.amperecomputing.co
> m@lists.ozlabs.org> On Behalf Of
> Hancock Chang
> Sent: Friday, November 13, 2020 8:15
> AM
> To: krtaylor <kurt.r.taylor@gmail.com>;
> openbmc@lists.ozlabs.org
> Cc: Ryan Sie
> <RyanS@supermicro.com.tw>; Ryan
> Zhou <RyanZ@supermicro.com>; Kevin
> Liu <Kevin_Liu@supermicro.com.tw>;
> Michelle Liu
> <MichelleLiu@supermicro.com>
> Subject: Need to create Supermicro's
> repo for OpenBMC Contribution
>=20
> Hello Kurt,
>=20
> As previous communication in below,
> Supermicro has completed the CLA and
> been accepted, our BMC dev team is
> preparing to have some contribution to
> OpenBMC, so would like to ask for help
> to create "meta-supermicro repository
> as openbmc subtree" then could start to
> follow the process to do some
> contribution
>=20
> We have 2 BMC senior staff would be as
> repo owner, name and email address as
> below assume this will be needed for
> creating the meta-ampere repository.
>=20
>      Ryan Sie, RyanS@supermicro.com.tw
>      Ryan Zhou, RyanZ@supermicro.com
>=20
>=20
> Thank you
>=20
> Hancock Chang
> Product Manager, Open Source SW
> Super Micro Computer, Inc. Taiwan
> Email : HancockC@supermicro.com.tw
> Tel : +886-2-8226-3990=A0Ext:3198
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: Michelle Liu (SW-PM)
> Sent: Friday, November 6, 2020 3:58 AM
> To: krtaylor <kurt.r.taylor@gmail.com>;
> openbmc@lists.ozlabs.org
> Cc: Kevin Liu - TW (SW-PM)
> <Kevin_Liu@supermicro.com.tw>;
> Hancock Chang - TW (SW-PM)
> <HancockC@supermicro.com.tw>
> Subject: RE: OpenBMC Project
> Contributor
>=20
> Hi Kurt,
>=20
> Thank you for your prompt reply. It is
> our pleasure to join the OpenBMC
> family.
> We will do our homework. And, we look
> forward to working with all of you.
>=20
> Best,
> Michelle
>=20
>=20
> -----Original Message-----
> From: krtaylor
> <kurt.r.taylor@gmail.com>
> Sent: Thursday, November 5, 2020 8:16
> AM
> To: Michelle Liu (SW-PM)
> <MichelleLiu@supermicro.com>;
> openbmc@lists.ozlabs.org
> Cc: Kevin Liu - TW (SW-PM)
> <Kevin_Liu@supermicro.com.tw>;
> Hancock Chang - TW (SW-PM)
> <HancockC@supermicro.com.tw>
> Subject: Re: OpenBMC Project
> Contributor
>=20
> [CAUTION: External Mail]
>=20
> On 11/4/20 2:25 PM, Michelle Liu wrote:
> > To Who It May Concern,
> >
> > Super Micro Computer likes to join the
> OpenBMC community as a
> > contributor. A signed CLA is attached.
> Please provide us with guidance.
> > Thank you.
>=20
> Your CCLA has been accepted. Welcome
> Super Micro Computer!
>=20
> Re: guidance -> Lots of great info here:
> https://urldefense.com/v3/__https://gith
> ub.com/openbmc/openbmc/wiki__;!!B4
> Ndrdkg3tRaKVT9!5otlOzkwUlYZ9roBAho
> 62Vrz6MbCB9RCh3O9qH_CJuHNd7kO8iz
> wwh5El5g3GOZdYEe4$
> and here:
> https://urldefense.com/v3/__https://gith
> ub.com/openbmc/docs__;!!B4Ndrdkg3tR
> aKVT9!5otlOzkwUlYZ9roBAho62Vrz6Mb
> CB9RCh3O9qH_CJuHNd7kO8izwwh5El5g
> 3GN7gkhFt$
>=20
> Jump on IRC (#openbmc on freenode),
> there are a bunch of friendly folks there
> willing to help.
>=20
> Kurt Taylor (krtaylor)
>=20
> >
> > Best regard,
> >
> > Michelle Liu
> >
> > Director, Software Products
> >
> > Super Micro Computer, Inc.
> >
> > D: +1 (669) 284-1046
> >
> > C: +1 (408) 420-6407
> >

