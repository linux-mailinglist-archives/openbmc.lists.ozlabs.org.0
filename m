Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7E361204
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 20:19:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLngT0Mgqz3bnX
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 04:19:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=qta84poJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=qta84poJ; 
 dkim-atps=neutral
X-Greylist: delayed 583 seconds by postgrey-1.36 at boromir;
 Fri, 16 Apr 2021 04:19:33 AEST
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLng93dZKz2yxr
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 04:19:32 +1000 (AEST)
Received: from pps.filterd (m0187218.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FI9iTo031621
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 11:09:44 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0b-003cac01.pphosted.com with ESMTP id 37wqf3k6fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 11:09:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FheRbaf7t6S8TqlXkmy1mThAvpB6GT116n8at9aMLQQM8cJx/b6BWQmOknxVZpPW6ig9e0vyvlCNMRk8L6+TdxkBuNU3dhF8l1SgMvjzCU0sDDLODLCnMoL+62iGGN3bXNM+X+EPoUCQ/9XPTXmmoje9uX9+X9H8g9DFsWanS8mQZhzsP5CzezsbHc2ZsDUksRjAHRd1AFSyanslupEeqtIxpS1DbVNuKXrd88OpFVcaTqck2mpCoX+n54SiD3sN3ac+gY2JYM04H/VkFUa9u2jzWN5CZ5QAOykab5zLwxioXtrwbKHfURUm5hhvnbAKzsIddbF2WJLgxDPgMgMbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nptjo7/dMlSBdm9sUuSlvew2BNFLKmHdtp2b2P3hDog=;
 b=hNDFve927kP/KErFdjyO1yN2HPnDnxyKB6isGE5gvfHa/QzBjrm6pH/BQ9jYckX8R4CVsAXfq17sPuozHLWFbYk9FC2szbUpQ4CJQ4v9paFV7aSCCOJyK4oUBUpC1AWvRWPOk2S23/em3Bu78/bJP5f60xtnUpu24ZWIRN6QrWj/hm8ywM6t5hWJ5j3YvOli3UjYYBcqQXABZ/yyuPQz1vbniwa006FMh4+fXWi/hT88irK0GrF1teGERGmRwS8cnQI2aQ8k1Hr9ISWACo6KW0ugEGjvbj/Cuio6ipY+Uc/axF0wP0oWKaz2hQWdjECrtSwsdgKiLnDAQUaz/IV/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nptjo7/dMlSBdm9sUuSlvew2BNFLKmHdtp2b2P3hDog=;
 b=qta84poJv6QM+VOSPSjTZ1cisd/ec0L8a2IuwMzVjLRxVErk9gYxV0vmzLvIQZYHYv/fMVQxCNLMOcQOHdoCeDy39dpeIBqXuLc4Lgq2upO2tycQFAIxZ8jifEbh7zH1v4pTbIwQ2yUY10MFJJh8HarokGNEtSJ1fsZg40FgXGQ=
Received: from CY4PR17MB1653.namprd17.prod.outlook.com (2603:10b6:903:14b::18)
 by CY4PR17MB1654.namprd17.prod.outlook.com (2603:10b6:903:14c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 18:09:42 +0000
Received: from CY4PR17MB1653.namprd17.prod.outlook.com
 ([fe80::4801:51a9:d472:b933]) by CY4PR17MB1653.namprd17.prod.outlook.com
 ([fe80::4801:51a9:d472:b933%3]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 18:09:41 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: fansensor errors 
Thread-Topic: fansensor errors 
Thread-Index: AdcyIeUjwwYeaC6eS5yK2LjO3GOpwQ==
Date: Thu, 15 Apr 2021 18:09:41 +0000
Message-ID: <CY4PR17MB165329ED7931C3A9CA86E816964D9@CY4PR17MB1653.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee2bd2af-4560-4229-c99e-08d90039a44a
x-ms-traffictypediagnostic: CY4PR17MB1654:
x-microsoft-antispam-prvs: <CY4PR17MB16547A9583A07D2A75412A1E964D9@CY4PR17MB1654.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81l6F2Lu7mjb2IigxJnJlnKloscOpQ6fLePCS0eedOY7ySEnjvPydGo1CWh93FvVkvrOzA2tk5oXuLPc2LTfV0hC0mjNBaHPJItpq+t2NE79JfBWCFyGlrw0pLQXfILW8JpE86UxcINS+OmsPHcS4yQr/D89uzUBwNosHvueeprpymO91L/mmseqyzePeCViPygKDZIu+OLMJNPEv6okNg4my+qD4YOyojSG9d1q3RdJ64RgVLdB+GfPShPdmV2GM0oGZEoYjc8tSazTIrp1CSvtudH2usCozb8R8rMfJTEx5kQy4tAR9dD4QLcu2fucEjfFWpWqAr4tdr1DyEjitl0Uw3LoJjEeTL/pmDbvmgWSglvFlT5/hcmVdDMsM1pHnN6y0nHhp5eT9k/oRCWxsr02Hvf+y8LDg3dzOzT6HeTkzi/dDjCPWzvQjyPFTKYBkzIgbk1MHDaMaJXqf91ShX57lblNnUyJKO+Odw39Vrxt7+scAbLXAKdv++qspQKw+V3YNseFMdM8mB1xpGJ5SsKOYnsS1WPGaX/275/QqHCyvFRpU3iu76usdnc9IchKU2od1PMJoyR6p0P6EkPxg1xYn6k0xlHpnNH0QzvOVhw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR17MB1653.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(8936002)(5660300002)(478600001)(8676002)(7696005)(6506007)(9326002)(38100700002)(71200400001)(3480700007)(55016002)(86362001)(66946007)(76116006)(66476007)(66556008)(186003)(7116003)(66446008)(122000001)(316002)(52536014)(4743002)(26005)(2906002)(6916009)(9686003)(44832011)(33656002)(64756008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0iDYyA3Vep3S9OeUKm06UewgR81MotRc3FQ0hnMUtfauoBZxnBQGlAU4TGy8?=
 =?us-ascii?Q?HlSyxWdOCNTAAnWGqy/Mc79srWzP4tvHK9CzR4DRsIKqsnjyaKJJbWX1PYDr?=
 =?us-ascii?Q?T9DOtW/hVrnUHEp1omJO61BacqjlOftPDW38lkNTluBYrAI1NcW1fYR5VNMT?=
 =?us-ascii?Q?S2b7S31zL1rTqNBachlgOuJJUve1DNdQ30Z2eplaGz/9jNZKhXFINb9YUrWD?=
 =?us-ascii?Q?DHjHkI//6TicLBgxV2yid80N5+hf2vpdKGeZBs38HvsPEwanG7hy+Hzy8cCR?=
 =?us-ascii?Q?5a6WeMhfhrFsH9yPqta7Cd+BeSsD6hIFkG40+gPoZTduRmOw7yEQ4utOx2wa?=
 =?us-ascii?Q?KCe1rdSYSeoeelSBdhNO802mJoZwPwhoMcL18fbfim2zk7E6JwulMBc/xh7t?=
 =?us-ascii?Q?c/SErNAMVYzfUlegZzJv22uIYiMXgFXZXYtH85CczuljMZ8U7cklNUkn0nKv?=
 =?us-ascii?Q?o2BT5NYWlny88Liq2jNKLvMG+9mD0cGXdKmGLldio4cF4jTB1I9oLwOPhDJU?=
 =?us-ascii?Q?+y0eGl3Eb7MEU/SSmktLTH5rEycHiZh5eGFerOT62l5M3rpjqmRMhvYd7vY6?=
 =?us-ascii?Q?zdf0YkE9sCNGMPAnGGs4dbpZRjO8RVuIcZWY4v1uWiEzz+1/SROUi4JSDdzS?=
 =?us-ascii?Q?kaBTdQMfTuNjANZ2G3d7WrHhl0Ur0F5EphIOFIY4Q7661aoRe3VTA1Ci5xHk?=
 =?us-ascii?Q?Be1xpXEU5fxP9Z0REPQWPHHdC06+2btbsTMb4WjktU1CJc9oo/7CZ5ui3G6R?=
 =?us-ascii?Q?IxTvgv7nq3lzI++MM09KufXsw4FydBUP59uCDGjTrXp/bdFXoxHcrmQe0E0Q?=
 =?us-ascii?Q?pN1wIBFquvGJ08smMI9V6XpjOsMy4SiCtuwrjV2Jn6znaj/FmIRAZWl2sTkZ?=
 =?us-ascii?Q?o/Bj5n0ImTjRInQyUWUrBp88gAFv1NLIlSANz/04pAoq3yhLlBDk4oAweKNx?=
 =?us-ascii?Q?EeJgO36BHCWOPi6jKwLoLGkBJ7rGCXXUHt8KahvB4Y6dcqTBq/nx5/P+pBDn?=
 =?us-ascii?Q?Kiw6lahOgODtpsvMFlI4vv/znnXiMUCF0pFEyYIPkV/thezSobHw+SJTL7XD?=
 =?us-ascii?Q?mpIHtC1kgAuTKfhglZeQhro5MdVq5WRHd5lohBdLmJRX6V13nFnfAJqPKYxK?=
 =?us-ascii?Q?5sCQTnY3dPBM4SiiTZlbTSckR+S7/J9u8hGBa2TDxP2uzoHLO9xtz1G/aR0i?=
 =?us-ascii?Q?Qv0z8HCvMYq3lMbY1Cx9/hxR3psVWW16beZc8pNQ3w92SZbLctI8hJo2qHly?=
 =?us-ascii?Q?nMl10UplPEMHVcvgfH/US80i69ewtQE2yVzHRuWBBv7BeFJXicSyg0aueE42?=
 =?us-ascii?Q?fRpnfEBTWUP1vnLJa5QrB/7J?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR17MB165329ED7931C3A9CA86E816964D9CY4PR17MB1653namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR17MB1653.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2bd2af-4560-4229-c99e-08d90039a44a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 18:09:41.7387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kv7cwThGQ6KpNlCrQ1eoZEquz6jHT3MlFHkZ4RZhyf4yF5Tg/9xw590ZydqH89asv2rN+l+EcsUc1+EpaU0WBEbnrkFJzy/yicmAZYfBD9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB1654
X-Proofpoint-GUID: IasE5Gxmqrf3Nc9mlxpqyVzg3UQPfSZx
X-Proofpoint-ORIG-GUID: IasE5Gxmqrf3Nc9mlxpqyVzg3UQPfSZx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_09:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150113
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

--_000_CY4PR17MB165329ED7931C3A9CA86E816964D9CY4PR17MB1653namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am newbie with the OpenBMC.  We are porting OpenBMC for a platform which =
has 7 fan modules with two fans in each module.  I defined the pwm-tacho-co=
ntroller@1e786000.conf<mailto:pwm-tacho-controller@1e786000.conf>, and when=
 I run it, I see the following errors from the fansenor service.  Here I pa=
sted logs from the service, my conf file and other important information.  =
I did not understand why the service is giving these errors.  Appreciate yo=
ur help.

tacuser@fenderbmc:~# journalctl -u xyz.openbmc_project.fansensor.service
-- Logs begin at Thu 1970-01-01 00:00:08 UTC, end at Thu 2021-04-15 17:26:2=
8 UTC. --
Apr 15 17:24:24 fenderbmc systemd[1]: Started Fan Sensor.
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan9_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan13_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan1_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan4_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan7_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan11_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan14_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan2_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan5_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan8_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan12_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan3_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan6_input
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan10_input
tacuser@fenderbmc:~#

tacuser@fenderbmc:~# ls -ls /sys/class/hwmon/hwmon0/
     0 lrwxrwxrwx    1 tacuser  root             0 Jan  1  1970 device -> .=
./../../1e786000.pwm-tacho-controller
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan10_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan11_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan12_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan13_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan14_input
     0 -r--r--r--    1 tacuser  root          4096 Jan  1  1970 fan1_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan2_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan3_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan4_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan5_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan6_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan7_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan8_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 fan9_input
     0 -r--r--r--    1 tacuser  root          4096 Apr 15 17:24 name
     0 lrwxrwxrwx    1 tacuser  root             0 Jan  1  1970 of_node -> =
../../../../../../../firmware/devicetree/base/ahb/apb/pwm-tacho-controller@=
1e786000
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm1
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm2
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm3
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm4
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm5
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm6
     0 -rw-r--r--    1 tacuser  root          4096 Apr 15 17:45 pwm7
     0 lrwxrwxrwx    1 tacuser  root             0 Jan  1  1970 subsystem -=
> ../../../../../../../class/hwmon
     0 -rw-r--r--    1 tacuser  root          4096 Jan  1  1970 uevent
tacuser@fenderbmc:~#

tacuser@fenderbmc:~# cat /etc/default/obmc/hwmon/ahb/apb/pwm-tacho-controll=
er@1e786000.conf
# Fender has 7 fan modules with two fans in each module
LABEL_fan1 =3D "fanA0"
LABEL_fan2 =3D "fanA1"
LABEL_fan3 =3D "fanB0"
LABEL_fan4 =3D "fanB1"
LABEL_fan5 =3D "fanC0"
LABEL_fan6 =3D "fanC1"
LABEL_fan7 =3D "fanD0"
LABEL_fan8 =3D "fanD1"
LABEL_fan9 =3D "fanE0"
LABEL_fan10 =3D "fanE1"
LABEL_fan11 =3D "fanF0"
LABEL_fan12 =3D "fanF2"
LABEL_fan13 =3D "fanG0"
LABEL_fan14 =3D "fanG1"

PWM_TARGET_1 =3D "fanA"
PWM_TARGET_2 =3D "fanB"
PWM_TARGET_3 =3D "fanC"
PWM_TARGET_4 =3D "fanD"
PWM_TARGET_5 =3D "fanE"
PWM_TARGET_6 =3D "fanF"
PWM_TARGET_7 =3D "fanG"
tacuser@fenderbmc:~#

tacuser@fenderbmc:/sys/devices/platform/ahb/ahb:apb/1e786000.pwm-tacho-cont=
roller/hwmon/hwmon0# ls
device       fan11_input  fan13_input  fan1_input   fan3_input   fan5_input=
   fan7_input   fan9_input   of_node      pwm2         pwm4         pwm6   =
      subsystem
fan10_input  fan12_input  fan14_input  fan2_input   fan4_input   fan6_input=
   fan8_input   name         pwm1         pwm3         pwm5         pwm7   =
      uevent
tacuser@fenderbmc:/sys/devices/platform/ahb/ahb:apb/1e786000.pwm-tacho-cont=
roller/hwmon/hwmon0#<mailto:tacuser@fenderbmc:/sys/devices/platform/ahb/ahb=
:apb/1e786000.pwm-tacho-controller/hwmon/hwmon0#>




--_000_CY4PR17MB165329ED7931C3A9CA86E816964D9CY4PR17MB1653namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am newbie with the OpenBMC.&nbsp; We are porting O=
penBMC for a platform which has 7 fan modules with two fans in each module.=
&nbsp; I defined the
<a href=3D"mailto:pwm-tacho-controller@1e786000.conf">pwm-tacho-controller@=
1e786000.conf</a>, and when I run it, I see the following errors from the f=
ansenor service.&nbsp; Here I pasted logs from the service, my conf file an=
d other important information.&nbsp; I did not
 understand why the service is giving these errors.&nbsp; Appreciate your h=
elp. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~# journalctl -u xyz.openbmc_project.fansensor.service<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
-- Logs begin at Thu 1970-01-01 00:00:08 UTC, end at Thu 2021-04-15 17:26:2=
8 UTC. --<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:24 fenderbmc systemd[1]: Started Fan Sensor.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan9_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan13_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan1_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan4_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan7_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan11_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan14_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan2_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan5_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan8_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan12_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan3_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan6_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Apr 15 17:24:27 fenderbmc fansensor[306]: failed to find match for /sys/cla=
ss/hwmon/hwmon0/fan10_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~# ls -ls /sys/class/hwmon/hwmon0/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
 Jan&nbsp; 1&nbsp; 1970 device -&gt; ../../../1e786000.pwm-tacho-controller=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an10_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4096 Apr 15 17:24 f=
an11_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an12_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an13_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an14_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Jan&nbsp; 1&nb=
sp; 1970 fan1_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an2_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an3_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp; &nbsp;1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an4_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an5_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an6_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an7_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an8_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser &nbsp;roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 f=
an9_input<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -r--r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:24 n=
ame<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
 Jan&nbsp; 1&nbsp; 1970 of_node -&gt; ../../../../../../../firmware/devicet=
ree/base/ahb/apb/pwm-tacho-controller@1e786000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm5<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Apr 15 17:45 p=
wm7<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
 Jan&nbsp; 1&nbsp; 1970 subsystem -&gt; ../../../../../../../class/hwmon<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp; 0 -rw-r--r--&nbsp;&nbsp;&nbsp; 1 tacuser&nbsp; roo=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096 Jan&nbsp; 1&nb=
sp; 1970 uevent<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~# cat /etc/default/obmc/hwmon/ahb/apb/pwm-tacho-controll=
er@1e786000.conf<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
# Fender has 7 fan modules with two fans in each module<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan1 =3D &quot;fanA0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan2 =3D &quot;fanA1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan3 =3D &quot;fanB0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan4 =3D &quot;fanB1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan5 =3D &quot;fanC0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan6 =3D &quot;fanC1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan7 =3D &quot;fanD0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan8 =3D &quot;fanD1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan9 =3D &quot;fanE0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan10 =3D &quot;fanE1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan11 =3D &quot;fanF0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan12 =3D &quot;fanF2&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan13 =3D &quot;fanG0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
LABEL_fan14 =3D &quot;fanG1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_1 =3D &quot;fanA&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_2 =3D &quot;fanB&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_3 =3D &quot;fanC&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_4 =3D &quot;fanD&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_5 =3D &quot;fanE&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_6 =3D &quot;fanF&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PWM_TARGET_7 =3D &quot;fanG&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:~#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
tacuser@fenderbmc:/sys/devices/platform/ahb/ahb:apb/1e786000.pwm-tacho-cont=
roller/hwmon/hwmon0# ls<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan11_input&nbsp; fan13_input&nb=
sp; fan1_input&nbsp;&nbsp; fan3_input&nbsp;&nbsp; fan5_input&nbsp;&nbsp; fa=
n7_input&nbsp;&nbsp; fan9_input&nbsp;&nbsp; of_node&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; pwm2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm4&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; subsystem<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
fan10_input&nbsp; fan12_input&nbsp; fan14_input&nbsp; fan2_input&nbsp;&nbsp=
; fan4_input&nbsp;&nbsp; fan6_input&nbsp;&nbsp; fan8_input&nbsp;&nbsp; name=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm1&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; pwm3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pwm5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm7&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uevent<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<a href=3D"mailto:tacuser@fenderbmc:/sys/devices/platform/ahb/ahb:apb/1e786=
000.pwm-tacho-controller/hwmon/hwmon0#"><span style=3D"color:windowtext;tex=
t-decoration:none">tacuser@fenderbmc:/sys/devices/platform/ahb/ahb:apb/1e78=
6000.pwm-tacho-controller/hwmon/hwmon0#</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY4PR17MB165329ED7931C3A9CA86E816964D9CY4PR17MB1653namp_--
