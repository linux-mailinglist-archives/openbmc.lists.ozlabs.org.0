Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17543816C
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 04:26:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HblTd33myz3cBy
	for <lists+openbmc@lfdr.de>; Sat, 23 Oct 2021 13:26:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=EmD61+TH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febd::719;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=EmD61+TH; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HblT32Dywz2ynV
 for <openbmc@lists.ozlabs.org>; Sat, 23 Oct 2021 13:26:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOdJk+x1fZh7pdFzzew1BtRWF2o7iOAuQ60UUPOwV1KnEFtiaMfVsNLKdjiwNWwbUV1zKwSIoG8vw1SytsqRvqsd+7L60ywnHXpQBgem/Gh3qMx5xWLtYrE2muzOiaF6h1D9QZUzxDueixZNRbwAyNLuImmqipd8322us0QcrcMO/hLzVyh8ygyE9Ihuon0uknrHPJgvzxqWFSalDbw8DDqcpxVz798LiirNL4PGsYy3awHacq1Nh/cGnfBorINyYMEOnE3YhTWXKRDHicRLP0D/PTMiL1ZLZvM48TZ1Bj7lguoX1m3aQeVc1sbvVstFt4bKZd9Nlc5TxeIzlobvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W82JOdRxUk9LfDhG8+MvaQyQQBIqHaabAxCpSFRCwc=;
 b=YZ4z142EWKqkOqiU9V6BAfUfrNPcnKAqUTWkNUsmIz5GGQmzxDoLNwssZ9K8cPTlji/TUO9ucJ9PJtdKsQopzorllU1yN+TReBu3frUR8udXp0z2r6gtIkybNyP1kF7t/a9RV87AIFxm3BZ+mCwr5kq68URm82KbW8YZ3q/KW3mzOpQMpNxsCm5NY5YeJ8blDWfygJgV2TJ70X6Ta8xsPUDMpa7TK14UtZHZ9D1cXIT7JgUhGLRddY7RQalygqOcsuWyyiN4UwwznFj/t/r7+4yBtL3Qy4/VHVo9vAR8mAfDlDupu9OmaeQf5R+NXz7T+tra/jqEicLMvHkNPw6zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W82JOdRxUk9LfDhG8+MvaQyQQBIqHaabAxCpSFRCwc=;
 b=EmD61+THGfazgpPwJgS/V8Hludh3aQmsIyGBvNtBmtDEsR3AtGigTjQ+6LszO1L8W3D+mCa98EP4faPZ/dS9lWuyHK1qnbY5l3TW0DYU8pI7XGTFWCRxRhnR2PUMGRV1g762pKbznXeEKdfxsp6H93b85fbzOlO943KZLpw8ifIvQBEhWeMTQNxhpWgeDyRWa9dzsBQsF449otYFIFhHuSHQ3ls7ZOvOWtVRQDz3FsL1xrD5bWHYDj4fGP8byjnVqcadso2vRfC0bFRIO3Fji/9JFBRrsf937vr6hjbDxa9k+JkrBJdYnYMrjXj2VfyKToSN2ABeZpdf88dAmJV31Q==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3571.apcprd06.prod.outlook.com (2603:1096:202:36::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 02:25:47 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::68a9:3f18:dfe4:273f%7]) with mapi id 15.20.4628.018; Sat, 23 Oct 2021
 02:25:47 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.u>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [RFC PATCH] ARM: aspeed: Add secure boot controller support
Thread-Topic: [RFC PATCH] ARM: aspeed: Add secure boot controller support
Thread-Index: AQHXxMA0xHPmQnbIv0iYGqsucP2KJqvf4PiA
Date: Sat, 23 Oct 2021 02:25:47 +0000
Message-ID: <HK0PR06MB338007D70ADB863A05630A54F2819@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20211019080608.283324-1-joel@jms.id.au>
In-Reply-To: <20211019080608.283324-1-joel@jms.id.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8108719e-fd6f-4319-9cbf-08d995cc6c6f
x-ms-traffictypediagnostic: HK2PR06MB3571:
x-microsoft-antispam-prvs: <HK2PR06MB3571A33BFE9DEB04DD9C16DAF2819@HK2PR06MB3571.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yp9ZGx1ouatdgDCWGUhdwjcZNBLgheyfimBZLeI+deWdOS5/DagSqCcZIdH7mCcES4IdftKuU8k/Y1m1jlMTOULEE73eIgItnkkZIr1P9HchkzQFPxMAiiD5uMl61CbbaKWqHhnrB5KbLeUrcOz4sYL1zMg1xcFZCAtReaPZF9NPI456/TLF5GlHlRuJU16ferHXdAeGu2q0q7MnkkIuPtMKEZekwO0jQEMsl7NWgRXYxIQjDPFDFs6p9NtLvsBr4uSxkK+2TVDefsYxHlCYn631v6KObIOnQzyV/ck7/Ici2h8XXkWM8uwITwebGq3C7kcJ3OFwvJroiOC4jmETdq9I6uUiT+I2dpTe0lm1a4qqfEF1IPtVBrGZVy5E96kKAg7txyTWQqhIlBZlynKrG+zGrOqtv1UfAG/8QElOExVSz/4ylrMsU068RrUCkAA0t2J/tbpoR2yvlSfcRDGIXc6+iDQ1QQ7wczqJX7I2lwm2FraHzPc/hn7Yex+R/JJ43Q+lQ4IOigG5UoI//RfodiTBmWOE7CJSx1XNZeI5ribTDLLA63aaEVxr1BMKR2L9vcgFxUVpZatl3qTZwSbtSDlR9FkLJdwaDPaG/3iCrsPpDB1+La7gYvXfV8JQ4tGqfXmB+e7lJrKNUzMUVO2ZG0MIMVpX7xRfJtvIsAHYj3G7rNpkQWgcTJlak0LycDehTJiBnWdxHaByC78INCGcXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(366004)(346002)(396003)(39830400003)(186003)(5660300002)(53546011)(38100700002)(508600001)(6506007)(7696005)(66556008)(71200400001)(8676002)(122000001)(83380400001)(64756008)(26005)(66446008)(55016002)(33656002)(76116006)(9686003)(66476007)(2906002)(86362001)(38070700005)(66946007)(8936002)(316002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A5doVzyeItQWaD8cmYGG16AT0w+Yqp3CQwK8YSqZgtZiMFl/nnBZJbsVT+GT?=
 =?us-ascii?Q?Zv6QGX8/AQ7Z4X4J8kMSR9OnI0Z/T6wDZpEw1uDSFAGgRxJubO3uNJfoajos?=
 =?us-ascii?Q?8SkPDkL/HY/QPkrUIjqb5wwAXJcSBAJ0UyfU8ZNfHWYw7+YIpnHDOwWAoNFK?=
 =?us-ascii?Q?zsJir5T6HgeZUuwomf4vJqZuhLs4mwzX8B+b1NXo/g4fTJ3vAWHCQgLOA/PB?=
 =?us-ascii?Q?w8R0wrwpVkbAvjn8ZNTLyhmhQNtCcDSPt0nB3VO9Ysg25VFddZWT8ftw2L5X?=
 =?us-ascii?Q?GRhHM/Gh6HtMAZKM2Rc4P0aRLxPgUr9butb9Sd/ax+M8mjb1yjqZBfodI3HR?=
 =?us-ascii?Q?WAPJ8kIv4K0ROrkkW/LQHAk1xLAHGKJ97H2wqkATdze0Mqdni8HGustGIviC?=
 =?us-ascii?Q?40drhYutcSKRfPepYF2E7YARjZ6cUwgUGlSSoxXWCJRozKKogBkxnK+oLebv?=
 =?us-ascii?Q?/oAj1dn9I3KzYJ13UbiiqJRXqSLHuQfdzwqRdDv0xRlXuLuSeW9Ifwc3ruuL?=
 =?us-ascii?Q?Wv9PSSQ0um+TZi9inl2vmiVK+/Yo/RAfqtdLwNHGg7j0/kpQql3Z2+AXo7bt?=
 =?us-ascii?Q?VEIZV/MuuKhhO4KF7PNiYfLQ3I8FW0Gn+67ZaPgUcRtWOH3tqldJLeX+RFTU?=
 =?us-ascii?Q?4okj7+5q9JE0lC76GPsH6YsnHP52VuNhM8IPIggDDGEGaYp1FO3U5CGhE0Tm?=
 =?us-ascii?Q?ivhxuNRhiQmOilWK1N/atcd+6ojmNxwMTDN32aAqFnoCitMrCeQkH0x0rym7?=
 =?us-ascii?Q?KIxAOCRV1cORzjlKr8ZdG8sGlNBYyDE51nytd6hzKOSBxKCT7Eq+c9phg16e?=
 =?us-ascii?Q?tE03t1WMbi/qyX/EJpa/918bhAig8ogtEFDO63UXN1kmSj8rXMnjNnpKZKdy?=
 =?us-ascii?Q?elquTG1dtsP0iuNLkjSZ6Nn2aJrQ6eKWG1X/XjhvL4lXIzYUop74zeQP6MzI?=
 =?us-ascii?Q?1C4cp31B+qmbKerYtnZw6mKVZgDYyLYcEcSalIVGrrCZ4PwgCZofyGL90h0P?=
 =?us-ascii?Q?Nf8LMf6B55QctsD/JbBHF5H55RyS0VwTsfTIdrrdcvohQbuRTJ07b3DhLHFg?=
 =?us-ascii?Q?G4wp0E3saqC2iO/KGUHhHI60dNbBoqh+lf4EvuAdDDtrW51PgVFAjkKPS8/m?=
 =?us-ascii?Q?ALvFSftcYDsNZUMypmUuLTau+1tZseOSxs7PyEDGEMgUiXbfNK3mWwkk9vsl?=
 =?us-ascii?Q?kNKHWQoHvR50Ze2RSH+nxKhiu3dG7UBfUtr+RPGAC371SnOtaCehsnW/iMgx?=
 =?us-ascii?Q?Gn3e6m7wzm/AoKHyDG2zCPAaTqoWC2D1qc+8luwWP3vT7zv8PAdFXbof4U8c?=
 =?us-ascii?Q?3Q8rbym44Y48MTosqqG+lRkaCdBK85RvBZX9Ut6d7n5JHWtJPwURbvdtQk4u?=
 =?us-ascii?Q?9ug2UN8VmfG3iipPJfwAQfuC8Xa/EnteCro/hHvr9FbbNulZ6cU5Pos3xfU9?=
 =?us-ascii?Q?Tk/uSitBPrbyIdoiFzD6daThb4yPCTAzPzAsiEkm4uhLwXvXZDoTy9Z/GLAl?=
 =?us-ascii?Q?KoAttdCP3SgNiaNKEzdvAClHb0Qo19Eh0F3yEeVgwP7oT9N38U17pYuORvsg?=
 =?us-ascii?Q?5hhE9waTr6aGUaR8bi93MdfpHKXMf6ivGXTbVi2krGrdRyzWKMg8Ln+rH3NL?=
 =?us-ascii?Q?kbvvYAJouOpqQu4XSq9wUu0CQCmNMmp+/KXjRgXraxDkOd8M1vJR+kNT08fX?=
 =?us-ascii?Q?9/f/uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8108719e-fd6f-4319-9cbf-08d995cc6c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2021 02:25:47.3627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwHqMW8KPGTIWcCQ3Celnp9Pak4zTlPTWeY1FB2ySM3lg5v28hY1MkoEVxvhwqYUBfwH4Yzsg0KGi2SBpV4witFUd6tYV0YlYNOeokWgD2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3571
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

> -----Original Message-----
> From: joel.stan@gmail.com <joel.stan@gmail.com> On Behalf Of Joel Stanley
> Sent: Tuesday, October 19, 2021 4:06 PM
> To: Andrew Jeffery <andrew@aj.id.u>; openbmc@lists.ozlabs.org
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> Subject: [RFC PATCH] ARM: aspeed: Add secure boot controller support
>=20
> This reads out the status of the secure boot controller and exposes it in=
 sysfs.
>=20
> An example on a AST2600A3 QEmu model:
>=20
>  # grep . /sys/bus/soc/devices/soc0/*
>  /sys/bus/soc/devices/soc0/abr_image:0
>  /sys/bus/soc/devices/soc0/family:AST2600
>  /sys/bus/soc/devices/soc0/low_security_key:0
>  /sys/bus/soc/devices/soc0/machine:Rainier 2U
>  /sys/bus/soc/devices/soc0/otp_protected:0
>  /sys/bus/soc/devices/soc0/revision:A3
>  /sys/bus/soc/devices/soc0/secure_boot:1
>  /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
>  /sys/bus/soc/devices/soc0/soc_id:05030303
>  /sys/bus/soc/devices/soc0/uart_boot:1
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6.dtsi    |  5 ++
>  drivers/soc/aspeed/aspeed-socinfo.c | 71 +++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi
> b/arch/arm/boot/dts/aspeed-g6.dtsi
> index ee171b3364fa..8f947ed47fc5 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -384,6 +384,11 @@ adc1: adc@1e6e9100 {
>  				status =3D "disabled";
>  			};
>=20
> +			sbc: secure-boot-controller@1e6f2000 {
> +				compatible =3D "aspeed,ast2600-sbc";
> +				reg =3D <0x1e6f2000 0x1000>;
> +			};
> +
>  			gpio0: gpio@1e780000 {
>  				#gpio-cells =3D <2>;
>  				gpio-controller;
> diff --git a/drivers/soc/aspeed/aspeed-socinfo.c
> b/drivers/soc/aspeed/aspeed-socinfo.c
> index 1ca140356a08..6fa0c891f3cb 100644
> --- a/drivers/soc/aspeed/aspeed-socinfo.c
> +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> @@ -9,6 +9,8 @@
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
>=20
> +static u32 security_status;
> +
>  static struct {
>  	const char *name;
>  	const u32 id;
> @@ -74,6 +76,54 @@ static const char *siliconid_to_rev(u32 siliconid)
>  	return "??";
>  }
>=20
> +#define SEC_STATUS		0x14
> +#define ABR_IMAGE_SOURCE	BIT(13)
> +#define OTP_PROTECTED		BIT(8)
> +#define LOW_SEC_KEY		BIT(7)
> +#define SECURE_BOOT		BIT(6)
> +#define UART_BOOT		BIT(5)
> +
> +static ssize_t abr_image_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE)); }
> +static DEVICE_ATTR_RO(abr_image);
> +
> +static ssize_t low_security_key_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY)); }
> +static DEVICE_ATTR_RO(low_security_key);
> +
> +static ssize_t otp_protected_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED)); }
> +static DEVICE_ATTR_RO(otp_protected);
> +
> +static ssize_t secure_boot_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT)); }
> +static DEVICE_ATTR_RO(secure_boot);
> +
> +static ssize_t uart_boot_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	/* Invert the bit, as 1 is boot from SPI/eMMC */
> +	return sprintf(buf, "%d\n", !(security_status & UART_BOOT)); } static
> +DEVICE_ATTR_RO(uart_boot);
> +
> +static struct attribute *aspeed_attrs[] =3D {
> +	&dev_attr_abr_image.attr,
> +	&dev_attr_low_security_key.attr,
> +	&dev_attr_otp_protected.attr,
> +	&dev_attr_secure_boot.attr,
> +	&dev_attr_uart_boot.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(aspeed);
> +
>  static int __init aspeed_socinfo_init(void)  {
>  	struct soc_device_attribute *attrs;
> @@ -81,6 +131,7 @@ static int __init aspeed_socinfo_init(void)
>  	struct device_node *np;
>  	void __iomem *reg;
>  	bool has_chipid =3D false;
> +	bool has_sbe =3D false;
>  	u32 siliconid;
>  	u32 chipid[2];
>  	const char *machine =3D NULL;
> @@ -109,6 +160,20 @@ static int __init aspeed_socinfo_init(void)
>  	}
>  	of_node_put(np);
>=20
> +	/* AST2600 only */
> +	np =3D of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
> +	if (of_device_is_available(np)) {
> +		void *base =3D of_iomap(np, 0);
> +		if (!base) {
> +			of_node_put(np);
> +			return -ENODEV;
> +		}
> +		security_status =3D readl(base + SEC_STATUS);
> +		has_sbe =3D true;
> +		iounmap(base);
> +		of_node_put(np);
> +	}
> +
>  	attrs =3D kzalloc(sizeof(*attrs), GFP_KERNEL);
>  	if (!attrs)
>  		return -ENODEV;
> @@ -135,6 +200,9 @@ static int __init aspeed_socinfo_init(void)
>  		attrs->serial_number =3D kasprintf(GFP_KERNEL, "%08x%08x",
>  						 chipid[1], chipid[0]);
>=20
> +	if (has_sbe)
> +		attrs->custom_attr_group =3D aspeed_groups[0];
> +
>  	soc_dev =3D soc_device_register(attrs);
>  	if (IS_ERR(soc_dev)) {
>  		kfree(attrs->soc_id);
> @@ -148,6 +216,9 @@ static int __init aspeed_socinfo_init(void)
>  			attrs->revision,
>  			attrs->soc_id);
>=20
> +	if (has_sbe && (security_status & SECURE_BOOT))
> +		pr_info("AST2600 secure boot enabled\n");
> +
>  	return 0;
>  }
>  early_initcall(aspeed_socinfo_init);
> --
> 2.33.0

