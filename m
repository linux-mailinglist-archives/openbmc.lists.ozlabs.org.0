Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FA4B1C18
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvy182Wtcz3bV7
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=IPBbiTZe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eb2::72b;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=IPBbiTZe; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv2cP366rz2yfc
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 01:40:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhajFtOrcWmAlV5srznKfU0r/Nol8pMZboTfq5Occ0pom7RbC8yYJwUEp/Sq709C6wNPS2S1txvfqRv8ph2tb5EfFJnCkBB8ShsZj2hUAKPXIl9mQWkBi2Q1os+aMpk1G1tqWBmRWWRuDOtjL/FExfKl/v08M1KeVBg5LxbzINmNKQsv5VtuHqlKslsiFHkj/Dnh6/ecJ2lAZgl8zmE1iVoCoQ+8U6mf92ofz+4E5cdQkuUX0/qXXr/qWb+mPDbnZyXCr+ARyW9vkT5D1gkswaGaHdV1KgV+qSx7SGr6WvT94+3clJmjYbIpQyOwheVDIv35GnvgjoedWyoYF0T0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87rqjKzJv6MraJqoI0U71Em0BtKATyXhhbbqlZl6FfQ=;
 b=O4f7+PezBT5JYz2t19QIm4T+gVx5jAFts/ZucUBCyeZ32oFlIbv9YM7ay73UcdhIOpwOvjKWFK3QE7p7f+kC4yHG7C4ufQ0XSO0RWhg/TM8VhgIjQ4at3t+7CKrL1uglx8A/fcDiy1/UYmSQQ64lwba5o12kKi4y+f22U9k0DqyCijaj7nPFtfGDA+Q7loKnNsI5s9ZspPS734rhQ18un3HPuoW0YQf7UFoyafNF/Um1mmmlboYCYmPlj5sL0aUDP1i/wR5XogueJVb/k8VVT44NGMu8k+BbVcGDq82CDEff9Lt81NzOTghelxYgXT5CaZwp1ZaA/sfG8HmooXqAdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87rqjKzJv6MraJqoI0U71Em0BtKATyXhhbbqlZl6FfQ=;
 b=IPBbiTZe/QogJdlJZmbrrx1uT3Ona4C/peGth8gbJYRpR/0JTCZZwA07RB+7Ko0feUBLXFd2W2wJCv4ACSRJZOdb2TIn0w5lxwxGT6QXPrmtZ1Y6HJCLhTA38uKn7xB/9t+1u3lqpdqQ1bU3OcuuxhDxVQ+VuxSxVj6LhCj7LwE=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 BN0PR01MB7118.prod.exchangelabs.com (2603:10b6:408:151::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 9 Feb 2022 14:40:24 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 14:40:23 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbQ==
Date: Wed, 9 Feb 2022 14:40:23 +0000
Message-ID: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 09c41415-1755-3977-9b9a-0e3d6fa8f35b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef2a5496-5189-4d52-f277-08d9ebda1afb
x-ms-traffictypediagnostic: BN0PR01MB7118:EE_
x-microsoft-antispam-prvs: <BN0PR01MB7118B967B796C2B12E03738EFF2E9@BN0PR01MB7118.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SgrEVsg9yhl+7qDEvCDuf73uiNYwuPrf0d6Rv45T6L44OLRxteryD7iGftCVvOCZMox/+d4UvHzziXa5ifcfgz81f/URbKHdhMlnl1+2Zxl/QA9USwMoWRY66z6HagvaCAR6kxCHrUH4gVGwS1rn/StqN1yz8RKhcS1APUA/sSY9YiMLfh4dSUjMyFSL3Az0xhnQxyfCmgqMRTQcyxnAHgPKSqYci6oWe/IOtD+LqU8tpcK3MPfe/3ODghdeyy53wouAthyPUQvKT3eWaXwMUOEWB1WFtaPFgOJNr0mBgwRpdptBfihR4Oe0RFRo4v9AjxWh6JoQ5XKJkcSXIQ6pC8GKUgZh88FOhcYqGwwjO2Znytd97Gbh1nJXtf7PG3Y/7bZlCU+9ll1E7cebQ8K/yxcvFkYgT9lDxxZAXcWtSDAIaVIq34Du4Z4LPohSZ0Zkx5cx10jTw1F3vI0Tgo+zjs5/Mbxi8jw9Z7a0jBhHxvUX74arvRbwJVM0FocnZG8l+e56rbq5raqyFKsc58f4TyuBqy8t2yZDixN3FeYOBlW/Ah3yCgsp9nXek6gn0xCbVQbTAfCh1eKekO9IMhAjRQuMjk8OmomXdT+csyXvzir1GjskqSaoBsEFe08Nsy6dIXfgmxxu+gu0HKVGhngUYW/1vzqRP1KF4l6x8F4usa42+PJwmJAgHAzY1VsLB7RYfwwN14BqWNW0NTDPfcMG0l++mZieN/K94kVVxeTmlD+RZmnC9NbItxooVhrHljyFJNw3fD5JSZ0jHKes8ySHHojKOuV3y2LNVv84vh+cyQKgrkd7raUO99+r7fBvzjakZqxcJRCAMCrDwHgel3kAww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(83380400001)(38100700002)(122000001)(66446008)(66476007)(5660300002)(52536014)(64756008)(2906002)(4743002)(186003)(6506007)(9686003)(54906003)(107886003)(71200400001)(6916009)(8676002)(8936002)(86362001)(4326008)(7696005)(316002)(508600001)(91956017)(76116006)(38070700005)(33656002)(966005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BBualQGObL+rEvMRkfix1sZuyC92laYtNYX3aZxpBdIZ/t8dISIGxNTdcp?=
 =?iso-8859-1?Q?NTDG8re9zM8gMe7hP2Zrwkhp9eziWY9knal/DogmZMaZtR7HB6xxCX4J3y?=
 =?iso-8859-1?Q?QzLqZKxpaPoM9AeCGSwv8sDLh+HSj+0/8UmgsrraHWTzSEfhfW/5reLR9P?=
 =?iso-8859-1?Q?DBRll6/QKdNb0U42ZOMTBcdmz+WrogZcZTX+QR2Lkgai4QAp3slqe8xVw2?=
 =?iso-8859-1?Q?GulAr79/tp0kLLrhKGdrMJlqPavRlWthmpJiHGxfcmGxjXxuVIINHoCLK9?=
 =?iso-8859-1?Q?dhjXrL+cN53sIVrrsotWvC74KiQ8tc/MS34S/f0n+v+K6zeUIEECC6RCE4?=
 =?iso-8859-1?Q?mSLqOk9lTXfD2L0tBXaXPV5nStVKObohdEZIQ+/zLoVz8zDA2jzDUcrcqc?=
 =?iso-8859-1?Q?oKypSr5jrda27p5cDYl0lj6PaE8BtBXe+BdgvnuXmWviq0O9EyFZBDX/jU?=
 =?iso-8859-1?Q?B6RuoDW5JsHafNoXN7dEKAfEMlMXcDa4G8MKsPeGltd61n21dbbrgaLPQx?=
 =?iso-8859-1?Q?yfxM8nIWSLroxy4RcGVeDHRO69/wAbkHaDkK4zaDhpYt6fam3baBuyqwvh?=
 =?iso-8859-1?Q?PmEH1W3i84T+MWfzmEWaRZ4/AtcE2mJyL5eMTHy18b6ezqtRTzYV4z3p6z?=
 =?iso-8859-1?Q?wN1Rf3XcZW7Zc49iUmqqi6xfb8v5FsWn5iQuP+hN46Y+M/f5Wgx0FBj/KZ?=
 =?iso-8859-1?Q?BEgM+6a4Wh1yz20AUs18aXuPkVRQfjtCWYgx4nj3PSg+bRiTpID8hsDipz?=
 =?iso-8859-1?Q?fi88LXVpVRFlBrqey7B/uEyQd+c3mwD+GZuzQ7PJ7vNAgO5UV5si/rp6im?=
 =?iso-8859-1?Q?96AmS3NQRj5qyfU9rGSP/2YtndZp8uu4DtF0iSDe20v+ldahbwOjMMgVxL?=
 =?iso-8859-1?Q?fbXqktdx3K+qVaslJ5mHIlHTAOtwqU4U/byNsoys+wvWJ/PNsXPDvW0vxB?=
 =?iso-8859-1?Q?x1SzYrVjbKgWqFMm45V2IJbzlKJEA1hFSd5CWzWTWrhHIMqfxiJR/ghZeC?=
 =?iso-8859-1?Q?O77NDF3Ckn1zQctJ2RBD12S5qySmccv7AdqsKSeGei4YzWQ0YxMuWEVxWl?=
 =?iso-8859-1?Q?T5IJs8lZUBJqtAFdVRO4Yk6inTd5Doog2LFO1p7UtqCekcis8L32NfC93v?=
 =?iso-8859-1?Q?67jxkpaji3Lum7vHhA3hc8jXnSPOLHlBJxQ8U4Agp5oZHneBn6dNTzS8Be?=
 =?iso-8859-1?Q?xC6vQT77Shzb8IFA6aXMbsO/1m/USnc/s+YJnO3uMjcl6hvZ0kBFE4kcs8?=
 =?iso-8859-1?Q?tNv96Grp3bKzMwF7/aPTepogoYxEdHZ59LW2xg0Pux85ql59gDYu/SRKON?=
 =?iso-8859-1?Q?Y22rUaffo6iKP0qATDA6LyQBQbmUjK99U1FEeQo9rw5c/swSPiQZ13+gUx?=
 =?iso-8859-1?Q?YyTkJJ5pOq6g+UdNPCJoqj46yModC3kdttxHMCh05gTOicWJF2LqBJOEWX?=
 =?iso-8859-1?Q?2tBl+YYGStxEq0WdhkwUb8EjJf4WM7mPyiFoMvW+Q1qJ+woITru3LWwiVw?=
 =?iso-8859-1?Q?S/4IkOBSup9WCKyoVfY+w4kBa7dtcLPy0C3qplqB4QIlztXKuDa02du7uh?=
 =?iso-8859-1?Q?4CgrABIwPypNjm0e+rKsnOAC0xW8MVU9MUgED6ZkVuyTDs8hPoltjh7c09?=
 =?iso-8859-1?Q?U7Nv2Iyu06O1IKqnc+ukV8JhexHhFW5PeiOKudd45x33grMjOCMkOvXyil?=
 =?iso-8859-1?Q?1Bkaa8RZpqxTK8ytwXPMMBLzjbb/UjdjSkw1YMI23nK7ArNLdGPx2XtNDq?=
 =?iso-8859-1?Q?EaPljJIF/amfJs5kup6a8Hikzj7sgy0iUJdg+teFg7E28XdPVtRH9n2yMi?=
 =?iso-8859-1?Q?4eOpSS6DmJVxZltoyBkpeBgubMVuKvMad6hEXUXIIdVfsmv5pZFn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2a5496-5189-4d52-f277-08d9ebda1afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 14:40:23.6346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8FBoQBx9IWlrNgXBe7++k1pGRwJFEp1wVKFJzXwtjqQTSmKqYlQk8piNWDWQuXrWrPY+U1LzuXj2Yz2qdB1FsXbwt9zl+6UnCw0YaQg9/EuCDLVHKrWFIKOJv6OuN5C0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7118
X-Mailman-Approved-At: Fri, 11 Feb 2022 13:16:37 +1100
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

Dear community,=0A=
We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's reposito=
ry https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v5.4/drivers/=
hwmon to support Ampere Computing's systems. Verify with AST2600 EVB, i can=
 see the driver works. However there is a concern like:=0A=
1. The change of hwmon fan pwm/tach in sysfs (as below), this is different =
from the ast2500 as the separated of the fan*_input and pwm1 in various hwm=
on directories. At this time, the driver doesn't exist in the OpenBMC linux=
 at https://github.com/openbmc/linux. Is OpenBMC going to merge and keep th=
is driver ?=0A=
=0A=
root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon=0A=
hwmon0/ hwmon1/ hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/ hwm=
on9/=0A=
root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/=0A=
drwxr-xr-x    3 root     root             0 Jan  1  1970 .=0A=
drwxr-xr-x    3 root     root             0 Jan  1  1970 ..=0A=
lrwxrwxrwx    1 root     root             0 Feb  9 08:38 device -> ../../..=
/1e610000.pwm_tach:tach=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan10_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan11_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan12_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan13_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan14_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan15_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan16_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan1_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan2_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan3_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan4_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan5_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan6_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan7_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan8_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 fan9_input=0A=
-r--r--r--    1 root     root          4096 Feb  9 08:38 name=0A=
lrwxrwxrwx    1 root     root             0 Feb  9 08:38 of_node -> ../../.=
./../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e610000/tach=0A=
drwxr-xr-x    2 root     root             0 Feb  9 08:38 power=0A=
lrwxrwxrwx    1 root     root             0 Jan  1  1970 subsystem -> ../..=
/../../../../../../class/hwmon=0A=
-rw-r--r--    1 root     root          4096 Jan  1  1970 uevent=0A=
root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon*/pwm*=0A=
-rw-r--r--    1 root     root          4096 Feb  9 09:13 /sys/class/hwmon/h=
wmon1/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 09:20 /sys/class/hwmon/h=
wmon2/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon3/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon4/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon5/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon6/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon7/pwm1=0A=
-rw-r--r--    1 root     root          4096 Feb  9 08:38 /sys/class/hwmon/h=
wmon8/pwm1=0A=
=0A=
2. With above changes, the dbus-sensor for FAN/PWM shall not work because o=
f the compatibility. So if OpenBMC want to keep above PWM/TACH driver, does=
 any sides have the plan to support the fan sensor, if not, we can join and=
 do it.=0A=
=0A=
Thank you and best regards,=0A=
Tung=
