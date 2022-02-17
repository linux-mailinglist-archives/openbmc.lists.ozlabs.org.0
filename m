Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D74BAFC0
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 03:37:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0G7K4ycLz3cRn
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 13:37:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HGxd45PM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::719;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HGxd45PM; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzrpJ5x03z3bc6
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 21:36:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmetpHOjwpMA/LMWcbLqiuNRzt5M7Zn3L2+/zAaXVHKPgpORbh8gA8s2ULBTYmhaQ8EZDFpOErQ4pmreUNgW4X2h6mgi9i3ObMl1SMq5P1a6P2CES+VboJTLHm1Vhxc7lIAV7CW1Surrn6DJvZEwkgKPne8H4Nsv7WV2DkLcQOyymOfwLX0/QSvLCUS4bGqcHN88Q6Z+ZufyWDIp9f853pT1LG2/e8gyUwqD5JUml7txs9SOSOYoltPMGevmdXCIjabUoiTXaw0Iw8uRSX+nqBk+xDU7Hvvn7EFY929L69MgZtOf3tDIQYmoOJWEpDG3aK73EEkQFKV5CxxmbkSchw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkdm5uzD3YbChlxFp0BcwNisdnkkmRYF9h/Fr6Us/Do=;
 b=TrzjIECTuKUbsmhtKJ+OHrqA4NKNVD0es0DKdvzfqmbRGDfGBjCkySoL+C9gSYFL1dU731p5lyc+5EVBYVwLgaXGBzYUFKLiyfNfEx6hBPSqBdJqbLGlfGoPz4EiJ2LLptxnAwJ9bAlu62px591u9NXlgwCtNVVScUOOw4RvhZUBEGO0Y5KqfQZ6rzxMpb2G4ep2sVdVWNqjTwjB2wIFjMXd/RTazdn1vDnMYPjV49Pw26ljuZpdrQFIkCGU3Mgk0HId5N8Be42FlwkpvsUNB9Xl6bKOGSOrwjd/dgZigd6PZ1KoJaILzB5q+DRCjl0DsdXUx9ExcjOIKdGnSIegNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkdm5uzD3YbChlxFp0BcwNisdnkkmRYF9h/Fr6Us/Do=;
 b=HGxd45PMs074o4GiIwIvfZN075pH4wAWaRuIllgg6F6PPo9twZxiK0g71tDzXv009J6dbwDx8DynX99+wx0+v8G4A14nNC+WjajYKrnKM7PujCxx/R0yVOEX8EOJ2meP22jj+SaPawcJLZi/DiOPYeQ3x5Ui9nONKtp9D98NksA=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 BN7PR01MB3972.prod.exchangelabs.com (2603:10b6:406:87::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.14; Thu, 17 Feb 2022 10:35:44 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 10:35:44 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Troy Lee
 <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKqAAAIO4IAAB0KpgACtO4CAAUemHoAAjXqAgADP/BmAAdV3AP//+JQL
Date: Thu, 17 Feb 2022 10:35:44 +0000
Message-ID: <CO1PR01MB6759F88E3ABEB3E6B816EFC3FF369@CO1PR01MB6759.prod.exchangelabs.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759010F944EAF2DF12EAA39FF339@CO1PR01MB6759.prod.exchangelabs.com>
 <5BF20D73-BEBB-4C25-AFE8-63DF434CFBC4@aspeedtech.com>
 <CO1PR01MB675963DCF2D3A0505CE2780AFF349@CO1PR01MB6759.prod.exchangelabs.com>
 <D9562E34-D61F-4F51-B4EF-7F4F83F27367@aspeedtech.com>
 <CO1PR01MB6759567EAB2EE2D6FC02CF6EFF359@CO1PR01MB6759.prod.exchangelabs.com>
 <4903B31A-A11F-4A4E-8C64-CBAEA0975600@aspeedtech.com>
In-Reply-To: <4903B31A-A11F-4A4E-8C64-CBAEA0975600@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f18fd493-e4a3-63cf-ab74-017e25e36170
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e0fc2a8-f6b2-4516-0442-08d9f20140c8
x-ms-traffictypediagnostic: BN7PR01MB3972:EE_
x-microsoft-antispam-prvs: <BN7PR01MB3972D1DFE8D735A981BD1A71FF369@BN7PR01MB3972.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NxKVQPocKaXYOYSGxcK+YJj2/lIZyO9vNt2rGDjF0W54S8QvxiFS5Waz+i7CXK391JlFhvzN0mwubT8Y5l/M0bzh93pvKLwaHklZ2ynMkpP5PjlCuuNXtuYI51PBmQQXbB7O+YZ6iQeXjbmWjmbRBT18ozOhfxqOgzGZajBRz5p4ZvMZJLrqTNB7zQVVE1wILON0KFQjxUEE8uP8Z0q9YO+p2kI7o7NVXDJEEk9ovhjEZ9Eibfgkl/lLoQUYfu+/JfdKBbSHL3MxeAxHdkud/edWHlU9HNCEUu7F/197oRdn42TRp/5k75r9aEtUIakMtJlwZ8JoDmfS0gTLfotR3uDt6sIGYBhZVeitlwAfGZM2tQCO0vxDLlkJQhJVuetcieptyamQdPDPKBsp/cLC/58QZCx1f8ukwP7mFudr7JA1OLKaBDoSt2wKmwhUPwhIvvP5AXYT2Mr+Bl9T/JFQ85V1rfVrTT8e8Iumu2zAk8PUE1uGeAOVnL2l9WSjE+GL2z2FEoE8ND00r51nZyg4s5ab7YVKykTRPHHxpbLWgKMe/rh0azBb3BZDrJLUllIigx9+3cDu7OYrxop+c8u2qrZNiwK/I1YX8bUMcVjrPtbIAZ1HOKJ2tZ2kR1qHf8Q5ZfNtomXBKkC92dofle9YR6ecpqoq23rGcQXkE+7HhpS7AaBJ7wvGA2XJVPJ94w4mi18lCzrEcMXGAvsmJIBWl8qlubHzEvnJqDCE1mIuYH2VNjF5jvOsfRmg+dlY+clqIl3idMO2uQ0FIvmemTovh0LaTEHe+U3kKucfsVIrABia03zDQApN3RhKH2zSRvN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(5660300002)(71200400001)(91956017)(83380400001)(4326008)(30864003)(8936002)(52536014)(2906002)(186003)(107886003)(26005)(4743002)(86362001)(316002)(7696005)(6506007)(9686003)(966005)(508600001)(38070700005)(110136005)(54906003)(38100700002)(55016003)(122000001)(64756008)(76116006)(8676002)(53546011)(66946007)(66446008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uF0pH+FvN+ZwSfi5UzHR5xQtxPx6N9n2yJf8a6eicaez2Am0fHhRR8qiN/ll?=
 =?us-ascii?Q?HjKdAn+ivqVeDoru+Plv64kwSoC51i4pyzw/s4Z1VqwWKMaM/Z5YHSrp80vz?=
 =?us-ascii?Q?hpguLN/DzpVXe8MeWPi09WYppRaBBHwlpxjUCSg1HrtnG0MUARCob7qLb6S4?=
 =?us-ascii?Q?+SKYgMtm1sNlex67e8pN5oZ8CEpwqBiPuOP+zTyGJgOMzGrlZvrb3lFskZvF?=
 =?us-ascii?Q?cckUSD4rFbBsPMDarOz2LR0G2/+HpCZzwGWafpHQOTLxjHQiMxie1k6nLBMI?=
 =?us-ascii?Q?awzHM4/Zb5Soezwi79M3cCb0jdfcZd6hEjOYYI90xzcwApVXuz9pTTgGgRk0?=
 =?us-ascii?Q?C2lJLdHFEjZl7isIX3Dlo4LFzJxfGwPJzwGAvveFUGF1ROw2tJf+bLM1Y4/7?=
 =?us-ascii?Q?i9KnJitJI6sdii2isbr0qKffSc2EBr/QDIBvIh0QXvibM6/iT4iVFVm7EMqB?=
 =?us-ascii?Q?xMGeelfBk7PGduOBlXgzyVLpxGUH/t+zEqaWAzTRQ0Lcv912h8wveBOShe1y?=
 =?us-ascii?Q?skrhChJaZ2Kf+rbcTWG+3UN3B4Pbzf9TqZw87dPriHYnDj4WDzAN4mBuIFyG?=
 =?us-ascii?Q?1QH3s5jf//H8ULD/nxfaWqFjWDMeaHG+Qr/sjagoRKDBl2PlYyQiKjR8Me2a?=
 =?us-ascii?Q?I3Xnd1RhtPIELiBQafjfxziT8LNgLuo7+Q1QObUzr1AH69AX9riLb7vto9dy?=
 =?us-ascii?Q?ctZ3M7jod51RbGpjX5LYALVqN7cTaBaw1RVhziptfZnvS2q6kROmZlWYEZZd?=
 =?us-ascii?Q?QkFZlk5sS6xxSjxNemVQCcRyBBwKgHKt8mZcnnkxnEIdMjqJsSdf7VkjRfw5?=
 =?us-ascii?Q?oAu6c44P4xcg1GvkuiVcaUdgaOfTpqimtGodaprUfINDPp1K161A+mIkj/c7?=
 =?us-ascii?Q?+fcAVHwzg0oJ0dfXq7x+OCed7wtpQtd2+5sOMTgDgWlmIPaLMF6Sy0Kaa6Y6?=
 =?us-ascii?Q?8mkB4xGVQfC3AZMEm9Vam3RZ4xKJU+aUu2UUWWttsKE2BtsAEHaRkqEJRPtu?=
 =?us-ascii?Q?svWCy2yOHO/cLfdu2T41yI/sBiD/jFT4c44rvZg6wZJTIj1RAfyxtYNlUA92?=
 =?us-ascii?Q?fmHZubMrc8O3vRFpJir869hs1j35hK3VFqwIET3wBLu0f4tUewh7RjDV9q2G?=
 =?us-ascii?Q?QCbDfgDY2sx8ZhsSega1F6k0DP9HmhlztygH6ux51N2jRi+Fo2FLvL4vU4eB?=
 =?us-ascii?Q?X2Jxh3gW6YjFnKFc01bposGSUKvCjuf6kwxagTQxs2ID/QrqJ70FSXUFbCWd?=
 =?us-ascii?Q?OJOafNXwwgtf6omuWnV7gbmfCZFzbGUF162pm/uz2hJS3LeJsOMZ3crEQBIV?=
 =?us-ascii?Q?u04txL4jJVbeLdYLWOpbtbxznjt+APbE6CKx3mX2b93Jx4UsD7fSt9EOMgoj?=
 =?us-ascii?Q?iLKfaO29bju4okBdehk3vj+xngYcHAI50afL1JrdVwjAhwCRME0XHwpr/eYU?=
 =?us-ascii?Q?JlN6P9Lvq1xVhKF+BBhesWOw9AWCWjnzxYH1aniLDJS/Au+p5Cu8dt+iKmS4?=
 =?us-ascii?Q?1WmF2pfBkbM/2GuFzABis0f3tdOgLhjLNRLbZQZGaiUMVR0qn/FzAivUspWe?=
 =?us-ascii?Q?VUD5FwxzX0PTbfaHTCoy/j0++gEUOizv73H+5IWb+eOQwV3ed/fPJP7k9xUd?=
 =?us-ascii?Q?MsAh9XRmG3aQnbSE+E88ztVJDABjAMhXEj3S9doKLAMg5cY2CzkUpSK5tJYD?=
 =?us-ascii?Q?dSVjB5yV/QotmysbzIZVDtr6F/D1L46LOIz3BL4L6aIfRJu5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0fc2a8-f6b2-4516-0442-08d9f20140c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 10:35:44.3344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/NwmScIeJ7MtE5x/xsY9IuRQyTGfbfunkmRbJGUEyzSA/dKFbG+07RXhLgDXNz2a7j278DOVZ3IlzNy09VD/pHywvll30IalUuxEctrYaof6e2IQqMpnpnh3x2mseyY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR01MB3972
X-Mailman-Approved-At: Fri, 18 Feb 2022 13:36:55 +1100
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

Hi Bill,
Yes, I'm using EVB. After removing the jumper at J80 i can see the fan work=
s well, and the speeds show correctly. I think It implies that the ported d=
river works OK.

Thank you for your support.
Tung

________________________________________
From: Billy Tsai <billy_tsai@aspeedtech.com>
Sent: Thursday, February 17, 2022 9:57 AM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

I can reproduce your issue by shorting out the PWM and TACH pin.
Are you using our evb for testing? If yes, please check there is no jumper =
at J80.

Thanks

Best Regards,
Billy Tsai

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
Date: Wednesday, February 16, 2022 at 3:07 PM
To: Billy Tsai <billy_tsai@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.c=
om>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>, Thang Nguyen OS <thang@os.a=
mperecomputing.com>, Phong Vo OS <phong@os.amperecomputing.com>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Billy,
I don't have the device to capture the waveform here, i will need our HW te=
am's help. Meanwhile, debugging in the tach-aspeed-ast2600.c i have observe=
d that:
+ In the case that can read the fan speed, the debug messages output like:
# cat /sys/class/hwmon/hwmon1/pwm1
120
# echo 110 > /sys/class/hwmon/hwmon1/pwm1
# cat /sys/class/hwmon/hwmon0/fan1_input
837053
[  325.499388] clk 200000000, raw_data 7 , tach_div 14336
[  326.070305] clk 200000000, raw_data 7 , tach_div 14336
[  326.641221] clk 200000000, raw_data 7 , tach_div 14336
[  327.212095] clk 200000000, raw_data 7 , tach_div 14336
[  327.783012] clk 200000000, raw_data 7 , tach_div 14336

+ In the issue case, i can see the code is timeout at regmap_read_poll_time=
out (below)
150 static int aspeed_get_fan_tach_ch_rpm(struct aspeed_tach_data *priv,
151                                       u8 fan_tach_ch)
152 {
153         u32 raw_data, tach_div, clk_source, usec, val;
154         u64 rpm;
155         int ret;
156
157         usec =3D priv->tacho_channel[fan_tach_ch].sample_period;
158         /* Restart the Tach channel to guarantee the value is fresh */
159         regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_=
ch),
160                              TACHO_ENABLE, 0);
161         regmap_update_bits(priv->regmap, ASPEED_TACHO_CTRL_CH(fan_tach_=
ch),
162                              TACHO_ENABLE, TACHO_ENABLE);
163         ret =3D regmap_read_poll_timeout(
164                 priv->regmap, ASPEED_TACHO_STS_CH(fan_tach_ch), val,
165                 (val & TACHO_FULL_MEASUREMENT) && (val & TACHO_VALUE_UP=
DATE),
166                 RPM_POLLING_PERIOD_US, usec);
167
168         if (ret) {
169                 /* return 0 if we didn't get an answer because of timeo=
ut*/
170                 if (ret =3D=3D -ETIMEDOUT)
171                         return 0; =3D=3D> TIMEOUT HERE
172                 else
173                         return ret;
174         }
175
176         raw_data =3D val & TACHO_VALUE_MASK;

Do you have comments on what should be checked here ?

________________________________________
From: Billy Tsai <billy_tsai@aspeedtech.com<mailto:billy_tsai@aspeedtech.co=
m>>
Sent: Tuesday, February 15, 2022 5:33 PM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org<mailto:openbmc@lists=
.ozlabs.org>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

The register setting looks fine.
Can you check the connection of the FAN tach pin and BMC tach input pin?
If it is normal, can you check the FAN tach output waveform?

I test with San Ace 80 and get the result below:

root@ast2600-default:~# cat /sys/class/hwmon/hwmon1/fan1_input
3570
root@ast2600-default:~# echo 100 > /sys/class/hwmon/hwmon4/pwm1
root@ast2600-default:~# cat /sys/class/hwmon/hwmon1/fan1_input
3568
root@ast2600-default:~# echo 120 > /sys/class/hwmon/hwmon4/pwm1
root@ast2600-default:~# cat /sys/class/hwmon/hwmon1/fan1_input
4032
root@ast2600-default:~# echo 140 > /sys/class/hwmon/hwmon4/pwm1
root@ast2600-default:~# cat /sys/class/hwmon/hwmon1/fan1_input
4422
root@ast2600-default:~# echo 255 > /sys/class/hwmon/hwmon4/pwm1
root@ast2600-default:~# cat /sys/class/hwmon/hwmon1/fan1_input
6293


Thanks

Best Regards,
Billy Tsai

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com>>
Date: Tuesday, February 15, 2022 at 6:10 PM
To: Billy Tsai <billy_tsai@aspeedtech.com<mailto:billy_tsai@aspeedtech.com>=
>, Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>, "ope=
nbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>" <openbmc@lists.ozla=
bs.org<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com>>, Thang Nguyen OS <thang@os.amperecomputing.com<mailto:thang@os.amper=
ecomputing.com>>, Phong Vo OS <phong@os.amperecomputing.com<mailto:phong@os=
.amperecomputing.com>>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

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
From: Billy Tsai <billy_tsai@aspeedtech.com<mailto:billy_tsai@aspeedtech.co=
m><mailto:billy_tsai@aspeedtech.com<mailto:billy_tsai@aspeedtech.com>>>
Sent: Monday, February 14, 2022 1:34 PM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org<mailto:openbmc@lists=
.ozlabs.org><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g>>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

Can you check the PWM frequency and dump the register value 0x1e610000~0x1e=
61000c?

Thanks

Best Regards,
Billy Tsai

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com><mailto:tungnguyen@os.amperecomputing.com<mailto:tung=
nguyen@os.amperecomputing.com>>>
Date: Monday, February 14, 2022 at 12:24 PM
To: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailt=
o:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>>, "openbmc@lists=
.ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.or=
g<mailto:openbmc@lists.ozlabs.org>>" <openbmc@lists.ozlabs.org<mailto:openb=
mc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.o=
zlabs.org>>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com><mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>=
>, Thang Nguyen OS <thang@os.amperecomputing.com<mailto:thang@os.amperecomp=
uting.com><mailto:thang@os.amperecomputing.com<mailto:thang@os.amperecomput=
ing.com>>>, Phong Vo OS <phong@os.amperecomputing.com<mailto:phong@os.amper=
ecomputing.com><mailto:phong@os.amperecomputing.com<mailto:phong@os.amperec=
omputing.com>>>, Billy Tsai <billy_tsai@aspeedtech.com<mailto:billy_tsai@as=
peedtech.com><mailto:billy_tsai@aspeedtech.com<mailto:billy_tsai@aspeedtech=
.com>>>
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
From: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mai=
lto:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>><mailto:troy_le=
e@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailto:troy_lee@aspeedtech=
.com<mailto:troy_lee@aspeedtech.com>>>>
Sent: Monday, February 14, 2022 11:02 AM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>><mailto=
:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbmc@l=
ists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS; Billy Tsai
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Adding Billy.

Hi Tung,

-----Original Message-----
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com><mailto:tungnguyen@os.amperecomputing.com<mailto:tung=
nguyen@os.amperecomputing.com>><mailto:tungnguyen@os.amperecomputing.com<ma=
ilto:tungnguyen@os.amperecomputing.com><mailto:tungnguyen@os.amperecomputin=
g.com<mailto:tungnguyen@os.amperecomputing.com>>>>
Sent: Monday, February 14, 2022 11:46 AM
To: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailt=
o:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>><mailto:troy_lee@=
aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailto:troy_lee@aspeedtech.c=
om<mailto:troy_lee@aspeedtech.com>>>>; openbmc@lists.ozlabs.org<mailto:open=
bmc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.=
ozlabs.org>><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com><mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>=
<mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com><mailt=
o:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>>>; Thang N=
guyen OS
<thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:t=
hang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>><mailto:th=
ang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:than=
g@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>>>; Phong Vo =
OS
<phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:p=
hong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>><mailto:ph=
ong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:phon=
g@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>>>
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
From: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mai=
lto:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>><mailto:troy_le=
e@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailto:troy_lee@aspeedtech=
.com<mailto:troy_lee@aspeedtech.com>>>>
Sent: Friday, February 11, 2022 12:13 PM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>><mailto=
:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbmc@l=
ists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

-----Original Message-----
From: openbmc <openbmc-
bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org<mailto:aspeedtech.com@li=
sts.ozlabs.org><mailto:aspeedtech.com@lists.ozlabs.org<mailto:aspeedtech.co=
m@lists.ozlabs.org>><mailto:aspeedtech.com@lists.ozlabs.org<mailto:aspeedte=
ch.com@lists.ozlabs.org><mailto:aspeedtech.com@lists.ozlabs.org<mailto:aspe=
edtech.com@lists.ozlabs.org>>>> On Behalf Of Tung
Nguyen OS
Sent: Wednesday, February 9, 2022 10:40 PM
To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbm=
c@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>><mailto:openbmc@lists.o=
zlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.org<=
mailto:openbmc@lists.ozlabs.org>>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com><mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>=
<mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com><mailt=
o:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>>>; Thang N=
guyen OS
<thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:t=
hang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>><mailto:th=
ang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:than=
g@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>>>; Phong Vo =
OS
<phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:p=
hong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>><mailto:ph=
ong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:phon=
g@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>>>
Subject: [AST2600] PWM/TACH driver and dbus-sensor issue

Dear community,
We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's
repository https://github.com/AspeedTech-BMC/linux/tree/aspeed-
master-
v5.4/drivers/hwmon to support Ampere Computing's systems. Verify with
AST2600 EVB, i can see the driver works. However there is a concern like:
1. The change of hwmon fan pwm/tach in sysfs (as below), this is
different from the ast2500 as the separated of the fan*_input and pwm1
in various hwmon directories. At this time, the driver doesn't exist
in the OpenBMC linux at https://github.com/openbmc/linux. Is OpenBMC
going to merge and keep this driver ?

Please have a look on this patch.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253

Thanks,
Troy Lee

root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon hwmon0/ hwmon1/
hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/
hwmon9/
root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/
drwxr-xr-x    3 root     root             0 Jan  1  1970 .
drwxr-xr-x    3 root     root             0 Jan  1  1970 ..
lrwxrwxrwx    1 root     root             0 Feb  9 08:38 device -
../../../1e610000.pwm_tach:tach
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan10_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan11_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan12_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan13_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan14_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan15_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan16_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan1_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan2_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan3_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan4_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan5_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan6_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan7_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan8_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan9_input
-r--r--r--    1 root     root          4096 Feb  9 08:38 name
lrwxrwxrwx    1 root     root             0 Feb  9 08:38 of_node -
../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e
610
000/tach
drwxr-xr-x    2 root     root             0 Feb  9 08:38 power
lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -
../../../../../../../../class/hwmon
-rw-r--r--    1 root     root          4096 Jan  1  1970 uevent
root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon*/pwm*
-rw-r--r--    1 root     root          4096 Feb  9 09:13
/sys/class/hwmon/hwmon1/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 09:20
/sys/class/hwmon/hwmon2/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon3/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon4/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon5/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon6/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon7/pwm1
-rw-r--r--    1 root     root          4096 Feb  9 08:38
/sys/class/hwmon/hwmon8/pwm1

2. With above changes, the dbus-sensor for FAN/PWM shall not work
because of the compatibility. So if OpenBMC want to keep above
PWM/TACH driver, does any sides have the plan to support the fan
sensor, if not, we can join and do it.

Thank you and best regards,
Tung



