Return-Path: <openbmc+bounces-1274-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tjrwCPTEdmkaWAEAu9opvQ
	(envelope-from <openbmc+bounces-1274-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 02:35:48 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0698353F
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 02:35:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dzrhZ5TmCz2yGM;
	Mon, 26 Jan 2026 12:35:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c112::5"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769387828;
	cv=fail; b=ESCWxbhNOUS1FbbVx4tPHhqqUvpC6pl2/kQytbIuqcKwdynWset9nw+Qz16Lqn8RWp7Tat/xcV4Gl5uk4F5qJCfwBl+V5rzBX8xH0b5k1NFEdGBGL9Gc+oyxobGn8LksFe8gU/mVIGFgE5ak4YAkz7yfLFFZ2/KbtHjMlW45bRtPuKlcHYrg1uXuHZG+6wrOzAfaxSjHznDsU/iJRm1OQ+YE8UvPH1zKQmEJNDXg7BneX8PprCdJVqyweeBuPWQG1oneaOpxBcHdDYNTYrSj8x5BGA6ImHHGBm8+cTSKqytWtG1YTwsyLdWPhASVSufnxwUt63HOv0lHt7MGxuDnsw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769387828; c=relaxed/relaxed;
	bh=4AWeCYCMm6Li4XnmMPP8Z2VTthmEuv6+9xV9PtoXKPM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RFIcTZwQ2GCgnO7UkkJ5KFmEgwLmgRSmrzMGZOhn/+qXUX9E5acLww3RCc2Aejawfi9gmS/7pTFC4A8XPX3S+6MCY1e0Y9slUIlHxvjGWljWPEkAO0VeMidoGf8ukWKmtnAyf4XoLO6c4lpJCwPQ3Ya22Zdj5VE6mCDNenWiVjCUZT5m7QIY8sWYY+igknOCFBRbGebUBEoc4Yc6TSOOqxdeoQM/GGCGca4sXG1ZJab2Bp0ky4A7LzHMNLuQpNFToECUQrdd/FLiKijbG0dP5AR27+5kGMxPOrUKUHte6oMbKYymxGDYWjPEhleUhCyAXR/gYHo1H+xooHCgevVWCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=UYnfRkee; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=UYnfRkee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dzqNx2ndDz2xZK
	for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 11:37:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBu1G8bMM+GeMD6VuxkU+CW85BLumJjwLjsWQzq5fGdF4LmcrhGuJDF3rF0fWLho5i1dDAwrdmWdZbUq4Q4xq02r2kmvXUKOcIkD+2FILgDNPDPb5UvNBLXDMzS7wGpCUjmmdqS+SoTRBVA+v7mSrqSUQcSTgY0sitcQkRDk5yv2gzLAJiAl2gnlGocJvAU9FuTuHZnLUChJrJvj7GSVJacSTuAVTS5pTWyeRQu9AWAm3BRblu+p94ri3GqtbEw9GF4xKcKUo5ohV3AbjLbPQVrVxl+OogsEvK8CVp6SSHGZC/aJXr10CFB5cZ0ofI0sWYF3/GmjsK3G8jTFHRychQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AWeCYCMm6Li4XnmMPP8Z2VTthmEuv6+9xV9PtoXKPM=;
 b=oSpEzNa8sOTiCaA7LBC2CnHsUNNwPFn2jMv/afEIxupB5pzwGR8IyvzWUiiVCy5dg7bF5IPL8+Mb/sqKIiVc/p8ONAyOArkViF5wtPEnSyKXlCtmzDHtNAe8ODuDbg0aUqCZCyIgTW0dsy1+b1EW8CTtpjzzB0jGf0ySGa9lAG/uXDpt30MZnxBFQQ2UldzJZtl96wC3/11Ed84ar/nTq8DLPbMukBHhtbdQy/aPr8FRLL6LLYS0XyolVN2DWz9J6wM19VoXihiLbHz1bHhL6OC35bUtxaieDoqkDTr+5jsDMJO6RQ6iI64rx1HMp+IqUgdLN9tK0yNc2bkTFDDVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AWeCYCMm6Li4XnmMPP8Z2VTthmEuv6+9xV9PtoXKPM=;
 b=UYnfRkee6VRZHvGY4TvxFmoSBdGc6cxj1fc38jL5uqJF04x1X2E2REprbaNrIUvLePwgyntzeinAYDGgyVxsb8t3nLmEscJqmmDN8YxxbCQkaJicu4naiGQ6DczeBjcp56ll1+O3or4Acys5sQHSYoRkpHdRJzwZEnx8MpudAl4=
Received: from SA6PR21MB4461.namprd21.prod.outlook.com (2603:10b6:806:429::16)
 by LV0PR21MB6025.namprd21.prod.outlook.com (2603:10b6:408:33a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.6; Mon, 26 Jan
 2026 00:36:40 +0000
Received: from SA6PR21MB4461.namprd21.prod.outlook.com
 ([fe80::7638:a7db:6fa1:fdb7]) by SA6PR21MB4461.namprd21.prod.outlook.com
 ([fe80::7638:a7db:6fa1:fdb7%5]) with mapi id 15.20.9564.001; Mon, 26 Jan 2026
 00:36:40 +0000
From: Gary Beihl <garybeihl@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"manager@lfprojects.org" <manager@lfprojects.org>
Subject: Request for addition to Microsoft CCLA for OpenBMC
Thread-Topic: Request for addition to Microsoft CCLA for OpenBMC
Thread-Index: AdyOW9WzDkmenIwEQTWSZddInzyTYQ==
Date: Mon, 26 Jan 2026 00:36:40 +0000
Message-ID:
 <SA6PR21MB44617BF0999CA8D83524DF83A693A@SA6PR21MB4461.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d26c4199-0c14-4244-8253-35507e237b5f;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-01-26T00:32:54Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA6PR21MB4461:EE_|LV0PR21MB6025:EE_
x-ms-office365-filtering-correlation-id: c68fda08-cbef-4a69-07b4-08de5c72f91c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|8096899003|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xzl5FTaI64gIdtMOJ8A2jOSOQQGScwN3R5qFCUdXiNq4NMcv8y70bLpYMi/S?=
 =?us-ascii?Q?2oRrAHsOnGK2Ht49q71bQ1ewnnE71ja8bIHPTXdN6qRGBCJL/3Qjmlq0ZWet?=
 =?us-ascii?Q?vcs0T2kwdSn3lM4EpuKCaClwDB/CGEj5jqwBF4a/YBDtUfwjzr/HIohEf9Gr?=
 =?us-ascii?Q?mOqX80Q6L/vHjb/CKgNTBvgF4OUOFfich7kP8v933ud4HuBGWAyLR/wlNbYj?=
 =?us-ascii?Q?z8TgCkmGwqGCHxiWbiVe6dudA/5z4PptbHhKEB6xs2bUBQSfQprvGwBV4V2R?=
 =?us-ascii?Q?Q38UMiFusMK/hJyEh7bqWMGBesz88Lbir9eE75NJJ06w6amRR8O/ZLrNnmsh?=
 =?us-ascii?Q?cVK9zFeRJYhT2KrbBiPWIFjIH9IhZZYfc9Nj8NlrZWEAHZylrqkrfegZbkN+?=
 =?us-ascii?Q?lQuRXVIAxGnHMh9cQCmwUeqZzRmupeggkaSb48c1GAGZovEUlFTfVpyoQyLc?=
 =?us-ascii?Q?iqUlLtTOErSb9I6XUzNJ2dj2Mh/X6FSQpiJPQ4lEjsU/bXdCB5M5469olwr7?=
 =?us-ascii?Q?mhgf+q4ddm+DkF/jgC3sO35iuwg1ibu9uH76nzHLkoels2lmMwF9lJB58gg4?=
 =?us-ascii?Q?tw05gLETp4vhLsQHc3FeY2sQF4D58cndog+GLEUFJY6MfOXo430+R0zQMiYT?=
 =?us-ascii?Q?+mnQpy2IxiEs6aSMm7yI39ADEDHl8pdGnnTycHLbHVZa124UotbfATNkQLeW?=
 =?us-ascii?Q?MP7x1UU6Q/3HuleJ+K55Qn79BfEXtdbsCPOyqYG/rumHFTxFfhP7et3l3MkM?=
 =?us-ascii?Q?xE3RUInLIkfFv0hrZUjeLru32PgqBLYbZGqO27rqErIratrV8xlI8KrzCQZM?=
 =?us-ascii?Q?TpnWvfORq1/ZoB7hOcsJigmSHuOA7wPEWH3CaiM06tGN0XNajI0jHMKki+J8?=
 =?us-ascii?Q?4YSqRpqc06BTqtwjO+wIVvjZ9saXmAJ3A5N/hXLvw4H8bH+vSi7lp6uQFGJ8?=
 =?us-ascii?Q?I5zRJYKJpIFmH7bieESlgyEHjROUvcMSCIq05w0FyYErKMsyXep0zs/M17CR?=
 =?us-ascii?Q?66wjlQ9tE0Rc4bsbYV7IjeYRHy6JCjxEVlRzUQjQmOSeQ1TUapvWKFxXwfoa?=
 =?us-ascii?Q?ETP3tjDUxHHPLig5tVN4VuW600FjLkDG27Tkd8bScj+gHGIt0CayT/TwseOr?=
 =?us-ascii?Q?1E6Aio2gFvhd40PCi+v88vYWi3qnZiqIcKOPm2vivt8mW9o62I/gYtECiUEZ?=
 =?us-ascii?Q?ZGkEdmZNOk4fAngyXdZxREBDNghZkgXZG6bSi3hYtT/erxItpfxwxLCKQys6?=
 =?us-ascii?Q?6q0S2vSPuXfgodsBzBQmd33A94baQ2RqMdkMt2rK40TOVrUTdJdpE1NJiGgo?=
 =?us-ascii?Q?0/thge+RkFouyrEKK9AgtiLmQmFR/dEDyLDwdIcVoGzzpkmBQkOhRl9B1W7i?=
 =?us-ascii?Q?qg8ooBxaMRqPh9JdGn4jJ7EGhp6gmy26R8LeiW9IE4MHJ/PKCEprYPXmV92l?=
 =?us-ascii?Q?YMIUZB5Uljk+8xyJAvy4zOg3gP+PPOu26jyrWCvzGfJGGaCqueA25LUS70TR?=
 =?us-ascii?Q?aJBtoshCg9LN3bvW2lE50i0tKc59PyjDw9+SRAro145aqaqqpM/nhUjHNcSX?=
 =?us-ascii?Q?GGt++KHox5Q579sqd2/pQlRy0wZTLLjSxOKUAKz71iChi2CJ67xKHrGLUolc?=
 =?us-ascii?Q?Xd7DELc7ef4zvMZ+l+3KyzE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA6PR21MB4461.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(8096899003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dFk7T7rdVGVCw6nYTGAbm6l6gv1JRILZ/PqtoUmhocp3Ud8/ldoVuC+p9GS7?=
 =?us-ascii?Q?Zy36+jlEZ6EjKN1I1fKjO8A85Ovr+UlTZiIPXKTyvTjZX+/qKwUHIVxyl5VR?=
 =?us-ascii?Q?iojHEPn0vlYCxzElnVdpqpvepUGeKfHIAVqlmVI23EUBMzgoIY7XAbvXHqea?=
 =?us-ascii?Q?3nP2G1cpedp4T+Rr8uuGfgOxrIWOea7YJqzNRdD0ImYH//FAkW/2JAHnftI5?=
 =?us-ascii?Q?+HqrZuvZu+7o7UP9iNrN8mTa6i3giANeYOI959JbaQRcn/knwgyN9xYfpnWi?=
 =?us-ascii?Q?AH2f6RFYmoPDCa3KaKzmaX+kawRriercFnzjzY38lK0Js7detJvl1nrGmySe?=
 =?us-ascii?Q?KZXYkBewKKPKD+Dk9SnmMojCHv8yTG8MFQVop+ZUkRKLbMkvHNQ3dfm+oXA/?=
 =?us-ascii?Q?DpnTISQSjp1JgNxA8MmbWwFRgqMFe5LBshVtALRu+ARa9NKwiVQJpQEod+hm?=
 =?us-ascii?Q?XgeM+7mnlV3vQCgwwyztbaNQmswXoor+HV9RLpOHLyYGIEzJRmYFu449tKZ5?=
 =?us-ascii?Q?YiQVBsikt5YCF5Fr31kF7Th8Ab0vuwVimJ6Llh6mnvg0lVPfIYq63rsFfb6N?=
 =?us-ascii?Q?Cqes+G3JeFXkXeIHCf2uAfTk/Qi7FMMbY0Ic068JRZDJ9zpDKP1tCMEE3yvS?=
 =?us-ascii?Q?tDRpAMOQUoEnSnWQSufkKaSGHl8FBfSCbq1zsuOiG5JqueT309WnS0ur1qoH?=
 =?us-ascii?Q?J0iLYLFm/vBbHidLFfz5SKJGrJGWCNMWmN/2YK2nx5l1MgwBKe/G/EjflIW5?=
 =?us-ascii?Q?eBkL5CquKH8jsrAYUNrhaEiWf2SSZERI2orCysst/8t/VxYB8lJUOnx82qmc?=
 =?us-ascii?Q?vyDIu4OUY0NwE06xPUft2dLC1NYC6QhBZrtB9CxRlHVKpELQDD5PAYp7huk6?=
 =?us-ascii?Q?keC+y0/cxT69/rd34LsEntc/zSU89lTzMA47G6m5dbqwELubNwqLr2rCRKbm?=
 =?us-ascii?Q?8u+Wk1yaR0ODeP2ksMq+yHsJRZ9Yye5RE9Tb9yLjyaCKpM1p6K8aEPhTmw6R?=
 =?us-ascii?Q?wiQK8pFlwIsdtpC+o5OSAC7udVi8seuh1eDgnDQ6t26DvAaUGLvPlcw1IVfx?=
 =?us-ascii?Q?V0EUT0UXjFnCnW+rqA5FoFBeOU2yM7pOrvuHUVN3f+c0A/FTbdw6hjmoIfCK?=
 =?us-ascii?Q?RRcgx4LmTuPYKSTClHlZTssTqqV5UGHqKlMSt2g/agW994ThGoOI0H1loyWE?=
 =?us-ascii?Q?fPZXDeEzm8O8cASo+kLPB3jTHFCoGHNuePveMW8p/NR7Z6DcJ7lbtaOhtLg+?=
 =?us-ascii?Q?5FdQoRwKXmCBb2iNlvLBSoSfyTLT3vBPWTmAeA52Q6BdMw1a22POY5UNZDb2?=
 =?us-ascii?Q?VMfXV0x5r6xFld9wUwJ0mFnvH0tnvPAMM55fLh9anvVXrzdIPmVqxeuQHfZL?=
 =?us-ascii?Q?7qk+buQHTdTikhkgwvsSaqXJYG2cMK+MpRzrTaq35Xnalu0Y0xlEaUTxo1a6?=
 =?us-ascii?Q?FBHN4ik7BflnjzKoW90t2SSKFBMDfeOIz1PPOVMb033Iomf23dVHHEBzTyUn?=
 =?us-ascii?Q?elGbePBwkZBz6ONz64lYVR2aAby7bwishjz60ww+nkmF9Pvq282Z28vLtebc?=
 =?us-ascii?Q?U+8yALTjQ54mojDtsPqjg7MaMBFEHOD8bl3CpycF40MaTobf4eCtt6580i2q?=
 =?us-ascii?Q?U6F7QKnkxRM31IW8kQIc9BTGxJ9Qq2KvD+11F6iFc6PobdVsjOITGMB7iSVC?=
 =?us-ascii?Q?elIdNzpQ5YPyVyerc0V8ETQhLfdqwTdVkoHh/9W7Wi9TH5D4IJHW5nLjeSV/?=
 =?us-ascii?Q?1MeRI5HGfQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA6PR21MB44617BF0999CA8D83524DF83A693ASA6PR21MB4461namp_"
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
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA6PR21MB4461.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68fda08-cbef-4a69-07b4-08de5c72f91c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 00:36:40.8165
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUFBgpVfmM/CGqZrgRt0+kwZmpVMqQOueRZMeE71FJjUn9iwPo2p9M3CR2m81HbVUNnA6phvVITy/q8LNL+RQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB6025
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_INVALID,ARC_SIGNED,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microsoft.com,reject];
	R_DKIM_ALLOW(-0.20)[microsoft.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[garybeihl@microsoft.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1274-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microsoft.com:+]
X-Rspamd-Queue-Id: 9C0698353F
X-Rspamd-Action: no action

--_000_SA6PR21MB44617BF0999CA8D83524DF83A693ASA6PR21MB4461namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am a Microsoft employee contributing to the OpenBMC project and would lik=
e to confirm my inclusion under Microsoft's Corporate Contributor License A=
greement (CCLA) with the Linux Foundation/OpenBMC.

Please add me to the authorized contributor list for Microsoft's CCLA.

Details:
- Full Name: Gary Beihl
- Microsoft Email: garybeihl@microsoft.com
- GitHub Username: garybeihl

Microsoft has an active CCLA with OpenBMC, and I am requesting to be added =
as an approved contributor under that agreement.

Please let me know if you need any additional information or steps from my =
side.

Thank you for your assistance.

Best regards,
Gary Beihl


--_000_SA6PR21MB44617BF0999CA8D83524DF83A693ASA6PR21MB4461namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am a Microsoft em=
ployee contributing to the OpenBMC project and would like to confirm my inc=
lusion under Microsoft&#8217;s Corporate Contributor License Agreement (CCL=
A) with the Linux Foundation/OpenBMC.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please add me to th=
e authorized contributor list for Microsoft&#8217;s CCLA.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Details:<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Full Name: Gary B=
eihl<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Microsoft Email: =
garybeihl@microsoft.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- GitHub Username: =
garybeihl<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Microsoft has an ac=
tive CCLA with OpenBMC, and I am requesting to be added as an approved cont=
ributor under that agreement.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please let me know =
if you need any additional information or steps from my side.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for your =
assistance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best regards,&nbsp;=
 <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary Beihl<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_SA6PR21MB44617BF0999CA8D83524DF83A693ASA6PR21MB4461namp_--

