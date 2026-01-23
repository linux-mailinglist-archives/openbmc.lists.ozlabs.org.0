Return-Path: <openbmc+bounces-1272-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CETLwQLc2mWrwAAu9opvQ
	(envelope-from <openbmc+bounces-1272-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 23 Jan 2026 06:45:40 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1A70890
	for <lists+openbmc@lfdr.de>; Fri, 23 Jan 2026 06:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy6NJ6Q5vz2xHt;
	Fri, 23 Jan 2026 16:45:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.145.42 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769147136;
	cv=pass; b=ArthN+cAh72y+WiCs1MbH80RzR2l/mGN3MyYe4zC8guNgsIBQJKiM/tFNUBj4xhFsAQ/wf6ErcWS2kQQ4VVJCSOlEyfEZXClPVtYJON2/5hHiITfoJvIVjihhQd5vbPZwfyTL4QLDYtQwxLPZT/TXLx4Y+7jepJuCgbpVcxqJgWaDLhp4Fwvq00ZGQUPhNUg0V3G5ezPGj3y9ijwp/vBuLwjj2iqgP//w3WqX45gEqKzwMR5cMcReLCfkztHhzMZ4iF39NXi4cDqIEWwNoofKbmR870Hro0nmelz56/wm5/+fz3Sg1FcyiwwAQS3uO8HTsA26IuOCyJbnVa3JUrVmw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769147136; c=relaxed/relaxed;
	bh=EzK88MeA/uqj/ZXUq63+ZbCDPrhoE12OA6Fun4TGYtM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/xrHWYnnsaCY+Cs/6G/VOIO+xZjBE0YBOL7F1Nw5fPd5sWyB/FhTASWndQbJSB6+P44rG4kxsMbqtJXYVQOR5E7kA5Y/rEiMqh7kn52BaOOgsvLD7nVLuT6r2jsy+hIGo2kuBQ6ON7pL5TaYKmd4wdHiLDLDd8ymEws1MH25SvSGoFyEQFw6I+4vFj3HNrUKclFW1aLRNX9Q3Ng7x+3XCPLRtwO62JsrsjDAzIBQ/9YnXoDziLMIdIBU/NKcTjGvqhs10uP7Jmm3hqNc5Y+50V/XHdvlDuNdOysIQEl01WnjmWGpZhpJl1XdRRjWzlhxZOoEG0BsGN9H49k8Bwulg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=IeIcMj0a; dkim-atps=neutral; spf=pass (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=948327f6de=jagpalgill@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2025-q2 header.b=IeIcMj0a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=948327f6de=jagpalgill@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 407 seconds by postgrey-1.37 at boromir; Fri, 23 Jan 2026 16:45:35 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy6NH11C2z2x9M
	for <openbmc@lists.ozlabs.org>; Fri, 23 Jan 2026 16:45:34 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MKdPup3679210;
	Thu, 22 Jan 2026 21:38:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2048-2025-q2; bh=EzK88MeA/uqj/ZXUq63+ZbCDPrhoE12OA6Fun4TGYtM=; b=
	IeIcMj0aY/iX9tZWeRvECCKW3k2OGNVzsZB8Hq7uDuCAAx0CUG89IG4rlBdQ7JXs
	tMDeQUgQnXmtrD6fr7W43bSImtBNY5fBKMDFlNwldI09YjVwH57HTA0UfwqmT8OY
	OkgkTu5BEB6FweVLW+TLEaKlbqay9gb1aXErNc8rn+D34/aawlUXGob+lK7HyWaR
	S6IMCRONtbcf/U60ERx8cnLtKgjy5/nBpH7VIa4gG+cJIr3o2XVP3voD1thjcfVe
	pMsK+2x4q0tbtvGMahcR5x6es0FQHUFcd/sbFCS7pbjHKQPBG+ODzAUR/zf0eiJ7
	mjuLQwMofQLhW4D0hhtISA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4buu4ekb7v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 21:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2JTABTyjlaxxqAJ7qcHxGJ7n6u/7v6ohwHCsTOGoYCaveANOgkS59k6EYa4fHUckMICRaUpGlSlM//RoEZYd3hjdXzk/hmbxI+tr3pDuOFHsKtdmHoOlT8aFzJ+7heOxjfZ/RzAgdw5TddOB0aEZm6U7huJKzCUmPNBVQbSkAKtqovmc72H4RkLBufhF8P5yflhDSgfzmJWyLruB/a9EzUNXboMnd366RIuys+Jep0yBJ2lVis5b1mIlZgrTsWQrUyp3eqF28qe7RovYJpTw1CNzcY7WXUvuynM/jYiz7yOR5NcwkmYzOelDJgL/GyUn4134gaGMznQtvNS7CmIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzK88MeA/uqj/ZXUq63+ZbCDPrhoE12OA6Fun4TGYtM=;
 b=MNvdO7iBa4lo2jy5OaVKwmxsAGvL6AOyPpbBYZ1hD+g/rUcCJk95y5jKykIhebCPmPZq7UBJ/694hPeThCsx4CXB40EN20n6yg0RzU3WfoD78abgmEk71qOywJALBk9O5CdP39QaI3QQ/0E5ZZ4IX2FZIZ6nR9g7dcXOvNHKT9k12/TOI6m7OalWZldnbuACM3Y4g7JkSIugQ/5LhAi1Wn/Dz5pK7kOnQkmHwTXi9Fo8/rpby3tM1Izb+S86LGtZ+te2sYXmkKJXnYELK1BlYS6euaXS5Uypu8LFAgvtWDys9NAlyS3bY4FlqUza7tmP3Wfzb3tmUtRNYWOhqMpJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from CH3PR15MB6396.namprd15.prod.outlook.com (2603:10b6:610:1b7::6)
 by CO6PR15MB4226.namprd15.prod.outlook.com (2603:10b6:5:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 05:38:41 +0000
Received: from CH3PR15MB6396.namprd15.prod.outlook.com
 ([fe80::139b:8b25:6fbf:3e72]) by CH3PR15MB6396.namprd15.prod.outlook.com
 ([fe80::139b:8b25:6fbf:3e72%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 05:38:41 +0000
From: Jagpal Singh Gill <jagpalgill@meta.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Thread-Topic: TOF elections for 2026H1
Thread-Index: AQHciuR/6+Q2ymkGzkCqnmOWwvAAQLVfPzqA
Date: Fri, 23 Jan 2026 05:38:41 +0000
Message-ID: <083E4495-0C78-4B8C-B6C3-B717D722037D@meta.com>
References: <aXDmS4BmR6AGXKGW@heinlein>
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR15MB6396:EE_|CO6PR15MB4226:EE_
x-ms-office365-filtering-correlation-id: dbe6fd42-ef53-47e7-26eb-08de5a41aab8
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YStwZ3JMcTVOUm1pL04xc3B1Q3FPVm5MaTRIY1VaRUJqeEVnbFMxUWhaa1BV?=
 =?utf-8?B?ZDduS2ZRODNjSXhkNTBKR1hoQnlFZlBrRXFSdHB5Zllka3R0U0d1UzF5UGhJ?=
 =?utf-8?B?cUlBbWhUMEZ3cm9EbGVCOHZoU04vbXozeXdTSzZCVGtjbzFyaVpBeDNvWkFC?=
 =?utf-8?B?azY1VzRnRkZJSW92YlIyZnBGdFpMV3J4M0ZiS2hWeFowM3l0aFdaMlN1aDdH?=
 =?utf-8?B?aFh0MEw4SWdSU2dSSTBIQ0RBeGI0WHY2eWsrUGhpa1FqbUlscGE0cnBhN3R1?=
 =?utf-8?B?TFRJZmc1L3UvOWJsNmRDa0NoN0FIRTg1MTNHRThOL0JpUkdYcE9SM0tldEFZ?=
 =?utf-8?B?OFVncUozNmZJZUg3ekcveUVyLzcyV2ZIaFZpRGZnWS9kR1A1dnZELzRVZ1Zy?=
 =?utf-8?B?bkp1R3hMQjhsZW8rUmliT2ZCclRsK0ZUM3lmMEwva0trTTI4S1hGYm9mTmt5?=
 =?utf-8?B?RXk4V1N2QjJzai9kN2ppaXpGYjlkTGJHV2xSaGdoRFYvOTNIQlJ5N2xxVnE1?=
 =?utf-8?B?SFhSbE92UkdDd1RuY3AwVTF6dXFidk8rblpsRENxaThXdU02S1RtajBJQ1Va?=
 =?utf-8?B?TzBUb1pXdlc3K0RnUDJranhGeDJ6K2dCdm5lWERkdUUrdVNKbTZENmZhRE11?=
 =?utf-8?B?MlR6bElNcmhuZWVXUXdweVMyTkd4SU90QXFqdytjSTJMdE9WSDFuajc4Ry93?=
 =?utf-8?B?c0t5QVNwQkVmUFZYSW1WSC9XMnI5MTZCTDNnZDlMM0FWUlpVK3pMVVNpRHFp?=
 =?utf-8?B?bkhSTFMrV2xSTjlLZ05tcUZibE40V1FLREhtZ2xVVnZCU0ZDOHJkRlhBYURH?=
 =?utf-8?B?OWFNRGNtTEVyNjYzVnJJbXoyWXlIbGY4QUxCOEpJWDZSSXlnT0d3ODNmQlVZ?=
 =?utf-8?B?VHJFR3liV3pDWU44RG1xdWFuc1FlaTdybWMvK0huVEN1UDd3YmxOcHVYek43?=
 =?utf-8?B?cmY3Sm9SWTV5Mm5VTUV0Y1AvWjRqbkxFeXdzMFAwekhIREt1TlRXcGNXREJ2?=
 =?utf-8?B?M1Y3SGJtcTNXUWxrVi91MlRWV1ZnRDkrK2ZTQ2g3NER5L1JnQkZlYmR0bEZa?=
 =?utf-8?B?NkY3OUhlMW5ZaUF0d0FybjV5elh0TCtldlpUYWgxa0VzQU1EQmFmUEhURHg0?=
 =?utf-8?B?eUpQSjRKVGNlT0JqeTNXajRVVlhNOElZdVk5MEJ1VlViaDhzcFhucDVUV2ox?=
 =?utf-8?B?ZTRRSGlNSE9jbmIyRllLZnFlTUdwUk1IMFd4UXdMYW9KNE5GWVpzOVFGRUR6?=
 =?utf-8?B?TnJkSDFQVEFlOURNbXphUE9qTzl6dkZCamNqRURoUm9COTJqMjZGK3RkaW5V?=
 =?utf-8?B?aUpHRDM1bFBMMndwbSt3emdXZU9PVXRyS2tneUtRVURiWUJGZFZ0Um16dkVk?=
 =?utf-8?B?ZWxpTXU3emJzWVdpN2pZUVBocWMxOGE4VE4wTGEyRzg1ck1FT2lqVGdlOWdv?=
 =?utf-8?B?R3krTEN4UzR3MFZwZ2xHZVVuYVVFajRmdVFieVZtZ2xyWHArSHd0eXgybDc2?=
 =?utf-8?B?WTQ3QmZtQmE1NkFLdVY5dnExZExFZTVwdmJ1QVNseDQxRHFFdnllTk1pelAr?=
 =?utf-8?B?TGtjM2JWNDVBWFhodEhRMzkySklBR2NIZzl5MGN0TjJ6b1JLUXBWWEFWQmRo?=
 =?utf-8?B?YTZGSzVDQUFzUVJEdUpTMnNRY0JGeHNtNTMzdGwraGwrZDZ1QkQ2WVFHcjN5?=
 =?utf-8?B?eDhjRWI3R1M2OUFEaUtCbUQzUU5xOUdCaEhTcFhvc21jV0tUbXJoWUR2YWhI?=
 =?utf-8?B?bU83L2pTTWw4WFJBdmt2aFFaVExzSnRBOTRHVllrNy9weHNjVkZtOU1TYldG?=
 =?utf-8?B?T2JVTUdERDlwazU5RVJuMDBjUkp4Y0t3V0VVbWtWTzQycCtyZlMwMkpWSmYv?=
 =?utf-8?B?ZlhTbGVmcEtmZ2hhU2JYbStRaHFjZkhPZ2FqUHBKS0ltUWpXZGFEcUpuMFVV?=
 =?utf-8?B?dHQwMDZlcS94dEV1NWpsaW1yNHp2TlVLQzZUUys5cThaZ2cvSTZmelNRV1dT?=
 =?utf-8?B?dFVUbXlOSm9UWW1PakhRUjMzRnBzeGJuTnRuZTU5eFh4ajJqRjNTSksxWFB5?=
 =?utf-8?B?VVdqSkVPKy83a09FTjBYcVZiUlNLdWxlK0R2Y2FCdFc2NmdIUFp0UUVJMmFq?=
 =?utf-8?B?WG9lQ1J6bHFpVkZBKzEyUlNtSzZxd0tOTldqMXF5cjVBdGR0ZjVpdGRHb1Qx?=
 =?utf-8?Q?KJk3i514qmD1XjCE7rZ/LTg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR15MB6396.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkNnaEhpcFp1ZkpMVW1lRE5Hdk4zUENHUHV1Wm9DaExOOTE4bVpDMjlGWVVL?=
 =?utf-8?B?NFFOcVBPNUFqaEdlWElHUjFTdHhwV1lFSUhkWmF2YkZYVUhNNy9BMS95aVRE?=
 =?utf-8?B?MTNSeWM2WkNHV1JaMXFBaTMxaWNScUpTWDRJWXBBbzZMZ1lxQ0hOaTBvdCtT?=
 =?utf-8?B?RWpoSmxOSS9hR0ROSWNveWtSWCtVNjJLR2xkWkJUZmlFU2ljVmFCbXNpZVlM?=
 =?utf-8?B?R2hUc1NVNlNOYmVjOG5mYlJJQTJNKzFCb1cwL0RwekhzUkJzNXdYa3pMRCtv?=
 =?utf-8?B?cUNnWDRmNEtHQXJ2UGVyVEZvOW1CNTV0M2g5am1oMno3SkVncTRmcmxVUmhu?=
 =?utf-8?B?TGcwbkNKMEVXM2pGZlNHaWp4emtLVFgya2oyTjd0YjNrdWlSWGxic3VUNTg1?=
 =?utf-8?B?NDRVUjdHUVdGOHg5UzBTanA1ZmI0RGN2c0ZRMW02aC9EYXBMT1drME5VczB1?=
 =?utf-8?B?bnJya2lma1pUd3liQUJhRS8vKytBVzdRbldNazNadGVZaVl0bXk1TzZCS2d0?=
 =?utf-8?B?WlJScDJmSEpQSDZFUVJNaTJTaTdGOW8zNEJONTJtNVhFVW9vdENiT3lDc2R5?=
 =?utf-8?B?emkrdG5KRWw1UFBxWk8rZi9XTk5EOXc3emw4a1BKZGdiZU55MUJrTmpPMlZ5?=
 =?utf-8?B?Nm03Uy9ITHdEVndPVXFISHNXUDlJaWVJTUxsMkN0YjRUalJwbCt1QXU2NVdN?=
 =?utf-8?B?REZ5eEl2blZ5UUJZMHJOSG50UTl0UmRTRW1CSlZuMHV5Z3VxWExNVXJPOWtv?=
 =?utf-8?B?NzBoSHlBRW9HaUExVXlIMjJETVFlZUIwdmZYUkNHV3c0ek5MSVlsTTBJY2cx?=
 =?utf-8?B?NVBZY29NM1FTUndHajhXUFhnbGV6YUl6b1hCay9lUFRHblorNUlsSTBzcGJy?=
 =?utf-8?B?ZFFCdXFHWHpxLzF4dlYrMG9vejZFU3JZekFFNVNLUlJQNWFaWHBTOEhPZWg4?=
 =?utf-8?B?WGRJblVOOTR3ZTRZZ0c1bUdLUjlaZXIzNEJ1Q1lGY2VlU2dROG5tQjBRS3Vq?=
 =?utf-8?B?b3hETUx4UUhtMUdaYk1OeUYrKzdyNlhpa1g0V0lHOEtURjJCMEJjM0NMTk9O?=
 =?utf-8?B?ZktpcFQwRTN5REQxTVBUSlh3MFdSSXE1aGxSVWJ1UjRLY3hLV0s4ZjBJelZG?=
 =?utf-8?B?S2ZTeWpGU21xM29RRnI0SjZkUDU3OGpMUHc1OHpRS0hJdjZSMzRnNi8zUDFW?=
 =?utf-8?B?ak5EUEZSNHZWUU10bWI3WkVHUTQyb2tnaUdxczhtakpEaVcxMHF1ZmtDQ25w?=
 =?utf-8?B?cmkyVTdHRFpFZDIrUFF0ZmlrUXFJaDUvZGl1dkdjb2YvckxNS2pBdlpPT0lN?=
 =?utf-8?B?dlpYOEpUK21QVzNDaTZjeS90V3RuVXVKaVQ3QnlBN0k5dldoTXdoeVZ2ZERk?=
 =?utf-8?B?QU93Zk5ONEwzbkxXa0JwbVdEWk9zd3g1Q3g3TXBjWVhZbkVrMmE4UUV5d3Nq?=
 =?utf-8?B?RE1Wb3NwRUVqRzZvZHg3eFg5RmxMOG15eFJNSVd4Z212ZEE3ZlZSV2VkeUM3?=
 =?utf-8?B?OVRvWm1JMGNHb0U3c2RTTUlLMGNPUFlIQml6MGsyM3RzSktJekwwRTA2ZGhn?=
 =?utf-8?B?TU1JU241ZDc2ck4vQ1FwMnZ3aUtFWXhZNzRjcTdsVEE2czZiQzZSandyc2dR?=
 =?utf-8?B?alBKQkpqTldReWdNS1VTMEkvRVhHK1B0a05QeWswYVJ2N0owY2pJNzF3T09F?=
 =?utf-8?B?clVQeXpHZEZoUncxZzlLS0JpbGt5STY3UUJKMTJoTDNjOURZUDNpWG5pdHgw?=
 =?utf-8?B?Q2NmNTlud05DcDV5b3NOUlZIc0xTVm93WjkrL3dXVUU2NjEyaVZEZElvSzRG?=
 =?utf-8?B?dGs3SGY2Q2hwTFVYN3Y4b2FSeVZMOXFvVC95b1MwUDRaUXRoR0VXTFdBcjJq?=
 =?utf-8?B?Z05oREpiSG5oZkZoVWhkQlQ0QjVuUUFOQlR5OHVRd1lucUdET2NwMGtpSitm?=
 =?utf-8?B?QnBjeG9UTW5aRE84ZUFJMjFjd1R3dDJ2b3RMQWQvaUQzSytNM05QMDFFTFd1?=
 =?utf-8?B?bWk2eXJWYlVsRHZ3dzBtRDhGU3QxUFUvQXRETVJ6czdlaVRhSnJJVnNQLytp?=
 =?utf-8?B?RzZqWXdqQWFrS3lvQTB2MjByYjVyaDNIeGpzM2ZLSzJ1Y2Q3R1VtRW9ENjZ1?=
 =?utf-8?B?dk5rOU44QjRNRGlpRUQwS0hhb09SWEhKQXRNanBqQ0x3WVh2SWczUFRVeUpu?=
 =?utf-8?B?c3Z3MVVDV3hvZFY5OGJNK3JoaHJ0aC9yYUJiRFRPNWZJQjU2QThrNTRPNDFX?=
 =?utf-8?B?VUNlM1ZQUmJVWDZJTTdzV1VVRHZtTGtEdk5FRlArVVRUcDdsQWhPSVJING5E?=
 =?utf-8?B?RDQzT28rN2RJK1VmYTFxR1hZRWtoN3VubTliZ0gxQnk0TWwzREtJNXJ1c2xt?=
 =?utf-8?Q?BTcJOFx2QTkSpSamckgquI7ILV7gZHVBeFfJaN42roEkv?=
x-ms-exchange-antispam-messagedata-1: FklWOQ8f6mTFdQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <053DB909E64556459763D434C2FCCDE5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR15MB6396.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe6fd42-ef53-47e7-26eb-08de5a41aab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 05:38:41.6729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86D0vuS3kSG+4GiLbvcD0vM95NdzIJC4OMZjLpoHHCgIYIfsOR5sEm25d9bpuAGwrtxz9sQl+ANwFAho9TjnCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR15MB4226
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0MCBTYWx0ZWRfXx5J24MN5+XmU
 fhUntC9y59wwU6FjvgFd6cu0C1wpJqk7JWDY+56myxQZxducPmv58uf1osmQaE2546SQSNhnWG+
 KN2cIitGkMDqLYmKR+YMnuyW6InS+KXy3LTqbDgR+K4hLW4wpypz6HtNc1d8M5p0dQl72ug/yof
 1tFUVNH5ejc8Yve4zRSl7SGH0sZjnIY7QKqFQXhL4Ydx3UysbI5oYJMlNLaVXdsBO+BzCA0hwKQ
 Xqlv6WMS/HgXI5v62ESYHLgnR3uAW+goczfB7Wil2Xn1GcAA3IJEz3+qHHxLYi/6m8BJpakJoE5
 Q8Gf32zj276TabMgPwsn93xHRj0seqe27cus8b1+PIn8zF+YKMqafrML8PAnnZTHzgIdYTwbgvL
 gvhIHrc3aR6WfYe0k1xcnaI5S9Yec163aZhqhdIkU/FbtqTLEgjyTDj8Yh5UQFWyfihLgUMc+Ow
 QQj7NYG3N0HZWcQO2NA==
X-Proofpoint-GUID: BAdrniTxng-ZA18dn0DwSuhyQG6cRgjM
X-Authority-Analysis: v=2.4 cv=KPFXzVFo c=1 sm=1 tr=0 ts=69730963 cx=c_pps
 a=F9MFHRSrL/QBKEkL9+MzCA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=2VGnaFk_AAAA:8
 a=C7Xc0mtc_V5xQub3elMA:9 a=QEXdDO2ut3YA:10 a=xuWaqJMTYXf3QM4Ho2sr:22
X-Proofpoint-ORIG-GUID: BAdrniTxng-ZA18dn0DwSuhyQG6cRgjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.10 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-1272-lists,openbmc=lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick@stwcx.xyz,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jagpalgill@meta.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagpalgill@meta.com,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: B6D1A70890
X-Rspamd-Action: no action

SSByZS1ub21pbmF0ZSBteXNlbGYuDQoNClJlZ2FyZHMNCkphZ3BhbCBTIEdpbGwNCg0KPiBPbiBK
YW4gMjEsIDIwMjYsIGF0IDg6MTTigK9QTSwgUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdj
eC54eXo+IHdyb3RlOg0KPiANCj4gSGVsbG8sDQo+IA0KPiBJdCBpcyB0aW1lIGFnYWluIGZvciBU
T0YgZWxlY3Rpb25zLiAgVGhlIGN1cnJlbnQgcm9sbC1jYWxsIGlzIGF2YWlsYWJsZQ0KPiBhdDoN
Cj4gICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvdG9mLWVsZWN0aW9uL3RyZWUvbWFpbi8y
MDI2SDEvcm9sbGNhbGwuanNvbg0KPiANCj4gRm9yIHRoaXMgaGFsZiwgd2UgaGF2ZSA0IHNlYXRz
IHVwIGZvciBlbGVjdGlvbi4gIEN1cnJlbnRseSB0aG9zZSBhcmUNCj4gaGVsZCBieSBBbmRyZXcg
SmVmZmVyeSwgUGF0cmljayBXaWxsaWFtcywgSmFncGFsIEdpbGwgYW5kIEpheWFudGggT3RoYXlv
dGguDQo+IEFsbCA0IGFyZSBlbGlnaWJsZSBmb3IgcmUtbm9taW5hdGlvbiAvIHJlLWVsZWN0aW9u
Lg0KPiANCj4gTm9taW5hdGlvbnMgZm9yIHRob3NlIDQgc2VhdHMgbWF5IGJlIHNlbnQgdG8gdGhl
IG1haWxpbmcgbGlzdCBieQ0KPiByZXBseWluZyB0byB0aGlzIGVtYWlsLiAgT25seSB0aG9zZSBl
bGlnaWJsZSB0byB2b3RlIG1heSBub21pbmF0ZSBvciBiZQ0KPiBub21pbmF0ZWQuDQo+IA0KPiBO
b21pbmF0aW9ucyBhcmUgZHVlIGJ5IFN1bmRheSBGZWIgMTUsIDIwMjYuICBUaGUgZWxlY3Rpb24s
IGlmDQo+IHJlcXVpcmVkLCB3aWxsIGJlIGhlbGQgYmVnaW5uaW5nIE1hcmNoIDFzdCB3aXRoIG1v
cmUgZGV0YWlscyB0byBmb2xsb3cuDQo+IA0KPiBBcyB1c3VhbCwgZGlzYWdyZWVtZW50cyB3aXRo
IHRoZSByb2xsY2FsbCByZXN1bHRzIGNhbiBiZSByYWlzZWQgdG8gdGhlDQo+IFRPRi4NCj4gDQo+
IC0tIA0KPiBQYXRyaWNrIFdpbGxpYW1zDQoNCg==

