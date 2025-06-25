Return-Path: <openbmc+bounces-295-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16FAE93B0
	for <lists+openbmc@lfdr.de>; Thu, 26 Jun 2025 03:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSLZm22ZBz2xRt;
	Thu, 26 Jun 2025 11:24:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750840083;
	cv=pass; b=FGHYqzh6B+JP/jUmG2LX7veBzkAzoC3BDOUWtcYO6mDSKC1NSGl1oxhvGGN6csKcZU9m/x8LpjnhxOn94RuK9NnlrKdWr5fLJ0PaIS0Z3OA5hNBKQqKWj1XqpFW6HDnibW0fE+yeOaoRlbZbeorFxwKceBEMs31cX33L6zLOo4r/RxVwLdWqIhydUv08Kgi5QVfp1Cu2dm/PAXwuLGk8R2/1cdtzf8a2816gJ63MpBh9FjaV5poVwuD0jP2etWu0T5D4T+tE0JF9NnRWMO8nGqcnTdlPgMRiHxPg2uNqLojG43+xhiEbUNFZJcHSpRVYCqC2OuO44oYdgOS2IgXiiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750840083; c=relaxed/relaxed;
	bh=tAbHwFHUD0fczEesoLl2wC/N/HCbXp9vM1FUXTByOls=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gXu84RsbuX44PiIYY/YWxVRY0bzWI3Jnk+PwgQFPQYQMXGr/Jq5nI+rJ9G0oA51xQOcDpO7HrRQ7UwbTLqKZu63Uj2nVeWCbrm8tkUfKSRZ9rHv3z0e4prZy75BnatU61SBs0vF89XZeDaeQ4rcOK0V2Ru9ReeCgsDSD/zqfaqqUv/VXNTeoF5r9LwbWz3JDtHt4fSgnqpLdUDkkopaEF1sPIUwOK9hq4ycwhfUkAcwvp5DcmDu0q+MopXoif4FV7CUWTkVokjQpocX5I/swBfgC0BnIOGj5+E43bVBqIjJDy/HMwQ4nyzcY4LOMaHAb7/1Su49JgBiIXPvbcFOpag==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRw1Q0yJ1z2xbX;
	Wed, 25 Jun 2025 18:27:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2cTf0nCBYBlWGS9UMfJ0J4vgpebYEiBeR1yUG4XOXL7OaD6Q0dhgaMho1HE41RvJ8Jok/U5VaTWsFZL1ajqJVcrI+B5glQHpobHbXhcmNGR/j0nPy3rLBcj8Pkm2Bs6wNtOo6VjpYdYuuTHYzoz2njZSA4ouxn0+DWE/wC5mwDkYk95wlTX1FS91IHmMEIPSVt3OdmXm2oKlbKtlQqlcW0N7eLa1ZlcHjsaO7igX47Hvwk/3kkobrh90wKxvh3iFW2LrIWT3+uEyTRBkWj8OcbiOoxMfnhekjq+yUSuJNS6mbcml0t/0XXZAAmpTnU27X11zVRPoARTQNbRLd205Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAbHwFHUD0fczEesoLl2wC/N/HCbXp9vM1FUXTByOls=;
 b=XCxCg9+ZANRw3fKxkpPiQ7mituWyvgptRlwqVcgljMpQw4Gry5U0DzBqoxnmt8gBX/pN5M0VtQSVZ8VKpXmc6SKzVPOWtMHjCrFtUzRNOPoRusvwsp0nsucKoLSZwQYWkhMrtPlkmtareT4q6oUfCwNbOXRA6xrjJqIcyzd5VDgZh7ntk/CCQvL2rYnO39mBsztr58aM7AxvmgAPb5Y6GwP7yHMt1d15I+F6Y/Sb5oz4LBS4Taaye5DE5Xfcbk0CxvssgVP1p44FtQv9l+eG3xkfOqXjdx8bBKFw+DIEFgz/IxETl2zQJ3yRJbh2+YoA9VoaTXVfA0lDAsnK8og48w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAbHwFHUD0fczEesoLl2wC/N/HCbXp9vM1FUXTByOls=;
 b=QtPwl24ffYcLnh1/i5xKy953xyXeDXfOdYMumSngkWPHSdihz2n0n9gbC8AmRpHhesSh/IM5mdKPgvZBODiCz7BTrvElcJQtRIeR77aLxAc1FsDoqB/kSclc0xPApdkvl2XHnJfilf4yeKF+b4mIzX4O9StEOwDXQqiovJUByVxZFW/gcO/e+M95qwDihsU90KJ/5RkGgo4yW6uVfxaeEV20haCgUz+hMYOJjBMak2Hu2CoaAOPTMML3F5zdLlgwzA+6pMmYU1Y3Ioaybf5tFtUmqbWBqLBUmxswpZJkE2deV+oJXJ0d+3rHji2luBTEzhSr9FOhb8szG8+I0bAV9w==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB6045.apcprd06.prod.outlook.com (2603:1096:400:33c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 08:27:27 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:27:26 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>, "anhphan@google.com"
	<anhphan@google.com>, "wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject:
 =?big5?B?pl7C0Dogpl7C0DogW1BBVENIIDUvN10gQVJNOiBkdHM6IGFzcGVlZC1nNjogQWRk?=
 =?big5?Q?_PCIe_RC_node?=
Thread-Topic:
 =?big5?B?pl7C0DogW1BBVENIIDUvN10gQVJNOiBkdHM6IGFzcGVlZC1nNjogQWRkIFBDSWUg?=
 =?big5?Q?RC_node?=
Thread-Index: AQHb3BN5+/k5uKYPMUe/SI/Gdc6Yn7QBPt8AgApPrpCABvJ/AIABGqbA
Date: Wed, 25 Jun 2025 08:27:26 +0000
Message-ID:
 <SEYPR06MB51346BC9292066243CB845699D7BA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References:
 <SEYPR06MB51343F38D4F9C130A4CE3FED9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20250624152814.GA1477818@bhelgaas>
In-Reply-To: <20250624152814.GA1477818@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB6045:EE_
x-ms-office365-filtering-correlation-id: 9acf0b4c-dee2-493e-edcd-08ddb3c21de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?OEZ1NnpCT0hob3g3VUQ3aDM5aHBwUHN0QSthcDFsNitUajFVVDBIdzBiaXU0R2ZX?=
 =?big5?B?RnYyYzF5dTNLeERPM3FRUFJqK2hNZm1OMXFHRjZaZVpFaVRVVVdiQWpUODE1djY1?=
 =?big5?B?Sk9vNGM2YzFMc1hNOWNCa05TWlZpNW9kYkt2azdWNHU5SHBBL1JoV2gvQ1BsRmJV?=
 =?big5?B?NEdRdUl6MWFxcFJOaDNrOVhaaUpTUWdOV3hiTXZYdWpYSnlMRks0T25ySS9LVitr?=
 =?big5?B?c3M3UHRYaXgrZmRUYTR2c1gzZzg1cmhZYkV3cU1VYWZpTWNaeE13TVVoK1dtcWdI?=
 =?big5?B?dklZZDVIaUJtdHRLMU15OWhlekw5dkhwWGR5V01zRThOVmZXU0twOGJHNXVVSXEw?=
 =?big5?B?bmF4bU5xZkRBWjFBckkyQUJ2ZU01RUlES3dUTDFpTEFnUUozY0ZsTkJENzdSSGgr?=
 =?big5?B?dUJGSXYzUzNGdmlKaU9DcjZSa1dzTGFMQjJpd3ZrNWcwRWsySFNHdG9qcXJhNHNY?=
 =?big5?B?RGNONU8ycHBjQVJtTWpTeGxVSkt5UURxdzRtOHNvb1BiUWk2RWFSQ1AxRGhoVkVM?=
 =?big5?B?MEEydjVEYlZpQTQ2RjdhOXZTeXp5N1JmU2g1eHZ3N2JPL0J4dU1idWRWVk42cG1V?=
 =?big5?B?LzZ4ckw2eFB5c2lKcVJ6R3lsa1RiY3ZqSmRJQXdFZVpjblhjOWQ2Z3VFK2xxd0Ny?=
 =?big5?B?ZEovRjdaUGpuNHJ3ek1LRUJPY09ORjFDWHpHU3VSRFQrbzFFY2Q5Y3ZHczFUY0hp?=
 =?big5?B?VnBvQ3BHb3V4TTZoVEhKY0syNUpnbzhlSXEwdXo4M1k2OU1NSllacysxVEUvN3Ax?=
 =?big5?B?ay9kODJDODJJY3VpbEdnTWZNeHQxSnowUTZUeUo1OXhTVW1kbUFaOEhLdXhtRTV4?=
 =?big5?B?cmJ3OXJBL1N0T29icWw2YmlnUWpwOXkrenlGMndnOTE4Wk1PTTVEYVFDVXRGWERJ?=
 =?big5?B?ZnpMbUdJTEc5bVlDUHBHcTJ1MWtYakt4WkRldkdTSmdPTGxDRGh5bm05K3RsMVZs?=
 =?big5?B?NVRMem81WG95c1VUNkdTMHFHdFlOUzlBT2F1d3FjQ2JsenNxek9vUDhuZk1sVXhC?=
 =?big5?B?OG5CNktGOS9LY2dqSHJsZ0lEbXJtdldzTDdCMWczQmFZRCthYmZ6ZkRLcjYwVU5H?=
 =?big5?B?QVNydzlxMkdDTXd6TG5SNWN3TnQxT3VGWG9MNjNFR3FPcno1UUwrNnhKRHJxcjE2?=
 =?big5?B?UjBmM2w2cThpQlBwenhFREh5ZnZQSW9SZ1JZU2tmVXN5V3pmdXlNNjNUeW8wUm5a?=
 =?big5?B?YmFYMDBKNEk1a3g1YWV2WmZ3aVhwbVZ0NTY5L25uMXQ1WEJoOXFUMWs5YjJmNmkv?=
 =?big5?B?N0E3SHlGUU8wUlNoRWJCU0JIRklyL3VxMHJXZEJ4c2dUelJpS3RVWXBRb24reDdl?=
 =?big5?B?MmhmOUVqc2IxMmlxVjNGaE96RkROR2puRkh6MGxrOFl2VnY4UWtONjhwTklDRUdL?=
 =?big5?B?Mi80ZmhVT2MwNndBWlcwNDZuUjY5Uko2QWFQaGJVOUhpUVNaYjdIeDQwbGdDK2Qx?=
 =?big5?B?ZTJYa09nbCtUdjdIYTVKME91L1cxT0U0eURweTU3VlFkTG9OWE1vM3FycVp0VnVZ?=
 =?big5?B?Rm9qV0h1REoyK0JtcjZ1djJCUmpZTEZyZGhod2dTYnFTRXZMRTZPc1M4dGE5U0cx?=
 =?big5?B?OVJJQlVWMTRRNFR6b0tkdE5ndndISzM0QStLN09mSis0UHZCQnRKRTlDT21saHVQ?=
 =?big5?B?aWt4STJWdU1HZGVVaTJwTENsdGJpVStWK3dKQ1ZPZFhUVGdKR2NMSDQ2U2RSNnBv?=
 =?big5?B?OW1aMm1uUjIwL3ZhcXdHK3k5Q0RsdVVKbjZhblRUWUE4U2VIT2dUcDVONEJodXhu?=
 =?big5?B?THFsQmZ1MFEzNVBFZ1Z5djRFNHdEMjVtZytETjJyaCtDMjF2ZzVVbGJGRWxBZzl4?=
 =?big5?B?bUFNZjYvV3Mza0EyMCtwTzV3SFhhWHBNVXVsdXhaeXFkVDFGUnRoSEpmWVRlV1Zh?=
 =?big5?B?NG5MbThBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?SWlzaDBQM3NLWm1Hekk1WXFNMnJuaHFhemxycEtxc2NxSzd6Y1crSXZiQmRKVVFi?=
 =?big5?B?OEJlZUMzOFlTZ1M2UEJDTldqdWh3b1o4WTJ4VUFUMGFyQkxDZWVoZHBPUGRZUFRS?=
 =?big5?B?NHhrbUV1dXNkczF0YWF4WHNCU1FZRjRxQStLUmJ5VkgxcnI4cVpQbTVqRkkxdGxz?=
 =?big5?B?bzk5cDEzNVBxVHdnN0RWaGlobXNSVWFiZlV4ZWJSNXpUdkZ4WnNKN09TNjFCanBi?=
 =?big5?B?RlB0Z0FEK2pmQTRNZWFxcG0wVlJrQU9TVm1VLzRLeHlEOXlOWklBM3RmaVZBZHBB?=
 =?big5?B?aCs3NkU1c3hUaGpKVnQvRkQ3eE9jdmhITUlWVnUvYytaaHNzMDBFcWh1MjJ1MWVO?=
 =?big5?B?K2lTRjNUZERucmtpMzVHUkY3dERyR09kSTNXdnFHOVVuUjFVUUFKdVljRkVyY0pK?=
 =?big5?B?OWZ2VC9TV0h3QlJRODI0ck5YUFFWK2NTcHRYZ2krK01QSGRRVC80Zm1EajRRQ25Y?=
 =?big5?B?cFFTVlhSRkdiMzkvbXJGUi9iQTFzZ0YvMVl3WGMzU0lvak9RMXZLSnJyMmtjd3JV?=
 =?big5?B?Ri85L1BBNXIwaEphcEpZU09DSW5VTFkyekd2d1krYVgrSEUyL0tJRmdkTFI5RlNt?=
 =?big5?B?V0N2cEhHaGZ2c09HM1pGZ2dXNiszK1hidnJZUWozTmo5cWxUZ3lSSG1PeUcyYUk1?=
 =?big5?B?VCtLY2JUYTBkbEN0cjRYZzBHS2ZCbUpRS3hIYjcyckpXN25aUzNMVzdOdXBzei9P?=
 =?big5?B?YS8zODB0TlluVVA5OFJQWXRzR1lxQWtqbmpXdXVnWWZMYzlhNGxzb3ZpbEtoZXZh?=
 =?big5?B?K0V6cC85WXE1UGplR2tRQzl3dDFITVc5YlJuYUJJQ09Wanp5WUJpNlJiY2RXZjR4?=
 =?big5?B?SGNjcTBJbk1Dc3dGcTRDWlNSbno4UC9FYU9ZL0dPcHduVDZPemsxMkNTM2d3bUpw?=
 =?big5?B?aDh6ZU9BMWovbm9nVEE3bnZOd3k3KysxMVpWYlp1ZTluUUJhNExpYlRmUW9lUTc2?=
 =?big5?B?ZnRBSFlQLzB2enUyclNoenJ0ejJyaVEyYlNwTk9RcEQ4TXJwbWc4Y05kZlpFTkxU?=
 =?big5?B?c2daUThjYzZIMEh2QmZOSHhzeXpiNm0rbjJtZGU2eWxkaXN6YlF5TVdVTmJVTWRT?=
 =?big5?B?dVJOc0R5S2s5YkMrbUwvMFdCVDB2a294UzFpNElNSURWcHVqNjhSVEYrbkh2dU9L?=
 =?big5?B?UHhXUzBJblNPbm5hOEgxWUVWN1o3dldtZms1aVA4R1NjamZKMkN2Mmx5eU9yV3B3?=
 =?big5?B?N2plREwzaG1uZWdqekl5ZGMyS1hCLzhCZjR0bThXWjYrakt1MEtDVFdhMS9ycFVB?=
 =?big5?B?WFZLVHhJNTVvYkFSV1NFZ0Rwdys5ZmdxREsydlBRa2tGTXIrSVZtRTZUVzhqVW1B?=
 =?big5?B?cmxmTVFZbUFWalR1SFNlODM3QXk0VE1MdStFZDFyZ1hMcVhIMVRkMjhDNEtCZ1dk?=
 =?big5?B?eWVJdVZkTjIvYWpZWGRNR1diTTlGL2FZOXFXNkdYWDloVS9mdlh5MURHZUZaZ01B?=
 =?big5?B?UHROSVJuMEFvNkp6TmlHSHZBL1R6SzY2aHpOdk1zMDcyakkvWDIrY01KWkpsdWph?=
 =?big5?B?VnJTN1dia2p6dGpyZTVCMXRIR3NadjFOZGpOMUVoNXUwSEQycDVqVE10SmhtSEJC?=
 =?big5?B?bFlrRlhJK2JrelViNHdWclJiOGNaUEl4R0tOa1FEQjNsMHJ1b1J2ZlY5MzRjeG9J?=
 =?big5?B?SElOV0llZUt4L2pkdi81MElZNDB4RmozSmtKNFBpUDdyRWtmMEdRWnNEb0VRSlNp?=
 =?big5?B?MjJPYzVsWXBvOU96MU9lSitlbEdkaGYzU2x4cDJMNGdvRmdqTnlNSVYzUXVsSjdW?=
 =?big5?B?Q2dhMmVJU3pnUERLeW1LclBrenorclpneGZkTTJEMWc0OENjU0YxT1VIYVlnQzQy?=
 =?big5?B?T01nWXJXd1hOdjdjU09iUUxKenBuNkwxMFl5ZXJwZkNSSUtYeE5VRzhTUm1ML3RE?=
 =?big5?B?N0dQeDdIOE9rWTFvR3R3ZHdvek1YYTJyVEVJZlYyemhYOERZS2xYaEJBUmVSeisy?=
 =?big5?B?QkNJNFpsVHo1T3dlY0c5dU4yWWVTUnRqcUw1WUp3YmpBcnA5N05McDBXbmFyYmZJ?=
 =?big5?Q?N3BoSvRtEKds9BLT?=
Content-Type: text/plain; charset="big5"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acf0b4c-dee2-493e-edcd-08ddb3c21de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 08:27:26.2282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yiupq+6v2FYrGYQsMM3BfstK3EE2H6lRPM90Z+xHbCCjt01PaLXse/39gbSuaZETbE0BxLiL882a8fhsBpGvOm3xjT1yYL5FUqC++gf+Cr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6045
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ID4gPiArCQkJCXJlc2V0cyA9IDwmc3lzY29uIEFTUEVFRF9SRVNFVF9IMlg+LA0KPiA+ID4g
PiArCQkJCQkgPCZzeXNjb24gQVNQRUVEX1JFU0VUX1BDSUVfUkNfTz47DQo+ID4gPiA+ICsJCQkJ
cmVzZXQtbmFtZXMgPSAiaDJ4IiwgInBlcnN0IjsNCj4gPiA+DQo+ID4gPiBQRVJTVCMgaXMgY2xl
YXJseSBhIHBlci1Sb290IFBvcnQgaXRlbSBzaW5jZSBpdCdzIGEgc2lnbmFsIG9uIHRoZQ0KPiA+
ID4gUENJZSBjb25uZWN0b3IuICBDYW4geW91IHNlcGFyYXRlIHRoaXMgYW5kIGFueSBvdGhlciBw
ZXItUm9vdCBQb3J0DQo+ID4gPiB0aGluZ3MgaW50byBhIFJvb3QgUG9ydCBzdGFuemEgdG8gbGVh
dmUgb3BlbiB0aGUgcG9zc2liaWxpdHkgb2YNCj4gPiA+IGZ1dHVyZSBoYXJkd2FyZSB0aGF0IHN1
cHBvcnRzIG11bHRpcGxlIFJvb3QgUG9ydHMgaW4gdGhlIFJDPw0KPiA+DQo+ID4gVGhlIFBDSWUg
UkMgdGhhdCBkZXNpZ25lZCBieSB1cyBpcyBvbmx5IG9uZSByb290IHBvcnQuDQo+IA0KPiBZZXMu
ICBCdXQgdGhpcyBkcml2ZXIgbWF5IGJlIHVzZWQgaW4gdGhlIGZ1dHVyZSBmb3Igb3RoZXIgUkNz
IHRoYXQgaW5jbHVkZSBtb3JlDQo+IHRoYW4gb25lIFJvb3QgUG9ydCwgYW5kIGl0IHdvdWxkIGJl
IGdvb2QgaWYgdGhhdCBkaWRuJ3QgcmVxdWlyZSBzdHJ1Y3R1cmFsDQo+IGNoYW5nZXMgdG8gdGhl
IERULiAgQWxzbywgdGhlcmUgYXJlIFJDcyBmcm9tIG90aGVyIHZlbmRvcnMgdGhhdCBpbmNsdWRl
IG1vcmUNCj4gdGhhbiBvbmUgUm9vdCBQb3J0LCBhbmQgSSdkIGxpa2UgYWxsIHRoZSBEVHMgYW5k
IGRyaXZlcnMgdG8gaGF2ZSBzaW1pbGFyDQo+IHN0cnVjdHVyZS4NCg0KVGhhbmtzLg0KSXMgdGhl
ICJwY2llYyIgbm9kZSBpbiBhcmNoL2FybS9ib290L2R0cy9tYXJ2ZWxsL2FybWFkYS0zODUuZHRz
aSB3aGF0IHlvdSBzYWlkPw0KT3IgY291bGQgeW91IHByb3ZpZGUgc29tZSBleGFtcGxlcyBmb3Ig
dXMgdG8gbW9kaWZ5IG91ciBwY2llIHJjIG5vZGU/DQoNClRoYW5rcywNCkphY2t5DQo=

