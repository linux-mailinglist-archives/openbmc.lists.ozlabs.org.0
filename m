Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B674B94C2
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 00:57:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzZd339Dfz3bZN
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 10:57:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mYM7SnWT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::730;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mYM7SnWT; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz8D21Pm9z30NP
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 18:07:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqNgxAEGgRBSfxMW4A0ETwkIyOodonqHpaLng33woUSTQ91A2pB44c50CS8sHr3lw1rXzFCanB+G020beasS02IGcpkWPIHCc5feFCF5rH2h3Fejk+6s7Hz+j3FWWmI2GUkHDrojGwgYP2kzYhjP27yJuKF3ufXt16pGN+khgXkd8pLGONHHhyhYu3Z/P3Vz7fMqKlvAoIsp9C4qE7xascj0ktHKnlSxnDB4lOHaO+3IqCVdrFidq/1cgss3v3cyX2ZhKsIrDn4qNKhVwGsMlh9hkZNupNWrCt981eBQL8yASv4GBmRqR7cIjOekjuYY+49KZ15HbuO0wAEhBVXOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUB5fm+2hZyquZiBOQ2YvGUjuwlcrvxc8G+O52W7dno=;
 b=RAr2w8+0W4ej4rWIG3OKNqjZo3U3tMTgfm5WDDAitJtQTBUjdXgZuPKu5V1vvPYKUKd7nVjKXFi06IJMN4bAFBpo1n0b3l0P82+mJiT/fPetsEDcXVNzc9y38OpISKF0q4PKHVP4dyWPV1KLzL+dPCbs0tbsVNQ7cZVGxU1hZGGn2Q9RA3sT8rppd2njdgbA0A4qwhuvBJn0RVj8v7ad/242Nm/Td13JzYuNjAiwtvGfqHxCLZ3asNZw2SKMTC6hRR/scpJUZCbfirMZZ+7wsYLRqk1nXnLeJ6Nih057xEifn9GzedHiJgBToU/g6NTKipi2Q/WpW5FpDT5GNdr+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUB5fm+2hZyquZiBOQ2YvGUjuwlcrvxc8G+O52W7dno=;
 b=mYM7SnWTTTl7BQ0oyyOVtP4y/MKgdUFpdklr0+t7pkPmKYiJ6C+8pLGiNeDsXZtvbEURRmRa1KLDGhEQG8Ck9eLbzhtXTAC43VXuRAtBSLAETl1r8YGf2dJL31FzJ/HgQALBFJiaGvp0Srl0zX5K7W6GbHk3sV5rJ8dMq3qSsWw=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 BL0PR0102MB3314.prod.exchangelabs.com (2603:10b6:207:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Wed, 16 Feb 2022 07:07:00 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 07:07:00 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Troy Lee
 <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKqAAAIO4IAAB0KpgACtO4CAAUemHoAAjXqAgADP/Bk=
Date: Wed, 16 Feb 2022 07:07:00 +0000
Message-ID: <CO1PR01MB6759567EAB2EE2D6FC02CF6EFF359@CO1PR01MB6759.prod.exchangelabs.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB21458E132EC1569124866E2E8A339@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <CO1PR01MB6759010F944EAF2DF12EAA39FF339@CO1PR01MB6759.prod.exchangelabs.com>
 <5BF20D73-BEBB-4C25-AFE8-63DF434CFBC4@aspeedtech.com>
 <CO1PR01MB675963DCF2D3A0505CE2780AFF349@CO1PR01MB6759.prod.exchangelabs.com>
 <D9562E34-D61F-4F51-B4EF-7F4F83F27367@aspeedtech.com>
In-Reply-To: <D9562E34-D61F-4F51-B4EF-7F4F83F27367@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7dc49d73-5313-bf62-b0a3-cef4be4e10d6
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8734732a-849a-4c25-f5b0-08d9f11aed8a
x-ms-traffictypediagnostic: BL0PR0102MB3314:EE_
x-microsoft-antispam-prvs: <BL0PR0102MB3314369948C4C4A53F11EFCEFF359@BL0PR0102MB3314.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TC1P9Ksa4ahWcdghK6goNySn7dLVw6A1aeg73aOgksoZxIc01CjG22xz/W0Vi6kTsOp/uF2t8+tZ2ilqoa7sRleT+ALaT7s7vt2hQwCJ73lJp03Jaor3/kTNVUVfez8Cfkaj7TDcHjlQSvD31di7nWdgFn3VA0EXUPS3TMS8sBjMSHpExmBjQ/o38SeWdx8Jd4ZOvSEGdfcF6gk5qnCv1/sro8ZKja6Eb21AL8XPcwk0D6nrJ2bhKlF9pQ4RolO0BSO3uoigIYQJCoEwd9vf0I+1O+4e3o7VjsNnV8iKgiUhvEopM0+E+7CMghlQ4gFm2gJ6SG4dy7ddc1bWI3/lPlnUrJj4+nN8oxczLqw+hhWg3XDLDETF2vBL6QoYVXjupfQfoS+HBwgy9x1qeWOCNtF6SKCXXS7VDQomFBWNSCvyo4nDAumrFlyTaTnYU3Yp24Ths4r9HWAXhb9EW3AhMKhGlivFKacZ+S+g2oOhfUqR83dO5cKnNY2YBopTvwU4O6YC94zRM7x4PE3PsTBVO6xeqFsRsfSE1vCucWX3miwjcrqCzOzwVTOlI4QJ4fyOWc6FoeoOcw7gZiCi9uz3s6TVEnFkKtVAVDuYyFQ4ZKq/D9mHEWaZMHeRbIHkWlSFeAe7TOzEgCiJAF60CFay0IUTElEcn0/ZH6nbQbes0fSnQxkQNAgxEEpTG7p+oN7j++3sv2qps8OCCYX2Lgo7RTZCLAlXu+SJVQbAE3EUwpKZrPJ3tk2kbicykjc9grbOm7n2ggMb8+txLknvXwmb4MlBYJMkZjYEspXN20Rx1K0ajR/tLjbj3hUS0NmAHYz6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2906002)(30864003)(38070700005)(52536014)(71200400001)(966005)(66946007)(8676002)(66476007)(66556008)(66446008)(64756008)(86362001)(38100700002)(5660300002)(4326008)(83380400001)(76116006)(55016003)(33656002)(107886003)(4743002)(186003)(26005)(91956017)(508600001)(6506007)(7696005)(54906003)(110136005)(316002)(122000001)(53546011)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4yfjvYfPay3lEZ6s59sq1tBlESkDzK6+U1btFS1N3bK93rv9W8rWJQXqzI5M?=
 =?us-ascii?Q?G+MKdxGkKYJ8gBRARVJ/KEX3tHutk8f1Ph/wgfqVKfS4uoumaa392OwEzG8A?=
 =?us-ascii?Q?FOSEa2JTKgyL1Xefoo+Z5TP5+LZgQUP7sYLi62+WCRlWZQlwtBBqrUfy70sW?=
 =?us-ascii?Q?JotvZ4kFrpcwMBQLIZhb58A4xqj27vfx6M0qCdZPr/e9dN87fwD4VMDQvKWc?=
 =?us-ascii?Q?jrqPDvNPXG227P07sAnMyHkRNrMPlRvS7Bc5MQjo+5atOQ3sVx/tf+xC5a9Z?=
 =?us-ascii?Q?WFBnimx/P6YtG4wpeaMFY6FHHEI19Ouqem8N196WFSq9UgY/D/7Wu+H4QX9t?=
 =?us-ascii?Q?un36b9lCnMceC2372aLx3ReabpPry/yHsDT4xUnaqtWJJ9lG0y2GO5mMrpGN?=
 =?us-ascii?Q?s3sJuGqagpwKz5eMXGX8KcmuCJm6h1Bp+HVQJSkLmy5xQycL5CQbFUTIgUIq?=
 =?us-ascii?Q?K1nY0HmSwNESG4konZe4hYqYA6fbO18UhF0ptOnBs/JQ4tmVOKqkWlyFfML6?=
 =?us-ascii?Q?iMr12VX3bkxDbHnWRnzE8Q9OFSG2W31smgX9gtSjgGSHhW0wXS8v5HCQnwjd?=
 =?us-ascii?Q?nuUkbQ2X5Lox+VH7gPimFP/U5c3t+AdL2u60+apRdoZMnFPUn22g/LGeaEfd?=
 =?us-ascii?Q?GifP0N6rEOhDcX9kGRof+kTPDbt5dwQlwKkbBTrqfAi8otxmrohMzn0OrxO1?=
 =?us-ascii?Q?r1I9OdG0WRf11LZiF+xdH1OQCSWWj21XnfHcEl18eqrojjvL7R2rDLSefj7e?=
 =?us-ascii?Q?7uHXVNbxiz39XhTiROS+iIUenOMID2+z9bkksuTkWiMDyPdgXEh3hKo/LOh6?=
 =?us-ascii?Q?iL+mC+HJ/GI8jqGXtOOm/0qInEsWuCMpx16KYcCq4PoBOu1m9MhKsPwzzsNu?=
 =?us-ascii?Q?G7LMbgTq0rjDKwVtgIRNCOp/rk5fniEnA78pWhZCmC5e7OG48JZfuoWDFNRp?=
 =?us-ascii?Q?meBKWdIsSH064QvHbLBjkvALgwzEkL/z4xXK0rRn6P+pVT/LAG/uQ8OIgHr+?=
 =?us-ascii?Q?e9I3MbZ32tA8nhZGM2jvwqT3grD962Hj/BKodVTs2IFXngMo1mMI6Ce8liTl?=
 =?us-ascii?Q?1VwK0u+sw9qGlzwcwN2ELfdxoBTTEU3DktZ2WjEOTmr548u8cfaanHOdefWp?=
 =?us-ascii?Q?C4ggToisIPCIWnWqNjgmu/8ARNqz6RJJf2LCRl4xTqM1oZo29wi5xSREpRU5?=
 =?us-ascii?Q?RepT9FT0rabVMN+HcSqhrr9fBHmaZmaryzLmqK3aqoSuooYBOAPnQYZ7COtL?=
 =?us-ascii?Q?x9LJnfI4tW4HlQAT9fYDox8i0fATv3aj33iCOaSoFlx3iIl55VXDWkZk3jHU?=
 =?us-ascii?Q?n+GbvU9ymIU2aaVU8VXtQnB201MVtG6LikesW78o4C7I5XSCWePMscjRMR8s?=
 =?us-ascii?Q?MzsBG23gHH1PPBnTJDO24NE21DG2E7iK0ttlJfqh9XEbTeRkHDBaLi8Ds7va?=
 =?us-ascii?Q?Vw3XwhBzQiF8bnM4c2B+TTMGIJrdWbstBZdUllj327zl5OEG4x7Q7M/TkMbG?=
 =?us-ascii?Q?MMzgihkIIkM/p2pWyDFwzQUGVfivI9ytKbRF7kV3aG8S59C9HCeUofoq6BaA?=
 =?us-ascii?Q?nr8O+6zlzZtJ7HX6YPZn9OTXr/ZWp7gHvZ1R6hoP8cPNGiShwRo6tr51Ap6F?=
 =?us-ascii?Q?EJFijflInWq1Xqj7FkOI+OnGN9SuFHk1EJWrD0CzZNuntVWi9kRuWvxI8gHe?=
 =?us-ascii?Q?uUmTpoV3VdN1pI/lEv0NdEFWuTq3H8KLhhA6M2LJklQ+IMzW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8734732a-849a-4c25-f5b0-08d9f11aed8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 07:07:00.5136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaZ/4a8uDxBJckzGZjgrmdWUvYl/u0VQvxsBNw81vorKLs/BNyYjt4i4VlH42pxQs70VHhP7mEqQ0hJBYwFqASMSvwDfhKkbSlFja9N6nbN/+zPSv610nXJo7ch/DqA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3314
X-Mailman-Approved-At: Thu, 17 Feb 2022 10:56:47 +1100
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
From: Billy Tsai <billy_tsai@aspeedtech.com>
Sent: Tuesday, February 15, 2022 5:33 PM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org
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

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
Date: Tuesday, February 15, 2022 at 6:10 PM
To: Billy Tsai <billy_tsai@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.c=
om>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>, Thang Nguyen OS <thang@os.a=
mperecomputing.com>, Phong Vo OS <phong@os.amperecomputing.com>
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
m>>
Sent: Monday, February 14, 2022 1:34 PM
To: Tung Nguyen OS; Troy Lee; openbmc@lists.ozlabs.org<mailto:openbmc@lists=
.ozlabs.org>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

Can you check the PWM frequency and dump the register value 0x1e610000~0x1e=
61000c?

Thanks

Best Regards,
Billy Tsai

From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com>>
Date: Monday, February 14, 2022 at 12:24 PM
To: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>, "op=
enbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>" <openbmc@lists.ozl=
abs.org<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com>>, Thang Nguyen OS <thang@os.amperecomputing.com<mailto:thang@os.amper=
ecomputing.com>>, Phong Vo OS <phong@os.amperecomputing.com<mailto:phong@os=
.amperecomputing.com>>, Billy Tsai <billy_tsai@aspeedtech.com<mailto:billy_=
tsai@aspeedtech.com>>
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
lto:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>>
Sent: Monday, February 14, 2022 11:02 AM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS; Billy Tsai
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Adding Billy.

Hi Tung,

-----Original Message-----
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com<mailto:tungnguyen@o=
s.amperecomputing.com><mailto:tungnguyen@os.amperecomputing.com<mailto:tung=
nguyen@os.amperecomputing.com>>>
Sent: Monday, February 14, 2022 11:46 AM
To: Troy Lee <troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com><mailt=
o:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>>; openbmc@lists.=
ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbmc@lists.ozlabs.org=
<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com><mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>=
>; Thang Nguyen OS
<thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:t=
hang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>>; Phong V=
o OS
<phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:p=
hong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>>
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
lto:troy_lee@aspeedtech.com<mailto:troy_lee@aspeedtech.com>>>
Sent: Friday, February 11, 2022 12:13 PM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.or=
g><mailto:openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

-----Original Message-----
From: openbmc <openbmc-
bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org<mailto:aspeedtech.com@li=
sts.ozlabs.org><mailto:aspeedtech.com@lists.ozlabs.org<mailto:aspeedtech.co=
m@lists.ozlabs.org>>> On Behalf Of Tung
Nguyen OS
Sent: Wednesday, February 9, 2022 10:40 PM
To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org><mailto:openbm=
c@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com<mailto:thu@os.amperecomputing=
.com><mailto:thu@os.amperecomputing.com<mailto:thu@os.amperecomputing.com>>=
>; Thang Nguyen OS
<thang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com><mailto:t=
hang@os.amperecomputing.com<mailto:thang@os.amperecomputing.com>>>; Phong V=
o OS
<phong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com><mailto:p=
hong@os.amperecomputing.com<mailto:phong@os.amperecomputing.com>>>
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
> ../../../1e610000.pwm_tach:tach
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
> ../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e
> 610
000/tach
drwxr-xr-x    2 root     root             0 Feb  9 08:38 power
lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -
> ../../../../../../../../class/hwmon
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


