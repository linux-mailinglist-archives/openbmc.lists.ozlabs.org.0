Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3174B7FDE
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 06:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz5Tc2rXXz3cBW
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 16:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iZ0FUH+G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::726;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=iZ0FUH+G; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JycKl6qq7z2xMQ
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 21:10:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT4Q2XjheDAXVtgEaCvvjK4L1y16+MjrRrGY+bgatBMpwc2i4DDz6TQ+v5eN30F5fc1yLk85f0J9zQex5F/FHAXuKgauv+hBKb1GDu/2h9u4ysDhUSiPsACjBteC7jYqxrqHENRLQ0wc0KhtTIDnkSexy75cgz55519LaEXsgtiD6PDywc0aI3HF6GYAm7BQm6lGq6cZ2aQziLjHH24qEzl2nrDkoQ/LD+cOJ4Su5ogzlTZW002duFdWTNm/T5vNWuOu8H9vVBrZ8c9+lWR+V0VV+ozqJ283mENnjOF1LinOPeK4M8wuqaVCFdVQQRc20xJr1AYWAd6PYdmVd/qOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RES4rYKaxHQinaVxhYbst8Ru/CiRAOfZ/gFDAekrubM=;
 b=TxUuUXDhVrURzhxtq8CVOIZdRtxrUfTYqMMwkQ9n/j1h8ogEKg5LNpz/gw0vUDnalFAvdd3wsP5NHEMqGq7BoIsDtes38wFSeNXVIZssFyrCYXLXIRiyEotxaD5ZyQxDyiAfBI9K9KNK4OVRb4+axVKZPr4UrF7lakYkIvIiRad3pnyDzqEnNgec2jojIgUZLlj/5VIFD7B3m/1Ir1Vw2IVTcedIF8bH16El7PrIEcXh88O4YJMTiMmeLU+O7YVm3oLfEOA3twJ/rzCKTjZMYyhCu35FcL8ZbZw/1iq9G/8OPbTHE6kX/BL2NdnMnJp1Kiur2GNP9Ou8KSmWY9j5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RES4rYKaxHQinaVxhYbst8Ru/CiRAOfZ/gFDAekrubM=;
 b=iZ0FUH+GrJdEZhER8t5n14+i1qiWynT+Kf7chJtqZ2TRAFca0xDG9oixQJOXy+17WvWP8qzsbIVAoUxpzJntUyLH+zYc7E6XwlP6xgqm+WhE5wyrIpve+Iam2S8T5o1VrA/lhTX80nK6cdaIw17c7CnFS1NfvOH2tZ51y1ejzog=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 DM6PR01MB5356.prod.exchangelabs.com (2603:10b6:5:17f::21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.18; Tue, 15 Feb 2022 10:10:10 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 10:10:10 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Troy Lee
 <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKqAAAIO4IAAB0KpgACtO4CAAUemHg==
Date: Tue, 15 Feb 2022 10:10:10 +0000
Message-ID: <CO1PR01MB675963DCF2D3A0505CE2780AFF349@CO1PR01MB6759.prod.exchangelabs.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759010F944EAF2DF12EAA39FF339@CO1PR01MB6759.prod.exchangelabs.com>
 <5BF20D73-BEBB-4C25-AFE8-63DF434CFBC4@aspeedtech.com>
In-Reply-To: <5BF20D73-BEBB-4C25-AFE8-63DF434CFBC4@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: bd94b15d-f442-591d-ea94-6fbc0ec1058d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aac837e-1827-4f74-c159-08d9f06b598d
x-ms-traffictypediagnostic: DM6PR01MB5356:EE_
x-microsoft-antispam-prvs: <DM6PR01MB5356CB2F12511E7134FBDF6BFF349@DM6PR01MB5356.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7X+PnYtmaEybNb7ziFCrkC88Oz31nO8B8vEFnLxk3GSddv6RsR7PeioJoWfqjHiGE4+RatcTaWUsFxQS5RvyegUb2309xRA6nbfaGjzvCFFR318RPuq6VF6f7nzoB+n6aCI1ekZHgu2qsdwotEIBJGmpXzIyMI+gpb2Lsp5/YvNpgrUKZVmAE0PHXv30sx4xPwlNqtZbisdl9wxAW4zgNyviKz1y0kXsuacgfBt2hIQzwZwJYrwnEGU3YSWCQvqmRRj+lvmwSRmCO7x43Zo0eD0hxPtx6F9F8WkqUAEcPqIONhf53A6GjheQmCpH1D8Dhppq8ownwN+aKLBjKvYUklU9kVIVxz1gCyd6MU1xDeaco+C0C94uNmqljmBJqCrLh+wk1rPehzD1AI/bFRCzUOPemthz9/hYMYndBiYrCwO+rYvIuvmNYLCEPn/6crW2zu+/6M0tkJv+DyogCRjqKX2dT9vvlHCsj0xXJmi3b/hAxoaciJMCsW2E5hUXLyGnLR22HVTNJJiHJv3hbWGNNVZvnr1YTPKuMmZeI56etMWwEkNrFQxWzoq3vV3pT/8cWDMcXsbXlkinELzLEld77IyqAGSGGPGAR+AcFgTxsbE2xOOV4/bUensnrjLoG9jCzNeGq1vtKT8TR5v4BiGtR7TqY2TFQa/ZhlGV/qGs7XAvDv8JdgKpH9gl4LW52hsgQgrcHhNFKuOdcZyMlefhAtMcZoQB98YUovNuR5AHGXHL3vu8wOsMQbsCrzuAQC2N8LcoWb0CbYnQOB5rUIrao1f+GoAOi0/wA7dqyEC+x/xmCOHAbnjCgUTd/vTdav3a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(76116006)(107886003)(966005)(316002)(53546011)(508600001)(71200400001)(110136005)(8676002)(4326008)(38070700005)(7696005)(6506007)(9686003)(66556008)(186003)(66446008)(4743002)(66946007)(66476007)(26005)(64756008)(83380400001)(55016003)(91956017)(38100700002)(86362001)(52536014)(5660300002)(8936002)(2906002)(122000001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jxo4g6GfFA5vxazYJSf07+8ix+F6WGEMkYqLN4CMOWFVQN8wsyEFQ9I7X2gg?=
 =?us-ascii?Q?cmb4T5ufDlHiFNm0q70W08f5mAp2TFrmu54uJ9ACMAcNYucnI+zHjp2qzgCJ?=
 =?us-ascii?Q?r1klDAs4rI8BL/z7+pBVrSJUFgm+b6DBcesjc3EgIyMnWFdtHCscl38cPVsx?=
 =?us-ascii?Q?vzfk9s/yI51iQTfeRrSTTyKQZ2pQnHEW9vfdDWAKEUyN/zHy/EQIngO30R6m?=
 =?us-ascii?Q?7/F/PXGnJDNhKQ3isw1JUSGWGch2qrRDvvuU3ad1/3DrEeGg9WHLXeowQi3S?=
 =?us-ascii?Q?/XqKcSM64yA112XScCKGwetvv9VVLRmbOLZ0XVuwncesFhGCTnnVAUs4LvFD?=
 =?us-ascii?Q?WkdHaIpuSzvp6uLkm9k7sZ0Y3WgefSQSWtaVYKUmO0Y7PzL0BtujGrFDrAOd?=
 =?us-ascii?Q?bB5nrS9vDEFJcf1rVJe+1+aCtliccs5ZdUjpRJA6Nm9yWyIVXw6tTH5SOHM/?=
 =?us-ascii?Q?rC4GLHZOz9lbilSR03ZVvFEgzgA+pDs7ZefdhnuOrbnC/oWh0vuiI8lHzwDD?=
 =?us-ascii?Q?yJglXJ7Nz2wXzPIEddRG1A3sy82thwOvJjJHxDf/8bQJ+QrdwGCWMK5Bc2qY?=
 =?us-ascii?Q?6Gg7M8HjObMEufysBiDZW+xJ/dGSRdz3/XxXi6gia28Mwp8EVi+3OH3xftl7?=
 =?us-ascii?Q?OZmjpN0rFBplpT/s+Rr5RMuntnLXeIjIbywAzywGvZmNIeai08qA1SC/KqyF?=
 =?us-ascii?Q?ErPDDLJNwZa7IHkt+eXiyadwTg5TV8O+lPIMTiOxxL2qS+Tjimks3BG2Z66/?=
 =?us-ascii?Q?W682XWqWWF+afGT0OXMiAvbJODtV3FwLWsJ8fnj72jXZEWjtlaSdMG3yVDq7?=
 =?us-ascii?Q?MB+reYZYtbxXW/CSdZfdaM/peumYeIPT7oi3dGXleXipI2cSvKmD552GmJ14?=
 =?us-ascii?Q?bSXPxHXzYRFyMZxe/4TNGHscjm7+wfi65MoO5X8BRrEAHIdU7tRWqBc3jHDy?=
 =?us-ascii?Q?8rWJGHsKMI3mARGGNBFXf+zIAFHgHqu5H3MGT8e9ubGNCpJ62R2W2BmiFczZ?=
 =?us-ascii?Q?yy0a43ezTvDYE7/Wev1B6ZBlELudHKMFjBesfBZOFmUVohSkkBAROcVxYCvO?=
 =?us-ascii?Q?X1d2MgyTxnw7JIeyv/MwvMqlR3A6kgXRRFnarVN+UihDYYubVB9LgFImqBrz?=
 =?us-ascii?Q?pPoDJK7dZCF0/WRTR7eF3qIxdv5AdvE7FunJv70ncUhWXyJlvIQVT+A8Fez5?=
 =?us-ascii?Q?MHjzO21ZSJbgS3l3Uf32fVoVtWhgqscURmMOq2ghiuy6QQd7pRM7UlWMbDbr?=
 =?us-ascii?Q?og1ZNqJlqnhagcX9mrIrLKt4mXx9E2opqGKSBWerNJBM1bOBsKb74AKf7RB2?=
 =?us-ascii?Q?s6LCOHNh/31vFKXwz8We/H5Y3S12WBs/JBJwudM96jDWcPXnEbsyCYwBrHmh?=
 =?us-ascii?Q?SkVw0FegfClNvpaiPl6RE4ZnVa4NQQXKL7vEq2YIkmDO9HdyIOuEpfc411ZZ?=
 =?us-ascii?Q?5J3ZmHIMkudj5jhnihwbz7DWISvcqi3MDnbG+iwLrTgfhpn6rZVwa46ucxnR?=
 =?us-ascii?Q?yVMU93IQ9Y6d2aSDwqR86vyxlNJtrEDpU7BloKSja4uB1ZcHpNn7vJpjaB45?=
 =?us-ascii?Q?VyNt6qb3XhAh7l09llXiNLpFtlYS+c55Dh7CbBjRMDDzUfIeNn00g9B2knBE?=
 =?us-ascii?Q?G8yoUrKZ8gZX7X8I0S3R+7db7JcoZAL5D03plzVrsNvE6sKU6V78XUgKvD7o?=
 =?us-ascii?Q?YHQ2MROGPbdZ6XgAbRATyny2Gm/GP6tWdyEM5b3wbuluDbI9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aac837e-1827-4f74-c159-08d9f06b598d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 10:10:10.1140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlHCBLKgramUHvSmR2d3nGpxOKGyKqtGT2GRNC9TQAOjqv3G0XXEqyRGzTB5ormka97BKhq7/NqHthtoOrBsePwjcxbpah+vl9UGoVZEg/LQkLqiuRJtwaqpj0UEzADh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5356
X-Mailman-Approved-At: Wed, 16 Feb 2022 16:03:41 +1100
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Billy,

Please help check:
root@sunmoonlake:/tmp# ./test.sh 100
echo 100 > /sys/class/hwmon/hwmon1/pwm1
cat /sys/class/hwmon/hwmon0/fan1_input
0
devmem 0x1e610000
0x0001101E
devmem 0x1e610004
0xFF006500
devmem 0x1e610008
0x10500000
devmem 0x1e61000c
0xA5400000
root@sunmoonlake:/tmp# ./test.sh 120
echo 120 > /sys/class/hwmon/hwmon1/pwm1
cat /sys/class/hwmon/hwmon0/fan1_input
266335
devmem 0x1e610000
0x0001101E
devmem 0x1e610004
0xFF007900
devmem 0x1e610008
0x10500000
devmem 0x1e61000c
0xF4B00016
root@sunmoonlake:/tmp# ./test.sh 140
echo 140 > /sys/class/hwmon/hwmon1/pwm1
cat /sys/class/hwmon/hwmon0/fan1_input
837053
devmem 0x1e610000
0x0001101E
devmem 0x1e610004
0xFF008D00
devmem 0x1e610008
0x10500000
devmem 0x1e61000c
0xE4B00007
root@sunmoonlake:/tmp# ./test.sh 255
echo 255 > /sys/class/hwmon/hwmon1/pwm1
cat /sys/class/hwmon/hwmon0/fan1_input
0
devmem 0x1e610000
0x0001101E
devmem 0x1e610004
0xFF000000
devmem 0x1e610008
0x10500000
devmem 0x1e61000c
0xB5C00000
root@sunmoonlake:/tmp#

Please note that i'm using the fan settings as:

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


________________________________________
From: Billy Tsai <billy_tsai@aspeedtech.com>
Sent: Monday, February 14, 2022 1:34 PM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

Can you check the PWM frequency and dump the register value 0x1e610000~0x1e=
61000c?

Thanks

Best Regards,
Billy Tsai

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
Date: Monday, February 14, 2022 at 12:24 PM
To: Troy Lee <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org" <openbmc=
@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>, Thang Nguyen OS <thang@os.a=
mperecomputing.com>, Phong Vo OS <phong@os.amperecomputing.com>, Billy Tsai=
 <billy_tsai@aspeedtech.com>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

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
From: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>
Sent: Monday, February 14, 2022 11:02 AM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS; Billy Tsai
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Adding Billy.

Hi Tung,

-----Original Message-----
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com>>
Sent: Monday, February 14, 2022 11:46 AM
To: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>; ope=
nbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com>>; Thang Nguyen OS
<thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>; Phong =
Vo OS
<phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Troy,
Thank you for the information, i have merged the dbus-sensor patch and see
it creates the Fan sensors well.
One more issue i have observed about the fan tach report like this:

root@mtmitchell:~# echo 120 > /sys/class/hwmon/hwmon1/pwm1
root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
418526
root@mtmitchell:~# echo 100 > /sys/class/hwmon/hwmon1/pwm1
root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
195312
root@mtmitchell:~# echo 255 > /sys/class/hwmon/hwmon1/pwm1
root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
0
root@mtmitchell:~# echo 50 > /sys/class/hwmon/hwmon1/pwm1
root@mtmitchell:~# cat /sys/class/hwmon/hwmon0/fan1_input
0

It means the fan speed is reported incorrectly somehow, but i can see the
fan speed changes by eyes, do you have idea on this issue ?

Does the aspeed,pulse-pr property of fan node set correspondingly?
What is the expected RPM of you fan? 418526 RPM?

Thanks,
Troy Lee


________________________________________
From: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>
Sent: Friday, February 11, 2022 12:13 PM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org<mailto:aspeedtech.com@=
lists.ozlabs.org>> On Behalf Of Tung
> Nguyen OS
> Sent: Wednesday, February 9, 2022 10:40 PM
> To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
> Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputi=
ng.com>>; Thang Nguyen OS
> <thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>; Phon=
g Vo OS
> <phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>
> Subject: [AST2600] PWM/TACH driver and dbus-sensor issue
>
> Dear community,
> We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's
> repository https://github.com/AspeedTech-BMC/linux/tree/aspeed-
master-
> v5.4/drivers/hwmon to support Ampere Computing's systems. Verify with
> AST2600 EVB, i can see the driver works. However there is a concern like:
> 1. The change of hwmon fan pwm/tach in sysfs (as below), this is
> different from the ast2500 as the separated of the fan*_input and pwm1
> in various hwmon directories. At this time, the driver doesn't exist
> in the OpenBMC linux at https://github.com/openbmc/linux. Is OpenBMC
> going to merge and keep this driver ?

Please have a look on this patch.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253

Thanks,
Troy Lee

> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon hwmon0/ hwmon1/
> hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/
hwmon9/
> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/
> drwxr-xr-x    3 root     root             0 Jan  1  1970 .
> drwxr-xr-x    3 root     root             0 Jan  1  1970 ..
> lrwxrwxrwx    1 root     root             0 Feb  9 08:38 device -
> > ../../../1e610000.pwm_tach:tach
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan10_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan11_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan12_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan13_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan14_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan15_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan16_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan1_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan2_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan3_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan4_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan5_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan6_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan7_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan8_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 fan9_input
> -r--r--r--    1 root     root          4096 Feb  9 08:38 name
> lrwxrwxrwx    1 root     root             0 Feb  9 08:38 of_node -
> > ../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e
> > 610
> 000/tach
> drwxr-xr-x    2 root     root             0 Feb  9 08:38 power
> lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -
> > ../../../../../../../../class/hwmon
> -rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon*/pwm*
> -rw-r--r--    1 root     root          4096 Feb  9 09:13
> /sys/class/hwmon/hwmon1/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 09:20
> /sys/class/hwmon/hwmon2/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon3/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon4/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon5/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon6/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon7/pwm1
> -rw-r--r--    1 root     root          4096 Feb  9 08:38
> /sys/class/hwmon/hwmon8/pwm1
>
> 2. With above changes, the dbus-sensor for FAN/PWM shall not work
> because of the compatibility. So if OpenBMC want to keep above
> PWM/TACH driver, does any sides have the plan to support the fan
> sensor, if not, we can join and do it.
>
> Thank you and best regards,
> Tung

