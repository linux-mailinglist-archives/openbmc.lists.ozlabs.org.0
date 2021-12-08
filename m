Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C486346DD22
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 21:35:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8TSG4z08z305p
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 07:35:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=Selector header.b=bvQQENcK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.112;
 helo=mail1.bemta35.messagelabs.com; envelope-from=dukh@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256
 header.s=Selector header.b=bvQQENcK; dkim-atps=neutral
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com
 [67.219.250.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8TRm2tdQz2ywb
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 07:34:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
 s=Selector; t=1638995676; i=@lenovo.com;
 bh=Xcj4otp0K7EF4N61MWnZJ6LfXF+QllfECEy2CKak97I=;
 h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
 Content-Type:Content-Transfer-Encoding:MIME-Version;
 b=bvQQENcK/iHwT2Isx9D+kjObbto5juquLvq5QdnA8VPNh/baxCkI2UbbrD1H5OaBA
 R5VhVMoz7cFMumUdl/Sc3ng66noT78B+uNXRIdClvTr/RgorSep3ItIVJue+4mkbrD
 pTorQcph+V46aMnuCAHf4NqE9gCQ+iAUd8p+K5YUu4WhuGd1hi+6jDpv87K7flvLmY
 86morBP4+4CTMz3YCKNFUqQRB5LzhjojnzEtjKh84/AOFD/GSpqU1MB/Zgb6vBj/t6
 8UFzDVpNiMT1Xu4nowbrwqg94/klsYto5JaJubMgPfqajQKtnRNT3PmS8Jau54cUwN
 LGVIF9G1FpHIA==
Received: from [100.114.97.172] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.us-west-2.aws.ess.symcld.net id A3/70-06184-BD611B16;
 Wed, 08 Dec 2021 20:34:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRWlGSWpSXmKPExsWSoV9jqntbbGO
 iwa0JyhZLb15hszjV8oLFgcnj9vYmdo/zMxYyBjBFsWbmJeVXJLBmbDnyk6VgB2vFjKPiDYx7
 WboYuTgYBZYyS8z8cJodwlnEKnFjxXpWCGcDo0T3r8+MII6QwGwmibNTprJDOHcYJV70dQMN4
 ORgE1CS2Pz0DhuILSKgK3GtuYURxGYWsJTY/PESO4gtLOAhseV3EyNEjafEip9nWSBsK4n7T9
 6B9bIIqEi8OnWRGcTmFYiVeL8SZnM7o8TNy29ZQRKcAqYSaz5eB2tgFBCT+H5qDRPEMnGJW0/
 mg9kSAgISS/acZ4awRSVePv7HClFfInHr5Xo2iLisxKX53YwQtq/EvoWToOK6Ens6trJC2DkS
 J89tBLI5gGw1iT2N2hBhOYlVvQ9ZIGx5iWmL3rND2DISD25sZwO5WULgD6vEuo7Z7BDOF2aJJ
 dfWQi0zkJj37QhU1TwBiWsLl7FNYNSdheQJCFtHYsHuT2wQtrbEsoWvmWeBQ0ZQ4uTMJywLGF
 lWMVolFWWmZ5TkJmbm6BoaGOgaGproWprpmhjoJVbpJuqVFuuWpxaX6BrpJZYX66UWF+sVV+Y
 m56To5aWWbGIEpp6UogSNHYw9/T/1DjFKcjApifKycm5MFOJLyk+pzEgszogvKs1JLT7EKMPB
 oSTBmyQClBMsSk1PrUjLzAGmQZi0BAePkggvMHEmCvEWFyTmFmemQ6ROMepyTHg5dxGzEEtef
 l6qlDjvG1GgIgGQoozSPLgRsJR8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwry0wwQvxZO
 aVwG16BXQEE9ARzi3rQY4oSURISTUwBfI+3uJWsVuwcbPmm4uqoRE3M7uY2l/Obfn4ljPvjZP
 0zcqP85cqiwowOHju/75o6nL+c5x+SoUic2vbbT55pst2H3zRuYFBVWal63fpnZxGxz8/eHRJ
 ZIHAqp9rxEyUZMXSOi8e8T66fcek1IN2V3xbHHoLfr9ufXpdRT15bWDCTcs3U/6mFsRw+/VrH
 pzNsP2is2eyh3RX0gPPdbeFyl5OP1Uwzdc7+fcP3e11DiJ1Rc9ObLu54XVIs/gPjW8XbKIn90
 XvjosPu1DBqR5ky/3i4lqz63P/n9B/r8L68sbulawrBectOHl/0p2Dh3n2WKvzVfVU+zn7vzs
 3u0HfRPHxdRsdTi5R1f7Ni6ZeV2Ipzkg01GIuKk4EAB7BHzBEBAAA
X-Env-Sender: dukh@lenovo.com
X-Msg-Ref: server-10.tower-655.messagelabs.com!1638995673!13073!1
X-Originating-IP: [104.47.124.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11525 invoked from network); 8 Dec 2021 20:34:34 -0000
Received: from mail-hk2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.53)
 by server-10.tower-655.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Dec 2021 20:34:34 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql9pk9z9E2L31nyj6f/B23ME3XNaRMbaIPMzTPU5vr5iWwLGu9R5AvbeVaLUChlkwIbLYHMhtT8z3bQikTg1i8UIg7wKvqkt8Ewn19lKyVfbaBHcR56KuORDUispP7APq9ReG7RAzKBE8NrZmQpfxJXVMQHNsBUcHhcFVjX6sas9kS6pDc8UumTxrAjcFNCb5OmyIQ0oyCB7B7S3BeZGIqB9hIGltvp5aBtoDEY4L4tqgq7+DKuAwSPsBygMs+PVHI9ydAgNbtXWf0v05nN9ist9+Enzwiv39YBLHe01QHZu3vWyAN/B3CmA2dh78dw8DLyTXamNdVcckBQ6K4NS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcj4otp0K7EF4N61MWnZJ6LfXF+QllfECEy2CKak97I=;
 b=IWnvRmkkkBpeK2SLdbVSi92JDGGkAEvfbLZTKdicIKwYsoh77zSfpo+vcOO1oVHj0NmjzYKTvK9Osahy62RNROwgrlwzlN8N8TWXm8TpzNtgYhJud68cQTAp9vvUAn/pfIpWbfth+C+J0EuwrtBADksdS4tqUXph2rUhdgvSYueoP8mTBeW2opFKJ2cEiVhb7qK+D+GBdeoec3Z3VxGdCJmivf1ZnNBOeHXtax3D/QPDjkwOCLluhF3CqEdJGBzhuZn2RioIXut9e73FmIArpCvx9JGwdBGeulhS8cQHhuZ7bOaAYxqog2UbEiJBRg4w2cwZ2V0HcMVoro51xoIJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB5831.apcprd03.prod.outlook.com (2603:1096:4:143::12)
 by SI2PR03MB5499.apcprd03.prod.outlook.com (2603:1096:4:12a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.8; Wed, 8 Dec
 2021 20:34:33 +0000
Received: from SI2PR03MB5831.apcprd03.prod.outlook.com
 ([fe80::4058:258:50b4:78e5]) by SI2PR03MB5831.apcprd03.prod.outlook.com
 ([fe80::4058:258:50b4:78e5%6]) with mapi id 15.20.4734.028; Wed, 8 Dec 2021
 20:34:32 +0000
From: Duke KH Du <dukh@lenovo.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: [External] Re: Apply edit permission for Lenovo CCLA folder
Thread-Topic: [External] Re: Apply edit permission for Lenovo CCLA folder
Thread-Index: Adfrkdat6+RFCn7nTq+ELly0GnVdQAAs8PUAAAtQFDA=
Date: Wed, 8 Dec 2021 20:34:32 +0000
Message-ID: <SI2PR03MB5831795031B7FB4B9016BE8FB66F9@SI2PR03MB5831.apcprd03.prod.outlook.com>
References: <SI2PR03MB58317B51F6CB17FF2910D4F0B66E9@SI2PR03MB5831.apcprd03.prod.outlook.com>
 <20211208150932.u22x2bjaehup3v2h@cheese>
In-Reply-To: <20211208150932.u22x2bjaehup3v2h@cheese>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f91bef2-94f3-4706-1544-08d9ba8a246b
x-ms-traffictypediagnostic: SI2PR03MB5499:EE_
x-microsoft-antispam-prvs: <SI2PR03MB5499FC2D9C58BCC406DE3E9DB66F9@SI2PR03MB5499.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I7oQHTxLbeTxjEBOyD8KqFpJvzn2khI8YfC2BFaTaNlVDc34JTK+ZMsgI86UFiwV7mYZIgaQbWFue8RClihjBPFp9MdU9FwiBpk4KXrN/X8GrdQm3O5Ywon3mZK62Ec9LLIgZKH1BUZpQfd15cur2sDKmmU8KTkUPe+oFvl8gGURM3zHlg2opPV2gWV1SWP13TSLyL1PC8O+e5Yan9NOpslCLb81wDnE6AX563e3gJynEp6YlSYlHO3r/kzYJ7GmRO4wyZFxdB6Z44MnetFW+POJYQMzTZIepthmmR+BoocqLC6K+E6zLQJP/p1XlB1UZRytnvbBazT6estfMGq0AXkaRrLm8M9BZLLColxDwAc0VPNcfgwWgyPZPVX8VKlNXkSXfFx/FyMtCVDQov04VXv7bPJN0LsjVqsO8XXgrXocdwHkBLBPhydz6n52b4vKSvN7dw7KgdLZToJXiJsNbpkxO0Dpn9xvPpUiD2D9U3GdQrSxdnrUsbHHvf9FcoUk62Ts3M7yPYnYrv6fAWdFn/4pkmFv3mdBJg+80s866v91vQKWQzTs+19cHE5sj6CwmPY45Y2qYa/SwmJr8uWWl3jj7Hht/sphONkRZKa8RyLpo6o0c9vHg9TUbUSLhYABPf7HxlRt7J/XL7p/IszOtEQEheWyljd6s+Mstl1b7ZZnos8rBtozMS8XAw4c3841K6VUYG9jTGmdnGLaYgDEEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5831.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(8936002)(6506007)(122000001)(38070700005)(64756008)(66446008)(86362001)(66476007)(53546011)(83380400001)(38100700002)(66556008)(5660300002)(9686003)(82960400001)(76116006)(7696005)(316002)(8676002)(2906002)(508600001)(52536014)(186003)(66946007)(55016003)(6916009)(33656002)(4326008)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YmgIa1+4sY4sLACzt5CHQLpc0fsVLES1FdVeWkB+0yQ/U0TFSPNzREsEPkg9?=
 =?us-ascii?Q?li8hDQSLzxirK4UttpK302OGKD7pVrI/Rjxz0n/EB01ql6yNCYfw8p+S+aoR?=
 =?us-ascii?Q?723aGilyD/W3CagkEzrXIK52vE7z/6/xg/kxjjboiC8xrLwQAzbqoDUoUT6o?=
 =?us-ascii?Q?KP1+4ETyMULAOgkrEzUPJ1ir7nfo2wvXKQWoolfjHwdfK/wO61rXa+PGtWPm?=
 =?us-ascii?Q?W3ZnM+C00MCNgkSxXqzaQynF+HEvnglBcfs5Hwpx+D8j4v56PAa7IsBw+Dfp?=
 =?us-ascii?Q?+xE8CbHqvcBXvpCG/WaL/ElPQZxWyPxKRLu8e6I/O3RHpEun9wCo8x6zl08H?=
 =?us-ascii?Q?F01idWWXgnzDyHVDggCwHgdyg/6oOBYYH+IMXERchm6/dH5+nSlSXPUONH/Z?=
 =?us-ascii?Q?9WwTJ9FNHqJHK9O4f4UrwFIeL+39G4xNMfxYgCQrzI+yCN7ekm7X1JmGnjno?=
 =?us-ascii?Q?qezPl13DcvDlb/I56BaiXke9gIDvAlq9Ohc8mqMUc7tsZGAX0Dj76LNBLxUi?=
 =?us-ascii?Q?pjjAI9mrh/amhRQRoEVEX9W689WZfHCI5mbKKfo8f9wcjeTZ9lg2718FSQbY?=
 =?us-ascii?Q?HqJ5q5Y9c2TjsgwuoYSN9CWUvphyI2ihFhdVVAB7vqJU6Jx8Du7yyW2gmpny?=
 =?us-ascii?Q?gt+tOShQBN3a7YpwAG7YmdDTwdUngt2rV+PS7e8Od22dv5msXqWFCF1qKJ+N?=
 =?us-ascii?Q?xTskG7n5y+isfRbgsve/qkK1M1SqA886FTid4BtumgddhYVF3Xo0mc+/tNhv?=
 =?us-ascii?Q?ps5LalDL3zEAT3U6U7pDJjgiF7bdl4jLn/Bm1U8om5kEOVRW2PjtvyUMW7+m?=
 =?us-ascii?Q?JlaE40p8xcweYSMB8iNSrFcQ0Ip4ypNW1Ke0dm145GeGLerlreHuJcq+CygG?=
 =?us-ascii?Q?KryqwS8MgFeujNbBPd3+vU+W6boPaiuOwR/k56rEZHY7s8Oh4gf4Fe6rPuOw?=
 =?us-ascii?Q?KErYFLQKfMKuvX5RYcWbvxi3jWCvmnqoUdK1nxXzK3Ci30Cv+cgL80Ui671j?=
 =?us-ascii?Q?sjGHivQkk0Ss4RQMLNGyCetxVwsx20DFoBgipCQPBc3zL3ep2TxfB5qtP33o?=
 =?us-ascii?Q?HdYCtBIRNDIUl4oKJ27OZC2cHw+nXkrYKsPQF+RhOWxK4DmnNf+LpW6mIl0A?=
 =?us-ascii?Q?G6mf40xeGukXg2ojjH/Y0kxhk83/LQLhwMbd2xy1IeA20OQJiuEctcQHyLY9?=
 =?us-ascii?Q?whiLNZlKNJHs1KZBKmD3rb+oeYu6k90qKmtLRzaiBiCB+b8f43OknnKVG0rf?=
 =?us-ascii?Q?lag8PsTVsn2DTuzjqDWPDr2FPqUhFOUGG+g0Ke4VHVRRjz0rlBuuNBobC5av?=
 =?us-ascii?Q?HAD5opROMKp7dOr1Y4Sy3uMYYMsCbZJV7zU7MDJMwVnLcg7MjF3lQXjqEcaB?=
 =?us-ascii?Q?POjeh/QF9j66UG8X7yiSbRN95MpBZRWGX2m82cfdnq7aav4Sck3VGyOwH4jr?=
 =?us-ascii?Q?XxUO+r3MM6Ry5CMiMZCa6ymHLIb7j2mwvl8JTL41Xq7SCqzGxvr2WCvIot9Z?=
 =?us-ascii?Q?j2xzL0/c9fXU1EcPUNYEni3nxKXdPRDMaVmCp0ZkL8V/sVFLFiMlklycW49N?=
 =?us-ascii?Q?7/kDy8JyeKLtOMxyovU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5831.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f91bef2-94f3-4706-1544-08d9ba8a246b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 20:34:32.6895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcHmGj+o18XXuHX5QS8x0VBjRf13j1kLUO9vjuOMvYf9vO48BMOyfnwAw0wtZE94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5499
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

Hi Brad,

Thanks for granting the permission. I can edit that folder now.
Just uploaded the updated CCLA into that folder.

Thanks.

-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Wednesday, December 8, 2021 7:10 AM
To: Duke KH Du <dukh@lenovo.com>
Cc: openbmc@lists.ozlabs.org
Subject: [External] Re: Apply edit permission for Lenovo CCLA folder

On Tue, Dec 07, 2021 at 05:44:35PM +0000, Duke KH Du wrote:
>Hi Brad and all,
>
>Could you grant the edit permission for me about the Lenovo CCLA folder in=
 the Google drive?
>I will update the Lenovo CCLA.

Hi Duke, sure, I added you as an editor just now - let me know if you have =
any trouble.

thx - brad
