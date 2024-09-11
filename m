Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCA9755AD
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2024 16:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3jpn2SvMz3cC5
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 00:37:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c408::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726065469;
	cv=pass; b=lC4We459ZJe/mqvfvSZBotZOzO5BgDN69OfV2qJjSMFgPBMRse75cMANfppC2ppJBbZNSRlstU+gzl4Qd5Y4cmSgdde6fovwURZ9EA57JdPuWpTUbQ6dF2w9ftqtKXl2mp3/9oc13IT4+CJNNz3GIvPiAlm52+i2EvRB9Paywo9YsPPT7izpP48Z46emIjLNW0vLj9p312cr6PU6GNTvZbbe/O6mTOYMePGrIf1BR9VwawBktZPGbB5Wddct4jZXCKYcGqOYncWJWESW951RFzNCarnS3s5/NFLK+l2rGhptuzThwHX/P3OJQNDyhX/ByH6IAbdwuHvrxqtTeWKKTg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726065469; c=relaxed/relaxed;
	bh=D1l/UGATfmiat4YERiRptJPsvojxPkpKbMt5+NaFOyY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Eq40klbIO34MnDvler5PhQPoNwkEV1mZTqHrmNwqrjNJ6y7mO38LLGRXPYsnB05b2U6yxvjnSvgQKRmwCORDOqLCt09jJJQ4b6SZNA7DLEESokPjSs0BNwASlqtAXGljuQrIqZsA3IxjHr7N80cxh1hD3ED3yUdYYAmksASaPuMyELTz9taS1vn02hY6ex3nsCcJ4AtZ55YWl1Y8CvWeQRfWjBhK6LmIQm+3+fNB+YoEP+gZK8AIzahbD4fUdZW1x++zLDHBT5W41Jer61gvpzhA65aSANuNojppeqVYkAV4ES4q1rdhb8irkaAGeXYUfkbIgI7yKg8s3o5FrCumGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ltts.com; dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=2MNW3c2b; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c408::1; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=gundu.babasikandar@ltts.com; receiver=lists.ozlabs.org) smtp.mailfrom=ltts.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=2MNW3c2b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c408::1; helo=pnypr01cu001.outbound.protection.outlook.com; envelope-from=gundu.babasikandar@ltts.com; receiver=lists.ozlabs.org)
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c408::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3jph6jKSz2yPD
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 00:37:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ5uIigLMR7vdFE6Yeo+GqEltihNcYl55msD506xhVynxCqyUlaPhiHDMbwZiOinY75DfBR8V6XkuA45UjOpwtCz7UlfvevUKtg2tHoTGiIGKNPGbUXiERyD6eA1hlnbyUlRmVhOKIlevyfzwyI6S5V3XY4yLVbjXA04WVzWIXbxXGFyFIUsYekbYWS0+74c8KmTqxxG/zdRR3c3MaJSwI7mkQdHPQtKRY9/e86WDt5efcDxl+miHY2fvKnttqTJcfZxpmFwFfzMllSvNLQANEHlF2QwkeUneA11DoRPYDqlIObbyCbT4KGQCud9acHXfOl00mjiw/VaDOn9tunhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1l/UGATfmiat4YERiRptJPsvojxPkpKbMt5+NaFOyY=;
 b=ciU5DUaPoVv++/ETMBBDjkAqBZ1EysotKMGwyF9gyR1Jah3MNegEpy8PG1phHZhBIcyNtVLCMV1ahjizXiYhY1GeE424V9Xomj2oKqePYtaWMtnj8aSgMhjWzaRBjUYR6BgNXB+Czmvz/NydpDORIc31dkuaozAC4M5hwqJqyINI7g/GybcCk7yGGH9Dp/Ywlbh4alJmce0ChzpE3seK/2beO5CDzJlNv4kTuL/0t4Y9JZInMD8QYnXbTuBhzqOZma8P2UZVdnlK0Jr/1V4qGdquGRMtxICsd7wcUyMtq8vmkIFwx7XeUC6Ln7hkeHcsNe8l03YRgGmmTGa+b4Uu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1l/UGATfmiat4YERiRptJPsvojxPkpKbMt5+NaFOyY=;
 b=2MNW3c2bnSGWab1Cz5eMRHZDM7llY1N06oRz/0SHbUCk5D/1Cp+vCFQXddji5HHFJMzzeJDdKWFHf2RlPV1Ds5xZhM46GyL4ReUb1T1nQxnzyLnAj7KKZu7knML9z2H5/d4ELQnbn7xOfo8v755DnUcp/VygGQXZqQICzfymBwfIOuUMUp1ZN23oqDW/YByHwwOn3t9Ys5UPY8Gxk5LVPcNthNaVGLX+AypzMCLv82kFTZOAcfmFY0g+paRwST357DHgFoz6ms8Ysb0kE/EL1lyCyTb2MuxhQCysGYtLM6z7GISP/wyKjmx1G3NrJcIbYkYxXiudr09p83lxEGXQ2g==
Received: from PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10d::13)
 by PN2PR01MB9959.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:152::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 14:37:20 +0000
Received: from PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9fad:fe51:f15f:9e15]) by PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9fad:fe51:f15f:9e15%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 14:37:20 +0000
From: Gundu Baba Sikandar <gundu.babasikandar@ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Help with "ipmitool chassis power on"
Thread-Topic: Help with "ipmitool chassis power on"
Thread-Index: AQHbBFZiO80FP0MlAUy6RHfVDe6T1Q==
Date: Wed, 11 Sep 2024 14:37:20 +0000
Message-ID:  <PN0PR01MB9336C133AE2B5EC1C3415336E09B2@PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9336:EE_|PN2PR01MB9959:EE_
x-ms-office365-filtering-correlation-id: 4e47aa51-b557-4b31-bfd6-08dcd26f3e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?Yzk6G/cKsv0WnGi7hQrjP0S3oWF9xQLGtZNJ3ySKj0h4B4Z8B06W5nIgRw?=
 =?iso-8859-1?Q?cPOL/9sgkvRxylf70gagmk6d/URjUgdnL2AwADwv0lmx+wAwdqY9sNxIus?=
 =?iso-8859-1?Q?AK4tdsD47hnFgIkhPTupbVhiuWFR/JLNVZXV4zyoeFDt50AD29zQoKThV3?=
 =?iso-8859-1?Q?eN/xM40QoqFZ9IB5lxBewpL+1mKiMJ0hhX/pnF+IZEoVyNJTiM0PWLWcuT?=
 =?iso-8859-1?Q?KTnz/BJ5QBpnIsIzufhgqhybdE61587oALsW89KlETs3kry5SJussTbtk+?=
 =?iso-8859-1?Q?pgTJjG1GRbBzJpyoOVwlcfWzlklfAPWcGBmJTaJ6C7Vzwwc/khzDYRLTUO?=
 =?iso-8859-1?Q?nQ9b8jAiopah1Q+Of4EOvfoJpdz+2ad38Vj9SUetBuQgl39bRQh+RfEawN?=
 =?iso-8859-1?Q?AkRwRYVC/CPdWpLayFvejKMXlos/lnQ0wiuTfKTho9aUDKFm8arRY9Vc7J?=
 =?iso-8859-1?Q?nS/8XMqZqDY+MUi5ExrpR+lNd6UogUMMty3dtZguuv7c1bXTzSjsKsljEO?=
 =?iso-8859-1?Q?jAoBO+IW/E2538HCkTbFjMYjyPH11U0hlihOHaERyyRF9f45WyJIi7cQLX?=
 =?iso-8859-1?Q?dGYxJG0CjX0l6pVFznPpS4qzPp/j5ShJxzpiIZozK2PZlY9U9XcykEQqJG?=
 =?iso-8859-1?Q?GihypoS8HEhfJb43W8ixTjoNPJlSfAm1xLlcGq73ODnI3cey3ia1rZPOGx?=
 =?iso-8859-1?Q?Dcnn9ed80KGvq+AKh0uxpYyyvyGBPaRyBfz+W6DrnyEuV5r+5FdHlDXesa?=
 =?iso-8859-1?Q?o91SfQqbmrAqKY05kka4ce2iWSNYuerURpkitogrTqFQVQMCDAFa21LnZt?=
 =?iso-8859-1?Q?ImMN6R2aH0AAVYW01MhoqWYDZaVqqjXiKl2dtVMk4iYOzIVVTC1PFCR4+G?=
 =?iso-8859-1?Q?+dfcGYjrgM+kbBsfC+qMgF/WXZyF2OIRv+CJH4wDTwsLOxvQfE0YVNbkmW?=
 =?iso-8859-1?Q?OvLjNQ+0GxZmz7lFTxVCStnhum14Zlkqeic/dLfmfx5ehdLi6Z2N+sREpd?=
 =?iso-8859-1?Q?8E0S+AY/sl+g69eNHYI4riZcU89/W3k/qK0UZsvslYTpjAmVXh8h0+5tGG?=
 =?iso-8859-1?Q?cRz+E563TNqckPVvjvfL+jTdl4ymRgE2Jy9v5Z+q+nKXFJ0rdXNgmHNzL0?=
 =?iso-8859-1?Q?YFkxaDWjfsamBq5JohQ2yrWVRrsZpkBDDsGYd0ItMLBsfJIV+caEe/bQqO?=
 =?iso-8859-1?Q?LOjOO98vfHtL58ifwaYel743YM5m1TjKlEEb00ao5BA1WcMelbvXudZAdK?=
 =?iso-8859-1?Q?jRp9RKqyR19lJpFKCNMMFSeTetrrIfWb2briVVd1zXDzvIBKDWp+WDk/wr?=
 =?iso-8859-1?Q?0/YLHA0MIu2CmrH+jlKnYk83b+f3Yf5sGx36+av0ZZP6fOplyST+5AyPln?=
 =?iso-8859-1?Q?oUJ6h8/lDNHrBGrmSg+ziw43QY/ZYTuyfafvu0pAhdPzoJZd0sW0TDn7Pj?=
 =?iso-8859-1?Q?3i97J3vBOqT/nl/TAKpWVpeG5VzJVnA9yvmx/g=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?DmutPCF3LoLGa34vy5yBYChUFMI7nFdIOO8SSMgjrkdwz4LIJu/kvrsFzw?=
 =?iso-8859-1?Q?MSLTNdjgnj08TwGWie2d8YL98GdBkYTnkux1Uqa/n1BNy9hmy5L5MtD66W?=
 =?iso-8859-1?Q?CszzUlmvTsU8EFIM4DsyZ3tyiw7hWZ+jISQKHgp2X67HzK251RH98nVyK0?=
 =?iso-8859-1?Q?l8E+MHlECxnKBaYhr+cGv7FFG28Crmu9r4FmVntJnTX0sk4sZ32rxW+39R?=
 =?iso-8859-1?Q?ZL88vdiuwhA4zyq3uw4QD+j6ZPplMlRXy7zdrsxVJCEAb6owiZm9X/zRnj?=
 =?iso-8859-1?Q?j4ipl69mhNF4Mr42knNR5M7jQUyNIxd8O7lcAbSlW/JxZqzXQBu4svfi32?=
 =?iso-8859-1?Q?MrIrRrIsrnvZGdDreKVqNHW7jt+8Q/eUCEELiisqUwO8PAvbDMDh2EaC0w?=
 =?iso-8859-1?Q?5P9Zsof5G1FhrgZcXl2/UNsjofevgryv7G4xgD4EdNr1NaIE0JsjFE3nq+?=
 =?iso-8859-1?Q?5ZWtMDWqbgSpZMARwFJ9D2T1L+fPJv69Se1FW0waaRuyst+m7YxljwM7gA?=
 =?iso-8859-1?Q?lOmXA6+bSb3Ym7ZoNxb6ZXkhdOeaXOH+LBjfOYt2jBKACEkLa7/usyYC2p?=
 =?iso-8859-1?Q?Btx5Or2BVPj4XNhtryvTyMa4WtI1zSXeTHfAR1RbHtjN/apjCqy+JVFbRq?=
 =?iso-8859-1?Q?eW/jCrcmleJ0tqfJvw3r+1hUlest8B3wgUM7at9qa/hfgkZwL/0qsldXwD?=
 =?iso-8859-1?Q?03vCtXdlAnrhnDgCLvv7ZanWb/YmSHWpF0ZdZuJxl+Dl/YepzQ7Lkhnigx?=
 =?iso-8859-1?Q?Obyp8a4YeCjntK48y2XXv6NYrPBSPoUk/95mw7JGtqU5QVIIXagHG7r1Yx?=
 =?iso-8859-1?Q?dzHnATvhwk5RzyY0T2Ti2LhqCCM67lf8tZ5OOCmv0K/H4RQx6PvpBPa7H5?=
 =?iso-8859-1?Q?Q57k2jtDsOsM6eNCAYFAmmQIyB5/pHSWvDFUHnFcYBNbsL2DxtHo5tP/8d?=
 =?iso-8859-1?Q?IgZGbEZkC96KLvFFg9nFrYecdHIWk2u9KEADsPrwjRwYdFq+aY3D35GMG5?=
 =?iso-8859-1?Q?YgEaOqKRzKNNeKQe/YZ1yunssVNnwHG/4DD29RT9AJddQCE1alVj7B60dP?=
 =?iso-8859-1?Q?0r0O8LdUIH31DV6TVKXfvKhjTf3enESQLfSg0z0MZR6cDPdYG/Qb6rfY4A?=
 =?iso-8859-1?Q?6ftYPOBNWiYyfrCPVYS6TVa8qCXzoZ8jHq/pTFQriiNqbEKkL/AS9wMmOn?=
 =?iso-8859-1?Q?SM1aZ7YEUKxMGtDMvv1hQHalaW9F+IlS+alpAH35Xf5tuqwzpYp+QpbVP7?=
 =?iso-8859-1?Q?C01DbYRkKtsFTLqNLdMZSUFC/8T76A87TICQaH1lkJ4L0hs+FY+HLzcU5l?=
 =?iso-8859-1?Q?yqeFH1hotglDLMb1mxcWeOrfic4sM2Z6wO2xLxE8b6nCJ0n4a20FTweEkQ?=
 =?iso-8859-1?Q?QBI1/dkD5dPSuSwVD9BF9/X+a2P3tjOf2KWp1z1Z9FLd4KBRHJ9ISV+9mE?=
 =?iso-8859-1?Q?hRz1AEPQubf0R7bM/QBWiQDRW3nEIZKtraoSDGFxTs3Dhp45GNpQ2dsBz1?=
 =?iso-8859-1?Q?UdJhbIm6DAobr3sMt8wQYwm4oHuRw0H3WGJw5eyyAThouhmTCZEw5XybVJ?=
 =?iso-8859-1?Q?xERQ71/FROGhREZJ3QvvDAI1wVWYvdruCz3k0rtB4g/PUQ5ov0ImJ+sOo1?=
 =?iso-8859-1?Q?RsDVhNixDNfxLveHGO7UfyFrb8EW0Tzf/Y?=
Content-Type: multipart/alternative;
	boundary="_000_PN0PR01MB9336C133AE2B5EC1C3415336E09B2PN0PR01MB9336INDP_"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9336.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e47aa51-b557-4b31-bfd6-08dcd26f3e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 14:37:20.3224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqs+bdd1l5MoC0RfRiUsQnD8WMDGZHgIPqZGN5UGeYKvrHewWC74H95+GzrXqSGez9piIaubpp0UQo/KiIgYm8IrZLh/enmlnh6RN0P6vfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9959
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
Cc: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PN0PR01MB9336C133AE2B5EC1C3415336E09B2PN0PR01MB9336INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am working in openbmc and using ipmitool for chassis power control. Below=
 is the error I'm getting for "ipmitool chassis power on".
root@ast2600-default:~# ipmitool chassis power on
Set Chassis Power Control to Up/On failed: Unspecified error
root@ast2600-default:~#

Kindly guide me in resolving the error.

Thanks,
Gundu Baba Sikandar


L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your priva=
cy. Read the appropriate privacy notice<https://www.ltts.com/privacy-polici=
es-notices> applicable to you to know more about how LTTS collects, uses an=
d stores your personal data. Please visit our privacy policy<https://www.lt=
ts.com/data-privacy-policy> available on our website www.Ltts.com for more =
information about our commitment towards data privacy under applicable data=
 protection laws. This email may contain confidential or privileged informa=
tion for the intended recipient(s). If you are not the intended recipient, =
please do not use or disseminate the information, notify the sender and del=
ete it from your system.

--_000_PN0PR01MB9336C133AE2B5EC1C3415336E09B2PN0PR01MB9336INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi all,<br>
<br>
I am working in openbmc and using ipmitool for chassis power control. Below=
 is the error I'm getting for &quot;ipmitool chassis power on&quot;.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>root@ast2600-default:~# ipmitool chassis power on</b></div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Set Chassis Power Control to Up/On failed: Unspecified error</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>root@ast2600-default:~#<br>
<br>
</b></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kindly guide me in resolving the error.<br>
<br>
Thanks,<br>
Gundu Baba Sikandar</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b><br>
</b></div>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r privacy. Read the appropriate
<a href=3D"https://www.ltts.com/privacy-policies-notices" target=3D"_blank"=
>privacy notice</a> applicable to you to know more about how LTTS collects,=
 uses and stores your personal data. Please visit our
<a href=3D"https://www.ltts.com/data-privacy-policy" target=3D"_blank">priv=
acy policy</a> available on our website www.Ltts.com for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential
 or privileged information for the intended recipient(s). If you are not th=
e intended recipient, please do not use or disseminate the information, not=
ify the sender and delete it from your system.</p>
</body>
</html>

--_000_PN0PR01MB9336C133AE2B5EC1C3415336E09B2PN0PR01MB9336INDP_--
