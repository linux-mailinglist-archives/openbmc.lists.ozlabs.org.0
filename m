Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13464A77108
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 00:47:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRR8w3Kf9z3dRT
	for <lists+openbmc@lfdr.de>; Tue,  1 Apr 2025 09:47:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200e::628" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743432249;
	cv=pass; b=Yz6/E/W/Xkq7XqxD5OcY319MN67vKYUeHOAr7MMCKlzr0vYGAGMB0BWsVBzESbgkAuOc4sSRXQOxiRFFa1GUP6LfV8Nj1vfkoEbLCjZy2OcTBNFyjpxI4MRzq/ixWV/1KVId+UoGtAqjks8I4cr/1mpZyQDbkx/ywnXEctEottceyyERuqpwUnU1REfO7QHwEkk6CklzINI1TqT0QcxsNi2wQCa8/w5RXuHwsdz7PjImG1knUrkZ7NdsYjdYF/8aJRqGUI3Z+FoGG4sGP5KSS5rP6igaqjZaevjkCfJtiLzuyScLUGohHSd6+Tc89jTxlPWFbVHskg465Ar0lS17Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743432249; c=relaxed/relaxed;
	bh=ARLiPEPpv44bXUNrIZ33rBpr74wQCStcmUWkVosrGDg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PnnDKHJdQBfr7S30K57uhIcu7MXWVVzruwVI2o59MNrBAHWttsvZXagE4VjfNzVBJ0sEn90SP920G+fLB2sp143kB/FfjJu1X+agMWzZ8fPafzSN9oVcHPDADiu3hEZ+MqlVwgk91TxzlbU5CXMias+iDa2UGWi7NB3OkGIFsP/nvNvMIglmoTBVZzgqFI9PGPRSkzTn32Pmd7fRnfBbmf7cp1R9f3gZpiwVYXpjZyFlYehOI6qBIjtIHtvwm39fO52w9c8USYPEm6Xe1vmAMbKQ+HTCEGRIJzfQ4j3V/0y58fq3CsYntC3UmD6GVEbmDQxSU9yen46HJ/S4OkekQg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ingrasys.com; dkim=pass (2048-bit key; unprotected) header.d=ingrasys.com header.i=@ingrasys.com header.a=rsa-sha256 header.s=selector1 header.b=RAM1FiQB; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200e::628; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=alexwu@ingrasys.com; receiver=lists.ozlabs.org) smtp.mailfrom=ingrasys.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ingrasys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ingrasys.com header.i=@ingrasys.com header.a=rsa-sha256 header.s=selector1 header.b=RAM1FiQB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ingrasys.com (client-ip=2a01:111:f403:200e::628; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=alexwu@ingrasys.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f403:200e::628])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRDRC6T7Tz2ykX
	for <openbmc@lists.ozlabs.org>; Tue,  1 Apr 2025 01:44:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8N/xno5RxTbi37piMgvvuaF0h5N2Rlue4Nrj4s5CpTLp53fMu7SxnVE0VMSVTAcj50dfCOmrILZ47MSKDtMc2ZPZregAZmmWK/RxYabJSQl+LZmYoO1jmF8/K5GsneAEf0HCe8BROCePfgPfY3O4c8SAJ256s9Q55bD63mGFJVXMCR96D9gxRbins3AMIHXbsQj0stcYjXwmWIo9gawn3bCDIvEcxWbMFPB0QeMsQbbuvcOEcYGjgizbKaQlgqoGrJmms2zZbkk0aCrHo3soA6wIMhq192yiPJ7GCoD8D9PsWvdPM/GQsBbzaR67VB4q/4wJB95Me42/xsUcbKM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARLiPEPpv44bXUNrIZ33rBpr74wQCStcmUWkVosrGDg=;
 b=gdiagqmicFZD+WABycTnYUhdaKKj1AYw2eaWneC0kMJR24U1pxUEZH5/ckpflkQuBcPmxDO+KdWlIm5O8EYDZwrjNkFnl/bpPZvtRhUcZx1mGyrO3mUEVXOA4p4aCLMMaWz9/nlFfzO2ZxE+ZBFCaX7kXpRwK8Xkmp5dVjwBLVJrvcy1D5XeIPRm5cGgCYeaZMnBgP132q+8wFYLiIKy9ck9ddt7/Qvc49cwvPRbnVe9M4fEGcPVu7HCQjPFOzUWimA+/hVHndpZt6ZIhEVmEBQl/yN5tKHnH/YTi/2b/iESdeThcaD2S923JK2ASIlcJq7EvfFYf4y/gNQt5euafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ingrasys.com; dmarc=pass action=none header.from=ingrasys.com;
 dkim=pass header.d=ingrasys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ingrasys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARLiPEPpv44bXUNrIZ33rBpr74wQCStcmUWkVosrGDg=;
 b=RAM1FiQBP9UOEYeszFsEkOX5kjrFMuXu/MkScTRukgNSo5bBEwZCN+w9C9kkaMqIDAd9QGS9E4/kKEPe+ZdA5Ah3ZUK8+gz2cWQU40zMbGt1yQoTcT4m0bxaPsZPwK5dcdz6YybTfnCkgzKL9nS/7CyWn4M9bw/R7KQz3qOduFCfqr91lOfpe6lb3NF7rtRI4tivCoYkD1owapB4zPp/EHAlanpf82BMxcK30oTbWoThy9JAYxWoHOcj2DB2tmO5pzZ8HFDlCL+8CZ06EuytgppU7TxJRXN4b8Nh0nMI5SAf/o4qyLztqH54AmMUBHYQkpRBArS5dyUZiu/80ULLhQ==
Received: from SEZPR04MB8045.apcprd04.prod.outlook.com (2603:1096:101:22d::5)
 by SEYPR04MB7362.apcprd04.prod.outlook.com (2603:1096:101:1a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.33; Mon, 31 Mar
 2025 14:43:43 +0000
Received: from SEZPR04MB8045.apcprd04.prod.outlook.com
 ([fe80::d0e:8fdf:a515:8b8a]) by SEZPR04MB8045.apcprd04.prod.outlook.com
 ([fe80::d0e:8fdf:a515:8b8a%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 14:43:42 +0000
From: =?utf-8?B?QWxleCBXdSjlkLPmlL/pjLMp?= <alexwu@ingrasys.com>
To: Mike Dolan <manager@lfprojects.org>, Andrew Geissler <andrewg@us.ibm.com>
Subject: Re: CCLA for Meta Clemente project
Thread-Topic: CCLA for Meta Clemente project
Thread-Index: AQHboi1y213JRnwtg0Co+fwBJv/yr7ONULCAgAABD3s=
Date: Mon, 31 Mar 2025 14:43:42 +0000
Message-ID:  <SEZPR04MB80455B0E70D9399F4971DB00ADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
References:  <SEZPR04MB80456EE06D62AF894C92D7ECADAD2@SEZPR04MB8045.apcprd04.prod.outlook.com>
 <CALVHhec+VRqf7zHvfr3AP-qCbfs_4QyH_aQXHd05f9DGg9Z6Tw@mail.gmail.com>
In-Reply-To:  <CALVHhec+VRqf7zHvfr3AP-qCbfs_4QyH_aQXHd05f9DGg9Z6Tw@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ingrasys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR04MB8045:EE_|SEYPR04MB7362:EE_
x-ms-office365-filtering-correlation-id: daeaa7b1-a84b-4736-e27f-08dd70626eeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|8096899003|7053199007;
x-microsoft-antispam-message-info:  =?utf-8?B?NU9Xam01V3BGMXF5bXVwTFBKVHBtMllhL25mM2FOQ28xcUdIQ2xXeUp4b25D?=
 =?utf-8?B?UkhCN0RZVklhUFFYRlJGd21Ha1ZwS21zVHc5RHc1T3lNVzFldlNjbDhVNUg2?=
 =?utf-8?B?cno3aXh3V05XeERnQW9CWVRDTGxacUdkZDlBeU9qOWJYWDMxcW1RMmkvWmh2?=
 =?utf-8?B?QnZGaEZ2aXdBOU82NSt1Mmx3RXZWNGRRaWtIYVNlSnlweUZzVUNPRG1WZ0Qx?=
 =?utf-8?B?Z2FqMzljQ0hQRXZueWwyYlNPMjB4TWNLeG1XYW1YYVRkNjJMQWsrVXgyd1pI?=
 =?utf-8?B?VW9tTTRPR2ZTcTZmUklzY3FBelVQUGhERUhjdml0a2VIUG1USU5wZ2R0VUJ6?=
 =?utf-8?B?M212Y21RRzVlTm9YT2ZweVFKQ0ZiTE5wd1c4emJBMEpkeFdDZWF4eGlIWlZs?=
 =?utf-8?B?UmwrMUY4SzNyckR2VWt4bTNidFJ1czBNcTV3eElzOUZ1THZJRWZ2RHIvSVRq?=
 =?utf-8?B?clhxQ3NPRWUzT3NPbGdmNWhYak5WVnFFaTlZdnBLckZiS3hCU1RMNjFZNTNF?=
 =?utf-8?B?QnNXV0hYQ2NjUXFGTlNYeEUvblFOZ3FFWkZadmVnVG1rcWFGV1B4akpmWlJw?=
 =?utf-8?B?bE1NTzFLbG5SUWxaZUFFcmpwWW8wakM5SFc0SnA3ZmZ4eDdzMTdiaUVrcm5R?=
 =?utf-8?B?RTA4NitRMERvV2l0dTdjZFEvNEYzL3owbGFRNTJST1c0SStlNmwzUHY0SDNT?=
 =?utf-8?B?OHhJcllhdHNHcStabHpSU05reGZ3YlhkeEZQaUtZYmFtN3EyRm1RMWhkZE50?=
 =?utf-8?B?SzlyaHZkSjlwK1VxSU9qZ0lHZkd3ckR2ZDBidGU0WGVwckxQSFczaUtMekd6?=
 =?utf-8?B?RzdiYWFzVEhHMXl0dkdDc3lLQ25mUHJvY1R1dkVZWDhkNEcwMkwvN0x3c1g1?=
 =?utf-8?B?VVZJeGd2TjlsOURSMndIajhBaTRqTGNOUW13SkliaGZWK1dweGpPaWFkeUZC?=
 =?utf-8?B?K1dKekdlamJkelhlYWpRL1lxM0JjbWJCZDVMdXpwSlZJZWRldEh5dXUwc0NC?=
 =?utf-8?B?ZytvaUVnWlBRTmNXRGRhZkNrWGRCbjNkV0FGL0FFd1hFUjFMZE80VUM3b29L?=
 =?utf-8?B?UDRaZWxGL3FkVHgrWG10K2d2Ylg4M0x0Rk12VDZqeUZtVnZRcG9pb1hUdDRN?=
 =?utf-8?B?d2NSK0l6NFRRbUpDZVN0eWNaTEh6ZThlcWphaVBvbnpiRTBCREpNR1BZaFNZ?=
 =?utf-8?B?cTJHLzRNaDNFb1NmNFh0eE5nWmFvMytmYWNZRUdQOGN2ejE4OUlueVFwNDZz?=
 =?utf-8?B?NEJRcW5QcEtDVU9JYmRYZmVXSXdHWlNHcFZFdFRjZ0pjMHFtOXM1UWRpNkFw?=
 =?utf-8?B?bWlqMFFaS2szRGpSUVJtL3g0c3FYN05WWTRLWW91NHVkTlBKWS9BY1JVdlhT?=
 =?utf-8?B?WG5KNFVCVjZJUWJlWmtlUXpST29QU0YzYUlEWjNHN3M3cHQ3QjNkTm1kNHFO?=
 =?utf-8?B?K1pjTWdieEpaT1NZeUZqNVJzSkkvNGpmUXdXVUNtamVGMkNRZnR4bFNkVUdz?=
 =?utf-8?B?SXVkblJjZjl2a3Z4VzFxRTNDazJJQWZxb2V0WTZONWxiZ2xrclNNS3o1bG96?=
 =?utf-8?B?eGV6OXhUU0Z0NDUyL1ZPQ0pZYXk3VXAwK1locmxQT3BobUpuaEhnZlZQU2pL?=
 =?utf-8?B?eTlDMllnallWbjJuWDd2Tk9INDA1Y29rVXBnV3VrZlpBbW5oUFU4WDd0aWRH?=
 =?utf-8?B?RnU3dG1KbmRpMnFOQXJKMWc3UDNOQjRnaXdBVHBlZ1dQUTU5YmZaR1lWd013?=
 =?utf-8?B?QkNjOXM1Z3NISytjNkpuQ0M5dU50MXZqbmduQmlvYzVjdDRoYVpiZEdlUTFH?=
 =?utf-8?B?eVVRdVRPRlNUV0JYeDJVTHhPK0dpeWZNTmVsL1J4NnRqcmczeEdWNVVNWnpL?=
 =?utf-8?B?UUI0M3dZSkliSWZESWVRWVZnaFhhelJkV3FDeE1nRFU3N2xnMDVEcytEWmgw?=
 =?utf-8?Q?AJZ3bFx+p79RHUYSMYRus4yld4EBIv96?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR04MB8045.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M0sxYmNOZUkvM2FGNUEyeTlaNGFHT1JDcVg4Wjk3WWtXSlZzYUcvdnlEb2hv?=
 =?utf-8?B?MDdTdGtjV2YwU0lnOXVoUWNaeDNlWmxFNm4vQ0Z3Ry93VXltUE5sc2dtU0FU?=
 =?utf-8?B?SUZQRE5PdTlLUVJRdENGelBxYWpHUkFMbGZvNGRyUk54ZUQ5YWRZeGc5VWhD?=
 =?utf-8?B?a0JxbkVPWmpILy95S1NwTDh3a2RRTW1XRklqblBnYmRwWTArOEZ0YXZJaDl5?=
 =?utf-8?B?QXViQ1RqV0dzNUJ5Yy9PcjZSeVNqZW5wMzMvU0RvdnJwY0c4QWplQzRvczNC?=
 =?utf-8?B?cmVrREE5eEw4VHVpVm43V1prcmFuOTVacUJtK2tWaXlxNjNYUjdhRHZSRWI5?=
 =?utf-8?B?Y1gzV0s5cFlIUnQ2NDBwdVRKVm84U3FvQWpXa090eTdFS3AvS25UTmNtMXRF?=
 =?utf-8?B?c3Jzb295MkFQR2h4TWRTbXhSNllLZyt0Q2ZoY1djbWhYV2VHMTdRQ2pRS1lp?=
 =?utf-8?B?ME1DeU1VVGQ2K1M5bHVzTWV4RkJHejA1K2JtVmVZYUtyb3VKT2hWY1RWSEdt?=
 =?utf-8?B?TmxjNzZLcjZxekxWL1k3TEtlTktsb3JZUmxDbWI5TnpoT05xdjlCMWVXN1Z1?=
 =?utf-8?B?ZEdubXR2WE9GN0poZGlYbDRQUEZQekF4TzZnd0F3UXRYQkdmZHE5VjlYemp3?=
 =?utf-8?B?Wm44OGorSGFzU3g1YjB3cC9kUi9CdE5OTEpaOFIrS29ickwzR0xtR2NSbHVo?=
 =?utf-8?B?NnFpKytpV3F0WDNlNklCSGJpZVVzckFtNE9rSEtuSEdreXY0T0xMSjJWU1Ay?=
 =?utf-8?B?eWptV3JzRW9sTVBNNHpNWFNUN1pqcGVDeDRzY1MydmgxS29mVFZzd09pVmpJ?=
 =?utf-8?B?VjFGekFEUlo4dml3d3hHZSthQ04vL1Rqd1FLWGdTTnM5Y0NQdTN1ZmNVdnQw?=
 =?utf-8?B?YVpJQXA2RVlkdlBDZnRBSzRjSExreGtsUXBobUphbWpuS0VmZ0pkMnU0L0JB?=
 =?utf-8?B?b2VPeEE4S2FXMkpGd3E3dHYwSTl5OW1VTnE1Zlh4cDM5c3JHUk9tamtIa2Vh?=
 =?utf-8?B?TWJnMUJlbjUrR3FSdUlqRFBYZzlNaHlXaTlYU0pzdUNDTmNqdUI0ZFJyeFpk?=
 =?utf-8?B?Witkd0FvRS9Tc1NNU210elkrRE1mWTFzZmZRcE9JY1BnUVFCa28xdVNRalpC?=
 =?utf-8?B?Z1hRSEFsWlpDY3J0M0ovMThBMFYyN3pacUJucW03N0RaSHkxUXk0S0NoOVhw?=
 =?utf-8?B?U0ZXU0hXdFh2QWp4TkJCd09RT2d6NWZaaURTL0haUmdWOEFMdmJkTGVwYnpQ?=
 =?utf-8?B?NStBeDNXU29sU3dCeU9mVFRZUWVKTGRrclYzQnp4OEY0VEVuOThlaEdmZm5N?=
 =?utf-8?B?UDg5UXptdGpvWjM5OXM4dVhUYnZGcU5LcWhkOW9IdGd2ekhYZm11SUJ3R1lU?=
 =?utf-8?B?ZzdGeEdBZURCQndpSDBJNnhDVGowSnBiZlNFS2VnZ3Flb1cwNWwzbCtzYjU0?=
 =?utf-8?B?Vm5KL1oyckUwZHNmbnRNNmZVcjZXekFtVUNLdG1scjZhamdDaTk4V1NoNmNS?=
 =?utf-8?B?aUJ5UmFyWmV5T2JKOWdzbHlmSDl4TUVacE1RZ0EvVnJXWTVFVTBwRXllVEUv?=
 =?utf-8?B?TXpkMGJVR3E5UGZTd0dGeEVnUXhHZUk3WGQwOGl0SU94T1dSL29CSWtxaDFm?=
 =?utf-8?B?TWxyaVM5RzFUUWMyc0tkRFQ0OXduRXRJaEFHcmdWVStrak9EeUd5OU5DNVRv?=
 =?utf-8?B?THpOUjlSQ0xmNTdOZ3NmNHI3QnQrN2ZGZU0wOU9ndDc3T1FMU21KT2h0REts?=
 =?utf-8?B?RXdNWGdyek8vYmtLTUlYQmE1dFJlc1RYOTdneUYybUZ6T0VrR0xkcXVwNjUx?=
 =?utf-8?B?LzhBRGFlb1FQSHFCdVlGRjdMdTlWQktLM1QzSEE3dG5RZUVWVnp4bXozV0FU?=
 =?utf-8?B?ZllvVWE3M04vTmRkbGw5SWZzd0dWYUtyUmhhai91NTZSelJmUUZ5dk1rN3F0?=
 =?utf-8?B?SDl5Z3lPNGkwVVRKSEE0RjhkMXVNSGRCem1RUjZpY0NtUHByTG1VYmZPczVw?=
 =?utf-8?B?YlBJeU4xWU1yQzlld0tYcndaWjA5NDV0RHdJV3Y4WHRGdURmVFZuYUNJYWds?=
 =?utf-8?B?TzJTSGRzVXlpTlhwYkZlQWVkWlYxUW9RK3l1elIyM3lyd1dvSjZtV001ZGpv?=
 =?utf-8?Q?EEQEvMvnp2LVHWsfRpnjKMwF9?=
Content-Type: multipart/alternative;
	boundary="_000_SEZPR04MB80455B0E70D9399F4971DB00ADAD2SEZPR04MB8045apcp_"
MIME-Version: 1.0
X-OriginatorOrg: ingrasys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR04MB8045.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daeaa7b1-a84b-4736-e27f-08dd70626eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 14:43:42.6465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 606190be-ff89-439c-b3a7-504fcdff4ffa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyppPb+57V2YMIRaTLHTA05RfKVCw6pwQNYAgSLs1Xdq7SWnZXo89TP+otui/TqV0dttDYNg3WuJsUptNyVvag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7362
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Apr 2025 09:46:50 +1100
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SEZPR04MB80455B0E70D9399F4971DB00ADAD2SEZPR04MB8045apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWlrZSwNCg0KWWVzLg0KSXQgaXMgb3VyIHRhcmdldCB0byBrZWVwIGluIGZyb250IHdpdGgg
T3BlbiBCTUMuDQoNClRoYW5rcywNCkFsZXggV3UNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCkZyb206IE1pa2UgRG9sYW4gPG1hbmFnZXJAbGZwcm9qZWN0cy5vcmc+DQpTZW50
OiBNb25kYXksIE1hcmNoIDMxLCAyMDI1IDEwOjM4IFBNDQpUbzogQWxleCBXdSjlkLPmlL/pjLMp
IDxhbGV4d3VAaW5ncmFzeXMuY29tPjsgQW5kcmV3IEdlaXNzbGVyIDxhbmRyZXdnQHVzLmlibS5j
b20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+DQpTdWJqZWN0OiBSZTogQ0NMQSBmb3IgTWV0YSBDbGVtZW50ZSBwcm9qZWN0DQoNCkhpIEFs
ZXgsIHdlIGRvbid0IGhhdmUgYSBNZXRhIENsZW1lbnRlIHByb2plY3QgYnV0IHRoaXMgQ0NMQSBp
cyBmb3IgT3BlbkJNQy4gRGlkIHlvdSBpbnRlbmQgdG8gc3VibWl0IHRoaXMgZm9yIE9wZW5CTUM/
DQoNCk9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0IDc6MTjigK9BTSBBbGV4IFd1KOWQs+aUv+mMsykg
PGFsZXh3dUBpbmdyYXN5cy5jb208bWFpbHRvOmFsZXh3dUBpbmdyYXN5cy5jb20+PiB3cm90ZToN
CkhpLA0KDQpIZXJlIGlzIHRoZSBDQ0xBIHBhcGVyIGZvciBNZXRhIENsZW1lbnRlIHByb2plY3Qu
DQoNClJlZ2FyZHMsDQpBbGV4IFd1DQoNClNlbmlvciBEaXJlY3Rvcg0KSW5ncmFzeXMgVGVjaG5v
bG9neSBJbmMuDQpGb3hjb25uIHwgQ2xvdWQgRW50ZXJwcmlzZSBTb2x1dGlvbiBCdXNpbmVzcyBH
cm91cA0KT2ZmaWNlOiAgICs4ODYtMi0yMjY4LTM0NjYgZXh0LiA1MDEwLTE1NjEwDQpNb2JpbGU6
ICs4ODYgOTcyIDc4MSA4MjUNCg==

--_000_SEZPR04MB80455B0E70D9399F4971DB00ADAD2SEZPR04MB8045apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIaSBNaWtlLDwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0K
PGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClll
cy48L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6
IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmks
IEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+DQpJdCBpcyBvdXIgdGFyZ2V0IHRvIGtlZXAgaW4gZnJvbnQgd2l0aCBPcGVuIEJNQy48
L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZh
bWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2Fs
aWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0
eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250
U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NClRoYW5rcyw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1l
bnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpBbGV4IFd1PC9kaXY+DQo8ZGl2
IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3Nf
RW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0K
PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6IGlubGluZS1ibG9jazsgd2lkdGg6IDk4JTsiPg0K
PGRpdiBkaXI9Imx0ciIgaWQ9ImRpdlJwbHlGd2RNc2ciPjxzcGFuIHN0eWxlPSJmb250LWZhbWls
eTogQ2FsaWJyaSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMXB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+PGI+RnJvbTo8L2I+Jm5ic3A7TWlrZSBEb2xhbiAmbHQ7bWFuYWdlckBsZnByb2plY3Rz
Lm9yZyZndDs8YnI+DQo8Yj5TZW50OjwvYj4mbmJzcDtNb25kYXksIE1hcmNoIDMxLCAyMDI1IDEw
OjM4IFBNPGJyPg0KPGI+VG86PC9iPiZuYnNwO0FsZXggV3Uo5ZCz5pS/6YyzKSAmbHQ7YWxleHd1
QGluZ3Jhc3lzLmNvbSZndDs7IEFuZHJldyBHZWlzc2xlciAmbHQ7YW5kcmV3Z0B1cy5pYm0uY29t
Jmd0Ozxicj4NCjxiPkNjOjwvYj4mbmJzcDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgJmx0O29w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4mbmJzcDtSZTog
Q0NMQSBmb3IgTWV0YSBDbGVtZW50ZSBwcm9qZWN0PC9zcGFuPg0KPGRpdj4mbmJzcDs8L2Rpdj4N
CjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7Ij5IaSBBbGV4LCB3ZSBkb24ndCBo
YXZlIGEgTWV0YSBDbGVtZW50ZSBwcm9qZWN0IGJ1dCB0aGlzIENDTEEgaXMgZm9yIE9wZW5CTUMu
IERpZCB5b3UgaW50ZW5kIHRvIHN1Ym1pdCB0aGlzIGZvciBPcGVuQk1DPzwvZGl2Pg0KPGRpdj48
YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyI+T24gTW9uLCBNYXIgMzEs
IDIwMjUgYXQgNzoxOOKAr0FNIEFsZXggV3Uo5ZCz5pS/6YyzKSAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmFsZXh3dUBpbmdyYXN5cy5jb20iIGlkPSJPV0FhN2Q4NjRkZi0xOTRkLWZhOWEtYzk5OS03NjY0
YTU3ODdlM2MiIGNsYXNzPSJPV0FBdXRvTGluayI+YWxleHd1QGluZ3Jhc3lzLmNvbTwvYT4mZ3Q7
IHdyb3RlOjwvZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjogMHB4IDBweCAwcHggMC44
ZXg7IHBhZGRpbmctbGVmdDogMWV4OyBib3JkZXItbGVmdDogMXB4IHNvbGlkIHJnYigyMDQsIDIw
NCwgMjA0KTsiPg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBBcHRv
cywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KSGksPC9kaXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IEFw
dG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCkhlcmUgaXMgdGhlIENDTEEgcGFwZXIgZm9yIE1ldGEgQ2xlbWVudGUgcHJvamVj
dC48L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZhbWlseTogQXB0b3Ms
IEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4N
Cjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBsdHI7IGZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiPg0KUmVnYXJkcyw8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZh
bWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2Fs
aWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4NCkFsZXggV3U8L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBm
b250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vydmlj
ZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZGlyZWN0aW9uOiBs
dHI7IGZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KU2VuaW9yIERpcmVjdG9yPC9kaXY+DQo8ZGl2IHN0eWxl
PSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpJbmdyYXN5cyBUZWNobm9sb2d5
IEluYy48L2Rpdj4NCjxkaXYgc3R5bGU9ImRpcmVjdGlvbjogbHRyOyBmb250LWZhbWlseTogQ2Fs
aWJyaSwgc2Fucy1zZXJpZiwgc2VyaWYsIEVtb2ppRm9udDsgZm9udC1zaXplOiAxMXB0OyBjb2xv
cjogYmxhY2s7Ij4NCkZveGNvbm4gfCBDbG91ZCBFbnRlcnByaXNlIFNvbHV0aW9uIEJ1c2luZXNz
IEdyb3VwPC9kaXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6IENh
bGlicmksIHNhbnMtc2VyaWYsIHNlcmlmLCBFbW9qaUZvbnQ7IGZvbnQtc2l6ZTogMTFwdDsgY29s
b3I6IGJsYWNrOyI+DQpPZmZpY2U6Jm5ic3A7ICZuYnNwOys4ODYtMi0yMjY4LTM0NjYgZXh0LiA1
MDEwLTE1NjEwPC9kaXY+DQo8ZGl2IHN0eWxlPSJkaXJlY3Rpb246IGx0cjsgZm9udC1mYW1pbHk6
IENhbGlicmksIHNhbnMtc2VyaWYsIHNlcmlmLCBFbW9qaUZvbnQ7IGZvbnQtc2l6ZTogMTFwdDsg
Y29sb3I6IGJsYWNrOyI+DQpNb2JpbGU6ICs4ODYgOTcyIDc4MSA4MjU8L2Rpdj4NCjwvYmxvY2tx
dW90ZT4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_SEZPR04MB80455B0E70D9399F4971DB00ADAD2SEZPR04MB8045apcp_--
