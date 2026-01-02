Return-Path: <openbmc+bounces-1081-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37835CEDDC6
	for <lists+openbmc@lfdr.de>; Fri, 02 Jan 2026 08:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djFGG6ZjRz2yFb;
	Fri, 02 Jan 2026 18:10:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.193.112 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337846;
	cv=pass; b=JmLfP7lPlQKZV0gsXuPWN7mZ3ThRy0At2kGNbwZQ4ln4GpCbLJXttEc0QPUUpw1zza0+sPugDRh1eLPdWdaALIWHp+oispePUyycY8JJJkUBiE6dwtZSCAV2c4Qa85Oc8B1skh1jnMdms1n24lkqVfERSZJicYnSAmrm+W1pGMJep+jYullkzIKw0wTuyXovF4x+n3YUDgZF6vBy3uOyzT2gl1ZYdG7aluYkQJAnWZM6r0qNZ4LwDOfK/5WOgU+g8aTc+wxa9RgIQ1MDRbsWwUi6YQQUId4id0cset49buete5OZU/aUwQ+zOZVVIu0K6gXUr2dT4SVN8yD/b9uKig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337846; c=relaxed/relaxed;
	bh=k/qH+paKoDcHT0x8xU78sR5SW/FueAD9QQgjAMYGcFk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J9BZj7XA5C58u6MDALr0IsG0JgGUej5bnJH5WFGSvIpSvnBZfYMXjEGSowRMuh24AdUUSB4eyUFbgcXLb15H04gK9e76e8Y/z9FXYh4vQBfbtAs0SOs/EY04v3CpgVR4S/J7QeKqRE+6eVB7gczp6VMxxhqZDnyDt6XyRCPRS9tbHcqYvx4E8I/hWphRtlPyl8SYA6EJi1Unds53F84T1KtZSV8d7JCbgueNf6Hh7quxHrdRW8miZAyz5E7mZlIXoWQyh04luS45z+7fcP20aXwrFhvSzCWivzDJuToSBC+8ed8YQIR0hO3YOLo+MVw8wmwOzycrHeIJUcGq5+kwzQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ami.com; dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=disP/Pq0; dkim-atps=neutral; spf=pass (client-ip=52.101.193.112; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=hariharanr@ami.com; receiver=lists.ozlabs.org) smtp.mailfrom=ami.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ami.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=disP/Pq0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ami.com (client-ip=52.101.193.112; helo=ch1pr05cu001.outbound.protection.outlook.com; envelope-from=hariharanr@ami.com; receiver=lists.ozlabs.org)
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020112.outbound.protection.outlook.com [52.101.193.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djFGD5040z2yFY
	for <openbmc@lists.ozlabs.org>; Fri, 02 Jan 2026 18:10:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QG7bzkhYapR0QZR3y90WpoOMfK4e7qhAfuhtoLy/mpWnTp5mmOVRtIAgPoWwEP6sIjdOi5x/ppZAExIuz2se5qm0UpQLy/e89KkXuKAe9CovldKTA0jfjPPLqBap7xiAn47kZcdj7ymSjLIXI49GUpk+T6oSwz/NFI3+dG0JvUm1jSALd7/afja9TKvMa06rldwxh6nOTZWYcp9usQtp4hrHpvv8OucBra9cWTMEEpyMDCd5HWc5lIYKW0c5zWGH4jCKasAUWxwf9etN1GnFphI8dXF0oPairOnSIg8mqZu0nEEDpSgz7tx2YWH9AnBWdYXL02kSxQentSY+D8+kIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/qH+paKoDcHT0x8xU78sR5SW/FueAD9QQgjAMYGcFk=;
 b=QR5u4JlyNbUmyOw4Jn1wCfkBZmdmIciTVg8b221IN9o71O8SaXvbSnfbuR5cM9h9uchZvrk32S/+WV+7p0bJDpFbdj1NrzPivPKfhCk6++ARmcLMt5bzMvU0gN2wxE6wYYgjmUtdI6wBErdbsZRxo7tbtT4Mo9mFXole6WrqLSz8phlYSqdasYyS3zC7GHu7bVG8bP9Npjyq+clG01vbk6LP6fUFJ2vgCE7affMl9V4BHvmxZh/TMUwWPwd1e0Rb33VQBMEI0FsJGRCvJVoSWs3h+jS0FnqvQENXRBcZhv6m66mAxoMtal0gvD27C/NmEwnP6kHZGee8vTvBW0Rwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/qH+paKoDcHT0x8xU78sR5SW/FueAD9QQgjAMYGcFk=;
 b=disP/Pq0nkbNW4fWSD3EY2p0Oywv3Me8lUFUXBaR9wrIsb/m4Ow6TlYOFphUT2YhjN6Rxkqg96hW+XffCSrVcdhrn7VgaC/lCVaCT8HhyPWSXXcO5SWGajaL5h9eWxvJ5u0O/Mcukv9MdfIT1S5LQOMKejHKZJxU++npxQ1L95Q=
Received: from DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24)
 by DS7PR10MB5071.namprd10.prod.outlook.com (2603:10b6:5:3a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 07:10:01 +0000
Received: from DS7PR10MB5198.namprd10.prod.outlook.com
 ([fe80::3611:9138:7bdf:d295]) by DS7PR10MB5198.namprd10.prod.outlook.com
 ([fe80::3611:9138:7bdf:d295%2]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 07:10:01 +0000
From: Hariharan R <hariharanr@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issue with Remote KVM on EVB-AST2500 OpenBMC Builds
Thread-Topic: Issue with Remote KVM on EVB-AST2500 OpenBMC Builds
Thread-Index: Adx7toh0rvdLmWo0Rq6GqBfzDXAgew==
Date: Fri, 2 Jan 2026 07:10:00 +0000
Message-ID:
 <DS7PR10MB5198FF02708EA66EE9790FF6C4BBA@DS7PR10MB5198.namprd10.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5198:EE_|DS7PR10MB5071:EE_
x-ms-office365-filtering-correlation-id: 2574b653-0c33-4519-cf1b-08de49cdf1fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/GdZ2aKooxS2DIviSxbsPHMZGtEjDNpznKAE95k/JfTeRr5zp7j62n6otWBq?=
 =?us-ascii?Q?Eu9NBJ4DrxmOhbPBAU0HrmRSzBamN4jfx+IklYc5yUYUQtCWwvHKX4/LmcwZ?=
 =?us-ascii?Q?cvOtpJVlSIgyomZEapOyAl5FwoKeTLV13zrbKbEfMw3b/vTIqTM9A1PqsbJB?=
 =?us-ascii?Q?7/xkHqywFjCONDvXfBZ4huC+kblyk/Gdc7lbZDDpyrSvZq9WVo0/l8oxnOp3?=
 =?us-ascii?Q?TzWa2qoO4RlzxndwFsZYncJ9LKihRpfUbwW4OoZ3hjiTy4e1P+9KLVaINa6S?=
 =?us-ascii?Q?L59DZSBe095Xu6IG1z7twcrqj2i9noTIkPNPI2G2YfE0yVBPVnTZc/vtBclQ?=
 =?us-ascii?Q?7WXe6s4sNv/fcofav2/fbPu9so7Ti6UhJSXMc3tg3pT4kNNPFyJXZDyPN+CN?=
 =?us-ascii?Q?SW0vaGMM2JUyBYRDuHxC9vKPKLsamKmjR7xpEN1XgZLADW+YvRW47F4TJZ7e?=
 =?us-ascii?Q?86fQckEvQ8j/nVt9KyACG8RXpQPeGlCy9ECXOZd0nFjTiz8dhTl+tGE+O0yk?=
 =?us-ascii?Q?yM3YdKAXUFX/I5le+kCCzv9nZa8dRtiHluP0BmNlklp59MjZTmI1qo97Srsf?=
 =?us-ascii?Q?l73/32uNKlpTTBbpjcuk9ZBllFdI25hjSfC2TrdUEjavhNSW4wqVvI53iIQl?=
 =?us-ascii?Q?BKA9VFCOG/dYt9a4gbDc6qAKmITT4tqkf3DfoF+Ij+FBs3GbZmIT+ZXw7fSN?=
 =?us-ascii?Q?gs2VoAqGkSrajR1k37hOPpxA2hq8Bak99aN1d/oZgDA1lbmVC8Z/h/ss5nSg?=
 =?us-ascii?Q?GJcPDL8WrMLFM4vam9rh39YjWKo7XJJG2rjWYRJbLpMjONCEQRMlfY3HKKAX?=
 =?us-ascii?Q?luM78FGltAqbl6tMMZyqU3XSEokJZTYjmVmSmOulM+br+hRJgaKmz+J0k1Ht?=
 =?us-ascii?Q?Hv1XSPsnaecXj/qFRA3fBwKphP4W6OVpLPDQPeDnQA/0kG+0Df3AHFTl6BYg?=
 =?us-ascii?Q?SII+Uu1B2Y7OwWA8GRR04ChbcSHOH6wf3nL4u22IAqlceZulg/3ST57iBKll?=
 =?us-ascii?Q?zf3SSVxtGnYT2BPoE3zUCyQlR3TLZWUKcObAkXrkTXXLU9uoM2uA5TUukghH?=
 =?us-ascii?Q?QPv9/InpUsa1XKayZYkZ0iQwe+pCC3rLOXN0M9uy23PPJ7WOZahIiYBs4am5?=
 =?us-ascii?Q?TwAKtfxQjYZIA7q7dw8oTRqeF8vR39xZBE9DukoA5icAtzoMJWkGdCPWL3j5?=
 =?us-ascii?Q?CM7b75UXXSBagcRKHOMddAvabgrvynSarabLCi3YZET9xaz7n/p8dZBMCrLz?=
 =?us-ascii?Q?loas2rq9LYsXOFfN4/BaybelDpVgyAmYz852aGz9XXp+hJPOHTvuyCCZuJAM?=
 =?us-ascii?Q?BdNrynfGDS353qV/TJcRo2sR+7wNAYYytzxIT/QpXVEYAbr4yzbl3c3Aifly?=
 =?us-ascii?Q?6uMexLJnnECqbkwzo48pXLctHIdvLeepEx2Q1LuhwYa8ya+Qu6ZxH3uqPXQz?=
 =?us-ascii?Q?w/ifT+tGE96pXpV1fOomQ5meXhHYp+J4hg2agWDY0zPRdd1mEzvkPDDlbmv1?=
 =?us-ascii?Q?uu7gTTzq7D3SVaj/1f81/LGAfe6NEhGgBUmH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5198.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QsfOpwm7CWjprM8v3kOoYBOVnteJGHJmuJRqQqrIWf+aoGZHFkj77hBCFIBL?=
 =?us-ascii?Q?fSou4VsdK/OghMB8VIO38kpJ3mVNKnXLEkpdxBJf3WHJaEpaLLLxlFIFTqWI?=
 =?us-ascii?Q?iLE+PuCjZdnD8L2H7K4dCVae1AnnDM2PxdFJJrUguwEilU3A4ZAZN9Sd+m8t?=
 =?us-ascii?Q?O8uhtqVb7bAiOpRjURp58xODiuS7scWSM155sGlZHT+oDyQ4av13D4mnwYwI?=
 =?us-ascii?Q?H+aGZSEq4nfvmMkn9Qn7yQN2w4aVz/M+b4+k2cbNHcJgXyd+vzZQWdQ+jJDk?=
 =?us-ascii?Q?A7UjF3Hn8OGlVwL+B/KJgjyQpi4fx7sROCyIHuN0h9/gvLgFTCsHGA8/BskT?=
 =?us-ascii?Q?2vbbBm9fF1RNd/GfkCmps3+7mujOsE62G0l5LWsODkcp7mgyEyrWznnzcHzc?=
 =?us-ascii?Q?eaaSfeGEWanpEuubKvhms4XQr/sq1hOYcTxxKpyFnldJ8dm2WEq10U2oO/IO?=
 =?us-ascii?Q?qN/r/YOJ8oNiCfjVFnrKoHHfUyPt+Z9l8d9arXI1xcV6Si7beIxNv3DX0uqn?=
 =?us-ascii?Q?YgLe+8HEWCAw6zCAw26ue+Rtj3tcblpwob3lyFTS8NMmJx6H1bAt4Aa5SiHA?=
 =?us-ascii?Q?+xab2f7nP71P79CENTGEtKlJVtMe5DsCBt0nX92CJQ9mkco7vIcZunycUWFG?=
 =?us-ascii?Q?dfRY6ju4VaMTgFhkOfv9Om/aybY7N5+OrPjMrcGe8Ac7b5Pw1aA/o2NaEw/P?=
 =?us-ascii?Q?MPXvx8jWsRk6zJWd/8n6Ni6hyRnMBKZYVfXbra2CW5WG8gvxOLk0ER5GVWdH?=
 =?us-ascii?Q?t0siDfXhzGLX8N4vztO0CIWkiVGYkRWeAbuCzjc115XuJizeMuau7lj+VnmR?=
 =?us-ascii?Q?X1mDAHpHF/KFf5vvQMfW9KaJYwxQ7wJHdj0bLRgjKafJ+fDCoqAOpEGzLYZ/?=
 =?us-ascii?Q?ohg6SmQb/k+8r3NdIgTXI5LcDo9iEDEqqBqSqZV2PtKiuy8/9wvssLbDIa5b?=
 =?us-ascii?Q?f5XnQrl7x/HP8QLEKBF137Q8eLmiMUpCxz096HcBv7YhV7o1xvEXqWXZQE5W?=
 =?us-ascii?Q?KwTgFVCnS7DmNIRgvBa9A2eGZ9iVq2VQdWiFRHAg00N+UNbCe4IglMXNHyH3?=
 =?us-ascii?Q?MlTVfrZMrJbxHzo+Jh5wKqTTdPaK0k0NLnKgQ0Sfm2Ssua9mpmhBj676iMj4?=
 =?us-ascii?Q?Mr16uE2AMPQ8cjcQUZm9r8muQxI4T+rvhVpFs99ZrpJVIrbUmOkLgE2PDat1?=
 =?us-ascii?Q?6xd1hfqEDjyDhfVKb+InrNkJswGEP9XohS7f0dWXC9I7IBn++cuqjKBVDZdP?=
 =?us-ascii?Q?2pIhCjeT7uZbBFRrAjCGFw02nU3VoKmi0ZK7gqEJJCtmIA64j7HCg54eikzD?=
 =?us-ascii?Q?PAQqGGYGzBjGJdOYxppI8VHu5vicF+GqKfsk6fiWECtHcXwhqCgHTcmFbjpf?=
 =?us-ascii?Q?Bi5+7iyWfwn5Z6w6pMbJNY9JC4vFiXdb/vP3Cvch9ClS37OveAJ/HEbNFsB1?=
 =?us-ascii?Q?/XbKpZTpCXKxEJ3nKXXu+ukB7XDP/Bhj+wrEKYrrIgwYu+ioAISQ+iVYaQm3?=
 =?us-ascii?Q?fNRjImF2UFrkqF0DX4BIF8vPAfHdyxrv6SWv6IeKqsrsLclOMFqHCFKj3moH?=
 =?us-ascii?Q?S8N0NqiqM7XbAJ4OAXtqkKyIVCRNEGP0+pZzfi2c6aJO/EFGZqVyp+FiM0u9?=
 =?us-ascii?Q?N7JHPRzLpkFbWYky/UNWOtfSGcAz0YYUKSo+UEIIM+HEx9Fz+1O231PPPyFU?=
 =?us-ascii?Q?N0Y/18cHsy2FVZU2Z3T2PAZ5cpWs2fGwRbfm+C0vRDF/VO2v?=
Content-Type: text/plain; charset="us-ascii"
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
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5198.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2574b653-0c33-4519-cf1b-08de49cdf1fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 07:10:00.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tz2pvXW2UGK3mI8pP10jjz3HesFop/Zlh2Uz+K5Jzpj3csT8T2bfeupu7odOXfbqEBoLMXGqaVUtE9onZGyZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5071
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

Remote KVM is not working on EVB-AST2500 OpenBMC builds. After debugging, I=
 found that /dev/video* is not created.
AST2500 SoC-based machines have video engine memory configured in the dts f=
ile, but the EVB-AST2500 device tree does not. This missing configuration l=
eads to /dev/video* not being created in EVB-AST2500 builds.

AST2500 SoC-based machines with video engine memory configured:
https://github.com/openbmc/linux/blob/dev-6.12/arch/arm/boot/dts/aspeed/asp=
eed-bmc-opp-romulus.dts#L46
https://github.com/openbmc/linux/blob/dev-6.12/arch/arm/boot/dts/aspeed/asp=
eed-bmc-opp-witherspoon.dts#L43

AST2500EVB without video engine memory configured:
https://github.com/openbmc/linux/blob/dev-6.12/arch/arm/boot/dts/aspeed/asp=
eed-ast2500-evb.dts

I plan to add this configuration. Should this be added directly to openbmc/=
linux, or should I upstream the patch to Linux first?

Regards,
Hariharan R


