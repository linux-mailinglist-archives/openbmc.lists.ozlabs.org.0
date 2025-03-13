Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A428CA5E8FF
	for <lists+openbmc@lfdr.de>; Thu, 13 Mar 2025 01:28:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCpHv0VPzz3cmx
	for <lists+openbmc@lfdr.de>; Thu, 13 Mar 2025 11:28:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.145.42 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741825687;
	cv=pass; b=MJ3QiVXr7yVTvEsT0yqxZ1JAIoP9GtvvZvK1r4eWCk7GKzHS7zec+V4jBuEIbtAspaOVNh6Jx47Glfiejmx4lEZc7WgeA0Wu5aFQxyQnkW0graPgHrRUtJe6tb7XRblXXIhm1Xtdo+QsS05EBOsWC/PIqqpx5H7lJXIJSA0xLzcqzYqjV/vXTGn2TxUwNNGWk+2psuSFmBXE4ezJi2FSNJKyx+jIXkrhgl0sBOMaPkNvzBbicNX/9b3Nu88EUrA8DQopbn6t2gv3M4tbBKjBX7A2xEw/Al+WuLWK0q6oD9jhmMF2fOcqo+TfSTjhg2+ARCnmHf/UXcvCI4LN7v19cA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741825687; c=relaxed/relaxed;
	bh=Svtug2D9iP8mZ1Zvy9+mq256/VwhJn7Ms248pf2yzLk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=osLkoEFlGRBrgWEcnmHYdRZyiP7FhxVZgdSw6xSJPhKQZszd3pf+FQg0QkFdSKwLASefavB/W5kI2jFvuiaz++kdl9GaSoQ2+WSRSpZ7eopSqbue2huQJzrfPv3Qud3WCTQteq3Fj7f78EIO62npfRzXivD4JiY/y1kEJUDo/xh8S036XrFC/11nfXl3VUtg/iY+ue6B3nnJaGtM/SU+giXf4kWqTS7Y5+We6ugTttx7B0DNlqVBHXoWhsDAGHeGvjrw6Io/biXeJMgliZXdiNvKrZre5ExjuXYqWZ+mDdq07sHqwN2w1CkpsDeuh2c8EdUDQUezwgfOMJdN+TXN/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com; dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=fqumpys+; dkim-atps=neutral; spf=pass (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=9167c33c9e=jagpalgill@meta.com; receiver=lists.ozlabs.org) smtp.mailfrom=meta.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=s2048-2021-q4 header.b=fqumpys+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=meta.com (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=9167c33c9e=jagpalgill@meta.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 762 seconds by postgrey-1.37 at boromir; Thu, 13 Mar 2025 11:28:06 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCpHp2strz30D3
	for <openbmc@lists.ozlabs.org>; Thu, 13 Mar 2025 11:28:05 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMBOHP026735;
	Wed, 12 Mar 2025 17:15:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	s2048-2021-q4; bh=Svtug2D9iP8mZ1Zvy9+mq256/VwhJn7Ms248pf2yzLk=; b=
	fqumpys+yDbf5CntWmycnTpHW/oe3Eoe/OGaCPg80MNzK8UL36OxvPpSqJHu0DGL
	BwdBwI2SyjpuX2DNmg4QRcgGotCr5ly7rnUpDfDPaxp8uWMyWhdGrW6mMBJgk170
	sWotAmxwrW5K58r/UbQn7Xh2Tcd6N0K4yTZvn/xsPgmrTmz0/yfs8+4lyXnDcBan
	W0mcozgAgHXgDAupIiFwLSivfvdnJeYP6zKgz6KZtSPVf2XL2G5ox7VNvOvzqAll
	PWuGMBldhxZCs36bM59tyev69zLzALrBSCVpCNZ4DEPxM7BlIq76fcutxdLVYvC9
	0b1z3xC4hAhdOA7BmxsSLg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 45bbtfvs3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 17:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/VZzRWm46xvkiS7m39CIIZEjWRbbOhS5zx03ZhncoHH4qyxmXS6BO90uD2t/8vu8TXCYXF4ITTlmPB/TeF2seyQpIKmyo4pavTRKdgp/pXg4WI0e+icRiaAUHlfsx2ut5zkQhLE3+5iJaX7/FjZ+lRrDrURLckfy2oAGQO2U1C4qUFsQJalwAhw24DX/bAJ+rqhFDqwYdMzApwq4xMkXiq7sI8jIiZwaHJg+C+LfGAwXkCfmzOut62Gg5VyRS0fL1fJoTBXAAY4/8dGyrArD2zl8c0F2bOVeYGr5h4z2cOpbZ1W5i4gTUZroQzFCZ1SE7xlyv4fNQi40907yxalUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Svtug2D9iP8mZ1Zvy9+mq256/VwhJn7Ms248pf2yzLk=;
 b=NESF0pI1W7OdB5G3ZlltN/nUWJEAQla3yublhld8s7X0tcPAbEaLcfcGn7l/CeGn4VmlRrrwqwNt/YK1q1HXUeT3QA4P283UG97Ja7FIOZBVGthv0K2a0Gb/IH3NbELDWQ9B+OFppgQ5Y2B+JsM41d7mc9WXv1FJhZ7CxWTXFpH5cxBKDNBFqigCTU3deZs96SYAG+7tRh+DwxvRHgQ8QPMSqENngfyU0fwaqCtRpy9t0kQcnhEzfX8yzvdgO79iZv9aDDT8brszuDqKi5h7VxmmiI0vsL9zA9GxpiuuwiQWYjFUqvFuq4DhAUeC3Bk8mSrtBhCOivrppeic10Z7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB5342.namprd15.prod.outlook.com (2603:10b6:510:1e1::11)
 by DS7PR15MB5325.namprd15.prod.outlook.com (2603:10b6:8:70::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 00:15:14 +0000
Received: from PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743]) by PH7PR15MB5342.namprd15.prod.outlook.com
 ([fe80::859a:3263:f65f:5743%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:15:14 +0000
From: Jagpal Singh Gill <jagpalgill@meta.com>
To: Patrick Williams <patrick@stwcx.xyz>,
        OpenBMC List
	<openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H1
Thread-Topic: TOF elections for 2025H1
Thread-Index: AQHbjWbxRQD6dsFBtEyukQ9m2AJb4rNwPyEA
Date: Thu, 13 Mar 2025 00:15:14 +0000
Message-ID: <2C61D8A2-A287-4ACB-85E0-840F00FE805D@meta.com>
References: <Z8ec-DOTlSM8FMhC@heinlein>
In-Reply-To: <Z8ec-DOTlSM8FMhC@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR15MB5342:EE_|DS7PR15MB5325:EE_
x-ms-office365-filtering-correlation-id: f19af453-69d4-4117-1e7c-08dd61c42095
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?RG16Y0FhUFRHR3luUDJFdlFiMHV5QWZlSmE0VndiT2Q4YWNON2ttbmREN0VI?=
 =?utf-8?B?Y3dCVFZUSmROQ01aUkhPQ0pOUjhRelBNenhRQXVlTC9UOGlQSkxZSXA2SHBL?=
 =?utf-8?B?Tk0rVFJJNEtjT3pYTXdJTWZhL0VOYWtxZTN2Rm9jWDRrQS9xcTFEOHQ2a0R1?=
 =?utf-8?B?N3F6ODNPd1pJRmJSY2xMWGVZSVNDcG1HYitMNEYvR2g3SFdUTEJKQ1JBemMy?=
 =?utf-8?B?eDIrSU8yYVJSUGpiTklaYXZGQWJQOVcydmhtQzR1QS9CTWFOYTNscGdtbzFp?=
 =?utf-8?B?ZjJ2NnI3dnZhcklWaGUyd29UYkpBN0FGRmoyWWdGOXJNWW1TQ3d1TWIzYmpO?=
 =?utf-8?B?RWZacnBHckp6WGoxeG9ZNkFST2tKTnpvUEpxcU5vQUgycDlBb1V0UTRKM0hX?=
 =?utf-8?B?NWNTNm5Cd3E3K0hUeExjY2F5SlhGd2dYRU01eFdYNXZRM2JDTkFmRmN2OEQ3?=
 =?utf-8?B?ZjdORGpVSFZMR1NtaERINkJmUVBoOWt3am5YRFhVaXN5d0s1bXUxd2VQWGxs?=
 =?utf-8?B?MG5zZEdJUnpyMTZJbTZNRGlFelR2OXMwQWZrdkJiUGdhYWhOak5JUVI1WjhN?=
 =?utf-8?B?dWdBYjEvOWJOcTBSeXVWY1k2REZwQ0dNcEhFWWQ0TUhPRGxTT3RHREVjcUo5?=
 =?utf-8?B?enBuWFpiekJCWEFXcVNXTkxDQ09ENlBwNWZKeTU1Vk5KWTR2T2w2dGV2amNH?=
 =?utf-8?B?WkpQWTRvKzUrdXVZNmk5SmlnaHdxbGhaUW1qVnRYRGNrSlhHT1k5SmM2elBY?=
 =?utf-8?B?ZGVZNUxSdXFhaHlMUG5NT2x1QVdPYmtZeUlCS3VBOGl4WXhvcTFrRnFIWkJP?=
 =?utf-8?B?a1k3Qy84a1d2SnF6TEFQaVFobmEvaUp0YjhhaEdEZy91K29Wa2svVXlSRklq?=
 =?utf-8?B?Wm5RZGRMZ0FKYm1lSjR2TDJSQzByd2dYZk12cmZoQW9DQU5vZnNZaUpEaS9N?=
 =?utf-8?B?Qkh5KzdQWHBqd1ROQzFmcFZ4Q0YxZ3MrYmlkeWRHZStwOHJsK2t0TXFUMmVC?=
 =?utf-8?B?SVVFSE1IRlFLa1lWZ3FMWk1vbE55MmFxYnhlZExhTVc3MVFZVWtXTU5jS1Na?=
 =?utf-8?B?M0dvTW5WaU0weHQvRE1IRElvQ3l0Uk4rc3FaZDRGWVo2WWlkcStDR3pNYUgv?=
 =?utf-8?B?b3Z6cHpsblB6L2NYZ3E2bDFIemtISHR0U0J0VVBzU0E0R29Yck10ektSYXRu?=
 =?utf-8?B?WkUxU0VZa2hmdkpLS0lyVVhxU1kycUNzTkZSR3NaYTF0RjM4RG56NXVhTkNo?=
 =?utf-8?B?QTkvNms1UUYxMTRQNEt6RWc3UnlRZ25aUHZ4ejhvaGlGQ2hoS0c5ZG1uYlVr?=
 =?utf-8?B?RG5ZaCttRjRNU1lXR1h0SW5ENkhBLzd5QVN1Ym0zN0NuemN6TlVRT0JpSVBu?=
 =?utf-8?B?bTNYQnlnNjRkSEJyc29tVjJhK2JTeVk5YUU5RG8vUjRJeDhuekJsZUprV0I0?=
 =?utf-8?B?eDhwbkphTWhha201SXpSeEdBZmIwM1RwaG5YenZrVjBwTHBhKzh5K2NlWk5r?=
 =?utf-8?B?amVHTldFd0hidjlITVhXM3NqQkRiMW5qSG9xTG90L1JybE1rNUxCcnpOWFhu?=
 =?utf-8?B?c3BqYlJ5OHZmS2U4d1NSUXU3VWVHUXhlaklaRzFZdzV4TUJodU55Zm9wTHZX?=
 =?utf-8?B?cllMMHBldmVIMGErMTJTOTNvcGZEYU5BRnc1c0hPRTZVZllzZjUxeUZLa1F1?=
 =?utf-8?B?Vk00all0VXBKQi9KbURjTG1ITiswTlZSK3JUbXhUcGNwRGFsaldLQ2pVeUpE?=
 =?utf-8?B?amFDcU1GZzk1N2U5MWJDb2hoU3d6RDdWN0c1WkJGc0xJL2tNM0RUcVBaRmhQ?=
 =?utf-8?B?VkNJbEV6WHlSc1NMN2dia29HanArK2ZqUmpLaFhybmlsUFpNU3ZhZE82M3dJ?=
 =?utf-8?B?N0MrSFN4MkZwTEF3ZWhJSU9uMGpOTVV3VS8zb3NBYkliaGQwa1hYOEkyKzVm?=
 =?utf-8?Q?hks887EAadbzEYNdmMphIMuGa9yhbdia?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR15MB5342.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dTdRdFJKbmtKbnk3WERYOERkWEllM1R0MFVpZUJVaFQreHZydmhZTjhxZkFD?=
 =?utf-8?B?NXh5WDRFMnU0UUlOV0RKcmpaalNRakorcWowbkxhdm1oTTE1bHRuN0g1TFRh?=
 =?utf-8?B?MmZVazFpdlREY1RtZUFYakVxY0VHSFF4MGZMblVQa1lUSEZLU2JHcTIvd0Nk?=
 =?utf-8?B?S0JycktMdHBWOVBQWk1IajhkMVZMeG82SXl0dStOQVdNRDFITXowdkZtWk82?=
 =?utf-8?B?R0ZDTkY4cEdrRElGdGMxMjdqSGxrU01hQURlNW42U0tac0RGUlV1UnFZbDJG?=
 =?utf-8?B?aThKMU50V1RGUUpaM01Ga3FXRDJibEF0aXBiV0JMTUF4UGh3cEtGdnNvTE5t?=
 =?utf-8?B?MTdqdzNEYlFJT3hHbm1PRDBKaURYTFpFd1hTQWVKUFczdUxaTmQ5bml3bUZk?=
 =?utf-8?B?Zk81RDRHdENMb0IwNUxlaFhkaWRPTkFvVENuOUZKNU82M0Z2YWNWeUlCZlNW?=
 =?utf-8?B?RmRjUjVtL2YrTzVmUkljeVJwTk13Qk5QVHI2R3pGRmd3NHRwVC81OHNibFFE?=
 =?utf-8?B?TVp4RkNZQVdkdm5ES2RDNGdsZ0tkdFdDc3lFQ3VxdW0xQUhKWUh5bzBGWTRS?=
 =?utf-8?B?czJ5cmloN2xHNHpsVWpleGlOSlo5U0RCdHBWa0Z2MkFZRDhZM1RDeHRXaHA3?=
 =?utf-8?B?U2x6OXY1Z3BUZml4Wm9hTDF4WC9tTnRURG1vN3M5NmoxTld4UWUzV2VEUGl4?=
 =?utf-8?B?bW5sTTMwMFlqVTlCUnlyTnFqNGtVRlN1RTBUUW9WdW1rMzQ0OGlDdVJ5OEpz?=
 =?utf-8?B?SEQwcEhxOWQvby9KM2tHRUYrc3VUUGJIL2hEcjZqSnJjNFdsS1BNUlgwekNw?=
 =?utf-8?B?T1NaVXAyTGtTN1NFVEc0cDR6RFdGSWFFcnNHbEFqVVVacnRveG8xR1A5WmJ1?=
 =?utf-8?B?TVJnS1J3NHk4bkp2MGVMYUVCazUxRG96TmhOZVlKNjFlanBOUjgzZWVYNHpt?=
 =?utf-8?B?WHdwT2RLSFJsVnFNek1MR3E5cjV4V2ZrMkNOeW1ZM1lUZ0RuRitVeStNc2w1?=
 =?utf-8?B?OUFUN2RoMXdkcFo0eDFZRGxweDNNWkpxZndPSFlBNXQvUTd5cUcvZmg3blBF?=
 =?utf-8?B?S2RTTWVyRTNmcW1XQys0MXdFWGE5ZlBtbGZYcDB6OVZYbVZxTmRqRFRyVDhq?=
 =?utf-8?B?YkZqRW45SzFTR3BaOCs1MkpHOEd1ZXRhMjFMak03dDFpZEpBL3hWR2t3K0pM?=
 =?utf-8?B?R0R1UGg5ckc5VUFTVTAxMjdkQ2JWa3JDd21UQTB0SURrNXdSODFudWtqL0d4?=
 =?utf-8?B?NjBuc0w0QlVKY3Y0dlB3VUxyTDNWK0pQTzJsSVBYUTRZVGFpdGltbytKcEF4?=
 =?utf-8?B?LzY5cld6M2F5MktKbVhHQ0wydm1CdE1KVUNzSWFDT05WRUs5UlVpbVFmNWc5?=
 =?utf-8?B?eEdPeXNwNENtRlBEZmdnVXgxdUhjWlZwa1pLcjJYTW1FNXZIejM3QXJBSkps?=
 =?utf-8?B?YVdTUnJ3TjNqK3V6WE5RZE1RbEl1N2gyMERXL1ZWc2dXME5FY0o1YUNONGF2?=
 =?utf-8?B?ekw1MHhORHRUTWxiK0p1OVU3K0xoSU9sMlR4WFVNN2FmRnNEdU5SdzBvVlBw?=
 =?utf-8?B?QjRqaG5vNnJlWTZlODliLzBtclp2aHU2aXpXcGRXellaUEhxMTBWM2N2cWV1?=
 =?utf-8?B?dEpFdEZFeTFnajZqTHdQTTVQb0RERmVVVHIvQVJURHBlcFNSUlQ3d1NFVkpB?=
 =?utf-8?B?OTZuQ2JHbm5EM0pYMTNuTlhCY1REeklmbEtvWGdpTnVZeTM5K0xBc25Ob1RX?=
 =?utf-8?B?RTRuSU1Kb2ZoR1FoK2oxRzQ1dHd2dHVJamtmK2NBWUwvWEdLM2R4N003TnZG?=
 =?utf-8?B?NTFZZlpFWklQV0F3RHJMSDZGRndUbVIyOEtudEc4b05BNTV1cGZPaGk1eHZI?=
 =?utf-8?B?YjJQYmxZU0tObEhKOVdtT0ZFaVIrclovVndJcmFNclVBdmtyd1NsN2xIaUNy?=
 =?utf-8?B?L0tqdWF4alJ2bDZsTGdyRWdPSnhPUERxeWZuVXFzWGorS1NzK3MxUzVJWVJh?=
 =?utf-8?B?U3N3clFESGlkMVk5L2pGTFBRV0VPNXZ2cG5CcWRkalNSdXEyTlRzU1pvZ1NY?=
 =?utf-8?B?NmgrNllsOE9kRWlXemJHWlpjY0preHpwMG1JRWhaQWEvdnEzK1Q5UkdTSHU0?=
 =?utf-8?B?d2U3ZUlJTTMvcHE5UEZOZ1kySVZvZElHOHREY09pNjFvRkJJai9xR3NydUxh?=
 =?utf-8?Q?m96E/C+NoG3HWkugvjtJtbA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08D9B3130773D5438EC0E99BC31DCF2F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB5342.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19af453-69d4-4117-1e7c-08dd61c42095
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 00:15:14.4057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uf+gXxBrXe2aUelZ61BOxWOr59Sj/RqJjnIITvdiZRu8XNCrK3e8i6OLPOI69jOj69UyAqbH1W5H2CeX7YTwtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR15MB5325
X-Proofpoint-GUID: D8lVU_ewvmkgHKZZOjqKWU0Jmcq3IlW7
X-Proofpoint-ORIG-GUID: D8lVU_ewvmkgHKZZOjqKWU0Jmcq3IlW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_06,2025-03-11_02,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSB3aWxsIG5vbWluYXRlIG15c2VsZiBmb3IgdGhpcyByb2xlLg0KDQpSZWdhcmRzDQpKYWdwYWwg
UyBHaWxsDQoNCj4gT24gTWFyIDQsIDIwMjUsIGF0IDQ6MzjigK9QTSwgUGF0cmljayBXaWxsaWFt
cyA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KPiANCj4gSGVsbG8sDQo+IA0KPiBJdCBpcyB0
aW1lIGFnYWluIGZvciBUT0YgZWxlY3Rpb25zLiAgVGhlIGN1cnJlbnQgcm9sbC1jYWxsIGlzIGF2
YWlsYWJsZQ0KPiBhdDoNCj4gICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvdG9mLWVsZWN0
aW9uL3RyZWUvbWFpbi8yMDI1SDENCj4gDQo+IEZvciB0aGlzIGhhbGYsIHdlIGhhdmUgNCBzZWF0
cyB1cCBmb3IgZWxlY3Rpb24uICBDdXJyZW50bHkgdGhvc2UgYXJlDQo+IGhlbGQgYnkgQW5kcmV3
IEouLCBKYXNvbiwgUGF0cmljaywgYW5kIFdpbGxpYW0uICBEdWUgdG8gc2xpcHBpbmcgZnJvbQ0K
PiB0aGUgZGV2ZWxvcGVyIG1lbWJlcnNoaXAsIEphc29uIGlzIG5vdCBlbGlnaWJsZSBmb3IgcmUt
ZWxlY3Rpb24uDQo+IA0KPiBOb21pbmF0aW9ucyBmb3IgdGhvc2UgNCBzZWF0cyBtYXkgYmUgc2Vu
dCB0byB0aGUgbWFpbGluZyBsaXN0IGJ5DQo+IHJlcGx5aW5nIHRvIHRoaXMgZW1haWwuICBPbmx5
IHRob3NlIGVsaWdpYmxlIHRvIHZvdGUgbWF5IGJlIG5vbWluYXRlZC4NCj4gDQo+IE5vbWluYXRp
b25zIGFyZSBkdWUgYnkgU3VuZGF5IE1hcmNoIDE2dGgsIDIwMjQuICBUaGUgZWxlY3Rpb24sIGlm
DQo+IHJlcXVpcmVkLCB3aWxsIGJlIGhlbGQgaW1tZWRpYXRlbHkgYWZ0ZXIgd2l0aCBtb3JlIGRl
dGFpbHMgdG8gZm9sbG93Lg0KPiANCj4gQXMgdXN1YWwsIGRpc2FncmVlbWVudHMgd2l0aCB0aGUg
cm9sbGNhbGwgcmVzdWx0cyBjYW4gYmUgcmFpc2VkIHRvIHRoZQ0KPiBUT0YuDQo+IA0KPiAtLSAN
Cj4gUGF0cmljayBXaWxsaWFtcw0KDQo=
