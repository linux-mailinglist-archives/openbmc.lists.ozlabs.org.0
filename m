Return-Path: <openbmc+bounces-964-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB01C9D600
	for <lists+openbmc@lfdr.de>; Wed, 03 Dec 2025 00:53:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLczc70Zhz2y7b;
	Wed, 03 Dec 2025 10:53:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764719612;
	cv=pass; b=dF3Qe20nkWN6sDCgeEE8SGBmLnaiLbMOy558tkJ+BwdHjJWPI9XxphAJKth6hsCleqF+ENS8JFL4uL0oreo53pwZQ6zkZi8iBd5RTXv378ANP6zfeaGNc1pXNLTRX2uiwmI2EWBjOlNb+UwMIKRT5bdHWi5vzU9J1hAskbtp1/a+vsFbwWRLQCz3wL8/TpwyR3Mq99CHvWPOfD7XWwyCNx8qTg0UQytIV0eipYtYk6j1NZvoUmUklAclqXakHlWl8ccVyWV9remaiMqgksIUx4mYKE2YSdZMRwJllFHSwLSi2+S+IOHo1ddmYwf8HCEqbdcy2XiczSG89CDxlbPO3w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764719612; c=relaxed/relaxed;
	bh=Hvr5miGEqfXHyIT6qPoxqpLqHvgcWHRl2VXpOz9Ajm4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=AN74flgmOKkLqQuS3ZcmIvqCszPYVlrzG64fyPmt+vAYbP5P/xxjuCkcwo1Di/t5ocIPIezdUzU938At7+QvFwvWY7OqGx1vjhZmWtQ+18C8S4FJlDu0KRR/LR7Ft1RhRP0LRS7WFixLQ6Ep8noRMqEou4lSihQkF6rGINZjCuyufZMVyJuB1uAV7N/qnc5N/7wY01kQLASPmDTBQnt8rb/n6D1dP4WtRbICxlUyb5a3PIQKfxy9zkfuqFmB92+rx2kYwoMqPzI6+q36se6L1rTz0Z92CMSiUWCJSUsUFK/CUFKrsHcovOsqI14+srEBZvqKGApK6bc1P/VoqdeJGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b1ax6Sgq; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b1ax6Sgq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=molberding@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dLczb0mGVz2xqf
	for <openbmc@lists.ozlabs.org>; Wed, 03 Dec 2025 10:53:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDRSkZ6gwo5a7wlJRYaNwf2e3gmTn3scL9p6/etOLEfIV7b6GpzjK+ZdrMbZkzttk/6XRIslIv2c13nWmhwPyGKCpbjZeOF7a+s/9nqYZaUtQ14JgCu63AsUbLkRBlzGuV77BJjK+fwOKadiG52lF2f8L9hvNx/reXcjF3ngTLP22pt5XL8Sf307B1OO3Z9UQ/lTYJ+4yOvaG//ECdIYYpnMuyz1jBN9oVvhSWneaDZAMkbQTtCoHKNAqwVw2rh3+x2qJmMFpvo8gq7ODL2rYs1sJKTYhau8pJMzVt4zBp21NH3Ga9hF1WRUXMRp8Gcj6fq0TbrK5lSn1nBuLnTgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hvr5miGEqfXHyIT6qPoxqpLqHvgcWHRl2VXpOz9Ajm4=;
 b=y3FG6AW5iyD8NbfSCSva8wbzJLCc/PA/5CGz1r/bw/HSUmzUdp6DtCTWETHk9Zj5aERltHgmNSzNK2tstp2eC4QVfRPMJBMvnrZDclspi+3aDi4/kITplE58B6jPU4iI12cfBfXBno7GXbtDiMd5FSiCRK5o7MCRcIKmJ3xl8/4KOo7JVlFYE91ZGaSjqSW0bujo0DcLKkbobd720MOWZiiFFx4Di2EFXgJWQW+R6mxDoSnV9s+HGLjRQkUpysp/QM+gL68XUt1AomNHobGqImgSkSTYocsSj6pVMp1ucnG71TuX9smQfjHOhVcJRzkMC3aF8yfl7wapKRITGVJtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hvr5miGEqfXHyIT6qPoxqpLqHvgcWHRl2VXpOz9Ajm4=;
 b=b1ax6SgqkB7MR76KahxgmHxTNgD4eglEKkMvsJhMAEiVeQNERIq0DZaulSTfofqsgh1csnG2bmzVv29DykJOVyLKFeDRLUHdj+1hKmT3XaUO25AISlXg+YTL2id9Yp1jeNog5lVhS/5LaZGo8MX3InjIqk1ziQkkqGUzsguqTFnBmulr9rPKVr3AbG6QkJvEPKl8yVXQ+H6CruKbSqq/B8FhenwpVHYqFDffxgcePLuPefx6ye35sLffP+mnlBXA7wLxnvQkKNVo+9aoySNlhzWRIh5cphMYSOAA1MxL3N06SdTPM921ovx6mSlRpxLxHzCcx5zZ+W7LDJFhedjdeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627) by CY8PR12MB8298.namprd12.prod.outlook.com
 (2603:10b6:930:7c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:53:05 +0000
Received: from CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9]) by CH1PPFDAD84AB72.namprd12.prod.outlook.com
 ([fe80::7816:ec9f:a1fe:e5c9%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:53:05 +0000
From: Marc Olberding <molberding@nvidia.com>
Subject: [PATCH u-boot v2 0/2] aspeed: Add support for MSX4
Date: Tue, 02 Dec 2025 15:52:39 -0800
Message-Id: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMd7L2kC/yXMSw6DIBAG4KuYWZeGoZY+Vr1H4wJhqLMQDFhiY
 7x7iS7/R74VMiWmDM9mhUSFM8dQgzo1YAcTPiTY1QxKqiuivIkxL62wxiEpar25PKBep0Sel51
 5w1f0Mc7Q1X7gPMf02/WC+3pACg+ooJDCW4l477XWFl+hsGNztnGEbtu2P2Gh+SChAAAA
X-Change-ID: 20251107-msx4-cad1e2e4fa39
To: andrew@codeconstruct.com.au, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764719583; l=1975;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=YcwxyWUVo4alEqxGGPdDWqNE2G6JU+1kRtqsQ1UwEYs=;
 b=dGc636m7PPAzY2lHcINRFiN1JpwTv4qL+xNJKFarIjvVpVrYjO8VOUigwZvOqsgUCJ6Ap+y1d
 dsYVxVxIxJPAOd1ajgHPcUEEUgeXhqlddY+gIVTzcXqk5x6iQCtqmE2
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW3PR06CA0002.namprd06.prod.outlook.com
 (2603:10b6:303:2a::7) To CH1PPFDAD84AB72.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::627)
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
X-MS-TrafficTypeDiagnostic: CH1PPFDAD84AB72:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7918ba-ea11-4f92-61e0-08de31fdef8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dG1icVFyN2xkY2lReWpGZFBBZkFhL1NtWGMwWmw0eWNxbTR5Y08wK2h5NG9K?=
 =?utf-8?B?b3d5ajEwOEVsMVB1SGFydEJYY0tBNklzSDQwOTZZSjREcHo5MkhnUmh1bU44?=
 =?utf-8?B?T3hudDJVUVNKc0tRZVQvS1B5UmhheUx1L250dmxhZG1PQnlVUzBPN0VtcFdY?=
 =?utf-8?B?TmFMTmNXbVdlYU12a1JWSDNaeitadWxCdm04blZ2SVZCc3RueTBVckRMTkRr?=
 =?utf-8?B?WUtSZ0JSMkJuZUtJS2Y4azVtZng2OVN2dmQzV0t1bkJNRmVIT2pyemZHRWZp?=
 =?utf-8?B?d2RlQ2NKVlBwMEZHK2RQVndpdW1ydzFSQWo2NmdETnMvNStGS0JNZVZYa2U2?=
 =?utf-8?B?Q0FQekdVSzZ0S3oxSkhJNTh1WUg4RFRWdGRpZ3llN29qVlZpbHBjQk42R2FZ?=
 =?utf-8?B?Vjk0eXZ2dkNjQk14NjExTjh0WkhjL2xOWG9uNndqbHRFMWtjbHV5V3pMSEpo?=
 =?utf-8?B?WWZPOWd2Y2IxazJpRzV6TG4raDdCTVBrNmlVWWZWYVovczY3NkhWWkVQaTgz?=
 =?utf-8?B?OUh3RmhUYVphbmp4SEo3amlpNUJKRHlRUWNhOFV5dzU0WGNkdU14KzYyNmpU?=
 =?utf-8?B?QTBra0twSDN1WGcxNGNlOEhzOVM2ZGlGMVBzbXliZVMySS9BRTZlbjBqemI0?=
 =?utf-8?B?QWZvTFlsTGh0ZVJyeWlrc21lZDNuVnhQV1RqMTV6b21ZNnF4c1RqbjQ0OUpl?=
 =?utf-8?B?NWVYazdNcE9pNmpMbkNXQXM5aTg5VXFhSm5XcGE0amc5YkhkL0N2eFZ5Z2ZX?=
 =?utf-8?B?TndMTFpIcnVoWnNDZVFPMFgvcWlwQUx0dWxvVnh1ZXBsYWpURWZmR0hpV2t6?=
 =?utf-8?B?UVp1R25ZeW9FbkFWUHltSkQ2TWsrR2Rvdnd4eStsblRzWXN1TkRvcHB4SFFM?=
 =?utf-8?B?K3QrZ01jekZkUFRPTEYyVVBXNXAyNHo2SWd6KzBKMmJaRXV6elMrZEZDb0pJ?=
 =?utf-8?B?TUUvVGZIREFNUzRrUlRvOWNjNnRIaGhVMmJQeXArRkFlN1VBVzVld0ZKMy9H?=
 =?utf-8?B?ZHJvTndzVUdhMjdMWUpUMmJFV1Jhc2VicDVIZjFCTzlXYUI3ZEk3dkF1alZJ?=
 =?utf-8?B?bnVEL2tPa3FicXhhM0ExVjJob3luN2NRY2ZCRThjMlo3MnNvRDhQd0w2UklK?=
 =?utf-8?B?SURpNVFFZiswcjcwU1VTVVJjdjUyRDFWWG9lWVQ4V3l4OC9XWk5mZ2pUblpN?=
 =?utf-8?B?VktCaS9xSUVOM0xnOWhpS0JMRm1QaU4rU0V5Vi93OHd4N1FqR056SzZRMzNT?=
 =?utf-8?B?bXhFT045Q2Ivc29WRGtQdllkTndCSnZXYy9OR1ljZW9YaXh3cmhFeTNzbHJE?=
 =?utf-8?B?T1d6ck9TTnFRQThybURrV1Q0ZFZoSkxpSTQ5bjhXSTIzanVWSUxoTkFqU0dm?=
 =?utf-8?B?WENxZ0FoQzNkQnpSUXZ1ZmdVNkRnVWZlUlhjSzRiWnRrTXFScFB1RmNvWVkr?=
 =?utf-8?B?ZTgrbVlBcGFoS05zS2Y0TzA0YStkaVVjK3VaOUhqclV6NFVXVWM0eGxSK0xm?=
 =?utf-8?B?dTZmaFo2NjVGNnFzT2F6OEw4d2w5OXlRSnkyQTd3ZU9rYTFPRGR1cElLK1lK?=
 =?utf-8?B?OGkybUIzNnlYeDUxTklxTnBxQ0tQK1JWazdpODhKbk1jZzMzb0hjKyswb0J3?=
 =?utf-8?B?RHFnK1BRUUpHK2UyOFE5UXJ2K0IxK0JHVGFwVUhsL0ZCWVAyTE05OGJIWUF0?=
 =?utf-8?B?ZUQ2eldxZmk5ZDZGekp2VDE4aWpsa1o5bmp4eUk5Z04wL0Z3Wkw0UFE1UDNG?=
 =?utf-8?B?ME9yNTBqVTFYaDJsQ0lJb09WOFBhNHovR1FWbzROVE9IaVlSNmVPNmpTVEo2?=
 =?utf-8?B?Smx6cjFmUE9xYk1wSXdjbFhiM0pqYWp1Y2FheDBieWxBOFR1RTEyZ285bjFH?=
 =?utf-8?B?byt5WCtSdlc0VkhxcUMwUzNsMVhrZkZwZkNsbVRYNytvMGVTRHdKdk1QdW5B?=
 =?utf-8?B?WnU4Y2xvblFUU0hzYXJmWGlCSjdZMk01Uit4UHA1REFPSUxpcnU4T1VZYnpP?=
 =?utf-8?B?SXg1aC96NUFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PPFDAD84AB72.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFpueXp4a0F2bHViaGsyNlBPZ0ZTWFB6ME1KQkdEVTJLT1RJTkFVR2h4UE1N?=
 =?utf-8?B?VTFTR3ZQb0pNMmpPdVJvOEtBa0pZTFBHSG1XWFExTUNGWVNKVHJXeW5vZDgx?=
 =?utf-8?B?cm9UWmJqQTE2b1dBT0VoRUpudmg5SlV3R3RVTldyVWY3NFFnUTQ4L3lQTFBs?=
 =?utf-8?B?N3cxNTBZSStQOHY5dGdUVUhnbU90NGp0amxzeWlTdjhsRzBoS0tjYjkzOFJV?=
 =?utf-8?B?VzJwUWxpdkdFdWcreTlKbXhlVDJwYmYyRWZzMERpcjNxNGlxeDMvdnp0RXJI?=
 =?utf-8?B?MXlScjBwNGsxVmxkUXRVVUxCeHRsUmRDRnpwVXBHd3FqdGdNaW01NS9odU9y?=
 =?utf-8?B?ejhXZkxlWkRzQTg3TGlJRklwZGNKTUs3U2dhK0kzNGllYVlrMExUZjA0OUFL?=
 =?utf-8?B?S1hia3YxSTFMdnZyQjhuR0Fod3V1di9CYmhYY0RENFRnNUlrK3JLUjVqclI4?=
 =?utf-8?B?KzFML3dKUEpwUHJWR3BHbFpWM1NHU0NZTTE0UDBBaTduZ3FrYVZXa29oUjcv?=
 =?utf-8?B?dkJyWGg5RTQ4Zk01bHd5YmFzWDhYOFJ3aDYzWGpVcVlDWDA2SXZpeDlNc2Jq?=
 =?utf-8?B?SG0rdGl1bGw4WXZrNXVoSnNnT0pkTjhsbnl6eS9IMDhvMjRqRGVWWGlEa0Jh?=
 =?utf-8?B?VHhEWnJhMXhZVVYxUHRtWlJsQUc5QXBYS0t3UEE1TWk0YytLcEdkclZUZGt0?=
 =?utf-8?B?N0s3SHg0OENlVGlUZjJncnZvNEVQUk1hcE82aGZldzhPK1ozbGRPOUpiaStZ?=
 =?utf-8?B?b0l1OUNEZWVJVndzc01SYitSZ0U0RUsySXcrTEZKeGx2Qm9OL1RoVklMWDFo?=
 =?utf-8?B?eGlPOHQvMzRVaTRHVDQyZzZsbGhtSllGQ1pPSjNIaDNQeGZzVFNVQThud2Rx?=
 =?utf-8?B?TCsvc2RLY05reU50c0x1MTVIQ09lcmF1aDlaV3NFalhnaCtXeVhaSExBV3Jr?=
 =?utf-8?B?Mmg3L3VrRkRsZVNZeE1YbmE2Wm5PU3ZxN0VIRzMyb3UyMk9xa29pSWRmNEQw?=
 =?utf-8?B?ei91Mzg5bXBKdmxEc3RHbGRuamFYcTFyZzdBRFFhMVFNVGRZbzdDQVdYcEVW?=
 =?utf-8?B?VU5IT1pxaEpMOGJ1UXl2dXlFQ3IrVmtsTjhJZlRVMTlsa3gwYnA3dVlrcEdE?=
 =?utf-8?B?VFRFUmJEV2l5R3ZrNjRrZ2JiZHhxeVNudUh5UXU1UitQcVJXZFdMQlVCdGV6?=
 =?utf-8?B?dmh4Ny9YYklLNjBCNHZTNmZZSWNlR3NSckpyUHhLZ2hGRWs4U2FHWVVwV3Q3?=
 =?utf-8?B?cnpRcDZZSlhtdzRQeFQ1SFdrYkJrM2NWSDc5NURFcWp1cUkyM1V4d2c4a0NZ?=
 =?utf-8?B?RHlLNkFkMXNMN0ZrU0l1b3hsQWVvMUpSREpoNnZwNUx2Vks1SmZ4WWt0Sk1q?=
 =?utf-8?B?U3JNMEJEUENuWkxmYklpazdkcC8ycmE5dS9hbjlnYUxWbjBia0lwalFkQVpZ?=
 =?utf-8?B?U0FScWx3dmNMeWtLSlhmZWZsY0ZuRkU3dmpCMzNDMjBIeTN1T0tVN0ZwZCt2?=
 =?utf-8?B?NGFMRWVBZ0VoZWZ4Sm90dG1mQnFTd1c5MGtOTkhjbEVkcUVsVk51V2VBTFQ3?=
 =?utf-8?B?dU9obDZMNXBEOXVwUkFnTXJjc093a2dzQ3NnemR6M3hYMGdsZkJGWlB6am52?=
 =?utf-8?B?azVmeWU0eWdLdk1PK0RvdFdCSTk5SThQUDhvY2pVb0pnVTRpbE9lb2l6N2Jr?=
 =?utf-8?B?NmRhSlp6LytzNHpIWTZWM2lZMXl4TzMwOW1TMnhjV204UGF5TEhDa1hPU2Iv?=
 =?utf-8?B?Q0pXOUIxLytEekMrZ1k0WDZiMDBxbjgxeXdXcGRrQXlwTDNmTGtTTXp0QTJB?=
 =?utf-8?B?aEtUK1M4c1pJTHdFbkFGZ24zTDVyVDBGY2R3TDR3MnBEYzBWS2VJRFdqVi82?=
 =?utf-8?B?UWNxVGltalMyNnlyYzdnd2hKSUpiVVljN2dWVGRMRlhsQlgvVVVUdjVDZ2Z0?=
 =?utf-8?B?WldzK3FYaVRYT0xiUW53blhIRTAvWjlWUHE2dkFsdE8weFpqWm96RFlDYkNa?=
 =?utf-8?B?REx0SUJDdmVEYWQ0QUhzaUpqUVlDaG0xTW94NGIwRllUU29WcGQxYVdWTGNY?=
 =?utf-8?B?Rm5RVUNBRmtrSTBlZnJwTVRpMytod08zSnVNVklMeEJVcS8ycUJNWURrOHJx?=
 =?utf-8?Q?jRZl31ahC1qR1+J9nDdNPUkUN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7918ba-ea11-4f92-61e0-08de31fdef8a
X-MS-Exchange-CrossTenant-AuthSource: CH1PPFDAD84AB72.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:53:05.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PyRm+o+/JhUWXApTpbjj5sgmGVBqPR/nWBVxEhyub0pHbN7W4Ds0aE98ntFGN6bb0OEgf1tFnx710wvU8OJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a device tree flag for the FMC_WDT2 to be disabled.
Also add a device tree for MSX4 that uses the aforementioned flag.
The MSX4 is a granite rapids based reference hardware platform module
for the CX8 SuperNIC Switchboard. It uses the AST2600 BMC SoC for
out of band management.

Patch 1 adds support for the aspeed_spi.c driver to disable the
FMC_WDT2 via a device tree flag, aspeed,watchdog-disable.

Example usage is as such:
```
&fmc {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_fmcquad_default>;
        aspeed,watchdog-disable;
        status = "okay";

};
``` 

Patch 2 adds the devicetree for this board.

Reference architecture for the msx4:
https://developer.nvidia.com/blog/nvidia-connectx-8-supernics-advance-ai-platform-architecture-with-pcie-gen6-connectivity/

There was also some discussion of breaking
out espi_init into a seperate function so it can be reused between
different board files. That will be split out into a seperate,
follow-on patch series, since we're no longer creating a new
board file.

Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
Changes in v2:
- Switched from using a board file to adding support for disabling FMC_WDT2 to aspeed driver
- Added the new device-tree flag to the MSX4 dts
- Dropped board file for the MSX4
- Link to v1: https://lore.kernel.org/r/20251121-msx4-v1-0-fc0118b666c1@nvidia.com

---
Marc Olberding (2):
      drivers: spi: Add support for disabling FMC_WDT2 for aspeed
      arch: arm: dts: Add dts for the nvidia msx4 board

 arch/arm/dts/Makefile                    |   1 +
 arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112 +++++++++++++++++++++++++++++++
 drivers/spi/aspeed_spi.c                 |  19 ++++--
 3 files changed, 128 insertions(+), 4 deletions(-)
---
base-commit: 8e15f5c0b1e7b11296ae6c88b686e65d509237d0
change-id: 20251107-msx4-cad1e2e4fa39

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


