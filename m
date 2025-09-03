Return-Path: <openbmc+bounces-574-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80095B41543
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 08:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGtBx5SNZz2xnw;
	Wed,  3 Sep 2025 16:35:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=148.163.158.5
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756881305;
	cv=fail; b=NApGvBS9k5QIWy5y7ihyfyk+q2dIQsFShbMuKhIdbowkjnhe7lAzzQY2ymAEBs2yWI0LzRskfjVE9bnYdi2Z898t//Hs6gDuHuKT2mnlixNMxMkhsHoVX64GVV1Ko3YioFkTfbKsrdthboU4VhZn70CsBhHBCVHepwhsuFSF53IsBJnVLGwW/346zJJGvKxBiaQfGh/ze6ONFQptU/RA6fqK/P+lLUwZPWGsdXFlRYh8F7tmzhjqxPTar3Ajuze3PACf8gbh+iX8w7l1jmMLvLegLw/+Pd20tQy2zuuzxzRSsmEWdQkKdxzyMza48ipY3QIWm8UEgATd1Uhu7qMHIw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756881305; c=relaxed/relaxed;
	bh=chhpD6rQy8wpEXT1/cVlFgYSvCiK1Nkh0WhTUd37H2M=;
	h=From:To:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=RLX+Js509ii3orGA00Y425X+ffS0Dg4WAIfWXAhR6uzOZMrhrMPGvlAybWyLNfM367ADs0p30GBMGOC5f6yAzAP2M41lmjj9ho3NZSxOnjT6VTqBMSc7xTYQ4aOys4frtdxk9wATCHVYpOFHTOtEKROuaev552tvJJcAcTFioXnyVkuDiZN6xzrvVkvyNkvBiJKfar213eGSj7GmSVQIQnHLW/l8xWowVYty3LWiTw1nHj13OQ4gPJPQ4xz9kNFb6CG06S7NqfzCa57B8cXH+0puKXXjEaA2A4FgmxSj32RE5NJ46kcMnhy7gtRrH1r+gzIGI2tSXTIFg1XkMtWS+A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3v2TEm4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sridevra@in.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=in.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=in.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3v2TEm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sridevra@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGtBw4MQ8z2xSd
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 16:35:03 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582I49oY005329;
	Wed, 3 Sep 2025 06:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=chhpD6rQy8wpEXT1/cVlFgYSvCiK1N
	kh0WhTUd37H2M=; b=N3v2TEm4vw4QygrL+4iaI62n9npjFf+fAcSQR3kERdsuI7
	ChwA/OwO30xsOGYIeDn3eT4EhQ7t3d10s6ak/0CbKj60UH64VlougO2VU5OVOz46
	wUohsXWrYfuecIAbJlN4KoBTSCow9YaNo+Qeybslqr06HupUINggglhwSUEKyW0G
	DES8p4YlqmGZaZATn2Fme+JzyPpPiR+hWmGHIXnl5Gtp3lp9+YNmIkQ4GeiM9OCH
	V4qqDzsLDxYqIFI2BZ/guw30QQ96IMlZ2joRBNgPbk/gPTDtlsZq6hBWQZnSTWV2
	QCzheRUFFEA3AQryUg3sOzkpqFZNMk2gQ/QMjsNQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvft8hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 06:35:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tq2s+/A0QnotfpswjPgOpXl+E/UMgzLEqf23XbdNKmc6OM3NCApne+mU0ZcXPxs2Ocaq5KjhBf8An/gjKDJQXqgHuxeGrVOjIYeIxosD02Qo9PFYJdz+WvXxuBiqrnfPPnfjBN4DMZxh+i8lDOi3UlSrDec6w3NKUDC0xyaKTFi2eXQ29Re163ChbIjE/VMD4VxeP8wL3R6sO0XYGDkkxL/xCyKWHLYa5UqzBA+n4ZX3vUs0YISQHThuCgROebQFJKaEr2F1wKMYQjUEeuMyFKTr16Baapgr1j+HRsxGWDieDTABFlOFXIm7L0iRApZlcHACs4Iw8LVVxHvdY2joKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chhpD6rQy8wpEXT1/cVlFgYSvCiK1Nkh0WhTUd37H2M=;
 b=x/jRTq8Olt2ZInHZOyRGwscJyFZ0NfBKAqD1jxMpsTrwrpuFOFr67n6HoIyZ9/JsZt7pOxrJZ2hjh/r9LH77vD5G8uXWBL+BPrJsoqMTRxDeflmS6uebsJe7mDG/hHs2tpzP7HShuzfjSuk0PKooMuLV+N9Jkju3L29QMu/fN6Nl9zcL5qqhWXDOJFD3ooNKHXYW0v6zq7mLH8Tzn9Dd0O092Mjtge5MSQXiuvvFQCxIN4GFSXXLHyBhIuQJ71LmyauT5MgSXlGiDnVLJnBbHQUxv6XXPDVbOxDVUZ6eSsoagV1QKA5fjoOLsgpU0Ofpg8mlcNopcF+IDdoZB/sbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from SJ4PPFB81778326.namprd15.prod.outlook.com
 (2603:10b6:a0f:fc02::8be) by PH7PR15MB5643.namprd15.prod.outlook.com
 (2603:10b6:510:268::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 06:34:57 +0000
Received: from SJ4PPFB81778326.namprd15.prod.outlook.com
 ([fe80::3477:dcc0:2cf0:e930]) by SJ4PPFB81778326.namprd15.prod.outlook.com
 ([fe80::3477:dcc0:2cf0:e930%8]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 06:34:57 +0000
From: Sridevi Ramesh <sridevra@in.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>,
        OpenBMC List
	<openbmc@lists.ozlabs.org>
Thread-Topic: [EXTERNAL] Re: TOF elections for 2025H2
Thread-Index: AQHcHHi97V3WY+e+g0+9AwWDygW2p7SBAKnj
Date: Wed, 3 Sep 2025 06:34:57 +0000
Message-ID:
 <SJ4PPFB81778326B86AFDA80C5BC46671E8F601A@SJ4PPFB81778326.namprd15.prod.outlook.com>
References: <aKOKlY97pOtfuaEv@heinlein> <aLek2wDSYDGMLPH6@heinlein>
In-Reply-To: <aLek2wDSYDGMLPH6@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ4PPFB81778326:EE_|PH7PR15MB5643:EE_
x-ms-office365-filtering-correlation-id: 2219e629-836d-437b-9af2-08ddeab40040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|13003099007|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?utf-8?B?WnIzWUd3bkpiK1lzdFIzM2VtZjVlSVdoVFpNaG8yOGs1SnNxRlIzS0JXVS9Q?=
 =?utf-8?B?RDRLM0x5ekFCMVU5R2Q2ajE3dkF0NzRGTENoekZaeXRyRFp5dUl4YlNVS2dY?=
 =?utf-8?B?SHpTVFBXWkVEeXl5QmtiVGh3dDFWalNaKzRmbGZMT0FocXYwZmZRVERIVUlP?=
 =?utf-8?B?NWJORUJKdlk2ZW5KZ1NZN3BHVU00Ry8xMVZIOUdRM3R0ckp5V3NkaGx2VDls?=
 =?utf-8?B?TDNtRnQwRVBCczZKQ1pHYmZpWDJmOTlvWUxiN1JJN1NYbGtBNjdQY1VwcjNq?=
 =?utf-8?B?ekkvL3RzejV1aWhhcUVYMXQraG9WVDZCaVdPNmtERVZLWEFKa0VIcHMvZlpm?=
 =?utf-8?B?WmovRmVLNnB0UjUvNmE0WGZueXpweFd3SlN5S09NV2JwUXR6SFZYQUdpZW9u?=
 =?utf-8?B?YU1pMjNZRmcyWUkxSmt6em5GNzZ2eWdjOXRoZnhGUGRCZXhJYnhLdVlsUENB?=
 =?utf-8?B?TXpna0FZTkwvdjIvWjlrUXQwSXBickYyek8xM3IvUFFYZUVUcFhGdnpwa0VC?=
 =?utf-8?B?OVBwc09rajNGeFpPQ25nb2IxSHRpb3BLZnNvR1VWeUp5dnBZblgxQzJSNHRO?=
 =?utf-8?B?TzRLQnpkYWRaYmIzbkltTm1tUG5nKzF1UVVOSXQvaXFEOWlOaUxDK2hmK0xx?=
 =?utf-8?B?YUJ0Yi8vTlRSb0IyZTFzU1JGV3VIaW96b1huMmhqemU3NUtiY01nTEtIVEhl?=
 =?utf-8?B?RHVkYXFjckNGSnlYdlhiYVJMemEyNHhseXgySmhXZ2RhcktHS2loWEZuWU9N?=
 =?utf-8?B?NXR4K2hEWDJ1V3VsVU5iNXN2NUFYRnkwd3V0VzIzMTF3WFZIZVMxNjRCR3VZ?=
 =?utf-8?B?ZHc3KzZsS0RoN1VQcE9aUmxJd3JybVVvbmRlS1RtMEJWSGtEZ0dHYlRTdlBB?=
 =?utf-8?B?OWMxZHNjb005d0FjcmxIUmRCTFp0cm1DMHZNYm52VkgzVkRWVk80eUxHenVW?=
 =?utf-8?B?MVNEV05qMXRHTmNHWTV5bHVKRzJ4bW9zSVhheUpuZThZU1JlTDJBTFZFZkJu?=
 =?utf-8?B?TlhlaXZ2VW9KN1Q1aTU3U0YrZXMxUlhQb2dKSnlmUEJqVG16cFVYZGFtaFFF?=
 =?utf-8?B?RDNoTHlVckFOM0p3WHhXL21yYnpGNmZUaDJGeUZmbHA5MXFtS1EvUmIrSkh2?=
 =?utf-8?B?MXdpaEVXTDVIVWFWbDlueEx0VE1BTE4zSWVyOHJVaUpwMHNkWUJ5blQ0T1lQ?=
 =?utf-8?B?bXFTR1F1TzN3SEFtV2dlTWxUOEUwdkF4TjJXdkRybWtsbFZSb0dJbk5KcWFE?=
 =?utf-8?B?UlBabU05MWFGSGd4N1h5WFY2MzZVTmlDL1lqZkF3NGRTRUZMU29SRDNtMUgr?=
 =?utf-8?B?TnBtMXQrbzkyTGI1U3lzK0xpM3l5TXQvL1E1aDFnS3ZIdEo2dU55TjJqbnR4?=
 =?utf-8?B?dUQrekc5dXQxdUVtcmVjUzA2a1gzYTgyTEc4SGkyUUN0YTNERVNlVmJuWGNl?=
 =?utf-8?B?aXhaY0liTStIaTVtOWlSSi9BVkkyWFFiQXR3R1dFMlJpZXNlclp1RjhEZVNt?=
 =?utf-8?B?SDROOWZWbWRBMmdCdzUyMXdWaXpMWVBNTHlGYU9hd08rNkc4NXV3a05VNTBT?=
 =?utf-8?B?c2R2QzBpbTRIYUZ0SnJBSjNhSXNoUlcvbDQ0U1pKc0tlR3lyU0VVVENwR2tO?=
 =?utf-8?B?VlJwTFRTcDNkTXFMb0d3amZCVEw3bkRDaFNSazkrWG95dWtpcjU0YUFOV0ZO?=
 =?utf-8?B?d1NPbUFNTVVSQUR2L0pGL0lQblhhT1IyR2pTeUxqUE1BSVNUWVdiaFBxKzlG?=
 =?utf-8?B?NTVKY05sSWcyejF2aWkzZ2xTd1F1RysrYnV3NVlpS0JkZGNBWjAxWjVlZnlL?=
 =?utf-8?B?ckFIT0ZmSEZkZEVwc0hGbm1Qa0s2SXl1WVdQMENzVVhHb2lTMmMvNTdaajVn?=
 =?utf-8?B?VStDMUVZclhNTnJ5WWptMkUvTGROM3Z6ZkpEcUdnRVdJQWZtRkNIZm1YVUts?=
 =?utf-8?Q?GoO+/3fyEko=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ4PPFB81778326.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmNEbzROaXZSYWhERThNYnhUU2VxdXQvZnlvTk5yWXY3RWFBOTYyYjB6elZQ?=
 =?utf-8?B?cHhQd0VMeG5TOXFwaExFWk43ZERvVXF2blRoYnR2NVZCNUdCelJHL0lpa2V1?=
 =?utf-8?B?Q0tuVUtwOExSTlB2eklxYjd6SDVCb3oxQ1duVzlRVE5MRmY2N1E1TEcyd2hT?=
 =?utf-8?B?dDVFcGtvNHhRdU9yVFpaYTdVU0pRaHVBNGQyL2s4MWVkRGw3ZzZMVE1lRUZT?=
 =?utf-8?B?RTcxSEZJUFd1eURKd2VtTEw0RkZWdkNLRXZjeHdIeVhHM0RyRTRPMStTOFhi?=
 =?utf-8?B?dnVST0Frdk0rcXFHbEZVcmpXckdTdmNKY3RKNXYyaTQ3Q2JxaVRhRlNVL1NG?=
 =?utf-8?B?WWYvb2Q1Ukl5MXBGZHMxeWRzbjJJa3hwNjNlS251YkptZ0k0L3UzN1pIUmRh?=
 =?utf-8?B?Q2ZWTHdXU0lSamhEK1J3aFRpRU1KZDFyb3NNVHRuQTRqK0VnWlVIK3Q1VWpM?=
 =?utf-8?B?RDR5MUp5emhlWmxqM1Z5c2FvWjJVRjdFd2UwUXBuOVUxWHhsNk5MZDhQQnpI?=
 =?utf-8?B?dkpEd3RISXkxOGFwOSs1UCs4bWVTZEhlOVhFUWE0Lzl3WHlqckg3R2JQMWlt?=
 =?utf-8?B?Y01CMW1qSHFGS2MwVWFCdVNPbzh0S285dDh1anFHRDZLSzcxZS91NEJhcGU5?=
 =?utf-8?B?aXdXZmhPMWhGRmhzTFdEbjBlZDNvd0VzcFlycE1NMUhNemxmbUdPV1IxUzcr?=
 =?utf-8?B?OTk3ODBQc0MyM1VvdFkyK0NKSUxXVUhVTi9kQmdWbHBSV1FYV0s3S2VGenJY?=
 =?utf-8?B?d0J1SDQwWldxdHl0a0NTaEtyeWlYME5PUDJlR2xERkxINHdydkIvNjBBdTRL?=
 =?utf-8?B?bXU0WlNwOEJmTkRNZS85bE42NXdkVDQvKzRLWkw0Z3paQndVREw1ZXh3Q0Ey?=
 =?utf-8?B?TTYzS21vWnBramdMVDFPMnR5bTl1WmtxaTdTQjVTaHB4ZVhzTkRKR1dCL2lo?=
 =?utf-8?B?Q09jRk9GaUc5NVhRc0NhOUl1RkRjUmJtbG03TmJvTkxJUUpUTksyK3c2Z3po?=
 =?utf-8?B?ZFBtaWdVUGVLNXFVYktvQmlQS0F4Mnl6SnNNekRXaSt5RXlQVmRBUVJJeXNn?=
 =?utf-8?B?alpiZ0t1bVhqUCt0MkpUc09QekovT3FUYU1WQWRKVXVpUVpISGxRazNZZTlW?=
 =?utf-8?B?dXVwbHE4b2JKV2dPckRhRmQwUk9jMURzWk5Za1ZQamFQeHhwa01YeU5jQnNo?=
 =?utf-8?B?N2Q5eW9kT3ZieGJzY1NST1NlTDBUd2hvUmNSNVFoS1pwdWtoeVhxSHd0ajJC?=
 =?utf-8?B?REVJTEkwdDhBd2V4KzJVVHExdlhIVEdZZFZERWRzdStpSjJMZjJvWThCZy9a?=
 =?utf-8?B?Z3FoSFhSSzQ0cUtqbEwrMTI2SGM0NWVXaXByN1VFV2lCNE10RjdtcEVzcEN5?=
 =?utf-8?B?b0pURGtjRStEQ0syWVI4eXlKTmRVcmlpaHY4SE9VU20vUjdsYlNMQ3BlU1FY?=
 =?utf-8?B?bis3N1hyM3VTSEVCQnhCbFJqVExNbzFjZmJsdEdPT1YrRkdETWx0dTNzOWpW?=
 =?utf-8?B?VW5UcitBeWZtVjAvMWJzSU9MWDZnVGU2T0UvamVzYTg4OXJobWlZZ05ZSkto?=
 =?utf-8?B?VU9hME9RcEYxWGFlYmxzamVVTW84cDVZUWRPeU1xSTA2MmNrRDlxVDd1WEhD?=
 =?utf-8?B?MCs0MmVYeVNVOG8xQnlUS2FILzZmbGdMcVBlK2FpaGtjR2RmQisvQ2JHcnI3?=
 =?utf-8?B?MHk3NG1GTmI0dTFFbEFiZWN6TVFONzY5TEJGWVVzOXJDTWJMdjFieWpEdWgz?=
 =?utf-8?B?WHVDNWZxTDFtRE81ak8rOXN3S3JXckFaYVBaODhKK0t1MTRvVVhtNmZnejVV?=
 =?utf-8?B?OVQrYTNab281VzRhMHFkOWVtRlM5M3R0TmlDeHdkOVI3N3IrejREZmdBUWFn?=
 =?utf-8?B?V25EV0V3Vi82aE4xVlB1WFVJbmxPaEgwSzVHbkVDeHhRMk0vVTR2SWczNk1M?=
 =?utf-8?B?NXc5bnFtREhsQ2VPM0JSWVlNR2U2dGJhbG5zcktkRXpPcTFCL3dDeGVRcTVL?=
 =?utf-8?B?SkM1ZDlhVnVYbWV4NXBQdG1RSDNnUjl0TWJ3dFhJLzFIdUR6UHVieXlEYUt2?=
 =?utf-8?B?SGxoaGFBbWVPQjlZQXhqUnRlQTgvQVc3V0RWaXVjbHVqMFh1WmhhcCtvV3lP?=
 =?utf-8?B?S1ptbG8vanVoOHlSanJ2MnFGbXBFdUxYNEE1R0Zsd0NlS2QrYjZtcXp5a2JE?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_SJ4PPFB81778326B86AFDA80C5BC46671E8F601ASJ4PPFB81778326_"
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
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ4PPFB81778326.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2219e629-836d-437b-9af2-08ddeab40040
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 06:34:57.5469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/mTPBiTiVkaJ1sSYqlunfgden1vwXhcd6Phu6MzDrE49rUjLdYnojt5DmNkVzmnli7JI8aLREXSiU7398dHEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5643
X-Authority-Analysis: v=2.4 cv=behrUPPB c=1 sm=1 tr=0 ts=68b7e194 cx=c_pps
 a=w5zo4y5KsDtx1ruRTwrSSQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=8pif782wAAAA:8 a=2VGnaFk_AAAA:8 a=o3uVwmrQUSTarNyAdAwA:9
 a=QEXdDO2ut3YA:10 a=YTS7siblKRZ5vsDnlEUA:9 a=OfVWLyghCsas5QFs:21
 a=_W_S_7VecoQA:10 a=xuWaqJMTYXf3QM4Ho2sr:22
X-Proofpoint-ORIG-GUID: oKyxdICtM4gjjFMyuse-Xl77Qq-Bru7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfXx40byYvwuB6T
 6n2E2UCDo9zpZwBy/oaajoyYeLpBR0s0RSYGkHmog8iQ063jG1qbh5+g4uHKn1FYHVF/GZraKxv
 wXMhMvel/Ak4RPb3sKRTo5BD+N7/4hvZoGVVF5JxweTo57E8y8VEmheHz7pD5I46jCEz5icgv9N
 QW56h8F/kUiigfN67lGLEQwZehas4CArAaEmS/WiJFGeFtjbNXC3baGNh4+a/JH85FjRqSJF9zS
 LP1Giwg8b+Ab/Om6t6h9NUHTH48S3oA44BU0UvN1TsGOtwpxQ76BXr6mB2OF/0sykSpoo7qGBpf
 LPl/i+HYsbb7U9vzmemKLPah95/9qpuxrldZwp6Zc3v5ypVQPg3pvnS8fkKxOlQJEfIXaj8hXEp
 e7mxG+rO
X-Proofpoint-GUID: oKyxdICtM4gjjFMyuse-Xl77Qq-Bru7G
Subject: RE: TOF elections for 2025H2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_SJ4PPFB81778326B86AFDA80C5BC46671E8F601ASJ4PPFB81778326_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkkgd291bGQgbGlrZSB0byB2b3RlIGZvciBNYW5vaiBhbmQgQW5kcmV3IEcNCg0KUmVn
YXJkcywNClNyaWRldmkuUg0KDQpPbiAwMy8wOS8yNSwgNzo0NuKAr0FNLCAiUGF0cmljayBXaWxs
aWFtcyIgPHBhdHJpY2tAc3R3Y3gueHl6PiB3cm90ZToNCg0KR3JlZXRpbmdzLA0KDQpGb3IgdGhl
IFRPRiBlbGVjdGlvbnMgdGhpcyBoYWxmLCB3ZSBoYWQgNCBxdWFsaWZpZWQgaW5kaXZpZHVhbHMN
Cm5vbWluYXRlZCBhbmQgdGhlcmUgYXJlIDMgc2VhdHMgZXhwaXJpbmcuICBUaGVyZWZvcmUsIHdl
IGFyZSBnb2luZyB0bw0KaGF2ZSB0byBob2xkIGFuIGVsZWN0aW9uIGZvciB0aGUgaGFsZi4NCg0K
UGVyIHRoZSBUT0YgZWxlY3Rpb24gcnVsZXNbMV0gKHdpdGggbWlub3IgZGF0ZSBhZGp1c3RtZW50
cyk6DQogICAgLSBUaGUgZWxlY3Rpb24gd2lsbCBiZWdpbiBvbiBTZXB0IDNyZCwgMjAyNS4NCiAg
ICAtIFRoZSBlbGVjdGlvbiB3aWxsIGNvbmNsdWRlIG9uIFNlcHQgMTB0aCwgMjAyNSAoKikuDQog
ICAgLSBUaGUgZWxlY3Rpb24gd2lsbCBiZSBieSBSYW5rZWQgQ2hvaWNlIFZvdGluZyBvZiBxdWFs
aWZpZWQgT3BlbkJNQw0KICAgICAgZGV2ZWxvcGVycy4NCg0KRm9yIHJlZnJlc2htZW50LCB5b3Ug
YXJlIGNvbnNpZGVyZWQgInF1YWxpZmllZCIgaWYgeW91ciBHaXRodWIgdXNlciBJRA0KaXMgZm91
bmQgYXQgdGhlIHJvbGxjYWxsWzJdLg0KDQpUaGUgNCBub21pbmF0ZWQgZGV2ZWxvcGVycyBhcmUg
KGFscGhhYmV0aWNhbCBieSBHaXRodWIgSURzKToNCiAgICAqIGRrb2RpaGFsOiAgICAgICAgIERl
ZXBhayBLb2RpaGFsbGkNCiAgICAqIGVkdGFub3VzOiAgICAgICAgIEVkIFRhbm91cw0KICAgICog
Z2Vpc3NvbmF0b3I6ICAgICAgQW5kcmV3IEdlaXNzbGVyDQogICAgKiBtYW5vamtpcmFuZWRhOiAg
ICBNYW5vaktpcmFuIEVkYQ0KDQpJJ2xsIGFnYWluIHNheSB0aGlzIGlzIGEgUmFua2VkIENob2lj
ZSBWb3RpbmcuICBUaGF0IG1lYW5zIHlvdSBzaG91bGQNCmlkZWFsbHkgdm90ZSBmb3IgYXQgbGVh
c3QgMyBpbmRpdmlkdWFscywgaW4gdGhlIG9yZGVyIG9mIHlvdXINCnByZWZlcmVuY2VbM10uDQoN
CkFzIHdpdGggdGhlIGxhc3QgZWxlY3Rpb24sIHdlIGhhdmUgYSB0b29sIHRvIGZhY2lsaXRhdGUg
dm90aW5nWzRdLiAgWW91IGFyZQ0KZXhwZWN0ZWQgdG8gZm9yayB0aGUgR2l0aHViIHJlcG9zaXRv
cnksIHJ1biB0aGUgdG9vbCwgY29tbWl0IHRoZQ0KcmVzdWx0aW5nIEpTT04gZmlsZSwgYW5kIGNy
ZWF0ZSBhIFB1bGwtUmVxdWVzdCB0byBzdWJtaXQgeW91ciB2b3RlLg0KDQpJZiB5b3UgaGF2ZSB0
aGUgYGdoYCB0b29sIHRoaXMgd291bGQgYmUgYXMgZm9sbG93czoNCmBgYA0KZ2ggcmVwbyBmb3Jr
IC0tY2xvbmUgb3BlbmJtYy90b2YtZWxlY3Rpb24NCmNkIHRvZi1lbGVjdGlvbg0KLi92b3RlIC0t
dXNlciA8Z2l0aHViLWlkPg0KIyBtYWtlIHlvdXIgc2VsZWN0aW9ucyB3aXRoICd2b3RlIE4nLCAn
c2F2ZScsICdxdWl0Jw0KZ2l0IGFkZCAyMDI1SDIvdm90ZXMvPGdpdGh1Yi1pZD4uanNvbg0KZ2l0
IGNvbW1pdCAtcyAtbSAiMjAyNUgyOiA8Z2l0aHViLWlkPjogYWRkIHZvdGUiDQpnaXQgcHVzaCBv
cmlnaW4NCmdoIHByIGNyZWF0ZQ0KYGBgDQoNCklmIHlvdSBkb24ndCB1c2UgdGhlIGBnaGAgdG9v
bCBob3BlZnVsbHkgeW91IGtub3cgdGhlIGVxdWl2YWxlbnQNCmdpdC1jb21tYW5kcyAvIGdpdGh1
YiB3ZWJ1aSBvcGVyYXRpb25zLg0KDQpQbGVhc2UgcmVhY2ggb3V0IGVpdGhlciBieSBlbWFpbCBv
ciBpbiAjdHNjLWFuZC10b2YgaW4gRGlzY29yZCBpZiB5b3UNCmhhdmUgdHJvdWJsZSB2b3Rpbmcu
DQoNCigqKSAtIFNpbmNlIHRoZSBlbGVjdGlvbiBydWxlcyBkbyBub3Qgc3BlY2lmeSBhIHRpbWV6
b25lIGZvciB0aGUNCiAgICAgIGVsZWN0aW9uLCBwbGVhc2Ugc3VibWl0IHlvdXIgdm90ZS9QUiBi
eSAyMzo1OTo1OSBTYW1vYSBTdGFuZGFyZA0KICAgICAgVGltZSAoU1NUKS4NCg0KWzFdOiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL3RvZi9tZW1iZXJzaGlwLWFu
ZC12b3RpbmcubWQjdGVybXMtYW5kLWVsZWN0aW9ucw0KWzJdOiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy90b2YtZWxlY3Rpb24vYmxvYi9tYWluLzIwMjVIMi9yb2xsY2FsbC5qc29uDQpbM106
IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0luc3RhbnQtcnVub2ZmX3ZvdGluZw0KWzRd
OiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy90b2YtZWxlY3Rpb24NCg0KLS0NClBhdHJpY2sg
V2lsbGlhbXMNCg0K

--_000_SJ4PPFB81778326B86AFDA80C5BC46671E8F601ASJ4PPFB81778326_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9Imx0
ciIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIaSw8L2Rpdj4NCjxk
aXYgZGlyPSJsdHIiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFyaWFsLCBIZWx2ZXRpY2Es
IHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJy
Pg0KPC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij5JIHdvdWxkIGxpa2UgdG8gdm90ZSBmb3INCjwvc3Bhbj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6IFNsYWNrLUxhdG8sIFNsYWNrLUZyYWN0aW9ucywgYXBwbGVMb2dvLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDE1cHg7IGNvbG9yOiByZ2IoMjksIDI4LCAyOSk7IGJhY2tn
cm91bmQtY29sb3I6IHJnYigyNDgsIDI0OCwgMjQ4KTsiPk1hbm9qIGFuZCBBbmRyZXcgRzwvc3Bh
bj48L2Rpdj4NCjxkaXYgZGlyPSJsdHIiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFyaWFs
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0ibHRyIiBzdHlsZT0iZm9udC1mYW1pbHk6
IEFwdG9zLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NClJlZ2FyZHMsPC9kaXY+DQo8ZGl2IGRpcj0ibHRyIiBzdHls
ZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClNyaWRldmkuUjwvZGl2Pg0KPGRp
diBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCk9uIDAzLzA5LzI1LCA3OjQ24oCvQU0sICZxdW90O1BhdHJpY2sgV2lsbGlhbXMm
cXVvdDsgJmx0O3BhdHJpY2tAc3R3Y3gueHl6Jmd0OyB3cm90ZTo8YnI+DQo8YnI+DQo8ZGl2Pkdy
ZWV0aW5ncyw8L2Rpdj4NCjxkaXYgZGlyPSJsdHIiPjxicj4NCjwvZGl2Pg0KPGRpdj5Gb3IgdGhl
IFRPRiBlbGVjdGlvbnMgdGhpcyBoYWxmLCB3ZSBoYWQgNCBxdWFsaWZpZWQgaW5kaXZpZHVhbHM8
L2Rpdj4NCjxkaXY+bm9taW5hdGVkIGFuZCB0aGVyZSBhcmUgMyBzZWF0cyBleHBpcmluZy4mbmJz
cDsmbmJzcDtUaGVyZWZvcmUsIHdlIGFyZSBnb2luZyB0bzwvZGl2Pg0KPGRpdj5oYXZlIHRvIGhv
bGQgYW4gZWxlY3Rpb24gZm9yIHRoZSBoYWxmLjwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+PGJyPg0K
PC9kaXY+DQo8ZGl2PlBlciB0aGUgVE9GIGVsZWN0aW9uIHJ1bGVzWzFdICh3aXRoIG1pbm9yIGRh
dGUgYWRqdXN0bWVudHMpOjwvZGl2Pg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDstIFRo
ZSBlbGVjdGlvbiB3aWxsIGJlZ2luIG9uIFNlcHQgM3JkLCAyMDI1LjwvZGl2Pg0KPGRpdj4mbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDstIFRoZSBlbGVjdGlvbiB3aWxsIGNvbmNsdWRlIG9uIFNlcHQg
MTB0aCwgMjAyNSAoKikuPC9kaXY+DQo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOy0gVGhl
IGVsZWN0aW9uIHdpbGwgYmUgYnkgUmFua2VkIENob2ljZSBWb3Rpbmcgb2YgcXVhbGlmaWVkIE9w
ZW5CTUM8L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ZGV2
ZWxvcGVycy48L2Rpdj4NCjxkaXYgZGlyPSJsdHIiPjxicj4NCjwvZGl2Pg0KPGRpdj5Gb3IgcmVm
cmVzaG1lbnQsIHlvdSBhcmUgY29uc2lkZXJlZCAmcXVvdDtxdWFsaWZpZWQmcXVvdDsgaWYgeW91
ciBHaXRodWIgdXNlciBJRDwvZGl2Pg0KPGRpdj5pcyBmb3VuZCBhdCB0aGUgcm9sbGNhbGxbMl0u
PC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj48YnI+DQo8L2Rpdj4NCjxkaXY+VGhlIDQgbm9taW5hdGVk
IGRldmVsb3BlcnMgYXJlIChhbHBoYWJldGljYWwgYnkgR2l0aHViIElEcyk6PC9kaXY+DQo8ZGl2
PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyogZGtvZGloYWw6Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IERlZXBhayBLb2RpaGFsbGk8L2Rpdj4NCjxkaXY+
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7KiBlZHRhbm91czombmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgRWQgVGFub3VzPC9kaXY+DQo8ZGl2PiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyogZ2Vpc3NvbmF0b3I6Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7QW5kcmV3IEdlaXNzbGVyPC9kaXY+DQo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyogbWFub2praXJhbmVkYTombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtNYW5vaktpcmFuIEVk
YTwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+PGJyPg0KPC9kaXY+DQo8ZGl2PkknbGwgYWdhaW4gc2F5
IHRoaXMgaXMgYSBSYW5rZWQgQ2hvaWNlIFZvdGluZy4mbmJzcDsmbmJzcDtUaGF0IG1lYW5zIHlv
dSBzaG91bGQ8L2Rpdj4NCjxkaXY+aWRlYWxseSB2b3RlIGZvciBhdCBsZWFzdCAzIGluZGl2aWR1
YWxzLCBpbiB0aGUgb3JkZXIgb2YgeW91cjwvZGl2Pg0KPGRpdj5wcmVmZXJlbmNlWzNdLjwvZGl2
Pg0KPGRpdiBkaXI9Imx0ciI+PGJyPg0KPC9kaXY+DQo8ZGl2PkFzIHdpdGggdGhlIGxhc3QgZWxl
Y3Rpb24sIHdlIGhhdmUgYSB0b29sIHRvIGZhY2lsaXRhdGUgdm90aW5nWzRdLiZuYnNwOyZuYnNw
O1lvdSBhcmU8L2Rpdj4NCjxkaXY+ZXhwZWN0ZWQgdG8gZm9yayB0aGUgR2l0aHViIHJlcG9zaXRv
cnksIHJ1biB0aGUgdG9vbCwgY29tbWl0IHRoZTwvZGl2Pg0KPGRpdj5yZXN1bHRpbmcgSlNPTiBm
aWxlLCBhbmQgY3JlYXRlIGEgUHVsbC1SZXF1ZXN0IHRvIHN1Ym1pdCB5b3VyIHZvdGUuPC9kaXY+
DQo8ZGl2IGRpcj0ibHRyIj48YnI+DQo8L2Rpdj4NCjxkaXY+SWYgeW91IGhhdmUgdGhlIGBnaGAg
dG9vbCB0aGlzIHdvdWxkIGJlIGFzIGZvbGxvd3M6PC9kaXY+DQo8ZGl2PmBgYDwvZGl2Pg0KPGRp
dj5naCByZXBvIGZvcmsgLS1jbG9uZSBvcGVuYm1jL3RvZi1lbGVjdGlvbjwvZGl2Pg0KPGRpdj5j
ZCB0b2YtZWxlY3Rpb248L2Rpdj4NCjxkaXY+Li92b3RlIC0tdXNlciAmbHQ7Z2l0aHViLWlkJmd0
OzwvZGl2Pg0KPGRpdj4jIG1ha2UgeW91ciBzZWxlY3Rpb25zIHdpdGggJ3ZvdGUgTicsICdzYXZl
JywgJ3F1aXQnPC9kaXY+DQo8ZGl2PmdpdCBhZGQgMjAyNUgyL3ZvdGVzLyZsdDtnaXRodWItaWQm
Z3Q7Lmpzb248L2Rpdj4NCjxkaXY+Z2l0IGNvbW1pdCAtcyAtbSAmcXVvdDsyMDI1SDI6ICZsdDtn
aXRodWItaWQmZ3Q7OiBhZGQgdm90ZSZxdW90OzwvZGl2Pg0KPGRpdj5naXQgcHVzaCBvcmlnaW48
L2Rpdj4NCjxkaXY+Z2ggcHIgY3JlYXRlPC9kaXY+DQo8ZGl2PmBgYDwvZGl2Pg0KPGRpdiBkaXI9
Imx0ciI+PGJyPg0KPC9kaXY+DQo8ZGl2PklmIHlvdSBkb24ndCB1c2UgdGhlIGBnaGAgdG9vbCBo
b3BlZnVsbHkgeW91IGtub3cgdGhlIGVxdWl2YWxlbnQ8L2Rpdj4NCjxkaXY+Z2l0LWNvbW1hbmRz
IC8gZ2l0aHViIHdlYnVpIG9wZXJhdGlvbnMuPC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj48YnI+DQo8
L2Rpdj4NCjxkaXY+UGxlYXNlIHJlYWNoIG91dCBlaXRoZXIgYnkgZW1haWwgb3IgaW4gI3RzYy1h
bmQtdG9mIGluIERpc2NvcmQgaWYgeW91PC9kaXY+DQo8ZGl2PmhhdmUgdHJvdWJsZSB2b3Rpbmcu
PC9kaXY+DQo8ZGl2IGRpcj0ibHRyIj48YnI+DQo8L2Rpdj4NCjxkaXY+KCopIC0gU2luY2UgdGhl
IGVsZWN0aW9uIHJ1bGVzIGRvIG5vdCBzcGVjaWZ5IGEgdGltZXpvbmUgZm9yIHRoZTwvZGl2Pg0K
PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtlbGVjdGlvbiwgcGxlYXNl
IHN1Ym1pdCB5b3VyIHZvdGUvUFIgYnkgMjM6NTk6NTkgU2Ftb2EgU3RhbmRhcmQ8L2Rpdj4NCjxk
aXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7VGltZSAoU1NUKS48L2Rpdj4N
CjxkaXYgZGlyPSJsdHIiPjxicj4NCjwvZGl2Pg0KPGRpdj5bMV06IDxhIGhyZWY9Imh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvdG9mL21lbWJlcnNoaXAtYW5kLXZv
dGluZy5tZCN0ZXJtcy1hbmQtZWxlY3Rpb25zIiBkYXRhLW91dGxvb2staWQ9IjRkODJlZWM2LWEy
ZDUtNDQyMy1iZDdiLWIwZGI3YmUwOTY1YSI+DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9k
b2NzL2Jsb2IvbWFzdGVyL3RvZi9tZW1iZXJzaGlwLWFuZC12b3RpbmcubWQjdGVybXMtYW5kLWVs
ZWN0aW9uczwvYT48L2Rpdj4NCjxkaXY+WzJdOiA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy90b2YtZWxlY3Rpb24vYmxvYi9tYWluLzIwMjVIMi9yb2xsY2FsbC5qc29uIiBkYXRh
LW91dGxvb2staWQ9IjVmOTc5NmFjLWY5Y2MtNDE0NC1hYzFiLTJmNDhhZjU3NGFjNCI+DQpodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy90b2YtZWxlY3Rpb24vYmxvYi9tYWluLzIwMjVIMi9yb2xs
Y2FsbC5qc29uPC9hPjwvZGl2Pg0KPGRpdj5bM106IDxhIGhyZWY9Imh0dHBzOi8vZW4ud2lraXBl
ZGlhLm9yZy93aWtpL0luc3RhbnQtcnVub2ZmX3ZvdGluZyIgZGF0YS1vdXRsb29rLWlkPSIwNTE2
ZTNlMS1lNjI0LTQ0MGQtODYyNi1iMzU5ZDY3NWYxNDUiPg0KaHR0cHM6Ly9lbi53aWtpcGVkaWEu
b3JnL3dpa2kvSW5zdGFudC1ydW5vZmZfdm90aW5nPC9hPjwvZGl2Pg0KPGRpdj5bNF06IDxhIGhy
ZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3RvZi1lbGVjdGlvbiIgZGF0YS1vdXRsb29r
LWlkPSJlMTk2YTI5Yi00NGMxLTQyMzYtODg1Yy0xZWEzOWRjOGFjYWUiPg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvdG9mLWVsZWN0aW9uPC9hPjwvZGl2Pg0KPGRpdiBkaXI9Imx0ciI+PGJy
Pg0KPC9kaXY+DQo8ZGl2Pi0tPC9kaXY+DQo8ZGl2PlBhdHJpY2sgV2lsbGlhbXM8L2Rpdj4NCjxk
aXYgZGlyPSJsdHIiPjxicj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_SJ4PPFB81778326B86AFDA80C5BC46671E8F601ASJ4PPFB81778326_--

