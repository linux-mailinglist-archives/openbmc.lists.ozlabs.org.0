Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A869101A9
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 12:45:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=P9lyc5PB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4cZP2YPHz3cTv
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 20:45:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=P9lyc5PB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:2020::601; helo=ind01-max-obe.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2020::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4cYp6RdYz30VS
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 20:44:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYkrSfQihDnrapVb1LHU+5af3G9pim51hZ6oNcUTYZ/E5QVWQG1DHWj7DDUaSoWiqppTHDtwPZsn0+gF/ieE0o5ndM4CvJOtQvcQ/1SHLn10wZ/mEh/T8suMrPvr5iIGDOS3UcUlJULWxgeEaGb2vn5il0JgHDthLjE+5ecO6t4aJbMhpGTtL0ApQcptwLXAUbGtDRJEKiGmM+v/wBLHIxNE7umt/ABRPQnW1nQx/ycvIvp01YkB0eRPcl2weqgPArr8V2E2hgR0WShhEZnJGdhwK1Q631hqyuZ/oTywgWjegGtl6HbppnNcfQ0DmV6uCiZ38uRTb6lxp4ohBvSpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyedO2Hdgl1pIC4m/zQLg9T/sL37cAjRu+s7EITFq/A=;
 b=fUByisrDgavAS0+wwc1PfIhS2CY3/UT/Iirn4i7TqO2pVzVy9BI2YjQ7FmT7qlPQCCiKJW9ydcU6ImQVSvsc/jJK6yhOtXGtsi84tEKxzfqVNnjP3yKd4iV7jaKk+B5YCH7dRl0TCv/P/+YBFuqkWd/oMbnlxr7lt02ZjUf0acN7OZwzwWbwgTWa6loT7f4hL1GZukK/ruXM8Xavus+FTps0/fbZDfUrUxPlkWiNK1cSFpm8EkSnRaY2cDJ7ROPfWZo2m6ai/EoXrERruxpGhr3iT7wxvzkpCRiMCZLGZ8QjO3xLiVqlalUu7jH49ZctRfQ2fv2+q/E/+LrkJga66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyedO2Hdgl1pIC4m/zQLg9T/sL37cAjRu+s7EITFq/A=;
 b=P9lyc5PBIX40PM1pmklx8MTv8nFd6GhIy9/ob2wO9Na/yHsXDTaP4DuqdErDpOVVilbzGxWA1ewEMDsUUbxnSFrqa+xjJ2Aabv50k91WfLF/ziVI6O57tIsMdLirp446B9GdFXP9Xyu1H1WcTo97+RG6yYvZzBQVSlhW9Cc77WVLw4MJHjvt49wf1+43vGaPYHT5fokDvNjlu5REAsuWlyQnxXC7427fLfloNthWnAl02Y/cj+/i+ds9atMFsm/YJE6GbmMaFa4c1vTAhHNWLGJifSYUrj92RNyA4f5IL/XF+4pBeAcpVxjrYEVTe3P6tb8dqwSJ7Xd972bie7Ytag==
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::13)
 by MA0PR01MB8178.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:9e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 10:43:59 +0000
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a]) by MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 10:43:59 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Help with IPMB (IPMI over I2C).
Thread-Topic: Help with IPMB (IPMI over I2C).
Thread-Index: AQHawvq3HaRNbNKpv0ezQLXMYofq6w==
Date: Thu, 20 Jun 2024 10:43:59 +0000
Message-ID:  <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4308:EE_|MA0PR01MB8178:EE_
x-ms-office365-filtering-correlation-id: a65e6a97-9190-49cd-0af6-08dc9115e46a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230037|376011|69100299012|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?JVb6wSVmAb7sN09lJHg81qpjvQ9JQraJfM4FYfE1WHIxI3SWac/A87VR/U?=
 =?iso-8859-1?Q?kCRf8D8IYF9N7oNIwmpRHC+urnlDmqkFUAbhqgS5lx8PSnJ82o0FMjrD0Y?=
 =?iso-8859-1?Q?7HxdFLdQXeLrETCuWnug5Bk+k0iNNKQqUJJtSks1J7aDbRlso97JSM7dkG?=
 =?iso-8859-1?Q?zCHBUdRpOlQ3w01NXhy11iCeLT/+FTdTWiAeURJ+E5tQXw40ttx9oYPAeD?=
 =?iso-8859-1?Q?uZea4ZQu+Jgxx0nGeCGbhW5/I7LrUJtmrzzmBg4EYCLYj5vMSWk8SdJo/I?=
 =?iso-8859-1?Q?qUVo1jxzgdVGEEA6/V0WhyK02xUag7g7nlSM1lsIldCp8z+aY4iBjFjkeY?=
 =?iso-8859-1?Q?viKdPfWKix3uMrRsQPRT9GW4j36b+jU0ODrB43bJr3ZU9EHrJqrV4OBJ2B?=
 =?iso-8859-1?Q?RPQVPLPGV94xriE62FbxxuKdi1MGTMsPpS7MK58lQ2Cbbs9kouzHLlAnLg?=
 =?iso-8859-1?Q?6dbzFio3YtSv6RKdei9ZaBGW0GeZ46kEsrLI8Wtj8HafPWFX54yLnxZr14?=
 =?iso-8859-1?Q?TiMqymxks1GNXR/V6F4XDcN0hPHhxRNcrq4MCmq9Wk1UbxyfK790m9X+vz?=
 =?iso-8859-1?Q?+/0pRBL9WlPHqKTXwU1Zjq/opt8e4aID5zRPRwTSrZpPNEGutV1Dxw/E5v?=
 =?iso-8859-1?Q?wOL5Gd2mB+IJcvdCHg5coAY8KQJI1A8+nhzT/lxmRcd63tI3RuAZDd8NLT?=
 =?iso-8859-1?Q?HLUHleHOHBRXbCUh7nkyZVfQieIVt/CO6+iPrLbE2pVFyIMFMsuIoZ+v0O?=
 =?iso-8859-1?Q?eo4QnVQcamUMemOIaQtoBxqseC3Fuw7RWU+jpxD6inrokjb/twrjMMmq30?=
 =?iso-8859-1?Q?R+KW42M4DOCbzMQ+pv9DTxh12fEOOL4cn+Oed83G1ksqDQ11uthhdNEnll?=
 =?iso-8859-1?Q?IxYzKDcHjnV8nchUniCW6Afwm8PLAAsg2f2njqE4wCsyLU+6bWyHxs65PM?=
 =?iso-8859-1?Q?5K7t4EgTlC/NxmwFbpMaue7Q4m/zmYD1rKXnWPEsvmizaK9zgp4l6gDN3y?=
 =?iso-8859-1?Q?c9gKpFXggI56K+q2os0ys0pND5UcOzhYt7AKGhlgKNPDOOLfHWfxiYFRB7?=
 =?iso-8859-1?Q?REX1emSMSq5pGLMf7x3E9Sr1WBiwGUyxXZGqnpdMsvV7Bn8n0z0pQyelPF?=
 =?iso-8859-1?Q?gU3WcEA6hxjHRJArXBoYC14vXNhMlu6BBSuZ/qfY0F/mRvxRMkwjrV5Ot+?=
 =?iso-8859-1?Q?jmmBnPpGqLzMTztNe/8gDOzU62vRli8NXUyojKRaBfxCgJGOhs8vjGAzQd?=
 =?iso-8859-1?Q?h4w5arL6YlDZAwek4oegZno44Q8XhRToIeB6zFMeZYwSOPOHcgbNXHOyTv?=
 =?iso-8859-1?Q?T6iZToPpCtOe7FiwVO6Pasf2CkW65jqDFbVsflyI7nSGd0dwWsAosOe0R5?=
 =?iso-8859-1?Q?FtFST1RRgu?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(69100299012)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?LZoFHGz8ODpd0tU8CWnnzdDrt6ketRiHbGevEMh1aLmFE+5fEMOYaJj4rz?=
 =?iso-8859-1?Q?LGjKHaEE83zswdcQdGCoDlnPBhfQt1htthvgtsu8Z0wQ73zZ1q9+j6qYEs?=
 =?iso-8859-1?Q?FeJQfnLV+jQa4Uxgd2p491b6Whg6/zsXgLUEE4Ah7cVhRR2gC7o1whmpCc?=
 =?iso-8859-1?Q?H58rXWkCtEYVqy7RshbTFZ59SkqrRHZ29xw4I0ssoaTi+MyLkC/Wm+Krcl?=
 =?iso-8859-1?Q?d9D93sh11T1IG1BQMVzZEXeYt6K9jMmCx98BAa+HYZR0KfG3EBEygUvXIQ?=
 =?iso-8859-1?Q?rvPBbUMxBhN+TB1Z9V7QMJwgX5cSOKL4IK0ubGVbx79kN04s02p0nC1PDJ?=
 =?iso-8859-1?Q?9qyvQuqXE9m3myKrtK2b2sS8sOHFKDFNWAotO1eIDzraX2AdXTbU8GKEJg?=
 =?iso-8859-1?Q?hRqvPql29CQUShYxceK0Bor0jyHJ3IOTU14bPX4au68bAEL4oARFS/RHPd?=
 =?iso-8859-1?Q?0JVOmWpdCJs/XgSVePyk2Biq4dY7dQkkrx8w5XqDARrwJBqjXG+tVXfvCC?=
 =?iso-8859-1?Q?rQgKujts7z+PHrA8o7Pwa1KLxpegoeYnd4L88KEuIx5BaRrmCH5vuvasFI?=
 =?iso-8859-1?Q?9ajsNUwy6uTgdF7ADpsoSp61eeXM3G2efgfHmL9AyYcylIpZw7m17uqk8+?=
 =?iso-8859-1?Q?8OLvqm/xUjrcXYgYr/KnwU5xKjFlacslcQHNb0zJMVfG4CIklCJ2d5LuG+?=
 =?iso-8859-1?Q?c50/ED4OBfh+JrtmOWF0OEvpheK3l366v3RMHwTf0iT9mTZppp9JXYBGpt?=
 =?iso-8859-1?Q?X7NQdCWO+fGQJYOzOKrR8pE7h1aDHji6CsSZEkPcbBt9fx+c/qnkAi4/Zp?=
 =?iso-8859-1?Q?v7mxXlnzmrJO5czWP39PokhDkVtHud2ORseY9XYIo0fWV6I/A59LcYYfAI?=
 =?iso-8859-1?Q?Ef6m4/u99E9GempmQeKJwy3K1tcc6fLKcTJHfBL79Z5rNmVaMS09AoBzSy?=
 =?iso-8859-1?Q?NpDtxQ/YCPHCIB0sKAsWX8By3zwGPCfZ0j4AQYoZ6j46Bj2/Aga2Mb5KGq?=
 =?iso-8859-1?Q?YXL9WvmNg0/iF7Edqs1S1xAxpU1CjDIrOP/hAc4xoJly63RsjuJvq/lEYZ?=
 =?iso-8859-1?Q?kXibk/qIHvkZBh/ZC9OKMzoIZ7gxnHIqqUJ1jrbyzD1FPtnSWYF+vm5pIE?=
 =?iso-8859-1?Q?zEd+hAFhu3Va+4zYTJigmlWJTEQZd/KdScnqHWM2TicBcb1TKDIWokV0u9?=
 =?iso-8859-1?Q?1qzI8rWx6Nvhs3SQyHDGLSLi+N7I7DuCXfS2K4B09XY2XPosk4kR7xqY9k?=
 =?iso-8859-1?Q?mc5z6iCwxR1CEwTF0WwGOJ+1Ey3vcGhh6r2KLu7RpOFg72TaJJCzTbwzbv?=
 =?iso-8859-1?Q?bpaWPlU+LjGwvP/s9FiVnaX591t+aWvx/dzP3ZollKReEjV0WJP+n+HpXO?=
 =?iso-8859-1?Q?RdlqHbsoMqt7Fyzagup+AtAbiu3eHWr1ESf4RHrKl7w9d5jHWCZxlp0rFr?=
 =?iso-8859-1?Q?Xi6P6sI6820fswjCebNmmwxYKpY08UOhMFw1vVrSQJH7lWcv5iJl5z0Pk5?=
 =?iso-8859-1?Q?7+payEzDukdQJmdU8vZ9FXcLtdBeDBdkz4gOMoM9navziE4I4CyTiBQnUO?=
 =?iso-8859-1?Q?OvfvxPIzZBslvBh3eoeoZf+OM0XZkNEjQed17zxXvwryQF3jyGf0IOcTjf?=
 =?iso-8859-1?Q?oOI4PyMIF1tjIh+FEtn4R3N3XlA3WVZ62SkDusshDKvyZhNjrH/MKXrw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/related;
	boundary="_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a65e6a97-9190-49cd-0af6-08dc9115e46a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 10:43:59.1641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZHzoU8FBI97Mgh29/py4uAml34nI7Nkv7s3rbcN+s/ancemZqXwvj2wfOeLp16Y1WBDMr8QC5SREZc+igP5XrwpW37livPU0uNOiSyYhVnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8178
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
Cc: Thangaraj S <Thangaraj.S@Ltts.com>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_"

--_000_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi All,

For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring wit=
h IPMITOOL<https://github.com/openbmc/ipmitool>.

Development Board: ASPEED AST2600 EVB

Could you please suggest us how to proceed further with our below requireme=
nt.

  1.
BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
  2.
Send/Receive IPMI commands through IPMITOOL<https://github.com/openbmc/ipmi=
tool> from one BMC to other.
  3.
Send/Receive SDR, SEL logs between two BMC's.

Any help would be highly appreciated.



Thanks, and regards,
Bala Subramaniyan M,



[cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



[Ltts.com]

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

--_000_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
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
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi All,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring wit=
h <a href=3D"https://github.com/openbmc/ipmitool" id=3D"LPlnk386168" title=
=3D"https://github.com/openbmc/ipmitool">
IPMITOOL</a>.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Development Board: ASPEED AST2600 EVB</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Could you please suggest us how to proceed further with our below requireme=
nt.</div>
<div id=3D"Signature">
<ol start=3D"1" data-listchain=3D"__List_Chain_25">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Send/Receive IPMI commands through <a href=3D"https://github.com/openbmc/ip=
mitool" id=3D"LPlnk482442" title=3D"https://github.com/openbmc/ipmitool">
IPMITOOL</a>&nbsp;from one BMC to other.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Send/Receive SDR, SEL logs between two BMC's.</div>
</li></ol>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Any help would be highly appreciated.</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Bala Subramaniyan M,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span><img id=3D"Picture_x0020_12" width=3D"330" height=3D"2" style=3D"widt=
h: 330px; height: 2px; max-width: 728px; margin-top: 0px; margin-bottom: 0p=
x;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:247fb6f8-88b9-499c-8c60-3167e=
46d4252"></span></div>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" id=3D"OWA6c6e523=
8-9b2b-5191-e8ca-693313afccbe" class=3D"OWAAutoLink" style=3D"color: rgb(0,=
 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x0020_2" w=
idth=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-width: =
728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1"=
 src=3D"cid:59c4f387-285c-4c0f-ada0-09714ca611a9"></a></span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;"><b=
r>
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">S1=
 Building, L&amp;T Tech Park, Bellary Road,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Ne=
xt to Raintree Boulevard, Park View Layout,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">By=
atarayanapura, Bengaluru-560092</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Mo=
bile: +91 9677035467</span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(13, 13, 13); line-height: 150%;"=
>ENGINEERING<b> THE CHANGE</b></span><span style=3D"font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 150%=
;">
 | </span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(13, 13, 13); line-height: 150%;"><a href=3D"https://ww=
w.ltts.com/" id=3D"OWAb524bd29-c4d5-0ee2-a2b7-db76f98ee7d9" class=3D"OWAAut=
oLink" style=3D"color: rgb(13, 13, 13); margin-top: 0px; margin-bottom: 0px=
;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><img id=3D"Picture_x0=
020_12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-=
width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:6787ecff-306e-4745-8645-9930045e102f"></span></p>
</div>
<br>
<img alt=3D"Ltts.com" src=3D"https://lttswallpaper.blob.core.windows.net/lt=
tswp/GPTW-email-sign-2.jpg"><br>
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

--_000_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_--

--_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-ksfw50nf.png"
Content-Description: Outlook-ksfw50nf.png
Content-Disposition: inline; filename="Outlook-ksfw50nf.png"; size=99;
	creation-date="Thu, 20 Jun 2024 10:43:58 GMT";
	modification-date="Thu, 20 Jun 2024 10:43:58 GMT"
Content-ID: <247fb6f8-88b9-499c-8c60-3167e46d4252>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-i2prdv3q.png"
Content-Description: Outlook-i2prdv3q.png
Content-Disposition: inline; filename="Outlook-i2prdv3q.png"; size=5482;
	creation-date="Thu, 20 Jun 2024 10:43:58 GMT";
	modification-date="Thu, 20 Jun 2024 10:43:58 GMT"
Content-ID: <59c4f387-285c-4c0f-ada0-09714ca611a9>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-eb25bini.png"
Content-Description: Outlook-eb25bini.png
Content-Disposition: inline; filename="Outlook-eb25bini.png"; size=99;
	creation-date="Thu, 20 Jun 2024 10:43:58 GMT";
	modification-date="Thu, 20 Jun 2024 10:43:58 GMT"
Content-ID: <6787ecff-306e-4745-8645-9930045e102f>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308AF26A122B17FCC91768C80C82MA1PR01MB4308INDP_--
