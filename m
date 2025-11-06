Return-Path: <openbmc+bounces-849-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84219C397F2
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 09:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2F7F029xz2yr2;
	Thu,  6 Nov 2025 19:03:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762416200;
	cv=pass; b=odzwfQ/QLy7W3CWrfbHQbQFE6XnCTTahVUd31z+3js9trMM/6IRQwBMRPB6qekbNbh+S18R5f86Am/KchFuZPECJqE+S6B76+o6CWKnMlRROBuDaM2lu/rqzWp7yaMuEcBEK+/G+1LEJvRT7Gd+Y/yxOJ0JgwoxnqubK2avLekMbNkQdfTD2o8YDw1O1cLzDEL5Lmp7TMxTrzGHkDg4nEo1bFLvAc38owETdZu5p3Bbxs8gzlLK7Pc4zBVNnkqGPrhh6nnQFeKxSkdbWyc9j6UgnVJ7xPqKT4GahnfNqEa/nQISB6Y/3BEWM1LJ5dL4CR00EqPtC7zDrqTDaeNaNbg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762416200; c=relaxed/relaxed;
	bh=qsiYif04K+/ZO3bXusstBRWzqZbcF5xkyPXDMYjJPdE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZYZZs1NzMvBZ23BuwU41ufEFUv6GRpLItjCo4+zL5soqslvmWwrLW+mxs2EljW6V1Zs0BwRZxKhTThpIKHQhkHIA5JuDhHxVndXkvOfRy3Mig1964tNGGaJJTNtg7orqUXtmuUtIykQDr3W8GYO+8ndoWDKv1rxdVvySJpesDhDvLGOx7qtl/k4KWKks7wMio7MW0o+xwpVKPzof8At214hv9W2FqsQ4NRdR6Wk4Oe7TNKFpWpL3tZj5WQETr3xECMDQ9T3j4CUIQcBtJMAaLC0cfnMLcrbUiYH4SD3ttWNrXiXErYt4GFyRnun2craaqwc7lcnNxOHswkj4oSfhow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TeyJx7lp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TeyJx7lp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2F7C4cZ3z2xdg;
	Thu,  6 Nov 2025 19:03:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3YjvMQNOpjREQ3qCpX2Lu3I+mVESLX9sxSBLSPQUGtgqXkkn0odOwhCS955THdyttUirsuWPEPZKa/XMkmmbfgL5aLIufVE4xXq7585cra8afXApwd955sVbxe/5eoyNjk1XRsI8VGY19r4wqiR33IEsTvE0VejkyW7DeV4vS+UVji65f2Wt1zVqHdyLKJoU4VM0O44K2C7X7rdLuid1emzISb3QDEP3v/+j+Tjxu4y2cEzX1r2Gukp5yd0g0VFmel3zepmJWgr4KsXDaMFdX9wburXmzc9ovOIkBXiUMrJjsGrHyCDZa1f6CIwArP7oCp75bSEoOIaqqVJvkoK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsiYif04K+/ZO3bXusstBRWzqZbcF5xkyPXDMYjJPdE=;
 b=gvxElQJ8DRGZeEa1knflP9AEMRF7hqR3IpGkqu57igxktN21pDE/r36CGkhqn6TgFBNEbxZfnJBevnuc83B9G1xU9kKiPMzLh8NnH1IuhtsEdqAgrDdeX7vP2oFCgVDVtbUUH6X6bgXgcE+9xeVOqJBPC8aDG2qvW5CfVCoJOeQl7gV4BXQEddhmjpB3V1ipKVe2ZIg2Sf5Up6X/OmIF2yyAt9lZb5Yphcs48kjtvJ8UWnu6Stt4yrd8NCCXRHqlepgCOwhon97YgRVDBYZ/r/A2ydhrC02StqQ4pwMAaWb19ia8g69T7L/L/0Lw0nkhKWS7eiL3j4tUFwIBlBy/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsiYif04K+/ZO3bXusstBRWzqZbcF5xkyPXDMYjJPdE=;
 b=TeyJx7lpiRGGbOdEy5Nd7XtJ1rkBphKekOMRiRygaaW1ynme//9adzWuUXFTx+bbUm3mcvpy6NZB3FQZsIQVLmz2brB9heSKyWFevignHLFzq6n3V8kAgQSv/mCMMftZ5ftAiL+Dx7yGR8ILyQH7X/s0XzaotqJPm9yz+YhpMWux9veniDG1vBWgRvGkFx4Fmp9niAmxdJdFmgT+WTIC2FiKI3Kj9QPpcDStf66zToCK1fbx8lrXsxiLAtKZRwslMWCOplf743LxSIqX7A3WsIocJsbheobFygRlwEZgOBAPrEInMh/j6i9yhpaK7B78q5Cv/silLY8sB+RbrPiwlg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SEZPR06MB5959.apcprd06.prod.outlook.com (2603:1096:101:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 08:02:49 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 08:02:49 +0000
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
Thread-Index: AQHcTnvUu7vgh4DDXEWO7dBdncSaCrTk8XZQgABIJYCAABCS4A==
Date: Thu, 6 Nov 2025 08:02:49 +0000
Message-ID:
 <TYZPR06MB5203BAC01F47F4CAB3809A40B2C2A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
 <1a234e96-b41e-4f6c-b23c-e57426ff6aa1@web.de>
 <TYZPR06MB5203380D58961A36922E0436B2C2A@TYZPR06MB5203.apcprd06.prod.outlook.com>
 <f8edb81d-f38a-4756-ab58-6bffd9ac501e@web.de>
In-Reply-To: <f8edb81d-f38a-4756-ab58-6bffd9ac501e@web.de>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SEZPR06MB5959:EE_
x-ms-office365-filtering-correlation-id: 237bd913-6b71-44b0-a81b-08de1d0ae10b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NGorcUhGb2lINkE5VWxha3NOUVE3M05iSVpuWlI1Vm83bTkwTXMzMkZvZDhB?=
 =?utf-8?B?c20rNzRLRVpIM0dUNGRMekViZTgvaXVPZGROb3NlMlRnVm5TSm5VaENiZ3dk?=
 =?utf-8?B?TjIrOEdUY3pHSGV6QWRUUWpZdUtyY1dxbHJvYWt2U1NiTFhZNU5mM0FUVVRF?=
 =?utf-8?B?OWxXVEQwUVRYWEQvT1lQdzNXaHJNbUtTbXgyMFd1U1c2dGVsV21ISkt4QWxi?=
 =?utf-8?B?Skw4OWg3TlM1VmR2S3Jkbmc2NmdFSDFYcHFDRmJlZllkQjRJY3lkZnVyeDNp?=
 =?utf-8?B?ZldMR01ZdlpHcDFmdUorY0JNbVFkblduOG90dHZReGdoSjVnUWhwRlR5Zkpt?=
 =?utf-8?B?OVlGNEdwbGlSYmpTN1F4algyTFlHSGhYaSs3bjlrWkQzbDJ0eTZUYm5PdG9R?=
 =?utf-8?B?ZExTdjduMzRDYzUyV3o3MjNjRTNGSG50THNFZTRFdEx4U3J5TXpCVHZ3UndB?=
 =?utf-8?B?dC81ZGVMTlVDTTZzRC9tczJSMk03cDVaV0NCMXZHOTBCNkxPZlp4Vm9jRXJC?=
 =?utf-8?B?TVlDMmNlOE5OLzNEdkhqc2kwM09UOXhqOHphNFhUUUdseTJwbXo3UUVIZW5G?=
 =?utf-8?B?TDdGMkZGMGhOYjdBeDN0c0I3bjFuVkpKVzZ4ajBqRXNUMXV5SnNrMVhrZ0g3?=
 =?utf-8?B?MzRNOE5WY0s5UzhsSVNFMTN3ZC85RzdZOFF5elNHcG1DR0JrOTFpRVJxQXda?=
 =?utf-8?B?NktQbndvc2JtTXcyZThhQzBkZkFnVDg5T09XRmFhdkN1YzN6cjJOTmVwT3By?=
 =?utf-8?B?b0Y3YU1UZ0E0RzBTVXpubmNVQjlWUDJPSzF6RlhjS0FkTHJoQ0VpOEtpYlcz?=
 =?utf-8?B?N2duZFhBQ29NdHpoYTd3RXFZSURIUnBzc0pzY3pyZkxaRmZtN1NBYTA2bk1O?=
 =?utf-8?B?YVFFc0FJWmpEYWZQL1Q3TE4zdi9lSUlqcWQrbWg4Zi9BVHdnN2ZMelhyRzZO?=
 =?utf-8?B?bmh0TDI5bmRTQnphdkliZkhiQkJLbnJBU1lzeFpnRGRNQzEydzJsL1dhVjdS?=
 =?utf-8?B?NEhpcmJLZ3hnbU52UG1WcjZwaGFuaVNwblZBV0kwbnoya05hUENFSVZpVFdO?=
 =?utf-8?B?cDhKTHdIYjZTU3MveXdydlFsMldaQkRhKzlmSG14YUlQbEhQSE0wbmlxcmhl?=
 =?utf-8?B?anpmenBOdDc4UTN4cUg4cmcydHdIa1BoNjVmeUdEOVMrS1diL1VtZ1pEd2o2?=
 =?utf-8?B?N3Z3YzRkdjhQZ1B0b2VYZzlhelVIKzd4ZlBMekxNVzhnUlBESXAzRXJIR0FX?=
 =?utf-8?B?VFdyM3lSTlFadU5EVlBnQy9XUVpUbUYxdjRFM0ZINUdXSGpPUmZOK0lEN0JL?=
 =?utf-8?B?bVJSSmRqR005KzExUGR4enladWZxZ3lnTllPRnowZ1RieVhFYUMyellKVXlF?=
 =?utf-8?B?ZjVYTzljdXA2NFJkZ2FBZDJiMk1jSGgxR2pYdENqZ3ZkVkVzaElSVG5KNy8v?=
 =?utf-8?B?MnBjYzZJKzNYcWJRbngxQ2J2Tng0RUkzUDBPdGNtSllqNjgyN0srWGdtZGFX?=
 =?utf-8?B?Q2w0SnlDTVE3N2I2YkVucEp3SmFYWkZKQjZDRm9MMEd6QWJ1ZTBmVzgzaSts?=
 =?utf-8?B?KzZkUTdSVFU4c3FpbHBaNDZKcFJrMHczLy90WlJuK1MvcThPMGg4UnBTMHZL?=
 =?utf-8?B?bnZyYjlXbnhUc1JWbHJJbkQyUWpuamJiT1lYSGg4YnBUTkVWOG9kcUpKZzVX?=
 =?utf-8?B?TGJKUW5RaHBocHRaYUEwakRSQTc4L0lPZjFpWTV1b3hIcm1iS0ZtUG14RFV0?=
 =?utf-8?B?SmZ6VWRza2ZBRm5LRUtPcTNJQUZrNFoxUFRXNXNFVzJoQ0hMRnY4ZlNiUEdz?=
 =?utf-8?B?QStUZ05aeHorbUg5WWF0eWc0Wkk5QmlJZlMxakJXN0txZ3RNVjNRM1NuQjdG?=
 =?utf-8?B?bGprT2V5TFhIenMxZHdGcERZTFpId1M1MllsNFJRc3IyT2V4eVQxMERWQ1Na?=
 =?utf-8?B?Vy96VEo1REVOQzNVaTUxT0dpUzY1b01WMkdVWjgzZW5kZWdJTnhaUVJ1M2Fu?=
 =?utf-8?B?cmc1QW5YMCtBRjVxcXdFdk1OcERnL0FEUTNuZzlDVXZxdjlHQnczRldjd2I0?=
 =?utf-8?Q?W81D81?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?amJSY1ozMGduTGlnalRZbmE4Y053UVlYT2N5OU1qZFp0c01VLzh6NyttTFV6?=
 =?utf-8?B?RmFlWldvaTlYTGIrYVMvN2lwYlpmMXR1dzdRWGloSElDTVZESk13NU83bHFh?=
 =?utf-8?B?YkJ1VU1EZ1lpUzRkdW5NaTE0WmZIKzRuSmU3OFM4OEhobFozZFo5WjRUNFBp?=
 =?utf-8?B?WEJWSlNjNTR5MGJNT0JBc1JzL1BmVGdWUGNUMS96R3E3Y2JZT09LOVlsM0R1?=
 =?utf-8?B?YkRPRXVuNU1YTTZrSTQwUFBPdGdGeGdUZHB1WXFqM0wwYlFqeXRSbHRNLzRz?=
 =?utf-8?B?dFJDRE1zczN2WXd5Rjk4S2cyaXkwUVVrZGp4NTk3VUlhNnJITEJIU2s5TTBw?=
 =?utf-8?B?cjkwQ01TVG5MVkJTTE9iR1QwczZRTGVtdTNwUDY5Yi95a3BiRWRnNDQvTUdI?=
 =?utf-8?B?NUVpU3ozdDRZa2lxV3Q3dzl5TjJEUUpNazMwUmErUml0S0huaTI2TitMVDMx?=
 =?utf-8?B?OWVrUkpnWWpVZmZCdStIbUQ5NDc1dzIzNXMwUGVGTzdQS0U5LzVlV0U3UDh1?=
 =?utf-8?B?K1lsZHY1S1JVZVdqZ0dLVTJEZStZOVliajR2Z1FwVkVnanYzM0p1eEZYSVgx?=
 =?utf-8?B?QWJBTHZqWXB3c1RuOTFRcy91OWdNbnpZSW45WHEwQ1BwUzVBWGpLWlVXSUFx?=
 =?utf-8?B?Q0pxUVdnZzMxTmlXSmFxRG1YNEtvRmM3cEVoL2ZlRDY0THZjQXVNVUpSem1p?=
 =?utf-8?B?T2RLSndtNDZSVlQwT1ZvcGhKSGtWaFRFTGg2cXd3bVJTSndPdWUybkN3K1Js?=
 =?utf-8?B?TmN0WFp5b1pNQmd3SDhRbWJqOGlxbjRiUFBSSk8zVHA2VTladndMWEIvOXE1?=
 =?utf-8?B?Y0lDZEp5V1JrQzB2MEovNmRQUTBJTzIzellpYWQxcXZIbVVMcG10eG1YdWxk?=
 =?utf-8?B?OGFTd1QxNjN2S2RLZ2NoOEJzT1NYZ2JVZi82REIrazNBUzM1WkZDTmx1K0lz?=
 =?utf-8?B?LzVoWSt5Z3hxdmFqMWJoR2J2S0Q3UFdsTmVSMDQxU0crSjgxSlI4YnJmR1ZG?=
 =?utf-8?B?TnVQS05zajJnSndNckVHaWhjZ0tvZVpsY1ZCY0xZMExtMzk5WDYxd1ZEeGFo?=
 =?utf-8?B?YzR4VmlNOWswZUlmRUZYYm9Gd0lRaitOdFlNYm9FcDZUZ2xZTW10K1JGbFFy?=
 =?utf-8?B?cFIvOFViK2dONXBDWFR0eU5ZakFXaFROR0pBYWVaVXNIbC93OGs4U3ZXZ1I1?=
 =?utf-8?B?OWNDSk5rcU84NGk2ajVNT3BPYWNWcFc3YjUyRUdCQ1kvV0VXam5zTDFMN3hr?=
 =?utf-8?B?N3hGVjhrNG9CZ1pkVDlhYW1BUExUVGtCSlM1eTVkS3htSXU3ZlBLeitKb1VP?=
 =?utf-8?B?R2U0ME1iZEE4YmpGVE5EWG15OUszTGFNSXR4ZzRzZnFyMW9CQ2tRb0ZBTHUz?=
 =?utf-8?B?YVNhQmFpdnJ4bThhMVphbkJOM3NIWjNxSCtodnJvYm1IMTIrcW5RT1ExcXZl?=
 =?utf-8?B?dktMUmY4S1VjQUFTSkNvWWp5bzdLVFhPRkVreThwYnVmSjdBK1dCR0lpSzZm?=
 =?utf-8?B?NWZrbWk2Tzd0dVVKZlhKbU1wTUdKdVprZmo3MkJ3anlMNEpHWTN1ZVNxZWIv?=
 =?utf-8?B?cHBqSTd4Vy9jd0oxVDNOMWErdXpWWVA2UmdFZUFmNjN5Y2VkbjBjdHFzUlNz?=
 =?utf-8?B?RDl4N1Y2dmZMN0Rma2lDY0ZQZ0VQS2pWUVFueEo2ZlJnVERDQzVwczVpT3Rs?=
 =?utf-8?B?ODVDQm9QSHdzSnU0anhyTDhDajNuZ1hUS2Z3TEFKcTZxUWRBVUdmTC9Lc0l2?=
 =?utf-8?B?cmhZdkZhSk5Ga2ZHQ2lIc0k5WXhOYlNwTXdxRTFNbTN3NDZjL3dmcFNuMlNB?=
 =?utf-8?B?VDVTaHYyNW9Ya1VoWU5wWno0cE5YWitSU09hMzkvMWllaS9qaXg4RFZIa2tW?=
 =?utf-8?B?eGlwRzJub0VqUkZqakEwdkJoWkUyVTRidm5DaENqN3owemY0eEYxK1o4NkJO?=
 =?utf-8?B?d0Jqam5SVHdjR1RDdmprOGt1WGRSQ2hkdjB6L3M2VUxuSlJTbytsYlJpL0ZK?=
 =?utf-8?B?OEVKclBXWnpCYjFXYXNGL1UyZjBvWENuUjRraVhZZ3BSeXJCQW1vc296a3Fi?=
 =?utf-8?B?QmNkdDMvTkdMUjBML3pDc0U1ZGpoV2tNRmU2YmhJNFpwMWVYRW9UYXF2VmRH?=
 =?utf-8?B?R1hJN080ZDJmY1pMRmhYVVdqUVJOcmRGTjBZb2M2SHdrRHRkUHR0VzUwK1Jx?=
 =?utf-8?B?L1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 237bd913-6b71-44b0-a81b-08de1d0ae10b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 08:02:49.5632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YR0fELnLT1v0J+gwtGj0aWN+hlT3YrW0Qz4Oc9zPdYoNftfzDOIZUH4S3w5XGYTxPMGiNCgMwdujriyivBuMyVK6ItTpWPmgNWm572AWH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5959
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgTWFya3VzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmt1
cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3Zl
bWJlciA2LCAyMDI1IDM6MDIgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc3BpOiBhc3BlZWQ6
IFVzZSBkZXZtX2lvdW5tYXAoKSB0byB1bm1hcA0KPiBkZXZtX2lvcmVtYXAoKSBtZW1vcnkNCj4g
DQo+ID4gSG93IGFib3V0IGNoYW5nZSB0aGUgZGVzY3JpcHRpb24gdG8gdGhlIGJlbG93IG9uZT8N
Cj4gPg0KPiA+IFVzZSBkZXZtX2lvdW5tYXAoKSB0byB1bm1hcCBtZW1vcnkgbWFwcGVkIHdpdGgg
ZGV2bV9pb3JlbWFwKCkuDQo+ID4gVGhpcyBlbnN1cmVzIHByb3BlciBjbGVhbnVwIG9mIGRldmlj
ZS1tYW5hZ2VkIHJlc291cmNlcy4NCj4gDQo+ICAgVGh1cyBlbnN1cmU/DQoNCk9rYXksIEkgd2ls
bCB1cGRhdGUgYSBuZXcgdmVyc2lvbi4NCg0KVXNlIGRldm1faW91bm1hcCgpIHRvIHVubWFwIG1l
bW9yeSBtYXBwZWQgd2l0aCBkZXZtX2lvcmVtYXAoKS4NClRodXMgZW5zdXJlIHByb3BlciBjbGVh
bnVwIG9mIGRldmljZS1tYW5hZ2VkIHJlc291cmNlcy4NCg0KPiANCj4gUmVnYXJkcywNCj4gTWFy
a3VzDQo=

