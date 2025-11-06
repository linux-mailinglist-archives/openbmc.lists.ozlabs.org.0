Return-Path: <openbmc+bounces-847-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B54C38EBF
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 03:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d26GB5tWfz2xdg;
	Thu,  6 Nov 2025 13:53:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762397634;
	cv=pass; b=iu7pHGGsXto4+gauucWOv7d/+XHavnhDJABUC5h4DDzk5VOmTEhLSclhaCbi0I4PgEaNu03k41O5VFnrlsUJ1IUB//9OOZAdl49bjZ9r1WGxx47PfA1sV+7b+Gm34yzHmvGTdPwjCihVBKBt5roXQ+V4CFZTXsX8vLUTSOqgfM43yoqTT/EWvExLleldzZt+ZFekWfTM1jtxd2LfayixNRWdtIt8drooE8RaIQruk7r/AoeJh28Keyh83bEvc5KLji0cmV3LA8ZDXNHhqgRiKb/M73LAp+qWLRB8hv2BTN3kq7UXj6htN4PglNHbPMNNnFGsfDD3nxug+nA/7HjG1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762397634; c=relaxed/relaxed;
	bh=//1F2fZldSXd4zL6XR1YnfH8iCnHuv1MEFR9YA5qNa4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nq1JvVq0tYxi2ZxSEpI/VAkYee0GNOYhMOYilcNiNbgOgTKDJSijuNQ6XF9lxBY7vSVzcv2YdtzGC9FFVKAAYfH8utmAAHt39Lb04dJhmKYkspPiPnql6WIZJ8OD0rRNiUQ5BwAwwleP2/p+HhWLBHkmaN80GAgECGlp2L6DCO0ukNuACgQyVOGireEQbyeb7lPI7gTbTpAKReD5Og4zx0DxstDNY3H0DxxOGTfq1DabemNGXJC6gbdIpgSr+N8ewK11reEx8lwNNhlPTWwfccmEqvryh5bQw3AMBaBgcmcDx7zLBxsvz5SJuohZmAWvxQeZMaCGb/QAiMSw+0w3+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RxpDVa+Y; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=RxpDVa+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d26G86vbVz2xS2;
	Thu,  6 Nov 2025 13:53:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL2sSxx+MCpP//q+SrnS5IG25f5/r4ieZ5NMXn/59yGC6NGXwZa+hato16zhpTmBQyUNkmcb4w/AgIOuAO3KzW8bMT1L05LjXCUTlpmeyRKKzJFkSjvKjpYW24yPvRNi3DsPTmZfFngvA+v2kQAXjBkSgQtgBFRfursK8QeKpCbADta9v9ZLHZikfmn1OPoFKqx6lLo/s5a0LXE2vDedDgk+t0+caKrMLznSqGD6gsf8VHkp+6Wq3LKhK8rOA0pSHa9uC8HbsvUgNTrdzPV06AV41IPG96g3iyufCZgr2s2yOmw6NrmO3/YbjFVFO13Sk6K007Z33BN+fMsSGCWjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//1F2fZldSXd4zL6XR1YnfH8iCnHuv1MEFR9YA5qNa4=;
 b=uKuGhetuLza92phMct1s8XzP+0W3uhdXw8djBZlz+GoMbPgmgxR+K+UdXUfYhPaPZfnhAQQN1Gw6fiS3dtrC5dwHIs1JfE9QBk/NNJyDKiJ/KoLRv282Ox1WVnR97wy2WveWF/GuGPELtXqe0CrI/aOKo1OmFvSiG0loT0VrcMh9EJ0Kkm/Q+VvyZMH2dkAHJW47DgosCvUg2XCBz30GK7p1Uvry7e3lkZxbufaDFBTB2MaEsyB2VXaRljj49P860LWcT01uzql9umIR270FcVnnGDpzmFeXS1zGTZrBYAdIefWw4YbLzDFj6Epg8F20Y9sqy7i19sACO/9n2QHg9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//1F2fZldSXd4zL6XR1YnfH8iCnHuv1MEFR9YA5qNa4=;
 b=RxpDVa+Ybtd2cYFv82rPSZq/uWoGajGD8nk/eXeVSBfYqbCzVtC8doF1kzuPG592VHepfg9aW1wFi4TTUcWM16yXhAiHIZ7dbjzOYTo1PdDcz8c7wNfvfYVZy/GkB+YJ9a7gomtPc04eRbiL6wMMJ/GHRo7oPw90sKZ/X1KtfNyPkN/4XPf4oedVx4MGjeb6cdMz6pVDjpoeIf9LRjtH7QOoPlL4hNGhDWkTfmUxCdAPMg0q+IIdBMSSXAMdYJrNesfP7uJswuoahOCgFoJMDc2F6uhRNiHOD6c/LXYw0qHIpMwxlE0qudwnLW71tc+5rkdzfmoLnEd9xH5t/UJ87w==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 02:53:27 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 02:53:26 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Markus Elfring <Markus.Elfring@web.de>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
	<clg@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>
CC: "lkp@intel.com" <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
	Mark Brown <broonie@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap()
 memory
Thread-Topic: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap()
 memory
Thread-Index: AQHcTnvUu7vgh4DDXEWO7dBdncSaCrTk8XZQ
Date: Thu, 6 Nov 2025 02:53:26 +0000
Message-ID:
 <TYZPR06MB5203380D58961A36922E0436B2C2A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
 <1a234e96-b41e-4f6c-b23c-e57426ff6aa1@web.de>
In-Reply-To: <1a234e96-b41e-4f6c-b23c-e57426ff6aa1@web.de>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|KL1PR06MB6395:EE_
x-ms-office365-filtering-correlation-id: 0088f0d5-dd2f-420a-de91-08de1cdfa8ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2xvTENPUkUzME1lcXl5SDNnZTNkeHNvWExQODVFQVB0QXRpSTBLZjNuL0RR?=
 =?utf-8?B?dHBTd2tvQU9XRmZvdWVldDFPckdxVFUyYUJGc091ZjZ6MnZpVk5UQlI4TlNS?=
 =?utf-8?B?cEp0V092ZldqSnpWUXJaZXkxVW5sQmFkaGlCM01RQnM5Wi9YeWhURVFqNE1D?=
 =?utf-8?B?WGVINFZjOUIyZkc2MlJCNEhuS05MSnVyU3hSY0xMTWRzb2ZObHU2bGFDbFJQ?=
 =?utf-8?B?VXlMQkRqd0hqbEJFNDR0Ri9LRHFqTWVXOENVeXNrR0NzUXZYNXdWd0lXbzNs?=
 =?utf-8?B?cmFZYVRiTiswSFJCYmt3OFJ0S2hPODIvNmJHNG4yRUhpUVVacllyVkZCeG9F?=
 =?utf-8?B?RHdaQUdEYU1tdEd5N2dLVEJPRjdseThacERkRnFFbHVBYzJGYUNIelhOYUFr?=
 =?utf-8?B?TXNySWllRG56SkgrZUpoanFaaHhVbUlQR201YTRBTmhreVlySlgvYmV5NWFv?=
 =?utf-8?B?QkNHRGhncjVaNGxrN2huM2dpM2JtOVRGRDMzdWZ6dy92bnNjY2FWWUx4Zity?=
 =?utf-8?B?V0tIcmFCaG1tQWRhQW9oeWhWM0hlUnJ2L0ozZGhRa25wK1lmUitFMTFaM09D?=
 =?utf-8?B?WTdFbElWM3F4dmhwc3AyZWdYODdoSDROR2Z5REpHK0FIZlllTlA1WUppL0tO?=
 =?utf-8?B?bXVGUGwvWmkvdENtaXowZUxKUjhqNXRLSVREVE5MZkFzTGFCYnFkcyswYWl3?=
 =?utf-8?B?WkpQQk41RmtCSjV4bTQ4OUNmM2wxYXpSY2ZOZlNyc0xhdndneGNjZElDZU0y?=
 =?utf-8?B?dHU2RWdkSDBBdzZEZkE5TnRNWGc2azB2Q0xwUXd0RzB6QlVNbVNtU1F4MGMr?=
 =?utf-8?B?cEVROGxGY2ZORFdqOGRrVTZUWXJnUGpCY0pza0VEY2d2WjdyN2VSRHEvT0Zp?=
 =?utf-8?B?aE5MTFZYL3AyTDhwcC9HMG9zU29HZDFhOFJES2lHNHBYT01Xa3pLZEszUjkv?=
 =?utf-8?B?Q1N5cEVkSERrRWQ0aFJCNG8wc1JJSUQxOVEvd3diSlFkWTkwTWo5bDJtaUc4?=
 =?utf-8?B?Z1AyVzUzRE0xcE5KQzlKM3JtR1JkNTZ5YVNaZ3c2dW1BZS9YdTY2T1NHMHla?=
 =?utf-8?B?SXZjRmEwWllRaTBoZFErYm5taUNkZEd5dmR3OGNuKzZPay9kdU5IWTYyWDhV?=
 =?utf-8?B?STZMTWR3MS90Y1IycDZwNS9lRTQxL0dNQ3luUnZIcURmRGpLRTJCNGNXRm1L?=
 =?utf-8?B?ZXYxNUZFSnlSbmpSS0VncXZoVEhXYm1JSjV4M1pDb2JtbG9CVDZFZUpEMnVK?=
 =?utf-8?B?MlVTT1RNWFNablFUR3BTbEpEV1FsZUZ4cnhxZWhxT0xuSEI2Umk5SDBiRTlj?=
 =?utf-8?B?R3pvc2V5djI0NkdqRGUrWGh2ay9NMEVndEowTVYzUWY0NzQxa2ROVTZBK2o3?=
 =?utf-8?B?djh6ckMvenQ3M2xJYzJReEhLdnVvMVhsYmVRbUR1MStwa051OE9LVFd1UFNM?=
 =?utf-8?B?UkZGaTR3bTIzY29qeHRpMUhUTzhzcnNjbiszWFRpS1JzbE9lcGhGTk5vN3Rw?=
 =?utf-8?B?TFE0YkQ2YlA0WFFnTEhlVVVncFBHdUFhWkp5WXoxM2JYSmxhbjlqc1hxc0hO?=
 =?utf-8?B?RHNZeVdaTVc2QW1tazkzTWRvaWZlNVZ2a2VSbXFnSnRSZTZLMm1XZ3BNUzN3?=
 =?utf-8?B?Zmh4Vk1jNlVBb2IvZGdxeWdNTDQycnk4MEZQYTlra2NGbHovNXhMR25OQW01?=
 =?utf-8?B?SnMzNC8yNE13N2JhZmR1c0dINnY0Qk90ODBZTVh4MnJCV0hzaGJwQlk4OHg3?=
 =?utf-8?B?SGpjckRKdk1oUUtVbWNDTVhMOFlaMXo3aUprZUpHTXJxaXN0MG1yKy8yZUcv?=
 =?utf-8?B?WDY2ZFNnMExNZldIQURzdkRnTXgzNWd3alc1eXJTbHMrYnpaenNIVTBRdHdq?=
 =?utf-8?B?SjdLdG9xWlJNZG52QWprbGlibjlTZmxBREZEdk9DdkRWUmwwRm5mSnZYSzlL?=
 =?utf-8?B?dzBkamVvQWhReU1BYzMrWHg3Q0tTMWlGcG1FYXE4SUxML2V6L2sxcVJESGNC?=
 =?utf-8?B?d0E3cXdKenJhNHBMTEJxNTgzUVR1c0hPejBIdlRNTjEwRWZYTi80SG1Fb24v?=
 =?utf-8?Q?sBdfX+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N21rdHVFcFJDQmhJUWh1UjRlWE5ibWJKbFI1QktaMTdBNmlhWm5pWW5kS2E4?=
 =?utf-8?B?c0pWbHZ2ay9HR3BOZm9FdU5tbmxob2ROUHZ3by92d3hNendNaVpRZXE5Q0NV?=
 =?utf-8?B?Ni9nTEM1VlQ3bWxLMXo5ZjRWSzMyYXpVd1ZqUE9KUVBpVnQ1akhCa0Frb3FM?=
 =?utf-8?B?NGs0b1BTWEsxZUZVanRCL0t3cU9VZk80NDRwVVVrRWF1d0xGZTdMUDhtS0tJ?=
 =?utf-8?B?ckdJRytKZURmM2t4a1ZhaFlQNW5pSXZuZ3BpNFFwT0tWSmtJK0JZaXV6VmNM?=
 =?utf-8?B?NWM3amk4WjhpMFBSK2hwVEFlbHIzMlZOVFdGdDRVYnJUTWVCNGI1cnRjLytM?=
 =?utf-8?B?L3M0Q25OYkhiTlQ5dXI5OVdoaWtJcm9RbkEwQk5qaWM0STRVUDhzMHJLaDd4?=
 =?utf-8?B?cWJtS1czSzAyQmhFcHM5cFJGSkVINlo5cEMxL0EweXd3OXFYUmoyZ3RnL1dR?=
 =?utf-8?B?aDU1aDdWT3NyYVBWR1FRcDg0RlFTdHY4Unh3SWpyWmhkYlE0UzFxM1dmYVNR?=
 =?utf-8?B?cklmVkhLNXNPQzNRSmdPeEFoUEE4MmpubjJVa0pqSkZPeVBGK25NbnY4U3hP?=
 =?utf-8?B?Tll4NEtBUVNTaVQvRTVWWit5czlGR3pockw0ek9kUHBxZmduOUQyejZKY1BM?=
 =?utf-8?B?RkpMRHEzRzJzMGdOcnh4U1BhQXJNeXlLMGpReTRrendRVXN3YTJ6OEFDeGs2?=
 =?utf-8?B?eVZZaDJlbk5Vc3B2a2c3TTN5a2x1L2x4OTR2SkdNdVZOVHhuZ25hcnJsb093?=
 =?utf-8?B?QXZIbkJrd011b01PdExLci9zSHNTc0JqQ01hb2NKbmhoSFBmUjY0SGhCNnlI?=
 =?utf-8?B?Zm94VkdsNzNVUWFPdGxWa2t0ZUxOOGhzaE9rdUZEWVlHZFdDZFNwWUw1MWFm?=
 =?utf-8?B?U0ZhNGIxZytrK1k4VnIyQUJjbUkyZ0hWQjNQS1NZa0tiNEc3azlIMlR1M29I?=
 =?utf-8?B?OVBGN2ljejRBYytWWEhSYnpHcXNsYThQOXJjV0RvZ29JYlFlSmVhMWFwZnM1?=
 =?utf-8?B?cnJvS3FvVTBSWlJpL2xsNFFPd2pNVGRkUlNuZ1dMbFpYY1dZV0I5TGg1dFdS?=
 =?utf-8?B?aXQ4K1RveFVEOEliRFlRT0RFSlBwOXNqOHo4OGd6a0wrL0I2WkFodko0RjND?=
 =?utf-8?B?S1R3MlU2a1lhNnE3NktkSU9LY0QwdDEwMVNXcDJGTzdITEduU090VjUrTmZZ?=
 =?utf-8?B?YWcxc1d6NnVzZndVZFpRZGRKdUtrQS9jMmgwb0c3cFRzMFJmUGk5VWVtQXFT?=
 =?utf-8?B?ajVSQTFBUWZZZHZDdFFrRm04VWhLTTRrcHIvSXNVaUNjSUlkSkxnTnowbXdu?=
 =?utf-8?B?Mm96VHhaNmR3bERRaWorMWlnQ0JlVHQwb0ptVjNkQU1lMWFka3g1b1FROFJN?=
 =?utf-8?B?eWErWE1TNlpzbDMyWUhIVm5oQVNoUTdZK2I3SWVUZ01WSGVaQmZVTzN0b3Jn?=
 =?utf-8?B?bzFXblZveHNkSVE5ZkNuUFlGQStRYUNRWG1uSHlHMjN2NHlXNmNMd2ZnR2s1?=
 =?utf-8?B?alJnZlJ4cHdOZmh3VGN3ZmhKTHlOdmlGSjE0L0doMnJ5ckp4RnE0cjF0SEo1?=
 =?utf-8?B?R1pFa1RhWmd6S09aMWV0Uk9FeWlQV3RMTnQrSDBNeUwvUlQwb1NudXc2T05m?=
 =?utf-8?B?Nk5acnFpWGZpd2dwS2pYVkFmQ1N0R3BnSW9Nd3hLMExMRjU5SlBHUy90N2p6?=
 =?utf-8?B?RjMveEZWQlhXNTJWZi9QZWUvdXJhNG5lNXo4WFNrdDZnQitWUkFOd21WRXYz?=
 =?utf-8?B?NWRPVlRzcVFGYUt6THBjL2FtTzc0VTlqdFI0UlBOWVNzZmw5WHFGQWllMGpN?=
 =?utf-8?B?RVVRY1BibTZpM3lQa3NrYlYxWTdXT1VNTFJGbEhaRkhjNE4wQTRUa0RhSklw?=
 =?utf-8?B?OVF3Q0l4NWhuZzNZa3dWVndwbzhCVWxuVzJWbXhsYzFPRTEzanNlekI3WGxn?=
 =?utf-8?B?TXFtVEpoQzB0Y1NLUHpSZ1kyN3NJR0lrekVnMWpTcHdyc09yZ0h1bVRwMXNE?=
 =?utf-8?B?VEZ3Y1Q5UUczbGd1ais2RjBsZkdncTlrRFd5c1p1bTRWaThVZHRhak9VT0s0?=
 =?utf-8?B?YlQ4VmYvc0lRbzVmTC9PdnkxRkc4Ymlka0ZWcFp1K21yZVhGS1d1dW11bG4z?=
 =?utf-8?B?SS9PQVZNRWVWUlpXclVFYzFxN2VjeFRpTjZmaTNBZ1lBcjZ4SklqZml6R3RT?=
 =?utf-8?B?WVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0088f0d5-dd2f-420a-de91-08de1cdfa8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 02:53:26.6373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 936wWJgnNsBS/EgeWbnk5nAupRukOXMMH4J2PHBhh81G6SmE9r8dN8xx+npF8MKvQOrwXkOicb/9Kf6rMB0jYspj6j4eG+sXSfSc3lsyhG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6395
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTWFya3VzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmt1
cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3Zl
bWJlciA2LCAyMDI1IDE6NDQgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc3BpOiBhc3BlZWQ6
IFVzZSBkZXZtX2lvdW5tYXAoKSB0byB1bm1hcA0KPiBkZXZtX2lvcmVtYXAoKSBtZW1vcnkNCj4g
DQo+ID4gVGhlIEFIQiBJTyBtZW1vcnkgZm9yIGVhY2ggY2hpcCBzZWxlY3QgaXMgbWFwcGVkIHVz
aW5nIGRldm1faW9yZW1hcCgpLA0KPiA+IHNvIGl0IHNob3VsZCBiZSB1bm1hcHBlZCB1c2luZyBk
ZXZtX2lvdW5tYXAoKSB0byBlbnN1cmUgcHJvcGVyDQo+ID4gZGV2aWNlLW1hbmFnZWQgcmVzb3Vy
Y2UgY2xlYW51cC4NCj4g4oCmDQo+IA0KPiAqIFlvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3Jl
IHRoYW4gNjEgY2hhcmFjdGVycyBpbnRvIHRleHQgbGluZXMNCj4gICBvZiBzdWNoIGEgY2hhbmdl
IGRlc2NyaXB0aW9uLg0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lDQo+IG50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuMTgtcmM0I242NTgNCj4gDQoNClRoZSBs
aW5lIGNoYXJhY3RlcnMgbnVtYmVyIGlzIDc1IGluc3RlYWQgb2YgNjEuIElzbid0IGl0Pw0KDQo+
ICogV291bGQgYW5vdGhlciBpbXBlcmF0aXZlIHdvcmRpbmcgYmVjb21lIGhlbHBmdWwgZm9yIGFu
IGltcHJvdmVkIGNoYW5nZQ0KPiBkZXNjcmlwdGlvbj8NCj4gDQo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0Rv
Y3VtZQ0KPiBudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9oPXY2LjE4LXJj
NCNuOTQNCj4gDQoNCkhvdyBhYm91dCBjaGFuZ2UgdGhlIGRlc2NyaXB0aW9uIHRvIHRoZSBiZWxv
dyBvbmU/DQoNClVzZSBkZXZtX2lvdW5tYXAoKSB0byB1bm1hcCBtZW1vcnkgbWFwcGVkIHdpdGgg
ZGV2bV9pb3JlbWFwKCkuDQpUaGlzIGVuc3VyZXMgcHJvcGVyIGNsZWFudXAgb2YgZGV2aWNlLW1h
bmFnZWQgcmVzb3VyY2VzLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBNYXJrdXMNCg==

