Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CED476A85
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 07:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF2bn3BK7z3bhh
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 17:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=UvT3RWxI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.123;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=UvT3RWxI; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF2bB4jvyz2ynV
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 17:41:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYFNcrVfdV+gfDhFCZ7GCEdS8wjUvj/dpr07x1Nl3yRNC52DeNJfxtZZJfS+g3PdLex8HpUrDBJhqPkIlLnTZSip5JORTPnU6zFagje9qPjQrF848otiTXay4ntIRM6zBuMwiRuaTlxDDvYB5J5z5SrLyzJ3yRP2SyJFu3sgCAE+b9ttgYaBuXrH0OQ6gckJ4h6+sEAzVlZm0sAVmz77dcfvtw+7YTEROutT9MHh4l7glmEoTydRsvmcEqDV2mf47hRRpp/COKDTFRwUttGMP+/kqGHhnSc3MFuvtvSDhp+8is3ZcOct48kYg/1+UQb9TBmUdnaNjc7Bkr/pdnQWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE9sZDyKauCtPA+A9cHiBFQxSlyGDha5qYXBCg3PavU=;
 b=kXaKjlJ8U5Xk9bx9phJpw+758fjAhW3jpjF0l5Q7xnzRejyS0QJ4koLt+DlvIENJA4rDDsj3ydP7rseCiThjs4ZS2HKAgBHbSjU6h5FHIlRvw2NpHkZl9phhKgOrr67gfM2jE+yI28sMo1xvM6hzA1nVUqI/KkPx9lZGu7ay1y6yWZOkvRJNxdlZb/pS7TlmJbaUGJ0uQxURrIPd5ZBaVSM2owOZXqmZ1JhA3qZ3FzFMCi4ZOgw6bc/b0D2hHJgGDYcbNtjwz4Y4XJZ252ddXOO555vPfYLDNn6loSLF8IW14oadvvKAtPyoMzS5264PV1AVBvELm5Ml5LE3ACEL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE9sZDyKauCtPA+A9cHiBFQxSlyGDha5qYXBCg3PavU=;
 b=UvT3RWxIe0jltwLB+Qornv+TbwzWHd0QOl9H//FQgLIWt+vt7a0cQNo1Rc70UEzCUl2krlVwrdT9ctJgJXZfbMT6ABEkc79ltz2Luvx+klcDY3xkW/JnWdeiZVN7RzqYPHgCpit2A7jrz8nHvPJwaDuV8AZ3r7vxoSs3TSiO9zNVa9Tb4CyTQfvFcq3inN3M7F388Hr5ll9WXQiOYeCabFLJfzPvjJla1cXxpN6rraIkKCTfmUyx715V15J9YW2kzRbz8mtm5bvOnKWTHnqrKQAAHY7npE0X8eSWNoKWjCqxggWHp6JhLc7u1gYLGYD7cpFIOUFyf3u3v91jov4O5Q==
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by TY2PR06MB2656.apcprd06.prod.outlook.com (2603:1096:404:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 06:41:37 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d92:8751:482a:707f]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d92:8751:482a:707f%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 06:41:37 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Troy Lee
 <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Subject: Create AST2600 OTP image
Thread-Topic: Create AST2600 OTP image
Thread-Index: AdfyQLbr0fqFqVnsR1ui4uNr5fRJWA==
Date: Thu, 16 Dec 2021 06:41:37 +0000
Message-ID: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71b04059-dfdb-4b34-7969-08d9c05f1bf5
x-ms-traffictypediagnostic: TY2PR06MB2656:EE_
x-microsoft-antispam-prvs: <TY2PR06MB2656BD1754D412086E805C43FC779@TY2PR06MB2656.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ycBQ8dtCh1IWkp3NFcEAy1jUVJjp4DsxACJNrxi5sws67OPLwIK0gB15gYt6BJqhBJ/2QSU1rYiH4CoHIHO6FY4AY3MM6j+YxEAS0x4Jv4+voPi0meO2pGXV+7ferbkRs3GJqYo+YzT9Zr0kTJ421Y4Fnxj7yB4990aS8AOgeBlt2UIHJ1AzoZ/Ar3T9DYnK7jmsUnWfl/KQEnstYVUQhkScXWE4wBOFbYb1KANf0ZLs8dq41IGr3b+ka2IabX3WTsq21wUOjR/9dgDMJ/+t30vWxcuQuJY7RX/OlW1BPFGV0VhnIXSAVJfTTX8glotZx9CJ0HorYCHhI0C1/FCM9GYeylOnZMRvo1b+peK2IWNRysUrxGVvPKuwB5lC9uXyk2fwVTnnPtzhoPithtnGvkfT8YiA8Euvu26+rSIaYQWRqnKrjok4IWtz+gHr5om5fbDnY1s0f9orZ/V2UcJu/ard6Juwaif2dC+eQKL7b1Lmu3xv+upuU9CK/hG9CbEBh9o17vFc8kG03pe/4dMFfpWBkmiyP4ea4n/eftUWzM7MdjIeAkgzsfpRW+9ne1RazlrgMR9fqzyJZCHf5fDPHxSHDLi0D1lFhEwJrI5f+TjnHZHKgYakbkdDcETzkeuLfvmx7+vRnWsQWd5J15ilb4998Ts82DU+5evi0FOVnZR9e+VCnDTq4iOVTU27ykH3wr1AEZr7NFs2823L+QNSPOa+DOLCQ+7XaYUNY+GmLBaG+x+OJjR2dt7B+ATRaYTtBLsTYxmRRNBRJYl2XHrBW2L/F4N0azBZc+QvpELLUZUFAV2Oyr9jLdB6744+kFQrfE4zWFZqeolM5cS7mm6Hig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39840400004)(136003)(376002)(346002)(110136005)(6636002)(83380400001)(33656002)(38100700002)(5660300002)(166002)(107886003)(26005)(6506007)(52536014)(76116006)(966005)(71200400001)(186003)(8676002)(86362001)(4326008)(2906002)(508600001)(9686003)(38070700005)(122000001)(64756008)(7696005)(66476007)(66946007)(66446008)(316002)(8936002)(66556008)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?McDkNZyCkz1PguOqPYd/ChMQXRBqbXCgcxpszwqDb/JXxMkl8CPovCaCscTw?=
 =?us-ascii?Q?KuBJ8kX8u0kYQNw8ZV2srGinJF7VVSo6I74pO9ebk8MtlXRk9wpY903CV35I?=
 =?us-ascii?Q?aFrMdWKl4V85sLLLJt9cyH7cgNnmlQmfPTVgW5cw5w1GC7uSIhz811ktNVQk?=
 =?us-ascii?Q?e2PLYBUFOxt7ZDtUCxC421EM1PPwDrAh10QHN1/1I75hEbwIQll6M7MfVwjG?=
 =?us-ascii?Q?YqLoNl5hc13/ZE0c6sl4/dPaiIRBGfD2fSNaxuyWK1dJpQWB2VavgM0wW5BL?=
 =?us-ascii?Q?kWsOwF2KUov7an5f4cAvV9UytI5sWoohKMgiuKym6EJY39ZQKXq0Ie9FiVs4?=
 =?us-ascii?Q?OMNF4JtJARK2YUmeHQm01guVrpDIlY8sskWO6phBMjIzz6gjyzWW85j/VnBQ?=
 =?us-ascii?Q?B/qKeqANVxZj/1n78oqLjtH3/aheuQuJYS90Hfn0sUDmHIAM4gkW8dCL8PrJ?=
 =?us-ascii?Q?+gJw1XolcA/rqWv78RpjD2o4tOQdyWcvHqoWnLQkYuKJlGbB/osduM6dC5c9?=
 =?us-ascii?Q?39axTQplJgpZgaEglQU9IrUnYZ8T4Yc6+9vTr3WOtekf8iuWDov3luy2/Yr3?=
 =?us-ascii?Q?g3aj2suCFqdmqHTQ+PRzZYADXqIZS/CwnxL5UGt7em5zjAB0liorVfLLBhQg?=
 =?us-ascii?Q?gGxHsrDTLjMSDsN2VaCRWxhr45BclW9JN7GCPPPORUQIYoWq8KqWd9AQ694y?=
 =?us-ascii?Q?vQYSo69njoYHn4ABIx+ZYvf3RLFbBjTiKN1BdGI72ZzDX8qAJHzeGBH+dKvt?=
 =?us-ascii?Q?/E2WZ20VE5mzfNJC3u2zzw/iHKxig5tLa/mnit416GU3aJHggf2JlNKZWcXX?=
 =?us-ascii?Q?EAsPV9BM/Uycyk95KczZUA1Ln7oehvvZkwBf1CVXqCDfsHx+8S9QEAYytBs/?=
 =?us-ascii?Q?3b0coE7Go1JOO2A0DDVp+KB7qMCy24N1PN9Uy0TARTWgS6mWl5JBzBj0iqtO?=
 =?us-ascii?Q?TAVXa+2jYVERdz75YcvBzJ2gQN6gjpKsU+kI+Ns4xytjjjLFNyeVynVhGJve?=
 =?us-ascii?Q?tyM4atZkyFovXv0OhjEM/rzm1Z9WxLnjTsRGpw4AWrYO02AOuqNj8RbKmXpa?=
 =?us-ascii?Q?bjWVjJLRaE35pPF5c1jm0YBBbsbJDxXC9OjPuBhAzh4MCvnTP83unZY6YzM7?=
 =?us-ascii?Q?TSu8ZkGHrCwTIVa7b8893W5ZK0NDVoLdsAW/i+ZPB0s5a2kyOZxCxX7DP3ex?=
 =?us-ascii?Q?Jz3y17Mn72QpfEPX787730C59ol/6TRSOtSPNGfDbY9WO8AblsAxqDFpXBHs?=
 =?us-ascii?Q?04BIoEzBmHFLcSdbCUXhpO84+Dz1z4WbDT5BBjXxzXr8c1BcP4yLoQtNclEN?=
 =?us-ascii?Q?EfS7ZMino5B+q5jDOB4zZgo9nS0/YUvc+nW/kGtsNPe1fpZHIScL5WZIJBTL?=
 =?us-ascii?Q?d+RIKAqJI6Dc4vWfdmmpz4x1ZlCYRtOwH+ix6nY+FQ4q57tARN4KxD5NQ+M7?=
 =?us-ascii?Q?1DYB1syE9m6FGnqSapDWRjPYn5xKmWEnOfRJXJD92c9KD99bTnnedXpdMO5c?=
 =?us-ascii?Q?uABviO14ZiE+uVRW6Lqeg/wgUC5oQLjLDU5guYgeFaCC1esh1dgHRNSUmIeb?=
 =?us-ascii?Q?mHzzBh14CJQPs7iWVDW283tj8ZDSm52zAjiyBnXOrztcR0/cVgVxfWbD8W8b?=
 =?us-ascii?Q?6WwQ079vICN6uJftVw7AXWBinFeoFFep0hq4LpgvuPB487Z36ugm5ICfN1AW?=
 =?us-ascii?Q?ySFNkA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TYZPR06MB4015221527D36DC4780C1F23FC779TYZPR06MB4015apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b04059-dfdb-4b34-7969-08d9c05f1bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 06:41:37.0634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZzxX7aA1KvPAXf6HrWG2dmEOqPiriZMC31hhv+iGX3q6e/QZNdIeDd9YI3QAToNvBh89/k2f7iGzHyQlCozQ2cMc/StYBtcY2gw5vBRrm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2656
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
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR06MB4015221527D36DC4780C1F23FC779TYZPR06MB4015apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC team

I have some questions about OTP image creation in OpenBMC. To support AST26=
00 RoT(Root of Trust, AST2600 ROM code verified SPL), users should program =
"A public key" in OTP and uses "A private key" with SPL image to create sig=
nature and place it in SPL.
The SOCESEC tool help user to create OTP and SPL images for AST2600 secure =
boot support.
The following are my questions and solutions

  1.  There was a socsec-sign.bbclass in OpenBMC and it is used for SPL ima=
ge generation with SOCSEC tool. Do you agree if I modify socsec-sign.bbclas=
s to create OTP image?

If no, I will try to use solution 2.



  1.  I will create a new recipe to create OTP image and this recipe will b=
e placed in meta-aspeed/recipes-aspeed/otp/otp.bb

To successfully build the OTP and SPL images, we should create the key-pair=
 one for OTP(public key) and another for SPL(private key).

Do you have any suggestion to place these keys in where?

  1.  So far, we placed both private key and public keys here, https://gith=
ub.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-boot/files

How to get the public key in OTP recipe? It seems I need to place public ke=
y, https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u=
-boot/files/rsa_pub_oem_dss_key.pem

in meta-aspeed/recipes-aspeed/otp/files and private key in u-boot, https://=
github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files=
/rsa_oem_dss_key.pem

  1.  The socsec tool settings should be consistent. For example: If user s=
et the algorithm "RSA4096_SHA512" in SPL, it is required to use the corresp=
onding *.json config in OTP.

https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-s=
ign.bbclass#L8

By default, it set SOCSEC_SIGN_ALGO ?=3D "RSA4096_SHA512" to create SPL, it=
 is required to use https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-m=
aster/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/=
ast2600/security/otp/evbA3_RSA4096_SHA512.json for OTP image generation.

  How to share the environment variable between u-boot and otp recipes?

  Do you prefer to add "SOCSEC_SIGN_ALGO" in machine configuration file, so=
 this variable can be recognized between otp and u-boot recipes.

  Do you have any suggestion?

  1.  How to trigger the build process to build create OTP image if user on=
ly issues "bitbake obmc-phosphor-image"?

https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sd=
k/classes/image_types_phosphor_aspeed.bbclass#L84

Our solution set the do_generate_static_tar task dependencies. So, build pr=
ocess create the otp image first, then run do_generate_static_tar task.

Do you have any suggestion? Do I need to modify this bbclass, https://githu=
b.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phospho=
r.bbclass ?
Thanks-Jamin

************* Email Confidentiality Notice ********************
DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.


--_000_TYZPR06MB4015221527D36DC4780C1F23FC779TYZPR06MB4015apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:88429001;
	mso-list-type:hybrid;
	mso-list-template-ids:247338540 796664276 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
@list l1
	{mso-list-id:480200177;
	mso-list-type:hybrid;
	mso-list-template-ids:1973950360 -615735384 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:66.0pt;
	text-indent:-24.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:90.0pt;
	text-indent:-24.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:114.0pt;
	text-indent:-24.0pt;}
@list l1:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:138.0pt;
	text-indent:-24.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:162.0pt;
	text-indent:-24.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:186.0pt;
	text-indent:-24.0pt;}
@list l1:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:210.0pt;
	text-indent:-24.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:234.0pt;
	text-indent:-24.0pt;}
@list l2
	{mso-list-id:942147320;
	mso-list-type:hybrid;
	mso-list-template-ids:246174188 1921308258 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:66.0pt;
	text-indent:-24.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:90.0pt;
	text-indent:-24.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:114.0pt;
	text-indent:-24.0pt;}
@list l2:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:138.0pt;
	text-indent:-24.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:162.0pt;
	text-indent:-24.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:186.0pt;
	text-indent:-24.0pt;}
@list l2:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:210.0pt;
	text-indent:-24.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:234.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi OpenBMC team<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have some questions about OTP=
 image creation in OpenBMC. To support AST2600 RoT(Root of Trust, AST2600 R=
OM code verified SPL), users should program &#8220;A public key&#8221; in O=
TP and uses &#8220;A private key&#8221; with SPL image to create
 signature and place it in SPL.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The SOCESEC tool help user to c=
reate OTP and SPL images for AST2600 secure boot support.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The following are my questions =
and solutions<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">There was a socsec-sign.bbclass in OpenBMC and it is u=
sed for SPL image generation with SOCSEC tool. Do you agree if I modify soc=
sec-sign.bbclass to create OTP image?<o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">If no, I will try to use solution 2.<o:p></o:=
p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">I will create a new recipe to create OTP image and thi=
s recipe will be placed in meta-aspeed/recipes-aspeed/otp/otp.bb<o:p></o:p>=
</span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">To successfully build the OTP and SPL images,=
 we should create the
<b>key-pair </b>one for OTP(public key) and another for SPL(private key).<o=
:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Do you have any suggestion to place these key=
s in where?<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l2 level1 lfo3">
<span lang=3D"EN-US">So far, we placed both private key and public keys her=
e, <a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-aspeed/re=
cipes-bsp/u-boot/files">
https://github.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-bo=
ot/files</a><o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">How to get the public key in OTP recipe?<b> I=
t seems I need to place public key,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recip=
es-bsp/u-boot/files/rsa_pub_oem_dss_key.pem">
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-bo=
ot/files/rsa_pub_oem_dss_key.pem</a><o:p></o:p></b></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><b><span lang=3D"EN-US">in meta-aspeed/recipes-aspeed/otp/files an=
d private key in u-boot,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recip=
es-bsp/u-boot/files/rsa_oem_dss_key.pem">
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-bo=
ot/files/rsa_oem_dss_key.pem</a>
<o:p></o:p></span></b></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l2 level1 lfo3">
<span lang=3D"EN-US">The socsec tool settings should be consistent. For exa=
mple: If user set the algorithm &#8220;RSA4096_SHA512&#8221; in SPL, it is =
required to use the corresponding *.json config in OTP.<o:p></o:p></span></=
li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><a href=3D"https://github.com/openbmc/openbmc=
/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8">https://github.com=
/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8</a>=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">By default, it set SOCSEC_SIGN_ALGO ?=3D &quo=
t;RSA4096_SHA512&quot; to create SPL, it is required to use
<a href=3D"https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/met=
a-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/ast2600/s=
ecurity/otp/evbA3_RSA4096_SHA512.json">
<span style=3D"color:windowtext">https://github.com/AspeedTech-BMC/openbmc/=
blob/aspeed-master/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-co=
nfig/configs/ast2600/security/otp/evbA3_RSA4096_SHA512.json</span></a> for =
OTP image generation.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;How to share the environment vari=
able between u-boot and otp recipes?<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;Do you prefer to add &#8220;SOCSE=
C_SIGN_ALGO&#8221; in machine configuration file, so this variable can be r=
ecognized between otp and u-boot recipes.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;Do you have any suggestion?<o:p><=
/o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l2 level1 lfo3">
<span lang=3D"EN-US">How to trigger the build process to build create OTP i=
mage if user only issues &#8220;bitbake obmc-phosphor-image&#8221;?<o:p></o=
:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><a href=3D"https://github.com/AspeedTech-BMC/=
openbmc/blob/aspeed-master/meta-aspeed-sdk/classes/image_types_phosphor_asp=
eed.bbclass#L84">https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-mast=
er/meta-aspeed-sdk/classes/image_types_phosphor_aspeed.bbclass#L84</a><o:p>=
</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Our solution set the do_generate_static_tar t=
ask dependencies. So, build process create the otp image first, then run do=
_generate_static_tar task.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Do you have any suggestion? Do I need to modi=
fy this bbclass,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/cla=
sses/image_types_phosphor.bbclass">
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_=
types_phosphor.bbclass</a> ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks-Jamin<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">************* Email Confidentia=
lity Notice ********************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DISCLAIMER:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This message (and any attachmen=
ts) may contain legally privileged and/or other confidential information. I=
f you have received it in error, please notify the sender by reply e-mail a=
nd immediately delete the e-mail and
 any attachments without copying or disclosing the contents. Thank you.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYZPR06MB4015221527D36DC4780C1F23FC779TYZPR06MB4015apcp_--
