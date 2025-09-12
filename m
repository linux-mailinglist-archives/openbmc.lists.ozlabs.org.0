Return-Path: <openbmc+bounces-641-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D424B54765
	for <lists+openbmc@lfdr.de>; Fri, 12 Sep 2025 11:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNTcd1CRTz3cmx;
	Fri, 12 Sep 2025 19:28:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757669297;
	cv=pass; b=TConQd3YYrXs5Ld+D9joATxFjIl/SABRVwGQtVOLZmMwH6UunT6eCU1jPG5A9h3Vmlei1I5c+Db8vI2KFXxotXhn24ogOsjNVcNJ/kO8IJbIIm3lhpSST9wcs4uzEDqyUAjAwlwM83Osq0ZoEt6L7ccyH7HaGoFlHGFJ0bSsu/cR0Oth/WU+KoZBbamoPN3WtHscVHC4WlIDwYTbaaEO4lgwvbH34c7T3J4Hj9rSYWCz7hFJLRP1vBtxKySlEWPwXGqnox+HHCQDXVGjirNUtOlNGMwRpG/3qVfnrOjcMWnUb/7VybBDA4Dh6+6L69FluqcpTJanBk9D7QoQU7V2KA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757669297; c=relaxed/relaxed;
	bh=CtRlLOnEkrTy1giDQFWVdieiUcOOA39r7EYeGTQWbzU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZEPRB6WDOilaimS4Exej9mqY9lwbJ0QsUEU/tANQPoJAM5/jrIqlYx2dVFos7i5wAi2AvlylgYUYVmCIRxABMwNTTFLgwdo0s7HhHY1BGz2J5+6kDWU2k99RcfUC3cYRhwJq4JfX9jEClkjwKgr0ZZkTHAijrEM4uTlXZhZQgFx9yxDPB2OSLu6JSQFEFgrk40PoTHbuiU9CX5qmbMDOmG9lzZkSpZ1s7+iNUj9Byd4tKHmtLjKXSnau60tgn4uGwvU/8S+AFrRjJ5OP4Cb9Id1O+5qeFqwdAIOuVGGj8La1bUx7j9aNleceABvRm8pliypGFzx6oITWB7E/1lX/6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ItlC9C62; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ItlC9C62;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNTcb1cqZz3cfB;
	Fri, 12 Sep 2025 19:28:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpP/e0BXkPcA5owDaVS+qRUmQw9u5lpm4/HsAW1I5IB+YwiJb61LxxtTjP3IILSSSfonY1xD1lPWYHwhKqKhuW089hQ/YP0sm+kcXTW8I1ySd0uJ5mnKGQVVusAjEOLNM+yYjQXimZI1R1mjTtVnRKqwh41YDYUTRneOF8ZD0mt2ewmkhWNEU6s0TASuzftSRznGXSfFJ4V4wTDkbzTk8Rs9LLA0rLbaPzT5l5iTJtib/wesHY304+y3kzg6SCHpFHNyREqM/CROe97yqfDJ2qyDQnEOSIA4Cq6+DBF3Pk+LRk/8XpJGj5ehf9nnWUhuEpeR9eQyX6kT67B2Xnn6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtRlLOnEkrTy1giDQFWVdieiUcOOA39r7EYeGTQWbzU=;
 b=DNMWIiRxDH+eFLEiMq8U3uxnU1JZ/MKFGtRTSQ/JdtL0j5I5NRApoyer1yZAxdk+CWRHTT3FLQ3uAsLUdMgeIwJk9h0STQUv1YCRnZOOzPKJ+mAxrdGa34ru7g252iUzgNzLQidy9pectoVyxZz7Y9CkSyuo+1YohtQm9OE0UVo85vAek81gNQc/LhZIiXz3+6jGd6h+RS+vw8zfxFvQ2ckZ7YX10FmpD9Op7QFBQZGULUQZHdrpRNS9UY8opveHq/ynYd1/SPAsfF5My7HyYoPZb24R2n8S7Ee9iVv9bjUQFV07GhlatsoSYPQZW7HukTBiR69LF1lR4sPuvbG2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtRlLOnEkrTy1giDQFWVdieiUcOOA39r7EYeGTQWbzU=;
 b=ItlC9C62iaduM4HnaiODSqruClxnaeI0mik7OYxsE6mz9QZ4uhlXkhRkXgOu0QPWqZQpG4cho3ia/PlLoRFW1qLAkz9SoW+seAMy2rZ0q6Sbk9/rpSs+CiLA9W0WDMgX9u50bjVinjkfM+BS/a4wznQgwYZnVYJR2T7j4a12JqdqkgwuqKrG9SZ/S8QRD4syfdNFUvXPziJ7tRwXqT3Z0YKwXG/GYgErT2XmGruuizRcbuC4MJ7b5YAz3C8HX7HkG4lP1k/BzZkei8AIoYqWG/BPeE4QSTDYoGq4M8KDzEXWt/Gd290GLliZubnEhVt/XistpRDSnkvZuEfXlHtwRA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB5883.apcprd06.prod.outlook.com (2603:1096:820:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 09:27:51 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 09:27:51 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Topic: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Thread-Index: AQHcEZHhMUfthzzCFUyK1ToM2tNFA7SPY8MAgAAHMMA=
Date: Fri, 12 Sep 2025 09:27:51 +0000
Message-ID:
 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
In-Reply-To:
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB5883:EE_
x-ms-office365-filtering-correlation-id: d12e8d75-ed71-4387-2e77-08ddf1dea548
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?czlMWGNpUjRRRktYQ3Vzd1gwZGp3TkRXdmJLdjhxTFFkdC91S3VzZ05pSEpS?=
 =?utf-8?B?TjdmcE5KOGswbWxjRHJEV2pZK1NhMmxhcGFrLzNGMkg4ZUtjVUVscnkzUE9L?=
 =?utf-8?B?SjZjOCtVMlFsWG9KK3dzZVhzRHhDNXVkZ1VBbkM4UlRMcnNxT0JZcXhPOUVE?=
 =?utf-8?B?L3Jadzl0TU1xVlRJVTdwU1VzcjZJR3NIbFRoY2xnZWRndi9uc1l4dG5oM2ly?=
 =?utf-8?B?K0hUTmFSSWpLSUQ0WFJrRjZLb3VqZjdpaHh2RVd4RW4zdFlxb2pYMkxFSmNv?=
 =?utf-8?B?OVN0Tkd3clplUFpHUzBSZmlTZmMzS3lVR0NYUHdTRENTUkhqaUtyMlpwQU40?=
 =?utf-8?B?WC9Lbmc4T0lEZU1GZjBsbjVWV3lBSHQwSjREZnFOd2w1T3MrY3JSVUtPV2U0?=
 =?utf-8?B?UGNhejhNV3hmOXIxK0prMFBYUHBBbUhuSHVBYkxRODdwZ1JUVzRYVWt4eG1u?=
 =?utf-8?B?K0RwQmRWbUJyOUdLNDlnU3hiYjJZQmdTR0o0MVJYSlZiZ1B0c3Q0K05xQjlJ?=
 =?utf-8?B?bnJoQ1JmNUpGZU9iWUJCRk4yZWZ2d21sRCtVKzBFZkNwbG1qL3BZZGtiOGxO?=
 =?utf-8?B?UUd6ZWRZb254MG95Tkluck5ZQk5jRDJ3SmdCb2sxVUhoczN4QXdMUGtFd3FD?=
 =?utf-8?B?bU9qdXJKNXlCQ2c4SzFtU0NiTWZDbTZxdDhjMFpjdnhORVdSeTJ0WWl4R05W?=
 =?utf-8?B?NWYvOUtRRTFpaUJPeXk1ZHhOWHFCVm5GTktJMlZYNy9URUlkdy9haDlDR0Zr?=
 =?utf-8?B?aktxNVBtU1lJbmdlOXUvVWkxWGlDSm8xNW53dk5pZmJmV21oc2dNbGlYSGht?=
 =?utf-8?B?V0ZjY0ZEcFU1bmdRb1d0YXl1cklZUEV1MnVPVWFMSWtsT3FGNm1YcWtnd2Zj?=
 =?utf-8?B?d3R0K0QyQkJRRVpBbzM4UzVtb3lDcGphQmhQK1NsMHB4eXRmRG9QOGJ6OFpo?=
 =?utf-8?B?SitGNm5LYmJsZzdVblgvQnluaVFCZzlEbmJNZk5NcXp1SnhuSlpWTUdnV3I5?=
 =?utf-8?B?Vkg5cU9UOEVHZzhsYVRCaFV0dzlhWmwrM0dUVDFyWkl2b0xWRHJCRC9iZFpO?=
 =?utf-8?B?dkRDV2hLaEp2RE8wWlhPdWRReGd3ZkNNMVJaUzVoN1dZc2M5eVBnSVVQYjJm?=
 =?utf-8?B?QnJyVmpKU0ZTYWlkaWJ6VGtuczdtcmNkVnE2SWNCemc4bmNucTJMYmtnc1VK?=
 =?utf-8?B?eGNvU2JqV0U0dlR2NnBiSDJCbEp4OTZrL3NEUDY3N1BTQkRLSEJ6QTFJRWNa?=
 =?utf-8?B?eTEwMDd1VmZsZXpVMC9DSVpkV2V5MytxM2hiZFFyNlVRNUYwTTY5QzlJN1dJ?=
 =?utf-8?B?azBtdHErNlRhUzVTdkY0Z1c5ZXMwbG8yZXZLWU5hWjNHVHpXRDhJenRzN1Bo?=
 =?utf-8?B?L2lvSmd2OHhHaXpta0x0ZnVDNFREMGUwNlVJdm5WeDYzRHhnbHRPU1RPU2NN?=
 =?utf-8?B?TGZpd0szVjQ1NGpialQ0cnMvanJ0bnlRY2RiNlpkSEF5bmxHcjNMN1BZVVBh?=
 =?utf-8?B?TUhFTVhybjkzbjl3c05EcFJvamtvZWZ0WE95dEJFSG8rNWxHbHJ4VGM5dmlE?=
 =?utf-8?B?VmU3ZVphMktvU1Q2NUZPMC9nMU9hRmFTM0VRSkZxSVpZS0JnL2lwUDBMbkNq?=
 =?utf-8?B?RkpzSjNHUjM5bHJHTjEzRnNMMjlRcE5NY3VtQWdxWi8zd1FRLzlBU094dXBx?=
 =?utf-8?B?NXJkSXcvVGNNNzBHMXdLSTNIVklMQWd0Q1JLL3luNERKNWM5WHcyWWl1VStN?=
 =?utf-8?B?eUxiRjhDOXlGbXpZbE4wMWRHQzJlOVR3S0p1RytKRitZTFptenVUZCtkc3Iv?=
 =?utf-8?B?TXVuakRFRmY5cS9VUFlWRVowRmFKczE4R1lUSlUraXREcW5NVUFNRnFtNDZ4?=
 =?utf-8?B?MDR4KzVWQnNWZFF3UkZLVVlwRVdxQ2NzOWdSSFVEYi9CbEROWVlaY0dWemo2?=
 =?utf-8?B?c1BLQ1JGTDA2MzYrMExpSHJLVE51L1dveEE2eno0SncvWEF4VDZxeXdaeFFG?=
 =?utf-8?Q?o/jTU4iVh0b+f10XGzfWuPVq72ixIs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ck9lZWZwbGxJNStLNk9ORS9YalRRMk9OR3ROMU9UMTRKQkJVdGRsbDBtdmhq?=
 =?utf-8?B?N0QrQkljZjBqbFh0UUdrNlVjeFlVTGhxMmhiaDd1bU15T3NoYy8rVExXNDA3?=
 =?utf-8?B?MVlLekxhcllLV1F3K2NCVVZ1WW0ydkthc2tTOEpLWmFDcFFBZmVwSlpoRVdz?=
 =?utf-8?B?WE9OdTBocFFUUjJ5SktMUzBSMUUwNmRKKzF0MlhwUVhGSTM0bitlZWcrVjhI?=
 =?utf-8?B?dnFCalA5Tm00Rkt3RkE0OVpTQktubm9uMlBCckpDOHhPaEY1NTBWVktlR094?=
 =?utf-8?B?QTdNVmlLMWtTUit3eXFHa2kzb0NDa0RWVjJha3NMUGtkVjV0MjhCSlhMUkVr?=
 =?utf-8?B?M1d4WEpLR1NreU04cnVvVThHUlVZZCsyVnI1UkFBRHFzbFpWa0lhYmh0TEdW?=
 =?utf-8?B?SGhVK2dkajUvN3l3cE15M2hadEVrUzEvUjJMZnovNWZVZy9EQnNQYVl3bW0r?=
 =?utf-8?B?UENKRE83N0RYUFdSeGRNcVc0WU1pSzlGaG1OMllDbldMbGFhY3lQVmtXdXkw?=
 =?utf-8?B?ZnYzTncvNm9wY01SZmR0UEdOdEt4bnNlTnhKekVOekh4OGE2UlN3bnVPNmky?=
 =?utf-8?B?T0JSekNLYTlMNFNHVUc2ZFlKSFhaV3YxT05PNkZDa0UxWC9pc0JSUVdtL1hQ?=
 =?utf-8?B?NlFjQm1Md1cwNDRQZ3pqYk9ncndFZU5tYnFKanpCY052SGhNMGJseWl4eWJE?=
 =?utf-8?B?aUUwOTRMSHJIRDRGdUtTNjZKUUFHLzdlWnRtZjRyeXdBQlNqbXV3S29YcTcx?=
 =?utf-8?B?Z1B1M3oyVnFrYXg4ODdGT3NFYVBBOVNKYmQ2R2gxMkhpbS9uTWY4ZmZrK3dK?=
 =?utf-8?B?UlFWeWlmTVVrbW9tOVJsbWNsaFN2a1ozV29zZ3ZyZllqdk9wOG5VbU1uQUVM?=
 =?utf-8?B?V3ZZbHhEOFBwa2l3bkYyKzF0RVhkSGFjeGhWamR4YlNycEdDR2pJWDdBMXFT?=
 =?utf-8?B?VWV3d1FMRlcvVDZrenlVaGJpeVRRSXQvTGdCYS9TTHA5NFA0ZVdJOE0wcURl?=
 =?utf-8?B?S2ZFQmlMT3JXNUdOYktZYS80aWx1c0Nma1hESUk1aWhTMHcyNmJyRngyMlRY?=
 =?utf-8?B?TmJ0Q0tBRE83Y0JwbmZEWlFsaW16WVJ5YkxROTZRbmx6WnMrR1FHcUlQMm9M?=
 =?utf-8?B?bDJpT1cvZnpGMm1wQ1MvU1FwK0NaY2RmRDA2OTVnRUpyOWJ1L0dDcTJiTnZP?=
 =?utf-8?B?bjRRMm4wOFpzS2lDTUFHTis1T3hvWDFIL1R2OVdBVXpETEc2UGtjS29oWGlv?=
 =?utf-8?B?VkloTWFTYmdBczJXTDVHVDN5VDhDQ1crQi9QT0pjKzljNndsbTA5L3F0QlZL?=
 =?utf-8?B?NGVINklXY2l0OCtycERVUXFVNEVvMWxxZ0FhVzRHeENxNFpYUnNFWW0vNUxi?=
 =?utf-8?B?ZHFEanZZSXZsSVVrZkt2NVFSMGRNQThHRWpIclJkTTRtNkVUOGZNQS80cUxX?=
 =?utf-8?B?R05NQzc1MEp6TVRZOUVnOTA3NVpiekJ6SXZjeHVwem82d3J2TjV2N2U2aXcv?=
 =?utf-8?B?WVNGT2tPRmhhTkszL291UlRiVEl6Q29mbXFyTW5Xdlo3TVkvVkNDRThwZlFZ?=
 =?utf-8?B?M0pBUForUnRKdGVIUWR6eGlHRDFvRlhVQkIyMjNpa0dWWFpieTg4QjRITllG?=
 =?utf-8?B?R1VVRlRuTVRRamh1NTJHc3p4dzdLbVViOE55d0poNFV2SkFBQmgvZVo0bk5D?=
 =?utf-8?B?TVdKOFp2UHBMbkRyeHVnekU5ajI1MTg1MVMxbTdaVzFraVlwYnhrenhHSWFs?=
 =?utf-8?B?Q2hLVjkyQXVOQjVlSTJRMVlrZHd3emROTE5NNkNyYTlQN2RLWmxXMnBYb3Nm?=
 =?utf-8?B?cy9VbDZCRlQxV2hVbU9DakdxNTg3TkVWMGpRdlZ3SEk1QTF1NVYvQ3NaL1dU?=
 =?utf-8?B?Y1dwektjVTRscDZhSFF0ZlQ2QlNodVB5WjJzU29sQmdhQUVveUI4cUgxUWdD?=
 =?utf-8?B?UGR4L1BDdkdER3J5NUhnNUR1aG9IMlhYbXlJUUJiSzB3R0tFdjVkd1piMmNU?=
 =?utf-8?B?cDBLY3U2WFMrRjl6OVpKZGJLSU9qVWtsZ0VaZEI5NEQ5V0lreFRnc25LOE8z?=
 =?utf-8?B?ckNpaVFmZHBGRW43UmZYTU9xL0JQd1RMbjc0dU9EWTRkUVlDYjdmMnp4Q0dt?=
 =?utf-8?Q?GN2xEoocBTDBgzIE4CrugjRG8?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12e8d75-ed71-4387-2e77-08ddf1dea548
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 09:27:51.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XqAj/jo8DjX4+E7U6t2By77mCbx2z62sIVrLizw0R2Zcqw/O1CnNoHbA2G/GRWtQ9YvCGIWvcIPC6AlhXOMQQXXwrvjVefWtA8cxtZj4OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5883
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxOCAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZCxp
MmMueWFtbDogYWRkDQo+IHRyYW5zZmVyLW1vZGUgYW5kIGdsb2JhbC1yZWdzIHByb3BlcnRpZXMg
YW5kIHVwZGF0ZSBleGFtcGxlDQo+IA0KPiBIaSBSeWFuLA0KPiANCj4gPiBBbmQgQVNUMjYwMCBp
MmMgY29udHJvbGxlciBoYXZlIHR3byByZWdpc3RlciBtb2RlLCBvbmUgaXMgbGVnYWN5DQo+ID4g
cmVnaXN0ZXIgbGF5b3V0IHdoaWNoIGlzIG1peCBjb250cm9sbGVyL3RhcmdldCByZWdpc3RlciBj
b250cm9sDQo+ID4gdG9nZXRoZXIsIGFub3RoZXIgaXMgbmV3IG1vZGUgd2hpY2ggaXMgc2VwYXJh
dGUgY29udHJvbGxlci90YXJnZXQNCj4gPiByZWdpc3RlciBjb250cm9sLg0KPiANCj4gT0ssIGJ1
dCB0aGUgYXN0MjQwMCBhbmQgYXN0MjUwMCBJMkMgcGVyaXBoZXJhbHMgLSB3aGljaCB0aGlzIGJp
bmRpbmcgYWxzbw0KPiBkZXNjcmliZXMgLSBkbyBub3QgaGF2ZSB0aGF0IGZhY2lsaXR5LiBHaXZl
biB0aGUgMjYwMCBpcyBhIGRpc3RpbmN0IHBlcmlwaGVyYWwgKGFzDQo+IGRpc2N1c3NlZCBvbiB0
aGUgdjE2IHNlcmllcyksIHRoaXMgd291bGQgc2VlbSB0byB3YXJyYW50IGEgZGlzdGluY3QgYmlu
ZGluZy4NCj4gDQo+IFNob3VsZCB0aGlzIGJlIHNwbGl0IG91dCBpbnRvIGFuIGFzdDI2MDAtc3Bl
Y2lmaWMgYmluZGluZywgdG8gcmVmbGVjdCB0aGF0IGl0IGlzDQo+IGRpZmZlcmVudCBoYXJkd2Fy
ZT8gVGhlIHJlZmVyZW5jZSB0byB0aGUgZ2xvYmFsIHJlZ2lzdGVycyBhbmQgdHJhbnNmZXIgbW9k
ZXMNCj4gd291bGQgdGhlbiBiZSBhZGRlZCBvbmx5IHRvIHRoZSBhc3QyNjAwLWkyYy1idXMgYmlu
ZGluZy4NCg0KSSBhZ3JlZSBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIHNwbGl0IG91dCBhIG5ldyBi
aW5kaW5nIGZpbGUgc3BlY2lmaWNhbGx5IGZvciBBU1QyNjAwLA0KZm9yIGV4YW1wbGU6IGBhc3Bl
ZWQsYXN0MjYwMC1pMmMueWFtbGANCkJ1dCBhbHNvIEkgdGhpbmsgYGFzcGVlZCxpMmN2Mi55YW1s
YCBtb3JlIGJldHRlciBuYW1lLCB0aGF0IGNvbXBhdGlibGUgd2lsbCANCnN1cHBvcnQgbmV4dCBn
ZW5lcmF0aW9uIHN1Y2ggbGlrZSBBU1QyNzAwIC4uLi4uDQoNCklmIHRoaXMgaXMgb2ssIEknbGwg
cHJvY2VlZCB0byByZWZhY3RvciB0aGUgYmluZGluZ3MgYWNjb3JkaW5nbHkgaW4gdGhlIG5leHQg
dmVyc2lvbi4NCg0KUnlhbg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiANCj4gSmVyZW15DQo=

