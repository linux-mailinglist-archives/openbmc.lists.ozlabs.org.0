Return-Path: <openbmc+bounces-515-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB423B37876
	for <lists+openbmc@lfdr.de>; Wed, 27 Aug 2025 05:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBTxv5Znwz30Vf;
	Wed, 27 Aug 2025 13:08:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756264115;
	cv=pass; b=HByKOg73xioDSdlbKeWPjDIG/yLqIJ/az1NM1EK56lYjo/5J4bccE1951nzjVrevHdyv6x9WPQkLKMMQui0a/Lk95GdK1Jz96HtXqcp/UOLchshqwl2Dl3PC5ftmZbzc8mC3vK0aPVicir0LhXfCxso4D4OVDu588DWtCRFJQmvwci8enb4WbmfXKYga53KVnM8IDtVN4KEbwsteJlQZOyvxgaTNaGSsloFyxzmwKXEleQVtmr/31oTexf9tNVswlnEe9UqETkzKjECXF8zUrUBKCE2ssQ708WSHoDuqUh2ctY0G9V7xt+nLf0W1Eh55kRXxIWFBgpXjHDG0Uta1GA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756264115; c=relaxed/relaxed;
	bh=OpEUc17VqVklO6t9o2AEv5UCbgiRQ0q1LQLAgdQIFjw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BzHD4z3PQSzLABj5BN4TJ1wh8DcwoSS6tfXyVYmnyAtXd+UVWK2GJzMJNIfZ00MENBeagFCJHPY54cH7YOCWC/oYoHelmswoQCN0X0eh62S4+PpbUMM73WQMF/t0zHt1Ocrm3bFRJoimHBjU/KwHH5lDhUPfgAnnKHOl/QCWKqNBJTrdUkDQrIZm1CDmikWjmlwvxamn5NkXQ9nfgw3/Ml290lFsNd9puI0azjoZzW9CimmbO1N08R+onZtLTD6yCDYtArz5lvRbS5hu0dDGJ2HD9GtE+vS7GkeJjIQH/1GBJ+a63X3825lLL6d5bIenckYCK2P8T3hDiJOIton1EA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=MNljSEI6; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=MNljSEI6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBTxt3DBjz2xcC;
	Wed, 27 Aug 2025 13:08:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYje04uQFO2Bwz6nLdAoBjri5xPjk2jO0RqMe+37GVzx6gWQZGOrLiUfNto67bpL2wpSB3se0GbcHwpKg0X2jDiknHmuFcH7JaNmxiHFO2pWehe3uoDmzaYwXKaYWN7Vlnl5lnb3v9lLPXNecykc3HZkZCdkDWiTANhsjKuHazdkAGTrz7QAh2UpkbjC19gDqVPTY6Prpcuzbwvn0/E7LKbyBHOdRXmJmYfW8BZsy649XcZdtMZNdLhe6HeY+ltUTPUdRDU91D1tdB84rXVf7SPHC+wymCPaLW7APhZDI2QDcYXdloRktcYnDSKGQOGnjR3t++VdSHpx+hCv6kNMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpEUc17VqVklO6t9o2AEv5UCbgiRQ0q1LQLAgdQIFjw=;
 b=KMtMMx2w7hDbeW/TsbNty7OjekIMc8cMZycPU41jgdn5V+CsJK9p+PASuxSAznlsImcNPWIRXWK9dgPnlrrqdxQzgeiWZ6jvYI3RFJWqEU3s/4lfhJqWetJuW21wlqsSoylx1tx/WR2Zy5b71ptkU4zIMQGOKsZ5mITVCPdfxp4me2ansO0k4OgQgWenXLHc6Oz/lai8MWK0QmTMRItAI+YuYeQa+LFzS9/L7O2QR6UNYU0KMuvQQTbZphdsiYcX1BsK0uQehvUt6AzNhd+Qds+EtHM8vbovscVdx0yUIQr8DdC9qhpwhxMCFXydvkyZAEiAl2AjrJipsQibqq4blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpEUc17VqVklO6t9o2AEv5UCbgiRQ0q1LQLAgdQIFjw=;
 b=MNljSEI6KGW2REJsVhkuVag3/PAQKxCSvUYS9+qlpap3bK4f4V+Vv56Pw/GWne5mpy1GG0xw/X/INtpD9ZyRESsEVWFw0Xg5mF+BPJsunW/UQSyxNF0MX/FXVRL572wwgWdgd7U+MhOjKIdFGsAbAZp7hnqkwtB6GxSK46GV9TRGYl66nbhLaRQ6ZhQ00Vy/oGcZ1/e1IqgrWmkHbRoHUEaJDOB0Ve7QeM9KokYLxlvd7XC4nSh2R/JMCorIk6pKBtTDhiHNTDrhVuTxtJh1++/9lUjns+20hnCMK5MgZCC+o/iE9AZYVTsvLFUoczSOvjebqJ04dpVMuWLPHPk5lQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEZPR06MB5880.apcprd06.prod.outlook.com (2603:1096:101:e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 03:08:09 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:08:09 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
Subject: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
Thread-Topic: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
Thread-Index: AQHb9TqkZIPjABfTrEyMyLl2n5mCDrQ/neKAgDZ1WqA=
Date: Wed, 27 Aug 2025 03:08:08 +0000
Message-ID:
 <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
 <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
In-Reply-To:
 <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEZPR06MB5880:EE_
x-ms-office365-filtering-correlation-id: c06b22f7-b7dd-491a-cfa7-08dde516f35a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzBjVHlSSng3V21EcXROM0ZDaXQ3djR0Szh1cm1KdHp2QWEwb1JXWEc5WXQ4?=
 =?utf-8?B?RmRWRVJYNzVCL2UyMHF6a2JWRzkrUlZQUzl0dW5HdlFSeXoyTUNDS2h2ak85?=
 =?utf-8?B?SWRZT3hBZ1dCbTJOT3FxVHZhdjZVcTQrMjZGNmNzaEVPc1RxZ2VIbC9memVm?=
 =?utf-8?B?SXB1RHNOcXNjVkJqa1RyZG4xelp2UDBmTzI2WGFveC9ocnQ2UFdDMEtXeTZx?=
 =?utf-8?B?dTgxUHpUckhJQTVuYzFHK3RET3R4R25tVHhjZEdweUd2ZHZzWWZYbUFFTUE5?=
 =?utf-8?B?QjY1Sk0xSW5aTW1QSnVPSFZVM2RGVmxiR2tBODl6K1YvQ1dYRXdtakVCTEVJ?=
 =?utf-8?B?Ym1JSE1CbXNhS1B6N3RBcVV2M1praEFRN3JKMnhjZFJpbmhFK3JRaFpXcmNZ?=
 =?utf-8?B?dE1GUjdSLy9uQ3Z5aVdUT2xPVTF2TlVROHVSWXlWVXVGeWVMc3lUTTdWck8v?=
 =?utf-8?B?OUd1ZTJqWmIzdEs2UlhuRnNoMk9Ua3FPY3JQMldFcklldEdZQm9zeWxVM1Zu?=
 =?utf-8?B?dEViR1c0azI5bE9HdW51WnlFWjJDMSs2eVFFMlZ2Z1hSTWEzcjkvR1JVSk5E?=
 =?utf-8?B?bkZnSHA5KytER1FRWlU2a2cwUTRPUjZkWFgrLytKZkxtQUIvN3BhejdZTGN5?=
 =?utf-8?B?cUdYa1I0VmFlKzYxeGNsU1V4Vkd2QUtuZEJRbmNtWXo0VDZkc203ekpFU0J4?=
 =?utf-8?B?ZjBCYVNsUlVXbVJISmNrMWllUEV4dW9idi84L1J5dlZGRXFmZjh4RU51Tnp4?=
 =?utf-8?B?elIvWkJXOHc4K0ZVTHphbVdIcFFoeWYxNGFqajgzVDlsWElXcU9PeGlQbjk0?=
 =?utf-8?B?Q3hZMlRDSXJBSXFFeFV2d3ZZaS9uWmZPLzdJaGVvMHBKSHprL0doM0tVblRz?=
 =?utf-8?B?bjFGSUZBS2tGRi9oZFFMSm1WNmd4T3pLMVoyQjBWbmlacU5JQUc2Qk5keS95?=
 =?utf-8?B?ZDhnckxiSU1HeGc3SFR6Qnh0Y3EySzZEeksrVjBrZkV2Mit3WlR4WVNUYWRK?=
 =?utf-8?B?YW5UWUtLd0ZJc0tCMktpMXBLVjhLeFUweWtCYkxzUG1wM3hITGtMY0o2SDRT?=
 =?utf-8?B?clVKR05YRnJEWXF4dk9vbmRKY0IzYUVSdy9SSVVaTGduSEVEKytFQWhzZnNz?=
 =?utf-8?B?ZlUwZHl1VGNOSkNNbktWYXhIK0dvMnd5QlE1LzhDOXlXZHE4a2RZK3N5UFBT?=
 =?utf-8?B?WmYwdWRVMjdGdEpCWVh5NDMyQlpVNG9ONk5jeWR2Q0w0VTBlL0tCNmFDVU5v?=
 =?utf-8?B?MzJIcHZjZnUzRUZuWmNYUGQ0WG14ZjVoYXJuZ2VIdDNQM0hSSFJ2M3RjSXQx?=
 =?utf-8?B?OEMvWCtiRlhMbGJ0bUdhODlKSmVqdXZSYXZRaGFwK1YySWZWdHozeXpWRndE?=
 =?utf-8?B?aEZVbitFVFA4YXRON2YzSlcwcmdLTHltTFVoSy9DVC83NG56SlJHeE1qNFFR?=
 =?utf-8?B?Q3ROejMybERKU3ZidzczWllaYXlUS0MvVmgzNmRnNzk5RlMwRDhuV2dibXAw?=
 =?utf-8?B?RENMdzBjRUpNdE1CTVRFSmpLT2s5bU1tTlQyckxZMHpsdElaZ0IyMXlBL0My?=
 =?utf-8?B?WGJwQ1dyT0htNlZmS0hFb0tRajdjTGZYbFJCM08rbmRlNUJ2T0NwSy9HTnB0?=
 =?utf-8?B?aXB6MWhjSm90YTk2SzA1UEFlTkY1VmhFazhEamdqZEdHd3Z3bzFnVUxob01v?=
 =?utf-8?B?djFCR0tFaTd0NVZEQUhDTmRNbjdDR1ZFWjdyWEM3aWZ2UHJrRWlxbWtVTitp?=
 =?utf-8?B?bStBSVFid2tqSkw2TVFQcEo4Z1p3dkZzWTVmajh6MTBWZkNHRzVaU0VxUUJN?=
 =?utf-8?B?ZElZZG8rVkxWNmhLSmhCMTlxZXJ4ejNqK3ExUmF2MXhQN3drUnpEMis3NldH?=
 =?utf-8?B?QVd1TnNIZmVmemJmRWlsQWZHcVN5cG1lYUVDSTlXL2F1UG5ZOTZxd1ZyTERZ?=
 =?utf-8?B?SnRkQWUrQXpNYndQU3FtVWpPR2ZFeVByRWtnalVNUERPSEtmU0RKVGdoMjBY?=
 =?utf-8?B?NFVFNU8wNm1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHg2WkdGTUlOS1g2cXJTalBLdmJxMHBqUjFWOG53bGVCWHBEZjViZ2ZHek14?=
 =?utf-8?B?RURJc1JMR1MvRS9Ja2lKcWpuM1NUYTRVWGlOZGo0WTZkdS9RbWR0bG1jbUpL?=
 =?utf-8?B?aU9JM2FPdmVZMDhScXNLUFZmMC8yM2IvSWRWLzN4Ky96cTl5cFRoVVpTdGcw?=
 =?utf-8?B?Yjd3clBsNm8wS2tMbDdORnVhM083QlBURzUrME1pMkV4K3hSOTJvYm5oS3Rv?=
 =?utf-8?B?STQ5aUJzbTJ6a0s1MTVPaXBRTWJ1VmYwb2h2SVRrM0EzcE5LQzR4bUtJL0ti?=
 =?utf-8?B?cmRraEcrZ1JlbkFycEwya1FGeGt6YXVWdXhNb3A2WDE0a0VGSkFIeHNhQmt1?=
 =?utf-8?B?eGZ0VFU0d3RyeVIwK1k2UlVZUlZXeWF5OE1hckJJdVloSjRxZVZDRGR4V3dl?=
 =?utf-8?B?c3Q3TlA2S1lDMW5Cc2pJOFgxVG1FdENpNmtCR1R2dmk5SUpjc0Z3Rmx4ckpX?=
 =?utf-8?B?eTJ5RUhaMk0rZnZPWDV0ZkE3RjdCVE1Rd3ZRMHFtdW9LbXY2RHp3aTZUQU5K?=
 =?utf-8?B?ZFRJMmVqUTMvc1lkV1RzVGxtVzR5VzB4ek1PNG1XN2dIWjFOTEhRd3V6b0Zn?=
 =?utf-8?B?SHhYSnp4YlhxZWtHcVFWeGltVmJBUnVtODliNmhTakFIcnZya05haU1Xa2xl?=
 =?utf-8?B?Ly9aNGFFcHErOEY2WHFGWHZMNlNLSjBDZEFUeVRFRUZDcW5YdDl0dTFXUWha?=
 =?utf-8?B?dm5BYk1sa0ZDaVFmcVp6YlQ3WXkza01OdzVWbjJjRTZ4TVlWOGVVNUt6QjdK?=
 =?utf-8?B?cS9wdnIwb0N2NWpjOEZmVWVXZXhYV3ZVbFFUTi9wb2F5aUZEaWpiV3dHUk4z?=
 =?utf-8?B?RGJwY25FSHhJYm52NyswcVRjMEJKQW5wenZVNXE5ZzlwTnlDNmVydTlGaFk0?=
 =?utf-8?B?aWRUU1VBOXkzYUxYYzE0anBSdlc2ZnNaMjBKakt3bk11NzJlcnQ2NVgyZThJ?=
 =?utf-8?B?eW96YXhWazZoL3UyeHI5ekp4RmVMVlhmT1B0Y3VIMytFcW1nRUlheDVXMG51?=
 =?utf-8?B?OU1waXRxa0VjVjNRZWUxU2FSV3IxaU1vQkV0S2NHdU1RRVNoeVFpRWJIQ2R2?=
 =?utf-8?B?UEZBNEc5OVc4S2NIT1NMRzE3N00vbFkwMUY5VGpGVFZiTURhcWVOVEIrUFBD?=
 =?utf-8?B?RjRDc1BwaXl6REdaeE5jd2Yva3I1Z1YwQm84UFdSTE84N2N6TEJSaFFUWTNL?=
 =?utf-8?B?V2lsSVlINDVjOHhvbzRtT3JtandpN2EvUTZkL051ZldtL0RIdXVFTk9FRS9M?=
 =?utf-8?B?WTJwQm9wdFlhODVPdXdiTjJzcWcvNkFTSERRYXNJallBbHRGc3I1US9vcGRi?=
 =?utf-8?B?T0Fya3FpRk9hTEpsYnJkdUxoQ0p5TGhiZ1Z4UDE1cElIZFJwZEdMRHFNSUxx?=
 =?utf-8?B?ZTVIc3MzcGdqY1J3aXkyd3hMZ3UybWFtM0xYa0VYUFVMdFdNY2gveExlQnRr?=
 =?utf-8?B?MCtlZ2hhZUphOTVEWFNEU2xISVVYZzdXVys2YkpSMVU3Q1dOdS9kNm96d0hl?=
 =?utf-8?B?cllLblBwWWRUdkx4bGNyRTJDSFJHRlRUNU1rUlRWeE1qa1B2Sm9hZTJGZkZN?=
 =?utf-8?B?UkZNeWp3RDVrVDRKV1ljOEtsdlRNUHlOdjJHN2l2eVB0ZjhBa2d3WGdJc1V5?=
 =?utf-8?B?LzZuSFFTaHVSQTAycmhBb2JTS1JNY25jVVNuNWtiVGVMV3dPK3p2akdiSjRI?=
 =?utf-8?B?SFhxZ05HdEY5SzE0N0dkR0pxS3B1YkVHOGJaRm03dldxYS93U01UZHFTTnUw?=
 =?utf-8?B?YzZ4dUFUbU5LVnpmMHF0WGQ5SGtSZGhWNUx1b0k1VllibUVHMnhLZDRyVnNk?=
 =?utf-8?B?NVVxZUhTZUtYeXJWNTVRUjVPVXVLbE1uOEhLMjVZeGJ6Zmsza0tnYlhrNGlI?=
 =?utf-8?B?amViMkgxVUxUMHBkcFFaWTdJU2t3ZlgrUXpQMlI0RENSMnRQZ00zaHk2Z0hN?=
 =?utf-8?B?dHNSK1RaaElJSEtBY2JsTlMrY01BZUNkVDlrNFlUcjJMR1MweC8wQnVSNU5Y?=
 =?utf-8?B?Q2J2NUlmVTl0WVpNMUowTzYwdkxLR3VwdHlqVlU5REhmM3ZtMDFqeUU1N1I2?=
 =?utf-8?B?OXBreVRLek5TM3RzQ2g3ejBzNkdHUk1xQkIreWdTWWFRdUJ6R1RjNjVlNGxF?=
 =?utf-8?B?a1oxWHRSMUwrdUJkVTJ0b2htbVY3aXVQYjNZTkl3R1hVT1NSV0ZBMDdDejRK?=
 =?utf-8?B?bXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c06b22f7-b7dd-491a-cfa7-08dde516f35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 03:08:08.9776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: szVCwI0YC24lbJQsQky8jf2DXwIiRhZ4ZvYd/uu2GTvGaII9ZCF7nSpEylJQaHRwMMhs9H7BKJx+dspzFYOam8Tm/qVc80AwaRlXC1QoRME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5880
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTGludXMsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4NCg0KPiA+IFRoZSBQQ0llIFJD
IFBFUlNUIHVzZXMgU1NQUlNUIyBhcyBQRVJTVCMgIGFuZCBlbmFibGUgdGhpcyBwaW4gdG8NCj4g
PiBvdXRwdXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNreSBDaG91IDxqYWNreV9jaG91
QGFzcGVlZHRlY2guY29tPg0KPiANCj4gVGhpcyBwYXRjaCA3LzEwIGFwcGxpZWQgdG8gdGhlIHBp
bmN0cmwgdHJlZSwgd2h5IG5vdC4NCj4gDQoNClNvcnJ5LiBJJ20gbGF0ZSBpbiByZXBseWluZyB0
byB5b3UuDQpJIG1pc3MgdGhlIHBhdGNoIGZvciByZXBseWluZyB0byB5b3Ugb24gdmVyc2lvbiAx
Lg0KVGhhbmtzLCB0aGlzIHBhdGNoIGNhbiBhcHBseSB0byB0aGUgcGluY3RybCB0cmVlLg0KTWF5
IEkgcmVtb3ZlIHRoaXMgcGF0Y2ggaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGlzIHNlcmllcz8N
Cg0KVGhhbmtzLA0KSmFja3kNCg0K

