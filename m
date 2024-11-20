Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8D9D3214
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 03:10:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtPvX1gp4z3c88
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 13:10:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732068596;
	cv=pass; b=i7LhlQbQBd+OO+T9+ApAJIXncUPa1/x+KVggeV11eRbeaVlCpMz9EKRQ3y6MDboMJpc3c93dlI66TkNEzAMP0MigceprLpmD3Zc07nbxoJ5FZiI5ElHb4kAnKgTOR+vq4Z81nwmJP00q9AD4QtbAINUGRL+m8BzHV+9ORQ54yJrvutPN6tLFdLCZKflThpjdXX63L2VvwjeFQKD97juEQQz1gCH8Qy1k2sKyfLdbs7nsYaEl/Q0m9FFYuDM/7B7wQCsamHLQKjyMbby6qZfsuQBs+AqQcL7SmvFwVaeCj6kCVbD/Oh/NV/5i391FE6WKy94izcPc30p7/2LDjV647w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732068596; c=relaxed/relaxed;
	bh=6YO75OTLXb8WcZToPazjoNuPofKF6rBhtxbunrfJt8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ILhzEqgnp9mCekxqWm9VkEIGIkIMiqEzYjRvig7cJPh6QeJuyFfqzrEtcc4kgICGTIedBG9qjiT2zzhLlZQX9bdF6YRk4GBEyG1Xng8rhO6n8fDuEtcuP6Z5JN15NshAPc+oN3R1F5Cd/IDAt0qFU13lnRvza/iZpfw8kGIrKpPKUh8duZoaw/bzHYiXUj2XJcYilJJh50KYBw/IB4UvYVsaL6bLGN8t5Mi4FcUpROfXs5b6L1/ywgmcrBoMCJunLy4EwKUfPUAI2IGm2EqnGKYGhkG2n31sj45eX4MJXVwMwR1ornZh3kVTt+7rCJAfrmuzmesgf/1Cu8rIa3cnHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtPv90Gkwz2yK7;
	Wed, 20 Nov 2024 13:09:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5NVNFmgaFDovP/YMMUp33iGTeQLRQeEA48u7VG4XzBgQtIAi5jUAv/v+uoAZAXZsHN4bes64cOfK+do2oa86w0/W2UMd740cijyCoFRqkxlX6eLmAuWlu+cAKczkuUv7KOeiy1MMPWiMSi1DsZHej7/aDlfX8z6If1ZbmE8GrFTdJlxhtWVIR7XwO4XP4xrFbxi9Bwyp04DpwfQYOnTN3+cG8Lyj8eBL5sywHl7QXimQTrtuN/NZj354MVmDp6f5QNByC+MOcQmVeY+z6VvU1IEqZaN1LGf8NCXNdsN7WbHFRUJEDhSbuqlY0MoJTfkwdtDp1pX9UT+lx4EoH+TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YO75OTLXb8WcZToPazjoNuPofKF6rBhtxbunrfJt8c=;
 b=cRmJR+oR9dlianxGp8NMOpx4hnkEBF/YhaQectsT4rxcDNWPnz3A0IgbtYCacG+As1zzf9oUw1xmimHx9cUOAbdSdSf3aUfNRpETnuqXgiJTHW8Zkx4hCXNcFPlPocoiwzsDeCxFZHgK1cuhm5jh9JMzg3qvv2zcR/v+WEgEs6nKGBmHpIoEofTXXpxHNjUPCVOnUtjBtTKRLuUNChuqlhThazwTqakJUpvJ2E2amS2uqjm1lTNX1b1SG4xKcioh/YRndR1YcZyDsXZ4ZwQV9RLC+ehcBun6n7K7v95K5VYDbfe6FkuGmld8nmn6uaQ3SgentMxU4qfP0xKGN2Ke5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YO75OTLXb8WcZToPazjoNuPofKF6rBhtxbunrfJt8c=;
 b=OlkZwhv6Wi3Ofp0jMc4cbGPcyPNZD0RW36QeGDH/3w8XdrvhlrOeLHkdMN8EJEv9pMzTdo5tvyC8l8MSw2fWSmIbZyw+kMbjEWq5GUBvODF25OZD9Xhc9QIA4NzizySkb2u5O8Vqp5NI+7ISVMZnupg4eU48LzE55rh00r7SSD3XVr3oj5IKtL9KLyRYcSM1kMLqQ9kIUAeyR8vksqk4UVz/92JWPoaviPITfjt3zvQfgnziEl3N4N/IkpWHZR/RjB3ia7eec9LOG2JxBGPZ9+aZLi8R0SLCoSRLZEZfSm/nZzX0fkGXiOWPo/QgI8QjFwopF8vka2wjTWmjl0HIZg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by KL1PR06MB6428.apcprd06.prod.outlook.com (2603:1096:820:f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.12; Wed, 20 Nov
 2024 02:08:41 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8182.011; Wed, 20 Nov 2024
 02:08:41 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Mark Brown
	<broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
Subject: RE: [PATCH] spi: aspeed: Fix an error handling path in
 aspeed_spi_[read|write]_user()
Thread-Topic: [PATCH] spi: aspeed: Fix an error handling path in
 aspeed_spi_[read|write]_user()
Thread-Index: AQHbOspdR6q1iemZIkOyZTV3R/53NbK/a/ng
Date: Wed, 20 Nov 2024 02:08:41 +0000
Message-ID:  <TYZPR06MB5203E218B914FDFCAA0E384EB2212@TYZPR06MB5203.apcprd06.prod.outlook.com>
References:  <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
In-Reply-To:  <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|KL1PR06MB6428:EE_
x-ms-office365-filtering-correlation-id: a8742ea1-c40f-40c1-3d1d-08dd09084108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?DZ4EH3YLmkr9gZBCosy8VYY+uJMC7lCID9do8F4IC21XTJCS4TOPbTuy4R?=
 =?iso-8859-1?Q?N7MIZI7Czgjteqv2YCDZKeX8sqG6L+YQL9RrYBm/hVutU+q6/YV1UFpQ8L?=
 =?iso-8859-1?Q?ny62w5rFK/Ds8N7k3GXI9pEGtQ/lMPrv+XfwPGAio+alFOYJmlBMxaVdHh?=
 =?iso-8859-1?Q?QVmYwxUbw8f5Sn6deJeiiyHRoeJD/JD5d4CN9G1elSz/JvCITlpM073odU?=
 =?iso-8859-1?Q?AUg/rKytIkPPb6C1slTAcrrz6D0O3OMZux012sJ4lOogS4CqpG4Vni813v?=
 =?iso-8859-1?Q?v59vWKGcSXGeLul1iW6uyc+1UAfa1pB0GeCwpkwx616/SPv8KPBI87JtWT?=
 =?iso-8859-1?Q?+rB5Do+5GzkmhQwa1Kr45um6pqQM2KaxPG6+gWwMhYzc3rTKVqVn76InkR?=
 =?iso-8859-1?Q?1QnHPVHSv3Pmi4FJFHmiTR6NPhP5kxCZYRS+CT4BWtseq3s6N1LRZQFkuD?=
 =?iso-8859-1?Q?rp2ZL0yrlSvdahaep9OLlvwiNxAtiV3wHcUYqQLQgkawYkE+NnKa+j/z8+?=
 =?iso-8859-1?Q?0QUx217SxOmRRqTspLnvPNFUtzldrue/8147qR+gKsNCyNGVLROHIm9lwo?=
 =?iso-8859-1?Q?F/Jfr8vwNh8iUokFn850gUnYMEWXX967TWwoGnHUU1hrWxmTFBGWyHR8np?=
 =?iso-8859-1?Q?2BP3xNZi7IqPqLpFLSxWqmCIRYy+QVBioLxhIPdY1Qy+rqiaDDNWfg0QdO?=
 =?iso-8859-1?Q?P6sC/579EOMz3gVCiv4yYBlk3/wpcB+fwClHcydB1IAJS7f0NPWgeXFcj6?=
 =?iso-8859-1?Q?vQ0qRQ0k/i4g7LeQabZNKEv+sqL/Tkqse81BP8AApCbdiwAkjFrhNZoWd1?=
 =?iso-8859-1?Q?o1nIMsTC+JiXFyVtdsBS208zU0nAIjLu1bkUJFt0o26fQV/Nyn0Dfj/gZu?=
 =?iso-8859-1?Q?MoULyQu4TSqZo930Z9kd02UCIlWl2/UgDo1ogcNlZY9nirRxTdi9uc4qBB?=
 =?iso-8859-1?Q?WfmKdMRaYAO85UEy7tkMyA9zvU4oL9u584yYgvgLkJ/VaxqkfWlxPillhY?=
 =?iso-8859-1?Q?Be50C1GNR1iLuDghypWDorl9zaMAuVmlDWfiaRczr/JZAYaSFkJGgoi4j3?=
 =?iso-8859-1?Q?J3NnNZ5vZfsxM8dSE/cvizUstCi4rdk+H4+vq5P/uoS/LHvOo8cRsOO+IT?=
 =?iso-8859-1?Q?vtwsVerZS5gemq11QEHY6qKVOPu82fKE3cjbhUsxmsaBPoS+AU/w1id3B4?=
 =?iso-8859-1?Q?KOfS0wLUKymd58TxqhSDiRlolE53trugj+dCRNZ5DSORvRnet5nnb3I2Pj?=
 =?iso-8859-1?Q?atm9MbmfsENq/GzoPh9gwuH1nq+ZLexcfsa5H4cEvZGe/9FiCksK1ReAlG?=
 =?iso-8859-1?Q?fjF2R5h3v8qjTCTCmOPExgGzK11P+JoOZB5SDmoVZgdw2KzlMkebTiE+RH?=
 =?iso-8859-1?Q?GP00CBzzs7KLh5vVBrZ1EfZeatGW7pGWS4no2Uw2QGmUZdVGYCqtY=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?SbM47teh9pWRLKA2tpLQWT1LT88FqrMQ5bHk8uHy7DfUKNS+qZQJIzhXgw?=
 =?iso-8859-1?Q?LzgXK2H6x8Z1ZnxTdsCjTgMWyWlYmpaqT2lrffqQ1TMG79QIv9cCuO6piF?=
 =?iso-8859-1?Q?Do8FmsUERk6+yHNXO4EcOz3z/FrqTUrI4XG5+0Po0G0wUMBW5ASNLxU6d6?=
 =?iso-8859-1?Q?G/rEeYRp6KU139sfzGaeE4GLfuHLI+85xIqqP9FfH3tA36AGZgIDXmlXOn?=
 =?iso-8859-1?Q?btCh4ibJxZtlNqCyEmMQ8yEKW+pXp60axp5f+4kJOWCMBgeUF+FhbvW78a?=
 =?iso-8859-1?Q?gR6mY3gD2gBDLw9kNCF+LkqJ7NpeVZMLyZ9zoJZzPvumd7jkNLYEMCd3kN?=
 =?iso-8859-1?Q?So0Azo3GZcDmog6wyLsk6SH3EOqNq3zD4ybAX5jIvR/T/kyJH1PhBmbU+2?=
 =?iso-8859-1?Q?VE6Sqt2cv5FxWPbQEJLxL53nsECBv689DbD8myUo9dhG8Ktws744Yt+ddC?=
 =?iso-8859-1?Q?du/P8oSE9EZ4cfBcDEgCPshr8ppywqJWhPfc2QAURquts7X29bojUN+fM5?=
 =?iso-8859-1?Q?+pKZ/++JQt0RFdSRuUwtEdIwCPeOZ38ec5YUpsd8b5/L1+k4GEUH8KELbv?=
 =?iso-8859-1?Q?+T+0ghAQ4ZublLzQyB6tnbYXxdgU2SjtnPUcXx8ilM5lGFP4Bygy1ZHAQi?=
 =?iso-8859-1?Q?fzjfJWu8omRvHiW6OvK1u51j81XE+UZbdhaGhXZukteZCKBRHsAltRumUk?=
 =?iso-8859-1?Q?LO7cB86xluVTFFzv2e+5GiCWZ5pWyNX64qYb3xuI/eofh+9tIwiIhmfjPj?=
 =?iso-8859-1?Q?wfoGprFd76BtAlOuaFtU0BpFC2MBwHxshAVMzttCI3gqD54wGzsk4oWUNv?=
 =?iso-8859-1?Q?XCPnO3lWFnO9AxYcNOTiKK0fqJs1Dism6CmSOlk1kmuDcCS1TLtwTLSV+V?=
 =?iso-8859-1?Q?CdNmcd4XY65Kexg+12BEkF+Pke8WwfWeMpDL5wBvmmnbgckQ1PYmD5n+fn?=
 =?iso-8859-1?Q?Jhwtb9SYeDcunrb6ILohHC216dHdvMRyt6aV9OrhkAC4Dj617tH1h/I9I4?=
 =?iso-8859-1?Q?Q1IvpjqbnHF7wk5KVaArrwoen1aIp81L+eZfDIItRIxlAwuA/NzWgKabbI?=
 =?iso-8859-1?Q?x+iDTyCSqjiVQi2qrEeb+J8Zc8OE/aKIAmbrbDKSVnao6eb+hzkejS36Fl?=
 =?iso-8859-1?Q?c7c5tHJ8kj6D/KEOP04aRHqK3EURuSPFcI6f07WDFPbjimoYXKDfS1HxvE?=
 =?iso-8859-1?Q?xgpHlYw+kWYCQG41xErgwWIX6JYgwneU/NLieioct10Lnbg2UMXRooknru?=
 =?iso-8859-1?Q?7iZhAk9BISc71cxYpB/LzMxo9uN0bXIo8cC7Mv0BDGLC/RIG38QnqvVn2U?=
 =?iso-8859-1?Q?RyAoPuskoxqRx0Sk5e44b2JFfyRlmwXj98jsM6fwFlHWgHgI/tPQY0bGPF?=
 =?iso-8859-1?Q?kJ3XuCyXdvAIDVQXtKqF9ndFds4HKdUFT6zLKPH1u465560FZRTtK9v5rj?=
 =?iso-8859-1?Q?9fBFvU/4dpVPzZH96AzUd+vVe15+eqzitb9JsXS4aygeKh8w+AJTlG0xjt?=
 =?iso-8859-1?Q?BaQJYKi6lg83ubH/sN7z9f7EjnPEeUwW5f9T6uHHcBCQB1YCw5+juksYlk?=
 =?iso-8859-1?Q?Zr61u5MRk3YPErGhqL0jP6bThra9uozQz3ru3qoydiG9GkIekCs07NPtbG?=
 =?iso-8859-1?Q?v1dMn6tTdoEzjdu9vMpAXf4htTdCfOjmmhA28R6k4iIA+dV2kOU6TwlQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8742ea1-c40f-40c1-3d1d-08dd09084108
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 02:08:41.1353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFvBe0mYjhs2ZCbPlMI4JZOMG6ve3NNoYUG+oZmyc7H+bZOwGePvJ+zSUjAuMSqcpeNvHzC6b20wZywGYhS0TlVMf84luKMrWoop3bEytDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6428
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Thanks for the patch.

> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Sent: Wednesday, November 20, 2024 5:30 AM
> Subject: [PATCH] spi: aspeed: Fix an error handling path in
> aspeed_spi_[read|write]_user()
>=20
> A aspeed_spi_start_user() is not balanced by a corresponding
> aspeed_spi_stop_user().
> Add the missing call.
>=20
> Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem"=
)
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
>=20
>=20
> This patch is completely speculative, review with care!
>=20
> It is only based on naming where a _start() function if not followed by a
> _stop() in some paths but is in other paths.
> ---
>  drivers/spi/spi-aspeed-smc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c =
index
> 8eb843ddb25f..e9beae95dded 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -239,7 +239,7 @@ static ssize_t aspeed_spi_read_user(struct
> aspeed_spi_chip *chip,
>=20
>  	ret =3D aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, offset,
> op->cmd.opcode);
>  	if (ret < 0)
> -		return ret;
> +		goto stop_user;
>=20
>  	if (op->dummy.buswidth && op->dummy.nbytes) {
>  		for (i =3D 0; i < op->dummy.nbytes / op->dummy.buswidth; i++) @@
> -249,8 +249,9 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_ch=
ip
> *chip,
>  	aspeed_spi_set_io_mode(chip, io_mode);
>=20
>  	aspeed_spi_read_from_ahb(buf, chip->ahb_base, len);

How about adding a blank line here?

> +stop_user:
>  	aspeed_spi_stop_user(chip);
> -	return 0;
> +	return ret;
>  }
>=20
>  static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip, @@
> -261,10 +262,11 @@ static ssize_t aspeed_spi_write_user(struct
> aspeed_spi_chip *chip,
>  	aspeed_spi_start_user(chip);
>  	ret =3D aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val,
> op->cmd.opcode);
>  	if (ret < 0)
> -		return ret;
> +		goto stop_user;
>  	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out,
> op->data.nbytes);

A blank line here?

> +stop_user:
>  	aspeed_spi_stop_user(chip);
> -	return 0;
> +	return ret;
>  }
>=20
>  /* support for 1-1-1, 1-1-2 or 1-1-4 */
> --
> 2.47.0

Chin-Ting
