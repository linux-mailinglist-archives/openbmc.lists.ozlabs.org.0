Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D14B4091
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:03:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrDL5QgJz3bb2
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VMO5LfZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::706;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=VMO5LfZ9; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxrCn2RhGz2xs2
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:02:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BihTRTE4ESQBvGvCf4Gls3+7l5Bm1bHxBmqE9QPkn/+n1R5xBPiwxD4E6m8NC4wtOujiInGw9ix4JHhs9CNaFAotJ/eYxUneR70pZWsKmOqd8drL/nkx4c0i2OywSOPEZvYxOhOPVTwBjYhse0JcX+xiM3Hl1NrcNnIEgDkw8viDLQp4Gh1BzYxT3g4iHkeV1b61T9+uJuAGviPcR46x7xJ6//zCFbQYUiLlx6WTbHLsugfAEhnY9m0yFOxTxzmidGzHQyAjqre6yLc86iXzFYpwEXa5VTY2LCnDxOw9woAPcrr516psXZJJ5BrpjnWnyPVX8nZiSO3Ltbi+frSvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6r6qQ+Tz5ByaGneL6bVudwB2qL05Abggsm3l6fl9Io=;
 b=Z2WwSttayCCajFai8z6j1UAaIKxeoxIZXoRB6b+HbAMAuiy8vAWbdT1Xp7eoAObWB681nGX9MIRHKjydxeb24qjypUzYnZhIYGN7GRmCnGPaiv7IL1soBJzROaHOimuOeAEaT6zyg1X3QbThyB/qAV8/Y/okbxNFMPZjxEdu2e36NuGP1UjiHodo0bsoIHKf85rVDw7ow3jTSk6+zYopZM4YdtfETHES/OTxe0elC+V3+9a07OFyBXkATais2LQc1rVNm1ClyO0CHAo13gN7FHaIw18Jb1gk34tWEJtEQQxQccd199cnakbil/2pMIcjBMibHULTK1fok/i0WFpt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6r6qQ+Tz5ByaGneL6bVudwB2qL05Abggsm3l6fl9Io=;
 b=VMO5LfZ9n1bXSPi6BG21OxAJ7Ww8c5if5rOfWYtaGu1JvTgut7n0lb/tMR4HepTwMZdVZVL7wpG80OuasR/elHBGVfqpGkud1sWmBKsdl4gTkKRRpMiS4Y44gmePMW+Rci6Y2gb3X8tyB8RBfI/Y25uveQQeIrSAhdhGimluO7F8pSgGUnCWBB0hsYUms/5Y9Um7qFGns4Bfwadqk7cuMNjcOesb8PX6enZoce/9W2VVtK8pa8RawV95e1bZ571lIzzGLm/t3MgcrT8RFycfMTTdQj8GJLvHsipgn0X7wvqLXenpF0TUkBRglFh4vCmY/Qsw211dC+S78lIklS5apA==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by TYZPR06MB5395.apcprd06.prod.outlook.com (2603:1096:400:201::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:02:21 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::1d71:2917:2d9:701b]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::1d71:2917:2d9:701b%6]) with mapi id 15.20.4975.011; Mon, 14 Feb 2022
 04:02:21 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKqAAAIO4A==
Date: Mon, 14 Feb 2022 04:02:21 +0000
Message-ID: <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
In-Reply-To: <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a463ea3-65c7-4c93-c66e-08d9ef6ecd32
x-ms-traffictypediagnostic: TYZPR06MB5395:EE_
x-microsoft-antispam-prvs: <TYZPR06MB5395F5E6B96CCE17159AAEB98A339@TYZPR06MB5395.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7fk8HbCVIYE9Bp3E00BkQePZHAMw1uSwVIFjTG7dtVFptaXUST5RgXMhftiLcwoq10bGxmSoiuOjE9gA87Gdj9oe1B9IzP/MkjOSgse80mu/tW8VsA6HfvlDmuO6uEGjHYVxNVTGp11PWYGYuyvtXhzMfmU1wk0VP6iE0iDWj8M5HyKxNYq4grDPkal3hbcM6P0XdSASyWfAOfcYldwo4EyS6eAQ6aXdpd5mrTS+gnWpOzx6asa/aT8PSCNG76XR+auaCcsb7VloVGCyZPgdZMgky//w3I0EbKjbLx1wB8Uw/gsJiL7dC20xwVJ8asm/vsDka60QGv4GvrDAnPbTNjkFvy1UJVTmkmfuM0p9ZFLUqQOTWSPL8JN53JJRRWipV/kSz23T1gqbsZxkBkVFhqp+Lf15fg3JT2WaAiMWgjB8wGsO/HuZiIoPapmVDQ1GgOfCMiQUsECXUC4owGT76Y+AjC9yw6KHwC3Eh1WvtuD2PURPgsEy19xCfvF1dMm7zNW4b8IS8Mz5dwBikIewR3wnPrilGJvHHjDagi1lawoUC+QzzYdv3MprOEb8G7VTsQAsGdfdoJeMu+J9Uc2unSC8LYm/PfNFpEIZuZXqU+DjtBC2/fJ2eAQ+jGzEE3NVb2U4EG8yZ2Glbxtav4cJWDXE7Oydt9Fovhdc0U1zuz8datXt+NGsi24eCwbjxUyNsPTtdJfGOHhWeQW3bSRYqX9HQpvesd3f7Vb1dHOlCSnn4k9iLvUFYJPUnPXlkMkrONQV3bNGZlD5ztMjMecBpzf5c+syYkii0K9nrxTWqAKIQ3dEJzMnOSjrXY8Bl6U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(366004)(396003)(39840400004)(346002)(136003)(55016003)(86362001)(54906003)(186003)(33656002)(26005)(38100700002)(71200400001)(7696005)(6506007)(4743002)(2906002)(53546011)(107886003)(316002)(110136005)(122000001)(52536014)(64756008)(66446008)(66476007)(66556008)(4326008)(5660300002)(8936002)(966005)(38070700005)(8676002)(83380400001)(9686003)(76116006)(508600001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dJXSq3dcNXwJu8HR5A5ACroVhqK0EyUsgIR4/TSRsang/SlAhuOypr/Y0jCL?=
 =?us-ascii?Q?sOQrFiOYscjE1i/aDIr1zbSjqsSD62Ts25ide3ZPaugQcGvjpVKNht+lLNtG?=
 =?us-ascii?Q?ocGyA5T5TpIMEfndyQueEkUgBKI4fDKNs6omAbAj7Wdb0okDl3mXr/kUTue1?=
 =?us-ascii?Q?2k+w+EqHD6PYP03hWINS1NwGIPYIcBXEfB9sv6cjRh1VuSUpLm7+rH7IoQjL?=
 =?us-ascii?Q?/p8qOuOXChImFbRnwpwxFX3SN4Ya/yRzz2pCrKrKgCl5oR6UhhhQ2XWQiKse?=
 =?us-ascii?Q?TmfOwu4Ya6p63jLpPWjA0z6mbKAprfgIzsnSzbQmdZo2mUWYQQBMDggVMpEF?=
 =?us-ascii?Q?8bn8bWFkZMi8U/LYkH0VZ4jS3cjUslSPTJ30oPAe+4aIlUp139q7XE0q/sx6?=
 =?us-ascii?Q?YBZn15UbZ6Z5W71vXDttl5D4y0ttZZKZCgepNanJ16f+h+DncYoL/7biMe48?=
 =?us-ascii?Q?yF7wNkpvdBJ83eLLYy+rWD0wjJidYg+1aIZDzbaRO9Wd9hkYq1TIIEkuAwpo?=
 =?us-ascii?Q?w/3bkUkhqBq7E3uxm68ctnuWVy4aG8Qb7KCs51G0dxIybH+M/GgOQNnd11py?=
 =?us-ascii?Q?8qhj0jiANemgfC2IDHOlF/nZ8t8Q/4aUkjIUz7KivRwwkmVUReLWcDO6evZH?=
 =?us-ascii?Q?83gW1jqNfV1Z5DTYvqgQjYlLQPQJ4Yaa3oFWp5DT0gZetNSEonvPRhj2zRfs?=
 =?us-ascii?Q?kP1B/ClKv10XHPUTwhLkJ3B2liqNzeIyFVqteWlztNoacG1NPI1VaGFJKfzo?=
 =?us-ascii?Q?lmJg0go5iuRuUTzH3/tj6Sa+Fgf02c7E+2LadVdT9OFgoh5rjxXqc83CqCq3?=
 =?us-ascii?Q?fYnOO+cpCfva1yq35lz8qMkRP1bCEzXmWFT+kCVo9MHfk+w8xTy5QzXuF4b2?=
 =?us-ascii?Q?hmRhMirVWZUMWnEtBLKA0Wjngga26XrNyp64bQxJYYExcwflUgzM7GPWXj3c?=
 =?us-ascii?Q?DtxClSZTY/qq3Gk1AP0aFzzjMm6NY2HZg/7L4aE8q4WNK19NX3yfmukxH6IC?=
 =?us-ascii?Q?FG7G2y14r+fABet9ZRlYK5eKOFh2SsLA1UFZ6658ln7JEB8+bAjTpxVWIzuO?=
 =?us-ascii?Q?hg95IcEg/EautcHrgjXpBrf7Qxmq5w7+4eu4tJLScnJPmVz3tQx951oRXuZ7?=
 =?us-ascii?Q?kjGiXGm/yv2/GSOkrwpfUXyU2sWvqY9xwYMQHMOKbPKWPDtqrr9LOlcSJiKj?=
 =?us-ascii?Q?lvcieGIod0Kv6u5QfcnbPt9nTkxg4H7Ijgl+G1X1zFJT+zPAFbthpkI0XlrS?=
 =?us-ascii?Q?F77YXdmz5d3PUWgl7057ANYIGogzWPXslmQI02dDU4KAF/S2YVdxMdBpZ+0v?=
 =?us-ascii?Q?OcKK+T1EnkHEg19FiYkiKbv7rBcZ7JuCzq2IF/e/N41hLc34RQ9Y3nvCEnOK?=
 =?us-ascii?Q?0mjAZPMejpnptOPwjfHd2dgubS7qvoVVv25zjOjX40dMyUEcK55/J84FUWTI?=
 =?us-ascii?Q?lVFBv5+JYbODi7NMw4aT0cFYF3vnwCHE61YdNqhV551wPoO8UZLgSdLN0VUO?=
 =?us-ascii?Q?FRElV08W2VQwZhN7aH3fBOP/Xc/aVjT0wCW3C8QdZJHyUyyG98YYobxznlub?=
 =?us-ascii?Q?VjhMMcC4j7kV5DX5C6WSV0v7NLHu7FfEYu72Rysic0wI+yuO8YpyA2YxrV4Z?=
 =?us-ascii?Q?DB8coQRl5v0h3/7PAN58EF8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a463ea3-65c7-4c93-c66e-08d9ef6ecd32
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 04:02:21.7108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeteLQiBQ1Bf8utTA+QX8Nm8jSmwSiwzEYzDKTeeI6B+ZB4gnjFhG5WLjh3Uqljl5Hn0SrI1fqZSSuT7yz9Mpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5395
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding Billy.

Hi Tung,

> -----Original Message-----
> From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
> Sent: Monday, February 14, 2022 11:46 AM
> To: Troy Lee <troy_lee@aspeedtech.com>; openbmc@lists.ozlabs.org
> Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS
> <thang@os.amperecomputing.com>; Phong Vo OS
> <phong@os.amperecomputing.com>
> Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue
>=20
> Hi Troy,
> Thank you for the information, i have merged the dbus-sensor patch and se=
e
> it creates the Fan sensors well.
> One more issue i have observed about the fan tach report like this:
>=20
> root@mtmitchell:~# echo 120 > /sys/class/hwmon/hwmon1/pwm1
> root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
> 418526
> root@mtmitchell:~# echo 100 > /sys/class/hwmon/hwmon1/pwm1
> root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
> 195312
> root@mtmitchell:~# echo 255 > /sys/class/hwmon/hwmon1/pwm1
> root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
> 0
> root@mtmitchell:~# echo 50 > /sys/class/hwmon/hwmon1/pwm1
> root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
> 0
>=20
> It means the fan speed is reported incorrectly somehow, but i can see the
> fan speed changes by eyes, do you have idea on this issue ?

Does the aspeed,pulse-pr property of fan node set correspondingly?
What is the expected RPM of you fan? 418526 RPM?

Thanks,
Troy Lee

>=20
> ________________________________________
> From: Troy Lee <troy_lee@aspeedtech.com>
> Sent: Friday, February 11, 2022 12:13 PM
> To: Tung Nguyen OS; openbmc@lists.ozlabs.org
> Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
> Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue
>=20
> Hi Tung,
>=20
> > -----Original Message-----
> > From: openbmc <openbmc-
> > bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> On Behalf Of Tung
> > Nguyen OS
> > Sent: Wednesday, February 9, 2022 10:40 PM
> > To: openbmc@lists.ozlabs.org
> > Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS
> > <thang@os.amperecomputing.com>; Phong Vo OS
> > <phong@os.amperecomputing.com>
> > Subject: [AST2600] PWM/TACH driver and dbus-sensor issue
> >
> > Dear community,
> > We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's
> > repository https://github.com/AspeedTech-BMC/linux/tree/aspeed-
> master-
> > v5.4/drivers/hwmon to support Ampere Computing's systems. Verify with
> > AST2600 EVB, i can see the driver works. However there is a concern lik=
e:
> > 1. The change of hwmon fan pwm/tach in sysfs (as below), this is
> > different from the ast2500 as the separated of the fan*_input and pwm1
> > in various hwmon directories. At this time, the driver doesn't exist
> > in the OpenBMC linux at https://github.com/openbmc/linux. Is OpenBMC
> > going to merge and keep this driver ?
>=20
> Please have a look on this patch.
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253
>=20
> Thanks,
> Troy Lee
>=20
> > root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon hwmon0/ hwmon1/
> > hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/
> hwmon9/
> > root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/
> > drwxr-xr-x    3 root     root             0 Jan  1  1970 .
> > drwxr-xr-x    3 root     root             0 Jan  1  1970 ..
> > lrwxrwxrwx    1 root     root             0 Feb  9 08:38 device -
> > > ../../../1e610000.pwm_tach:tach
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan10_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan11_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan12_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan13_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan14_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan15_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan16_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan1_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan2_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan3_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan4_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan5_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan6_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan7_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan8_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 fan9_input
> > -r--r--r--    1 root     root          4096 Feb  9 08:38 name
> > lrwxrwxrwx    1 root     root             0 Feb  9 08:38 of_node -
> > > ../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e
> > > 610
> > 000/tach
> > drwxr-xr-x    2 root     root             0 Feb  9 08:38 power
> > lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -
> > > ../../../../../../../../class/hwmon
> > -rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
> > root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon*/pwm*
> > -rw-r--r--    1 root     root          4096 Feb  9 09:13
> > /sys/class/hwmon/hwmon1/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 09:20
> > /sys/class/hwmon/hwmon2/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon3/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon4/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon5/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon6/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon7/pwm1
> > -rw-r--r--    1 root     root          4096 Feb  9 08:38
> > /sys/class/hwmon/hwmon8/pwm1
> >
> > 2. With above changes, the dbus-sensor for FAN/PWM shall not work
> > because of the compatibility. So if OpenBMC want to keep above
> > PWM/TACH driver, does any sides have the plan to support the fan
> > sensor, if not, we can join and do it.
> >
> > Thank you and best regards,
> > Tung
