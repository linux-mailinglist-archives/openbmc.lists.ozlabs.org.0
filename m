Return-Path: <openbmc+bounces-969-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B454CA5BBD
	for <lists+openbmc@lfdr.de>; Fri, 05 Dec 2025 01:13:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMsKJ738wz2xQ1;
	Fri, 05 Dec 2025 11:13:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764893588;
	cv=pass; b=XoLGQAqG0NqLi45I/rRfq5r8jywvMm+RHzZYK47EXJ5AB5AQHIRXB5NXZXFnrhAwZL4ANGSofQdlE4FyzxUPBBYc2uni0mmTDxh5P9X9uG91nGDA/MnJlA12DlhaUj9qBMuHO6pzVdpq4MxgV/eoCdfBz+TOVwjxrJhDknbP0J7CsDyI9THL1O6ChJiAQmzZkxwKPId0pZ91Xf2jRhpikthvyHdYuWEf4Ex+Knnrt6EitAoiAP30uj7poDPDeBmcLhEwJXaEPThP7v8wXFADvMO7stZLwClEz6aftke8N9j0QqolDY+z9xrMuI/n+gsvt1RPVBclxHTvoVl92ZhapA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764893588; c=relaxed/relaxed;
	bh=zizRArxNHuhXsiCmnuVrqQhzUgg4lLWLxGfw2foAeh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PvQmULPjwoZLUzRRnp7twXuwD4b+cXilsbPZyP6W5WpWflfTG4SdD7qY4xGfKL3Ej8/bv6KTlRmnUQEUzQcNCwv/9zaTlKaUWE6zLC50kBo9Pkk9KfUMIUeb8XEJ944MNrVyIS7Kz0tmiyx/75FTCc5mXwKyl3os8PIWE5vwVcuFc5bRG8m0WUlFbh91MHmVDOQVGUW9C+2c0ENOqSsXq/dDbk256yqheqOYWSwJx19YpW9G0QUggkgRgVwwIudmDX74fec/1BUP4rIO7qU2JvokVW4LxhR5zMwF3Gw3NMSJfXk9yjGiDESYCE6wmYhTe6ioG7sgsax2mxqDiRSc2Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RgXzUmo4; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RgXzUmo4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMsKF4flBz2xHG;
	Fri, 05 Dec 2025 11:13:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0F7LsBIAPEikw9/8Tl8A8xaYh/wInc46N/4hVnMiR38ZOtykIYcjsvZnw2zgYXcM5s4kVlBmpjSblEQnvru8TLPc2yxyia7cguRJERUye1L+s8Y/z23KYwaUldfGi4IqfAPM/fkctBzpFRqjtt5IslGNIka48hI6KARAIJk2XD671iOcXyh8mXQjxhn+aOGFLhegV+yOOb7vbKM+MrXylkn2kC3eBXklERCWPkPewZH0JFukHOGTdEhr8BzFAlKFjrc/LbJPa/AKCFJhhDeTOuC+KC033vxw8yKzCQt8l7VVc+1PL10H6SPgs4bNuRvQnSTHVN2wujSEDzkP4A3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zizRArxNHuhXsiCmnuVrqQhzUgg4lLWLxGfw2foAeh0=;
 b=vtkdgVqoMUN9N4GGIqbMyl8iSbZqLnwXb+7AhK2rKf653XL4OuTfSRmEE+9E9bWl4sbaWaHnOR+IsyeAkDKP2m6JVhImGzc+ATgByBbVjy6WTGDWCkYV2L/wRav89dZf7DoOnMxHmQvedXjV8FiRNFuNx7NcsXBtsHjy7vdaTwVRmDUEPw6G6U1B0OyY0NwT7cx6jLXiGsc32L2EAchgBHbRpbAfXn9yAs5SBw6ubpZvOQIPfnj0JUNdxWtXilspQUbPU9EfE4lhf1hs139pYZBXfLMn8nKromwwRGdyhpOeVA4GDNeZbncjue0O3uvUefzdRrTYrK+FzKycHWTSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zizRArxNHuhXsiCmnuVrqQhzUgg4lLWLxGfw2foAeh0=;
 b=RgXzUmo4PZZhfMPFjiswHD+42J8N9Ys4FyVusdPxUIdJZCe0iD6T9m9e7wEufJ9tzlV+BS+XcPSFR/4cDjB1tMm6bWe5Mj/K9JANzCRWqsV3VdkZGJSjQmP5MrzSkH4XI5fxF6wC6a52i1Xlr35NhvaG6EwgdPhYBfvTWBslFG10w7EfXRBwhwmWXfnWT5C9Va7D8vBjpzQl3XhYjXR+PYKy8m5I/B2bFAAqXtIUrPidTVYbtlhPupnMe9F8F75b79S/IJpLleBn3HWVwrK3nVox5ux8AgEZkBGwXnqjl3QgK8UbQ2dCsubXmLDtytWm1NzJTg2xVgnHhChXzq1QoA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SG2PR06MB5059.apcprd06.prod.outlook.com (2603:1096:4:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 00:12:35 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 00:12:35 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Thread-Topic: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Thread-Index: AQHcYovTiOKpFL2Yzky+VI550x/5ybUR6lmAgABEAbA=
Date: Fri, 5 Dec 2025 00:12:35 +0000
Message-ID:
 <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
 <20251204195355.GA1975043-robh@kernel.org>
In-Reply-To: <20251204195355.GA1975043-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SG2PR06MB5059:EE_
x-ms-office365-filtering-correlation-id: 45071fd4-0970-4801-eb29-08de3392fe0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-2?Q?Qb2V7InUnu+A4M+t9+pWdnyY7QCSteapPW5zcM07HEPzx610KnA364bwZx?=
 =?iso-8859-2?Q?Mnk9f/YLop1RZnjAA7NcRcMs9pc4dYyIKKkvRQ2ye/UcZ4kcF8yaJNE9Na?=
 =?iso-8859-2?Q?ZYQmUb5wlb0bsb3mu+Icu/am5sKRHDrUfxbGBl4UjiQGyPAtFu/UGrIo4u?=
 =?iso-8859-2?Q?2xm1C9U0xmLIwxQO5RFXVXZ8SQgnd/e01U5x0XJUWqOtKsD//URxolWNA0?=
 =?iso-8859-2?Q?zfvrQZbBmz48n/OE2+TPFs5edwbpGtDLCY/MPUrKFMotgERslEYrZ3wI2E?=
 =?iso-8859-2?Q?Nv9rl4Ub3q1XxPnPTIsrB7gHQc5XOtA5l6vhKacLQW0A4UZpxcr+RwVodO?=
 =?iso-8859-2?Q?wEWm+3CrsXZzPnIcaLTKvYWPwLLTMi9pfS2zVyjT5JO/trafnfwQhQwf9k?=
 =?iso-8859-2?Q?N6UmGLCXOxoU1TYaVBAbJ8vEEVeQdfXkguxw/PeMkQrC+JUeFA/BLmwfXT?=
 =?iso-8859-2?Q?XdrVllmm9iv60p2L3yPWnc6+jIbq6oVv9En/3LC9Ti1grAarQ6ngP+7Y2q?=
 =?iso-8859-2?Q?gDIVIgfu2LHHxT6puYrjIqn0fQNa4nm0TWA9lZy2qkaxCsWYIfJhhSb0X+?=
 =?iso-8859-2?Q?YDkUbMq0OGq/Q9tLvIJXWQf8djtjFVLEecDW4GJXLqRuiBXUUSdUbqHw4u?=
 =?iso-8859-2?Q?6EtzOO5+Af/UbWysF1acJ75rbmpcSAxZgV1Z9nV9BUa5VGTBvbCHirsqY8?=
 =?iso-8859-2?Q?jv4wjpoyL7J4UEyZ2m0lFyg7XZIKWfpMDU4Zx/vvfI+WdODq934Pb3Zm1P?=
 =?iso-8859-2?Q?pUsD7WrfZDNXmy2tSSFtf2f57rjb16tOfmRGYYzbgwqKEw2WDEV8UxJSZK?=
 =?iso-8859-2?Q?ZmBFNxzMh2xiWODWg9GwdBYAzTt0J3TUWmieUER7laHgb9dnW6wM7Lc5BL?=
 =?iso-8859-2?Q?g9tZLn0m6ZIePQMZWxQ770HLgFFjwPPRGpEXZ62etO3Xk6qx/3uMCZFyM/?=
 =?iso-8859-2?Q?G1yDtUx7cylXIpZJ2tslslN+L26mTvF/Q6QnQye+NqIeCfDhi7dWUeMwxA?=
 =?iso-8859-2?Q?3MM36NyESV6AT49/wLz2i5l3YBdtX++Q35ZYp2JN47dPIAHwQ1bAnr8+e0?=
 =?iso-8859-2?Q?W8WpBxuhBt3mG5mxlrOi5okIfdo1vFIVsCfo6Ej3+26XnG0lW6Uf2KFUIy?=
 =?iso-8859-2?Q?6c/D2/ewgtezcBQ4uzd+X6CjCOTKg7T/UZwXL2YWFyFQzlUWNZjxSL7CSR?=
 =?iso-8859-2?Q?pgJTusZi5K5oxFYLFDunqzDJfN0A+B6l4utGrHzZ8OjKUzrX/QnqMPxMmL?=
 =?iso-8859-2?Q?SayohC9QWtakA5WRbshsEEmJyYar0DGG5OHDYx6DQS/sEVVBmoNzPALHgq?=
 =?iso-8859-2?Q?ONATb3S0XbeRWNTiCI/fBGvlO6QqF/UQLu0UsSdustSI+DJFDS84K46yNo?=
 =?iso-8859-2?Q?HfNPqKIvhyYiEaEXri+S1leIQGwT4y8w/bEz0oSYas43AQa9DzYTHMvwno?=
 =?iso-8859-2?Q?TtQ6WhHIYu31pCu8PhQVhO8LSdYfVehOEjhyJJ3Feu/SeMFbqMvfQcJiOw?=
 =?iso-8859-2?Q?R6lZ01zpqQfb82SSBwSRG+iJP5T18XNLCpklrwTruXKKSn6r0IzfeIcXcs?=
 =?iso-8859-2?Q?tWDK+xKVUw+jGK0XcRqjk69iUDcy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?a/Urz+T/gWsBSTG3HzfoyxrDEfQP6Y/OYxPi/9aDv0A2msfHO5LkTNdW1o?=
 =?iso-8859-2?Q?XvmjUff08YMB0bTAcfEGzyrmnv7nndtLC+FHRxzW8AZQ01HDQkHeFWlS9R?=
 =?iso-8859-2?Q?mKNuIiSiv5Q1LmFtccCa8HetuGbM9X/7RS7Drp65iZ0M3aUoRW1U9qPErj?=
 =?iso-8859-2?Q?CijgWW3fk2C9tHwOQEBldIqSm35PJ2cJ04cZn+hlbqPmE495pAvjsS6K36?=
 =?iso-8859-2?Q?6f95PVZIElMscwKl/vK5aXiadsmkifgd+M7ASYhpi5QFL9rQLNjqUrexGa?=
 =?iso-8859-2?Q?tKrG4US5OjeTy7TZTUBpAlELlOpTJBGO0mW4ev3v7DRmALW4Hhz6fbpP/r?=
 =?iso-8859-2?Q?Nk3b4B8smN+EQvIsRawuqPgeIRjTCeQrOO7Y5BWEuKLyf/m1lZymIL+fVN?=
 =?iso-8859-2?Q?K7JoMROQhDnQl017J5dc8epoZ9tlFdTuLpqEF0m02pxkapkFoKOq+7wIL+?=
 =?iso-8859-2?Q?FeeANGYkEej4Okox7E/Hs5kx6PJdSZF+AD2q78b35KY35Q9Ied2pg2Pv0/?=
 =?iso-8859-2?Q?L7KcwMFQt4Wh4kWsiVmqfLPYNBsg/0MCz+sBclz3+mE93rTcAY3cpRnXqD?=
 =?iso-8859-2?Q?aa8SOeZ/TdvdOR9mlDu+e+b+XrHBoIKOmLDKuKaYM+IYScc3tuqQQFuT1r?=
 =?iso-8859-2?Q?lRBlXoujLKMLnH0sJXlxoS2AvVC7IirBlcWRKASC3PIuKWDD7QD491shxl?=
 =?iso-8859-2?Q?H79Z6bpk/ibp4zjnMx613PONsC/kei8L9aVWm2kaeXWBrOcALWyka2pdta?=
 =?iso-8859-2?Q?8J8ZJTTwCpbUalGDGXmxKKxvb3ItxzVWIo6ke87ocYYPF0jrGyoge7jidP?=
 =?iso-8859-2?Q?DknmvbA5oaIfL0mzszZP/SexZB2I2PB/02q4fR7Ulba2qMdPCjlU2HZL7V?=
 =?iso-8859-2?Q?w3i4TKIrCEnjf9obYdrbdIl/DQlvVlWSSqShj9iFfNivWIrot3jqhtU/kd?=
 =?iso-8859-2?Q?0iwE+pgI8m7grzVkSl0shpPTbZ2MRphHMYR+k1LUuSWQFMlHfWgr4TUnb7?=
 =?iso-8859-2?Q?5q5qpQXpWt7Cmyl5Dg0MS5n/UFieHz5G3zuSG5V6z6Hac6Lpfues2t5LwX?=
 =?iso-8859-2?Q?QxP1k7qadWfkGZ0/fyx5WwqWCDF4bokX+Prf7lRBHbKQRcniSVK5rk7GqL?=
 =?iso-8859-2?Q?+ojtguYPPWEegw5ZM52L/4NeyzIhASVc/dp5+UmJAgYY0kXlzYVqvsRfiF?=
 =?iso-8859-2?Q?JXAIrf9Drf4CZtRME4V61sd3FvlLXcNZkcgUH+o1WD87BRE47/jLuoVN2E?=
 =?iso-8859-2?Q?h9i38v+Uwe/BEzsSOy67mLMf10qfnOo5t6BKfYJfx942T/lr9XKGc4GaTs?=
 =?iso-8859-2?Q?CrYWWN7WLDQA22a+II4mh1S5MjQ6C8EclvEGhMe3+khnaTzriXrddGKRX0?=
 =?iso-8859-2?Q?dEdxEDG1chl9yA1tYiAGsFn5SsoJnEbPWld0ZNeyUiqNhr3wTVoJuuZUES?=
 =?iso-8859-2?Q?pUJO9t0VNiAIvVI6CzVnykLNcmhAvZO1Xo0oTvetgh64AtZrR76ExTPnx0?=
 =?iso-8859-2?Q?t2S2pO0Wkymkhe93O4oCKPcow4GEgIaeFJOVGYHsO0uf6SaQ6RJi+5u9/M?=
 =?iso-8859-2?Q?6c1OT24qSP0amu2u3paM///tgjWr5BlOv/58hfl3l3YKilef8xFt1whcio?=
 =?iso-8859-2?Q?AznPKGAj/9VZXztxeFesPdCwHIJ1QCHYD8?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45071fd4-0970-4801-eb29-08de3392fe0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 00:12:35.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7HufH05LsG1BU8BQwUzU3y/a2Hxe4iNW0lgIhITpWGCbPDH1uTsRz5dX2vhfQGT4Cd6hPO3mA/5pQVhh5EGSQwvC+Yx7/B+WsD5X5DOmsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5059
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Rob,

Thanks for your comments.

> > Changes in v6:
> > - Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
> >   the pcie node of aspeed-g6.dtsi.
>=20
> Where is this? You don't describe the root port and its properties at all=
 now.
>=20

May I confirm whether the pcie@8,0 in aspeed-g6.dtsi is not considered the=
=20
root port? From my understanding, that node represents the root port, so I=
=20
want to make sure I'm aligning with your expectation before updating the bi=
nding.

Could you help clarify how you would like the root port and its properties =
to=20
be described in the schema?

Thanks,
Jacky


