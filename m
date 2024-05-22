Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0958CB8CA
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 04:01:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jlEmIBVY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkZCg2rqkz3vvJ
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 11:56:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jlEmIBVY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::608; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkZC60Khkz30Wq
	for <openbmc@lists.ozlabs.org>; Wed, 22 May 2024 11:55:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV08Xlw8hHAzoGCVRONu6hCDjORa6YN2vwQjlPL8T9FLjQ5l/pOGpRW9I0kL3XcbNqUTL6s6SlU85qjTuH79BBGmNHmCsvqngR0ftAuclBbMoXtAAiCCcqDz9XxkJv1FPbWHQQJxEw8QAvzOv1+i1exz77RzIYKQJUMovfSFJxVKzXW5fSLIOiwkpIO0scYCdhhTxrvhLFwnlYd4yvHt9lIU+w5/Pd4iLK07iy4A8sefB9PTo20koO5FpZyydg1zvRp2eCc2M/5RtBB24aw+prqpT8h/UnxzsZTr9j2FGSTk3MYZzGhuTnybSRvE2lr8Pxm0liU+Q1xp4YA/6RI4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABvDZkeYobqYxTIcaH+Jk3G8LvykOP2W2MR7ra5YYqU=;
 b=UQivPjkBIX8ziy/19tPErVViQ/n8UGyR+LBS5cLvXERM1xdrK0tfFpSU0n41s/BeD6mFiNUI57qX1GuIuNwreGMiOB1FVFrRl2yZilnfkYbb0iV/qmSGbl9aI74LSiXeA8MD6M/SGC0sGPudI75lc/3JJQapxUGGj3WDnrAptxcCwWzI8oUF1ox69lTfY4VTr4pnLF8BFchY2SSL5JD1w+VwbGpBXGj1QlEv7MP8eDy10ecE/G1e1cBtEJL+7+FUNuiejAGZBxEjZhVkGEN0j7qXrfTeAdEtnO4Ghmq2WVeWgfJTbuWy6RoCbKN4zOFbJynIj/dIUcDsI9T9h4sITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABvDZkeYobqYxTIcaH+Jk3G8LvykOP2W2MR7ra5YYqU=;
 b=jlEmIBVY/x52iXt08QXCLTLKmFqojAgVmgR1aevEedVUJTniKMzmpFIe5tf7AejaM7An4/Vp4tslFQj2Gxf+Dc1ZMxljspKdLSNCdQCoAfCyu8XCuIv1rAjw9wk4nxpYF9Yn56F1OBUiyrid+0BYvQA5vOlrCxrFEwXSMq/dz2cLcQeLom6+3rjXFCzMElz0TXBWBLYBfsKCSq4+6Qpo8ubjE6aEIef1hYuEk81rCaetoQZxpal0eK1ERBOWPBTFJ4j0OF4MJK/tNb22OcLiIVuBhjvoSiNPWGxB7uDzX2t1rZdMKaQKnyu5kv5VYiNuExl9UTmhqEMU3KZLb/e5oA==
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com (2603:1096:301:69::12)
 by SI6PR04MB7871.apcprd04.prod.outlook.com (2603:1096:4:247::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 01:55:27 +0000
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::1b85:a99a:8f39:88e5]) by PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::1b85:a99a:8f39:88e5%6]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 01:55:26 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: Question about openBMC U-boot upgrade
Thread-Topic: Question about openBMC U-boot upgrade
Thread-Index: AdpCnSVlJvaVpuukSFyGtRf9EMncEBpTRrOQ
Date: Wed, 22 May 2024 01:55:25 +0000
Message-ID:  <PSAPR04MB4598C0DFF3FAEA1C50E09081A5EB2@PSAPR04MB4598.apcprd04.prod.outlook.com>
References:  <TYZPR04MB58534AB3D2D8245EDBCE8AE4D66A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
In-Reply-To:  <TYZPR04MB58534AB3D2D8245EDBCE8AE4D66A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR04MB4598:EE_|SI6PR04MB7871:EE_
x-ms-office365-filtering-correlation-id: 48e7eb0d-21dd-40b2-89b7-08dc7a023fea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?sEBw/XMO3qm7LcfVdypip2iHtI6PwXlfB64sD7GNgYtphuTh3tDikTkdWRIE?=
 =?us-ascii?Q?I6ir2egCu00PqmF5bOtivz1RxvT0u/dQWKwwbJbHfhS+X5h8N8c5piT1ZeGw?=
 =?us-ascii?Q?O8Ucl4YaWLiUbKjpEjYU1dRHPUp9cnxgstj1Jd3HC77PjTRch63wbA8sJYIG?=
 =?us-ascii?Q?iAhwVRFH/TRo9IGmJki/5T1LsYQmOOx2EiJZ1m6Y0b11yJbwFugD5g0raiMt?=
 =?us-ascii?Q?H0mShYLyxSF2JnJmKLEk9hGTyAP+ukKRrT4zu9Ys6SjZzZ6arkr1eEI+GuJ0?=
 =?us-ascii?Q?Zf/mS5dNcjH7Vyg6qOCQs+7PP3NRWxS4pel9VZhEEAbV2X8HIheRnYk/6tF2?=
 =?us-ascii?Q?RmhJdCNthNrrdUiKbKTqBQiJg+Nlnh2JgezgxMVnEtprwAZB9v8Rrp5GjSXc?=
 =?us-ascii?Q?123avQSTjmqD0u6XWo+z4YPm0uGYzpFTM0RKx+mTlPowFSZ304jLoRXUfF35?=
 =?us-ascii?Q?cNbWLgFCI8qg2TDo26UnY34KdRdvMzarJEEB2RAVT9PiNbhp8Yxu6yYfvZo2?=
 =?us-ascii?Q?3x1M4XCYkGdB9CKb/rHvAK5F4bweZvIecpji1mmqCFC2EKAFZ1epOkRBgfP/?=
 =?us-ascii?Q?PKibyRxNPgh4ISK4kHak96/cocZcmyHC50juGSywY8upg449neoIZrZe9AXI?=
 =?us-ascii?Q?1Q5VMSSBoS4lbEzQiT/lpTL4oaA6t5HRaUNukYxmjXN0vbTEer3qV+JDU+Xm?=
 =?us-ascii?Q?6aRLTSIfD0ik4e7BEAAbUHURW/GJkjWcUpvQnJdpuLLrmj71hMYmORbZAuSE?=
 =?us-ascii?Q?NQqMXwqTC0xYetj9DdTm/myzOtUG5UFVHr5LjDB0matsXI39vf4YYrz56Mna?=
 =?us-ascii?Q?Y5Fkb4BlTXhQ1fdA9xNoK5pS84eAZHXKdqSVL4PoLW0fuWsi1TuOJA4AUCu/?=
 =?us-ascii?Q?cY587PKGJlVp7hTYfEG1sgAI5/1yzEoN7V7Ko5ZPbqh5asFtvHn9aHxaFyTN?=
 =?us-ascii?Q?v899u7mTJ/aNmXYBQKa3JujfoQS1AMCOQ/4vBx+F4wap+KbGSNQXjKUNWm1H?=
 =?us-ascii?Q?51StTgEzKmMf+JEePgkI0EorBmpX2ucnIcVxE547hFEHvQGn3GDF8a5Vb7jN?=
 =?us-ascii?Q?0iEst1pcZqLoGJ+ioW8IS/YTrtLecTjyfThAbPMhmSLsjiENoHdR1b3I4z8k?=
 =?us-ascii?Q?nC686YJRfSZAx7m86ajxs3a1abuU70XITsbdZwcRflK8WtdXCooaWqlOVEsD?=
 =?us-ascii?Q?NPZOYBfzoV3/lxWQb2gIn2l4X3M/oshDq9Tb24bDICQLxgDecsOXVAXKfsve?=
 =?us-ascii?Q?sClfqZ34zlobUDshCCYuao+LA3kJU4th9jJ/AFo/AQ=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR04MB4598.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?U4v4J8Viok8HshPeL+NPgnWlfTbC93R1WVbJaXv4rcCkqdrfpnKncIIQWc0D?=
 =?us-ascii?Q?J0vas31t4WwV7GG4qBEWWk0662KX/3mazDs3Yw+svUxrfTcggRRWIAUzYWjn?=
 =?us-ascii?Q?8ItHAbyAyZ8rpBk/nWgaMJdiC5v6mnNaQCN9OT66WrCsWpRj5P2naGsvUmH8?=
 =?us-ascii?Q?o9PCkm5ycwwwjZzU09au2rzpvju1iYDKs2tIzXb5Jh+Pdsix5uq3fMBummks?=
 =?us-ascii?Q?tMu2X8+D7UZTa8Jom2D0OAry/UmXNnfK9lboYly7brT0OXhwoIDqScKpax/y?=
 =?us-ascii?Q?GeexV3S6YsKw0116Zkoz5EOZ/euCBhzUdJLfADzv057AH0nJ6Cq/JxzWt66M?=
 =?us-ascii?Q?0PSNgZKKHXsI5EiGudG9xyaQxyiYR1MKICdvJlDTZB2pRsP7Rd48Fj6SM6ps?=
 =?us-ascii?Q?Zf0ySn7RAnlurRxJuW3Rldb2YuCiTN+1BBhwDQsYSf6tNJvb47ZDLRBdLHvS?=
 =?us-ascii?Q?Gk7GK52roDMYsRGOSp5dVcFgKejx/QYA/T/rdqL4EbSkDq5qyzCsqu+lXu8Y?=
 =?us-ascii?Q?7Xx9Wk9ebO3SCgzp+dbbS3bflI5IC44/I9lguFi17ZOzUmt0rj42iCoyKkxq?=
 =?us-ascii?Q?E2Il8GkXZplVe6YJiSJ4seJn+HlY8s2PgUBnDyAa1kyyUb690+fmmEQ7hdwI?=
 =?us-ascii?Q?3VKentG0sxx3APt0p1RHT/79U+vVd0RYbOEwIFP8oCnkBFMI8/wg0U7x+mwE?=
 =?us-ascii?Q?X1O9qUJgOp9zlfbGI1dvv4NUuOY110SSpqDtBxcPKjsdPQ61m5MqluoYkmhS?=
 =?us-ascii?Q?Ks4esSyGBu87v6Gyfm6C9IhhMCS8bsySfaF/VxLuiJfP6x85KMUMDTn01kyb?=
 =?us-ascii?Q?4Gct4q+oanTSfJMgiltV2HPkW+6V7C38dFWUaD3L7GHJYxHw09GFmbM3rSya?=
 =?us-ascii?Q?13vy5wTdtrDhsIenihtV6GdcDtQa7z7T3SzslGLX0yKOZFNwnJwQ0cypbSjw?=
 =?us-ascii?Q?HAH+G731H+pqgn6yMaIWrAyE3y29/zQD+ucvE1PsZljaq2hkGphneMiEV24T?=
 =?us-ascii?Q?ITPoIPjm5rtMATAnBLDwhv8VaUnIRPyz6fRY87Hu4mt56r28uwr2/JuNn8eL?=
 =?us-ascii?Q?9eHcJBwVTKP4Auze/iQ6bvyHxYglIWsh/joFM4kvT3qtcm7qZeFWNNdPLZki?=
 =?us-ascii?Q?TRZ9rGBORcs+AjMUcEtzszab/UPwBPmo4poqyfLquSa8QVoE+B7IHp4+CquA?=
 =?us-ascii?Q?qu588lX8hJ/VGuFe0J5JS74UqXfnFeVDVR2UpK+YcZ4+IpDNLDJumEZ3xTn1?=
 =?us-ascii?Q?Iwi0c5YOzyFWqnrYHZnbwJ1GUa4SHbjIzGJIJLO26+KGrJHzAz+l5vvVekzI?=
 =?us-ascii?Q?n/sl6oAD3fps/JZ65M1qVa7P6XQtvKXVJ0aKmXmphFAK6qo87ybk9M0H74LS?=
 =?us-ascii?Q?QGFMLc+0/axQgeivxYeHoKY5qeRcVNUK5botJPwIxQ/bDEHwA699eG80jJUi?=
 =?us-ascii?Q?elpZTyF1PAHJx8XVFs970qcEO0YwjZiDs0J7ju3Ek36bcZKOOVnCWcgdKA/e?=
 =?us-ascii?Q?FzwrYgOHFX79N6qHuGkjNm2bMSxSBh4969+V0qvR1hCdHrPrVQbNeeWZxYnY?=
 =?us-ascii?Q?/tPX95fKWBmYceCLnP9VOFo2Jg3tLIAmCoqYqPxI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4598.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e7eb0d-21dd-40b2-89b7-08dc7a023fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 01:55:26.0296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJqHb2aou6B1wkLcD4QeNSGaW/UA52jZBB7WItlKstBzupamq2/b+6gKzwCz+SBMBeYhKNAPYucWSfieJwZy7AkE9tTeCBrYvrYQFVmSUos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB7871
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
Cc: openbmc_compute <openbmc_compute@meta.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,
We sent the email previously, but didn't get the response.
Has there been any progress on this request?

Thanks,
Wiwynn BMC team

-----Original Message-----
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>=20
Sent: Tuesday, January 9, 2024 9:45 AM
To: joel@jms.id.au; openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>; openbmc_compute <openbmc_compute@=
meta.com>; Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Subject: Question about openBMC U-boot upgrade

Hi Joel,
We are trying to enable soft SPI driver for BMC to send TPM2 in U-boot.
Upon further investigation, we realized that the configuration for the TPM =
SPI driver in the current U-boot is not set correctly.
But we need the newer version of U-boot to enable it.

The commit we need is
tpm: Use the new API on tpm2 spi driver
https://github.com/u-boot/u-boot/commit/a5c30c26b28c601a7451ac93b5c5b16c047=
2d89d

We prefer upgrading the u-boot version specifically for the TPM SPI require=
ments. Is there any U-Boot upgrade in the near future?

Thanks,
Wiwynn BMC team
