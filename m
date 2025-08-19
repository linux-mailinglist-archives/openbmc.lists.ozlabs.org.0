Return-Path: <openbmc+bounces-483-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304DB2D086
	for <lists+openbmc@lfdr.de>; Wed, 20 Aug 2025 01:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c661c5bxPz2xPy;
	Wed, 20 Aug 2025 09:56:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::609" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755646632;
	cv=pass; b=KjfckGuEykeIfRKJYT8zgTVvsZcCEofcfq0YO1CjSc7GOEG7VnK7dhaS5HfrNorEpiPR0Yh82HpR/MJNnyLdEfogsJAshktHrgNzgnM3xdupH1MEg2WyQEVgqhRiZ4JnyUBfpnQCxbm6GUwqmUAIWjc+Bh4jsRB+NBMTdcLKILCDKFCAk1ovUZZxWjTHtve7s/WTcAzUdDQFHa8cd6ePspTMlsWloNLNGqqz02VBBXz5WAvDQjzOYosX/QkRIqwCB6qvcCFXve0kExGCHLhkh0mA0BYecOkJsUzYWDp4nUg04InAqWSgZJnQYy6npRYC5qqVCbYoTzWL9VlKZFv39Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755646632; c=relaxed/relaxed;
	bh=ESXiZ0EVkxmMYRIT91WXSdYT2rKof1RP/7bxRkGqfwQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oCWM3bdHz/gA+mhJ//MPeUJhTr5riQEGDlLRBWw4tM4tzu4j+S5jjRDornXV5tPk+XmAllr9eld9vFtKofVvoIDtPLb45PqoZsaOpD+peH/HQZ5z+p9snczo7EXWPvbETBax6pMeHcGHDi8uawWMJ1NjPrMXSbmHNCZY830fFYGkJwvVdc0mrP/t163jdf6Uch8+x9Lb1iNW8tzPdrzqDUyxy146xPwFNgUj6Vx7gWMUS9cCXcU+4IF1peSsXyH8iHIoGTooEVYz6WaMcmhAgg/L8dHTyhs51Bh8PTMlOQNGdR4AILHWC2rvlkjCQbFSGlDUkbWnnHUQqQwCVwcTFQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DMpyNkqr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DMpyNkqr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::609; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c65bC70Jcz30Qk
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 09:37:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E34l24LtaGxAUhNhwCbqcz1CFeRwdAvI79sa5IeYKbs4agRlYEtvMKVSODXbGU5hutT/P9L3c8HBwpI/TJ6qPCvPXblQgPq5JtJAo/3VL01U+G6DbLNVnY2v1PGUsNf2mb60vt5lf8AahieSnDxt2cFbafYwq3zv/vOE5iyJ+wz8Aq7dqSSrynC0SyYKhefZLl6xmGA4mDrJTLgaej5JgGUfNTBB7Kgxg817ISviGi6qho3WR4LRgOwApudVj+bbzcelEcoauowgvvh23+gJVcpknr2ns7SBMF3jh8Tdomm1SVDEgYSPOWhaKA30CAsy3eSEp2TeTwISQg5ETEUo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESXiZ0EVkxmMYRIT91WXSdYT2rKof1RP/7bxRkGqfwQ=;
 b=V5AkAAf2FYQmxSRiXk4E9xsayCRtQ+WACcK6Cbmx2wzWSmjMm2YPCfBMYKJnnqEKom79/396v3fI/eXX5/cid0rZJlv2RyiaDUJ6tgAbQAxtF2VcPAeSkI6LEjtk4yQ0zM8WkqvMopBz157j3csjtguLPlRDrwUIJrBuJKV3qhmpPciZBAWEDLo1u39piWfUrvHeEBusuf2sAiLCHTX5aLfF5WwX10+/F97NdTvgIMjl1vA5kJWGzGStMnA15Zw8kY2UancQ9keVGW4AfyXZJcVnO4VqvmJEJuBfJlyEw0Z5nHB85ftFwmBD7b+HtFBVMLEhJ2+YTwi7A3PJ/h+5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESXiZ0EVkxmMYRIT91WXSdYT2rKof1RP/7bxRkGqfwQ=;
 b=DMpyNkqrnxHS0cnvpH9HNXqTHM0fiRy9W64uHxwRLl1I35h8dtjvl5vd85nk3AJRntA7HjVQ6F8x+rT2x6NkVDnJs0HBfwVXOINIJCyBOKgHvzwYdY1pmleCEYTZV9hc2SF9/sbfA+SHS3qObItmL0YUokd7VIp3Egk/n278+Llrixc7hWtFn6q+iG5EKpUeYuw98jzjGv7l2MmnHrg1gwTrRR3OQavaTpFG0UMuwsFfNHhxbSYMXgJQGBRUBbIOmXl03NEGjTHmW1EduywGNn8Tf+OjIH+nh357EGMQed62SPb7qBn1hQ+do9GhnSex/aQtdK6MESD8lo82//Lhuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by CYXPR12MB9443.namprd12.prod.outlook.com
 (2603:10b6:930:db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 23:36:51 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::fd4e:4c62:b756:96da%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 23:36:51 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Tue, 19 Aug 2025 16:36:24 -0700
Subject: [PATCH 3/3] net: mctp: Expose transport binding identifier via
 IFLA attribute
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mctp_over_usb_backport-v1-3-c655eb2a32ce@nvidia.com>
References: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
In-Reply-To: <20250819-mctp_over_usb_backport-v1-0-c655eb2a32ce@nvidia.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755646605; l=7393;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=7tvgQ1I62IKmM1jiedCTsZyHh9ptaGw0o2lUPJW4HI4=;
 b=+Oa+OAyvR5AvqTZeNHJgonKJORFXDvLH4yMfL6MUlfWNFSOVUrYw/C3YUwQyGwMMnBdP/RMLr
 Gs+r5UcaXdoC0jpHdqbZd98mCBy8YHqMbDb7n6oGS8GU6fSEX5wpTW4
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|CYXPR12MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: efdd7d43-758a-46bd-cdb3-08dddf7945fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXlOa3kyVGlUeUFkaTY5QjRQa0YwTHo3TTRhTU9JQVNxMkZ6QWZyR1BTT0h1?=
 =?utf-8?B?UWtDbWpOaVc5dzNHYVVzSDg4Q01yVWdWdDV1MDNmaTlFRXhMbVA0TDdsRldh?=
 =?utf-8?B?SEx2UFh2UFcwaGlBaHAvM09LTVVuV3Y2NWRUVmdpWTVjU2tmN1dVME1FMk1G?=
 =?utf-8?B?eEJQRExZMFVMOVBxbjlxR00rSDhKQStHd1ZoNjcwS0ROaEpqQU5kYURLYUFu?=
 =?utf-8?B?ZHJOZ3FONjUyTEFnL3VtZ1RPRlQxaVdWNlc2cFpjZE81NWNRcDJsc3dWSHlY?=
 =?utf-8?B?RXJJMXRHUyt4bTZpeElteU5FTjR2aXdEbUZRR25LbEsyeldhU2RCUHlVN1ZU?=
 =?utf-8?B?eWpMQW16blRMcjUvVHAzMGp4MW5USUdrNStVS25SeHVOcnQwMVpsRkM3WXBX?=
 =?utf-8?B?cFhHL3o0NzRGRmFDZ3FpVVFmT09EZy9BcHhMejhna3JwUTl1Q25VMzhpME9D?=
 =?utf-8?B?REpaNTcwWTJDeXkwR2wvR3MzQ1VmdFMyMVZzcnNISysvY2VCb0tIc2o5ek5S?=
 =?utf-8?B?RnpoT0RFTTlBT3N6UGd2R001cEorelhKVlFxeXdrWk5uT3lJTjJKb0JEOUNo?=
 =?utf-8?B?NjVRMG8yZzY0M2FIT1ZMMVhYenh0QTBJT1ZMYnN5dTBYQzVoYXJIWmE0SHl3?=
 =?utf-8?B?dEZxOWRVeEdmcEJKWTk2cEMzc2tJN0IvcFcyWkdQSlFqM3h2bGZTT25ySUFS?=
 =?utf-8?B?NHVucTFJQzJZR2IxVlVGTTh4NTlNS0FKT1hHOUkwUjNmemNRcVN6K3Q4bmdG?=
 =?utf-8?B?QTVYdk1iMGVCd1ZXSWtsaXRGNGJLdm1WQUIwWGpMeHhKdUxmM2h4Rm5SS1Rj?=
 =?utf-8?B?MjVDMk04TDhKMWRWeDVXRU5XbmF2RnAyWDBLOU1wQ1dWRXpGcEIvSzc1R1J3?=
 =?utf-8?B?R3lXYi9NRFh2WXpuVU1ZY2hzeWZKdGdsZTRTUWFyeFZITlVXVVVqZ09taUVP?=
 =?utf-8?B?TGhMa1kxVm1sY3VhZ3cyY2tzcDQydWZJd2hDOHZPUjJJT2NZYnM2MC9RRW4x?=
 =?utf-8?B?WXd2QWRiT1psM05jTis0bTdzam9VSjI1UC9Ob0d4bjZ2QzV4YWM3ZFRZNTYy?=
 =?utf-8?B?TG5ZMjNCUk9EQWUzc3N4eUlZSThvRnMvWHdSTURTdjZYVUdZM3hsVWlYczRo?=
 =?utf-8?B?aFprYlhQSHJIVGVJaGtnTk4wTURzTTdUUENWbzlMcHVOU1gxcW16alUwcGo2?=
 =?utf-8?B?S2Jhd3dXYjdTeURUZ3ZQVzJWaDFQY1FVcUo0TW9oOU9mdUIyMXZweGViMFUr?=
 =?utf-8?B?WHJlZEltaFVkSTh6WGdRNXdpaDI0Q3pwV3orb3QyRkVBdkcwQldVQ2U4RWNC?=
 =?utf-8?B?QmZ3UXNQS093RnF4WVFDYjBucUsvbWdpbnlWQ0t3dEZrSm96R1hWVHBOSUEv?=
 =?utf-8?B?MHF6RVFMdzh4dkxmdHN0dUtUMGNPZ1J3TEJqemFJR0h4WkJPNWdJalZlV0di?=
 =?utf-8?B?NHJ4Sk9Ham5HbzBRUjJqSTIzRllIVGlrQyt6UytjTW1TTlR6R3JxKzdWZ3ll?=
 =?utf-8?B?eHJjdnVvR1FlaGcyTldKVXhNRzM5cFcxM3d6SitBSWdZOXk2TmJhR05hMnE5?=
 =?utf-8?B?V1Bvb2lWN2R0ZkdWSmMzdXNZR0RVZ0xFelhzRmpGVnRIV3F0MEZFU25PZy9m?=
 =?utf-8?B?OFBjTHI5b1c2eFJQQU9wU3gvL0FnQ3dEcDNlempMb2lieEdZdnAvMEFYUHBk?=
 =?utf-8?B?RmF5cDZHcHRWTkdaVldhTWpKTGcwUXNicFRoakwycWtLcE9lNXREMUhGemIx?=
 =?utf-8?B?SWVZSEM0V01hTlJUTlVtUmZQY01UQWt1RGMxanY4SkNCNDhFQWFPcUYzTmdL?=
 =?utf-8?B?NXNzS2Y3T2pyNTdpeHp0TnN1QWxGNGVieGFrU0FpQmNBSllFWkxscjFPZjBQ?=
 =?utf-8?B?d1RraDQyanQwRTRTOU1ZSDlPOHNBNkttUFhXcS82ZU45d3J3TUJOUW9zTkc0?=
 =?utf-8?Q?k0HXzaGkwwE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hDU3huRUljdmhlWjRlei9xV3pYS3NTRklVTzZqcmZ0WS9TOG9RS2xPU0F5?=
 =?utf-8?B?RlFjWUQrOVF6Y3ZGcFdGUEtWRml0VXR0NW1sS0Q4eVNhMTArMWh4V3BmZDM4?=
 =?utf-8?B?Ryt1R1d2aTE2UFZ6Uy9aSDB6ckxtM0RwSWhaU1JBWEtiTFVxUVhPNW4xb2hq?=
 =?utf-8?B?VU9OT3FLMWJUS1ZJdXJ1MTFac0t6VHVmZytSbXVhL0tLZC9zdCtoU3ZwcXly?=
 =?utf-8?B?LzFSYU9wOVR2K3VuQnU5R29KdkxoVEI2dHVkY1JqVi9HZkF6bGhpbHdtZDY1?=
 =?utf-8?B?bUgxMENCclFHNll2OWdySHE4NnJGUFgyVWNPK0MxTjF4VGl5K2l1bThqeWl1?=
 =?utf-8?B?UEk5eDZ3ZlUzNTJLWWtPaE9PdDBVd1VjSS9CRmhjczdEY3dFOHBmTmxhWmI5?=
 =?utf-8?B?V2Z4VmlVWE15bDh3ZnM2ZUZSSUdMQjRZdVZ5WGJUeVhiaVZzUWt0VTNjTHYr?=
 =?utf-8?B?S0NqUHppVzdtTDA1M05IM0lvSVBxcGNUTmdMditSVjNPT3BNMHYyTjd3b2dD?=
 =?utf-8?B?NHhlVFZZdTJXYStyRjh0SXhjVEtOWFlNS3ZXWk1XTDJ4THgvcGgyVnk3SjhM?=
 =?utf-8?B?QVFMZEgvUnVLZUpIcmhCdkJ2N3E5WFpMQUU0SXhCVXJYUWZ3Zy9wSFVTa3VE?=
 =?utf-8?B?MjBTTzNkcTVyQ05BT0c1djRQejVERFA2ZnBBVTFkRjdybE1aQmRBRVljVmlw?=
 =?utf-8?B?M1p0ZWhYLzhDdVcxNWJaajhkZ0orWjVFUkdVUm50MFlydlFXaXJNOHQ0SE1R?=
 =?utf-8?B?WVJzWVNLdC9tbmIrVXhUM3MzeVFROFhjbmVZeTJqaW5zVWpNKzhoc2QvSzU4?=
 =?utf-8?B?RlNKdThHdy85TDViSUNsdjl5VHJmTHlIVWJJV2hMUnRjME9NWXljMyt4WFFp?=
 =?utf-8?B?UlRpaWQ2K3FPVTFycmJEMkZrcDFBRGdGY0JDZHZkcklaQ1ZCUlZ3ZlRkL2U4?=
 =?utf-8?B?dStKMDN0RWpmOUVjbzE2MUhKM0d5djJiZG96VzE3N25Vb1FLM2RzaWw2Rm5W?=
 =?utf-8?B?NnRYUkZ2SUhSd0lqdUR4U0tJOERwREtiNXhDQi9sZ2RoZ1FXZHN4Q0hINTBu?=
 =?utf-8?B?RmM4ZkZaNnc1b1cxSUtjUS9nOStWdzFES0xwano0RXc4RnRRZGxPUDdrSHBn?=
 =?utf-8?B?Sk93Z1Q5bTJXandYSzJoQmRTS3ZXM0U2YmIyN0duK3BldlNRaFhVekJGMDF3?=
 =?utf-8?B?NDJzYm1qWXpEZ0RDNjhhbUgyMlBDN243TjhzTlZ1d3h5TmhEMUMvWHNMVUZK?=
 =?utf-8?B?WFI0K1kzM0tSc1M5WlVxMkFPMG10R01CNVpkVXVsUTMzMWg4RllOSW94R2Mv?=
 =?utf-8?B?YW1vSVFXSy9XQ3YrMnd6WlQyYkFzRU5pUUE0dmhxcjMvRjVHamZWS2xlQUlX?=
 =?utf-8?B?V0Z6MW0wODVqWS9PblF3VHdNbXJIcytGd2R5dmN5eWp0YjZ3M0dRTHVRZks5?=
 =?utf-8?B?WDFxVEFaSCt0NkVhNC95YmVyWmdUYUZlOGVkelVHeTI3aWNsZm8xNk96bGRU?=
 =?utf-8?B?N0ZrbE9CZHkvZzBpYXFVTFlNbWRWSEpBZmRJWVlGelVjNGtOOFpOZHNZQXpy?=
 =?utf-8?B?KzhGZHk1VGZSUHJQKzlMM0FJVVlEUnVwV1NjaDNwS0NuQzJoSW96REdtdGx1?=
 =?utf-8?B?NWxuMGRSR1ZqODhlN28ydlN3b0IyWTRiZGhsZDhzVnNRV3lhcGI5TVgwbmhD?=
 =?utf-8?B?QXBUTWFxcTNKd1pIRGgrMjNVWWhvdzlaWHRpdGZMbzVhZmtISXJHWmJSblZz?=
 =?utf-8?B?bnYvSTc5TUVHbmQ3WjJTZVhZZFhlVGRTSHRLSk04UUJVN0RYQldIOHNVanYz?=
 =?utf-8?B?THJOS0RqYzRydXJheVNBOVZWM3V0T2lXL0ZNdmhaMlBJTS9FUHFlMTQyRjB5?=
 =?utf-8?B?c01ibnpSMUNlYko4OU5hS2FxKzdYRks3MkZvL1FBeHF3emVZM2RSSjRGSnh5?=
 =?utf-8?B?NFNBR2RHNGlPNGV3K0EvOGRFbk1oNkFtOGl5bWtWbUlISDVPN1FqaXZxaGkr?=
 =?utf-8?B?M2lodnduMFg0OEl5THVZQXZ5Q0dxM1NSUHYxVWoxS3pvNElQZDBiMjZ1ZUQz?=
 =?utf-8?B?aXRVbTkrUUdLS2p6MkJhcXU1YitIQzltc0pPWU1EQmJSTEpuK2phcFQ0N1Z4?=
 =?utf-8?Q?FV+7YFztJTEPlFMYrcEQikqIP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdd7d43-758a-46bd-cdb3-08dddf7945fc
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 23:36:51.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgsb7YjRjTQByw9P1t0TQsutaEAGFpzFrDVf3T6D6zALRQcom29Rf+Mszw90yyi7z6GGQMdniolpXWfd9cGQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9443
X-Spam-Status: No, score=-3.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Khang Nguyen <khangng@os.amperecomputing.com>

MCTP control protocol implementations are transport binding dependent.
Endpoint discovery is mandatory based on transport binding.
Message timing requirements are specified in each respective transport
binding specification.

However, we currently have no means to get this information from MCTP
links.

Add a IFLA_MCTP_PHYS_BINDING netlink link attribute, which represents
the transport type using the DMTF DSP0239-defined type numbers, returned
as part of RTM_GETLINK data.

We get an IFLA_MCTP_PHYS_BINDING attribute for each MCTP link, for
example:

- 0x00 (unspec) for loopback interface;
- 0x01 (SMBus/I2C) for mctpi2c%d interfaces; and
- 0x05 (serial) for mctpserial%d interfaces.

Signed-off-by: Khang Nguyen <khangng@os.amperecomputing.com>
Reviewed-by: Matt Johnston <matt@codeconstruct.com.au>
Link: https://patch.msgid.link/20241105071915.821871-1-khangng@os.amperecomputing.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
(cherry picked from commit 580db513b4a9d52f306580015a1872eea0a0894e)
Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
 drivers/net/mctp/mctp-i2c.c    |  3 ++-
 drivers/net/mctp/mctp-i3c.c    |  2 +-
 drivers/net/mctp/mctp-serial.c |  5 +++--
 include/net/mctp.h             | 18 ++++++++++++++++++
 include/net/mctpdevice.h       |  4 +++-
 include/uapi/linux/if_link.h   |  1 +
 net/mctp/device.c              | 12 +++++++++---
 7 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
index e70fb66879941f3937b7ffc5bc1e20a8a435a441..d2b3f5a5914188bdd6882b28e5adf2dfc40e71be 100644
--- a/drivers/net/mctp/mctp-i2c.c
+++ b/drivers/net/mctp/mctp-i2c.c
@@ -880,7 +880,8 @@ static int mctp_i2c_add_netdev(struct mctp_i2c_client *mcli,
 		goto err;
 	}
 
-	rc = mctp_register_netdev(ndev, &mctp_i2c_mctp_ops);
+	rc = mctp_register_netdev(ndev, &mctp_i2c_mctp_ops,
+				  MCTP_PHYS_BINDING_SMBUS);
 	if (rc < 0) {
 		dev_err(&mcli->client->dev,
 			"register netdev \"%s\" failed %d\n",
diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 1bc87a0626860fecc0025536a4cb481d03a5fa7e..9adad59b867672d6eff1796729ea335789d35401 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -607,7 +607,7 @@ __must_hold(&busdevs_lock)
 		goto err_free_uninit;
 	}
 
-	rc = mctp_register_netdev(ndev, NULL);
+	rc = mctp_register_netdev(ndev, NULL, MCTP_PHYS_BINDING_I3C);
 	if (rc < 0) {
 		dev_warn(&ndev->dev, "netdev register failed: %d\n", rc);
 		goto err_free_netdev;
diff --git a/drivers/net/mctp/mctp-serial.c b/drivers/net/mctp/mctp-serial.c
index e63720ec32384b642a96d12843795db8230a8486..26c9a33fd636484b1c890397c21409d101b16308 100644
--- a/drivers/net/mctp/mctp-serial.c
+++ b/drivers/net/mctp/mctp-serial.c
@@ -23,6 +23,7 @@
 
 #include <linux/mctp.h>
 #include <net/mctp.h>
+#include <net/mctpdevice.h>
 #include <net/pkt_sched.h>
 
 #define MCTP_SERIAL_MTU		68 /* base mtu (64) + mctp header */
@@ -470,7 +471,7 @@ static int mctp_serial_open(struct tty_struct *tty)
 	spin_lock_init(&dev->lock);
 	INIT_WORK(&dev->tx_work, mctp_serial_tx_work);
 
-	rc = register_netdev(ndev);
+	rc = mctp_register_netdev(ndev, NULL, MCTP_PHYS_BINDING_SERIAL);
 	if (rc)
 		goto free_netdev;
 
@@ -492,7 +493,7 @@ static void mctp_serial_close(struct tty_struct *tty)
 	struct mctp_serial *dev = tty->disc_data;
 	int idx = dev->idx;
 
-	unregister_netdev(dev->netdev);
+	mctp_unregister_netdev(dev->netdev);
 	ida_free(&mctp_serial_ida, idx);
 }
 
diff --git a/include/net/mctp.h b/include/net/mctp.h
index 28d59ae94ca3b486ccc86d05aed26e998ad50c4d..1ecbff7116f62dd7eb2f9ac8273a162d7e7a3357 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -298,4 +298,22 @@ void mctp_routes_exit(void);
 int mctp_device_init(void);
 void mctp_device_exit(void);
 
+/* MCTP IDs and Codes from DMTF specification
+ * "DSP0239 Management Component Transport Protocol (MCTP) IDs and Codes"
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0239_1.11.1.pdf
+ */
+enum mctp_phys_binding {
+	MCTP_PHYS_BINDING_UNSPEC	= 0x00,
+	MCTP_PHYS_BINDING_SMBUS		= 0x01,
+	MCTP_PHYS_BINDING_PCIE_VDM	= 0x02,
+	MCTP_PHYS_BINDING_USB		= 0x03,
+	MCTP_PHYS_BINDING_KCS		= 0x04,
+	MCTP_PHYS_BINDING_SERIAL	= 0x05,
+	MCTP_PHYS_BINDING_I3C		= 0x06,
+	MCTP_PHYS_BINDING_MMBI		= 0x07,
+	MCTP_PHYS_BINDING_PCC		= 0x08,
+	MCTP_PHYS_BINDING_UCIE		= 0x09,
+	MCTP_PHYS_BINDING_VENDOR	= 0xFF,
+};
+
 #endif /* __NET_MCTP_H */
diff --git a/include/net/mctpdevice.h b/include/net/mctpdevice.h
index 5c0d04b5c12cbe43acdbf061b052823095fa6e33..957d9ef924c514ab4216e31c8ccc7a0e3f3e228f 100644
--- a/include/net/mctpdevice.h
+++ b/include/net/mctpdevice.h
@@ -22,6 +22,7 @@ struct mctp_dev {
 	refcount_t		refs;
 
 	unsigned int		net;
+	enum mctp_phys_binding	binding;
 
 	const struct mctp_netdev_ops *ops;
 
@@ -44,7 +45,8 @@ struct mctp_dev *mctp_dev_get_rtnl(const struct net_device *dev);
 struct mctp_dev *__mctp_dev_get(const struct net_device *dev);
 
 int mctp_register_netdev(struct net_device *dev,
-			 const struct mctp_netdev_ops *ops);
+			 const struct mctp_netdev_ops *ops,
+			 enum mctp_phys_binding binding);
 void mctp_unregister_netdev(struct net_device *dev);
 
 void mctp_dev_hold(struct mctp_dev *mdev);
diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
index 2acc7687e017a997c07fe3a9e54ac94a87c88230..9e76f8e59ce9a831e19ac8baadd5069457071040 100644
--- a/include/uapi/linux/if_link.h
+++ b/include/uapi/linux/if_link.h
@@ -1957,6 +1957,7 @@ struct ifla_rmnet_flags {
 enum {
 	IFLA_MCTP_UNSPEC,
 	IFLA_MCTP_NET,
+	IFLA_MCTP_PHYS_BINDING,
 	__IFLA_MCTP_MAX,
 };
 
diff --git a/net/mctp/device.c b/net/mctp/device.c
index 85cc5f31f1e7c0a0c3f51c5e924d9424dec27b5a..4498184a6a152e967f0386e607a72cd7264473b5 100644
--- a/net/mctp/device.c
+++ b/net/mctp/device.c
@@ -371,6 +371,8 @@ static int mctp_fill_link_af(struct sk_buff *skb,
 		return -ENODATA;
 	if (nla_put_u32(skb, IFLA_MCTP_NET, mdev->net))
 		return -EMSGSIZE;
+	if (nla_put_u8(skb, IFLA_MCTP_PHYS_BINDING, mdev->binding))
+		return -EMSGSIZE;
 	return 0;
 }
 
@@ -385,6 +387,7 @@ static size_t mctp_get_link_af_size(const struct net_device *dev,
 	if (!mdev)
 		return 0;
 	ret = nla_total_size(4); /* IFLA_MCTP_NET */
+	ret += nla_total_size(1); /* IFLA_MCTP_PHYS_BINDING */
 	mctp_dev_put(mdev);
 	return ret;
 }
@@ -480,7 +483,8 @@ static int mctp_dev_notify(struct notifier_block *this, unsigned long event,
 }
 
 static int mctp_register_netdevice(struct net_device *dev,
-				   const struct mctp_netdev_ops *ops)
+				   const struct mctp_netdev_ops *ops,
+				   enum mctp_phys_binding binding)
 {
 	struct mctp_dev *mdev;
 
@@ -489,17 +493,19 @@ static int mctp_register_netdevice(struct net_device *dev,
 		return PTR_ERR(mdev);
 
 	mdev->ops = ops;
+	mdev->binding = binding;
 
 	return register_netdevice(dev);
 }
 
 int mctp_register_netdev(struct net_device *dev,
-			 const struct mctp_netdev_ops *ops)
+			 const struct mctp_netdev_ops *ops,
+			 enum mctp_phys_binding binding)
 {
 	int rc;
 
 	rtnl_lock();
-	rc = mctp_register_netdevice(dev, ops);
+	rc = mctp_register_netdevice(dev, ops, binding);
 	rtnl_unlock();
 
 	return rc;

-- 
2.34.1


