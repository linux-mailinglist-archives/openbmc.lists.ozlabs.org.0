Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8E4B6228
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 05:35:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySvD3N3hz3bSk
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 15:35:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bHUOV7Xx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::72d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=bHUOV7Xx; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxqrs6ppKz2xvW
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 14:46:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UryXf2XaE9ltsuJw0hpZYVNHnfYWKtm1nJZn/lFDV+m10DZ2pHaGESR2Ty3SQ4VbDFfD1k3vjUCSDUEjQmG+88B255c8DvqcWq3sNIIahgD1rYi2QGVeJCQ9SaHI61t8Oz5DD/G4JNs5keFkSlIMOZ7c8GLee7C/igyzDidXhGei3+3QnJwJ8T1A5YelJepQ6RufrZm0cddNMnEr8qYVqu6Ap8NdQpIU8jNxK2rqfBxLwP3Vxn0oHKU9z/ZiztEXwWsyNwS8JNUxQirWAoBu7/MQCySwfCuHDMPsYMAFaW6j/0kPcbki2dHnpYT9gSsdjWu2Rt+ujACjCQrHw9BN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EKV0p4UT4zGUoZaBscJpOG6VBhfU9H+yoWxjwwpuyg=;
 b=eXhn9Tcnf+fOKiw40B0w+hjf0AmPO4GRqH9T4w9F9xUpWrJ46qwHr+1m1YHqiJXoUpfruGwh9H2Zd8S884ajUlEpd+pAY5TJKIGtFAT1BnhmpaYzDzka63w5p9MyoHvKoCdxyQyXVeYdCHduII0VCBf01TH4cLTHZtLHzr+myRWatuOGyQzl8BOV2QOv+amnXx3aY5SXpDWQTT87+JQlCvmpfQOKohA9WHz0CogaHW0Li6dq43vVt2s3HM/AjMlr4iqQOj3jGVv/UIfxkLYVaiC0h42VNLYjFju5SzYpxxDnJ+EqyqlD0cYtOmdl5we6qT1u1poVfHQngFojMRR8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EKV0p4UT4zGUoZaBscJpOG6VBhfU9H+yoWxjwwpuyg=;
 b=bHUOV7XxaebW2cKS4sPIePTuKPk/kdJ+g4yHkZzX7cQ8gwgOhaNB+5ioj/y7XNVKxbHqZBq5uh9KCnstW1/jMe/y4+LLrZENaNvRgvFDsgccgX8W9aQzK22Z9AHTdheKJLpIRgH1pN/ql35ZoyCEGfmwG1k1JixEQ3X3U/gqIBM=
Received: from CO1PR01MB6759.prod.exchangelabs.com (2603:10b6:303:f5::9) by
 BN8PR01MB5540.prod.exchangelabs.com (2603:10b6:408:bb::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Mon, 14 Feb 2022 03:45:56 +0000
Received: from CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709]) by CO1PR01MB6759.prod.exchangelabs.com
 ([fe80::ad17:6c06:ffcb:b709%9]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 03:45:56 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Troy Lee <troy_lee@aspeedtech.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Topic: [AST2600] PWM/TACH driver and dbus-sensor issue 
Thread-Index: AQHYHb9Z9fVcffI98EScCXqS70CDbayN0A+AgASdxKo=
Date: Mon, 14 Feb 2022 03:45:56 +0000
Message-ID: <CO1PR01MB6759A78F5D01E78934B055CAFF339@CO1PR01MB6759.prod.exchangelabs.com>
References: <CO1PR01MB6759E0EC69109784C4B3C282FF2E9@CO1PR01MB6759.prod.exchangelabs.com>
 <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB2145535BDA1526108377B8478A309@HK0PR06MB2145.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 87f29990-f365-06af-383f-61e44bbdd542
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1368966-e25f-4c46-ea67-08d9ef6c81f9
x-ms-traffictypediagnostic: BN8PR01MB5540:EE_
x-microsoft-antispam-prvs: <BN8PR01MB5540649FF28D800A25DF9B2FFF339@BN8PR01MB5540.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ES3LC5Q0S8E+ekGyU2HMUGFTifB8RSfmGjVo6i/G2OPe3Sh/LILn2Zl1PbsNdDS8S871HbyqjK2bq6XU1dtUabFBGIM2ZgabDjwbWg3HvjWdH/3oJKwxGFtzVwOqH0igEOIE1wYN2BX/fbtoubPutLUccov3xW+7OGZDtF3IKzEmP/S9V3Fj0nL/M2EgAOyy3v5t6ULq0gWq5PJIPYVANQ1KdEZKMYZbkYMY0T2os7Syv+66Zjxqjdl0oSI1Q/A8EqDqSSRZ3PfgZ5yKPyDsuMG8KCdhX1YuZD9C5IzTk/kDYpmIboD2QIguPT9xbBVl/y5Ixdkoagbi0T5zaYVYFUuW8x+JX4dElkAVF0OAfVDETHE2VE5Lx5zRlfAt8N8P8RJwYr46yvqtl1iUfWuGlPaRBa9GYWCV1M9EtLYYuV/jWu8jvyKjYETWaQaQ+MesaYUEOxuzsCRGdjr3neCz5vPWt7OerEtVyDcAMeNn6WwS1kRgwF32cD2F8G6T02Dpus8D+VbRcffRqicSXc0Q3D2zzzWC3rGFEzUNVFJAeFrXm2HxtQQnBBC0+OfDyrUbqvb4Yvj+8VrltSt7CO1aVQLsIaSIFnZT4sQhBNjaFOE5/S6zViBa7cFWI9hXzcHHZbcTtPTGrtby/neJd/5khj+iZ1H8Sc4A5Wl0QSRSvRWR5Q2EZY8w4ahzTHZfNKiDsAmW4cBe3RvJaUyMZMYv9RKOcy1k/qrl2rOTXZoRsf5A41L7lWZnky8ocuk32s78CcKCmN1RfR7RkqVio2AGVY7opDfkyDokWEcrcNRgSkwgA+M7oiL8ZtUkEWwiCN4W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR01MB6759.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(110136005)(4326008)(508600001)(6506007)(76116006)(66556008)(186003)(91956017)(66476007)(64756008)(316002)(54906003)(5660300002)(4743002)(66946007)(8676002)(33656002)(66446008)(2906002)(9686003)(26005)(107886003)(86362001)(83380400001)(71200400001)(38070700005)(38100700002)(55016003)(122000001)(53546011)(8936002)(7696005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0pzhwcIhAp9D9RkGSTzlnKg1gHx0NX6x9vH6SmODSLwOJ6b5O80RgLIw4juJ?=
 =?us-ascii?Q?YmInsCkRcKpDmgq6eP/NMQrdWQxB4Jsh9Nabakkz6Oakv00EsWvx2AC4bcM6?=
 =?us-ascii?Q?01NniWAX2TLQpbvP9GmjAcWEH8d69tYdOJx2pVQV9h9e5yvpYUeWbrigJwkH?=
 =?us-ascii?Q?lBEl2EFc4N4HwkqbeuHN6P2nR6frSE01KEqT0hCOV1CmRVtNYYgOHtkdgtb3?=
 =?us-ascii?Q?DuFi5h9MPZzNKaPFOWl6v/xy3WH1VZm7hDEWmEkSEQPcSEUndScTvqfC7znv?=
 =?us-ascii?Q?bKegYSb7YmjxjF3vBKX69Y76hQqhNzbDXkvTYWgA/+ACZy0rEQRQyQNQ4UQN?=
 =?us-ascii?Q?pVGmAoNkNJkfRPp5vMO2WlJIHts/xVxfZkSG03NKUD3dQSn50W3r5xReWDEU?=
 =?us-ascii?Q?o+CsuFk8S0UV8NwFxOgEngB3Z3A5zvPoODdFP4osdt80bp/UEMIrZiEV7ETU?=
 =?us-ascii?Q?2zl/+P90RBaX2n/U56juQ/AYVtCUmNMqbrwgsgzd5g4o6lsmZDqtQeFcRIyg?=
 =?us-ascii?Q?JGTOAsDDgfusHpmWDbcN4OqUCw4+cHXAN4DAxJwg+5Qbj8j5ddtvSRqW2/wE?=
 =?us-ascii?Q?RQuKFVAm8s+qaxoZtrnbW79HkYPU+J6E2y0AZKicERzw3psXeaBhRCeBFdqz?=
 =?us-ascii?Q?ipoD+iTqUCZoBCJwaIP91gLE7aU8FHAW4eJuf8v/AOMH3qv9qGj9c59Rsmwe?=
 =?us-ascii?Q?qB7zfNDt68lLXld1oYIa/cqROR40/6SK1na0n9btfGnS4rfySF9K/i9ssRAl?=
 =?us-ascii?Q?/AW3H45lc9TEMBhGCuMrmFadcvdYGBRbafLebUqvu4RlKUPADXQY0xbaOD/N?=
 =?us-ascii?Q?at+7rTQVVR8KARFwnUVpXaVY/kXASG4RctMuS8BI87rfMIDMJYX857UAVsBH?=
 =?us-ascii?Q?my1O+MN/l9co+ZD78hECvXvt9iNSHcffqPgbzx8+jVpD7uOHmIeY0Qh1qx8U?=
 =?us-ascii?Q?hYlqCPAmmBLSvmvEN1p8zyxZl7TkTGwHvSfJVBgN8AmHS1s+sYIdbU+zb6Nc?=
 =?us-ascii?Q?NW1XEPwkjrRCfLAVKmsA7Kgbs1+wveOKaXhL65jHDzAEYLIVzMR6mdm0a+aL?=
 =?us-ascii?Q?ylIQXhcPtJzF/32xpHHO9Uq6crhJPPU6AKeExbcck/vV7G0jdvFWFGyvFVmq?=
 =?us-ascii?Q?dUaJp9+2Mi/R5zEaZwJNA4RsEs7M3pjjL+VSZ0ly6rtdiNv4IJ/dc8G7648Z?=
 =?us-ascii?Q?Mbh8uRfBNae4qxjZYqpJoz1CqX4JB3PVHK/MuVf8lZuEmWaB9WRx6ZJUMbbg?=
 =?us-ascii?Q?hvVMhcUAWgwZEntJQ8i0QNqp0VDUTXEDguvACitXIWovwSUFRX9TRaZm8gRQ?=
 =?us-ascii?Q?Wx2smwHZOQcVMKcdpn6l6M0mbMwOp+oFeSSNTV4qDpGDoVMK9So1ro48BHeR?=
 =?us-ascii?Q?EcnjIDnqtbeQiw/uI9Huig8/Uy+TjmxMTJTTO6WvGWqT4kkId4EpquldmjGh?=
 =?us-ascii?Q?JIwBQ7o8/IPlRdYJTKYOPS8vVH04dgQCntT49EuwoFq5g/1c9WVQVPokHL0G?=
 =?us-ascii?Q?SEuD1dXlxU78qFAcj363kTMyNjSZaWEIRf3zQucVPy92cB0Vmy5oHK0O1Tyv?=
 =?us-ascii?Q?d4tdpwVkL3dVDkeI4hAhxdpViisu36BAX6RxEpfJeaSBsn9m5oK3hCupr5rX?=
 =?us-ascii?Q?b6VhyZZApbOnHuXNXiGoKWXco5IBb6sUL8yMlQTOdTXagUb12zYKr0Ec0WRJ?=
 =?us-ascii?Q?eWQWV4Kj+z8Ly4r4mY2osKzX9rIFKk4xvdCDxWeD7iJr9R7A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR01MB6759.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1368966-e25f-4c46-ea67-08d9ef6c81f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 03:45:56.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5j0btZcuOAvIdIDrjC1NzGyEsWo3wfP2ZvlP+laBaUXOLBYNT4I1G4zhTgcoo9zdh8qu0Hf+SPrzit8F6mo9t7KnsLtr9T/L1a6VcIfZ6Hnklf8ePlm5r5dX7OuQoqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR01MB5540
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>,
 Phong Vo OS <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Troy,
Thank you for the information, i have merged the dbus-sensor patch and see =
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

It means the fan speed is reported incorrectly somehow, but i can see the f=
an speed changes by eyes, do you have idea on this issue ?

________________________________________
From: Troy Lee <troy_lee@aspeedtech.com>
Sent: Friday, February 11, 2022 12:13 PM
To: Tung Nguyen OS; openbmc@lists.ozlabs.org
Cc: Thu Nguyen OS; Thang Nguyen OS; Phong Vo OS
Subject: RE: [AST2600] PWM/TACH driver and dbus-sensor issue

Hi Tung,

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+troy_lee=3Daspeedtech.com@lists.ozlabs.org> On Behalf Of Tung
> Nguyen OS
> Sent: Wednesday, February 9, 2022 10:40 PM
> To: openbmc@lists.ozlabs.org
> Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS
> <thang@os.amperecomputing.com>; Phong Vo OS
> <phong@os.amperecomputing.com>
> Subject: [AST2600] PWM/TACH driver and dbus-sensor issue
>
> Dear community,
> We have ported the PWM/TACH hwmon driver for AST2600 from ASPEED's
> repository https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-
> v5.4/drivers/hwmon to support Ampere Computing's systems. Verify with
> AST2600 EVB, i can see the driver works. However there is a concern like:
> 1. The change of hwmon fan pwm/tach in sysfs (as below), this is differen=
t
> from the ast2500 as the separated of the fan*_input and pwm1 in various
> hwmon directories. At this time, the driver doesn't exist in the OpenBMC
> linux at https://github.com/openbmc/linux. Is OpenBMC going to merge and
> keep this driver ?

Please have a look on this patch.
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/49253

Thanks,
Troy Lee

> root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon hwmon0/ hwmon1/
> hwmon2/ hwmon3/ hwmon4/ hwmon5/ hwmon6/ hwmon7/ hwmon8/
> hwmon9/ root@mtmitchell:~# ls -la /sys/class/hwmon/hwmon0/
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
> > ../../../../../../../../firmware/devicetree/base/ahb/apb/pwm_tach@1e610
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
> PWM/TACH driver, does any sides have the plan to support the fan sensor, =
if
> not, we can join and do it.
>
> Thank you and best regards,
> Tung
