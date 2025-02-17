Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D185A379A0
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 03:13:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx5lz6n3Rz3c8Y
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 13:13:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::70c" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739758377;
	cv=pass; b=h19T2l22WY7ITIuoGUmXySVJPe5BANcZYQ9rxH6uMWmfYUaiG2Htcl7DFzDtliPyueF55CqtpK163Ij5XwxNvpsMXncSxrs+hYkiRumxW8o0XF5ck+EaK3Ju2M22YwtoXwg9aM5yOQoUwf57/TYCYp1Pz2iaNzWqOhajHGjktOfxK6t5S5iBjFuYCNMH4FndHn+B0BznfhUH3WmoowvnNUmNgi2i6LwDzh7tKoyPep/FCl+SWGWQQQXkGSgzkHOfiCuVkyhd+yK6EliaQcqnTFoqNdW6zvAkcGfAswnQDPmcIEPA6+Fjq3tQaSItYyvr9/zyYA9GIiVFCKDP/CehuA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739758377; c=relaxed/relaxed;
	bh=IJmjC8UVjmc37vfAyXSJvM9SlwJ/7ONQHicSVkei4s0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hpa3u5a+Whqd7QMtjAX+uzbcE+zZF974SSmpyXlUN1Sd1z0O2bokbKCHWsdm/KOPAjnUaiEyB7CiCiZ8IjBrRiFu3BoVgjFsjDezG6F89i/QnI8J2QIZGOMNv6LKc2qQdWn5QncN2ZbENAqi4JlR+tnkE+Fr62KLJJIy+6rSPvTTPhAK1WH5rp44JchVobPhCOUEhAGqIyEn15w5vlJmXyPJYvQhSRm1tF3JqHkG3de/qpyDDqRVxoblqT04H7hfFK1zjojDHKLLFEk4LH++mB9BHpkBIFVU+Om93qnXMkiLW6yjuxyg4DVkV9mi/umw6h/YU/cezuckHclU7njFwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:200f::70c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::70c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2070c.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::70c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx5lc11WRz2xX3;
	Mon, 17 Feb 2025 13:12:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLZ6vYK2q07Sfvp67ksm+r+u4eed0NVY1l4cbdrHptfO/iWM780aT31a3UcImlj+vw6wxM9BA/OjtT186g8AmFcbFziKs4ZenIXBjAnc/A0TH8YAMl2F1d+AX+6PYgPKMs3ADTNd/QsH9jioJRqN4qCILbzT1XKug8NbcBgkDXXyrHQGppMK+9NkUJdU7yVEFnf7Wy60lqeAS0rA2HISNfdijcBsA+ePx4wfA4GxZRryc7FcJEEC6oZuSfWfPwxmMnf/opOVKEY3zOxrEEeL4YKeGfSiDYr+tbeS7ZUWUGQzedVy6dzTKIQGfG5RMYJSyGca1a7WWDNorY0XZ3f0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJmjC8UVjmc37vfAyXSJvM9SlwJ/7ONQHicSVkei4s0=;
 b=giEA+ehKUP4/kZKH/R0rTuifKtbX4Ip3f7Uamo4bwCudUHabfhKGSmAAgH6Tkl6XOEABVlaSNhKOm1+8tFyr6C7xepnhihW8TYBIV+sgqXMH1njxJyMQPz5dBEugeD+a0vD7xr4Qxa7kYyv9DYqsd9rS+tVrMFjoxAmIV4jgE5fSED6V4IXalfuwQEEFf0YLMx83eSQUqguqVRTSSdJqI9pOg5YFKo+VJP0UKUYvIEsVJDorL+XwtRI7EazzKK7vEKoJwMM/e2xS3WwSKDoDBjxYghucNWxdfOaHN7Jjq0DQXdFnHZ1T/LOC/ZKfNPuebE9jbIMkOXtlewOSOkjaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJmjC8UVjmc37vfAyXSJvM9SlwJ/7ONQHicSVkei4s0=;
 b=njK/GZc+gsXvuGG8Nox/Dfw6Kgq9CdYoVB1BiJivSXItEVBD3lA46vO9Li6KlxjcuRkyJfNxnD89DMnjYHMQARCSGtg6eF6Iyv5L/5wkFF9Fx69zr6NXluY0L3MTlGa31T0SAN+4haE1l39Oz8O+dd1HcIsD6c9UdYUl2eaa/1wMFIrx/6GDdVEZH2OV69KECqbg6lq3mFvpQq/VKJ5mC+ldIfAqjBYU8nY49wj9kShnEGaCC8pKKN4qEl5ByatS2XhjCyC7TSliXzhTZcb3J6CaO++8KjReCZiXU3ql56WBw9aFd4q5A2fbZ9Vw52v9Oohgzo5DkJgp7wssuDSvxg==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by SEYPR06MB6083.apcprd06.prod.outlook.com (2603:1096:101:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.9; Mon, 17 Feb
 2025 02:11:57 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72b8:dce5:355b:e84b%3]) with mapi id 15.20.8466.009; Mon, 17 Feb 2025
 02:11:57 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "eajames@linux.ibm.com"
	<eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Topic: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Thread-Index: AQHbgNJmQf9IQHJjkkayHDxz0NYcHrNKvj4w
Date: Mon, 17 Feb 2025 02:11:57 +0000
Message-ID:  <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
 <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
In-Reply-To:  <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|SEYPR06MB6083:EE_
x-ms-office365-filtering-correlation-id: 876f8931-3fc3-48cd-c26c-08dd4ef874ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?cDNvMXpkZjY5amZsREU0dnZib1pMNmp6N1c3VHcvZFN5QnVvc3M3WnpkTStn?=
 =?utf-8?B?QnNzZ21ZUWdpNmtkVWxJQ2lnUGxOYmozR21zcXEvTUFoWEFHOGVWQlV4b0JI?=
 =?utf-8?B?ZC9pMGIvb1lSeDg1RFE5MnBOMW9Qd2t0L2pNNVFKblNDaHpkLzk2L2psYmt4?=
 =?utf-8?B?TUNaNTRWdE1INkkrdjVTZEF2aG5CUktMRDY4Qi9BVTdFMUVVeExxbVV0ekxC?=
 =?utf-8?B?QXpjR1lHci9CMzZBOVNscXcrVHUwL25nWmVsMGVDVG42UWdNWUpUamEvd0xP?=
 =?utf-8?B?NTYzdExocUxTZ0p2QXlCZGpDWkRFMmZ0aThlZlRIdGdLNmNNd0tqNDRvVFIv?=
 =?utf-8?B?a0I2MjZjRWczRWdzdkpqdmJKdVQyNktqZ0MxMDN4cjgzYUtkMnpVdms2T3g3?=
 =?utf-8?B?VWZBWUFMRG5JMUwwV3A5UFRJZnhmTndiWDMvaGVYRzUxNVRZMG5lRHJvQ0JS?=
 =?utf-8?B?aldqbjJnU0VwUVlCYnhSYll2dUhPNzYybDBJbm9sZkhHU0NSNlVDaDRkcXBt?=
 =?utf-8?B?WFRoMFY0RWdNb3UwOXBibm5iTU5rRktWdjVZV0M4MDNiWmNtTmN2b2FZRFZj?=
 =?utf-8?B?T2VsWnlsMVRNWEpyTnE4YmNDR1Jndk44cHFIZmduZHpkR3JaRWl5Tjh4Q3BP?=
 =?utf-8?B?enV4NmVGdmtyNURQbUFlWG9rUkRYOEJ2aGo1NXNOWUpzQytjWUNFVk4wN09M?=
 =?utf-8?B?Z0lhYW9EMFVsUi82Tkord2NJWlgwMlNYN01zbFgwQ21oZitCWHo3TDltclNp?=
 =?utf-8?B?N3J4VmFqdU1vM0pjc1VZZlg5WEczT0tGM29FU3FlRE52azFjdllqR3hEaWdF?=
 =?utf-8?B?S0V0c3VUblp2MTRnMDdzZW02VHpGbTVyTWJWRUpDME1wOEx2TWVGT01rUUdn?=
 =?utf-8?B?clBqSkN2ZXdOMTl5bjE2bEZvM2RmT3ArTHdGSE1lYUdVQjR2YUJ1TktRbkUr?=
 =?utf-8?B?R3JyMG1KSERydVN1aGh4NXRmUE1OcUJCUmdIUnFEUk1lZE90bjlRNElPRmJv?=
 =?utf-8?B?R3FjSnd6aGt1dTBkVmlmRmpqb2xoLzZBU0g3aUMzaTJqMGQ3STNsWklZT2NV?=
 =?utf-8?B?TXJad1M5aGdDRklzTHZlbndFajFtRWhSWFFCY3BlL2V5OXVtTUJ3WTVWWDdP?=
 =?utf-8?B?M0hTelFDZks5QXNxWFBYREdkVCtQN1dCYXc2N2wyekpUQTJwK0ZBU3hWcGl3?=
 =?utf-8?B?c0Z3SWJjUlEyeVN6WnYrdmNaV0s3Z2NWem1iMUJLSmJBWjNpaW4waklXOFJO?=
 =?utf-8?B?b3Fpc0YvQUVnVWptZTIwYy9CTXRYYVRFcDFXL0prQ21ERk1aWkN2VWIvbExr?=
 =?utf-8?B?UGJwbzJaY1JJMENwa25PL3ltT0RCOUsyZStNdDQ3cjV6bHV3TG43ZENvR3Ur?=
 =?utf-8?B?WElqSFp1SlE5Z2VnZThMNVEybWFXbnlncFhhNXJrSDFlaERISzkrWjJPMU9o?=
 =?utf-8?B?UDU3bC9wNUo1MElyUnJxcGJRZ0ZnVFByYktjcHZhWXJ0K1R2K3FNQ1Y2aGh2?=
 =?utf-8?B?U3gvb1M5ZlY0S0Z1dEovTDN3VjNWT3ZRcGx0VWFvaERFUHlHVEU4MU5qZ0xB?=
 =?utf-8?B?M2k4aGE3aEUxYUxneldDdlN3aS9rVlFWR0dackZvVnhhQm84OFlKam8vUGx2?=
 =?utf-8?B?Wjc2bXp3NXpJSU1IOUZQK2NuSFRSOFZKZSt4ajdxVkltL25QWWxUZWpMVTlo?=
 =?utf-8?B?cU9FVDNhL0Jrd2MydWdtSkFHdEErSGF6UlVzWFpUY3NOOEdUWFFURnNCeCt0?=
 =?utf-8?B?aW9OWnVtSEpkc0NReGw0dEZERVM2bzA2MEkzRUFlS3pZNEEyc0g1Y0lqRWJD?=
 =?utf-8?B?QzBrR3Jhd0pkcjJGWXhmaVRPTVcvQzdpODlOZmJSUmZSVDNqRkpDTFMxVnIv?=
 =?utf-8?B?dHZRSzNMMHYyMzdTRTNvMDRCNEFGL1NDVzBFazd1bU52THZZSWh0S1R2VmR3?=
 =?utf-8?Q?IFU0JXKH12g=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MTRKU29obnNzdnVVcGM4V1RTQ0lqZERkdkdaeHhFSXNXcStqN1lyVnBOZkF6?=
 =?utf-8?B?WVVBRjhGM0hnZ1VlMEFVL2RZazZzUDU0Tjk4SHFYMmI0a3hmdEhhdHArblVl?=
 =?utf-8?B?Z1IyNEJQNDlnMUxDZVNqWGxWcjJJU08xMFZaTm9JYk9XM1l3VTh6Y21iNWFS?=
 =?utf-8?B?a1Jpckwvb0FjZXN1L01RNVlWaERzWEtpYXpYVFYyS1dQZ2VWMVhwaWRiSEtP?=
 =?utf-8?B?M05KR05GcWRpR0lobS9CalZPL2RyL0JoYW1ySHFBT3FWMGgxR1RXWjlBcjds?=
 =?utf-8?B?QURsTzdxYi9iYm9pdWtUTFgzQ2hyMlZYVUQrSGNBdnBzTVdiWG91OU80TXRR?=
 =?utf-8?B?Q1BkSmR2Zk1pbWpRZjNPdTdpTUMyNzlRMFhGOFN0MXlNL0tCL3FMNHpvbG5T?=
 =?utf-8?B?TGRLemU3L3BVLzAzdHZ1SmpCYjhtZy9vYW5vbHpjN0FGN0FzRDNiYnYxK2Zi?=
 =?utf-8?B?Ui9LQUtieVQyTlZ2VWk3elpyWWV4Y0U4b3hrVmpsMjFhaWVwdysrWCtvL0JS?=
 =?utf-8?B?Ti9RM2hKZTMwMTI2bjRWZDdXbUl3TkJEUkpiMGtWd01JT2RWUEhOeDM5b0F0?=
 =?utf-8?B?M24vL2swWmMyNmJlTzJUTXQrSUpQR3hiQmNOZk5rRlZmVG9haFRGZXM0K0Ru?=
 =?utf-8?B?aUkxVndoa2FFd0Y0SjFWTW9pOVY4d3JydlJFUzR4Yjd2VTlnajJabkxzcmFB?=
 =?utf-8?B?bFdTZk5uNnl2NHJrT2FMejFLK294SGppQ0JpcHpZVDBMS3Z0VEJTaDRZODN2?=
 =?utf-8?B?Y3lhd1hoOGNlbURaaHBIdjYwVkRFK29Qb0J3MzlNWUxleGJjckZ4Nll1ZWtI?=
 =?utf-8?B?ejR0N3VnL0twdUtUenFyaEZEZkFrUHlTNy9ML0g1MTlZNTExbjR5cnBPc0d5?=
 =?utf-8?B?VXZMZ0RRTXllT0wyZUQ1akVVdnN1WjZRUkJhcmFsQ0QyMnkva3lBSjc3ZnN2?=
 =?utf-8?B?RnIyZnp1TGVFYU1Zd0thZ0dNRkVPMGF0M1FCaW1VRnFFSzM3RFFFME5HTGZj?=
 =?utf-8?B?Y0ZKQWtkSzNRL0JXTlk4b1JSTjhPSlZDTXVTNzZPOFA5RER5ejRJakRPZkhO?=
 =?utf-8?B?MmhHUDduYndWZkpWdE44cVNHZ1pjUTV3aWpONFUza09ObzhyYlpEZC9iOWZy?=
 =?utf-8?B?b1N1bHQyQkhjTjFXeldQR2tIMEdYN0l4OENYcGpHRTlUTUN1NTlMTDhKcjVm?=
 =?utf-8?B?ZE1sSEduV21yUWljZml5SXY4VmdLQ2tZc2hxUzl4TWN5ajRKU0RGWHhQaHlx?=
 =?utf-8?B?NTVjY1I0azhCMFdkUTBzZ0ZOUFFleHBTN01SUUtUbHBNdG5DTGZtSVlnZzFs?=
 =?utf-8?B?UXF1eC9nMlNkRi9qUDJvcU9McGUxV3JjQjB6d0dYejNua0xnZ3k0Q25vK3kr?=
 =?utf-8?B?cmxleUYvOUk4VExTNzRoRmdnMTZYakFRQlNFcW1TQkhqdHlWRFZTTVkwdVFX?=
 =?utf-8?B?Z2N5YXcwVmZpNmhxRVMyVk9aVFZxYlVpSU1idWhZVG5WNTAzR25lbDRKaDll?=
 =?utf-8?B?dkpmb0tpeVNoSGpUREpmblFDbHR5R0NPYkloSnd4ZG1xRzkzVWJGSXp2VDh4?=
 =?utf-8?B?Yld2d0kycXpVRnlFK0pzS2VrL0FBR2N1TFkzQU9ZRUtFengyMHcyTEJ5Y0hR?=
 =?utf-8?B?aWFpdktPczY1d1M4c3R5Sm1JMjdSZFVHZ0h5UnRJK3RMaUlGUjEvQTdjbXZs?=
 =?utf-8?B?UFIzYWdDSWVQR0ZucDJMTjJETGZqLzRGRDlocWY2ZDRtQ1Vqd25sMEtKMEc4?=
 =?utf-8?B?RHBqTXBORVhQWU5mUWRFOGhoVktJL1NrZjFzbmZIVVBtT3JYZjFIbGk4d3JY?=
 =?utf-8?B?ZlFLaUl1ekFtUVRUSm9Td0xVbndmNHI2cVFNMTNDcjJ0NmNUNXRLeXB3amc2?=
 =?utf-8?B?WTZUYlJyZFFJRTFxRnZDdVdBNXBNMHU5YWF4V295RDN5VENYNEN6blBVN2Jk?=
 =?utf-8?B?RjR4NzlFdEszdS9YMjlGWVpwOUlldTV1QUVlUnFSbjFrU2dZS0tkaCthVnB6?=
 =?utf-8?B?RlROV1lKeHJuVm8xMWdlcGd1c0JzdE13eGVEVG1YK3FoUEtockRZTnNwb25I?=
 =?utf-8?B?Y1ZhZ01NWXZBZHA5VmYvYTYyRVNrOVNyV0ExRHh3ZHZ5cmVLL2dpaytPUHVS?=
 =?utf-8?B?QjFaZkVZOXZxQm9RRktxNTh5SmRqVEZkTkJWUTZ6Z2ZoLzVwd0QwZytCcVMz?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876f8931-3fc3-48cd-c26c-08dd4ef874ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 02:11:57.6419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTuvOtKxx+wrTJ5FHNzWiiMwUIqEnzr/lelpKvlaWQjOTrhhYEimGqCtFv9IIlDU92zYyA1D0WAzDI6kMV9yLbMPdEC6mTbQtH1se/yHa0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6083
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2ssIHBsZWFzZSBmaW5kIG15IGV4
cGxhbmF0aW9uIGJlbG93Lg0KDQo+IA0KPiBPbiBUaHUsIDIwMjUtMDItMTMgYXQgMDk6NTMgKzA4
MDAsIEphbW15IEh1YW5nIHdyb3RlOg0KPiA+IENvbnZlcnQgYXNwZWVkLXZpZGVvLnR4dCB0byB5
YW1sIGZvcm1hdC4NCj4gPiBVcGRhdGUgYXNwZWVkLXZpZGVvLnR4dCB0byBhc3BlZWQsdmlkZW8t
ZW5naW5lLnlhbWwgaW4gTUFJTlRBSU5FUiBmaWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFtbXkgSHVhbmcgPGphbW15X2h1YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+IMKg
djY6DQo+ID4gwqAgLSBSZW1vdmUgbmV3IHByb3BlcnRpZXMgaW4gZXhhbXBsZS4NCj4gPg0KPiA+
IMKgdjU6DQo+ID4gwqAgLSBEb24ndCBwdXQgYWRkaXRpb25hbCBjaGFuZ2VzIGluIHRoaXMgY29t
bWl0Lg0KPiA+DQo+ID4gwqB2NDoNCj4gPiDCoCAtIEtlZXAgfCBhZnRlciBwaGFuZGxlIGRlc2Ny
aXB0aW9uIHRvIGZpeCBkdF9iaW5kaW5nX2NoZWNrIGVycm9yLg0KPiA+DQo+ID4gwqB2MzoNCj4g
PiDCoCAtIEFkZCBBZGRpdGlvbmFsIGNoYW5nZXMgaW50byBjb21tZW50cy4NCj4gPiDCoCAtIFJl
bW92ZSB8IGFmdGVyIHBoYW5kbGUgZGVzY3JpcHRpb24NCj4gPg0KPiA+IMKgdjI6DQo+ID4gwqAg
LSBVcGRhdGUgcGF0Y2ggc3ViamVjdA0KPiA+IMKgIC0gQWRkIE5PVEUgZm9yIGZhbHNlIHBvc2l0
aXZlIHdhcm5pbmcNCj4gPiAtLS0NCj4gPiDCoC4uLi9iaW5kaW5ncy9tZWRpYS9hc3BlZWQsdmlk
ZW8tZW5naW5lLnlhbWzCoMKgIHwgNzANCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqAu
Li4vYmluZGluZ3MvbWVkaWEvYXNwZWVkLXZpZGVvLnR4dMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MzMgLS0tLS0tLS0tDQo+ID4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyDQo+ICstDQo+
ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQ0K
PiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2FzcGVlZCx2aWRlby1lbmdpbmUueWFtbA0KPiA+IMKgZGVsZXRlIG1vZGUg
MTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FzcGVl
ZC12aWRlby50eHQNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQsdmlkZW8tZW5naW5lLnlhbWwNCj4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQsdmlkZW8tZW5naW5l
LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NjgyYmJhMjA3NzhjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQsdmlkZW8tZW5naW5lLnlhbWwNCj4gPiBA
QCAtMCwwICsxLDcwIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvYXNwZWVkLHZpZGVvLWVuZ2luZS55YW1s
Iw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBBU1BFRUQgVmlkZW8gRW5naW5lDQo+ID4gKw0KPiA+
ICttYWludGFpbmVyczoNCj4gPiArwqAgLSBFZGRpZSBKYW1lcyA8ZWFqYW1lc0BsaW51eC5pYm0u
Y29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gK8KgIFRoZSBWaWRlbyBFbmdpbmUg
KFZFKSBlbWJlZGRlZCBpbiB0aGUgQVNQRUVEIFNPQ3MgY2FuIGJlIGNvbmZpZ3VyZWQNCj4gPiAr
dG8NCj4gPiArwqAgY2FwdHVyZSBhbmQgY29tcHJlc3MgdmlkZW8gZGF0YSBmcm9tIGRpZ2l0YWwg
b3IgYW5hbG9nIHNvdXJjZXMuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICvCoCBjb21w
YXRpYmxlOg0KPiA+ICvCoMKgwqAgZW51bToNCj4gPiArwqDCoMKgwqDCoCAtIGFzcGVlZCxhc3Qy
NDAwLXZpZGVvLWVuZ2luZQ0KPiA+ICvCoMKgwqDCoMKgIC0gYXNwZWVkLGFzdDI1MDAtdmlkZW8t
ZW5naW5lDQo+ID4gK8KgwqDCoMKgwqAgLSBhc3BlZWQsYXN0MjYwMC12aWRlby1lbmdpbmUNCj4g
PiArDQo+ID4gK8KgIHJlZzoNCj4gPiArwqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICvC
oCBjbG9ja3M6DQo+ID4gK8KgwqDCoCBtYXhJdGVtczogMg0KPiA+ICsNCj4gPiArwqAgY2xvY2st
bmFtZXM6DQo+ID4gK8KgwqDCoCBpdGVtczoNCj4gPiArwqDCoMKgwqDCoCAtIGNvbnN0OiB2Y2xr
DQo+ID4gK8KgwqDCoMKgwqAgLSBjb25zdDogZWNsaw0KPiA+ICsNCj4gPiArwqAgcmVzZXRzOg0K
PiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK8KgIGludGVycnVwdHM6DQo+ID4g
K8KgwqDCoCBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArwqAgbWVtb3J5LXJlZ2lvbjoNCj4gPiAr
wqDCoMKgIG1heEl0ZW1zOiAxDQo+ID4gK8KgwqDCoCBkZXNjcmlwdGlvbjogfA0KPiA+ICvCoMKg
wqDCoMKgIFBoYW5kbGUgdG8gdGhlIHJlc2VydmVkIG1lbW9yeSBub2RlcyB0byBiZSBhc3NvY2lh
dGVkIHdpdGggdGhlDQo+ID4gK8KgwqDCoMKgwqAgVkUuIFZFIHdpbGwgYWNxdWlyZXMgbWVtb3J5
IHNwYWNlIGZvciAzIHB1cnBvc2VzOg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAxLiBKUEVHIGhlYWRl
cg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAyLiBDb21wcmVzc2VkIHJlc3VsdA0KPiA+ICvCoMKgwqDC
oMKgwqDCoCAzLiBUZW1wb3JhcnkgdHJhbnNmb3JtZWQgaW1hZ2UgZGF0YQ0KPiA+ICsNCj4gPiAr
cmVxdWlyZWQ6DQo+ID4gK8KgIC0gY29tcGF0aWJsZQ0KPiA+ICvCoCAtIHJlZw0KPiA+ICvCoCAt
IGNsb2Nrcw0KPiA+ICvCoCAtIGNsb2NrLW5hbWVzDQo+ID4gK8KgIC0gaW50ZXJydXB0cw0KPiAN
Cj4gVGhpcyBzaG91bGQgbGlzdCBgcmVzZXRzYCBhcyB3ZWxsLCBhcyB0aGF0IHdhc24ndCBvcHRp
b25hbCBpbiB0aGUgdGV4dCBiaW5kaW5nLg0KPiANCidyZXNldHMnIGlzIG5vdCBsaXN0ZWQgYXMg
cmVxdWlyZWQgaGVyZSBpcyBiZWNhdXNlIEFTUEVFRCBoYW5kbGUgcmVzZXQgaW4gdGhlIGNsb2Nr
IGRyaXZlcg0KaW4gYXN0MjYwMC9hc3QyNTAwLy4uLiwgZXRjLiBTbyBJIGtlZXAgdGhpcyBwYXJ0
IGlkZW50aWNhbCBhcyBwcmV2aW91cyBhc3BlZWQtdmlkZW8udHh0Lg0KDQo+ID4gKw0KPiA+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICvC
oCAtIHwNCj4gPiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+DQo+ID4gK8KgwqDCoCAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
YXN0MjYwMC1jbG9jay5oPg0KPiA+ICsNCj4gPiArwqDCoMKgIHZpZGVvQDFlNzAwMDAwIHsNCj4g
PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC12aWRlby1lbmdp
bmUiOw0KPiANCj4gSSBndWVzcyBpdCdzIG5vdCBtdWNoIG9mIGEgY29uY2VybiB0aGF0IHRoZSBl
eGFtcGxlIGlzIGRpZmZlcmVudC4uLg0KPiANCj4gQW5kcmV3DQo+IA0KPiA+ICvCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHgxZTcwMDAwMCAweDEwMDA+Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCBjbG9j
a3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0dBVEVfVkNMSz4sDQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDwmc3lzY29uIEFTUEVFRF9DTEtfR0FURV9FQ0xLPjsNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAidmNsayIsICJlY2xrIjsNCj4gPiArwqDCoMKg
wqDCoMKgwqAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDcgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+
ID4gK8KgwqDCoCB9Ow0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvYXNwZWVkLXZpZGVvLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2FzcGVlZC12aWRlby50eHQNCj4gPiBkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQNCj4gPiBpbmRleCBkMmNhMzI1MTIyNzIuLjAwMDAwMDAwMDAwMA0KPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hc3BlZWQtdmlkZW8u
dHh0DQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDMzICswLDAgQEANCj4gPiAtKiBEZXZp
Y2UgdHJlZSBiaW5kaW5ncyBmb3IgQXNwZWVkIFZpZGVvIEVuZ2luZQ0KPiA+IC0NCj4gPiAtVGhl
IFZpZGVvIEVuZ2luZSAoVkUpIGVtYmVkZGVkIGluIHRoZSBBc3BlZWQgQVNUMjQwMC8yNTAwLzI2
MDAgU09Dcw0KPiA+IGNhbiAtY2FwdHVyZSBhbmQgY29tcHJlc3MgdmlkZW8gZGF0YSBmcm9tIGRp
Z2l0YWwgb3IgYW5hbG9nIHNvdXJjZXMuDQo+ID4gLQ0KPiA+IC1SZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KPiA+IC0gLSBjb21wYXRpYmxlOsKgwqDCoMKgwqDCoMKgwqDCoCJhc3BlZWQsYXN0MjQwMC12
aWRlby1lbmdpbmUiIG9yDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAiYXNwZWVkLGFzdDI1MDAtdmlkZW8tZW5naW5lIiBvcg0KPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImFzcGVlZCxhc3QyNjAwLXZp
ZGVvLWVuZ2luZSINCj4gPiAtIC0gcmVnOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGNvbnRhaW5zIHRoZSBvZmZzZXQgYW5kIGxlbmd0aCBvZg0KPiB0aGUN
Cj4gPiBWRSBtZW1vcnkgcmVnaW9uDQo+ID4gLSAtIGNsb2NrczrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGNsb2NrIHNwZWNpZmllcnMgZm9yIHRoZSBzeXNjb24gY2xvY2tzDQo+ID4gYXNzb2Np
YXRlZCB3aXRoDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB0aGUgVkUgKG9yZGVyaW5nIG11c3QgbWF0Y2ggdGhlDQo+IGNsb2NrLW5hbWVzDQo+ID4g
cHJvcGVydHkpDQo+ID4gLSAtIGNsb2NrLW5hbWVzOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgInZjbGsiIGFuZCAiZWNsayINCj4gPiAtIC0gcmVzZXRzOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmVzZXQgc3BlY2lmaWVyIGZvciB0aGUgc3lzY29uIHJlc2V0DQo+ID4gYXNzb2Np
YXRlZCB3aXRoDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB0aGUgVkUNCj4gPiAtIC0gaW50ZXJydXB0czrCoMKgwqDCoMKgwqDCoMKgwqB0aGUgaW50
ZXJydXB0IGFzc29jaWF0ZWQgd2l0aCB0aGUgVkUgb24gdGhpcw0KPiA+IHBsYXRmb3JtDQo+ID4g
LQ0KPiA+IC1PcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+IC0gLSBtZW1vcnktcmVnaW9uOg0KPiA+
IC3CoMKgwqDCoMKgwqDCoHBoYW5kbGUgdG8gYSBtZW1vcnkgcmVnaW9uIHRvIGFsbG9jYXRlIGZy
b20sIGFzIGRlZmluZWQgaW4NCj4gPiAtDQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jlc2VydmVkLW1lbW9yeS9yZXNlcnZlZC1tZW1vcnkudHh0DQo+ID4gLQ0KPiA+IC1F
eGFtcGxlOg0KPiA+IC0NCj4gPiAtdmlkZW8tZW5naW5lQDFlNzAwMDAwIHsNCj4gPiAtwqDCoMKg
IGNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAtdmlkZW8tZW5naW5lIjsNCj4gPiAtwqDCoMKg
IHJlZyA9IDwweDFlNzAwMDAwIDB4MjAwMDA+Ow0KPiA+IC3CoMKgwqAgY2xvY2tzID0gPCZzeXNj
b24gQVNQRUVEX0NMS19HQVRFX1ZDTEs+LCA8JnN5c2Nvbg0KPiA+IEFTUEVFRF9DTEtfR0FURV9F
Q0xLPjsNCj4gPiAtwqDCoMKgIGNsb2NrLW5hbWVzID0gInZjbGsiLCAiZWNsayI7DQo+ID4gLcKg
wqDCoCByZXNldHMgPSA8JnN5c2NvbiBBU1BFRURfUkVTRVRfVklERU8+Ow0KPiA+IC3CoMKgwqAg
aW50ZXJydXB0cyA9IDw3PjsNCj4gPiAtwqDCoMKgIG1lbW9yeS1yZWdpb24gPSA8JnZpZGVvX2Vu
Z2luZV9tZW1vcnk+OyAtfTsgZGlmZiAtLWdpdA0KPiA+IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJ
TkVSUyBpbmRleCA4OTZhMzA3ZmEwNjUuLjdlNTlkYWExZTg5ZA0KPiAxMDA2NDQNCj4gPiAtLS0g
YS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTM1NDksNyArMzU0
OSw3IEBAIE06wqDCoMKgwqDCoMKgwqDCoEVkZGllIEphbWVzDQo+IDxlYWphbWVzQGxpbnV4Lmli
bS5jb20+DQo+ID4gwqBMOsKgwqDCoMKgwqBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4g
PiDCoEw6wqDCoMKgwqDCoG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZ8KgKG1vZGVyYXRlZCBmb3Ig
bm9uLXN1YnNjcmliZXJzKQ0KPiA+IMKgUzrCoMKgwqDCoMKgTWFpbnRhaW5lZA0KPiA+IC1GOsKg
wqDCoMKgwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYXNwZWVkLXZp
ZGVvLnR4dA0KPiA+ICtGOg0KPiA+ICtEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvYXNwZWVkLHZpZGVvLWVuZ2luZS55YW1sDQo+ID4gwqBGOsKgwqDCoMKgwqBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2FzcGVlZC8NCj4gPg0KPiA+IMKgQVNVUyBFQyBIQVJEV0FSRSBNT05J
VE9SIERSSVZFUg0KPiA+DQo+ID4gYmFzZS1jb21taXQ6IDIwMTRjOTVhZmVjZWUzZTc2Y2E0YTU2
OTU2YTkzNmUyMzI4M2YwNWINCg0K
