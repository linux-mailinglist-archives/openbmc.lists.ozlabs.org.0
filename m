Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846749A65D4
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 13:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXCBx00wTz3cDk
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 22:05:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c409::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729508709;
	cv=pass; b=HnyB3/z7TyCvUC+qc/OwnkPkZ0k+SliGdK68X6gZJfBf0A/gSe9vXz1uEQ3oMlrrkjFf8MTT8Axohm1YeuTVsan2vYUQ5JcT5pnE0dJJ9xYEhd3hLS4aVpbxR89mcDvPZ53JopvfFsEsQqkkjSe3FKBYQPwrY8oEEz4DGWHGwsHoNRVlFvZlisJ2+H111ojYGTqhGKBIYOaicm0j1cl9+499t/bSSoSY1lFRrjSpLJPdtD8nY8lYdC3LBJ7/tbQ2cRC1YpiEfkJ2cBLqBIbN5p8Wv6yhh+2g8mWweX6vkspSC8LOKD1rLwibKZ2PPMmtSxl+iGUbRQQoI0aWkGnh4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729508709; c=relaxed/relaxed;
	bh=a9Cf5Mdz7QVWI6FXurO50B2Jum+LciFb7hYK2syBzRQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=geKYsTUzvN751LpOM5IA2kuUN/zkm8FLwp07Rq+XMF57dQ5+0CvGoc4rtpHlEo2HhcIJHATahaLY+K7WOM/J7PMPcwbc1iLSp6ZxGFzfrQB/A2rnnsNmf7wQr22SMO5Sr2DelmSPdhh0qg8PWyff65J9GSf91RZkECHxCDc5ftS8hBNul+rEMxFsvORExj+KCDOiOZpfxz0QqOqdGxE6Ug837MtdHsnABl7yzvx4Qzdjiv126m250vrY/lTolynPOE0nZTav2mmA5bF97fs9lh/5KRUrEG3snlt40Q++1TPlAnEq+zFSwFrT4aEynC0WQRDutDm1YtnSrJOKASJUUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=Ltts.com; dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=XeoELN70; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c409::1; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org) smtp.mailfrom=ltts.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=XeoELN70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c409::1; helo=ma0pr01cu009.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c409::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXCBp4zM4z2yVT
	for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 22:05:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFqsv070a/4gimcD600h13Cp3wIA8J4nYToPC+xz7TNUoxc5+DSSIkQwikPovHZrTWdEOh8Ruzv9QNhcq2ieCz/PO1uoIDR13xsJZPIL4uoJ3bWhJqAt52O4OIS6K/2FPArwO+Mb9w32GcP+EIuY0I40fnVnKOLSlbxfi7pCq1vuQCv7sOXNLNLU+MACMQ7Ou++NDUmmM1sRzRdclfJI1R/yK10B7IP8i/2tyt1au6vT9NembSxQ0rwXcFDd473wgNHX6k0BoMzySmb1sD2Hlr5rTLw1IFwNXsF/JTl//dgzIKRGspY4a9MG3C3CKnLVqGs7xRuiRGOEbQ/ZGVhe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9Cf5Mdz7QVWI6FXurO50B2Jum+LciFb7hYK2syBzRQ=;
 b=GLh/lMxBsSvo6tw6UOqHqcsz/J98TaZ3ux8cEI5JFW4kP+13RKxr0aqcNDpkuK7OiJhRvQhdXbh8CSRUeVXrtYnd6nlaDztpZmXXtoSBTh18mX5ZzGkE+8hhC3qX6G9aHb8onNyAFOInjG6yjUyUoPHZyLZEMBTqte6hYmTMdtPFo2Sx7mLv3P9rUoz2KgJVuwSbFJ7htDp0qN++cDi25aN0z1u+9WIzJU6oFy2i88S785P+MPlqFSqihk5ArS6CfuGz0HQJbkzJs9lL0EsmOWsLx+lsM72iNuoz1bh5UZp9bFA8wVbe9aHjvPgbv2cOXnoRmE4WoMajAPT+VI8YWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9Cf5Mdz7QVWI6FXurO50B2Jum+LciFb7hYK2syBzRQ=;
 b=XeoELN70/adwuwIkLepaCejT+I0rS/xvjMNNxxwhpyPvE6mcMxEbmgZJaDnMGmYaHy2N7TKLtQpkd8f+bs1JSeE1hJZ31Tb56l6D+O2/HLWyWS0zQqKTV+k/N1zr0aKMrQt8VQQ/+CuIj/ReGOuL34lD2E6RWsUozOjvp0Cl3VaXBinDbk4HlHEFbCKLepN6GcyccSVclX7g8yQ4X9FtywV5qeNKnVNk3QwlxMIsxj1TswUmbvh5ulvrt2WsPMzVIyFChhbNXaBTuCszcgsNep1n0BXZ7ladySkyj8dDlUX98567F9t4nXz/0WD1jK0vcqk/W9TneecR9UVxrmv2zw==
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::13)
 by PNZPR01MB4496.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 11:04:40 +0000
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a]) by MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 11:04:40 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Help with SEL
Thread-Topic: Help with SEL
Thread-Index: AQHbI4tOhhKoA/b1WEmZNvGQJVoJlA==
Date: Mon, 21 Oct 2024 11:04:40 +0000
Message-ID:  <MA1PR01MB4308EE28D3B88AD2FFFF756D80432@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4308:EE_|PNZPR01MB4496:EE_
x-ms-office365-filtering-correlation-id: 100ed068-d0a2-4e41-b6d1-08dcf1c02936
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?VvePtmDOuxVkdAE+L25ivS56EwyZuYhCbvYZyJk5/lGEfiSG+Sf8PBQNd4?=
 =?iso-8859-1?Q?ApYdLVQe6VDH1mrikOzz01v6vlYWoOBiA83gFdiBS9saSRz4pVf5oLdvwH?=
 =?iso-8859-1?Q?v3rEjkejLn08ALz4Okbp8U2vijXWNtKL44TYjsC1STspBvshCjFJvmaJEa?=
 =?iso-8859-1?Q?Ji++VGDSOVXXTMQJKNgE6/MbWalkbqgOxAPzDqRuWuvLkuNkOevMO+6JBn?=
 =?iso-8859-1?Q?qK2bDjYVxsYU4nF69EhkGxhjm0cPATRi38xzNvt14F4Ra52LqePJxrZPUp?=
 =?iso-8859-1?Q?tF4wvEbJ826U0wT9OTXNOB7n3VwEQIQ/xI/2GeXXiH1oaAtQkAG0lXMyh0?=
 =?iso-8859-1?Q?Ia1H5FyA3Fq4esbYARleAxuaDVXuUJyX7pnXrl9f9u0B0qR8E9WSoivy5m?=
 =?iso-8859-1?Q?8WRO/E6vwzJX4Yxd5FrNxv1Te4Qdh10Ulrw6JdOPSCfz/G+AX70rOyTGl2?=
 =?iso-8859-1?Q?hSxVKv+NREgVt75h9XTHi537SWdejxLB6mPQ2J6g6TLJxL0UCo20b//uyU?=
 =?iso-8859-1?Q?C73eKiC7nMTFXwvqdK8LZoxDedtzTyYKhckmN8klj1U/c1ucw1CReUOobI?=
 =?iso-8859-1?Q?C7s5pZkrwZhP54Z3aGiXojFyAnW/PHDoMBtpwmCu8fvDHyXoh35zFNCadz?=
 =?iso-8859-1?Q?kb/BIXyPHyTowzOPbrKOW7k6LBgL59k1aQOyNHVe0rg02lX3kFyEkaL1cm?=
 =?iso-8859-1?Q?qn51kSDj+PKTC3LvgFXnI/QZzLOFw6/qcIZYKz78k1++LmCHNzjBGHe+gZ?=
 =?iso-8859-1?Q?wZYxNCP2rKiANyHquwKWg80l1PQEPLVZRCdwP5AIufnyJEugCvb2dJCCsY?=
 =?iso-8859-1?Q?6uf5u4qRr7ZVVzRN7sWCNjbr/hZilE1EnVDNFk5xTPuszWEgv5kpPFWsOW?=
 =?iso-8859-1?Q?l1jaIGpDoxAEgGh+cQuw9JFtFutSwEUBaRSXjm2qYhg9HM3v75uLJEF1Ei?=
 =?iso-8859-1?Q?yd6ycf12C+dO3DnIYH0FPZ/AVkio0tN5J7kRBaxKviOW4v9b+4HB5mNFtT?=
 =?iso-8859-1?Q?UcMNvRyht1quO0TnOMrSQ2YUj88wBcF/D5ntZkdA3OCI/m4DbnizTek5yy?=
 =?iso-8859-1?Q?S+q7atN4STXiCn3F8jZ1OUGbJ/NvxuxllbXS0o0xoXKTGLxBw0ZtVlRE/X?=
 =?iso-8859-1?Q?PChaIS4Zyb9VNVQSw2hxIJblHoMAB0CWXz2OeyjTKP63nCE/2a8tlmNxaF?=
 =?iso-8859-1?Q?FDsXWQmFofHkGU/4ntKyjSYFBrXA/GcK5KCBPalKWGoWYd+S2hcbe7Ce42?=
 =?iso-8859-1?Q?BHzt6ortukpv022/Qw0cRBXIhE7wq8YXtdLintdYCc4vGSpgw4g0bDiDWY?=
 =?iso-8859-1?Q?bRbpJqxh1Fkd4pXVaRLz3TpEQF6hs6VZ4vAJR43z4YJfTBkp3Q8moalcds?=
 =?iso-8859-1?Q?sERmahpkBE?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?swl7uuaVFSRu5qlY7/q2nPD7z9djRvtsjFcz5HQw2OTjfEJyQmw+cmI815?=
 =?iso-8859-1?Q?MQhQi88KCWnpNG1UI2Zvpvt7hENcqELwRrm6yXI0ZeYzFoorQf/k44bq48?=
 =?iso-8859-1?Q?PhN0E2zRQXMoM6uWjkJ8a3q8YfpkOGeDS8CQ0WdS5w/iJYu3iIt1VlLywu?=
 =?iso-8859-1?Q?TGkwmxsg4z/dFpyC/6wSNIwm7fGKJ3tgwL7/rHXDJgX9G9w9oUflQZNC4S?=
 =?iso-8859-1?Q?Em5CkitYK2nDITgzjyiXxS4fhZZd2faR0TKLFwtnCoQLgIj7VBNY323tVF?=
 =?iso-8859-1?Q?+Lnxis0iPR0sGJ2EXX+gBL9rR+BHaOEYbRcTL0Huin+LozeWG90ShY7fR4?=
 =?iso-8859-1?Q?Iv3yPfxAFjOsbTIIlGmroaZ3DV5AJBdi6U8CePhOAwt3WJsllEKubO6laI?=
 =?iso-8859-1?Q?XgtA/UXJyVGpwXpzZGMaUVdS34s3b+709hJRppRK/+VOKufyjK3r6h9Oqo?=
 =?iso-8859-1?Q?kt2LeecTql+pQu4Id5WlMZiXgpXvt+7vrnEgTRVRPUHBx8VhVHTPVT+YRU?=
 =?iso-8859-1?Q?CVJNrqkQ/v0Yi9kbbmIEH/berM0t4PjwBv7xXzksAiICjQbfKksaQY+eT/?=
 =?iso-8859-1?Q?oW0ShV3OlTQjgO7qD6nIhRWKJ2lUyH60rCldjdl+cWx4K2SSc/eqH9BsfG?=
 =?iso-8859-1?Q?WrsFfeTdof3JZtyOwe1OlCz7X4dx2CnZihsp4bg27ZSoFwRZCyHhe1eE6T?=
 =?iso-8859-1?Q?IpKoJmIwKyzswzY+TMNqtsKHr96VBumdOtANHA3059ZtQmoBuKSK4eyrUs?=
 =?iso-8859-1?Q?87oQMCQbYafVRbEaNDgROt7DtBzHgGfQ2h+8iq5TdG+erOprfLGjti2F/e?=
 =?iso-8859-1?Q?WE+eUAuHzJWoTdg9Vdp8AVX0pZeUcDyog/eA9gGwE/drdmPbO7rMWkE7Ak?=
 =?iso-8859-1?Q?BhXPggClUIbyLezACpIVPV2gWZiag1ukHqHm2LVXs6aYdNy6lqY5LHtvc5?=
 =?iso-8859-1?Q?EBadTEKc58jvfEHcD3lbeteAjLvRxYar20MkPOXWFMZugjMX7kzHxNv+Hi?=
 =?iso-8859-1?Q?lGo84h6jqwX6ypG8s1SyIBhNettJ7QtVULBSmIHhi5SWH0T/XdoX0TQtZ7?=
 =?iso-8859-1?Q?gf2v/x3aDgOlQ3r5yL0KU4aWL+MbyXl0VfrZ2gEMTypxBqUKQJ/g5gTXFN?=
 =?iso-8859-1?Q?u0efd+OGqFvbiF2OsWoptQUrpS7gVcTS8bydH9QYo7C2NL+/nouZ9h/FnJ?=
 =?iso-8859-1?Q?kYtpaCwBbTkwh1ZuPDBpcyebD38Kx2VWvaQh5x5JuH3wfFhmiEPopfmESI?=
 =?iso-8859-1?Q?qNNX0pVx/gjFxoTl5mBu5wnE9B8IQ0wJIo3dNgZB3rWkScdv/i7JMe+4pA?=
 =?iso-8859-1?Q?aR+QZzuIxhggaTKRucPwxp1DE0/qGvBqmCAj/fgs8MVAvjNxa/JDXrltCD?=
 =?iso-8859-1?Q?uiTDDsKPtxOQy4bIytENeUyrAxkhIe3fEUgAW2HnwLx+dirfa93kW+v3BS?=
 =?iso-8859-1?Q?gAmR6mXr8SAiBInINmJAJ3fOdlkPVgxa/+UotDO2cP/GfAEG2l9q5ufde9?=
 =?iso-8859-1?Q?4NEjLlyKAh0kZPk7DKDBSWebc/tEePsqPi0QZnl8xYJ1AruVIZoWLfgMK5?=
 =?iso-8859-1?Q?koJlyEJ4tt4EifTOL7d3dRaC0CDbQYADIr2FyMFrgIzYBVzTq+9+GOwqG5?=
 =?iso-8859-1?Q?XHjSYtXuNgkJ5wSYrhSjFfDLZOo+6tHLhH9wl5+vPPvvHldugHSXjDvw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/related;
	boundary="_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 100ed068-d0a2-4e41-b6d1-08dcf1c02936
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 11:04:40.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWgx+R5DYFBErRH7WyBCDczC+2RgmOBwo7ZZnMMWskQcUCJPl6ZT6B2QZ43/JblzCBQ3hO9E90kbDZiNz4526nCDn/76yVs1GePQ/dAGKNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4496
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
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

--_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_"

--_000_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

I'm working in adding Custom GPIO events to SEL.

I read a post on mailing list (https://lists.ozlabs.org/pipermail/openbmc/2=
020-July/022290.html) on adding it as discrete sensor and calling the D-Bus=
 object using IpmiSelAdd to log SEL. But it is for intel-ipmi-oem. For aspe=
ed SDK it is handled by phosphor-ipmi-host.

Can anyone help me in adding GPIO as a discrete sensor.

Hardware: Aspeed AST2600EVB.
Software:  Aspeed SDK 9.0



Thanks, and regards,
Bala Subramaniyan M,
Senior Engineer,




[cid:7ff12bdf-016d-4043-bc5a-5a747473a156]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



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

--_000_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
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
Hi All,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
I'm working in adding Custom GPIO events to SEL.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
I read a post on mailing list (<a href=3D"https://lists.ozlabs.org/pipermai=
l/openbmc/2020-July/022290.html" id=3D"LPlnk233934" class=3D"OWAAutoLink">h=
ttps://lists.ozlabs.org/pipermail/openbmc/2020-July/022290.html</a>) on add=
ing it as discrete sensor and calling
 the D-Bus object using IpmiSelAdd to log SEL. But it is for intel-ipmi-oem=
. For aspeed SDK it is handled by phosphor-ipmi-host.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Can anyone help me in adding GPIO as a discrete sensor.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hardware: Aspeed AST2600EVB.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Software:&nbsp; Aspeed SDK 9.0</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
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
Senior Engineer,</div>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><img id=3D"Picture_x0020_12" width=3D"330" height=
=3D"2" style=3D"width: 330px; height: 2px; max-width: 728px; margin-top: 0p=
x; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:852a2d8c-=
2ea3-4cb7-93a0-7c1cb2894e6e"></span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" id=3D"OWA187404d=
a-0d88-7584-a1a6-e165d6b2b41b" class=3D"OWAAutoLink" style=3D"color: rgb(0,=
 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x0020_2" w=
idth=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-width: =
728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1"=
 src=3D"cid:7ff12bdf-016d-4043-bc5a-5a747473a156"></a></span></p>
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
w.ltts.com/" id=3D"OWA15b4ef24-a176-ae19-8911-29348e989cb7" class=3D"OWAAut=
oLink" style=3D"color: rgb(13, 13, 13); margin-top: 0px; margin-bottom: 0px=
;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><img id=3D"Picture_x0=
020_12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-=
width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:2f00e60e-4459-4080-8701-0ad431f05088"></span></p>
</div>
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

--_000_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_--

--_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-xprlwwlw.png"
Content-Description: Outlook-xprlwwlw.png
Content-Disposition: inline; filename="Outlook-xprlwwlw.png"; size=99;
	creation-date="Mon, 21 Oct 2024 11:04:40 GMT";
	modification-date="Mon, 21 Oct 2024 11:04:40 GMT"
Content-ID: <852a2d8c-2ea3-4cb7-93a0-7c1cb2894e6e>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-dewy5wx2.png"
Content-Description: Outlook-dewy5wx2.png
Content-Disposition: inline; filename="Outlook-dewy5wx2.png"; size=5482;
	creation-date="Mon, 21 Oct 2024 11:04:40 GMT";
	modification-date="Mon, 21 Oct 2024 11:04:40 GMT"
Content-ID: <7ff12bdf-016d-4043-bc5a-5a747473a156>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-4wgbw4sx.png"
Content-Description: Outlook-4wgbw4sx.png
Content-Disposition: inline; filename="Outlook-4wgbw4sx.png"; size=99;
	creation-date="Mon, 21 Oct 2024 11:04:40 GMT";
	modification-date="Mon, 21 Oct 2024 11:04:40 GMT"
Content-ID: <2f00e60e-4459-4080-8701-0ad431f05088>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB4308EE28D3B88AD2FFFF756D80432MA1PR01MB4308INDP_--
