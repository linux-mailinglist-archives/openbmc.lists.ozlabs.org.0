Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C54B6229
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 05:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySw308Bjz3c79
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 15:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=QoD8JGQu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::71b;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=QoD8JGQu; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::71b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrj56BqCz2xsr
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:24:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYNUPUABkBKaSN0dvFBJti48KSRlAOX5X52hNqevdN0lATu4v+JU1NtkIWQD8jKmxQfo9j6HqyzvSxrtUYH95khwOl5rwZKb2RPfldy59PSm1xm1CzZro0bLYC3LTfA5jjBv3qvX0hWJ7IUxsFk7HEFEtuNB1siOQj8MC7AeJDPavXEkkPjsYOr8VADXgBElgKwvnUXk/+An8sNFPb9nEWfLy7+gUlQEILhwgcArR+OJ95s7gjgQg8840iXzep0jjb/6LgDAWp40OqB/U1BnOyq48F4dcuiS3cJaL1yz+N0Xj+yS3TM3mkoG+PkbjOfl0zYVIl8vPSo62rk/5tEHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nx4Y3JLueu/Y+dYQWu7q7lRCEN0Yjtx6vB+ILlHV+fE=;
 b=gJHpGTkQvOjeBzNKwwl3lEWlWaOdxfkKpybCLulLPjqQJ1x0SAFtL3WD38Ss+KuWBdoNsIaPynwy2qOMjZp4AxycPLSyW3wrmUW7MY6jiFSeDDmbF5zw40/3tMpMbMpvlnzgztHAfy0rvfZeD0RjtzLtSmM390USMJZMDL3SwFLhvsnhA8KoXKntdBTPO81L89vAouZkz3RplapE4Y6CpLaARNS48RMdIofM6saBq9k/8EIBwLcPzGLR9LSMkMY+c7g1O4xO8wPGRQggDjGr7jNnrWBhmniBnhmBZoExtC2Ry6lGCDL97MGd2bRWkHLVz8cQsLtp0jnd1OJZ+Glshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nx4Y3JLueu/Y+dYQWu7q7lRCEN0Yjtx6vB+ILlHV+fE=;
 b=QoD8JGQu2RB/L+uGcuN4SHKIX37arPCgAzqmLWaV0XGVOGhJvi/RbGgwI93EBZ9YjXRRYSm9r6LNuXyAqYklFzTm3QmVIBrGBh3QVRJV5CyfvtweeoRo6YQB9KLfamF6+5lxS77WV6/LM01YD30ZgA7zqqFfKV2z1qp0YKejbJw=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 BN3PR01MB2050.prod.exchangelabs.com (2a01:111:e400:7bb7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Mon, 14 Feb 2022 04:24:17 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:24:17 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Troy Lee <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKqAAAIO4IAAB0Kp
Date: Mon, 14 Feb 2022 04:24:17 +0000
Message-ID: <CO1PR01MB6759010F944EAF2DF12EAA39FF339@CO1PR01MB6759.prod.exchangelabs.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: abef98c3-202a-5086-6625-8eb51edca4ee
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01d0997b-962b-4ac0-6868-08d9ef71dd8e
x-ms-traffictypediagnostic: BN3PR01MB2050:EE_
x-microsoft-antispam-prvs: <BN3PR01MB20508813CB1A92A4137DE048FF339@BN3PR01MB2050.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xb8C2rg1mMnDQ+sbrGaJ8doGegxCH/0mnUuG8ApLDrJt4DaEpx8VaP2ljr0kAJ2TSCTyyMKe39+lXVrXMR94iQzIq2dH/AkenVyI4z/T1fqXKreXyCevlwhxm1i9YI2Dt+i4ax7hAIzZgumwhdBRuE0kU5Df0RxtcpstgN/7Lgfu+ssDcG5TG4bhKGpz6SmQrSMxxoWbRm59kqSk/DdLZwvJtAZ+d4r6wS9MpHtyuMh6hKN01viI+B1zrDQRuqsAJEFTGE/Mt9VX9tYesglRB/jA++/rg9xO/io4IVSXTgEu9HBe3uC9TFgk32+VjFxDXq6D1m1GiUxqYgW/kqqaJv5yV3wY/8zZwAhphLyBcnnq4vW3mgKqZL7vdN+Fksdea8aCAxrFKhe/cppgUgYfUbVkiUSQQYaxFL5IoWOOGen65a1FWizs3tyDE0odvhoNjdrEn3fM5EZy4wxKPtQLO9VeudARIjUQQW8OuOI7dvysJ24dIAMrHzoAYTdsf79+U9UjOlhvek8Z5BzkZO3OqnEE+mIn1GkiswfdGoyXogTokofTwmgcTkYbruO2ToWy+6L2CZZU8XLhO5snUur5vPOXqKH/JFjAEtZMZYoxUJ1d844NWPJtOoPzl2vIUN7Nim2jo4R1lTP3Rr3e2Vb9tTVxn6R+bKtyvhtur4wkMGc46Hv2md9vihBVGc4Vbw0fSIZAPJnyme4wf1ae4uyqhHEWtKOoLIie7I8nKMcZ54YU+Te1tDs/kVHHNui6t1pK47QngXLE7W1nWANMxuq+ieURgsdZjkdZ8YHS1KCwoy7IBfooljDSld8epnXtpIjK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(4326008)(6506007)(4743002)(91956017)(76116006)(71200400001)(7696005)(64756008)(316002)(53546011)(66446008)(26005)(186003)(122000001)(38100700002)(38070700005)(55016003)(33656002)(9686003)(66476007)(66556008)(66946007)(86362001)(83380400001)(54906003)(110136005)(508600001)(966005)(2906002)(52536014)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OowgL8kLmgn8tu2KfEYfa5hbOhnIveC25h9eomd0aebXCTD75K4KNjKLa0Up?=
 =?us-ascii?Q?hqLm4SVjtmDOUmuLfPcwcxfJP5zDMOAxvlMgJ9V1GLGzZz3GazgKuKMrjqYv?=
 =?us-ascii?Q?aEKu6KRmgO/bEArBj9RGtkLu2fp1OFRTTRlvmnslk2f8PXVpGNOYimaV1GTp?=
 =?us-ascii?Q?hF4Cb2k/qAOFiBbP0PTfL2E1qY/Gb2/pgmDLTCt2WnFNqHUnh0wOSLCAOdox?=
 =?us-ascii?Q?oMF/OGGjJyTBnhXDBfrXePrvp3JFDUtoYEChDRex2CkEsTdn1E6SQupvc0YW?=
 =?us-ascii?Q?cfAB+jnCrNH+X8Gf7jrOqiUhhMn9JGJLcRV0+5XLWSaYTdKhOGBivR1+OOXs?=
 =?us-ascii?Q?Gtc7pU5oD2e+ZykCnO0lHhRCzuLhuMLq8eJmGvVF6Ij5cloNr1Kefzy3lW9s?=
 =?us-ascii?Q?HmZAYbfQ2SRpWOIdV0UyR56DAxYS5aggyLzFqr/f3jXBi1NsiKt0q+xv7knD?=
 =?us-ascii?Q?ygdHObW5+ZJ5LkJwekbKt/u13iKgS6Jue4Hgyf+2NXAxNjzMhC3KH7+RaDoA?=
 =?us-ascii?Q?IuLfvF8TipQdmuKiDzB6PxLtZ+qiwBgA70wcAWRwYBZzCGF8Z4GYP5An8jov?=
 =?us-ascii?Q?6WOWf55ToQLBGudpaNoWr8eolLRAbc5sQQWHncKEiLLXo8jmJtM5jnRWyIR5?=
 =?us-ascii?Q?biOvQsfgS4saN0lF7aohAdCtQz9audDyobcsZU+w1FmmrKthnvVMx/sAbSPO?=
 =?us-ascii?Q?aXlXGxU4B2cgshapU2Ze5xBPRQ5JpJyzAkQGZ8vPkxMgNUQrT+qSla/yGk21?=
 =?us-ascii?Q?c5vI7GVb4A+obV/1nDCOqfUg/uUMSSCazRY9nD3Vo57kxqoscsoZ7c0WCbeb?=
 =?us-ascii?Q?mZXP8AHLVJh1891Jobs6Fl5onqQ0bZTUJDI4xaHf4Kh187AcIq9epsOpET3E?=
 =?us-ascii?Q?gcBo3CR7ciS2Qrkz9dt57RmY/HAXkvY91FSZNDY1dI9WiNS+s6pLwXQCrpf0?=
 =?us-ascii?Q?XdOCgOERRbeF2Id6UKN1yUhq4FV7Tq0NaoM5xGPn46SGEzsyOjAn1jUtEsS+?=
 =?us-ascii?Q?xZFC++E4SkkXuxTdoSjQ6yfjqbF8G+MRbSvYvcxQgb8f9klOZlCZh5/poOWH?=
 =?us-ascii?Q?QhVR3dIoF9oKqVpaxSZFNZ5Km6Xk30gk9QaIKA+FSz/NCzDVTSvLwDSARqXG?=
 =?us-ascii?Q?cz8jVFxLKya0Kt3ZF3e/zf8kcRgRokjK4qw7MGN9YxR9xsXAw4q2A5qR83H7?=
 =?us-ascii?Q?dLOXe0B/knSsRZ/IzbX9Y9li+j1RLrvW+8JhaV5Paez/IxNaKnvDwlKAvTOq?=
 =?us-ascii?Q?Jo6sK3Fy2V4PUoevFwdCCt1tMVeIQ23MJFxbNHwuo0FeG6Ba131P3JEH6nLa?=
 =?us-ascii?Q?w5eYew95tU8d6nsC/NnVIvXxXIeu67a2nR+qhVzS3EtbOYLbX2WIuh4M8rKT?=
 =?us-ascii?Q?5xbbeuitUIa4wOm+p/53HHNr0sXI7qJ8f5m3N0OrDzG+37AmhwKScsoX+TCF?=
 =?us-ascii?Q?PFh22pomV/bgv17LEaIOPCqda0rM1xbim//JEmmjJbCAtdQUfz74RLuRYBaP?=
 =?us-ascii?Q?bZMz1levhqFhNov2094gpVYGqTnpYLQAQR0akOcBLcbDGtPDtPwXPw84r8bb?=
 =?us-ascii?Q?LnOpBIUOHXr1tVNKs6TiwJ8lVAA6cslA56s5zR//AWoHRmUnXL5jP3HAJ8lE?=
 =?us-ascii?Q?Hr3bakbwrZ7zI/MlY6wSO9rlDeBGr6sp10Rj08SQ6lDyO0kyY5mLeSRi0s65?=
 =?us-ascii?Q?LkljPlyzOGup+ltMnz1NiP44Z0Z7sAyGzp1V02YDT/FUFtX9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d0997b-962b-4ac0-6868-08d9ef71dd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 04:24:17.5670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2K4xTKXJs7dT+/xNKEQbzQfIEjqZQxbkV3LarhXDdOee0V7vDXYnxwyMSfKEomzleDCl0U/pNmSMpYx87stGiGavFT3U7Kqyea5/3PKr8AAJTdwDvrqPuzxvj2iJU+xy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB2050
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:02 +1100
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

Hi Troy,
the fan settings in device tree are similar to aspeed-ast2600a1-evb.dts, li=
ke:

        fan0: pwm-fan0 {
                compatible =3D "pwm-fan";
                pwms =3D <&pwm 0 40000 0>;        /* Target freq:25 kHz */
                cooling-min-state =3D <0>;
                cooling-max-state =3D <3>;
                #cooling-cells =3D <2>;
                cooling-levels =3D <0 25 128 255>;
        };
 .....
        fan@0 {
                reg =3D <0x00>;
                aspeed,pulse-pr =3D <2>;
        };

I test with co-fan F-5010HH12B and San Ace 92 with above setting, and the r=
esult looks like in-correct as in previous email.

________________________________________
From: Troy Lee <troy_lee@aspeedtech.com>
Sent: Monday, February 14, 2022 11:02 AM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS; Billy Tsai
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

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
>
> Hi Troy,
> Thank you for the information, i have merged the dbus-sensor patch and se=
e
> it creates the Fan sensors well.
> One more issue i have observed about the fan tach report like this:
>
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
>
> It means the fan speed is reported incorrectly somehow, but i can see the
> fan speed changes by eyes, do you have idea on this issue ?

Does the aspeed,pulse-pr property of fan node set correspondingly?
What is the expected RPM of you fan? 418526 RPM?

Thanks,
Troy Lee

>
> ________________________________________
> From: Troy Lee <troy_lee@aspeedtech.com>
> Sent: Friday, February 11, 2022 12:13 PM
> To: Tung Nguyen OS; openbmc@lists.ozlabs.org
> Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
> Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue
>
> Hi Tung,
>
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
>
> Please have a look on this patch.
> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253
>
> Thanks,
> Troy Lee
>
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
