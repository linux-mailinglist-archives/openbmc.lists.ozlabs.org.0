Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAB2CE276
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 00:15:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnBWR3pQFzDrL7
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 10:14:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.223.86; helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=naveenkrishna.chatradhi@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=G+cMQEGR; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn3gk1ctqzDqnc
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 05:06:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Em3Z6lIHpe/XTFIRA7uIwYUHPKEy773CkW+EUqQLaohxxeqkwbCYtBUe4EFs5OISBP6rHSszNSDyxSFYQS8E1dg1w3Sq5SD+8c9u7ikxaAz7PZJCPjkXzaSouRVRgTkt1dtrc6rsVz8edp5k+utZY+c/KF1tqXrmRUTeIXl9faP0U4ReFP6xu2SyhClrM5zvOX2mTvkWXVP7V+CXXwmhcsNJ71aZYm0k6caVvHgZeND4orl91X2mpyMNxyVmIK08/RL4O6JG2JKfiX41pJ3x293IBmNM6DumO2XEKsgxErkSkfejNYFAFlGXHl3NE5LNo3hzri3YKtA9qGgeR+Q7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1ZZfJXRgaGDWaiApY53ouJPtB4wwuANqPMjwWN+fXY=;
 b=EQ51/EqyK9IspipNFkAgzAOiSrgLxwTCHFglEOpr9D6GXQB1KqzPee/cynr7tNNVaAT24znXKosYieQIs+AC0XuGpfUv8cfjgekV7puhP3U7aLu18oDakmhnWscBTq98wXHTnc3v6e0oMEzYLKONjGeSL6MnCjvM/5Fzxx/FVrqTzddCDihi87VTVQVeO/ur5r7G1t7zEqRs6QMqLrGtpvhTuO9i4qLs5PEq2sOEOo4/YI0jlHAwodca+9VLqRZJfyN60d4hWw6+Bgqu5vXQwMT2f37h3Kv0A7lx8FqQojWFJJSCiQLaStrzmp9+v4H9z/CWrj0jcCpQksf2erTsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1ZZfJXRgaGDWaiApY53ouJPtB4wwuANqPMjwWN+fXY=;
 b=G+cMQEGRqxamjhYe0DnA55064CFNxLAaRDzdMofcxcZBw2VAo/Erew3N61BA0b8Cdr4hUs3PVbn4C59y52grA7Jep/f+RiuYoa7JlWdZh0L6vu+7HHEuWxOHWbEJu48gH1XwJscL3/hxSqM/3Xt2o7my09GfQgRUS6ztgHYBao0=
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10)
 by DM6PR12MB2860.namprd12.prod.outlook.com (2603:10b6:5:186::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 3 Dec
 2020 18:06:33 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::84e9:dd44:12cf:bdb3%5]) with mapi id 15.20.3632.017; Thu, 3 Dec 2020
 18:06:33 +0000
From: "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To: Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>
Subject: RE: [PATCH linux hwmon-next v4 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
Thread-Topic: [PATCH linux hwmon-next v4 1/3] hwmon: (sbtsi) Add basic support
 for SB-TSI sensors
Thread-Index: AQHWyMw1IC1MufJpokeZkSbSjJS++qnkmDcAgAEMshA=
Date: Thu, 3 Dec 2020 18:06:33 +0000
Message-ID: <DM6PR12MB4388BC99671A1B82F811A549E8F20@DM6PR12MB4388.namprd12.prod.outlook.com>
References: <20201202165601.1532213-1-kunyi@google.com>
 <20201202165601.1532213-2-kunyi@google.com>
 <20201203013748.GA228752@roeck-us.net>
In-Reply-To: <20201203013748.GA228752@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Enabled=true;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SetDate=2020-12-03T18:06:25Z; 
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Method=Privileged;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_Name=Internal Use Only -
 Restricted;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ActionId=6d6d0bd5-ebd9-43fa-abe0-0000c002b5ef;
 MSIP_Label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-12-03T18:06:16Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 3cda2a79-0f09-4180-8058-0000a2895855
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_enabled: true
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_setdate: 2020-12-03T18:06:28Z
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_method: Privileged
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_name: Internal Use Only -
 Restricted
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_actionid: 001c4cdd-ba81-4cca-bda3-00004659d718
msip_label_c3918902-4ff3-42f6-8eb5-e5d9c71daf16_contentbits: 0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=amd.com;
x-originating-ip: [175.101.104.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec1fcf04-875a-4c83-23dc-08d897b62b34
x-ms-traffictypediagnostic: DM6PR12MB2860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB286097B95D527C8019F04046E8F20@DM6PR12MB2860.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T9PzUPP+a8qvtp6eIj0aHEjKNVWj2+P9RQ5nWvZfAkbmAMi3cVvEDlAXeBG4pihZi5PEmIgUKMLwqqCJ3kMQRGdTBgJ3VWmJwhbiMJLm94TR2rGld7brSSkOENrzROb/rN82hWXPLdxbJcEQEs8DblkgaTAMhDarE6yDQMAVWEHkMXzThxZ7ry2LB0bLpVDcMi6D0OvQbK6nlJ2Y7bRGH3og4ujK7T1llEaTJBk9RgmDGjoVdih6+aca+exLK9Z7Co+3M1LMyuFDIH/3qX30aUxpAOtHb5cZG7Ev2PsWYYTDrEuQmu72/13C9fWlqiH5BUoY+JyaSnwxMWSPt41Wn975z3k4myAaKRCqFf74/owGq05qiqG9ywm92yE502xEz5iO/UDp0GspuVVFlt+jFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4388.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(4326008)(52536014)(83380400001)(9686003)(7696005)(45080400002)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(186003)(478600001)(8676002)(6506007)(53546011)(2906002)(26005)(8936002)(966005)(33656002)(110136005)(54906003)(316002)(5660300002)(71200400001)(86362001)(30864003)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BEn+EhPL5+79qS0jhacoe9SlZ3yNbT6OIl0mhNn8otRGdWvkx2hBGypzVg4R?=
 =?us-ascii?Q?17bPgjrKOHMdQLVgEgBWuubihejirsorKpgrtVRI5s/2JWni0nk1mMJLhbad?=
 =?us-ascii?Q?7mlmW5w1IFgotw9eBZGdjWHwjYm6ydSip+KLiQPNZE27GF9R26rRqP1Zp0QA?=
 =?us-ascii?Q?WSH3P4nhLZ85Ujbsl4JSYrdKe/eS3kn2/gXz2BdLrrvG3a8wtxN8qt6bgAos?=
 =?us-ascii?Q?B+NOBnDnVuhKNam4YhfIpiDwBjNuN4Kr/UUTYjntHW1vYpw9tw9W2lVzMOUV?=
 =?us-ascii?Q?hfaGp7PIqTHSG9zIXfxoTL4/jBHLnRgOpk1pynqvBGTeCG5kbo8+pzWLVsIm?=
 =?us-ascii?Q?DgczbjI8xd5SEtn/KO5IZ+Sq3bY9UtEmsztew4miXfPRzv/a0qFVQ5vFbq63?=
 =?us-ascii?Q?lD+wiDfgP1W60dzVou/oukKZ8ETaO8qa+Ds4bAE3DLU20baJH/7g/tcEBXBi?=
 =?us-ascii?Q?22G+aCx/tavf7LaNJhYDh2aXG/7fz8Ie0jooJD62YhUwJAI6KmG6LPLcs8+q?=
 =?us-ascii?Q?KSz1I9e1SCJWgVsx6Ofc2mCGuY9tCwaQOt9UCNLxlOl5D7z+2O9wbhkWpHSR?=
 =?us-ascii?Q?T0z6fq+tmgALzpvqMevavQswVVlcS+JtVm+Da1UAuhtOYHlAo68yt6utT11T?=
 =?us-ascii?Q?+K5NOzPWMnKVv5aVNw9qxi+PVpMZUiMgsgaqxvDa9F4CT9JtCHS5h4n2kBrB?=
 =?us-ascii?Q?+XyE+TrMKfPwg11pLZ6bfW8tJOdRo08r7KTnfeS11fbYR4SLboti/fm1jJfF?=
 =?us-ascii?Q?+G2mWq4IDwtLC+YptJFAJA+o197PbIAvdn2KMmfK1yOcUTPTTWA7LKM2agDG?=
 =?us-ascii?Q?ArrgqhVRZwd8SqJTACCv+yaaWd6EyRy5mPgtPjlL8dJmCwiHUcPF65LOJJ8o?=
 =?us-ascii?Q?T0e2HW2+g/HAs0RhFggHJq1pSUqVUTdJteTr5e0oeahHks7B3mA78hJKf1r4?=
 =?us-ascii?Q?vu46Q2prJuZzjtjStYDOeNSDIjtDu/rrEOEw/XBm8m4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1fcf04-875a-4c83-23dc-08d897b62b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 18:06:33.6589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FZbIwrWLUgMZgy3ZUuLmGMIn5lLK+OA8AwoPwoKKrMbDkc/Uqi4Bbbhb0bBOL3CTv76HPUwfOiIsp9Q1LbBMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2860
X-Mailman-Approved-At: Fri, 04 Dec 2020 10:14:15 +1100
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "Venkatesh,
 Supreeth" <Supreeth.Venkatesh@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[AMD Official Use Only - Approved for External Use]

Hi Kun Yi,

> Test status: tested reading temp1_input, and reading/writing=20
> temp1_max/min.

Tested the above at our end from an arm based BMC connected to the 2P Rome =
machine, it works fine.=20

Regards,
Naveenk

-----Original Message-----
From: Guenter Roeck <linux@roeck-us.net>=20
Sent: Thursday, December 3, 2020 7:08 AM
To: Kun Yi <kunyi@google.com>
Cc: jdelvare@suse.com; robh+dt@kernel.org; mark.rutland@arm.com; Venkatesh,=
 Supreeth <Supreeth.Venkatesh@amd.com>; openbmc@lists.ozlabs.org; linux-hwm=
on@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.or=
g
Subject: Re: [PATCH linux hwmon-next v4 1/3] hwmon: (sbtsi) Add basic suppo=
rt for SB-TSI sensors

[CAUTION: External Email]

On Wed, Dec 02, 2020 at 08:55:59AM -0800, Kun Yi wrote:
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible=20
> interface that reports AMD SoC's Ttcl (normalized temperature), and=20
> resembles a typical 8-pin remote temperature sensor's I2C interface to=20
> BMC.
>
> This commit adds basic support using this interface to read CPU=20
> temperature, and read/write high/low CPU temp thresholds.
>
> To instantiate this driver on an AMD CPU with SB-TSI support, the i2c=20
> bus number would be the bus connected from the board management=20
> controller (BMC) to the CPU. The i2c address is specified in Section=20
> 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for socket 0=20
> and 90h for socket 1, but it could vary based on hardware address=20
> select pins.
>
> [1]:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> amd.com%2Fsystem%2Ffiles%2FTechDocs%2F56255_OSRR.pdf&amp;data=3D04%7C01%
> 7CNaveenKrishna.Chatradhi%40amd.com%7C1a8cb0ebe4bb43bc759808d8972c562f
> %7C3dd8961fe4884e608e11a82d994e183d%7C0%7C1%7C637425563976853035%7CUnk
> nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw
> iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoH5YmE000EUVGVxruzI%2FBRnWOKptlG%2Bpf
> yKferIwYME%3D&amp;reserved=3D0
>
> Test status: tested reading temp1_input, and reading/writing=20
> temp1_max/min.
>
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/sbtsi_temp.c | 265=20
> +++++++++++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/hwmon/sbtsi_temp.c
>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index=20
> 3c059fc23cd6..3d6a809700ae 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1522,6 +1522,16 @@ config SENSORS_SL28CPLD
>         This driver can also be built as a module.  If so, the module
>         will be called sl28cpld-hwmon.
>
> +config SENSORS_SBTSI
> +     tristate "Emulated SB-TSI temperature sensor"
> +     depends on I2C
> +     help
> +       If you say yes here you get support for emulated temperature
> +       sensors on AMD SoCs with SB-TSI interface connected to a BMC devi=
ce.
> +
> +       This driver can also be built as a module. If so, the module will
> +       be called sbtsi_temp.
> +
>  config SENSORS_SHT15
>       tristate "Sensiron humidity and temperature sensors. SHT15 and comp=
at."
>       depends on GPIOLIB || COMPILE_TEST diff --git=20
> a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index=20
> 01ca5d3fbad4..ee8c037919da 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -160,6 +160,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  +=3D powr1220.o
>  obj-$(CONFIG_SENSORS_PWM_FAN)        +=3D pwm-fan.o
>  obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)      +=3D raspberrypi-hwmon.o
>  obj-$(CONFIG_SENSORS_S3C)    +=3D s3c-hwmon.o
> +obj-$(CONFIG_SENSORS_SBTSI)  +=3D sbtsi_temp.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+=3D sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)        +=3D sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)        +=3D sch5636.o
> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c=20
> new file mode 100644 index 000000000000..6b0a7b9df1f3
> --- /dev/null
> +++ b/drivers/hwmon/sbtsi_temp.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (S=
B-TSI)
> + *                compliant AMD SoC temperature device.
> + *
> + * Copyright (c) 2020, Google Inc.
> + * Copyright (c) 2020, Kun Yi <kunyi@google.com>  */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT"=20
> +registers are
> + * the integer part of a temperature value or limit, and "_DEC"=20
> +registers are
> + * corresponding decimal parts.
> + */
> +#define SBTSI_REG_TEMP_INT           0x01 /* RO */
> +#define SBTSI_REG_STATUS             0x02 /* RO */
> +#define SBTSI_REG_CONFIG             0x03 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_INT              0x07 /* RW */
> +#define SBTSI_REG_TEMP_LOW_INT               0x08 /* RW */
> +#define SBTSI_REG_TEMP_DEC           0x10 /* RW */
> +#define SBTSI_REG_TEMP_HIGH_DEC              0x13 /* RW */
> +#define SBTSI_REG_TEMP_LOW_DEC               0x14 /* RW */
> +
> +#define SBTSI_CONFIG_READ_ORDER_SHIFT        5
> +
> +#define SBTSI_TEMP_MIN       0
> +#define SBTSI_TEMP_MAX       255875
> +
> +/* Each client has this additional data */ struct sbtsi_data {
> +     struct i2c_client *client;
> +     struct mutex lock;
> +};
> +
> +/*
> + * From SB-TSI spec: CPU temperature readings and limit registers=20
> +encode the
> + * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
> + * register encodes the base-2 of the integer portion, and the upper=20
> +3 bits of
> + * the "low byte" encode in base-2 the decimal portion.
> + *
> + * e.g. INT=3D0x19, DEC=3D0x20 represents 25.125 degrees Celsius
> + *
> + * Therefore temperature in millidegree Celsius =3D
> + *   (INT + DEC / 256) * 1000 =3D (INT * 8 + DEC / 32) * 125
> + */
> +static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal) {
> +     return ((integer << 3) + (decimal >> 5)) * 125; }
> +
> +/*
> + * Inversely, given temperature in millidegree Celsius
> + *   INT =3D (TEMP / 125) / 8
> + *   DEC =3D ((TEMP / 125) % 8) * 32
> + * Caller have to make sure temp doesn't exceed 255875, the max valid va=
lue.
> + */
> +static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8=20
> +*decimal) {
> +     temp /=3D 125;
> +     *integer =3D temp >> 3;
> +     *decimal =3D (temp & 0x7) << 5;
> +}
> +
> +static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
> +                   u32 attr, int channel, long *val) {
> +     struct sbtsi_data *data =3D dev_get_drvdata(dev);
> +     s32 temp_int, temp_dec;
> +     int err, reg_int, reg_dec;
> +     bool reading_input;
> +
> +     if (type !=3D hwmon_temp)
> +             return -EINVAL;

Unnecessary check.

> +
> +     reading_input =3D false;
> +     switch (attr) {
> +     case hwmon_temp_input:
> +             reading_input =3D true;
> +             /*
> +              * ReadOrder bit specifies the reading order of integer and
> +              * decimal part of CPU temp for atomic reads. If bit =3D=3D=
 0,
> +              * reading integer part triggers latching of the decimal pa=
rt,
> +              * so integer part should be read first. If bit =3D=3D 1, r=
ead
> +              * order should be reversed.
> +              */
> +             err =3D i2c_smbus_read_byte_data(data->client, SBTSI_REG_CO=
NFIG);
> +             if (err < 0)
> +                     return err;
> +
> +             mutex_lock(&data->lock);
> +             if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
> +                     temp_dec =3D i2c_smbus_read_byte_data(data->client,
> +                                                         SBTSI_REG_TEMP_=
DEC);
> +                     temp_int =3D i2c_smbus_read_byte_data(data->client,
> +                                                         SBTSI_REG_TEMP_=
INT);
> +             } else {
> +                     temp_int =3D i2c_smbus_read_byte_data(data->client,
> +                                                         SBTSI_REG_TEMP_=
INT);
> +                     temp_dec =3D i2c_smbus_read_byte_data(data->client,
> +                                                         SBTSI_REG_TEMP_=
DEC);
> +             }
> +             mutex_unlock(&data->lock);
> +             break;
> +     case hwmon_temp_max:
> +             reg_int =3D SBTSI_REG_TEMP_HIGH_INT;
> +             reg_dec =3D SBTSI_REG_TEMP_HIGH_DEC;
> +             break;
> +     case hwmon_temp_min:
> +             reg_int =3D SBTSI_REG_TEMP_LOW_INT;
> +             reg_dec =3D SBTSI_REG_TEMP_LOW_DEC;
> +             break;
> +     default:
> +             return -EINVAL;
> +     }
> +
> +     if (!reading_input) {
> +             temp_int =3D i2c_smbus_read_byte_data(data->client, reg_int=
);
> +             temp_dec =3D i2c_smbus_read_byte_data(data->client, reg_dec=
);
> +     }

This adds unnecessary complexity. I would suggest to move the calls to the =
case statements and drop reading_input as well as reg_int, reg_dec.

Also, I just realized that the mutex is needed here as well, since the valu=
es might be written while being read, which could result in inconsistent re=
ad values. Example: Limit is changed from 100 to 99.75.
Since the integer value is written first, it is possible that 99.0 is retur=
ned.

> +
> +     if (temp_int < 0)
> +             return temp_int;
> +     if (temp_dec < 0)
> +             return temp_dec;
> +
> +     *val =3D sbtsi_reg_to_mc(temp_int, temp_dec);
> +
> +     return 0;
> +}
> +
> +static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
> +                    u32 attr, int channel, long val) {
> +     struct sbtsi_data *data =3D dev_get_drvdata(dev);
> +     int reg_int, reg_dec, err;
> +     u8 temp_int, temp_dec;
> +
> +     if (type !=3D hwmon_temp)
> +             return -EINVAL;

This check is really unnecessary.

> +
> +     switch (attr) {
> +     case hwmon_temp_max:
> +             reg_int =3D SBTSI_REG_TEMP_HIGH_INT;
> +             reg_dec =3D SBTSI_REG_TEMP_HIGH_DEC;
> +             break;
> +     case hwmon_temp_min:
> +             reg_int =3D SBTSI_REG_TEMP_LOW_INT;
> +             reg_dec =3D SBTSI_REG_TEMP_LOW_DEC;
> +             break;
> +     default:
> +             return -EINVAL;
> +     }
> +
> +     val =3D clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
> +     mutex_lock(&data->lock);
> +     sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
> +     err =3D i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
> +     if (err)
> +             goto exit;
> +
> +     err =3D i2c_smbus_write_byte_data(data->client, reg_dec,=20
> +temp_dec);
> +exit:
> +     mutex_unlock(&data->lock);
> +     return err;
> +}
> +
> +static umode_t sbtsi_is_visible(const void *data,
> +                             enum hwmon_sensor_types type,
> +                             u32 attr, int channel) {
> +     switch (type) {
> +     case hwmon_temp:
> +             switch (attr) {
> +             case hwmon_temp_input:
> +                     return 0444;
> +             case hwmon_temp_min:
> +                     return 0644;
> +             case hwmon_temp_max:
> +                     return 0644;
> +             }
> +             break;
> +     default:
> +             break;
> +     }
> +     return 0;
> +}
> +
> +static const struct hwmon_channel_info *sbtsi_info[] =3D {
> +     HWMON_CHANNEL_INFO(chip,
> +                        HWMON_C_REGISTER_TZ),
> +     HWMON_CHANNEL_INFO(temp,
> +                        HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
> +     NULL
> +};
> +
> +static const struct hwmon_ops sbtsi_hwmon_ops =3D {
> +     .is_visible =3D sbtsi_is_visible,
> +     .read =3D sbtsi_read,
> +     .write =3D sbtsi_write,
> +};
> +
> +static const struct hwmon_chip_info sbtsi_chip_info =3D {
> +     .ops =3D &sbtsi_hwmon_ops,
> +     .info =3D sbtsi_info,
> +};
> +
> +static int sbtsi_probe(struct i2c_client *client,
> +                    const struct i2c_device_id *id) {
> +     struct device *dev =3D &client->dev;
> +     struct device *hwmon_dev;
> +     struct sbtsi_data *data;
> +
> +     data =3D devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
> +     if (!data)
> +             return -ENOMEM;
> +
> +     data->client =3D client;
> +     mutex_init(&data->lock);
> +
> +     hwmon_dev =3D
> +             devm_hwmon_device_register_with_info(dev, client->name,=20
> + data,

Line length limit is now 100 columns, so the above line split is unnecessar=
y.

> +                                                  &sbtsi_chip_info,=20
> + NULL);
> +
> +     return PTR_ERR_OR_ZERO(hwmon_dev); }
> +
> +static const struct i2c_device_id sbtsi_id[] =3D {
> +     {"sbtsi", 0},
> +     {}
> +};
> +MODULE_DEVICE_TABLE(i2c, sbtsi_id);
> +
> +static const struct of_device_id __maybe_unused sbtsi_of_match[] =3D {
> +     {
> +             .compatible =3D "amd,sbtsi",
> +     },
> +     { },
> +};
> +MODULE_DEVICE_TABLE(of, sbtsi_of_match);
> +
> +static struct i2c_driver sbtsi_driver =3D {
> +     .class =3D I2C_CLASS_HWMON,
> +     .driver =3D {
> +             .name =3D "sbtsi",
> +             .of_match_table =3D of_match_ptr(sbtsi_of_match),
> +     },
> +     .probe =3D sbtsi_probe,
> +     .id_table =3D sbtsi_id,
> +};
> +
> +module_i2c_driver(sbtsi_driver);
> +
> +MODULE_AUTHOR("Kun Yi <kunyi@google.com>"); MODULE_DESCRIPTION("Hwmon=20
> +driver for AMD SB-TSI emulated sensor"); MODULE_LICENSE("GPL");
> --
> 2.29.2.454.gaff20da3a2-goog
>
