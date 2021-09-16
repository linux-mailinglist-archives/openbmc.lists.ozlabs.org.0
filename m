Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954B40D1B8
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 04:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H91Ym1QNkz2ybN
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 12:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=R7r/oNUI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=40.107.130.87;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=R7r/oNUI; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300087.outbound.protection.outlook.com [40.107.130.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H91YC02jLz2xtd
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 12:40:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/nCsdqxOwXWZpfVWKPA2klES7xH3AzsO16G7So/sYWzvN3odfnIF/N7Bir5+bdpl3RKBbrF5u0H8+Izbur4tQvADb+DtBID4AUk/G9gPmaJcyRMJqlkCyQmm4sH5RRmRcHsf8N9AxfEo9dHQ3qkfe2cGZHpjpGjRjrvnE0X6BRQ5aUWPCfEpaLuV/toUIJ7qqd+kMdUlru5oJAehpKKtkDOmc5vktfmVadT0f1OpAHPuLmqherJJTsdEMjTLxzyLg/LNT7gW6amdqmRpZL64RY7O2jw0rJsLVnvuqrLiwYmlMKM05SOy8EUuMwmPDMprDRiWXy5IGmz17CZ6o/oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LSGvZz5/8hIVThJ3pMJu8GCnjTFDo8HkfBHzsZldrkA=;
 b=KGm3dOJd8cEydwEsmuN+rGtGsdrpkBzHHqHQshlOGPppjdyQqrKc4z95bPzKh8YY8nx7RLSTHCzsNquegnNS3cLaqtgngZVPZKHLI0Au8SSDJVbQB2nQ48/qDbZBSKecdyq4p2/PQu6zPAOOqeKvlukmt/qPbKq7iNRS9Ip1TJSiREuA1XyOiYeGuea/NnANlO3Lvp8cP7S7XIW+i2n3n1U/tJuURpRIyGyzNPHJl3LqshkfmW3P1lCmW50qGfCRTJKsiI98oc1GmqPWxqb6jOpf1v4BUpRoC2QHKIESSsTc4G7OZb+hRmJDEBuofjJIyyZov7I2kfWWShk6zBYmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSGvZz5/8hIVThJ3pMJu8GCnjTFDo8HkfBHzsZldrkA=;
 b=R7r/oNUI9+E5iBceqLIVOq6cZfsev4QTIqJgVyPAE9qbAcxD7WyCDJg+MIyeoIhroi4rRJU8W/fbjkPJkEbVMNt0ZWeNL1SmUUJEo9X+XW5yFWva5tmYyTTVX9ovZEvmFZtmqCz3K9TKdBgpm7nMkX5MD3h37F9uR+LFTnjNfCw=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK0PR03MB4641.apcprd03.prod.outlook.com (2603:1096:203:b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.11; Thu, 16 Sep
 2021 02:40:39 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::466:b8ce:3e11:6bda]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::466:b8ce:3e11:6bda%3]) with mapi id 15.20.4544.006; Thu, 16 Sep 2021
 02:40:39 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>, Andrei
 Kartashev <a.kartashev@yadro.com>, Thang Nguyen
 <thang@amperemail.onmicrosoft.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: Read smbios2 file failed
Thread-Topic: Read smbios2 file failed
Thread-Index: AQHXqRvEf4cGRgyZv06bt0wU6uTG1quiLzQAgADn6wCAACLvAIABXVwAgAArQ4CAAFHdIIAA2wuA
Date: Thu, 16 Sep 2021 02:40:39 +0000
Message-ID: <HK0PR03MB5090C26890DAF0FBB36D883CCFDC9@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
 <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
 <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DF4PR8401MB06341BDD6521896375C0CF498FDB9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hpe.com; dkim=none (message not signed)
 header.d=none;hpe.com; dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1387f66f-0ecb-4b51-22c1-08d978bb5ec8
x-ms-traffictypediagnostic: HK0PR03MB4641:
x-microsoft-antispam-prvs: <HK0PR03MB46411B5097A20A1AACFB7E14CFDC9@HK0PR03MB4641.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lBoml2z16sFEUqU/FylliGKoJjVPnPEHjxtvtSyJ1j1+VGGp2IVwqdtuK7LdifNctM7F0F+gzmlwU5ZdMMSTZtG+he5fz5O7pEA/dhuCZFec4CLFVHtuDA5ImFn/+jA3dDLOMrimr9cFZFLOA9saG+i5o6WdAbBpSSGcpNd4XgwepGgvOEDWSIoa7tkWTluJfPXmqxBwyJtAjvAbDdKBaklT4ob1zsyqYHlPfqPrDTpP+T9N6nJCUiLm8x7JUdeL6ppUKZom5Reu1mg6DfvjwsAkwPyiQKgwdjWjigex9JXXn3ZwiqReJ1NZwcu54mBYi4okdAhpW2R4DI8ro2xDmmkcbdWRv05ZwksOL2WxXznjdLnhg9XLYt3phZ8fKZH1ulCJjQ94g60/g2Fla9gzQDRV+LqLcHeJDLnUTN2lYyyQJTIgjD0gfV0uAaj5Q91DRE2PHg3JquZais4qKtYqh3fH3AfiNHlKX+MOoF09CVdTmAV/nO4qqZMLahMe1WxnwfxugC8qGDxKpg4F1Ef+F0keksyGOadH3JHoV8SdJnWLLCtD89dn3mM7cBM4/gpcQmcQ8cMxPbEAb9xHxwK+28UP1kJHMEBh9QRxxrFVMCbucrokSGu3Pdh79gRn9EaMLDjBsFzPazhqcFfCTbDygOoIf1aJ4jsPto3aqzzIVCsLibya+2MuljpQtoPm++SwwEmv3Uplvk6ooP/mwGEbla1q4FVK+N92PvdYu7RMscAWAroRX8RRLZjVQFQQJgT6snC7owf5cu9tJAqUBA2jJ/3X7MeMd5jTerko2qmsFSYrsPqCpaLXN9UFgreBLmHIZTxWnxLA8mSrtYwU6mLDzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(76116006)(53546011)(6506007)(83380400001)(71200400001)(7696005)(122000001)(66946007)(66476007)(66556008)(64756008)(8936002)(66446008)(26005)(86362001)(110136005)(478600001)(8676002)(45080400002)(186003)(38070700005)(52536014)(316002)(966005)(296002)(9686003)(5660300002)(33656002)(38100700002)(55016002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sa+Ai4Vl1iHPd7NYYCLZcOGSE77SYXB6DaHuycbwF5z3akMOwgZxppAtGD?=
 =?iso-8859-1?Q?dHz55fjhoAiOlNhQ61YV0gKTYcDkdpN5CphqVML2IPxRW8HrWFFFulHP65?=
 =?iso-8859-1?Q?EUYUqzyZPpGq7XDfWONPEXk2Aqjm2vH41Iffet6SrFX4G9gt8o2Sa4suxG?=
 =?iso-8859-1?Q?ILHy7VxeKSJaHr6UVd3Bb899Ro5po7HTF7Ez4GjOgTRvdtyG2r7rSSLSYq?=
 =?iso-8859-1?Q?YX2yijTEF8tjzsnrO5KMbV3L+gZkQG2nysUZ5uOfbPNpQvMZabloYJOdR6?=
 =?iso-8859-1?Q?WNsz5vs8/uyMYgrF3QINHJ+rsH9XoLr450yVnGcRsm2G8wb8ttcg7jFkHP?=
 =?iso-8859-1?Q?8KfXC5s8yT1N6YT7mbJx4zRNXY+uQckNqatW9yfZuM1PccLmNqH6jveWz1?=
 =?iso-8859-1?Q?qfugeBCnSqPVTg9Ac8uQIIrvatiNPd8ubKd0cNnpXvATNdyyDu/X96bZCa?=
 =?iso-8859-1?Q?KpOagsF7mglcnIkYaVYVBlMZhkBipveh6S+bFYCRa2UaFZiBRf2brpczxY?=
 =?iso-8859-1?Q?KOzDTkmYju0dVWpqBjY8/wiwUCotjbp3YYMx0R9nsEga3/3lx3W46wvQRn?=
 =?iso-8859-1?Q?lTlHXFpjtkgGY+CAApGUmQMaYxgwK/v1xqj6yyefX0I4sdGUIs4QYVMuG8?=
 =?iso-8859-1?Q?T0Nk/anCTllm+85I73e2Qtkpia0dc2dHTqvNNIASNAsk6GoV5cFpYex1wE?=
 =?iso-8859-1?Q?v0kyVPjXsytdHh2oUEjRtklf10BwPaYD5LD9v+9KQu2Enm65QUMOh5jEif?=
 =?iso-8859-1?Q?W2EHJZ5lN6s5kvgQP5LMpOQjlioIolpfzj8rQyp5x5In5UtB1mH49CZAcY?=
 =?iso-8859-1?Q?mD0GIGmUnX7hBuOiq38Db3iDYfd/Z9dS7nKwm5tbM5qwaE4UwDir9pyfnt?=
 =?iso-8859-1?Q?pkAfOrnBLZHKm6mkjUZ8OxNFAT4efhxOMO9loTFTBk/UWlPl8/B8Im8xgL?=
 =?iso-8859-1?Q?2joOeFcst6OiG1mbpSjZqdIe2lMpgO5XmfZGKxw3JKCNpwIw5gdETXrsIB?=
 =?iso-8859-1?Q?K7YTh/xLkCu4X26Rs8t+a+0dqBqvscbkkzp710v26lh8ALqpJ/olCP3Vot?=
 =?iso-8859-1?Q?VaidbcZtsjCGUvy2Za3pIJEzwogt9J3B2ATRq3m7VIYVXw+u2Axcrak7Sh?=
 =?iso-8859-1?Q?ECoI42I3ZCXY2k5vV7BpjWT+xnV0/elQ5UBikbvb6zxQNdCtNpXNju0kTA?=
 =?iso-8859-1?Q?mK7Hb6LGqwxkIoR4YKigXN/Tj59U0Pv+Rxz4IbznLP+3kxe6n8fpyZNyfw?=
 =?iso-8859-1?Q?u1UEuVsvqT/YKiaro3maiKdunZstx/Q7saZBWB81Dkyzv69/XD/gj/N9aL?=
 =?iso-8859-1?Q?woZwXSi+CdQ9nW5ecCklRgcVLAC5V7nsqIAqO4YdcrCp00gxz+PILEFxIY?=
 =?iso-8859-1?Q?BYviCnDeg5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1387f66f-0ecb-4b51-22c1-08d978bb5ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 02:40:39.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kg1ymEAYlwSgqupdNnyVxIUvNxFP+wyHt5ouiIrVPGZ5CMtBfi8hLhaqiP66XaXS/Z8s0364UB1kgxP+OqezHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4641
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

Hi Thang,
Did you try to use smbios_entry_point or DMI from host to BMC /var/lib/smbi=
os/smbios2 for parsing?

You can refer this sysfs-firmware-dmi-tables as below:

The firmware provides DMI structures as a packed list of data referenced by=
 a SMBIOS table entry point.
The SMBIOS entry point contains general information, like SMBIOS version, D=
MI table size, etc.
The structure, content and size of SMBIOS entry point is dependent on SMBIO=
S version.

The format of SMBIOS entry point and DMI structures can be read in SMBIOS s=
pecification.
The dmi/tables provides raw SMBIOS entry point and DMI tables through sysfs=
 as an alternative to utilities reading them from /dev/mem.

The raw SMBIOS entry point and DMI table are presented as binary attributes=
 and are accessible via:
/sys/firmware/dmi/tables/smbios_entry_point
/sys/firmware/dmi/tables/DMI

Best regards,
Tim

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org=
] On Behalf Of Garrett, Mike (HPE Server Firmware)
Sent: Wednesday, September 15, 2021 9:19 PM
To: Andrei Kartashev <a.kartashev@yadro.com>; Thang Nguyen <thang@amperemai=
l.onmicrosoft.com>; openbmc <openbmc@lists.ozlabs.org>
Subject: RE: Read smbios2 file failed

We recently did the same thing and got it working.  All you have to do is t=
ake the RAW smbios records blob in binary form (delivered as noted below in=
 whatever way you choose) and prepend a specific header:  https://apc01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fs=
mbios-mdr%2Fblob%2F33c948a473bd273fea0cff82d4c99b70b7784be6%2Finclude%2Fsmb=
ios_mdrv2.hpp%23L114&amp;data=3D04%7C01%7Cchli30%40nuvoton.com%7C81a4bd29e4=
904bf4d84608d978510b92%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C6376735=
26954552742%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoQwcozsSoGlgSFwztPFV3FAoPpRZ=
GYoZ7pc0%2BxDi1MA%3D&amp;reserved=3D0

It is a little bit fragile as it introduces a dependency on the file downlo=
ad logic to write a non-standard header defined in another service that cou=
ld potentially change.

Mike

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Andrei
> Kartashev
> Sent: Wednesday, September 15, 2021 3:17 AM
> To: Thang Nguyen <thang@amperemail.onmicrosoft.com>; openbmc
> <openbmc@lists.ozlabs.org>
> Subject: Re: Read smbios2 file failed
>
> I don't know what is format of "dmidecode --dump-bin", but if it just
> raw dump of smbios then you only need to add mdr header.
>
> See answer for the same question here:
> INVALID URI REMOVED
> 021-July/026882.html__;!!NpxR!2w0FkPs2KyaB6XOvB8et52bWKqAMLImmL-
> iUk9A_zZbJ8WLhMeXdvRAp-pcxt8Q$
>
> On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> > Hi Andrei,
> >
> > I see output of "dmidecode --dump-bin" follows SMBIOS specification.
> > As
> > the data for smbios-mdr does not follow this, do you know about the
> > document or any information I can reference to prepare data to send
> > to BMC??
> >
> >
> > Best Regards,
> >
> > Thang Q. Nguyen
> >
> > On 14/09/2021 15:51, Andrei Kartashev wrote:
> > > No, it is not same as "dmidecode --dump-bin".
> > >
> > > On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> > > > On 13/09/2021 23:56, Andrei Kartashev wrote:
> > > > > You need to somehow deliver smbios data image to BMC. This
> > > > > means, your BIOS should implementat some logic to transfer
> > > > > this data.
> > > > > For BMC side see example here:
> > > > > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2
> > > > > F%2Fgithub.com%2Fopenbmc%2Fintel-ipmi-&amp;data=3D04%7C01%7Cchli
> > > > > 30%40nuvoton.com%7C81a4bd29e4904bf4d84608d978510b92%7Ca3f24931
> > > > > d4034b4a94f17d83ac638e07%7C0%7C0%7C637673526954552742%7CUnknow
> > > > > n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
> > > > > 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DcG6ZZzOSXkuUtcQuuoymsRdP
> > > > > p24mINa%2FhCy%2BYhe%2FNmk%3D&amp;reserved=3D0
> oem/blob/master/src/smbios
> > > > > mdrv2handler.cpp
> > > > Hi Andrei,
> > > >
> > > > What is the format of smbios data to transfer to BMC? Is it the
> > > > same content of "dmidecode --dump-bin" command from Host Linux?
> or
> > > > anything special in formatting the content to send?
> > > >
> > > > > On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> > > > > > Hi guys, I am beginner in openbmc I build openbmc with
> > > > > > smbios-mdr repository and I have error:
> > > > > >
> > > > > > Read data from flash error - Open MDRV2 table file failure
> > > > > >
> > > > > > There isnt file in /var/lib/smbios/smbios2
> > > > > >
> > > > > > How I can resolve this problem?
> > > > > > Help me please!!!
>
>
> --
> Best regards,
> Andrei Kartashev
>

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
