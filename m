Return-Path: <openbmc+bounces-517-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7DB378B5
	for <lists+openbmc@lfdr.de>; Wed, 27 Aug 2025 05:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBVmZ3J0xz30Vs;
	Wed, 27 Aug 2025 13:45:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756266334;
	cv=pass; b=HDQcFxXe5kY87DDOvBNlbjtMk15qW9x4IE4+MisRJAQZXb9b88rZQtm9yvvHP+Zvc0OxQe/t6ephr1cWsUkyp9TkYVOId4Y7CljsyuxcxtnlSVQcNRDVl9aKobDkABWZCMsyQXhZHPYha8iL63SoCTE38jeA1v1pFgHebU0Er7sIf2LeaQDAJUkfnqU5VYeaCLUfGSbPGV5T+/o+AZlGbZURMB2RfqiUKR7FJN34GL6empmZyhb219tM3HS+y2VnEgNvpj5iHxasOI8a/FZO4zMKy4G8q+ZXKeJXIqwsd1ABQZllQd4c0dAnKluEi0aHN4W0r9XEYafej9hiTTP7Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756266334; c=relaxed/relaxed;
	bh=WU+x8B6sboSK/Zx3EUMhThyh0FAxYTyDt7jgdVQrjvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a9HVxcLls+gDz1QqnpG5GzMdmgdCwNvXSbL8jmP7Y7yxWWjCDa63g/HpFUsIBcEBYalDIkSd0l/5PJ34ByFLvXScwRYT3G83W/wLA6m29c/dOo1Xn+4Itdp9O3AD/q4hMGjQn5aAAS2ljqjil/ePCT44zrOTMq+RYjDl/r7aY7F7U9Q76N5oR2w+RtglRdb77SqvFMbidzbMPuYtctCFAz66Sr0gOaVsdoSSx6lP1mrXrMrmulno/gk09icSjDJRV3UoVEljmegLwBTJYQ8yCaYd55BJKivvBIuYVJae67i3AciY8NicaKEEDOc1cFe0YBRlDnpdFf58yV2qDB3F7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JFyfQ2d+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=JFyfQ2d+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBVmY5J5Cz3cYR;
	Wed, 27 Aug 2025 13:45:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygypHQAm1q26gBeV4fAEpdjSpw4WU+vTK0/ldEusTln6P3OxchirjF+D3a3ZaDeGRtmgdV3Oh/kzuts0hg4o2wHvmZ2qYAPftnksWKvADu9pwGgwD6PMQg1RD77LmwJGRCrNczN4sggR6Mg/2ltpkHTvChqJiFsIUIzVYSkX9JDCrx1rXY7Jxed0ScZXKVANiu6Zw4SHiTc5Z/O40oI/tc3LUTI2wKsPMCiDW8csSqpguZjcJmlHzxE/9pwTgZaGXmzQWMenXJzItBRgL0suLsETiaSBTHswrcRIQyb9X1lKw3pQI8ZLO2PCmGhELTU3If6C0BYNTf7ryvNDqE43lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU+x8B6sboSK/Zx3EUMhThyh0FAxYTyDt7jgdVQrjvk=;
 b=SLSkytoOYv5rmcnzZO1KKb3q6WACWI3+mNfZzApPFMbyMCc+43Eex0msbWD8aF/hF6QO2qMrylpaj0Am5BAhHqXbPaCGCXBEmtVe1NKXUPBll0Hg3TZEuCuCtkAKb7Yz9TsWgerzYt5yFDVZWs3z3khmXy9U98cfj/4PjVRzOgnSx2oV7F6BabbLxdII0/tbIXtCX6HEQ2rdrt04D7d+EioAmfX66aVW+5W5ZaXW/AvrX+J1t34bWrKWoAWJRaJ0pWdm5NiL155PS+tBjHlOb/xfNv9qSPc6UXMTD5k+lNk/rJNOXke74YQtAlxxgsuYda9YPYXId5gFcWZo1Nwx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU+x8B6sboSK/Zx3EUMhThyh0FAxYTyDt7jgdVQrjvk=;
 b=JFyfQ2d+KkeBg9Vid6MW6I3UxQpvyMEOqK15Z1J8WqT+NNVeobWCEHc/NkQpL/mq0mBzn9U7vXCuOuxwT9IfAprrczlJ6C3kBwtSHtJwJlA6QrZU5/IN14+vhRxcefT//ja2zMb31TpuN+VnbRAxskrsGkjquUrpuhLSHit0D4gE3kjvYu3TMaT2NXHkjl1w6KZ2wdULpvNrVOfiBztlVW7hRATq64IANDIXLAIqxSFdCTr1fJqXYjRuEUd9mK5EapYPJ7uVFqoMOJmhHta8icat63KTLPGy0qyzgi/AN62s3g6Ea6OwpE0myIh4bfaRHi7yfBQrkzqKTtb0DH+CRA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KUZPR06MB7964.apcprd06.prod.outlook.com (2603:1096:d10:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 03:45:09 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:45:09 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Markus Elfring <Markus.Elfring@web.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Topic: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHb9Tqmkbg3qF5lqUafax+6ueL4M7QzaXeAgEK0OLA=
Date: Wed, 27 Aug 2025 03:45:09 +0000
Message-ID:
 <SEYPR06MB5134C10E219E40C76D1413579D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
 <8fe0f561-ef44-4ec2-9b93-f73105bd67ed@web.de>
In-Reply-To: <8fe0f561-ef44-4ec2-9b93-f73105bd67ed@web.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KUZPR06MB7964:EE_
x-ms-office365-filtering-correlation-id: 6304ce3e-e672-4988-106a-08dde51c1eb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?R3FOVzYxYXd4a1lDVjk1S0RET3Nwdm53TjNZNTBzeFpvUjVvRXBZejlBVVNl?=
 =?utf-8?B?a2diUG9udC9heVBIT0dUR3hlemxqNGxjbEg5eHpRdHk2REFTaWMvcWNzVlVn?=
 =?utf-8?B?QWZPZUxQSHd5TjY4QklKMlhNSVdhR05zU1BKcitXN09uaXoyMmJHTXNsRzEy?=
 =?utf-8?B?cjRHY25Ma3ZGWmZ5b2pnenh0UWd2WFV1WWZxb2tramVIdmFMQWlxT2o0V3pX?=
 =?utf-8?B?K0l6OXlCK2wwWmQyUWFvQmRXTEtnbDlmUnRqdWk5bnRqYk9jYnI2OUxzdFEr?=
 =?utf-8?B?NjIwZlJMM25XL1NiOU83UHo2QXFIZlpsejNSUy9qR0cxK2tqWmFlR04zV3o4?=
 =?utf-8?B?M0hnUHU3U3kxV01nMFM2ZCswelFVMjlDMThJaFBFQXh5akNMWk1PcDdtT29G?=
 =?utf-8?B?bk0ycUNsdUZJZitPRWFmNTZ2WTJxdEFMVVFpTUd2cWRTU1lwY0s0YlpPUlpR?=
 =?utf-8?B?cTc2eUlNYzlaZEs5VlJLT0xabnAzZCtJdlJibHNSMnlPb3YxVDB1WnNnb2FO?=
 =?utf-8?B?VnRYTFJSWGJ2NEgyemh4b0wrQ1hFd0IyWXdvYXUvQmNOMWFMKzY3N1o1b2gv?=
 =?utf-8?B?ZkFKaDZUZmxZcFRMSVQvUW5kYVNOemJnek9aVkMzQkJDNEYrUTN6bHp4eUtY?=
 =?utf-8?B?S1R1dm9EWmgwSk1ZQ1hRamxWcTkwMkxyQ2kwRXNpY1B0aVFaQzk5by9qb0Fy?=
 =?utf-8?B?djVnemE3R3VqMDF1NlpNenp0bzdKZnY4OTBMVTJPNEc0Ti85aENKK2t6TVkv?=
 =?utf-8?B?SmcwRms1ZEd1OTh2emI4cG1qdTQxUFRPVC9oTURjWCsvZnZhM0NFQlc2R0Vq?=
 =?utf-8?B?R3R0Tm93alVTaU9Td3dnT0ZKRnlYWkhLK2hKUFdiOUF4TGxLaTVRVGcvSlZT?=
 =?utf-8?B?Tit0OXRhKzRacmJmS0dYNzIyN25odHQwSS93WjFuL2ZCSmgxK0pFU2xPbDRI?=
 =?utf-8?B?S2lzaVcwbThqc1JSdXAzeVNESU1ML2JmZjFUUUUraXFDYk5PaUdmLzhZNVRH?=
 =?utf-8?B?THNncHlzb0RKTS9rZ1JsY0pWODF1VmxKMElVRkVUeXlaUk9jaldCRnZhOXlz?=
 =?utf-8?B?eWRHcjB3VjgydlZhUFBQWUdNRldyWXE4UW55MTVTYjF0bEpuSE1DbEpWWitS?=
 =?utf-8?B?TDd0eHgxTk5UNWM0c3BJYTBQVUx6YUpaMEtVc21sODFhWCtiRGQydS9CKzh1?=
 =?utf-8?B?dXcrQ0ZnTlBsS2JhM1RWeUlUb2VpZ1c0ellqT0tuMUhhN2Y1ZFBGcDNBZ0cx?=
 =?utf-8?B?cE83U0dYSU5tZjdGZDhuOVdYZGNkWlVRaXkrY3JTWUFPeWhTcUFhRUhSSUww?=
 =?utf-8?B?MUhDZEFHSllJaXpLOWlrSzZhYmd0YWY3cjFWZmdYdGlqMHNmSkVVNkNHaWZZ?=
 =?utf-8?B?VGtvK2dZM21adnBtaUtwbmhyREUvaTBzSjdGdDJiM2l1SlpKLzAxM0lOMjlP?=
 =?utf-8?B?OUs3UlZFcktveE5PNHFSZVBaSzVMTk9MNFZLRkhTTktuTXhwUnVWQ1RlQWJI?=
 =?utf-8?B?SXJuVk83TENBckJaallJOEl1bVIzcFprK2tVaXNQSzYvRWxYVlRseTZ0aTlV?=
 =?utf-8?B?RE5RQ1QwRG9pUEI0YVBjSWQwREhtVXMyQ2hKeGRCMkIxemx2MkxaQy8vdTFu?=
 =?utf-8?B?cGU4UzdlcXc2UmgycjlFZlNzK0Qvb3Aza0k4UTRMSitxcjBmaGxscXFPcDBZ?=
 =?utf-8?B?SGhPTnA5Y2tldnlLKzg3cGpWdjBvZkZORnkxa1hWUnhLL3grZzNQcC9obW9V?=
 =?utf-8?B?WGE1MmVobURma3RFdmJzNmxmVzFrdmRIcW1iYlNSWS8vSVNXdXNTVHU3NWtu?=
 =?utf-8?B?YnREOGFaQ0pnWXNRbjh5YXRUSkU1Q25LY1R5aUNnTU5RRFkxOS9MbHR1alU5?=
 =?utf-8?B?c0hMSlNDc0lyNGZFTTVUVU14UXJUaWZCRWR3SjNQdlZ1NXlRVlpFSFhMQUh3?=
 =?utf-8?Q?kgDMuA+kcNAszt5D3vbdqZd1hsDCjSST?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW5DSk9vMDB3dDliK2pRNVpJTUgvY0NGYms5bFJobXU2T010UFVRQnVGbjJx?=
 =?utf-8?B?MGZEMjZPZlg1dW9XYmR4ck5nMDNsOGdSUytKQ2s5LzdXWkNLMU5NY1c4bG9M?=
 =?utf-8?B?ZnFIN1dORDhmMWM4OEROVnlOR01SRXF2N0llWXFtcDZDeDR4My9XZGRlb2NI?=
 =?utf-8?B?eFM2Y0NHNHo4RXhwbFhpR1I0dDZac2FsVHdnclFqVGYzZG5SWVp5Z2lEaXFV?=
 =?utf-8?B?ckI4Qi9MZTJ0ODhKZjB6dCt4TUQvUVZIWVdrODN0aW9hSGdwc3JRRHJQem0w?=
 =?utf-8?B?V29YL1F1QTFEN0ltbnVvMG5qV1RpN3BySXBOUWczbFhITzVaVXdjTjBDY3lv?=
 =?utf-8?B?T3hRbS9uVXJzekFOUjE1TnBDZG1wYUNldHM0bnkvTk1TQnJyajdyQVQ3bGRR?=
 =?utf-8?B?bWorL1ZKWmlRVFR4NWFnVGVGbHVoaDZLQTg1VU5sRGgrRVBqTUgyQTRUdjJw?=
 =?utf-8?B?ZDREWFYrMnNPTnVsNVF3bTVrZ3VuVTF0T21Pay85OXphNlV6OHRKV1M1Smdz?=
 =?utf-8?B?dUVrWTRhZVJIRFpPdm1sc0I3WkVXTy9nbVVVdThzWFROSXAzaGx0K1dhK1NO?=
 =?utf-8?B?UVJnbCtmZVE0dHV2ZU0zS0g1TTNSOFB6NjRUREUvc2t5Q0t2dnMyMU5vM2xz?=
 =?utf-8?B?WTlSdEw4dHlRKzBBZ2wvUmJ1azE5bXdKTERtbmFEUEFobTN6Q1FVRG15L01L?=
 =?utf-8?B?TUg2bUVyYnVzTWs0WXZRdHhiS09jOTRKbU41WERLZ3pXSkJESkgzVjJQWjJo?=
 =?utf-8?B?dnBJMmRsTmJoY3hsem5LWlRXbkFUUzMzQXplQWNEeTdSRmNnSkRCU3YwMjAv?=
 =?utf-8?B?V1BsMVBNc3R1ZHRaNnZjdDdHbGVMYjlweUowWWtnamVMbk5LSFhzNnRaUkp0?=
 =?utf-8?B?cktVWFFlSXY1MjJRTnFsTDNVdUthY2JoOGtYMkI0aGptL1loYkRlTm1CR1hC?=
 =?utf-8?B?azl3L214dUZwbnJSM3d0aFByT0s3ZE5DbHlBNW9yYTBMcWlUdWpYUEVDTmRW?=
 =?utf-8?B?ekdtcGtZMm9VR0JOSXFXZWFraWpCdUhXREdTRUVTcXdNWk1WbitKZ1lHK1Uv?=
 =?utf-8?B?Y1c4NVdMcnA5S3ZoR0ZqTWYwaC9ZMnRyaUlJL1pnY1B4ellVazdOTGsrcXdG?=
 =?utf-8?B?Q09UcWc1aHdGWDk4LzQrMFp6dnpvQm5jUzRMR0REeVhqWGV1U1F2NHNRdHlx?=
 =?utf-8?B?bTNrZlNFNVRVR1ZteGVsUGNMV0t3QnNheHNoZHJ2V2Y4NS8wUjBUVGpvZGtl?=
 =?utf-8?B?TFJGeFcrS3pKNkhPVTVsdk9aelI5OXlzN0M3RjNqTnNIM01oVkJTRGZ4TzRz?=
 =?utf-8?B?cVhxZit6SGpWOXZLWHVHM2Zrd3orRHA2czJnMTBuREdvZitoSnJpMnY5ZzNs?=
 =?utf-8?B?bEdjUU5NTVBJcC9Ccjk3bk1Wa0QwRjF3bWcydVhaYmZoVDZHMzJSTnQ1TmFG?=
 =?utf-8?B?NGJCbzhwY2hSNGdmT0k1QkErK2xnbE5kL1FhLzV0cDFLTWVBUENHdjdxMDJh?=
 =?utf-8?B?UFRHcXRCUytSdnNIekdKWDNTYVZQQlhRbTkxTGpKUXh1amtiei9TQXpWLzFt?=
 =?utf-8?B?REZLSXRMamNXS05YT2lFajhGVXhMU3NOT2FKUFJmVWVMcnV4U1pVQTZTeVV5?=
 =?utf-8?B?eGNya2p0c2VFT3pySjdYNm1iVkRVTUF2U0JCemczNk1LR29DYzV4czZlUXc3?=
 =?utf-8?B?U3l5cHlwbmQvNUxOVW1VRlJYL3NJdWZva1A2RWIyUnBNcC9wbXJla0JoNTd2?=
 =?utf-8?B?VW9KUHQ5QUR1UXBQMlJqSktkSWlTNVZwbWF2OWFXcE9neEFDRDRmK2dvUXZL?=
 =?utf-8?B?c0lOQ2R2RDZuUG42eDJXL1JBbVg2STk5TmRYUXllMTAzMkJHR1hsd3BESTBi?=
 =?utf-8?B?WktJeGNDVVRJZ3drcEFhaU1ZQ3BicnR2ckNjTjRmZW9HWHZaRUhNaG9xZjNw?=
 =?utf-8?B?TGdGc2dxRDFuY0RYT2h0bE9vR3cwS2ZuTGszUWVvYzhWL1Z4dkRmRVJRdU1p?=
 =?utf-8?B?WllvbEF5WW9Jb0VETU9zdU5kQ2FuYko0cHc5dnd2RjlNSmcyc0R1Mmt4VnFy?=
 =?utf-8?B?UFJtMGVkRk1GYk9Bc1U2TmZ2SE9WL252Y0dXZ1BENTVraGFCNWQxUzVzaUpM?=
 =?utf-8?B?alpKb1E0RTh0T0pDeEdSdWIweVArSHNxbU9GOERpWkNxbVgwZ0puZ1YyMEVX?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6304ce3e-e672-4988-106a-08dde51c1eb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 03:45:09.2930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWVU2X05e8ekYlNHFbdxb2SQ9ODnY2ucowYsHLhR8yZwz7+ppoabeOr/rmrOhvYu3ywgbnDfU0Yu60Gh7uB5L+ieAoBiVhJxZ28TT/axNW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7964
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTWFya3VzLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gPiArKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtYXNwZWVkLmMNCj4gPiBAQCAtMCwwICsxLDExMzcgQEAN
Cj4g4oCmDQo+ID4gK3N0YXRpYyBpbnQgYXNwZWVkX2lycV9tc2lfZG9tYWluX2FsbG9jKHN0cnVj
dCBpcnFfZG9tYWluICpkb21haW4sDQo+ID4gKwkJCQkgICAgICAgdW5zaWduZWQgaW50IHZpcnEs
IHVuc2lnbmVkIGludCBucl9pcnFzLA0KPiA+ICsJCQkJICAgICAgIHZvaWQgKmFyZ3MpDQo+ID4g
K3sNCj4g4oCmDQo+ID4gKwltdXRleF9sb2NrKCZwY2llLT5sb2NrKTsNCj4gPiArDQo+ID4gKwli
aXQgPSBiaXRtYXBfZmluZF9mcmVlX3JlZ2lvbihwY2llLT5tc2lfaXJxX2luX3VzZSwNCj4gTUFY
X01TSV9IT1NUX0lSUVMsDQo+ID4gKwkJCQkgICAgICBnZXRfY291bnRfb3JkZXIobnJfaXJxcykp
Ow0KPiA+ICsNCj4gPiArCW11dGV4X3VubG9jaygmcGNpZS0+bG9jayk7DQo+IOKApg0KPiANCj4g
VW5kZXIgd2hpY2ggY2lyY3Vtc3RhbmNlcyB3b3VsZCB5b3UgYmVjb21lIGludGVyZXN0ZWQgdG8g
YXBwbHkgYSBzdGF0ZW1lbnQNCj4gbGlrZSDigJxndWFyZChtdXRleCkoJnBjaWUtPmxvY2spO+KA
nT8NCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYtcmM2L3NvdXJjZS9p
bmNsdWRlL2xpbnV4L211dGV4LmgjTDIyNQ0KPiANCg0KVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRp
b24gdGhhdCBtYWRlIG1lIGtub3cgdGhpcyBtZXRob2QuDQpJIGp1c3QgcmVmZXJyZWQgdG8gdGhl
IGV4aXN0ZWQgZHJpdmVycyBpbiBMaW51eCBiZWZvcmUsIGFuZCBpdCBzZWVtcyB0aGVyZSBhcmUg
YSBsb3Qgb2YgZHJpdmVycyBrZWVwaW5nIHRoZSBvcmlnaW5hbCB1c2FnZS4NClNvLCBJIGhhdmUg
bm8gaWRlYSBMaW51eCBoYXZlIGludHJvZHVjZWQgdGhlc2UgbWV0aG9kcy4NCkkgd2lsbCB0YWtl
IGNhcmUgb2YgdGhlc2UgdXNhZ2VzIGluIG15IGRldmVsb3AgYW5kIHdpbGwgY2hhbmdlIGl0IGlu
IHRoaXMgZHJpdmVyIGluIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzLA0KSmFja3kNCg0K

